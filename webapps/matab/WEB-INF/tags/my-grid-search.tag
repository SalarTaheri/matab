<%@tag import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@tag import="com.artonis.core.base.components.ui.kendo.MyFieldTag"%>
<%@tag import="java.util.ArrayList"%>
<%@tag import="java.util.List"%>
<%@tag import="com.artonis.core.base.components.ui.kendo.MyColumnTag"%>
<%@tag import="java.util.ResourceBundle"%>
<%@tag import="com.artonis.core.base.components.ui.kendo.MyFunctionTag" %>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@tag import="org.springframework.web.util.UrlPathHelper"%>
<%@tag import="com.artonis.core.base.components.ui.kendo.SearchOperationTag"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="kedo" uri="http://www.kendoui.com/jsp/tags" %>

<%@ attribute name="updateUrl" required="false" rtexprvalue="true"%>
<%@ attribute name="defaultReadUrl" required="false" rtexprvalue="true"%>
<%@ attribute name="defaultReadUrlIsRelative" required="false" rtexprvalue="true"  type="java.lang.Boolean"%>
<%@ attribute name="destroyUrl" required="false" rtexprvalue="true"%>
<%@ attribute name="inlineEditing" required="false" rtexprvalue="true"%>
<%@ attribute name="editLabel" required="false" rtexprvalue="true"%>
<%@ attribute name="isPopup" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="noDeleteButton" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="showOperation" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="showMultipleDelete" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="onSelectRow" required="false" rtexprvalue="true" %>
<%@ attribute name="showCheckboxSelector" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="isAccordionable" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="scrollable" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="refreshButton" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="operationColumnwidth" required="false" rtexprvalue="true"  %>
<%@ attribute name="selectable" required="false" rtexprvalue="true"%>
<%@ attribute name="onDoubleSelectRowEvent" required="false" rtexprvalue="true" %>
<%@ attribute name="searchGridName" required="false" rtexprvalue="true" %>

<%@ attribute name="printButtonIds" required="false" rtexprvalue="true" %>
<%@ attribute name="printButtonNames" required="false" rtexprvalue="true" %>
<%@ attribute name="printButtonResoureceBundle" required="false" rtexprvalue="true" %>
<%--<%@ attribute name="keyConfirmCheck" required="false" rtexprvalue="true" %>--%>

<%
	request.setAttribute("fields", new ArrayList<MyFieldTag>());
	request.setAttribute("cols", new ArrayList<MyColumnTag>());
	request.setAttribute("functions", new ArrayList<MyFunctionTag>());
	request.setAttribute("operations", new ArrayList<SearchOperationTag>());

    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String areUShure=resource.getString("action.alert.areYouSure.delete");
    String menuSysCode4Grid =String.valueOf(request.getAttribute("menuSystemCode"));
    String menuSysCode =String.valueOf(request.getAttribute("menuSystemCode"));
    if(isAccordionable==null){
        isAccordionable=false;
    }
    if(scrollable==null){
        scrollable=true;
    }
	if(operationColumnwidth==null){
		operationColumnwidth="70px";
	}
    if(selectable==null){
        selectable="multiple";
    }

	if(searchGridName==null){
		searchGridName="searchGrid";
	}
	String searchGridOnDataBound="_"+searchGridName+"_onDataBound";
	String searchGridOnSelectRow="_"+searchGridName+"_onSelectRow";
	String searchGridOnEdit="_"+searchGridName+"_onEdit";
	String searchGridOnDelete="_"+searchGridName+"_onDelete";
	String searchGridRequestEnd="_"+searchGridName+"_requestEnd";
	String searchGridRequestStart="_"+searchGridName+"_requestStart";

 %>
 
<script type="text/javascript">
function _anchorHandleClick(img,dialogconfirmName){
	$("#"+dialogconfirmName.id).data('contents',img).dialog("open");

//	var entityGrid = $("#searchGrid").data("kendoGrid");
//	var rows = entityGrid.select();
//	var rowEntity = [rows.length];
//	rows.each(function(index, row) {
//	  var selectedItem = entityGrid.dataItem(row);
//	  rowEntity[index] = selectedItem;
//	});
//	var destinationUrl = img.getAttribute('data-destination-address');
//	var baseUrlPath = getBaseUrl();
//	destinationUrl = baseUrlPath + '/' + destinationUrl + '/' + rowEntity[0].id;
//	$.getJSON(destinationUrl, function(result){
//        if(result.state == "success"){
//        	$("#searchGrid").data("kendoGrid").dataSource.read();
//       		alertify.success(result.message);
//        }else if(result.state == "error"){
//        	for(var i=0; i<result.errors.length; i++){
//        		alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
//        	}
//        }else{
//        	lertify.error("Something is not good! O_o");
//        }
//	});
}
function confirmYes(e){
    var img=e.data('contents');
    var entityGrid = $("#<%=searchGridName%>").data("kendoGrid");
    var rows = entityGrid.select();
    var rowEntity = [rows.length];
    rows.each(function(index, row) {
        var selectedItem = entityGrid.dataItem(row);
        rowEntity[index] = selectedItem;
    });
    var destinationUrl = img.getAttribute('data-destination-address');
    var baseUrlPath = getBaseUrl();
    destinationUrl = baseUrlPath + '/' + destinationUrl + '/' + rowEntity[0].id;
    $.getJSON(destinationUrl, function(result){
        if(result.state == "success"){
            $("#<%=searchGridName%>").data("kendoGrid").dataSource.read();
            alertify.success(result.message);
        }else if(result.state == "error"){
            for(var i=0; i<result.errors.length; i++){
                alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
            }
        }else{
            lertify.error("Something is not good! O_o");
        }
    });
}
function mouseOver(img){
	img.className = 'mouseOverCursor';
}
function mouseOut(img){
	img.removeAttribute('mouseOverCursor');
}
//////////////////////////////////////////////////////

var checkedIds = {};

function selectRow() {
	var checked = this.checked,
		row = $(this).closest("tr"),
		grid = $("#<%=searchGridName%>").data("kendoGrid"),
		dataItem = grid.dataItem(row);

	checkedIds[dataItem.id] = checked;
	if (checked) {
		row.addClass("k-state-selected");
	} else {
		row.removeClass("k-state-selected");
	}
}
function selectAllRow(){
	var checked = $('#headerCheckboxId')[0].checked;
	var view = $('#<%=searchGridName%>').data("kendoGrid").dataSource.view();
	if (checked) {
		for(var i = 0; i < view.length;i++){
			$('#<%=searchGridName%>').data("kendoGrid").tbody.find("tr[data-uid='" + view[i].uid + "']")
				.addClass("k-state-selected").find(".gridCheckbox").prop("checked","true");
		}
	} else {
		for(var i = 0; i < view.length;i++){
			$('#<%=searchGridName%>').data("kendoGrid").tbody.find("tr[data-uid='" + view[i].uid + "']")
				.removeClass("k-state-selected").find(".gridCheckbox").prop("checked","");
		}
	}
	for(var i = 0; i < view.length;i++){
		checkedIds[$('#<%=searchGridName%>').data("kendoGrid").dataSource._data[i].id] = checked;
	}
}
function _<%=searchGridName%>_onDataBound(e) {
	var view = this.dataSource.view();
	for(var i = 0; i < view.length;i++){
		if(checkedIds[view[i].id]){
			this.tbody.find("tr[data-uid='" + view[i].uid + "']")
				.addClass("k-state-selected")
				.find(".gridCheckbox")
				.attr("checked","checked");
		}
	}

    var rows = this.items();
    var pageNumber = this.dataSource.page();
    var preNumber = 0;
    if(pageNumber>1){
    	preNumber = (pageNumber-1) * this.dataSource.pageSize();
    }
    $(rows).each(function () {
        var index = preNumber + $(this).index() + 1;
        var rowLabel = $(this).find(".grid-row-number");
        $(rowLabel).html(index);
    });

    if(typeof(<%=searchGridName%>_onDataBound_callback) == "function"){
		<%=searchGridName%>_onDataBound_callback(e);
    }
}
//////////////////////////////////////////////////////

	function _<%=searchGridName%>_onEdit(e){
        if(typeof(<%=searchGridName%>_before_edit_callback) == "function"){
            var returnValue=<%=searchGridName%>_before_edit_callback(this.dataItem($(e.target).closest("tr")));
            if(returnValue=="false"){
                return;
            }
        }
	  	var data = this.dataItem($(e.target).closest("tr"));
	    window.location = basePath + "edit/" + data.id;
	}
	function _<%=searchGridName%>_requestEnd(e){
	    if(typeof(<%=searchGridName%>_requestEnd_callback) == "function"){
			<%=searchGridName%>_requestEnd_callback(e);
	    }
	}
	function _<%=searchGridName%>_requestStart(e){
	    if(typeof(<%=searchGridName%>_requestStart_callback) == "function"){
			<%=searchGridName%>_requestStart_callback(e);
	    }
	}
	function _<%=searchGridName%>_onSelectRow(e){
		var onSelectRowEvent="<%=onSelectRow%>";
		if(onSelectRowEvent!="null" ){
		    window[onSelectRowEvent](e);
		}
	}
   	        function _<%=searchGridName%>_onDelete(e){
                if(typeof(<%=searchGridName%>_before_delete_callback) == "function"){
                       var returnValue=<%=searchGridName%>_before_delete_callback(this.dataItem($(e.target).closest("tr")));
                       if(returnValue=="false"){
                           return;
                       }
                }
                var areUShure = "<%=areUShure%>";
	          	var data = this.dataItem($(e.target).closest("tr"));
	            alertify.confirm(areUShure, function (e) {
				    if (e) {
				        jQuery.ajax ({
						    url: basePath + "remove",
						    type: "POST",
						    data: JSON.stringify({id: data.id}),
						    dataType: "json",
						    contentType: "application/json; charset=utf-8",
						    success: function(result){
						        if(result.state == "success"){
						        	$("#<%=searchGridName%>").data("kendoGrid").dataSource.read();
					        		alertify.success(result.message);
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
//////////////////////////////
$("#<%=searchGridName%>").on("dblclick", "tr.k-state-selected", function () {
    var onSelectRowEvent="<%=onDoubleSelectRowEvent%>";
    if(onSelectRowEvent!="null" ){
        var selectedDataItems = [];
        var dataItem = $("#<%=searchGridName%>").data("kendoGrid").dataItem(this);
        selectedDataItems.push(dataItem);
        window[onSelectRowEvent](selectedDataItems);
    }
});
//////////////////////////////
</script>

<jsp:doBody />

<%
	if(searchGridName==null){
		searchGridName="searchGrid";
	}
    if(isPopup==null){
        isPopup=false;
    }
    if(noDeleteButton==null){
        noDeleteButton=false;
    }
    if(showOperation==null){
    	showOperation=true;
    }
     if(showMultipleDelete==null){
    	showMultipleDelete=true;
    }

    List<MyColumnTag> cols = (List<MyColumnTag>) request.getAttribute("cols");
	List<MyFieldTag> fields = (List<MyFieldTag>) request.getAttribute("fields");
	List<MyFunctionTag> functions = (List<MyFunctionTag>) request.getAttribute("functions");
	List<SearchOperationTag> operations = (List<SearchOperationTag>) request.getAttribute("operations");
	inlineEditing=(inlineEditing==null||inlineEditing.length()==0)?"false":"true";

	String gridUrl = new UrlPathHelper().getOriginatingRequestUri(request);
	String LoadId = "";
	if (gridUrl.indexOf("/create") > -1) {
		gridUrl = gridUrl.substring(0, gridUrl.indexOf("/create"));
	} else if (gridUrl.indexOf("/edit") > -1) {
		gridUrl = gridUrl.substring(0, gridUrl.indexOf("/edit"));
	}
    if(defaultReadUrl==null){
        gridUrl += "/search/defaultSearch/grid-read";
    }else {
        gridUrl =defaultReadUrl;
    }
    if(defaultReadUrlIsRelative==null){
        defaultReadUrlIsRelative=true;
    }
    if(refreshButton==null){
        refreshButton=false;
    }
%>
<script type="text/javascript">
function exToExcel_toolbar_click() {
	$("#exportToWxcelBtn").click();
 	return false;
}
function refresh_<%=searchGridName%>(){
    $("#<%=searchGridName%>").data("kendoGrid").dataSource.read();
}
</script>
<%if(!isAccordionable){%>
<base:searchButton defaultReadUrl="<%=defaultReadUrl%>" defaultReadUrlIsRelative="<%=defaultReadUrlIsRelative%>"
				   printButtonIds="<%=printButtonIds%>"  printButtonNames="<%=printButtonNames%>" printButtonResoureceBundles="<%=printButtonResoureceBundle%>"/>
<%}%>
<base:exportToExcel type="search_grid"/>
<div style="padding-top: 10px;" >
    <%for(MyColumnTag col : cols) {
        if(col.getDialogConfirmName()!=null && col.getDialogConfirmKey()!=null){
        %>
        <base:dialogConfirm name="<%=col.getDialogConfirmName()%>" key="<%=col.getDialogConfirmKey()%>" yesFunction="confirmYes"/>
        <%}
    }%>
		<base:message title='action.groupBy' jsutDefine="true"/>
		<base:message title='action.operation' jsutDefine="true"/>
		<base:message title='action.edit' jsutDefine="true"/>
		<base:message title='action.delete' jsutDefine="true"/>
	<div class="k-rtl">
		<kendo:grid name="<%=searchGridName%>"  selectable="<%=selectable%>" pageable="true" sortable="true" height="400"  columnReorder="true" resizable="true"
				 editable="${inlineEditing}" change="<%=searchGridOnSelectRow%>" dataBound="<%=searchGridOnDataBound%>" scrollable="<%=scrollable%>">
				<%--filterable="true" navigatable="true" editable="${inlineEditing}" change="_searchGrid_onSelectRow" dataBound="_searchGrid_onDataBound" scrollable="<%=scrollable%>">--%>
			<kendo:grid-groupable>
					<kendo:grid-groupable-messages empty='${label_action_groupBy}' />
			</kendo:grid-groupable>
    		<kendo:grid-toolbar>
     			<kendo:grid-toolbarItem name="exportToExcel" text="exportToExcel"
					template="<a class='k-button-exToExcel' href='\#' onclick='return exToExcel_toolbar_click()'></a>" />
                <%if(refreshButton){%>
				<%--<%String refreshTemplate="<label for=\"rowNum\" class=\"grid-row-number\" />";%>--%>
				<%String refreshTemplate="<a class='k-button-refresh' href='\\#' onclick='return refresh_"+searchGridName+"()'></a>";%>
                <kendo:grid-toolbarItem name="r" text="r"
					template="<%=refreshTemplate%>" />
					<%--template="<a class='k-button-refresh' href='\#' onclick='return refresh_<%=searchGridName%>()'></a>" />--%>
                <%}%>
    			<%if(inlineEditing!=null && inlineEditing.equals("true")){ %>
	            	<kendo:grid-toolbarItem name="save" text="global.crud.save"/>
	            	<kendo:grid-toolbarItem name="cancel" text="global.crud.cancel"/>
            	<%} %>
        	</kendo:grid-toolbar>
	        <kendo:grid-columns>
                <%String rowNumTemplate="<label for=\"rowNum\" class=\"grid-row-number\" />";%>
                <kendo:grid-column title='<%=ResourceBoundleHolder.resourceBundle.getString("global.row")%>' field="rowNumber"
                	filterable="false" attributes=" align='center'" sortable="false" headerAttributes=" align='center'" width="1%" template="<%=rowNumTemplate%>"/>
	        	<%for(MyColumnTag col : cols) {
	                    if(col.isCombo()){ %>
			                <%String template="<input type=\"checkbox\" #="+col.getField()+"  === true ? checked=\"checked\" : \"\" #  disabled />";%>
			                <kendo:grid-column headerAttributes="style=\"height: auto;overflow: visible; white-space: normal;\"" attributes=" align='center'" title='<%=col.getTitle() %>' field="<%=col.getField() %>" width="<%=col.getWidth() %>" template="<%=template%>"/>
						<%}else if(col.isFlag()){ %>
							<%--String template="<a href=\""+request.getContextPath()+col.getFlagDestinationUrl()+"\" onclick=\"_anchorHandleClick(this)\"><img src=\""+request.getContextPath()+col.getFlagIconUrl()+"\" style=\"width: 17px; height: 17px;\"></a>";--%>
							<%String template="<img data-destination-address=\""+col.getFlagDestinationUrl()+"\" "+
								" onclick=\"_anchorHandleClick(this,"+col.getDialogConfirmName()+")\" src=\""+request.getContextPath()+col.getFlagIconUrl()+"\" "+
								" onmouseover=\"mouseOver(this)\" onmouseout=\"mouseOut(this)\" "+
								" style=\"width: 17px; height: 17px;\">";%>
							<kendo:grid-column headerAttributes="style=\"height: auto;overflow: visible; white-space: normal;\"" attributes=" align='center'" title='<%=col.getTitle() %>' field="<%=col.getField() %>" width="<%=col.getWidth() %>" template="<%=template%>"/>
	                    <%}else{%>
	                        <kendo:grid-column headerAttributes="style=\"height: auto;overflow: visible; white-space: normal;\"" title='<%=col.getTitle() %>'  field="<%=col.getField() %>" format="{0:#,0}" width="<%=col.getWidth() %>"/>
		        	    <%}
	        	} %>
				<%if(showOperation){%>
		        	<kendo:grid-column title='${label_action_operation}' width="<%=operationColumnwidth%>" >
		            	<kendo:grid-column-command >
	                        <%if(!isPopup){
	                        	if(GlobalVariable.getButtonContainer(menuSysCode4Grid,"grid-edit-button")){
	                           		if(editLabel==null){%>
		            		        	<kendo:grid-column-commandItem className="uk-button uk-button-success" click="<%=searchGridOnEdit%>" name="edit" text='${label_action_edit}' />
	                            	<%}else {%>
		            		        	<kendo:grid-column-commandItem className="uk-button uk-button-success" click="<%=searchGridOnEdit%>" name="edit" text='<%=ResourceBoundleHolder.resourceBundle.getString(editLabel)%>' />
	                            	<%}
	                             }

	                            if(!noDeleteButton && GlobalVariable.getButtonContainer(menuSysCode4Grid,"grid-remove-button")){%>
	                        		<kendo:grid-column-commandItem className="uk-button uk-button-danger" click="<%=searchGridOnDelete%>" name="delete" text='${label_action_delete}' />
	                        	<%}
	                        }else{
	                            if(noDeleteButton  && GlobalVariable.getButtonContainer(menuSysCode4Grid,"grid-edit-button")){%>
	                                <kendo:grid-column-commandItem className="uk-button uk-button-success" click="<%=searchGridOnEdit%>" name="edit" text='${label_action_edit}' />
	                            <%}
	                        }
							for(MyFunctionTag myFunctionTag : functions) {
								if(GlobalVariable.getButtonContainer(menuSysCode4Grid,myFunctionTag.getName())){
		            				if((myFunctionTag.getStyleClass().equals("uk-button-success"))){
		            			%>
	                            	    <kendo:grid-column-commandItem className="uk-button uk-button-success" click='<%=myFunctionTag.getFunctionClick() %>'  name="<%=myFunctionTag.getName() %>" text="<%=myFunctionTag.getText() %>"/>
	                         		<%}else if((myFunctionTag.getStyleClass().equals("uk-button-danger"))){  %>
	                      	   			<kendo:grid-column-commandItem className="uk-button uk-button-danger" click='<%=myFunctionTag.getFunctionClick() %>'  name="<%=myFunctionTag.getName() %>" text="<%=myFunctionTag.getText() %>"/>
	                         		<%}else if((myFunctionTag.getStyleClass().equals("uk-button-primary"))){  %>
	                      	   			<kendo:grid-column-commandItem className="uk-button uk-button-primary" click='<%=myFunctionTag.getFunctionClick() %>'  name="<%=myFunctionTag.getName() %>" text="<%=myFunctionTag.getText() %>"/>
	                         		<%}else{ %>
	                         			<kendo:grid-column-commandItem className="uk-button" click='<%=myFunctionTag.getFunctionClick() %>'  name="<%=myFunctionTag.getName() %>" text="<%=myFunctionTag.getText() %>"/>
	                         <% 	  }
	                         	}
	                        } %>
		            	</kendo:grid-column-command>
	            	</kendo:grid-column>
	           	<%} %>


	           	<%if(showCheckboxSelector!=null && showCheckboxSelector==true){ %>
	                <%String headerTemplate="<input type=\"checkbox\" class=\"headerCheckbox\" id=\"headerCheckboxId\" onchange=\"selectAllRow()\" />";%>
	                <%String template="<input type=\"checkbox\" class=\"gridCheckbox\" />";%>
	                <kendo:grid-column title="" width="15" template="<%=template%>" headerTemplate="<%=headerTemplate%>"
	                		headerAttributes=" style='text-align: center !important'" attributes=" align='center'"/>
				<%} %>


	        </kendo:grid-columns>
	        <kendo:dataSource  pageSize="10" serverPaging="true" serverSorting="true" serverFiltering="true" serverGrouping="true" requestEnd="<%=searchGridRequestEnd%>" 
	        					requestStart="<%=searchGridRequestStart%>">
		        <kendo:dataSource-transport>
                	<kendo:dataSource-transport-read  url="<%=gridUrl%>" type="POST"  contentType="application/json"/>
                	<kendo:dataSource-transport-update url="${updateUrl}" type="POST" contentType="application/json" />
                	<kendo:dataSource-transport-destroy url="${destroyUrl}" type="POST" contentType="application/json" />
                	<kendo:dataSource-transport-parameterMap>
                		<script>
	                		function parameterMap(options,type) {
	                				return JSON.stringify(options);
	                		}
                		</script>
                	</kendo:dataSource-transport-parameterMap>
            	</kendo:dataSource-transport>
	            <kendo:dataSource-schema  data="data" total="total" groups="data">
	                <kendo:dataSource-schema-model id="id">
	                    <kendo:dataSource-schema-model-fields>
							<%for(MyFieldTag field : fields) {%>
								<kendo:dataSource-schema-model-field name="<%=field.getName() %>" type="<%=field.getType() %>" />
				        	<% }%>
	                    </kendo:dataSource-schema-model-fields>
	                </kendo:dataSource-schema-model>
	            </kendo:dataSource-schema>
                <kendo:dataSource-error>
                    <script>
                        function error(e) {
                            errorRequestAjax(e);
                        }
                    </script>
                </kendo:dataSource-error>
	        </kendo:dataSource>
	        <kendo:grid-pageable input="true" numeric="false" pageSizes="true" />
        </kendo:grid>
       </div>
</div>
<div style="padding-top: 5px;" align="center">
	<%
		for (SearchOperationTag myoperation : operations) {
			if (GlobalVariable.getButtonContainer(menuSysCode, myoperation.getName()) || myoperation.getCheckButtonPermission() == false) {
	%>
				<base:searchGridOperation name="<%=myoperation.getName()%>" key="<%=myoperation.getKey()%>" style="<%=myoperation.getStyle()%>"
							  className="<%=myoperation.getStyleClass() %>" operation="<%=myoperation.getOperation()%>"/>
	<% 		}
		}
		if (showMultipleDelete && GlobalVariable.getButtonContainer(menuSysCode, "search-grid-multipleDelete-btn")) { %>
			<base:searchGridMultipleDelete style="width: 120px"/>
	<%	} %>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$(".k-grid-toolbar").css('height','24px');
	var url = "url(<%=request.getContextPath()%>/resources/images/extractToExcel.png) no-repeat";
	$(".k-button-exToExcel").css("background", url);

    var url2 = "url(<%=request.getContextPath()%>/resources/images/refresh.png) no-repeat";
	$(".k-button-refresh").css("background", url2);

	var grid = $('#<%=searchGridName%>').data("kendoGrid");
	grid.table.on("click", ".gridCheckbox" , selectRow);

	$('.k-pager-nav').click(function(){
		$('#headerCheckboxId').prop("checked","");
	});
});
</script>

<style type="text/css">
.mouseOverCursor {
	cursor: pointer;
}
.grid-row-number  {
	color: red;
	text-align: center !important;
}
th[data-field="rowNumber"]{
	color: red;
	text-align: center !important;
}
.k-button-exToExcel {
  padding: 0px 5px 10px 25px;
}.k-button-refresh {
  padding: 0px 5px 10px 25px;
}
.k-grid-header .wrap-header {
    height: auto;
    overflow: visible;
    white-space: normal;
}
</style>
