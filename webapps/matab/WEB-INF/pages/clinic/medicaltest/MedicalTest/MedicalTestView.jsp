<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
	String jsFileName = pageContext.getPage().getClass().getName();
	jsFileName = jsFileName.substring(jsFileName.lastIndexOf(".") + 1).replace("_jsp", ".js");

    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
    request.setAttribute("basePath", basePath);
    String createUrl = basePath + "create";
    String menuSysCode =String.valueOf(request.getAttribute("menuSystemCode"));
    System.out.println(menuSysCode);
%>

<input name="loadedId" type="hidden" id="loadedId" />

<div class="body-header">

    <ul class="uk-breadcrumb uk-h3" id="breadcrumb">
        <li id="breadcrumb-main-section"><span>${pageTitle}</span>
        </li>
    </ul>
    <div id="header-toolbar">
        <div id="body-heade-save-div">
            <base:button key="global.crud.save"  id="body-heade-callWebService"/>
            <base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
        </div>

    </div>
</div>















<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read">
    <base:my-grid-column title='clinic.medicalTestName'  field="name" width="100px"/>
    <%--<base:my-grid-column title='his.clinic.medicalTest.coding'  field="coding" width="50px"/>--%>
    <base:my-grid-column title='his.clinic.medicalTest.status'  field="statusStr" width="50px"/>
    <base:my-grid-column title='his.clinic.medicalTest.type'  field="typeStr" width="50px"/>

    <base:my-grid-schema-field name="name" type="string" />
    <%--<base:my-grid-schema-field name="coding" type="string"/>--%>
    <base:my-grid-schema-field name="statusStr" type="string"/>
</base:my-grid>


<base:footer></base:footer>
<script>
    $("#body-heade-callWebService").click(function() {
        $("#body-heade-callWebService").prop('disabled', true);
        $.ajax({

            url: '${pageContext.request.contextPath}/clinic/medicaltest/medicalTest/callWebService',
            type: 'GET',
            data: {},
            dataType: 'json',
            success: function (data) {
                console.log(data);
                if (data.state == 'error') {
                    alertify.error(data.errors);
                    $("#body-heade-callWebService").prop('disabled', false);
                }else{
                    alertify.success("insert success");
                    $("#body-heade-callWebService").prop('disabled', false);
                }
            },
            error: function (result) {
                $("#body-heade-callWebService").prop('disabled', false);
                if (result.status == 401) {
                    alert('Error');

                }
            }
        });
    });
</script>