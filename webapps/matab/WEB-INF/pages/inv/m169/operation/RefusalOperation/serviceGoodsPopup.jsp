<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form" id="form-popup">
	<input type="hidden" id="id" name="id">
    <div class="uk-grid uk-grid-preserve">
        <base:testBox name="name" key="inv.m169.serviecGoods.name" styleClass="small" styledivLabel="width: 170px"/>
        <base:testBox name="code" key="inv.m169.serviecGoods.code" styleClass="small" styledivLabel="width: 170px"/>
    </div>
    <div class="uk-grid uk-grid-preserve">
     	<base:testBox name="specification" key="inv.m169.serviecGoods.specification" styleClass="small" styledivLabel="width: 170px"/>
     	<base:testBox name="metrics" key="inv.m169.serviecGoods.metric" styleClass="small" styledivLabel="width: 170px"/>
    </div>
</form>
