<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader title="inv.m169.serviecGoods.view"></base:pageHeader>
<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
            <base:testBox name="name" key="inv.m169.serviecGoods.name" styleClass="verysmall"/>
            <base:testBox name="code" key="inv.m169.serviecGoods.code" styleClass="verysmall"/>
            <base:testBox name="specification" key="inv.m169.serviecGoods.specification" styleClass="verysmall"/>
	        <base:testBox name="metrics" key="inv.m169.serviecGoods.metric" styleClass="verysmall"/>
            
        </div>
        <div class="uk-grid uk-grid-preserve">
        </div>
		<base:my-grid-search>
		    <base:my-grid-column title='inv.m169.serviecGoods.name'  field="name" width="50px"/>
		    <base:my-grid-column title='inv.m169.serviecGoods.code' field="code"  width="50px"/>
		    <base:my-grid-column title='inv.m169.serviecGoods.specification' field="specification"  width="50px"/>
		    <base:my-grid-column title='inv.m169.serviecGoods.metric' field="metrics"  width="50px"/>
		
		    <base:my-grid-schema-field name="name" type="string" />
		    <base:my-grid-schema-field name="code" type="string" />
		    <base:my-grid-schema-field name="specification" type="string" />
		    <base:my-grid-schema-field name="metrics" type="string" />
		</base:my-grid-search>
	</form>
</div>
<base:footer></base:footer>
<script>
function getSearchObject(){
		var goodsService4Search = {};
		goodsService4Search.name=$("#name").val();
		goodsService4Search.code=$("#code").val();
		goodsService4Search.specification=$("#specification").val();
		goodsService4Search.metrics=$("#metrics").val();
		return goodsService4Search;
}
</script>

