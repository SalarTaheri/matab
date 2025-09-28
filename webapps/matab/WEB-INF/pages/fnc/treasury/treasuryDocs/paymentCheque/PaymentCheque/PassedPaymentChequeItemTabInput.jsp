<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-uk-form2-PassedPaymentChequeItem" >

       <input type="hidden" id="id" name="id" >
       <input type="hidden" id="cheque_Id" name="cheque_Id" >
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="small" name="passedDate" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.passedPaymentCheque.passedDate"/>			
			<base:testBox styleClass="small" dataIgnore="true" disabled="true" name="chequeSerial" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.passedPaymentCheque.chequeSerial"/>
		
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="normal" disabled="true" dataIgnore="true" name="bankAccountName" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.passedPaymentCheque.bankAccount_Id"/>
		</div>
		<base:accountAndFloatAccountPicker accountCodingFieldName="accountCoding_Id"
				floatAccount1FieldName="floatAccountLevel1_Id" floatAccount2FieldName="floatAccountLevel2_Id"
				floatAccount3FieldName="floatAccountLevel3_Id" floatAccount4FieldName="floatAccountLevel4_Id"
				accountCodingFieldKey="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.passedPaymentCheque.accountCoding_Id"  />
		    <div class="uk-grid uk-grid-preserve">
				<base:testBoxNumericEx styleClass="small" disabled="true" name="price" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.passedPaymentCheque.chequePrice"/>
		    </div>
			<div class="uk-grid uk-grid-preserve">
				<base:textArea name="description" key="com.artonis.fnc.treasury.payment.paymentBillTransferedCash.transferedDescription" height="25"> </base:textArea>
		   </div>
   </form>
