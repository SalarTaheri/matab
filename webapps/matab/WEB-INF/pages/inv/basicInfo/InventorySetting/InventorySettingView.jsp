<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<input name="loadedId" type="hidden" id="loadedId" />
 
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<div id="header-toolbar">
		<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" id="body-heade-save"/>
	</div>
</div>

<div style="padding-top: 10px; height: 50%;" class="background" >
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" />

		<div class="uk-grid uk-grid-preserve">
			<input type="hidden" id="registerNegativeStockValue">
			<base:simpleLabel name="negativeStockLabel" key="inv.basicInfo.inventorySetting.negativeStock" />

			<input id="negativeStockActive" type="radio" name="registerNegativeStock" value="1" />
			<base:simpleLabel name="negativeStockActive" key="global.active.enable" />

			<input id="negativeStockDeactive" type="radio" name="registerNegativeStock" value="2"  />
			<base:simpleLabel name="negativeStockDeactive" key="global.active.disable" />
		</div>

	</form>
</div>

<script type="application/javascript">
	$(document).ready(function(){
	    $("#registerNegativeStockValue").val(${registerNegativeStock});
	    if ($("#registerNegativeStockValue").val() == $("#negativeStockActive").val()) {
            $("#negativeStockActive").prop('checked','true');
		} else if ($("#registerNegativeStockValue").val() == $("#negativeStockDeactive").val()) {
            $("#negativeStockDeactive").prop('checked','true');
        }
	});

	function callback_validation_before_save (data) {
	    if ($("#negativeStockActive").prop('checked') == true) {
	        alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("inv.basicInfo.inventorySetting.error.youCanNotSelectActiveNegativeStock")%>");
	        return false;
		} else {
	        return true;
		}
	}
</script>

<style type="text/css">
	.background{
		margin: 16px;
		padding: 16px;
		border: 1px solid #c8c8d3;
		-moz-box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
		-webkit-box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
		box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);

		background: rgb(242,245,246); /* Old browsers */
		background: -moz-linear-gradient(top,  rgba(242,245,246,1) 0%, rgba(227,234,237,1) 37%, rgba(200,215,220,1) 100%); /* FF3.6+ */
		background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(242,245,246,1)), color-stop(37%,rgba(227,234,237,1)), color-stop(100%,rgba(200,215,220,1))); /* Chrome,Safari4+ */
		background: -webkit-linear-gradient(top,  rgba(242,245,246,1) 0%,rgba(227,234,237,1) 37%,rgba(200,215,220,1) 100%); /* Chrome10+,Safari5.1+ */
		background: -o-linear-gradient(top,  rgba(242,245,246,1) 0%,rgba(227,234,237,1) 37%,rgba(200,215,220,1) 100%); /* Opera 11.10+ */
		background: -ms-linear-gradient(top,  rgba(242,245,246,1) 0%,rgba(227,234,237,1) 37%,rgba(200,215,220,1) 100%); /* IE10+ */
		background: linear-gradient(to bottom,  rgba(242,245,246,1) 0%,rgba(227,234,237,1) 37%,rgba(200,215,220,1) 100%); /* W3C */
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f2f5f6', endColorstr='#c8d7dc',GradientType=0 ); /* IE6-9 */
	}

	label[for='negativeStockLabel']{
		padding-right: 40px;
		padding-left: 25px;
	}

	label[for='negativeStockActive']{
		padding-left: 15px;
	}
</style>