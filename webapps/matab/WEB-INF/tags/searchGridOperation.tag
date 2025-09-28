<%@tag import="org.springframework.web.util.UrlPathHelper"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@tag import="java.util.ResourceBundle"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="key" required="true" rtexprvalue="true" %>
<%@ attribute name="style" required="false" rtexprvalue="true" %>
<%@ attribute name="className" required="false" rtexprvalue="true" %>
<%@ attribute name="searchGridName" required="false" rtexprvalue="true" %>
<%@ attribute name="operation" required="false" rtexprvalue="true" %>
<%
if(operation!=null){
%>
<button class="<%=className%>" type="button" onclick="javascript:<%=operation%>('${name}')" id="${name}" style="${style}">
	<%=ResourceBoundleHolder.resourceBundle.getString(key)%>
</button>
<%
	}else{
    %>
<button class="<%=className%>" type="button" onclick="javascript:operation_<%=name%>('${name}')" id="${name}" style="${style}">
	<%=ResourceBoundleHolder.resourceBundle.getString(key)%>
</button>

<%
	}
%>
<%
	if(searchGridName==null){
		searchGridName="searchGrid";
	}
%>
<script type="text/javascript">
function getCurrentUrl(){
	var url = window.location.pathname;
	if (url.indexOf("/create") > -1){
		url = url.substring(0, url.indexOf("/create"));
	}else if (url.indexOf("/edit") > -1){
		url = url.substring(0, url.indexOf("/edit"));
	}
	return url;
}
function getSelectedItemIdSearchGrid(){
	var entityGrid = $("#<%=searchGridName%>").data("kendoGrid");
	var rows = entityGrid.select();
	var rowEntity = [rows.length];
	rows.each(function(index, row) {
	  var selectedItem = entityGrid.dataItem(row);
	  rowEntity[index] = selectedItem; 
	});
	var rowIds = [rowEntity.length];
	for(var i=0; i<rowEntity.length; i++){
		var rowId = {};
		rowId.id = rowEntity[i].id;
		rowIds[i] = rowId;
	}
	return rowIds;
}
function operation_<%=name%>(oprName){
	var rowIds = getSelectedItemIdSearchGrid();
	$.ajax({
		url: getCurrentUrl() + '/operation/'+oprName,
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(rowIds),
		dataType: 'json',
		type: 'POST',
		success: function (data, success, xhr) {
               if (data.state == "error") {
                   for (var i = 0; i < data.errors.length; i++) {
                       if ($("label[for='" + data.errors[i].Field + "']").text().length > 0) {
                           alertify.error($("label[for='" + data.errors[i].Field + "']").text() + ":  " + data.errors[i].Message);
                       } else {
                           alertify.error(data.errors[i].Field + ":  " + data.errors[i].Message);
                       }
                   }
               }else{				
					var searchJsonString = "{}";
				    if(typeof(getSearchObject)=="function"){
				    	searchJsonString = JSON.stringify(getSearchObject());
				    	searchJsonString = searchJsonString.replace(/\//g, ':@:');
				    } 
					var urlGrid = basePath + "search/search/grid-read/" + searchJsonString;
					$("#<%=searchGridName%>").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
					$("#<%=searchGridName%>").data("kendoGrid").dataSource.read();
               }
		},
		error: function (e) {
			alert('Error: ' + e.responseText);
		}
	});
}
</script>