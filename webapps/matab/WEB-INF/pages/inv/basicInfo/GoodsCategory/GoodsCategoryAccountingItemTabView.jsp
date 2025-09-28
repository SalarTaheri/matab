<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="transportupdateUrl" tabName="GoodsCategoryAccountingItem"/>
<base:my-grid-item name="GoodsCategoryAccountingItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="goodsCategoryId">
	<base:my-grid-column title='com.artonis.inv.basicInfo.goodsCategory.accountCoding' field="accountCodingName" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.basicInfo.goodsCategory.documentsType' field="documentsTypesNames" width="50px"/>
    
    <base:my-grid-schema-field name="accountCodingName" type="string"/>
    <base:my-grid-schema-field name="documentsTypesNames" type="string"/>
</base:my-grid-item>
<base:footer/>
