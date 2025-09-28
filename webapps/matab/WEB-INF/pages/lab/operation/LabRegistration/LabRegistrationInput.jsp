<%@page import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<link href="<c:url value='/resources/questionnaire/lib/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet"/>
<link href="<c:url value='/resources/questionnaire/lib/bootstrap/css/bootstrap-theme.css'/>" rel="stylesheet"/>

<base:pageHeader/>
<base:pageInputHeader/>

<%
	String basePath = (String) request.getAttribute("basePath");
	String menuSysCode =String.valueOf(request.getAttribute("menuSystemCode"));
%>

<input type="hidden" id="patientId" name="patientId"/>
<input type="hidden" id="specialtyId" name="specialtyId"/>

<div class="row uk-container uk-container-center my-uk-container">
	<div class="col-md-5">
		<fieldset>
			<legend>
				<div class="col-md-12 table-title">
					<div class="col-md-7">
						<label>
							نام آزمایش
						</label>
					</div>

					<div class="col-md-3">
						<label>
							نرخ آزمایش
						</label>
					</div>

					<div class="col-md-2">
						<label>
							عملیات
						</label>
					</div>
				</div>
			</legend>
			<div class="col-md-12 lab-title">
				<div class="col-md-7">
					<input type="text" id="testName" name="testName" class="form-control" placeholder="نام آزمایش" onkeypress="return testNameKeypress(event)">
				</div>

				<div class="col-md-3">
					<span id="price"></span>
				</div>

				<div class="col-md-2">
					<button class="uk-button uk-button-success" onclick="addTest()">افزودن</button>
				</div>
			</div>
			<div id="selectedTests">
			</div>
		</fieldset>
		<% if(GlobalVariable.getButtonContainer(menuSysCode, "lab_registration_payment")) { %>
		<fieldset>
			<legend>
				<label>
					پرداخت
				</label>
			</legend>
			<div class="pay">
				<div class="row field-row">
					<div class="col-md-2">
						<button class="uk-button uk-button-success" onclick="addPayment()">ثبت مالی</button>
					</div>
					<div class="col-md-3">
						<input type="text" name="type" id="type" value="1">
					</div>
					<div class="col-md-3">
						<input type="text" name="posId" id="posId" value="1">
					</div>
					<div class="col-md-3">
						<input type="text" class="form-control" name="sum" id="sum" onkeypress="return sumKeypress(event)"/>
					</div>
					<div class="col-md-1" style="padding: 0">
						<label>
							مبلغ
						</label>
					</div>
				</div>
			</div>
			<table id="paymentTable">
				<thead>
					<tr>
						<th style="width: 30%">
							عملیات
						</th>
						<th style="width: 30%">
							مبلغ
						</th>
						<th style="width: 30%">
							نوع پرداخت
						</th>
						<th style="width: 10%">
							ردیف
						</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</fieldset>
		<% } %>
		<fieldset>
			<legend>
				<label>
					عملیات
				</label>
			</legend>
			<div class="operations">
				<% if(GlobalVariable.getButtonContainer(menuSysCode, "lab_registration_send_cash_desk")) { %>
				<button class="uk-button uk-button-success" onclick="customSave(true)">
					ارسال به صندوق
				</button>
				<% } %>
				<% if(GlobalVariable.getButtonContainer(menuSysCode, "lab_registration_payment")) { %>
				<button class="uk-button uk-button-success" onclick="customSave(false)">
					ثبت پرداخت
				</button>
				<% } %>
			</div>
		</fieldset>
	</div>
	<div class="col-md-7">
		<fieldset>
			<legend>
				<label>
					مشخصات بیمار
				</label>
			</legend>
			<div class="row field-row">
				<div class="col-md-4">
					<input type="text" class="form-control" name="nationalCode" id="nationalCode" onkeydown="return changeFocus(event,'firstName')">
				</div>
				<div class="col-md-2">
					<label>
						کدملی
					</label>
				</div>
				<div class="col-md-4">
					<input type="text" class="form-control" name="fileNumber" id="fileNumber">
				</div>
				<div class="col-md-2">
					<label>
						شماره پرونده
					</label>
				</div>
			</div>

			<div class="row field-row">
				<div class="col-md-4">
					<input type="text" class="form-control" name="lastName" id="lastName" onkeydown="return changeFocus(event,'fatherName')">
				</div>
				<div class="col-md-2">
					<label>
						نام خانوادگی
					</label>
				</div>
				<div class="col-md-4">
					<input type="text" class="form-control" name="firstName" id="firstName" onkeydown="return changeFocus(event,'lastName')">
				</div>
				<div class="col-md-2">
					<label>
						نام
					</label>
				</div>
			</div>

			<div class="row field-row">
				<div class="col-md-4">
					<div class="btn-group">
						<label class="btn btn-default">
							<input onchange="updateLmp()" name="sex" id="sexFemale" value="2" type="radio" onkeydown="return changeFocus(event,'age')"> زن
						</label>
						<label class="btn btn-default">
							<input onchange="updateLmp()" name="sex" id="sexMale" value="1" type="radio" onkeydown="return changeFocus(event,'age')"> مرد
						</label>
					</div>
				</div>
				<div class="col-md-2">
					<label>
						جنسیت
					</label>
				</div>
				<div class="col-md-4">
					<input type="text" class="form-control" name="fatherName" id="fatherName" onkeydown="return changeFocus(event,'sexMale')">
				</div>
				<div class="col-md-2">
					<label>
						نام پدر
					</label>
				</div>
			</div>

			<div class="row field-row">
				<div class="col-md-4">
					<input type="text" class="form-control" name="birthYear" id="birthYear" onkeydown="return changeFocus(event,'phone')">
				</div>
				<div class="col-md-2">
					<label>
						سال تولد
					</label>
				</div>
				<div class="col-md-4">
					<input type="text" class="form-control" name="age" id="age" onkeydown="return changeFocus(event,'birthYear')">
				</div>
				<div class="col-md-2">
					<label>
						سن
					</label>
				</div>
			</div>

			<div class="row field-row">
				<div class="col-md-4">
					<input type="text" class="form-control" name="cellphone" id="cellphone" onkeydown="return changeFocus(event,'medicalHistory')">
				</div>
				<div class="col-md-2">
					<label>
						تلفن همراه
					</label>
				</div>
				<div class="col-md-4">
					<input type="text" class="form-control" name="phone" id="phone" onkeydown="return changeFocus(event,'cellphone')">
				</div>
				<div class="col-md-2">
					<label>
تلفن ثابت
					</label>
				</div>
			</div>
			<div class="row field-row">
				<div class="col-md-4">
					<input type="text" class="form-control" name="sampleCode" id="sampleCode" onkeydown="return changeFocus(event,'address')">
				</div>
				<div class="col-md-2">
					<label>
						کد بافت
					</label>
				</div>
				<div class="col-md-4">
					<input type="text" class="form-control" name="medicalHistory" id="medicalHistory" onkeydown="return changeFocus(event,'sampleCode')">
				</div>
				<div class="col-md-2">
					<label>
						سابقه بیماری
					</label>
				</div>
			</div>

			<div class="row field-row">
				<div class="col-md-10">
					<input type="text" class="form-control" name="address" id="address" onkeydown="return changeFocus(event,'insuranceOrganizationCode')">
				</div>
				<div class="col-md-2">
					<label>
						آدرس
					</label>
				</div>
			</div>

			<div class="row field-row">
				<div class="col-md-4 text-right">
					<input type="text" class="form-control" name="insuranceOrganizationId" id="insuranceOrganizationId" onkeydown="return changeFocus(event,'expirationDate')">
				</div>
				<div class="col-md-2">
					<label>
						نوع پذیرش
					</label>
				</div>
				<div class="col-md-4 text-right">
					<input type="text" class="form-control" name="insuranceOrganizationCode" id="insuranceOrganizationCode" onkeypress="return insuranceOrganizationCodeKeypress(event)" onkeydown="return changeFocus(event,'expirationDate')">
				</div>
				<div class="col-md-2">
					<label>
						نوع پذیرش
					</label>
				</div>
			</div>

			<div class="row field-row">
				<div class="col-md-4">
					<input type="text" class="form-control" name="visitDate" id="visitDate" onkeydown="return changeFocus(event,'bookNumber')">
				</div>
				<div class="col-md-2">
					<label>
						تاریخ وزیت
					</label>
				</div>
				<div class="col-md-4">
					<input type="text" class="form-control" name="expirationDate" id="expirationDate" onkeydown="return changeFocus(event,'visitDate')">
				</div>
				<div class="col-md-2">
					<label>
						تاریخ اعتبار
					</label>
				</div>
			</div>

			<div class="row field-row">
				<div class="col-md-4">
					<input type="text" class="form-control" name="bookPage" id="bookPage" onkeydown="return changeFocus(event,'doctorId')">
				</div>
				<div class="col-md-2">
					<label>
						صفحه ی دفترچه
					</label>
				</div>
				<div class="col-md-4">
					<input type="text" class="form-control" name="bookNumber" id="bookNumber" onkeydown="return changeFocus(event,'bookPage')">
				</div>
				<div class="col-md-2">
					<label>
						شماره دفترچه
					</label>
				</div>
			</div>

			<div class="row field-row">
				<div class="col-md-4">
					<input type="text" class="form-control" name="lmp" id="lmp" disabled="disabled" onkeydown="return changeFocus(event,'doctorCode')">
				</div>
				<div class="col-md-2">
					<label>
						LMP
					</label>
				</div>
				<div class="col-md-4">
					<input type="text" class="form-control" name="doctorId" id="doctorId" onkeypress="return doctorIdKeypress(event)" >
				</div>
				<div class="col-md-2">
					<label>
						کدپزشک
					</label>
				</div>
			</div>
			<div class="row field-row">
				<div class="col-md-4">
					<input type="text" class="form-control" name="prefix" id="prefix" onkeydown="return changeFocus(event,'doctorName')">
				</div>
				<div class="col-md-2">
					<label>
						عنوان
					</label>
				</div>
				<div class="col-md-4">
					<input type="text" class="form-control" name="doctorCode" id="doctorCode" onkeydown="return changeFocus(event,'prefix')">
				</div>
				<div class="col-md-2">
					<label>
						نظام پزشکی
					</label>
				</div>
			</div>

			<div class="row field-row">
				<div class="col-md-4">
					<input type="text" class="form-control" name="specialtyName" id="specialtyName" onkeydown="return changeFocus(event,'testName')">
				</div>
				<div class="col-md-2">
					<label>
						تخصص
					</label>
				</div>
				<div class="col-md-4">
					<input type="text" class="form-control" name="doctorName" id="doctorName" onkeydown="return changeFocus(event,'specialtyName')">
				</div>
				<div class="col-md-2">
					<label>
						نام پزشک
					</label>
				</div>
			</div>
		</fieldset>

		<fieldset>
			<legend>
				<label>
					وضعیت مالی
				</label>
			</legend>
			<div class="col-md-12 label-info labCashTblStyle">
				<div class="col-md-2">
					<label id="payable"></label>
				</div>
				<div class="col-md-2">
					<label>
						قابل پرداخت
					</label>
				</div>
				<div class="col-md-2">
					<label id="ezafe_che_fe_lbl">0</label>
				</div>
				<div class="col-md-2">
					<label >
						اضافه چ.ف
					</label>
				</div>
				<div class="col-md-2">
					<label id='hagh_paziresh'>0</label>
				</div>
				<div class="col-md-2">
					<label>
						حق پذیرش
					</label>
				</div>
			</div>
			<div class="col-md-12 label-primary labCashTblStyle">
				<div class="col-md-2">
					<label id="received"></label>
				</div>
				<div class="col-md-2">
					<label>
						دریافت از بیمار
					</label>
				</div>
				<div class="col-md-2">
					<label></label>
				</div>
				<div class="col-md-2">
					<label>
						اضافه خارج تعهد
					</label>
				</div>
				<div class="col-md-2">
					<label id='hagh_fani'>18,700</label>
				</div>
				<div class="col-md-2">
					<label>
						حق فنی
					</label>
				</div>
			</div>
			<div class="col-md-12 label-info labCashTblStyle">
				<div class="col-md-2">
					<label id="cashAmount"></label>
				</div>
				<div class="col-md-2">
					<label>
						نقدی
					</label>
				</div>
				<div class="col-md-2">
					<label id='patientDiff'>0</label>
				</div>
				<div class="col-md-2">
					<label >
						اضافه عهده بیمار
					</label>
				</div>
				<div class="col-md-2">
					<label id="total"></label>
				</div>
				<div class="col-md-2">
					<label>
						جمع کل
					</label>
				</div>
			</div>
			<div class="col-md-12 label-primary labCashTblStyle">
				<div class="col-md-2">
					<label id="cardAmount"></label>
				</div>
				<div class="col-md-2">
					<label>
						کارت
					</label>
				</div>
				<div class="col-md-2">
					<label id="discount"></label>
				</div>
				<div class="col-md-2">
					<label>
						تخفیف
					</label>
				</div>
				<div class="col-md-2">
					<label id="patientShare"></label>
				</div>
				<div class="col-md-2">
					<label>
						سهم بیمار
					</label>
				</div>

			</div>
			<div class="col-md-12 label-info labCashTblStyle">
				<div class="col-md-2">
					<label id="remainder"></label>
				</div>
				<div class="col-md-2">
					<label>
						باقیمانده
					</label>
				</div>
				<div class="col-md-2">
					<label id="payed"></label>
				</div>
				<div class="col-md-2">
					<label>
						پرداخت به بیمار
					</label>
				</div>
				<div class="col-md-2">
					<label id="insuranceShare"></label>
				</div>
				<div class="col-md-2">
					<label>
						سهم سازمان
					</label>
				</div>
			</div>
			<div class="col-md-12 label-primary labCashTblStyle">
				<div class="col-md-2">
					<label id="totalShare"></label>
				</div>
				<div class="col-md-2">
					<label>
						سهم کل
					</label>
				</div>
				<div class="col-md-2">
					<label></label>
				</div>
				<div class="col-md-2">
					<label></label>
				</div>
				<div class="col-md-2">
					<label></label>
				</div>
				<div class="col-md-2">
					<label></label>
				</div>
			</div>
		</fieldset>
	</div>
</div>

<style>
	.labTblStyle {
		border: 1px solid #a1a1a1;
		margin-left: 0 !important;
		margin-right: 0 !important;
		border-radius: 5px;
		padding: 5px 10px 5px 40px;
		background-color: white;
	}

	.labTblStyle:hover {
		background-color: beige;
	}

	.labCashTblStyle {
		border-bottom: 1px solid #b9b9b9
	}

	.labTestRegLbl {
		padding-left: 7px;
	}

	.form-control {
		text-align: right;
		height: 25px;
		border-radius: 3px;
	}

	.glyphicon {
		font-family: 'Glyphicons Halflings' !important;
	}

	#testName {
		text-align: left;
	}

	.table-title {
		text-align: center;
		border-bottom: 1px solid gray;
		color: white;
		background: linear-gradient(to bottom, rgba(133, 133, 133, 1) 0%, rgba(61, 60, 60, 1) 47%, rgba(0, 0, 0, 1) 49%, rgba(0, 0, 0, 1) 67%, rgba(18, 18, 18, 1) 68%, rgba(43, 43, 43, 1) 100%);
	}

	.label-info {
		background: linear-gradient(to bottom, rgba(212, 225, 241, 1) 29%, rgba(201, 218, 238, 1) 33%, rgba(228, 240, 253, 1) 100%);
	}

	.label-primary {
		background: white;
	}

	label {
		font-weight: 400;
		margin: 3px 0;
	}

	.field-row {
		margin-bottom: 7px;
		padding-left: 15px;
	}

	.btn {
		padding: 3px 10px;
	}

	.remove-button {
		border-radius: 20px;
		padding: 3px;
		width: 25px;
		height: 25px;
	}

	legend {
		color: white;
		margin: 0;
		text-align: center;
		background: linear-gradient(to bottom, rgba(133, 133, 133, 1) 0%, rgba(61, 60, 60, 1) 47%, rgba(0, 0, 0, 1) 49%, rgba(0, 0, 0, 1) 67%, rgba(18, 18, 18, 1) 68%, rgba(43, 43, 43, 1) 100%);
	}

	fieldset {
		border: 2px solid #E6E6E6;
		border-radius: 5px;
		margin-top: 1px;
	}

	.my-uk-container {
		margin: 5px 0px 5px 0px;
		padding: 0 15px 0 15px;
		direction: ltr;
		width: 100%;
		border: 1px solid gray;
	}

	.col-md-2 {
		padding: 0;
	}

	.lab-title {
		text-align: center;
		padding: 5px 0;
		margin-top: 20px;
		border-bottom: 2px solid #E6E6E6;
	}

	.lab-title input {
		margin-top: 3px;
	}

	.lab-title span {
		display: inline-block;
		margin-top: 8px;
	}

	#selectedTests {
		height: 300px;
		overflow-y: auto;
		width: 100%;
		padding: 5px;
	}

	.operations {
		padding: 10px 15px;
		text-align: right;
	}

	.pay {
		padding: 10px 15px;
	}

	.k-dropdown {
		max-width: 100%;
	}

	#paymentTable {
		width: 100%;
	}

	#paymentTable .glyphicon-remove {
		width: 14px;
		height: 14px;
		line-height: 14px;
		border-radius: 10px;
		background-color: red;
		color: white;
		text-align: center;
		cursor: pointer;
		font-size: 9px !important;
	}

	#paymentTable th, #paymentTable tr {
		text-align: center;
		border-bottom: 1px solid #b9b9b9;
	}

	#paymentTable tr:nth-child(even) {
		background: linear-gradient(to bottom, rgba(212, 225, 241, 1) 29%, rgba(201, 218, 238, 1) 33%, rgba(228, 240, 253, 1) 100%);
	}

	#paymentTable tr:nth-child(odd) {
		background: white;
	}

	.receipt {
		color: green;
	}

	.payment {
		color: red;
	}
</style>

<script>
	var price_haghe_paziresh={price:0,insuranceShare:0,patientShare:0,diff:0,hagheFani:0,ezafe_che_fe:0};
	
	
	
	var selectedTestsArray=[],
		selectedTestsMaxRowId,
		financialStatus={},
		payments=[],
		paymentTableMaxRowId,
		tempTestModel,
		hasLmpDefinition;
		
		financialStatus.patientDiff=0;
		financialStatus.received =0;
		financialStatus.remainder =0;
		
	function resetForm() {
		$('#selectedTests').html('');
		$('#testName').val('');
		$('#price').html('');
		$('#patientId').val('');
		$('#nationalCode').val('');
		$('#fileNumber').val('');
		$('#firstName').val('');
		$('#lastName').val('');
		$('#age').val('');
		$('#cellphone').val('');
		$('#phone').val('');
		$('#sampleCode').val('');
		$('#sexMale').prop('checked', false);
		$('#sexFemale').prop('checked', false);
		$('#birthYear').val('');
		$('#address').val('');
		$('#fatherName').val('');
		$('#medicalHistory').val('');
		$('#expirationDate').val('');
		$('#visitDate').val('');
		$('#insuranceOrganizationId').data("kendoDropDownList").select(0);
		$('#bookPage').val('');
		$('#bookNumber').val('');
		$('#lmp').val('');
		$('#doctorId').val('');
		$('#doctorName').val('');
		$('#doctorCode').val('');
		$('#prefix').val('');
		$('#specialtyId').val('');
		$('#specialtyName').val('');
		selectedTestsArray = [];
		selectedTestsMaxRowId = 0;
		financialStatus = {
			received: 0,
			payable: 0,
			payed: 0,
			cash: 0,
			card: 0,
			remainder: 0,
			totalShare: 0,
			discount: 0,
			total: 0,
			patientShare: 0,
			insuranceShare: 0,
			patientDiff:0
		};
		payments = [];
		paymentTableMaxRowId = 0;
		tempTestModel = null;
		hasLmpDefinition = false;
		$('#paymentTable > tbody').empty();
		updateFinancialStatus();
		updateLmp();
	}

	function addTest() {
		if (!tempTestModel || !tempTestModel.testId) {
			return;
		}
		var test = {
			row: 'row_' + selectedTestsMaxRowId,
			testId: tempTestModel.testId,
			testName: tempTestModel.testName,
			price: tempTestModel.price,
			openPrice: tempTestModel.insuranceOrganizations[0].openPrice,
			insuranceOrganizationId: tempTestModel.insuranceOrganizationId,
			insuranceOrganizations: tempTestModel.insuranceOrganizations,
			hasLmpDefinition: tempTestModel.hasLmpDefinition,
			responseTime:tempTestModel.responseTime
		};
		if(selectedTestsArray.length==0){
			var result2 = lookupPrice(tempTestModel.insuranceOrganizations, $('#insuranceOrganizationId').val());
			document.getElementById('hagh_paziresh').innerHTML=commaSeperator(result2.regPay_price);
			document.getElementById('hagh_fani').innerHTML=commaSeperator(result2.hagheFani);
			document.getElementById('ezafe_che_fe_lbl').innerHTML=commaSeperator(result2.ezafe_che_fe);
			
			price_haghe_paziresh={price:result2.regPay_price
									,insuranceShare:result2.regPay_insuranceShare
									,patientShare:result2.regPay_patientShare
									,diff:result2.regPay_diff
									,hagheFani:result2.hagheFani
									,ezafe_che_fe:result2.ezafe_che_fe};
		}
		selectedTestsArray.push(test);
		
		selectedTestsMaxRowId++;
		insertTest([test]);
	}

	function insertTest(tests) {
		for (var i = 0; i < tests.length; i++) {
			var test = tests[i];
			var selectedTests = document.getElementById('selectedTests');

			var selectedTest = document.createElement('div');
			selectedTest.className = 'row labTblStyle';

			var segment1 = document.createElement('div');
			segment1.className = 'col-md-2';

			var checkbox = document.createElement('input');
			checkbox.type = "checkbox";
			checkbox.id = test.row+'_chk_'+test.openPrice;
			checkbox.onclick = function () {
				var x=this.id.split('_');
				var find_test;
				
				if(this.checked==true){
					for (var i = 0; i < selectedTestsArray.length; i++) {
						if(selectedTestsArray[i].row==x[0]+'_'+x[1]){
							var result = lookupPrice(selectedTestsArray[i].insuranceOrganizations, 1);
							selectedTestsArray[i].price = result.price;
							selectedTestsArray[i].insuranceOrganizationId = result.insuranceOrganizationId;
							find_test=selectedTestsArray[i];
							break;
						}
					}
					
					var lbl=document.getElementById('lbl_pr_'+x[0]+'_'+x[1]);
					lbl.innerHTML=find_test.openPrice;
				}else{
					for (var i = 0; i < selectedTestsArray.length; i++) {
						if(selectedTestsArray[i].row==x[0]+'_'+x[1]){
							var result = lookupPrice(selectedTestsArray[i].insuranceOrganizations, $('#insuranceOrganizationId').val());
							selectedTestsArray[i].price = result.price;
							selectedTestsArray[i].insuranceOrganizationId = result.insuranceOrganizationId;
							find_test=selectedTestsArray[i];
							break;
						}
					}

					var lbl=document.getElementById('lbl_pr_'+x[0]+'_'+x[1]);
					lbl.innerHTML=find_test.price;
				}
				calculatePrice();
			};

			var removeButton = document.createElement('button');
			removeButton.className = 'btn btn-danger remove-button';
			removeButton.id = test.row;
			var removeButtonText = document.createElement('span');
			removeButtonText.className = 'glyphicon glyphicon-remove';
			removeButton.appendChild(removeButtonText);
			removeButton.onclick = function () {
				removeTest(this.id);
				calculatePrice();
				$(this).parent().parent().remove();
			};
			segment1.appendChild(removeButton);

			var segment2 = document.createElement('div');
			segment2.className = 'col-md-3';
			var priceLabel = document.createElement('Label');
			priceLabel.id ='lbl_pr_'+test.row;
			priceLabel.innerHTML = commaSeperator(test.price);
			segment2.appendChild(priceLabel);

			var segment3 = document.createElement('div');
			segment3.className = 'col-md-7';
			var testNameLabel = document.createElement('Label');
			testNameLabel.innerHTML = test.testId +' - '+test.testName;
			testNameLabel.className = 'labTestRegLbl';
			segment3.appendChild(checkbox);
			segment3.appendChild(testNameLabel);
			

			selectedTest.appendChild(segment3);
			selectedTest.appendChild(segment2);
			selectedTest.appendChild(segment1);
			selectedTests.appendChild(selectedTest);
		}

		calculatePrice();
		updateLmp();

		document.getElementById('testName').value = '';
		document.getElementById('price').innerHTML = '';
		tempTestModel = null;
	}
	function search4test(rowid){
		for (var i = 0; i < selectedTestsArray.length; i++) {
			if (selectedTestsArray[i].row==rowid) {
				return selectedTestsArray[i];
			}
		}
	
	}
	function updateLmp() {
		hasLmpDefinition = false;
		for (var i = 0; i < selectedTestsArray.length; i++) {
			if (selectedTestsArray[i].hasLmpDefinition) {
				hasLmpDefinition = true;
				break;
			}
		}

		if (hasLmpDefinition && $('#sexFemale').prop('checked')) {
			$('#lmp').prop('disabled', false);
		} else {
			$('#lmp').prop('disabled', true);
			$('#lmp').val('');
		}
	}

	function addPanel(panel) {
		for (var i = 0; i < panel.length; i++){
			createTempTestModel(panel[i]);
			addTest();
		}
	}

	function createTempTestModel(test) {
		tempTestModel = {
			testId: test.id,
			testName: test.label,
			insuranceOrganizations: test.insuranceOrganizations,
			haghePaziresh: test.haghePaziresh,
			hasLmpDefinition: test.hasLmpDefinition,
			responseTime: test.responseTime
		};

		var result = lookupPrice(tempTestModel.insuranceOrganizations, $('#insuranceOrganizationId').val());
		tempTestModel.price = result.price;
		tempTestModel.insuranceOrganizationId = result.insuranceOrganizationId;
	}

	function lookupPrice(insuranceOrganizations, insuranceOrganizationId) {
		for (var i = 0; i < insuranceOrganizations.length; i++) {
			if (insuranceOrganizations[i].insuranceOrganizationId == insuranceOrganizationId) {
				return {
					price: insuranceOrganizations[i].price,
					insuranceOrganizationId: insuranceOrganizationId,
					openPrice: insuranceOrganizations[i].openPrice,
					diffPrice: insuranceOrganizations[i].diffPrice,
					franshiz: insuranceOrganizations[i].franshiz,
					franshizPr: insuranceOrganizations[i].franshizPr,
					franshizPr1: insuranceOrganizations[i].franshizPr1,
					patientShare: insuranceOrganizations[i].patientShare,
					orgShare: insuranceOrganizations[i].orgShare,
					regPay_price: insuranceOrganizations[i].regPay_price,
					regPay_insuranceShare: insuranceOrganizations[i].regPay_insuranceShare,
					regPay_patientShare: insuranceOrganizations[i].regPay_patientShare,
					regPay_diff: insuranceOrganizations[i].regPay_diff,
					hagheFani: insuranceOrganizations[i].hagheFani,
					ezafe_che_fe:insuranceOrganizations[i].ezafe_che_fe
				};
			}
		}
		for (var i = 0; i < insuranceOrganizations.length && insuranceOrganizationId != 1; i++) {
			if (insuranceOrganizations[i].insuranceOrganizationId == 1) {
				return {
					price: insuranceOrganizations[i].price,
					insuranceOrganizationId: 1,
					openPrice: insuranceOrganizations[i].openPrice,
					diffPrice: insuranceOrganizations[i].diffPrice,
					franshiz: insuranceOrganizations[i].franshiz,
					franshizPr: insuranceOrganizations[i].franshizPr,
					franshizPr1: insuranceOrganizations[i].franshizPr1,
					patientShare: insuranceOrganizations[i].patientShare,
					orgShare: insuranceOrganizations[i].orgShare
				};
			}
		}
		return {
			price: 0,
			insuranceOrganizationId: 1
		};
	}

	$('#fileNumber').autocomplete({
		source: function (request, response) {
			$.ajax({
				url: '${pageContext.request.contextPath}/lab/operation/labRegistration/autoComplete/patient',
				type: 'GET',
				data: {fileNumber: $('#fileNumber').val()},
				dataType: 'json',
				success: function (data) {
					response(data);
				},
				error: function (result) {
					if (result.status == 401) {
						top.location.href = top.location.href;
					}
				}
			});
		},
		minLength: 0,
		select: fillPatientFields
	});

	$('#nationalCode').autocomplete({
		source: function (request, response) {
			$.ajax({
				url: '${pageContext.request.contextPath}/lab/operation/labRegistration/autoComplete/patient',
				type: 'GET',
				data: {nationalCode: $('#nationalCode').val()},
				dataType: 'json',
				success: function (data) {
					response(data);
				},
				error: function (result) {
					if (result.status == 401) {
						top.location.href = top.location.href;
					}
				}
			});
		},
		minLength: 0,
		select: fillPatientFields
	});

	function fillPatientFields(event, ui) {
		$('#patientId').val(ui.item.id);
		$('#nationalCode').val(ui.item.nationalCode);
		$('#firstName').val(ui.item.firstName);
		$('#lastName').val(ui.item.lastName);
		$('#fileNumber').val(ui.item.fileNumber);
		$('#age').val(ui.item.age);
		$('#cellphone').val(ui.item.cellPhone);
		$('#phone').val(ui.item.phone);
		$('#sampleCode').val(ui.item.sampleCode);
		if (ui.item.sex == 1) {
			$('#sexMale').prop('checked', true);
		} else if (ui.item.sex == 2) {
			$('#sexFemale').prop('checked', true);
		}
		$('#address').val(ui.item.address);
		$('#fatherName').val(ui.item.fatherName);
		$('#birthYear').val(ui.item.birthYear);
	}

	function calculatePrice() {
		var price = 0;
		for (var i = 0; i < selectedTestsArray.length; i++) {
			price += Number(selectedTestsArray[i].openPrice);
		}
		if(!price_haghe_paziresh.ezafe_che_fe){
			price_haghe_paziresh.ezafe_che_fe=0;
		}
		if(!price_haghe_paziresh.hagheFani){
			price_haghe_paziresh.hagheFani=0;
		}
		
		financialStatus.myTotaLSum = price+(price_haghe_paziresh.ezafe_che_fe*1)+ (price_haghe_paziresh.hagheFani*1)+(price_haghe_paziresh.price*1)+(price_haghe_paziresh.diff*1);
		updateFinancialStatus();
	}

	function addPayment() {
		var sum = $('#sum').val();
		if (!sum) {
			alertify.error('لطفا مبلغ را وارد کنید');
			$('#sum').focus();
			return;
		}

		var posId = $('#posId').val();
		if (!posId) {
			alertify.error('لطفا نوع پرداخت را انتخاب کنید');
			$('#posId').focus();
			return;
		}

		var type = $('#type').val();
		if (!type) {
			alertify.error('لطفا نوع پرداخت/دریافت را انتخاب کنید');
			$('#type').focus();
			return;
		}

		var payment = {
			rowId: paymentTableMaxRowId,
			posId: Number(posId),
			posName: $('#posId').data("kendoDropDownList").text(),
			type: Number(type),
			sum: Number(sum)
		};

		payments.push(payment);

		var row = $('<tr>');

		var column = $('<td>');
		column.html('<span class="glyphicon glyphicon-remove" onclick="removePayment(this, ' + paymentTableMaxRowId + ')"></span>');
		row.append(column);

		column = $('<td>');
		var className;
		if (payment.type == 1) { //Receipt
			className = 'receipt';
		} else { //Payment
			className = 'payment';
		}
		column.html('<span class="' + className + '">' + payment.sum + '</span>');
		row.append(column);

		column = $('<td>');
		column.html($('#posId').data("kendoDropDownList").text());
		row.append(column);

		column = $('<td>');
		column.html(payments.length);
		row.append(column);

		$('#paymentTable').append(row);

		$('#sum').val('');
		paymentTableMaxRowId++;

		updateFinancialStatus();
	}

	function removePayment(element, rowId) {
		$(element).parent().parent().remove();
		for (var i = 0; i < payments.length; i++) {
			if (payments[i].rowId == rowId) {
				payments.splice(i, 1);
			}
		}

		if (payments.length == 0) {
			paymentTableMaxRowId = 0;
		}

		updateFinancialStatus();
	}

	function updateFinancialStatus() {
		financialStatus.payed = 0;
		financialStatus.cash = 0;
		financialStatus.card = 0;
		financialStatus.total = 0;
		financialStatus.patientShare= 0;
		financialStatus.insuranceShare= 0;
		financialStatus.patientDiff = 0;
		for (var i = 0; i < payments.length; i++) {
			if (payments[i].type == 1) { //Receipt
				if (payments[i].type == 1) {
					financialStatus.cash += payments[i].sum;
				} else {
					financialStatus.card += payments[i].sum;
				}
			} else { //Payment
				financialStatus.payed += payments[i].sum;
			}
		}

		for (var i = 0; i < selectedTestsArray.length; i++) {
			var result = lookupPrice(selectedTestsArray[i].insuranceOrganizations, selectedTestsArray[i].insuranceOrganizationId);
			financialStatus.total += result.openPrice;
			financialStatus.patientDiff+=result.diffPrice;
			financialStatus.insuranceShare+=result.orgShare;
			financialStatus.patientShare+=result.patientShare;
			
		}
		financialStatus.patientDiff=(financialStatus.patientDiff*1)+(price_haghe_paziresh.diff*1);
		financialStatus.patientShare=(financialStatus.patientShare*1)+(price_haghe_paziresh.patientShare*1)+(price_haghe_paziresh.hagheFani*1);
		financialStatus.insuranceShare=(financialStatus.insuranceShare*1)+(price_haghe_paziresh.insuranceShare*1);
		financialStatus.payable=financialStatus.patientShare+financialStatus.patientDiff+(price_haghe_paziresh.ezafe_che_fe*1);//+(price_haghe_paziresh.hagheFani*1)
		if(financialStatus.payable>0){
			var mande10000=financialStatus.payable%10000;
			financialStatus.payable=financialStatus.payable-mande10000;
			mande10000=5000-mande10000;
			var addExtera=0;
			if(mande10000>=2500){
				addExtera=0;
			}else if(mande10000<2500 && mande10000>=-2000){
				addExtera=5000;
			}else{
				addExtera=10000;
			}
			financialStatus.payable=financialStatus.payable+addExtera;
		}
		$('#received').text(commaSeperator(financialStatus.received));
		$('#cashAmount').text(commaSeperator(financialStatus.cash));
		$('#cardAmount').text(commaSeperator(financialStatus.card));
		$('#payed').text(commaSeperator(financialStatus.payed));
		$('#payable').text(commaSeperator(financialStatus.payable));
		$('#remainder').text(commaSeperator(financialStatus.remainder));
		$('#totalShare').text(commaSeperator(financialStatus.totalShare));
		$('#discount').text(commaSeperator(financialStatus.discount));
		$('#total').text(commaSeperator(financialStatus.total));
		$('#patientShare').text(commaSeperator(financialStatus.patientShare));
		$('#insuranceShare').text(commaSeperator(financialStatus.insuranceShare));
		$('#patientDiff').text(commaSeperator(financialStatus.patientDiff));
	}
	

	function removeTest(rowId) {
		for (var i = 0; i < selectedTestsArray.length; i++) {
			if (selectedTestsArray[i].row == rowId) {
				selectedTestsArray.splice(i, 1);
			}
		}
		if(selectedTestsArray.length==0){
			document.getElementById('hagh_paziresh').innerHTML=0;
			price_haghe_paziresh={price:0,insuranceShare:0,patientShare:0,diff:0};
		}
		updateLmp();
	}

	function testNameKeypress(e) {
		if (e.keyCode == 13) {
			if ($('#testName').val().indexOf('*') == -1) {			
				$.get('${pageContext.request.contextPath}/lab/operation/labRegistration/searchTest/' + $('#testName').val(), function(data) {

					createTempTestModel(data);
					addTest();
				});
			}else{
				$.get('${pageContext.request.contextPath}/lab/operation/labRegistration/loadPanelByCode/' + $('#testName').val().replace('*', ''), function(panel) {
					if(panel && panel.length > 0) {
						addPanel(panel);
					} else {
						alertify.error('پنل موزد نظر پیدا نشد');
					}
				});
			}
		}
	}

	function sumKeypress(e) {
		if (e.keyCode == 13) {
			addPayment();
		}
	}

	function doctorIdKeypress(e) {
		if (e.keyCode == 13 && $('#doctorId').val().length > 0) {
			$.ajax({
				url: '${pageContext.request.contextPath}/lab/operation/labRegistration/loadDoctor',
				type: 'GET',
				data: {doctorId: $('#doctorId').val()},
				dataType: 'json',
				success: function (data) {
					if (data.error) {
						alertify.error(data.error);
					} else {
						$('#doctorId').val(data.id);
						$('#doctorName').val(data.name);
						$('#doctorCode').val(data.code);
						$('#prefix').val(data.prefix);
						$('#specialtyId').val(data.specialtyId);
						$('#specialtyName').val(data.specialtyName);
					}
				},
				error: function (result) {
					if (result.status == 401) {
						top.location.href = top.location.href;
					}
				}
			});
		}
	}

	function insuranceOrganizationCodeKeypress(e) {
		if (e.keyCode == 13 && $('#insuranceOrganizationCode').val().length > 0) {
			$.ajax({
				url: '${pageContext.request.contextPath}/lab/operation/labRegistration/loadInsurance',
				type: 'GET',
				data: {insuranceOrganizationCode: $('#insuranceOrganizationCode').val()},
				dataType: 'json',
				success: function (data) {
					if (data.error) {
						alertify.error(data.error);
					} else {
						$('#insuranceOrganizationId').data("kendoDropDownList").value(data.id);
						
						for (var i = 0; i < selectedTestsArray.length; i++) {
							var result = lookupPrice(selectedTestsArray[i].insuranceOrganizations, $('#insuranceOrganizationId').val());
							selectedTestsArray[i].price = result.price;
							selectedTestsArray[i].insuranceOrganizationId = result.insuranceOrganizationId;
						}
						
						var result_haghePaziresh=0;
						if(selectedTestsArray && selectedTestsArray.length>0){
							result_haghePaziresh = lookupPrice(selectedTestsArray[0].insuranceOrganizations, $('#insuranceOrganizationId').val());
						}
						
						price_haghe_paziresh=(result_haghePaziresh)?{price:result_haghePaziresh.regPay_price,insuranceShare:result_haghePaziresh.regPay_insuranceShare,patientShare:result_haghePaziresh.regPay_patientShare,diff:result_haghePaziresh.regPay_diff,hagheFani:result_haghePaziresh.hagheFani,ezafe_che_fe:result_haghePaziresh.ezafe_che_fe}:{price:0,insuranceShare:0,patientShare:0,diff:0,hagheFani:0,ezafe_che_fe:0};
						document.getElementById('hagh_paziresh').innerHTML=(price_haghe_paziresh)?commaSeperator(price_haghe_paziresh.price):0;
						document.getElementById('hagh_fani').innerHTML=(price_haghe_paziresh)?commaSeperator(price_haghe_paziresh.hagheFani):0;
						document.getElementById('ezafe_che_fe_lbl').innerHTML=(price_haghe_paziresh)?commaSeperator(price_haghe_paziresh.ezafe_che_fe):0;
						
						
						$('#selectedTests').html('');
						insertTest(selectedTestsArray);
					}
					
					
				},
				error: function (result) {
					if (result.status == 401) {
						top.location.href = top.location.href;
					}
				}
			});
		}
	}
	function testNameKeypress2(e) {
		if (e.keyCode == 13 && $('#testName').val().length > 0) {
			$.ajax({
				url: '${pageContext.request.contextPath}/lab/operation/labRegistration/loadDoctor',
				type: 'GET',
				data: {doctorId: $('#doctorId').val()},
				dataType: 'json',
				success: function (data) {
					if (data.error) {
						alertify.error(data.error);
					} else {
						$('#doctorId').val(data.id);
						$('#doctorName').val(data.name);
						$('#doctorCode').val(data.code);
						$('#prefix').val(data.prefix);
						$('#specialtyId').val(data.specialtyId);
						$('#specialtyName').val(data.specialtyName);
					}
				},
				error: function (result) {
					if (result.status == 401) {
						top.location.href = top.location.href;
					}
				}
			});
		}
	}

	$('#specialtyName').autocomplete({
		source: function (request, response) {
			$.ajax({
				url: '${pageContext.request.contextPath}/lab/operation/labRegistration/autoComplete/specialty',
				type: 'GET',
				data: {name: $('#specialtyName').val()},
				dataType: 'json',
				success: function (data) {
					response(data);
				},
				error: function (result) {
					if (result.status == 401) {
						top.location.href = top.location.href;
					}
				}
			});
		},
		minLength: 0,
		select: function (event, ui) {
			$('#specialtyId').val(ui.item.id);
		}
	});

	function customSave(sendCashDesk) {
		var data = {
			patientId: $('#patientId').val(),
			nationalCode: $('#nationalCode').val(),
			fileNumber: $('#fileNumber').val(),
			firstName: $('#firstName').val(),
			lastName: $('#lastName').val(),
			age: $('#age').val(),
			cellphone: $('#cellphone').val(),
			phone: $('#phone').val(),
			sampleCode: $('#sampleCode').val(),
			sex: $('input:radio[name=sex]:checked').val(),
			birthYear: $('#birthYear').val(),
			address: $('#address').val(),
			fatherName: $('#fatherName').val(),
			medicalHistory: $('#medicalHistory').val(),
			expirationDate: $('#expirationDate').val(),
			visitDate: $('#visitDate').val(),
			insuranceOrganizationId: $('#insuranceOrganizationId').val(),
			bookPage: $('#bookPage').val(),
			bookNumber: $('#bookNumber').val(),
			lmp: $('#lmp').val(),
			doctorId: $('#doctorId').val(),
			doctorName: $('#doctorName').val(),
			doctorCode: $('#doctorCode').val(),
			prefix: $('#prefix').val(),
			specialtyId: $('#specialtyId').val(),
			specialtyName: $('#specialtyName').val(),
			selectedTests: [],
			received: financialStatus.received,
			cash: financialStatus.cash,
			payed: financialStatus.payed,
			card: financialStatus.card,
			payable: financialStatus.payable,
			remainder: financialStatus.remainder,
			totalShare: financialStatus.totalShare,
			discount: financialStatus.discount,
			patientShare: financialStatus.patientShare,
			insuranceShare: financialStatus.insuranceShare,
			total: financialStatus.total,
			sendCashDesk: sendCashDesk
		};

		if (!sendCashDesk) {
			data.payments = [];

			if (payments.length == 0) {
				alertify.error('حداقل یک پرداخت انجام دهید');
				$('#sum').focus();
				return;
			}

			for (var i = 0; i < payments.length; i++) {
				data.payments.push({
					posId: payments[i].posId,
					posName: payments[i].posName,
					type: payments[i].type,
					sum: payments[i].sum
				});
			}
		}

		if (selectedTestsArray.length == 0) {
			alertify.error('حداقل یک آزمایش انتخاب کنید');
			$('#testName').focus();
			return;
		}
		var maxResTime=0;
		for (var i = 0; i < selectedTestsArray.length; i++) {
			if(maxResTime<selectedTestsArray[i].responseTime){
				maxResTime=selectedTestsArray[i].responseTime;
			}
			data.selectedTests.push({
				testId: selectedTestsArray[i].testId,
				price: selectedTestsArray[i].price,
				insuranceOrganizationId: selectedTestsArray[i].insuranceOrganizationId
			});
		}
		data.responseTime=maxResTime;
		if (!data.firstName) {
			alertify.error('لطفا نام بیمار را وارد کنید');
			$('#firstName').focus();
			return;
		}

		if (!data.lastName) {
			alertify.error('لطفا نام خانوادگی بیمار را وارد کنید');
			$('#lastName').focus();
			return;
		}
		if (!data.cellphone) {
			alertify.error('لطفا تلفن همراه را وارد کنید');
			$('#cellphone').focus();
			return;
		}

		if (!data.sex) {
			alertify.error('لطفا جنسیت را انتخاب کنید');
			return;
		}

		if (!data.insuranceOrganizationId) {
			alertify.error('لطفا نوع پذیرش را انتخاب کنید');
			$('#insuranceOrganizationId').focus();
			return;
		}

		if (!data.doctorName) {
			alertify.error('لطفا نام پزشک را وارد کنید');
			$('#doctorName').focus();
			return;
		}

		if (!data.specialtyName) {
			alertify.error('لطفا تخصص را وارد کنید');
			$('#specialtyName').focus();
			return;
		}

		$.ajax({
			url: '${pageContext.request.contextPath}/lab/operation/labRegistration/save',
			type: 'POST',
			data: JSON.stringify(data),
			dataType: 'json',
			contentType: 'application/json; charset=utf-8',
			success: function (data) {
				if (data.state == 'error') {
					for (var i = 0; i < data.errors.length; i++) {
						if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
							alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
						} else {
							alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
						}
					}
				} else if (data.state == 'success') {
					alertify.success(data.message);
					window.open('${pageContext.request.contextPath}/lab/operation/labRegistration/printByFactorId/' + data.factorId).print();
					resetForm();

				} else {
					alertify.error('خطای نامشخص در انجام عملیات');
				}
			},
			error: function (result) {
				if (result.status == 401) {
					top.location.href = top.location.href;
				}
			}
		});
	}
	

	$('#insuranceOrganizationId').kendoDropDownList({
		dataTextField: 'name',
		dataValueField: 'id',
		filter: 'contains',
		autoBind: true,
		dataSource: {
			serverFiltering: false,
			transport: {
				parameterMap: function (options) {
					return JSON.stringify(options);
				},
				read: {
					contentType: 'application/json',
					url: '<%= basePath %>/combo/loadAllInsuranceOrganizations',
					dataType: 'json'
				}
			}
		},
		change: function (e) {
			
			var index = this.selectedIndex,dataItem;
 
    		if (this.options.optionLabel && index > 0) {
          		index = index - 1;
    		}
    		dataItem = this.dataItem(index);
			for (var i = 0; i < selectedTestsArray.length; i++) {
				var result = lookupPrice(selectedTestsArray[i].insuranceOrganizations, $('#insuranceOrganizationId').val());
				selectedTestsArray[i].price = result.price;
				selectedTestsArray[i].insuranceOrganizationId = $('#insuranceOrganizationId').val();
			}
			var result_haghePaziresh=0;
			if(selectedTestsArray && selectedTestsArray.length>0){
				result_haghePaziresh = lookupPrice(selectedTestsArray[0].insuranceOrganizations, $('#insuranceOrganizationId').val());
			}
			
			price_haghe_paziresh=(result_haghePaziresh)?{price:result_haghePaziresh.regPay_price,insuranceShare:result_haghePaziresh.regPay_insuranceShare,patientShare:result_haghePaziresh.regPay_patientShare,diff:result_haghePaziresh.regPay_diff,hagheFani:result_haghePaziresh.hagheFani,ezafe_che_fe:result_haghePaziresh.ezafe_che_fe}:{price:0,insuranceShare:0,patientShare:0,diff:0,hagheFani:0,ezafe_che_fe:0};
			document.getElementById('hagh_paziresh').innerHTML=(price_haghe_paziresh)?commaSeperator(price_haghe_paziresh.price):0;
			document.getElementById('hagh_fani').innerHTML=(price_haghe_paziresh)?commaSeperator(price_haghe_paziresh.hagheFani):0;
			document.getElementById('ezafe_che_fe_lbl').innerHTML=(price_haghe_paziresh)?commaSeperator(price_haghe_paziresh.ezafe_che_fe):0;
			
			
			$('#selectedTests').html('');
			insertTest(selectedTestsArray);
		},
		index: 0
	});

	$('#type').kendoDropDownList({
		dataTextField: 'ComboCaption',
		dataValueField: 'ComboID',
		filter: 'contains',
		autoBind: true,
		dataSource: {
			serverFiltering: false,
			transport: {
				parameterMap: function (options) {
					return JSON.stringify(options);
				},
				read: {
					contentType: 'application/json',
					url: '<%= basePath %>/combo/loadTypes',
					dataType: 'json'
				}
			}
		},
		index: 0
	});

	$('#posId').kendoDropDownList({
		dataTextField: 'ComboCaption',
		dataValueField: 'ComboID',
		filter: 'contains',
		autoBind: true,
		dataSource: {
			serverFiltering: false,
			transport: {
				parameterMap: function (options) {
					return JSON.stringify(options);
				},
				read: {
					contentType: 'application/json',
					url: '<%= basePath %>/combo/loadAllPos',
					dataType: 'json'
				}
			}
		},
		index: 0
	});

	$("#expirationDate").persianDatepicker();
	$("#visitDate").persianDatepicker();
	$("#lmp").persianDatepicker();

	resetForm();
	
	function commaSeperator(x){
	 	return x.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
	}

	function changeFocus(e,element,element2){
	 	if (e.keyCode == 13){
	 		if(document.getElementById(element).disabled==true){
	 			document.getElementById(element2).focus();
	 		}else{
	 			document.getElementById(element).focus();
	 		}
	 	 	
	 	}
	}
	
	
</script>