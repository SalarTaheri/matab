<%@tag import="org.springframework.web.util.UrlPathHelper"%>
<%@tag import="java.util.ResourceBundle"%>
<%@tag import="org.apache.commons.lang3.math.NumberUtils" %>
<%--<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>--%>
<%@ attribute name="readUrl" required="true" type="java.lang.String" rtexprvalue="false"%>
<%@ variable alias="transportReadUrl" name-from-attribute="readUrl" scope="AT_BEGIN" variable-class="java.lang.String"%>

<%@ attribute name="removeUrl" required="true" type="java.lang.String" rtexprvalue="false"%>
<%@ variable alias="transportRemoveUrl" name-from-attribute="removeUrl" scope="AT_BEGIN" variable-class="java.lang.String"%>

<%@ attribute name="updateUrl" required="true" type="java.lang.String" rtexprvalue="false"%>
<%@ variable alias="transportupdateUrl" name-from-attribute="updateUrl" scope="AT_BEGIN" variable-class="java.lang.String"%>
<%@ attribute name="tabName" required="true" rtexprvalue="true"%>


<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String basePath = new UrlPathHelper().getOriginatingRequestUri(request).replace("create", "");

//    String transportReadUrl = basePath + "item-grid-read/FactorItem";
    String tranReadUrl = basePath + "item-grid-read/"+tabName;
//    String transportUpdateUrl = basePath + "item-grid/FactorItem/save";
    String transportUpdateUrl = basePath + "item-grid/"+tabName+"/save";
    if(basePath.indexOf("/edit/")>-1){
        int editIndexOf = basePath.indexOf("/edit/");
        String masterId = basePath.substring(editIndexOf + 6);
        if(NumberUtils.isNumber(masterId)){
            basePath=basePath.substring(0,editIndexOf+1);
//            transportReadUrl=basePath+"item-grid-read/FactorItem/"+masterId;
            tranReadUrl=basePath+"item-grid-read/"+tabName+"/"+masterId;
//            transportUpdateUrl=basePath+"item-grid/FactorItem/save";
            transportUpdateUrl=basePath+"item-grid/"+tabName+"/save";
        }else{
        	basePath=basePath.substring(0,editIndexOf+1);
            tranReadUrl=basePath+"item-grid-read/"+tabName+"/"+masterId;
            transportUpdateUrl=basePath+"item-grid/"+tabName+"/save";
        }


    }else{
//        transportReadUrl=basePath+"item-grid-read/FactorItem/-1";
        tranReadUrl=basePath+"item-grid-read/"+tabName+"/-1";
    }

//    String transportRemoveUrl = basePath + "item-remove/FactorItem";
    String tranRemoveUrl = basePath + "item-remove/"+tabName;
%>

<c:set var="transportReadUrl" value="<%=tranReadUrl %>" />
<c:set var="transportRemoveUrl" value="<%=tranRemoveUrl %>" />
<c:set var="transportUpdateUrl" value="<%=transportUpdateUrl %>" />
