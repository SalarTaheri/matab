<%@tag import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@tag import="com.artonis.core.base.components.ui.kendo.MyFieldTag"%>
<%@tag import="java.util.ArrayList"%>
<%@tag import="java.util.List"%>
<%@tag import="com.artonis.core.base.components.ui.kendo.MyColumnTag"%>
<%@tag import="java.util.ResourceBundle"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="realName" required="true" rtexprvalue="true"%>
<%@ attribute name="transportReadUrl" required="true" rtexprvalue="true"%>
<%@ attribute name="transportRemoveUrl" required="true" rtexprvalue="true"%>
<%@ attribute name="masterIdStr" required="true" rtexprvalue="true"%>
<%@ attribute name="isPopup" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="noDeleteButton" required="false" rtexprvalue="true" type="java.lang.Boolean" %>

<%
    request.setAttribute("fields", new ArrayList<MyFieldTag>());
    request.setAttribute("cols", new ArrayList<MyColumnTag>());

    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String areUShure=resource.getString("action.alert.areYouSure.delete");
    String menuSysCode4Grid =String.valueOf(request.getAttribute("menuSystemCode"));
    String removeUrl = transportRemoveUrl;
    String tabName = name;
%>

<jsp:doBody />

<%
    if(isPopup==null){
        isPopup=false;
    }

    if(noDeleteButton==null){
        noDeleteButton=false;
    }
    List<MyColumnTag> cols = (List<MyColumnTag>) request.getAttribute("cols");
    List<MyFieldTag> fields = (List<MyFieldTag>) request.getAttribute("fields");
    
    boolean insertWithoutPopup = (Boolean) request.getAttribute("insertWithoutPopup");
    
%>

<script type="text/javascript">
    var masterIdStr = "${masterIdStr}";
    var transportReadUrl = "${transportReadUrl}";
</script>


<base:message title='action.operation' jsutDefine="true"/>
<base:message title='action.edit' jsutDefine="true"/>
<base:message title='action.delete' jsutDefine="true"/>
<div class="k-rtl">
	<input type="hidden" name="moreThanAGridInPage" value="yes"/>
    <kendo:grid  name="${name}" sortable="true" height="400"  columnReorder="true" columnResize="true" filterable="true" navigatable="true" >

        <kendo:grid-groupable>
            <kendo:grid-groupable-messages empty='${label_action_groupBy}' />
        </kendo:grid-groupable>

        <kendo:grid-columns>

            <%for(MyColumnTag col : cols) {%>
            	<kendo:grid-column title='<%=col.getTitle() %>' format="{0:#,0}" field="<%=col.getField() %>" width="<%=col.getWidth() %>"/>
            <%} %>

            <kendo:grid-column title='${label_action_operation}' width="100px" >
                <kendo:grid-column-command >
                    <%if(!isPopup && GlobalVariable.getButtonContainer(menuSysCode4Grid,"grid-edit-button")){%>
                        <kendo:grid-column-commandItem className="uk-button uk-button-success" click="_${name}_onEdit" name="edit" text='${label_action_edit}' />
                    <%} %>
                    
                    <%if(!noDeleteButton && GlobalVariable.getButtonContainer(menuSysCode4Grid,"grid-remove-button")){%>
                        <kendo:grid-column-commandItem className="uk-button uk-button-danger" click="_${name}_onDelete" name="delete" text='${label_action_delete}' />
                    <%} %>

                    <%--<kendo:grid-column-commandItem  name="destroy" text='${label_action_delete}' />--%>
                </kendo:grid-column-command>
            </kendo:grid-column>
        </kendo:grid-columns>


        <kendo:dataSource  pageSize="1000" serverPaging="true" serverSorting="true" serverFiltering="true">
            <kendo:dataSource-transport>
                <kendo:dataSource-transport-read  url="${transportReadUrl}"  type="POST"  contentType="application/json"/>
                <kendo:dataSource-transport-destroy  url="<%=removeUrl%>" type="POST"  contentType="application/json"/>
                <kendo:dataSource-transport-parameterMap>
                    function(options){return JSON.stringify(options);}
                </kendo:dataSource-transport-parameterMap>
            </kendo:dataSource-transport>
            <kendo:dataSource-schema  data="data" total="total" groups="data">
                <kendo:dataSource-schema-model id="id">
                    <kendo:dataSource-schema-model-fields>
                        <%for(MyFieldTag field : fields) {%>
                        <kendo:dataSource-schema-model-field name="<%=field.getName() %>" type="<%=field.getType() %>" />
                        <%} %>
                    </kendo:dataSource-schema-model-fields>
                </kendo:dataSource-schema-model>
            </kendo:dataSource-schema>
        </kendo:dataSource>
        <kendo:grid-pageable input="true" numeric="false" />

    </kendo:grid>

</div>

<script>
    function _${name}_onDelete(e){
		var removeUrl = "<%=removeUrl%>";
        var areUShure = "<%=areUShure%>";
        var data = this.dataItem($(e.target).closest("tr"));
        alertify.confirm(areUShure, function (e) {
            if (e) {
                jQuery.ajax ({
                    url: removeUrl,
                    type: "POST",
                    data: JSON.stringify({id: data.id}),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function(result){
                        if(result.state == "success"){
                            $("#<%=tabName%>").data("kendoGrid").dataSource.read();
                            alertify.success(result.message);
                            if(typeof(doAfterRemove_${name}) === "function"){
                                doAfterRemove_${name}();
                            };
                        }else if(result.state == "error"){
                            for(var i=0; i<result.errors.length; i++){
                                alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                            }
                        }else{
                            lertify.error("Something is not good! O_o");
                        }

                    },
                    error:function(result){
                        if(result.status==401){
                            window.location.href="";
                        }
                    }
                });
            }
        });
    }


    function _${name}_onEdit(e){
		var insertWithoutPopup = "<%=insertWithoutPopup%>";
        var tab = e.delegateTarget.id;
        var action = $(this).attr("data-action");
        var data = this.dataItem($(e.target).closest("tr"));
        var itemName = tab.replace("TabInput", "");
        var itemName = "${realName}";
		var modalElem = $("#" + tab + action);
        jQuery.ajax({
            url:getBaseUrl() + "item-edit/" + "${realName}" + "/" + data.id,
            success:function(data){
                $("#item-modals-edit-${name}").empty();
                $("#item-modals-edit-${name}").append('<div id="' + tab + action + '" class="uk-modal">');

                $("#" + tab + action).append(data);
                openPopup_inEdit_${name}(tab + action, tab, insertWithoutPopup);
            },
            error:function(result){
                if(result.status==401){
                    window.location.href="";
                }
            },
            async :false
        });
        $.getJSON(getBaseUrl() + "item-load/" + tab + "/" + data.id, function (data) {
            $('.uk-form2-${realName}').deserialize(data);
            document.getElementById(itemName + '_id').value = data.id;
			setNumericTextValue();
            $(".uk-form2-${realName}")[1].remove();
            afterBind();
        });		
    }
    
	function addCommaSeparator(nStr){
		nStr += '';
		x = nStr.split('.');
		x1 = x[0];
		x2 = x.length > 1 ? '.' + x[1] : '';
		var rgx = /(\d+)(\d{3})/;
		while (rgx.test(x1)) {
			x1 = x1.replace(rgx, '$1' + ',' + '$2');
		}
		return x1 + x2; 
	}

	function setNumericTextValue(){
	    var numericObj = $("input[data-numericEx='true']");
	    for (var i=0 ; i < numericObj.length ; i++){
	    	var fieldName = numericObj[i].id.replace('_txt','');
	    	var fieldName_txt = numericObj[i].id;
	    	$("#"+fieldName_txt).val(addCommaSeparator($("#"+fieldName).val()));
	    }
	}

    function openPopup_inEdit_${name}(id, tab, insertWithoutPopup){
        if(document.getElementById("id").value!=''){
            document.getElementById("loadedId").value=document.getElementById("id").value;
        }
    	if(insertWithoutPopup != 'true'){
	        var modal = new $.UIkit.modal.Modal("#" + id);
	        $("#" + id).on(
	                {
	                    'uk.modal.hide': function(){
	                        $("#item-modals-edit-${name}").empty();
	                    }
	                }
	        );
	
	        $('button[data-action="save"]', $("#" + id)).unbind("click").click(function(){
	            var form = $("form", $("#" + id)),
	                    tmp = {},
	                    itemName = tab.replace("TabInput", "")
	                    ;
	            $("input[role='combobox']").attr("disabled", "disabled");
	            $("input[data-ignore='true']").attr("disabled", "disabled");
	            $(form.serializeArray()).each(function(){
	                tmp[this.name] = this.value;
	            });
	            $("input[role='combobox']").removeAttr("disabled");
	            $("input[data-ignore='true']").removeAttr("disabled");
	            tmp[masterIdStr]=document.getElementById("loadedId").value;
	            jQuery.ajax ({
	                url: basePath + "save/" + itemName,
	                type: "POST",
	                data: JSON.stringify(tmp),
	                dataType: "json",
	                contentType: "application/json; charset=utf-8",
	                success: function(result){
	                    if(result.state == "error"){
	                        for(var i=0; i<result.errors.length; i++){
	                            alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
	                        }
	                    }
	                    if(result.state == "success"){
	                        alertify.success(result.message);
	                        $("#" + itemName).data("kendoGrid").dataSource.read();
	                        modal.hide();
	                    }
	                }
	            });
	        });
	        modal.show();
    	}

    }

    function afterBind(){
        var arra=Object.keys(window);
        for (var i = 0; i < arra.length; i++){
            if (typeof(window[arra[i]]) === "function" && arra[i].indexOf('bindToEntityById_after')>-1){
                window[arra[i]]();
                if(typeof(window[arra[i]+"_doAfterBind"]) === "function"){
                	window[arra[i]+"_doAfterBind"]();
                }
            }
        }
    }

</script>
<div id="item-modals-edit-${name}" >

</div>

        