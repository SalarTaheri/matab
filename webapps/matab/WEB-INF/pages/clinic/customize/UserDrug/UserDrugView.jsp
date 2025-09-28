
<%@page import="java.util.ResourceBundle"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
	request.setAttribute("basePath", basePath);
 %>
 
 <input name="loadedId" type="hidden" id="loadedId" />
 
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<div id="header-toolbar">
		<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" id="userDrugView-save"/>
	</div>
</div>

<base:multiSelctionPanel name="drugList" key="clinic.drugName" absoluteLoaderUrl="clinic/customize/userDrug/multiSelect/loadDrugGet"/>
<base:footer></base:footer>
<script>

$("#userDrugView-save").click(function(){
		    	
                jQuery.ajax({
                    url:"<c:url value='/' />" +"clinic/customize/userDrug/multiSelect/save",
                    type:"POST",
                    data:JSON.stringify($('#drugList').val()),
                    dataType:"json",
                    contentType:"application/json; charset=utf-8",
                    success:function (result) {
                        if (result.state == "error") {
                            for (var i = 0; i < result.errors.length; i++) {
                                if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                                    alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                                } else {
                                    alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);

                                }
                            }
                        }
                        if (result.state == "success") {
                            alertify.success(result.message);
                        }
                    },
                    error:function(result){
                        if(result.status==401){
                            window.location.href=getBaseUrl();
                        }
                    }
                });
    });


</script>
<style>
	.uk-width-2-5, .uk-width-4-10 {
		width: 100%;
	}
	.ms-container {
		background: transparent url('../../../resources/js/img/switch.png') no-repeat 50% 50%;
		width: 100%;	
		padding-top: 10px;
	}
	.uk-width-1-10 {
		width: 100%;
		height: 5%;
		text-align: -webkit-center;
		background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#e6f0a3), color-stop(50%,#d2e638), color-stop(51%,#c3d825), color-stop(100%,#dbf043)); /* Chrome,Safari4+ */
	}
	
	.ms-list{
		direction: ltr;
	}
		.custom-header{
		text-align: center;
	}
	#body-content{
		background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#f2f5f6), color-stop(37%,#e3eaed), color-stop(100%,#c8d7dc)); /* Chrome,Safari4+ */
	}
</style>