<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="PurchaseReceiptAdditionSubtractionItem" />

<base:my-grid-item name="PurchaseReceiptAdditionSubtractionItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}"
	masterIdStr="purchaseReceipt_id">
	<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptAdditionSubtraction.additionSubtraction' field="surplusDeficitName" width="50px" />
	<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptAdditionSubtraction.price' field="price" format="0:#,0" width="50px" />
	<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptAdditionSubtraction.valueAddedtax' field="valueAddedtaxTxt" width="50px" />
	<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptAdditionSubtraction.tax' field="tax" format="0:#,0" width="50px" />
	<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptAdditionSubtraction.toll' field="toll" format="0:#,0" width="50px" />

	<base:my-grid-schema-field name="surplusDeficitName" type="string" />
	<base:my-grid-schema-field name="price" type="long" />
	<base:my-grid-schema-field name="valueAddedtaxTxt" type="string" />
	<base:my-grid-schema-field name="tax" type="long" />
	<base:my-grid-schema-field name="toll" type="long" />
</base:my-grid-item>
<base:footer />
