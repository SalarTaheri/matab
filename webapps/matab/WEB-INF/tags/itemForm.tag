<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@tag import="java.util.Map"%>
<%@tag import="java.util.HashMap"%>
<%@tag import="java.util.ResourceBundle"%>
<%@tag import="org.springframework.web.util.UrlPathHelper"%>
<%@tag import="java.util.List" %>
<%@tag import="java.util.ArrayList" %>
<%@attribute name="formItemTabInputs" required="true" rtexprvalue="true"%>
<%@attribute name="formItemTabViewJspFiles" required="true" rtexprvalue="true"%>
<%@attribute name="titleKeys" required="true" rtexprvalue="true"%>
<%@attribute name="masterIdStr" required="true" rtexprvalue="true"%>
<%@attribute name="isPopup" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@attribute name="popupUrl" required="false" rtexprvalue="true"  %>
<%@attribute name="insertWithoutPopup" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@attribute name="detailShouldSave" required="false" rtexprvalue="true" type="java.lang.Boolean" %>

<script src="<c:url value='/resources/js/blockUI/blockUI.js' />"></script>

<%
    if(isPopup==null){
        isPopup=false;
    }
	if(insertWithoutPopup==null){
		request.setAttribute("insertWithoutPopup",false);
		insertWithoutPopup=false;
	}else{
		request.setAttribute("insertWithoutPopup",true);
	}
    String basePathItemForm = new UrlPathHelper().getOriginatingRequestUri(request).replace("create", "");
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    int pos = basePathItemForm.indexOf("/edit/");
    if(pos < 0){
    	pos = basePathItemForm.length();
    }
        
    
    String[] formItemTabInputArray = formItemTabInputs.split(",");

    String[] formItemTabViewJspFileArray = formItemTabViewJspFiles.split(",");
    String[] titleKeyArray = titleKeys.split(",");
    
    Map<String, String> tabKeyMap = new HashMap<String, String>();
    int count = 0;
    for(String tabInput: formItemTabInputArray){
    	tabKeyMap.put(titleKeyArray[count++].toString(), tabInput.replace("TabInput", "").toString());
    }

    if(detailShouldSave==null){
        detailShouldSave=false;
    }
    String basePath = (String) request.getAttribute("basePath");
    
   //boolean showItems = false;
   //if(new UrlPathHelper().getOriginatingRequestUri(request).indexOf("/edit/") > 0)
   // 	showItems = true;
%>
<script type="text/javascript">
    var basePathItemForm = "<%=basePathItemForm.substring(0, pos)%>/";
    var path= "<%=basePath%>/";
    var masterIdStr = "${masterIdStr}";
    var isPopup = "<%=isPopup%>";
    var detailShouldSave = "<%=detailShouldSave%>";
    var popupUrl = "${popupUrl}";
</script>
<jsp:doBody />
<%--
<%for(MyColumnTag col : cols) {%>
<kendo:grid-column title='<%=col.getTitle() %>'  field="<%=col.getField() %>" width="<%=col.getWidth() %>"/>
<%} %>
--%>
	<div class="" style="margin-top: 2px;" id="tabs">
		<ul class="uk-tab" data-uk-tab data-uk-switcher="{connect:'#pattern2-tabs'}" >
            <%int i=0 ;%>
            <%for (String titleKey: titleKeyArray){%>
               <%if(i==0){%>
                     <li data-tab-name="<%=tabKeyMap.get(titleKey)%>" class="uk-active"><a href=""><%=resource.getString(titleKey)%></a></li>
                <%}else{%>
                     <li data-tab-name="<%=tabKeyMap.get(titleKey)%>"><a href=""><%=resource.getString(titleKey)%></a></li>
                <%}i++;%>
            <%}%>
			<%--<li class="uk-active"><a href=""><%=resource.getString(titleKey)%></a></li>--%>
			<%--<li><a href=""><%=resource.getString(titleKey)%></a></li>--%>
		</ul>
		<ul id="pattern2-tabs" class="uk-switcher" style="background-color: rgb(191,206,214); border: 1px; border-color: black; border-style: dotted; display: block">
            <%int j=0;%>
            <%for (String formItemTabInput: formItemTabInputArray){%>
			<li data-tab-name="<%=formItemTabInput.replace("TabInput", "").toString()%>" data-tab-body-name="<%=formItemTabInput.replace("TabInput", "").toString()%>_body">
				<div class="uk-containerX">
					<%if(insertWithoutPopup!=true){ %>
						<div class="body-header" style="padding-top: 10px;">
							<button class="uk-button uk-button-success"
								data-action="Create" data-popup="true" data-tab="<%=formItemTabInput%>"  type="button">
								<%=resource.getString("global.crud.new")%>
							</button>
						</div>
					<%}else{ 
						String inputFileName = formItemTabInput.toString() + ".jsp" ;
					%>
						<div style="padding: 15px;" class="item-input-background">
							<input  type="hidden" id="<%=formItemTabInput.replace("TabInput", "").toString()%>_id" name="<%=formItemTabInput.replace("TabInput", "").toString()%>_id" >
							<jsp:include page="<%=inputFileName%>" />
							<div align="center" style="padding-top: 10px" id="<%=formItemTabInput.replace("TabInput", "").toString()%>_saveAndResetBtnDiv">
								<button class="uk-button uk-button-success" data-action="Create" data-save="saveItem" id="saveItem" data-tab="<%=formItemTabInput%>" type="button" >
						                <%=ResourceBoundleHolder.resourceBundle.getString("global.crud.save")%>
								</button>
                                <button class="uk-button uk-button-success"  id="resetItem"  type="button" data-reset="resetItem" data-tab="<%=formItemTabInput%>">
						                <%=ResourceBoundleHolder.resourceBundle.getString("global.crud.new")%>
								</button>
							</div>
						</div>
					<%} %>
					<%--<jsp:include page="${formItemTabViewJspFile}.jsp"></jsp:include>--%>
					<div style="padding: 15px;">
						<jsp:include page="<%=formItemTabViewJspFileArray[j]%>" />
					</div>
				</div>
			</li>
            <%j++;}%>
            <%--<li>
				<div class="uk-containerX">
					<div class="body-header" style="padding-top: 10px;">
						<button class="uk-button uk-button-success"
							data-action="Create" data-popup="true" data-tab="FactorItem2TabInput"  type="button">
							<%=resource.getString("global.crud.new")%>
						</button>
					</div>
					<jsp:include page="/WEB-INF/pages/inventory/m169/Factor/FactorItem2TabView.jsp"></jsp:include>
				</div>
			</li>--%>
		</ul>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			checkShowHideTabs();
		 });

		$(function(){
			$("button[data-popup='true']").click(function(){
				var tab = $(this).attr("data-tab"),
					action = $(this).attr("data-action"),
					modalElem = $("#" + tab + action)
					;

				if(modalElem.length > 0){
					openPopup(tab + action, tab);
                    afterBind();
				}else{
                    if(isPopup=='true'){
                        $.get(popupUrl, function (data) {
                            $("#item-modals-${name}").empty();
                            $("#item-modals-${name}").append('<div id="' + tab + action + '" class="uk-modal">');
                            $("#" + tab + action).append(data);
                            openPopup(tab + action, tab);

                        });
                    }else{
                        $.get(basePathItemForm + "item/" + tab, function (data) {
                            $("#item-modals-${name}").empty();
                            $("#item-modals-${name}").append('<div id="' + tab + action + '" class="uk-modal">');
                            $("#" + tab + action).append(data);
                            openPopup(tab + action, tab);
                            afterBind();
                        });
                    }
                }
			});
            $("button[data-reset='resetItem']").click(function(){

                var tab = $(this).attr("data-tab");
                var itemName = tab.replace("TabInput", "");
                var form = $("form.uk-form2-" + itemName);
                $(".uk-form2-" + itemName)[0].reset();
                form.find(":input").val('');
                $("#"+itemName+"_id").val('');
				var funcNameAfterNew=itemName+'_onNew_callback';
				if(typeof(window[funcNameAfterNew])=== "function"){
					window[funcNameAfterNew]();
				}
            });

			$("button[data-save='saveItem']").click(function(){
	                if(document.getElementById("id").value!=''){
	                    document.getElementById("loadedId").value=document.getElementById("id").value;
	                }
					var tab = $(this).attr("data-tab");
					var action = $(this).attr("data-action");
					var id = tab + action;
					var	tmp = {};
					var itemName = tab.replace("TabInput", "");
					var form = $("form.uk-form2-" + itemName);
                    var dataIgnoreDisabled=[];
                    var i=0;
                    $("input[data-ignore='true']").each(function(){
                        if(this.disabled==true){
                            dataIgnoreDisabled[i]=this;
                            i++;
                        }
                    });

					$("input[role='combobox']").attr("disabled", "disabled");
                    $("input[data-ignore='true']").attr("disabled", "disabled");
                    $("input[data-role='timepicker']").removeAttr("disabled");
                    checkBoxUncheck=jQuery('.uk-form2-'+itemName+' input[type=checkbox]:not(:checked)').map(
                        function() {
                            if(this.name!=""){
                                return {"name": this.name, "value": false}
                            }
                        }).get();
					$(form.serializeArray()).each(function(){
                        if($("input[name='"+this.name+"']").attr('type')=='checkbox'){
                            if($("input[name='"+this.name+"']")[0].checked){
                                tmp[this.name]='true';
                            }else{
                                tmp[this.name]='false';
                            }
                        }else{
                            tmp[this.name] = this.value;
                        }
					});
                    for(var i=0;i<checkBoxUncheck.length;i++){
                        tmp[checkBoxUncheck[i].name]=checkBoxUncheck[i].value;
                    }
					$("input[role='combobox']").removeAttr("disabled");
                    $("input[data-ignore='true']").removeAttr("disabled");
                    for(var j=0;j<dataIgnoreDisabled.length;j++){
                        dataIgnoreDisabled[j].disabled=true;
                    }

					tmp[masterIdStr]=document.getElementById("loadedId").value;
					tmp['id']=document.getElementById(itemName + '_id').value;

                    if(typeof(callback_after_serialize) == "function"){
                        tmp=callback_after_serialize(tmp);
                    }
                    if(typeof(window["callback_validation_before_save_"+itemName])=== "function"){
                        validationState=window["callback_validation_before_save_"+itemName](tmp);
                        if(validationState==false){
                          return;
                        }
                    }
                    if(typeof(window["customSave_"+itemName])=== "function"){
                        window["customSave_"+itemName](tmp);
                        return;
                    }
			    	jQuery.ajax ({
					    url: basePathItemForm + "save/" + itemName,
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
				        		var gridName = itemName;
				        		var moreThanAGridInPage = document.getElementsByName("moreThanAGridInPage")[0];
				        		if(moreThanAGridInPage!=undefined && moreThanAGridInPage.value=="yes"){
				        			var gridNameTmp = getActiveGridName();//this method must be implement when use 'my-grid-item4moreThanAGridInPage' tag.
				        			if(gridNameTmp.length>0){
				        				gridName = gridNameTmp;
				        			}
				        		}
				        		var urlGrid=$("#" + gridName).data("kendoGrid").dataSource.transport.options.read.url;
                                var indexnumber=urlGrid.valueOf().lastIndexOf("/");
                                var subUrlGrid=urlGrid.valueOf().substring(0,indexnumber);
                                urlGrid=subUrlGrid.valueOf()+"/"+loadedId.value;
                                $("#" + gridName).data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
				        		$("#" + gridName).data("kendoGrid").dataSource.read();
								$(".uk-form2-" + itemName)[0].reset();
                                form.find(":input").val('');
                                $("#"+itemName+"_id").val('');
                                var inputElementArray=form.find(":input");
                                for(var index=0;index<inputElementArray.length;index++){
                                    var id=inputElementArray[index].id;
                                    if($("#"+id).data("kendoComboBox")!=undefined){
                                        $("#"+id).data("kendoComboBox").dataSource.filter([]);
                                    }
                                }
                                if(typeof(window["doAfterSave_"+itemName])=== "function"){
                                    window["doAfterSave_"+itemName](result);
                                }

					        }
					    }
					});
				});

			function openPopup(id, tab){
                if(document.getElementById("id").value!=''){
                    document.getElementById("loadedId").value=document.getElementById("id").value;
                }
				var modal = new $.UIkit.modal.Modal("#" + id);
                $("#" + id).on(
                        {
                            'uk.modal.hide': function(){
                                $("#item-modals-${name}").empty();
                                if(isPopup){
                                    var itemName = tab.replace("TabInput", "")
                                    var urlGrid=$("#" + itemName).data("kendoGrid").dataSource.transport.options.read.url;
                                    var indexnumber=urlGrid.valueOf().lastIndexOf("/");
                                    var subUrlGrid=urlGrid.valueOf().substring(0,indexnumber);
//                                    urlGrid=subUrlGrid.valueOf()+"/"+document.getElementById("id").value;
                                    urlGrid=subUrlGrid.valueOf()+"/"+document.getElementById("loadedId").value;
                                    $("#"   + itemName).data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
                                    $("#" + itemName).data("kendoGrid").dataSource.read();
                                    afterHidePopup();
                                }
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

                    if(typeof(callback_after_serialize) == "function"){
                        tmp=callback_after_serialize(tmp);
                    }
			    	jQuery.ajax ({
					    url: basePathItemForm + "save/" + itemName,
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
				        		var urlGrid=$("#" + itemName).data("kendoGrid").dataSource.transport.options.read.url;
                                var indexnumber=urlGrid.valueOf().lastIndexOf("/");
                                var subUrlGrid=urlGrid.valueOf().substring(0,indexnumber);
                                urlGrid=subUrlGrid.valueOf()+"/"+loadedId.value;
                                $("#" + itemName).data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
				        		$("#" + itemName).data("kendoGrid").dataSource.read();
					        	modal.hide();
					        }
					    }
					});
				});
				modal.show();
			}

            function afterBind(){
                var arra=Object.keys(window);
                for (var i = 0; i < arra.length; i++){
                    if (typeof(window[arra[i]]) === "function" && arra[i].indexOf('bindToEntityById_after')>-1){
                        window[arra[i]]();
                    }
                }
            }
		});
		
function checkShowHideTabs(){
	var loadedId = document.getElementById("loadedId").value;
	var id = document.getElementById("id").value;
	if((id!=null && id.length>0) || (loadedId!=null && loadedId.length>0)){
		document.getElementById("tabs").style.removeProperty("display");
	}else{
		document.getElementById("tabs").style.display = "none";	
	}
}

function hideTab(tabName){
	$("li[data-tab-name='"+tabName+"']").hide();
	$("ul.uk-tab li").removeClass('uk-active');
	$("ul.uk-tab li:not(:hidden)").eq(0).addClass('uk-active');
	$("ul.uk-tab li.uk-active").click();
}

function showTab(tabName){
	$("li[data-tab-name='"+tabName+"']").show();
	$("ul.uk-tab li").removeClass('uk-active');
	$("li[data-tab-name='"+tabName+"']").click();
}

function lockTab(tabName){
	$("li[data-tab-body-name='"+tabName+"_body']").block({ message: null });
}

function unlockTab(tabName){
	$("li[data-tab-body-name='"+tabName+"_body']").unblock();
}
function hasDetailShouldSave(){
    if(path.indexOf('edit')>-1){
        return false;
    }
    return detailShouldSave;
}

function resetTabs() {
	var tabLength = $("#pattern2-tabs")[0].children.length;
	for (var i = 0; i < tabLength; i++) {
		var itemName = $("#pattern2-tabs")[0].children[i].attributes[0].nodeValue;
		var form = $("form.uk-form2-" + itemName);
		$(".uk-form2-" + itemName)[0].reset();
		form.find(":input").val('');
		$("#" + itemName + "_id").val('');

		var urlGrid=$("#" + itemName).data("kendoGrid").dataSource.transport.options.read.url;
		var indexnumber=urlGrid.valueOf().lastIndexOf("/");
		var subUrlGrid=urlGrid.valueOf().substring(0,indexnumber);
		urlGrid=subUrlGrid.valueOf()+"/"+-1;
		$("#" + itemName).data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
		$("#" + itemName).data("kendoGrid").dataSource.read();
	}
}

	</script>
	<div id="item-modals-${name}" >

	</div>
	
<style>
.item-input-background{
	border-bottom: 1px solid #cacaca;
	background: rgb(206,218,224); /* Old browsers */
	background: -moz-linear-gradient(top, rgba(206,218,224,1) 0%, rgba(227,234,237,1) 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(206,218,224,1)), color-stop(100%,rgba(227,234,237,1))); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, rgba(206,218,224,1) 0%,rgba(227,234,237,1) 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, rgba(206,218,224,1) 0%,rgba(227,234,237,1) 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, rgba(206,218,224,1) 0%,rgba(227,234,237,1) 100%); /* IE10+ */
	background: linear-gradient(to bottom, rgba(206,218,224,1) 0%,rgba(227,234,237,1) 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cedae0', endColorstr='#e3eaed',GradientType=0 ); /* IE6-9 */
	box-shadow: 0 1px 0 rgba(255, 255, 255, 0.4), 0 0 9px rgba(0, 0, 0, 0.1); 
}
.uk-tab > li > a {
text-shadow: none;
/* font-size: 20px; */
/* text-shadow: 0 1px 0 #ffffff; */
}
</style>
<script type="text/javascript">
function callResetAfterSaveMaster(){
	return false;
}
</script>
