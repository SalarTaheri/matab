<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader6button/>
<base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container">

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id"/>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="code" key="com.artonis.inv.basicInfo.goodsCategory.code" type="number"/>
			<base:testBox styleClass="small" name="name" key="com.artonis.inv.basicInfo.goodsCategory.name"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox styleClass="small" name="goodsTypeId" key="com.artonis.inv.basicInfo.goodsCategory.type" comboLoaderUrl="combo/loadAllGoodsTypes"/>
		    <base:textArea name="description" key="com.artonis.inv.basicInfo.goodsCategory.description" />
		</div>
	</form>

</div>

<base:itemForm titleKeys="com.artonis.inv.basicInfo.goodsCategory.accounting" formItemTabViewJspFiles="GoodsCategoryAccountingItemTabView.jsp"
			   formItemTabInputs="GoodsCategoryAccountingItemTabInput" insertWithoutPopup="true" masterIdStr="goodsCategoryId"/>
