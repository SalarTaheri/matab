<%@tag import="org.springframework.web.util.UrlPathHelper"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@tag import="java.util.ResourceBundle"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ attribute name="defaultReadUrl" required="false" rtexprvalue="true"%>
<%@ attribute name="baseReadUrl" required="false" rtexprvalue="true"%>
<%@ attribute name="defaultReadUrlIsRelative" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="searchGridName" required="false" rtexprvalue="true" %>

<%@ attribute name="printButtonIds" required="false" rtexprvalue="true" %>
<%@ attribute name="printButtonNames" required="false" rtexprvalue="true" %>
<%@ attribute name="printButtonResoureceBundles" required="false" rtexprvalue="true" %>

<%
    if(defaultReadUrl==null){
        defaultReadUrl="search/defaultSearch/grid-read";
    }
    if(defaultReadUrlIsRelative==null){
        defaultReadUrlIsRelative=true;
    }
    String functionName="";
    if(searchGridName==null){
        searchGridName="searchGrid";
    }else{
        functionName="_"+searchGridName;
    }
    if(baseReadUrl==null){
        String baseUrl = request.getAttribute("controllerBasePath").toString() ;
        if(!baseUrl.substring(baseUrl.length()-1,baseUrl.length()).equals("/")){
            baseUrl = baseUrl + '/';
        }
        baseReadUrl=baseUrl;
    }

    String[] printButtonIdArray=null;
    if(printButtonIds!=null){
        printButtonIdArray = printButtonIds.split(",");
    }

    String[] printButtonNameArray=null;
    if(printButtonNames!=null){
        printButtonNameArray = printButtonNames.split(",");
    }

    String[] printButtonResoureceBundleArray=null;
    if(printButtonResoureceBundles!=null){
        printButtonResoureceBundleArray = printButtonResoureceBundles.split(",");
    }
%>

<div align="center" style="padding-top: 1px">
	<button class="uk-button uk-button-success" type="button" onclick="javascript:search<%=functionName%>()" id="searchBtn">
		<%=ResourceBoundleHolder.resourceBundle.getString("global.search")%>
	</button>
	<button class="uk-button uk-button-success" type="button" onclick="javascript:clearAndSearch<%=functionName%>()" id="clearAndSearchBtn">
		<%=ResourceBoundleHolder.resourceBundle.getString("global.clearAndSearch")%>
	</button>
    <button class="uk-button uk-button-success" type="button" onclick="javascript:print<%=functionName%>()" id="printBtn">
        <%=ResourceBoundleHolder.resourceBundle.getString("fnc.btn.print")%>
    </button>
    <%
        if(printButtonIds!=null && printButtonIdArray.length>0 &&
                printButtonNames!=null && printButtonNameArray.length>0 &&
                printButtonResoureceBundles!=null && printButtonResoureceBundleArray.length>0 &&
                printButtonIdArray.length==printButtonNameArray.length && printButtonNameArray.length==printButtonResoureceBundleArray.length){

            for(int i=0;i<printButtonIdArray.length;i++){
                %>
                <button class="uk-button uk-button-success" type="button" onclick="javascript:print<%=printButtonNameArray[i]%>()" id="<%=printButtonIdArray[i]%>>">
                        <%=ResourceBoundleHolder.resourceBundle.getString(printButtonResoureceBundleArray[i])%>
                </button>

    <%
            }
        }
    %>
</div>
<script type="text/javascript">
function search<%=functionName%>(){
    console.log('<%=baseReadUrl%>');
    if(typeof(do_before_search_callback<%=functionName%>) == "function"){
        var returnValue = do_before_search_callback<%=functionName%>();
        if(returnValue=="false"){
            return;
        }
    }
	var searchJsonString = "{}";
    if(typeof(getSearchObject<%=functionName%>)=="function"){
        console.log(getSearchObject<%=functionName%>())
    	searchJsonString = JSON.stringify(getSearchObject<%=functionName%>());
    	searchJsonString = searchJsonString.replace(/\//g, ':@:');
    }
//	var urlGrid = getBaseUrl() + "search/search/grid-read/" + searchJsonString;
	var urlGrid = "<%=baseReadUrl%>" + "search/search/grid-read/" + searchJsonString;

	$("#<%=searchGridName%>").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
	$("#<%=searchGridName%>").data("kendoGrid").dataSource.page(1);

    if(typeof(doAfterSearch<%=functionName%>)=="function"){
        doAfterSearch<%=functionName%>(searchJsonString);
    }

}

function print<%=functionName%>(){
	var searchJsonString = "{}";
    if(typeof(getSearchObject<%=functionName%>)=="function"){
    	searchJsonString = JSON.stringify(getSearchObject<%=functionName%>());
    	searchJsonString = searchJsonString.replace(/\//g, ':@:');
    }
//	var urlGrid = getBaseUrl() + "print/" + searchJsonString;
	var urlGrid = "<%=baseReadUrl%>" + "print/" + searchJsonString;

    window.open(urlGrid);
//	$("#searchGrid").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
//	$("#searchGrid").data("kendoGrid").dataSource.page(1);

    if(typeof(doAfterSearch<%=functionName%>)=="function"){
        doAfterSearch<%=functionName%>(searchJsonString);
    }

}

function getSearchJsonString<%=functionName%>(){
    var searchJsonString = "{}";
    if(typeof(getSearchObject<%=functionName%>)=="function"){
        searchJsonString = JSON.stringify(getSearchObject<%=functionName%>());
        searchJsonString = searchJsonString.replace(/\//g, ':@:');
    }
    return searchJsonString;
}
function clearAndSearch<%=functionName%>(){
    var defaultUrl="<%=defaultReadUrl%>";

    for(var i=0;i<document.forms.length;i++){
        if(document.forms[i].id!="FinanceYear-active"){
            document.forms[i].reset();
        }
    }
	$(':input').val('');
	if(typeof(resetForm)=="function"){
		resetForm();
	}
    if("<%=defaultReadUrlIsRelative%>"=="true"){
//        var urlGrid = getBaseUrl() + defaultUrl;
        var urlGrid = "<%=baseReadUrl%>" + defaultUrl;
    }else{
        var urlGrid =  defaultUrl;
    }
	$("#<%=searchGridName%>").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
	$("#<%=searchGridName%>").data("kendoGrid").dataSource.read();

	if(typeof(doAfterClearAndSearch<%=functionName%>)=="function"){
        doAfterClearAndSearch<%=functionName%>();
    }
}

$(document).ready(function() {
//     $(document).keypress(function(e) {
//        if(e.which == 13) {
            <%--search<%=functionName%>();--%>
//        }
//    });
});
</script>