<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-EmployeeFamilyItem" >
		<input  type="hidden" id="id" name="id" class="uk-width-1-1">
		<div class="uk-grid uk-grid-preserve">			
			<base:testBox styleClass="small" name="firstName_" key="hrm.employee.firstName" />
			<base:testBox styleClass="small" name="lastName_" key="hrm.employee.lastName" />
           	<base:testBox styleClass="small" name="fatherName_" key="hrm.employee.fatherName" />
		</div>
		<div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="small" name="nationalCode_" key="hrm.employee.nationalCode" />
   			<base:testBox styleClass="small" name="identityNumber_" key="hrm.employee.identityNumber" />
			<base:mDatePicker styleClass="small" name="birthDate_" key="hrm.employee.birthDate" style="position: relative; z-index: 100000;"/> 
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="sex_" value="name" key="hrm.employee.sex" comboLoaderUrl="combo/loadAllSex" styleClass="small"/> 
			<base:comboBox name="relation_id" value="name" key="hrm.employee.EmployeeFamilyItem.relation" comboLoaderUrl="combo/loadAllRelation" styleClass="small"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="sponsorshipType" value="name" key="hrm.employee.EmployeeFamilyItem.sponsorshipType" comboLoaderUrl="combo/loadAllSponsorshipType" styleClass="small"/>
			<base:mDatePicker styleClass="small" name="fromDate" key="hrm.employee.EmployeeFamilyItem.fromDate"/>
			<base:mDatePicker styleClass="small" name="toDate" key="hrm.employee.EmployeeFamilyItem.toDate"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="insurance" value="name" key="hrm.employee.EmployeeFamilyItem.insurance" comboLoaderUrl="combo/loadUsability" styleClass="small"/>
			<base:mDatePicker styleClass="small" name="fromDateInsurance" key="hrm.employee.EmployeeFamilyItem.fromDateInsurance"/>
			<base:mDatePicker styleClass="small" name="toDateInsurance" key="hrm.employee.EmployeeFamilyItem.toDateInsurance"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="completeInsurance" value="name" key="hrm.employee.EmployeeFamilyItem.completeInsurance" comboLoaderUrl="combo/loadUsability" styleClass="small"/>
			<base:mDatePicker styleClass="small" name="fromDateCompleteInsurance" key="hrm.employee.EmployeeFamilyItem.fromDateCompleteInsurance"/>
			<base:mDatePicker styleClass="small" name="toDateCompleteInsurance" key="hrm.employee.EmployeeFamilyItem.toDateCompleteInsurance"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea name="description" key="hrm.employee.EmployeeFamilyItem.description" height="25"/>
		</div>
</form>
<script type="text/javascript">
		$(document).ready(function(){
			setTimeout(function() { 
				checkDateVisible();
				checkInsuranceVisible();
				checkCompleteInsuranceVisible();
			 },500);
				
		   $("#sponsorshipType_Comb").change(function(){
		   	checkDateVisible();
		  });
		   $("#insurance_Comb").change(function(){
		   	checkInsuranceVisible();
		  });
		   $("#completeInsurance_Comb").change(function(){
		   	checkCompleteInsuranceVisible();
		  });
		});
		/////////////////////////////////////////////// FUNCTIONS
		function checkDateVisible(){
			if ($("#sponsorshipType_Comb").val() == "46"){
				$("#fromDate").fadeOut();
				$("#fromDate_lbl_date").fadeOut();
				$("#toDate").fadeOut();
				$("#toDate_lbl_date").fadeOut();
			}else{
				$("#fromDate").fadeIn();
				$("#fromDate_lbl_date").fadeIn();
				$("#toDate").fadeIn();
				$("#toDate_lbl_date").fadeIn();
			}
		}
		function checkInsuranceVisible(){
			if ($("#insurance_Comb").val() == "2"){
				$("#fromDateInsurance").fadeOut();
				$("#fromDateInsurance_lbl_date").fadeOut();
				$("#toDateInsurance").fadeOut();
				$("#toDateInsurance_lbl_date").fadeOut();
			}else{
				$("#fromDateInsurance").fadeIn();
				$("#fromDateInsurance_lbl_date").fadeIn();
				$("#toDateInsurance").fadeIn();
				$("#toDateInsurance_lbl_date").fadeIn();
			}
		}
		function checkCompleteInsuranceVisible(){
			if ($("#completeInsurance_Comb").val() == "2"){
				$("#fromDateCompleteInsurance").fadeOut();
				$("#fromDateCompleteInsurance_lbl_date").fadeOut();
				$("#toDateCompleteInsurance").fadeOut();
				$("#toDateCompleteInsurance_lbl_date").fadeOut();
			}else{
				$("#fromDateCompleteInsurance").fadeIn();
				$("#fromDateCompleteInsurance_lbl_date").fadeIn();
				$("#toDateCompleteInsurance").fadeIn();
				$("#toDateCompleteInsurance_lbl_date").fadeIn();
			}
		}
</script>

