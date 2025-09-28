<%@page import="java.util.ResourceBundle" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<%--<base:pageHeader/>--%>
<%--<base:pageInputHeader/>--%>
<form class="uk-form2-ComboFillerValue">

    <input type="hidden" id="id" name="id" class="uk-width-1-1">

    <div class="uk-grid uk-grid-preserve">
        <base:testBox styleClass="small" name="name" key="system.basicinfo.combofiller.name"/>
        <base:testBox styleClass="small" name="code" key="system.basicinfo.combofiller.code"/>
    </div>


    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumeric  name="rank" key="system.basicinfo.combofillervalue.rank"/>
    </div>


</form>
