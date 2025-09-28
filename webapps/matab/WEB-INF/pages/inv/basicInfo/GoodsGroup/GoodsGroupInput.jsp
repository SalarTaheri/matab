
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
 String basePath = new UrlPathHelper().getOriginatingRequestUri(request); 
 String comboLoaderGoodsGroup = basePath + "combo/loadAllGoodsGroup";
 %>
 
<base:pageHeader6button/>
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
		<base:comboBoxAutoComplete-buttonAddToCombo styleClass="small" name="parent_id" key="com.artonis.inv.basicInfo.goodsGroup.parentGroup"  popupUrlIsRelative="true"
                                     comboLoaderUrl="combo/loadAllGoodsGroup" dataTextField="name"
                                     dataValueField="id" minLength="0"
                                     hasTemplate="true"
                                     headerTemplateComaSep="com.artonis.inv.basicInfo.goodsGroup.name"
                                     templateComaSep="name" popupUrl="popup/treeGoodsGroup"/>
	    </div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="name" key="com.artonis.inv.basicInfo.goodsGroup.name"/>
			<base:testBox styleClass="small" name="code"  key="com.artonis.inv.basicInfo.goodsGroup.code"/>
		</div>
		
	</form>
</div>
<script type="text/javascript">

   $(document).ready(function() {
     $("#code").css('background-color','rgb(206, 215, 235)');
    });
     function callback_select_element_parent_id(modelId){
        var url = getBaseUrl() + "loadGoodsGroup/" + modelId ; 
		$.getJSON(url, function (data) {
			$('#code').val(data.code);
		});
		
     }
</script>
