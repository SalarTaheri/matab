<%@tag import="java.util.ResourceBundle"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>

<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="key" required="true" rtexprvalue="true"%>
<%@ attribute name="loadOnDemand" required="true" rtexprvalue="true"%>
<%@ attribute name="dataLoaderController" required="true" rtexprvalue="true"%>
<%@ attribute name="disabled" required="false" rtexprvalue="true"%>
<%@ attribute name="direction" required="false" rtexprvalue="true"%>
<%@ attribute name="styleClass" required="false" rtexprvalue="true"%>
<%@ attribute name="outputResultTag" required="true" rtexprvalue="true"%>
<%@ attribute name="previousResultTag" required="true" rtexprvalue="true"%>
<%@ attribute name="filterChkBox" required="false" rtexprvalue="true"%>


<%
	boolean isLoadOnDemand=Boolean.valueOf(loadOnDemand);
	if(direction==null || direction.equals(""))
		direction="direction:rtl";
	else
		direction="direction:ltr";
		
	if(styleClass==null ||styleClass.length()==0||styleClass.equals("normal"))
		styleClass="uk-width-4-10";
	else if(styleClass.equals("small"))
		styleClass="uk-width-2-10";
	else if(styleClass.equals("larg"))
		styleClass="uk-width-6-10";
 %>
<jsp:doBody />

	<div class="container uk-width-6-10">
        <div class="treeview-back k-rtl" >

            <div id="${name}"></div>
        </div>
    </div>
    <script>
    	$(document).ready(function() {
     $("#${name}").kendoTreeView({
    		loadOnDemand: <%=isLoadOnDemand%>,
            autoBind:true,
            checkboxes: {
                checkChildren: true,
                template: "<input type='checkbox' id='#= item.id #' value='true' />"
            },

            dataSource: {
                        transport: {
                        	parameterMap: function (options) {
				                    return JSON.stringify(options);
				                },
                            read: {
                            	contentType: "application/json",
                            	type: "POST",
                                url: getBaseUrl() + "${dataLoaderController}",
                                dataType: "json"
                            }
                        },
                        schema: {
                            model: {
                                id: "modelID",
                                hasChildren: "hasChild",
                                checked: "checked"
                            }
                        }
                    },
            dataTextField: "modelCaption",
        	checkboxes: true,
        	select: onSelect
        });

		function onSelect(e) {
        	var data = $("#${name}").data('kendoTreeView').dataItem(e.node);
			/*console.log(data.id);
        	console.log("${filterChkBox}");*/
            if(typeof(checkBoxBtnTriggerAftertreeClick) === "function"){
            	checkBoxBtnTriggerAftertreeClick(data.id);
            }
            if(typeof(checkBoxGridColsBtnTriggerAfterTreeClick) === "function"){
                checkBoxGridColsBtnTriggerAfterTreeClick(data.id);
            }
    	}
        
        // function that gathers IDs of checked nodes
        function checkedNodeIds(nodes, checkedNodes) {
            for (var i = 0; i < nodes.length; i++) {
                if (nodes[i].checked) {
                    checkedNodes.push(nodes[i].id);
                }

                if (nodes[i].hasChildren) {
                    checkedNodeIds(nodes[i].children.view(), checkedNodes);
                }
            }
        }

        function split(e){
            console.log('split');
            if($("#${previousResultTag}").val().length>0){
               var splitArray=  $("#${previousResultTag}").val().split(',');
               for(var i= 0;i<splitArray.length;i++){
                    for(var j=0; j<e.items.length;j++){
                          if(splitArray[j]== e.items[j].id){
                              $("#" + e.items[j].id).prop('checked', true);
                          }
                    }
               }
            }
        }

        $("#${name}").data("kendoTreeView").dataSource.bind("error", function(e){
            errorRequestAjax(e);
        });

        // show checked node IDs on datasource change
        $("#${name}").data("kendoTreeView").dataSource.bind("change", function(e) {
//            console.log('change '+ e);
//            split(e);
			//console.log(e.node.modelID);
            var checkedNodes = [],
                treeView = $("#${name}").data("kendoTreeView"),
                message;


            checkedNodeIds(treeView.dataSource.view(), checkedNodes);

            if (checkedNodes.length > 0) {
                message = checkedNodes.join(",");
            } else {
                message = "";
            }

            $("#${outputResultTag}").html(message);
            document.getElementById("${outputResultTag}").value=message;
        });
    });
    
    </script>			
<style scoped>
        #treeview .k-sprite {
            background-image: url("../../content/web/treeview/coloricons-sprite.png");
        }

        .rootfolder { background-position: 0 0; }
        .folder     { background-position: 0 -16px; }
        .pdf        { background-position: 0 -32px; }
        .html       { background-position: 0 -48px; }
        .image      { background-position: 0 -64px; }

        .treeview-back
        {
            float: right;
            margin: 0 0 2em;
            padding: 20px;
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,0.45), inset 0 0 30px rgba(0,0,0,0.07);
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,0.45), inset 0 0 30px rgba(0,0,0,0.07);
            box-shadow: 0 1px 2px rgba(0,0,0,0.45), inner 0 0 30px rgba(0,0,0,0.07);
            -webkit-border-radius: 8px;
            -moz-border-radius: 8px;
            border-radius: 8px;
        }

        .container
        {
            margin: 0 30px;
            float: right;
            width: 220px;
        }

        #result
        {
            float: right;
            padding: 10px;
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,0.45), inset 0 0 30px rgba(0,0,0,0.07);
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,0.45), inset 0 0 30px rgba(0,0,0,0.07);
            box-shadow: 0 1px 2px rgba(0,0,0,0.45), inner 0 0 30px rgba(0,0,0,0.07);
            -webkit-border-radius: 8px;
            -moz-border-radius: 8px;
            border-radius: 8px;
        }
    </style>