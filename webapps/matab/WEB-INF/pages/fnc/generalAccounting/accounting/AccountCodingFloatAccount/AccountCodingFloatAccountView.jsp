
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<%--<base:my-grid-column title='com.fnc.generalAccounting.accountingcounting.accountFloatDetailAccount.account_id'  field="account_id" width="50px"/>--%>
	<%--<base:my-grid-column title='comfnc.generalAccounting.accountingccounting.accountFloatDetailAccount.floatDetailAccount_id'  field="floatDetailAccount_id" width="50px"/>--%>


        <base:my-grid-schema-field name="account_id" type="string"/>
        <base:my-grid-schema-field name="floatDetailAccount_id" type="string"/>
</base:my-grid>
<base:footer/>
<script type="text/javascript">

    $(document).ready(function(){
//        $("#body-heade-create").hide();
//        $("#body-heade-save-div").show();

    });

</script>