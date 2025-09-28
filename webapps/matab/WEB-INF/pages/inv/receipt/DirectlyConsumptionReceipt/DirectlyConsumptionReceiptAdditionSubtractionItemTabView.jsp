
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="DirectlyConsumptionReceiptAdditionSubtractionItem"/>

<base:my-grid-item name="DirectlyConsumptionReceiptAdditionSubtractionItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="directlyConsumptionReceipt_id">
<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptAdditionSubtraction.additionSubtraction'  field="additionSubtractionTxt" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptAdditionSubtraction.price' format="0:#,0"  field="price" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptAdditionSubtraction.tax' format="0:#,0" field="tax" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptAdditionSubtraction.toll'  format="0:#,0" field="toll" width="50px"/>


        <base:my-grid-schema-field name="additionSubtractionTxt" type="string"/>
        <base:my-grid-schema-field name="price" type="long"/>
        <base:my-grid-schema-field name="tax" type="long"/>
        <base:my-grid-schema-field name="toll" type="long"/>
</base:my-grid-item>
<base:footer/>
