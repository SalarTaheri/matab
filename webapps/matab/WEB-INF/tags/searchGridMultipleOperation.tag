<%@tag import="org.springframework.web.util.UrlPathHelper"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@tag import="java.util.ResourceBundle"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ attribute name="style" required="false" rtexprvalue="true" %>
<%@ attribute name="operationName" required="false" rtexprvalue="true" %>
<%@ attribute name="key" required="false" rtexprvalue="true" %>


<button class="uk-button uk-button-success" type="button" onclick="javascript:operationName('${operationName}')" id="${operationName}" style="${style}">
	<%=ResourceBoundleHolder.resourceBundle.getString(key)%>
</button>

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
	var entityGrid = $("#searchGrid").data("kendoGrid");
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
function operationName(oprName){
	var rowIds = getSelectedItemIdSearchGrid();
	$.ajax({
		url: getCurrentUrl() +oprName,
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
					$("#searchGrid").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
					$("#searchGrid").data("kendoGrid").dataSource.read();
					alertify.success(data.message);
               }
		},
		error: function (e) {
			alert('Error: ' + e.responseText);
		}
	});
}
</script>