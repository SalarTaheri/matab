<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%><!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<html>
<head>
    <script src="<c:url value='/resources/jqueryui/jquery-ui-1.10.4.custom/development-bundle/jquery-1.10.2.js' />"></script>
    <script src="<c:url value='/resources/jquery-ui.js'/>"></script>
    <link href="<c:url value='/resources/jqueryui/jquery-ui-1.10.4.custom/development-bundle/themes/base/jquery-ui.css'/>" rel="stylesheet" />
    <script src="<c:url value='/resources/jqueryui/jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.js' />"></script>
    <link href="<c:url value='/resources/persianDatepicker-master/css/persianDatepicker-default.css'/>" rel="stylesheet" />
	<script src="<c:url value='/resources/jqueryui/jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.min.js'/>"></script>
    <script src="<c:url value='/resources/persianDatepicker-master/js/persianDatepicker.js'/>"></script>
    <script src="<c:url value='/resources/jsUtil/mehrSysDateUtil.js'/>"></script>
</head>
<div id="tableheadr" >
	<table width="100%" style=" color: #000000;background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#deefff), color-stop(100%,#98bede)); ">
        <tr style="width: 100%">
            <td width="10%">
                <label>تنظیم نوبت ویزیت</label>
            </td>
            <td width="20%">
            </td>
            <td width="10%">
            </td>
            <td width="15%">
            </td>
            <td width="20%">
            </td>
            <td width="12%" align="left">
            </td>
            <td width="20%" align="left">
            </td>
        </tr>
		<tr style="width: 100%">
			<td width="10%">
           		<button id="btntoday111" style=" margin-right: 5px; " class="button_example" type="button"><%=ResourceBoundleHolder.resourceBundle.getString("com.appointment.day")%></button>
            	<button id="btnweek1111" class="button_example" type="button"><%=ResourceBoundleHolder.resourceBundle.getString("com.appointment.week")%></button>
			</td>
            <td width="20%">
                <base:simpleLabel name="nameAndFamForAppointment" key="com.appointment.doctor"/>
                <select style="width: 80%" id="doctorCombo" onchange="reLoadOnDoctorCombo()">
                    <option value="-1">همه ی پزشکان</option>
                </select>
            </td>
			<td width="10%">
       			<base:simpleLabel name="countValCaption2" key="com.appointment.countValCaption"/>
                <label >&nbsp&nbsp</label>
				<label id="countValId" name="countVal" key="com.appointment.countValCaption"></label>
			</td>
            <td width="15%">
       			<base:simpleLabel name="countValCash" key="com.appointment.countValCashCaption"/>
                <label >&nbsp&nbsp</label>
				<label id="countValCash" name="countValCash" key="com.appointment.countValCashCaption"></label>
			</td>
			<td width="20%">
       			<base:simpleLabel name="nameAndFamForAppointment" key="action.search"/>
	       		<input type="text" name="nameAndFamForAppointment" id="nameAndFamForAppointment" class="text ui-widget-content ui-corner-all" style=" width: 70%; ">
			</td>
			<td width="12%" align="left">
				<input type="text" id="simpleText" placeholder="انتخاب تاریخ" style="width: 100%"/>
			</td>
			<td width="20%" align="left">
  				<button id="previousBtn" class="uk-icon-arrow-right uk-icon-small" onclick="previous()"></button>
	        	<button id="nextBtn" class="uk-icon-arrow-left uk-icon-small" onclick="next()"></button>
                <button class="button_example" id="btntoday" style="margin-left: 30px" onclick="toDayDate()"><%=ResourceBoundleHolder.resourceBundle.getString("com.appointment.today")%></button>
            </td>
		</tr>
	</table>
	<table id="appTableWeek" style="display:none" border="1" width="100%">
	</table>
</div>

<%--<div id="tableDiv" dir="rtl" style="overflow: auto;max-height: 500px;">--%>
<div id="tableDiv" dir="rtl">
    <table id="appTable" border="1" width="100%">
        <tr  id="tableHeader">
            <th id="timecol" width="10%"><%=ResourceBoundleHolder.resourceBundle.getString("com.appointment.time")%></th>
            <th width="90%"> <p id="crDate" dir="ltr"></p></th>
        </tr>
    </table>
    <table id="appTableWeek" style="display:none" border="1" width="100%">
    </table>
</div>
	
<div id="dialog-form" class="toPopup" title='<%=ResourceBoundleHolder.resourceBundle.getString("com.appointment.appintmentTime")%>' style="display:none">
    <form class="toPopup">
        <table  border="0" width="100%">
            <tr >
                <th id="labelCol" width="40%"  >
                    <base:simpleLabel name="doctor" key="com.appointment.doctor"/>
                </th>
                <th width="60%">
                    <label id="doctorTitleId" for="doctorTitle"></label>

                </th>
            </tr>

            <tr >
                <th id="labelCol" width="40%"  >
               		<base:simpleLabel name="nameAndFam" key="com.appointment.nameAndFamily"/>
                </th>
                <th width="60%">
                    <input type="text" name="nameAndFam" id="nameAndFam" class="text ui-widget-content ui-corner-all" style=" width: 100%; ">
                </th>
            </tr>
            <tr >
                <th id="labelCol" width="40%"  >
               		<base:simpleLabel name="fatherName" key="com.appointment.fatherName"/>
                </th>
                <th width="60%">
                    <input type="text" name="fatherName" id="fatherName" class="text ui-widget-content ui-corner-all" style=" width: 100%; ">
                </th>
            </tr>
            <tr>
                <th id="labelCol" width="40%" >
                    <input type="hidden" id="patientId">
                    <base:simpleLabel name="fileNumber" key="com.appointment.fileNumber"/>
                </th>
                <th width="60%">
                    <input disabled="disabled" type="text" name="fileNumber" id="fileNumber" class="text ui-widget-content ui-corner-all" style=" width: 100%; ">
                </th>
            </tr>
            <tr>
                <th id="labelCol" width="40%" >
                	<base:simpleLabel name="phone" key="com.appointment.phone"/>
                </th>
                <th width="60%">
                    <input type="text" name="phone" id="phone" value="" class="text ui-widget-content ui-corner-all" style=" width: 100%; ">
                </th>
            </tr>

            <tr>
                <th id="labelCol" width="40%" >
                	<base:simpleLabel name="cellPhone" key="com.appointment.cellPhone"/>
                </th>
                <th width="60%">
                    <input type="text" name="cellPhone" id="cellPhone" value="" class="text ui-widget-content ui-corner-all" style=" width: 100%; ">
                </th>
            </tr>

            <tr>
                <th id="labelCol" width="40%" >
                	<base:simpleLabel name="description" key="com.appointment.description"/>
                </th>
                <th width="60%">
                    <input type="text" name="description" id="description" value="" class="text ui-widget-content ui-corner-all" style=" width: 100%; ">
                </th>
            </tr>
        </table>
    </form>
</div>
<div id="dialogDoctorError" title="توجه">
    <p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>
        لطفا پزشک را انتخاب کنید</p>
</div>
<div id="visit-confirm" title="اخطار!" style="display: none">
  <p>
  	<span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>
  	آیا این بیمار به لیست بیماران آماده برای ویزیت فرستاده می شود؟
  </p>
</div>

<div id="remove-confirm" title="اخطار!" style="display: none">
  <p>
  	<span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>
		آیا این بیمار از لیست بیماران آماده برای ویزیت خارج شود؟
  </p>
</div>

<div id="already-visited"  style="display: none">
  <p>
  	<span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>
		این بیمار ویزیت شده است امکان دوباره ارسالی برای ویزیت وجود ندارد!
  </p>
</div>

<div id="visited"  style="display: none">
  <p>
  	<span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>
		این بیمار ویزیت شده است امکان خروج از صف ویزیت وجود ندارد!
  </p>
</div>

<div id="cancel-visited"  style="display: none">
  <p>
  	<span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>
		این بیمار ویزیت شده است امکان حذف وجود ندارد!
  </p>
</div>
<div id="changeTime-visited"  style="display: none">
  <p>
  	<span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>
		این بیمار ویزیت شده است امکان تغییر وقت ندارد!
  </p>
</div>

</body>
</html>
<style>

    #dialog-form {
        /* 	font-family: "lucida grande",tahoma,verdana,arial,sans-serif;
      background: none repeat scroll 0 0 #FFFFFF;
      border: 10px solid #ccc;
      border-radius: 3px 3px 3px 3px;
      color: #333333;
      display: none;
      font-size: 14px;
      left: 50%;
      margin-left: -402px;
      position: fixed;
      top: 20%;
      width: 800px;
      z-index: 2;
      background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(222,239,255,1)), color-stop(100%,rgba(152,190,222,1)));*/
        background: linear-gradient(to bottom, rgba(242,245,246,1) 0%,rgba(227,234,237,1) 37%,rgba(200,215,220,1) 100%);
    }
    #tableHeader{
        /* background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(222,239,255,1)), color-stop(100%,rgba(152,190,222,1))); */
        /* background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(184,225,252,1)), color-stop(10%,rgba(169,210,243,1)), color-stop(25%,rgba(144,186,228,1)), color-stop(37%,rgba(144,188,234,1)), color-stop(50%,rgba(144,191,240,1)), color-stop(51%,rgba(107,168,229,1)), color-stop(83%,rgba(162,218,245,1)), color-stop(100%,rgba(189,243,253,1))); */
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(235,241,246,1)), color-stop(50%,rgba(171,211,238,1)), color-stop(51%,rgba(137,195,235,1)), color-stop(100%,rgba(213,235,251,1))); /* Chrome,Safari4+ */
    }
    #appTable{
        background: linear-gradient(to bottom, rgba(242,245,246,1) 0%,rgba(227,234,237,1) 37%,rgba(200,215,220,1) 100%);


    }
    #body-content {
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(226,226,226,1)), color-stop(50%,rgba(219,219,219,1)), color-stop(51%,rgba(209,209,209,1)), color-stop(100%,rgba(254,254,254,1))); /* Chrome,Safari4+ */
        /* background-color: #ECEEF4; */


    }
    #timecol{
        text-align: -webkit-center;
    }
    #labelCol{
        text-align: left;
    }
        /*     #btntoday{
           background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(76,76,76,1)), color-stop(12%,rgba(89,89,89,1)), color-stop(25%,rgba(102,102,102,1)), color-stop(39%,rgba(71,71,71,1)), color-stop(50%,rgba(44,44,44,1)), color-stop(51%,rgba(0,0,0,1)), color-stop(60%,rgba(17,17,17,1)), color-stop(76%,rgba(43,43,43,1)), color-stop(91%,rgba(28,28,28,1)), color-stop(100%,rgba(19,19,19,1)));
           color: white;
           height: 30px;
           width: 60px;
       } */
    #btnweek,#btntoday{
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(76,76,76,1)), color-stop(12%,rgba(89,89,89,1)), color-stop(25%,rgba(102,102,102,1)), color-stop(39%,rgba(71,71,71,1)), color-stop(50%,rgba(44,44,44,1)), color-stop(51%,rgba(0,0,0,1)), color-stop(60%,rgba(17,17,17,1)), color-stop(76%,rgba(43,43,43,1)), color-stop(91%,rgba(28,28,28,1)), color-stop(100%,rgba(19,19,19,1)));
        color: white;
        height: 30px;
        width: 60px;
    }
    #nDateBtn,#pWeekBtn,#pDateBtn,#nWeekBtn{
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(184,225,252,1)), color-stop(10%,rgba(169,210,243,1)), color-stop(25%,rgba(144,186,228,1)), color-stop(37%,rgba(144,188,234,1)), color-stop(50%,rgba(144,191,240,1)), color-stop(51%,rgba(107,168,229,1)), color-stop(83%,rgba(162,218,245,1)), color-stop(100%,rgba(189,243,253,1)));
    }
    #nDateBtn:hover   {
        background: -webkit-linear-gradient(top, rgba(235,241,246,1) 0%,rgba(171,211,238,1) 50%,rgba(137,195,235,1) 51%,rgba(213,235,251,1) 100%); /* Chrome10+,Safari5.1+ */
    }
    #pWeekBtn:hover   {
        background: -webkit-linear-gradient(top, rgba(235,241,246,1) 0%,rgba(171,211,238,1) 50%,rgba(137,195,235,1) 51%,rgba(213,235,251,1) 100%); /* Chrome10+,Safari5.1+ */
    }
    #pDateBtn:hover   {
        background: -webkit-linear-gradient(top, rgba(235,241,246,1) 0%,rgba(171,211,238,1) 50%,rgba(137,195,235,1) 51%,rgba(213,235,251,1) 100%); /* Chrome10+,Safari5.1+ */
    }
    #nWeekBtn:hover   {
        background: -webkit-linear-gradient(top, rgba(235,241,246,1) 0%,rgba(171,211,238,1) 50%,rgba(137,195,235,1) 51%,rgba(213,235,251,1) 100%); /* Chrome10+,Safari5.1+ */
    }
    #btntoday:hover   {
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(174,188,191,1)), color-stop(50%,rgba(110,119,116,1)), color-stop(51%,rgba(10,14,10,1)), color-stop(100%,rgba(10,8,9,1))); /* Chrome,Safari4+ */
    }
    #btnweek:hover   {
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(174,188,191,1)), color-stop(50%,rgba(110,119,116,1)), color-stop(51%,rgba(10,14,10,1)), color-stop(100%,rgba(10,8,9,1))); /* Chrome,Safari4+ */
    }
    #tableheadr{
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(30,87,153,1)), color-stop(50%,rgba(41,137,216,1)), color-stop(51%,rgba(32,124,202,1)), color-stop(100%,rgba(125,185,232,1)));
    }
    .uk-panel-box{
        padding-left: 0px;
        padding-bottom: 5px;
        padding-top: 5px;
        border-bottom-width: 1px;
        border-right-width: 2px;
        border-top-width: 2px;
        padding-bottom: 2px;
    }
    .uk-panel {
        padding-bottom: 2px;
    }
    
    .button_example{
border:1px solid #72021c; -webkit-border-radius: 3px; -moz-border-radius: 3px;border-radius: 3px;font-size:12px;font-family:arial, helvetica, sans-serif; padding: 8px 10px 8px 10px; text-decoration:none; display:inline-block;text-shadow: -1px -1px 0 rgba(0,0,0,0.3);font-weight:bold; color: #FFFFFF;
 background-color: #a90329; background-image: -webkit-gradient(linear, left top, left bottom, from(#a90329), to(#6d0019));
 background-image: -webkit-linear-gradient(top, #a90329, #6d0019);
 background-image: -moz-linear-gradient(top, #a90329, #6d0019);
 background-image: -ms-linear-gradient(top, #a90329, #6d0019);
 background-image: -o-linear-gradient(top, #a90329, #6d0019);
 background-image: linear-gradient(to bottom, #a90329, #6d0019);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#a90329, endColorstr=#6d0019);
 
}

.button_example:hover{
 border:1px solid #450111;
 background-color: #77021d; background-image: -webkit-gradient(linear, left top, left bottom, from(#77021d), to(#3a000d));
 background-image: -webkit-linear-gradient(top, #77021d, #3a000d);
 background-image: -moz-linear-gradient(top, #77021d, #3a000d);
 background-image: -ms-linear-gradient(top, #77021d, #3a000d);
 background-image: -o-linear-gradient(top, #77021d, #3a000d);
 background-image: linear-gradient(to bottom, #77021d, #3a000d);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#77021d, endColorstr=#3a000d);
}
</style>
<script>
	idleTime = 0;
	selectionFlg=false;
	var globalThAddress='';
	var globalAppointmentDate='';
	var globalTdTime='';
    var saveAppId=-1;
    $.ajax({
        url: "${pageContext.request.contextPath}"+"/hrm/employee/employee/combo/loadAllDoctor",
        type:"GET",
        dataType:"json",
        contentType:"application/json; charset=utf-8",
        success: function (data) {
            $("#doctorCombo").append(data.data);
        },error:function(result){
            if(result.status==401){
                top.location.href=top.location.href;
            }
        }
    });

    $( "#dialogDoctorError" ).dialog({

        autoOpen: false,
        show: {
            effect: "slide",
            duration: 400
        },
        hide: {
            effect: "slide",
            duration: 400
        },
        buttons: {
            "تائید": function() {
                $( this ).dialog( "close" );
            }
        }

    });

    $( "#already-visited" ).dialog({

        autoOpen: false,
        show: {
            effect: "slide",
            duration: 400
        },
        hide: {
            effect: "slide",
            duration: 400
        },
        buttons: {
            "تائید": function() {
                $( this ).dialog( "close" );
            }
        }

    });

    $( "#cancel-visited" ).dialog({
        autoOpen: false,
        show: {
            effect: "slide",
            duration: 400
        },
        hide: {
            effect: "slide",
            duration: 400
        },
        buttons: {
            "تائید": function() {
                $( this ).dialog( "close" );
            }
        }

    });
    $( "#visited" ).dialog({
        autoOpen: false,
        show: {
            effect: "slide",
            duration: 400
        },
        hide: {
            effect: "slide",
            duration: 400
        },
        buttons: {
            "تائید": function() {
                $( this ).dialog( "close" );
            }
        }

    });

    $( "#changeTime-visited" ).dialog({
        autoOpen: false,
        show: {
            effect: "slide",
            duration: 400
        },
        hide: {
            effect: "slide",
            duration: 400
        },
        buttons: {
            "تائید": function() {
                $( this ).dialog( "close" );
            }
        }

    });

	//Increment the idle time counter every minute.
	var idleInterval = setInterval(timerIncrement, 60000); // 1 minute
	
	//Zero the idle timer on mouse movement.
	$(this).mousedown(function (e) {
	        idleTime = 0;
	});
	$(this).keypress(function (e) {
	        idleTime = 0;
	});
	    
	
	    
	$( "#dialog-form" ).dialog({
        autoOpen: false,
 		show: {
	        effect: "slide",
	        duration: 400
	    },
	    hide: {
	        effect: "slide",
	        duration: 400
	    },
        height: 300,
        width: 550,
        modal: true,
        buttons: {
            "قرار ویزیت": function() {
                var bValid = true;
                // allFields.removeClass( "ui-state-error" );

                if ( bValid ) {
                    //var tt= patientSpecView(document.forms[0].nameAndFam.value,
                    //        document.forms[0].fileNumber.value,
                    //       document.forms[0].phone.value,
                    //        document.forms[0].cellPhone.value);
                    
            		if((document.forms[0].nameAndFam.value).trim().length<1){
                    	window.alert("لطفا نام و نام خانوادگی را وارد کنید.");
                    	return;
                    }
                    
                    var data = {};
                    data.id=globalAppointmentId;
                    data.cellAddr = globalThAddress;//
                    data.tdTime = globalTdTime;
                    data.nameAndFam = document.forms[0].nameAndFam.value;
                    data.fileNumber = document.forms[0].fileNumber.value;
                    data.patientId = document.forms[0].patientId.value;
                    data.fatherName = document.forms[0].fatherName.value;
                    if(globalAppointmentDate==''){
                        dayForSearch=appGlobalDate.getFullYear()+"-"+(appGlobalDate.getMonth()+1)+"-"+appGlobalDate.getDate();
                        data.appDate = dayForSearch;
                    }else{
                        data.appDate = globalAppointmentDate;
                    }
                    data.phone=document.forms[0].phone.value;
                    data.cellPhone=document.forms[0].cellPhone.value;
                    data.doctorId=$("#doctorCombo").val();
                    data.doctorName=$("#doctorCombo option:selected").text();
                    data.description = document.forms[0].description.value;
                    //data.patientId = 1;
 
                    $.ajax({
                        url: "<c:url value='/' />" + "clinic/appointment/appointmentVisit/saveAppointment/"  ,
                        type:"POST",
                        data:JSON.stringify(data),
                        dataType:"json",
                        contentType:"application/json; charset=utf-8",
                        success: function (data) {
                            regState=!(document.forms[0].patientId.value=="");
                            makeCardAndAdd(data.id,globalThAddress,globalAppointmentDate,
                            				document.forms[0].patientId.value,document.forms[0].fileNumber.value,
                            				document.forms[0].nameAndFam.value,document.forms[0].phone.value,
                            				document.forms[0].cellPhone.value,null,null,regState,false,false,fasle,fasle,false,$("#doctorCombo").val(),
                                            $("#doctorCombo option:selected").text(),document.forms[0].fatherName.value,document.forms[0].description.value);
                            document.forms[0].nameAndFam.value="";
                            document.forms[0].fileNumber.value="";
                            document.forms[0].phone.value="";
                            document.forms[0].cellPhone.value="";
                            document.forms[0].patientId.value="";
                            document.forms[0].fatherName.value="";
                            document.forms[0].description.value="";

                        },
                        success:function(result){
                                saveAppId=result.id;
                        		reLoadAfterChange();
//                                $('html,body').animate({
//                                        scrollTop: $("#"+result.id).offset().top},
//                                  'slow');
                        	}
                        ,error:function(result){
                            if(result.status==401){
                                top.location.href=top.location.href;
                            }
                        }
                    });

                    $( this ).dialog( "close" );
                }
            },
            "انصراف": function() {
                document.forms[0].nameAndFam.value="";
                document.forms[0].fileNumber.value="";
                document.forms[0].phone.value="";
                document.forms[0].cellPhone.value="";
                document.forms[0].patientId.value="";
                document.forms[0].fatherName.value="";
                document.forms[0].description.value="";
                $( this ).dialog( "close" );
            }
        },
        close: function() {
            document.forms[0].nameAndFam.value="";
            document.forms[0].fileNumber.value="";
            document.forms[0].phone.value="";
            document.forms[0].cellPhone.value="";
            document.forms[0].patientId.value="";
            document.forms[0].fatherName.value="";
            document.forms[0].description.value="";
                $( this ).dialog( "close" );
        },
        open:function(event, ui) {
            $(".ui-autocomplete").css("position", "absolute");
            $(".ui-autocomplete").css("top", "100px");
            $(".ui-autocomplete").css("left", "100px");
            $(".ui-autocomplete").css("z-index", "99999999999999");

        }
    });
    
    $( "#dialog" ).dialog({
      autoOpen: false,
      show: {
        effect: "slide",
        duration: 1000
      },
      hide: {
        effect: "slide",
        duration: 1000
      }
    });

	$(".ui-autocomplete").css("z-index", "999999999999999");
	
	$( "#nameAndFam" ).autocomplete({
		minLength: 3,
        zIndex:9999,
	    source: function( request, response ) {
	        $.ajax({
	            url: "${pageContext.request.contextPath}"+"/clinic/appointment/appointmentVisit/autoCompelete/loadPatinent",
	            type:"POST",
	            data:JSON.stringify($('#nameAndFam').val()),
	            dataType:"json",
	            contentType:"application/json; charset=utf-8",
	            success: function (data) {
	                response( $.map( data, function( item ) {
                        var cellPhone;
                        if(item.cellPhon!=undefined){
                            cellPhone=item.cellPhon;
                        }else{
                            cellPhone='';
                        }
                        var tel1;
                        if(item.tel1!=undefined){
                            tel1=item.tel1;
                        }else{
                            tel1='';
                        }
	                    return {
	                        label: item.suggestCaption+' '+item.fileNumber+' '+item.fatherName+' '+cellPhone+' '+tel1 ,
	                        id: item.fileNumber+'_'+item.ac_id+'_'+item.tel1+'_'+item.cellPhon+'_'+item.fatherName,
	                        value: item.suggestCaption
	                    }
	                }));
	
	                //response(ArrArr);
	            },error:function(result){
	                if(result.status==401){
	                    top.location.href=top.location.href;
	                }
	            }
	        });
	    },
	    select: function( event, ui ) {
	        var allData= new Array();
	        allData= ui.item.id.split ('_');
	        $('#fileNumber').val(allData[0]);
	        $('#patientId').val(allData[1]);
	        $('#phone').val((allData[2]=='undefined')?'':allData[2]);
	        $('#cellPhone').val((allData[3]=='undefined')?'':allData[3]);
	        $('#fatherName').val((allData[4]=='undefined')?'':allData[4]);
  			selectionFlg=false;
	    }
	
	});
	
	$("#btntoday111").on('click', function (event) {
	 	dayViewHandler();
	 });

	 $("#btnweek1111").on('click', function (event) {
	 	weekViewHandler();
	 });
	
	
	var appGlobalDate=new Date();
	var weekViewFlg=false;
	var grgSumOfDays=Array(Array(0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365),Array(0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366));
	var hshSumOfDays=Array(Array(0, 31, 62, 93, 124, 155, 186, 216, 246, 276, 306, 336, 365), Array(0, 31, 62, 93, 124, 155, 186, 216, 246, 276, 306, 336, 366));
	var indexDay=0;
	document.getElementById("crDate").innerHTML=ToShamsi1(appGlobalDate.getFullYear(),(appGlobalDate.getMonth()+1),appGlobalDate.getDate(),"Long");
	dateForSearch=appGlobalDate.getFullYear()+"-"+(appGlobalDate.getMonth()+1)+"-"+appGlobalDate.getDate();


	 $("#simpleText, #simpleLabel").persianDatepicker({
	  onSelect : function(e) {
	  		var gDate=jalaliToGregorianFDate($("#simpleText").val());
	  		appGlobalDate.setDate(gDate[2]);
			appGlobalDate.setMonth(gDate[1]-1)
			appGlobalDate.setFullYear(gDate[0]);
			dayViewHandler();
	    }
	 });



	dayViewHandler();

    var currentCardSelectedInSearch="";
    var currentCardSelectedInSearchForWeek="";
	

	function weekViewHandler(){
		weekView(appGlobalDate);
	}
	function weekView(pivotDate){
		var wd=pivotDate;
		if(pivotDate.getDay()!=6){
			wd.setDate(pivotDate.getDate()-pivotDate.getDay()-1);
		}
		deleteRowWithTh('appTableWeek');
		makeEmptyWeekTable('appTableWeek',wd);
		var wd=pivotDate;
		if(pivotDate.getDay()!=6){
			wd.setDate(pivotDate.getDate()-pivotDate.getDay()-1);
		}


		localDateForSearch=wd.getFullYear()+"-"+(wd.getMonth()+1)+"-"+wd.getDate();
		var satDateForSearch=wd.getFullYear()+"-"+(wd.getMonth()+1)+"-"+wd.getDate();
		//sat
		loadDataForWeekView(localDateForSearch,2);
		


		wd.setDate(wd.getDate()+1);
		localDateForSearch=wd.getFullYear()+"-"+(wd.getMonth()+1)+"-"+wd.getDate();
        var sunDateForSearch=wd.getFullYear()+"-"+(wd.getMonth()+1)+"-"+wd.getDate();
		//sun
		loadDataForWeekView(localDateForSearch,3);

		
		wd.setDate(wd.getDate()+1);
		localDateForSearch=wd.getFullYear()+"-"+(wd.getMonth()+1)+"-"+wd.getDate();
        var monDateForSearch=wd.getFullYear()+"-"+(wd.getMonth()+1)+"-"+wd.getDate();
		//mon
		loadDataForWeekView(localDateForSearch,4);
		
		wd.setDate(wd.getDate()+1);
		localDateForSearch=wd.getFullYear()+"-"+(wd.getMonth()+1)+"-"+wd.getDate();
        var thrDateForSearch=wd.getFullYear()+"-"+(wd.getMonth()+1)+"-"+wd.getDate();
		//thr
		loadDataForWeekView(localDateForSearch,5);
		
		
		wd.setDate(wd.getDate()+1);
		localDateForSearch=wd.getFullYear()+"-"+(wd.getMonth()+1)+"-"+wd.getDate();
        var wedDateForSearch=wd.getFullYear()+"-"+(wd.getMonth()+1)+"-"+wd.getDate();
		//wnd
		loadDataForWeekView(localDateForSearch,6);
		
		
		wd.setDate(wd.getDate()+1);
		localDateForSearch=wd.getFullYear()+"-"+(wd.getMonth()+1)+"-"+wd.getDate();
        var thuDateForSearch=wd.getFullYear()+"-"+(wd.getMonth()+1)+"-"+wd.getDate();
		//thu
		loadDataForWeekView(localDateForSearch,7);
		
		
		wd.setDate(wd.getDate()+1);
		localDateForSearch=wd.getFullYear()+"-"+(wd.getMonth()+1)+"-"+wd.getDate();
        var friDateForSearch=wd.getFullYear()+"-"+(wd.getMonth()+1)+"-"+wd.getDate();
		//fri
		loadDataForWeekView(localDateForSearch,8);
        autoCompleteForSearchOnAppointmentForWeek(satDateForSearch,sunDateForSearch,monDateForSearch,thrDateForSearch,wedDateForSearch,thuDateForSearch,friDateForSearch);
        loadDataForWeekViewCount(satDateForSearch,sunDateForSearch,monDateForSearch,thrDateForSearch,wedDateForSearch,thuDateForSearch,friDateForSearch);
		weekViewFlg=true;
		//removeTable('appTable');
		var tbl=document.getElementById('appTable');
		tbl.style.display="none";
		var tblw = document.getElementById('appTableWeek');
		tblw.style.display="";
	}
	function removeTable(id){
        var tbl = document.getElementById(id);
        if(tbl) tbl.parentNode.removeChild(tbl);
    }
	
	function loadDataForWeekView(dateForSearchInput,cellIdx){
		$.getJSON("<c:url value='/' />" + "clinic/appointment/appointmentVisit/loadAppontment/" + dateForSearchInput +"/"+$("#doctorCombo").val(), function(data) {
			var nEmptyList=true;
			try{
				nEmptyList=!data[0].empty;
			}catch(e){
				nEmptyList=true;
			}
			var rwCounter=parseInt("${appmntCfg.rowCount}");
            rwCounter++;
			for(i=1;i<=rwCounter;i++){
				if(nEmptyList){
					for ( var j =0; j<data.length;j++) {
						if(data[j].cellAddr=="c_2_"+i){
							makeCardAndAddForWeek("wv_c_"+cellIdx+"_"+i,data[j].nameAndFam,data[j].id,data[j].visited);
						}
					}
				}
			}
			
		});

	
	}

	
	function loadCurrentData(dateForSearchInput){
		$.getJSON("<c:url value='/' />" + "clinic/appointment/appointmentVisit/loadAppontment/" + dateForSearchInput+"/"+$("#doctorCombo").val() , function(data) {
			var nEmptyList=true;
			try{
				nEmptyList=!data[0].empty;
			}catch(e){
				nEmptyList=true;
			}
			var rwCounter=parseInt("${appmntCfg.rowCount}")+1;
			for(i=1;i<=rwCounter;i++){
				if(nEmptyList){
					findAppointment(data,"c_2_"+i);
				}
			}
            if(saveAppId!=-1){
                $('html,body').animate({
                            scrollTop: $("#"+saveAppId).offset().top},
                        'slow');
                saveAppId=-1;
            }
			
		});		
		
		
		$.getJSON("<c:url value='/' />" + "clinic/appointment/appointmentVisit/loadAppontmentCount/" + dateForSearchInput +"/"+$("#doctorCombo").val(), function(data) {
			$("#countValId").text(data.countVal);
			$("#countValCash").text(data.countPaymentVal);
	     }).fail(function( jqxhr, textStatus, error ) {
	                if(jqxhr.status==401){
	                    top.location.href=top.location.href;
	                }
	     });		
	
	}
	function makeEmptyWeekTable(wTableId,wdInput){
        $("#nameAndFamForAppointment").val('');
		var tbl=document.getElementById(wTableId);
		//var tblHead=document.getElementById(wTableId).tHead;
		var localDate=wdInput;
		var headerbgcolor="-webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(235,241,246,1)), color-stop(50%,rgba(171,211,238,1)), color-stop(51%,rgba(137,195,235,1)), color-stop(100%,rgba(213,235,251,1)))";
		var colOddbgcolor="-webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(242,245,246,1)), color-stop(37%,rgba(227,234,237,1)), color-stop(100%,rgba(200,215,220,1)))";
		var colEvenbgcolor="#FFFFFF";
		
		var tbdyWeek=document.createElement('tbody');
		var tblHead=document.createElement('thead');
		tblHead.style.background=headerbgcolor;
		
		var th1 = document.createElement("th");
		th1.innerHTML = "ساعات";
		
		var dayFlg = new Array(0,0,0,0,0,0,0);
		var th2 = document.createElement("th");
		th2.innerHTML = ToShamsi1(localDate.getFullYear(),(localDate.getMonth()+1),localDate.getDate(),"Long");
		var compare=compareWithToday(localDate,today);
		dayFlg[0]=compare;
		var localDate2=localDate;
		th2.onclick = function () {
				localDate2.setDate(localDate2.getDate()-6);
				appGlobalDate.setDate(localDate2.getDate());
				appGlobalDate.setMonth(localDate2.getMonth())
				appGlobalDate.setFullYear(localDate2.getFullYear());
				dayViewHandler();
		};


		localDate.setDate(localDate.getDate()+1);
		var compare=compareWithToday(localDate,today);
		dayFlg[1]=compare;
		var localDate3=localDate;
		var th3 = document.createElement("th");
		th3.innerHTML = ToShamsi1(localDate.getFullYear(),(localDate.getMonth()+1),localDate.getDate(),"Long");
		th3.onclick = function () {
				localDate3.setDate(localDate3.getDate()-5);
				appGlobalDate.setDate(localDate3.getDate());
				appGlobalDate.setMonth(localDate3.getMonth())
				appGlobalDate.setFullYear(localDate3.getFullYear());
				dayViewHandler();
		};
		
		localDate.setDate(localDate.getDate()+1);
		var compare=compareWithToday(localDate,today);
		dayFlg[2]=compare;
		var localDate4=localDate;
		var th4 = document.createElement("th");
		th4.innerHTML = ToShamsi1(localDate.getFullYear(),(localDate.getMonth()+1),localDate.getDate(),"Long");
		th4.onclick = function () {
				localDate4.setDate(localDate4.getDate()-4);
				appGlobalDate.setDate(localDate4.getDate());
				appGlobalDate.setMonth(localDate4.getMonth())
				appGlobalDate.setFullYear(localDate4.getFullYear());
				dayViewHandler();
		};


		localDate.setDate(localDate.getDate()+1);
		var compare=compareWithToday(localDate,today);
		dayFlg[3]=compare;
		var th5 = document.createElement("th");
		var localDate5=localDate;
		th5.innerHTML = ToShamsi1(localDate.getFullYear(),(localDate.getMonth()+1),localDate.getDate(),"Long");
		th5.onclick = function () {
				localDate5.setDate(localDate5.getDate()-3);
				appGlobalDate.setDate(localDate5.getDate());
				appGlobalDate.setMonth(localDate5.getMonth())
				appGlobalDate.setFullYear(localDate5.getFullYear());
				dayViewHandler();
		};

		localDate.setDate(localDate.getDate()+1);
		var compare=compareWithToday(localDate,today);
		dayFlg[4]=compare;
		var th6 = document.createElement("th");
		var localDate6=localDate;
		th6.innerHTML = ToShamsi1(localDate.getFullYear(),(localDate.getMonth()+1),localDate.getDate(),"Long");
		th6.onclick = function () {
				localDate6.setDate(localDate6.getDate()-2);
				appGlobalDate.setDate(localDate6.getDate());
				appGlobalDate.setMonth(localDate6.getMonth())
				appGlobalDate.setFullYear(localDate6.getFullYear());
				dayViewHandler();
		};
		
		
		localDate.setDate(localDate.getDate()+1);
		var compare=compareWithToday(localDate,today);
		dayFlg[5]=compare;
		var localDate7=localDate;
		var th7 = document.createElement("th");
		th7.innerHTML = ToShamsi1(localDate.getFullYear(),(localDate.getMonth()+1),localDate.getDate(),"Long");
		th7.onclick = function () {
				localDate7.setDate(localDate7.getDate()-1);
				appGlobalDate.setDate(localDate7.getDate());
				appGlobalDate.setMonth(localDate7.getMonth())
				appGlobalDate.setFullYear(localDate7.getFullYear());
				dayViewHandler();
		};


		localDate.setDate(localDate.getDate()+1);
		var compare=compareWithToday(localDate,today);
		dayFlg[6]=compare;
		var localDate8=localDate;
		var th8 = document.createElement("th");
		//th8.style.background=headerbgcolor;
		th8.innerHTML = ToShamsi1(localDate.getFullYear(),(localDate.getMonth()+1),localDate.getDate(),"Long");
		th8.onclick = function () {
				appGlobalDate.setDate(localDate8.getDate());
				appGlobalDate.setMonth(localDate8.getMonth())
				appGlobalDate.setFullYear(localDate8.getFullYear());
				dayViewHandler();
		};


		tblHead.appendChild(th1);
		tblHead.appendChild(th2);
		tblHead.appendChild(th3);
		tblHead.appendChild(th4);
		tblHead.appendChild(th5);
		tblHead.appendChild(th6);
		tblHead.appendChild(th7);
		tblHead.appendChild(th8);
		tbl.appendChild(tblHead);
		
		var myTime = new Date(2000, 1, 1, 8, 0, 0, 0);
		var st="${appmntCfg.startTimeStr}";
		var et="${appmntCfg.endTimeStr}";
		var distance="${appmntCfg.distance}";

		var myStartTime = new Date(2000, 1, 1, st.split(":")[0], st.split(":")[1], 0, 0);
		var myEndTime = new Date(2000, 1, 1, et.split(":")[0], et.split(":")[1], 0, 0);
		var i=1;
		
		var sortableStr="";
		console.log(dayFlg);
		do{
			var td1 = document.createElement("td");
			td1.setAttribute('style', 'text-align: -webkit-center');
			td1.style.width="10%";
			td1.style.background=colOddbgcolor;
			
			//var compare=compareWithToday(date,today);
			
			if(i==1){
				td1.appendChild(document.createTextNode("خارج از نوبت"));
			}else{
				mStr3=myStartTime.getMinutes();
				tmpMM3=(mStr3.toString().length==1)?"0"+mStr3.toString():mStr3.toString();
				td1.appendChild(document.createTextNode(myStartTime.getHours()+":"+tmpMM3));
				 myStartTime.setTime(myStartTime.getTime()+parseInt(distance));
			}
			td1.id="wv_c_1_"+i;
			if(dayFlg[0]>-1){
					sortableStr=addString(sortableStr,"#wv_c_2_"+i);
			}
		   	if(dayFlg[1]>-1){
				sortableStr=addString(sortableStr,"#wv_c_3_"+i);
			}
			if(dayFlg[2]>-1){
				sortableStr=addString(sortableStr,"#wv_c_4_"+i);
			}
			if(dayFlg[3]>-1){
				sortableStr=addString(sortableStr,"#wv_c_5_"+i);
			}
			if(dayFlg[4]>-1){
				sortableStr=addString(sortableStr,"#wv_c_6_"+i);
			}
			if(dayFlg[5]>-1){
				sortableStr=addString(sortableStr,"#wv_c_7_"+i);
			}
			if(dayFlg[6]>-1){
				sortableStr=addString(sortableStr,"#wv_c_8_"+i);
			}

			var td2 = document.createElement("td");
			td2.style.width="10%";
			td2.style.background=colEvenbgcolor;
			td2.id="wv_c_2_"+i;
			if(dayFlg[0]>-1)
				td2.className="connectedSortable";

			var td3 = document.createElement("td");
			td3.style.width="10%";
			td3.style.background=colOddbgcolor;
			td3.id="wv_c_3_"+i;
			if(dayFlg[1]>-1)
				td3.className="connectedSortable";

			var td4 = document.createElement("td");
			td4.style.width="10%";
			td4.style.background=colEvenbgcolor;
			td4.id="wv_c_4_"+i
			if(dayFlg[2]>-1);
			td4.className="connectedSortable";

			var td5 = document.createElement("td");
			td5.style.width="10%";
			td5.style.background=colOddbgcolor;
			td5.id="wv_c_5_"+i;
			if(dayFlg[3]>-1)
			td5.className="connectedSortable";

			var td6 = document.createElement("td");
			td6.style.width="10%";
			td6.style.background=colEvenbgcolor;
			td6.id="wv_c_6_"+i;
			if(dayFlg[4]>-1)
			td6.className="connectedSortable";

			var td7 = document.createElement("td");
			td7.style.width="10%";
			td7.style.background=colOddbgcolor;
			td7.id="wv_c_7_"+i;
			if(dayFlg[5]>-1)
			td7.className="connectedSortable";

			var td8 = document.createElement("td");
			td8.style.width="10%";
			td8.style.background=colEvenbgcolor;
			td8.id="wv_c_8_"+i;
			if(dayFlg[6]>-1)
			td8.className="connectedSortable";

			var tr = document.createElement("tr");
			tr.appendChild(td1);
			tr.appendChild(td2);
			tr.appendChild(td3);
			tr.appendChild(td4);
			tr.appendChild(td5);
			tr.appendChild(td6);
			tr.appendChild(td7);
			tr.appendChild(td8);
			tr.style.height="40px";
			tbdyWeek.appendChild(tr);
			i++;
		}while(myStartTime<=myEndTime);
		tbl.appendChild(tbdyWeek);
		$( sortableStr ).sortable({
			connectWith: ".connectedSortable", scroll: false,
            start: function(event, ui){
                console.log('start:'+ui.item);
                $(ui.item).width("10%");
            },
			receive: function(e, ui) {
						var tmpDate =new Date();
						tmpDate.setDate(appGlobalDate.getDate());
						tmpDate.setFullYear(appGlobalDate.getFullYear());
						tmpDate.setMonth(appGlobalDate.getMonth());
						var cellIdOfWeekTable= new Array();
						cellIdOfWeekTable=$(this).attr('id').split("_");
						var dist=8-parseInt(cellIdOfWeekTable[2]);
						tmpDate.setDate(appGlobalDate.getDate() - dist);
						crntdayForChange=tmpDate.getFullYear()+"-"+(tmpDate.getMonth()+1)+"-"+tmpDate.getDate();

		    	    	var data = {};
					  	data.appointmentId = ui.item[0].id.replace("div_wv_","");//
						data.appointmentDate=crntdayForChange;
						data.cellAddress="c_2_"+cellIdOfWeekTable[3];

			        	$.ajax({
							url: "<c:url value='/' />" + "clinic/appointment/appointmentVisit/chaneAppointmentTimeInWeek/"  ,
						    type:"POST",
							data:JSON.stringify(data),
						    dataType:"json",
						    contentType:"application/json; charset=utf-8",
						    success: function (data) {
                                if(data.state=="error"){
                                    $("#changeTime-visited").dialog( "open" );
                                    $(ui.sender).sortable("cancel");
                                }
                            }
						    ,error:function(result){
	                            if(result.status==401){
	                                top.location.href=top.location.href;
	                            }else{
                                    $("#changeTime-visited").dialog( "open" );
                                }
                        	}
						});
		    }

    	}).disableSelection();

	}

    function reLoadOnDoctorCombo(){

        if(weekViewFlg){
            weekView(appGlobalDate);
        }else{
            //document.getElementById("crDate").innerHTML=ToShamsi1(yesterday.getFullYear(),(yesterday.getMonth()+1),yesterday.getDate(),"Long");
            dayForSearch=appGlobalDate.getFullYear()+"-"+(appGlobalDate.getMonth()+1)+"-"+appGlobalDate.getDate();
            autoCompleteForSearchOnAppointment(dayForSearch);
            deleteRow('appTable');
            makeEmptyTable(dayForSearch,appGlobalDate);
            loadCurrentData(dayForSearch);
        }

    }
	
	function makeEmptyTable(dateTable,date){
        $("#nameAndFamForAppointment").val('');
		var tbl=document.getElementById('appTable');
		var tbdy=document.createElement('tbody');
        tbdy.style.overflow="auto";
        tbdy.style.maxHeight="650px";
		var st="${appmntCfg.startTimeStr}";
		var et="${appmntCfg.endTimeStr}";
		var distance="${appmntCfg.distance}";

		var myTime = new Date(2000, 1, 1, st.split(":")[0], st.split(":")[1], 0, 0);
		var myStartTime = new Date(2000, 1, 1, st.split(":")[0], st.split(":")[1], 0, 0);
		var myEndTime = new Date(2000, 1, 1, et.split(":")[0], et.split(":")[1], 0, 0);
		var i=1;
		var sortableStr="";
		do{
	        var td1 = document.createElement("td");
	        td1.setAttribute('style', 'text-align: -webkit-center');
	        td1.style.width="10%";
	        
	        if(i==1){
	            sortableStr="#c_2_"+i;
	            td1.appendChild(document.createTextNode("خارج از نوبت"));
	        }else{
	            sortableStr+=(",#c_2_"+i);
	            mStr3=myStartTime.getMinutes();
	        	tmpMM3=(mStr3.toString().length==1)?"0"+mStr3.toString():mStr3.toString();
	            td1.appendChild(document.createTextNode(myStartTime.getHours()+":"+tmpMM3));
	            myStartTime.setTime(myStartTime.getTime()+parseInt(distance));
	        }
	
	        td1.id="c1_"+i;
	        
	
	        var td2 = document.createElement("td");
	        td2.style.width="90%"
	        td2.id="c_2_"+i;
	        td2.className="connectedSortable";
	        today=new Date();
	        var compare=compareWithToday(date,today);
	        if(compare!=-1){
	            td2.onclick = function () {
	           		var idAddress= new Array();
	        		idAddress= this.id.split ('_');
	        		tmp_adr=document.getElementById('c1_'+idAddress[2]).innerHTML;
	                addCard(this.id,dateTable,tmp_adr);
	            };
	        }
	
	
	        var tr = document.createElement("tr");
	        if (i % 2 == 0 ) {
	
	            tr.setAttribute('style', 'background-color:#FFFFFF');
	
	        }
	        if (i % 2 != 0 ) {
	
	            tr.setAttribute('style', 'background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(242,245,246,1)), color-stop(37%,rgba(227,234,237,1)), color-stop(100%,rgba(200,215,220,1)));');
	
	        }
	        tr.style.height="40px";
	        tr.appendChild(td1);
	        tr.appendChild(td2);
	        tbdy.appendChild(tr);
	        i++;
		}while(myStartTime<=myEndTime);
//        var tableScrollDiv = document.createElement("div");
//        tableScrollDiv.style.overflow="auto";
//        tableScrollDiv.style.maxHeight="650px";

//        tableScrollDiv.appendChild(tbdy);
//		tbl.appendChild(tableScrollDiv);
		tbl.appendChild(tbdy);
	$( sortableStr ).sortable({
		connectWith: ".connectedSortable",
		receive: function(e, ui) {
					var tmpDate = appGlobalDate;
					crntdayForChange=tmpDate.getFullYear()+"-"+(tmpDate.getMonth()+1)+"-"+tmpDate.getDate();
		        	var data = {};
				  	data.appointmentId = ui.item[0].id;//
					data.tdId = $(this).attr('id');
					data.appointmentDate = crntdayForChange;

		        	$.ajax({
									url: "<c:url value='/' />" + "clinic/appointment/appointmentVisit/chaneAppointmentTime/"  ,
						            type:"POST",
									data:JSON.stringify(data),
						            dataType:"json",
						            contentType:"application/json; charset=utf-8",
						            success: function (data) {
                                        if(data.state=="error"){
                                            $("#changeTime-visited").dialog( "open" );
                                            $(ui.sender).sortable("cancel");
                                        }
                                    },error:function(result){
			                            if(result.status==401){
			                                top.location.href=top.location.href;
			                            }else if(data.state=="error"){
                                            $("#changeTime-visited").dialog( "open" );
                                        }
                        			}
					});
		        	
		        	
		        	$("."+ui.item.closest('td').attr('id') ).sortable( "refresh" );
		    		$("."+ui.item.closest('td').attr('id') ).sortable( "refreshPositions" );
		    		
		    		
		    		
		    		
		      	 }
		      	 
    }).disableSelection();		
	
	}

    function compareWithToday(date,today){
        if(date.getFullYear()<today.getFullYear()){
           return -1;
        }else if (date.getFullYear()>today.getFullYear()){
            return 1;
        }else{
            if(date.getMonth()<today.getMonth()){
                return -1;
            }else if(date.getMonth()>today.getMonth()){
                return 1;
            }else{
                if(date.getDate()<today.getDate()){
                    return -1;
                }else if(date.getDate()>today.getDate()){
                    return  1;
                }
                else return 0;
            }
        }
    }

	function findAppointment(dayAppointmentData,cellKey){
	
		for ( var i =0; i<dayAppointmentData.length;i++) {
			if(dayAppointmentData[i].cellAddr==cellKey){
				 makeCardAndAdd(dayAppointmentData[i].id,
                    cellKey,
                    dayAppointmentData[i].appDate,
                    dayAppointmentData[i].patientId,
                    dayAppointmentData[i].fileNumber,
                    dayAppointmentData[i].nameAndFam,
                    dayAppointmentData[i].phone,
                    dayAppointmentData[i].cellPhone,
                    dayAppointmentData[i].cashVisitId,
                    dayAppointmentData[i].visitQueueId,
                    dayAppointmentData[i].registered,
                    dayAppointmentData[i].ready,
                    dayAppointmentData[i].payment,
                    dayAppointmentData[i].visited,
                    dayAppointmentData[i].canceled,
                    dayAppointmentData[i].waitingList,
                    dayAppointmentData[i].doctorId,
                    dayAppointmentData[i].doctorName,
                    dayAppointmentData[i].fatherName,
                    dayAppointmentData[i].description);
			}
		}
		return "";
	}

    function patientSpecView(nameAndFam,fileNumber,phone,cellPhone,doctorName,fatherName,description){
        if(typeof(fileNumber) == "undefined"){
          fileNumber="  ";
        }
        if(typeof(phone) == "undefined"){
          phone="  ";
        }
        if(typeof(cellPhone) == "undefined"){
          cellPhone="  ";
        }

        if(typeof(description) == "undefined"){
            description="  ";
        }
//        var spec="نام و نام خانوادگی :"+nameAndFam+"<br>";
        var spec="نام و نام خانوادگی :"+nameAndFam+"&nbsp&nbsp&nbsp&nbsp";

        if(typeof(fatherName) == "undefined"){
            fatherName="  ";
        }
        spec+="نام پدر:"+fatherName+"&nbsp&nbsp&nbsp&nbsp";
        spec+="   شماره پرونده:"+fileNumber+"&nbsp&nbsp";
        spec+="  تلفن همراه:"+cellPhone+"&nbsp&nbsp";
        spec+="تلفن ثابت:"+phone+"&nbsp&nbsp";
        spec+="توضیحات:"+description+"&nbsp&nbsp";

        return spec;
    }
	
	function pDate(){
		//indexDay--;
		var yesterday = appGlobalDate;
		yesterday.setDate(yesterday.getDate() - 1);
		document.getElementById("crDate").innerHTML=ToShamsi1(yesterday.getFullYear(),(yesterday.getMonth()+1),yesterday.getDate(),"Long");
		yesterdayForSearch=yesterday.getFullYear()+"-"+(yesterday.getMonth()+1)+"-"+yesterday.getDate();
        autoCompleteForSearchOnAppointment(yesterdayForSearch);
		d=yesterday;
		deleteRow('appTable');
		makeEmptyTable(yesterdayForSearch,yesterday);
		loadCurrentData(yesterdayForSearch);
	}
	function nDate(){
		//indexDay++;
		var yesterday = appGlobalDate;
		yesterday.setDate(yesterday.getDate() + 1);
		document.getElementById("crDate").innerHTML=ToShamsi1(yesterday.getFullYear(),(yesterday.getMonth()+1),yesterday.getDate(),"Long");
		yesterdayForSearch=yesterday.getFullYear()+"-"+(yesterday.getMonth()+1)+"-"+yesterday.getDate();
        autoCompleteForSearchOnAppointment(yesterdayForSearch);
		appGlobalDate=yesterday;
		deleteRow('appTable');
		makeEmptyTable(yesterdayForSearch,yesterday);
		loadCurrentData(yesterdayForSearch);
	}
	
	function next(){
		$("#simpleText").val("");
		if(weekViewFlg){
			nWeek();
		}else{
			nDate();
		}
	}
	
	function previous(){
		$("#simpleText").val("");
		if(weekViewFlg){
			pWeek();
		}else{
			pDate();
		}
	}
	
	function pWeek(){
		appGlobalDate.setDate(appGlobalDate.getDate() - 7);
		weekView(appGlobalDate);
	}
	function nWeek(){
		appGlobalDate.setDate(appGlobalDate.getDate() + 7);
		weekView(appGlobalDate);
	}
	
	
	function toDayDate(){
		$("#simpleText").val("");
		appGlobalDate=new Date();
		var yesterday = appGlobalDate;

		if(weekViewFlg){
			weekView(appGlobalDate);
		}else{
			document.getElementById("crDate").innerHTML=ToShamsi1(yesterday.getFullYear(),(yesterday.getMonth()+1),yesterday.getDate(),"Long");
			yesterdayForSearch=yesterday.getFullYear()+"-"+(yesterday.getMonth()+1)+"-"+yesterday.getDate();
			deleteRow('appTable');
			makeEmptyTable(yesterdayForSearch,yesterday);
			loadCurrentData(yesterdayForSearch);
			autoCompleteForSearchOnAppointment(yesterdayForSearch);
		}
	}
	
	function dayViewHandler(){
		if(weekViewFlg){
			var tbl=document.getElementById('appTable');
			tbl.style.display="";
			var tblw = document.getElementById('appTableWeek');
			tblw.style.display="none";
			weekViewFlg=false;
		}
		var yesterday = appGlobalDate;
		document.getElementById("crDate").innerHTML=ToShamsi1(yesterday.getFullYear(),(yesterday.getMonth()+1),yesterday.getDate(),"Long");
		yesterdayForSearch=yesterday.getFullYear()+"-"+(yesterday.getMonth()+1)+"-"+yesterday.getDate();
        autoCompleteForSearchOnAppointment(yesterdayForSearch);
		deleteRow('appTable');
		makeEmptyTable(yesterdayForSearch,yesterday);
		loadCurrentData(yesterdayForSearch);
	}

	function ToShamsi1(grgYear,grgMonth,grgDay,Format){
		var hshYear = grgYear-621;
		var hshMonth,hshDay;
		
		var grgLeap=grgIsLeap1 (grgYear);
		var hshLeap=hshIsLeap (hshYear-1);
		
		var hshElapsed;
		var grgElapsed = grgSumOfDays[(grgLeap ? 1:0)][grgMonth-1]+grgDay;
	
		var XmasToNorooz = (hshLeap && grgLeap) ? 80 : 79;
	
		if (grgElapsed <= XmasToNorooz)
		{
			hshElapsed = grgElapsed+286;
			hshYear--;
			if (hshLeap && !grgLeap)
				hshElapsed++;
		}
		else
		{
			hshElapsed = grgElapsed - XmasToNorooz;
			hshLeap = hshIsLeap (hshYear);
		}
	
		for (var i=1; i <= 12 ; i++)
		{
			if (hshSumOfDays [(hshLeap ? 1:0)][i] >= hshElapsed)
			{
				hshMonth = i;
				hshDay = hshElapsed - hshSumOfDays [(hshLeap ? 1:0)][i-1];
				break;
			}
		}
	
	
		if (Format=="Long")
			return hshDayName (hshDayOfWeek(hshYear,hshMonth,hshDay)) + "  " + hshDay + " " + calNames("hf", hshMonth-1) + " " + hshYear;
		else
			return hshYear + " /" + hshMonth + " /" + hshDay;
	}
	function grgIsLeap1 (Year){
		return ((Year%4) == 0 && ((Year%100) != 0 || (Year%400) == 0));
	}
	function hshIsLeap (Year){
		Year = (Year - 474) % 128;
		Year = ((Year >= 30) ? 0 : 29) + Year;
		Year = Year - Math.floor(Year/33) - 1;
		return ((Year % 4) == 0);
	}
	
	function hshDayOfWeek(hshYear, hshMonth, hshDay){
		var value;
		value = hshYear - 1376 + hshSumOfDays[0][hshMonth-1] + hshDay - 1;
		for (var i=1380; i<hshYear; i++){
			if (hshIsLeap(i)) value++;
		}
		for (var i=hshYear; i<1380; i++){
			if (hshIsLeap(i)) value--;
		}
		value=value%7;
		if (value<0) value=value+7;
		return (value);
	}
	
	function hshDayName(DayOfWeek)	{
		return calNames("df", DayOfWeek%7);
	}
 	
 	function calNames(calendarName, monthNo) {
  		switch (calendarName)
 		{
		   case "hf": return Array("فروردين", "ارديبهشت", "خرداد", "تير", "مرداد", "شهريور", "مهر", "آبان", "آذر", "دی", "بهمن", "اسفند")[monthNo];
		   case "ge": return Array(" January ", " February ", " March ", " April ", " May ", " June ", " July ", " August ", " September ", " October ", " November ", " December ")[monthNo];
		   case "gf": return Array("ژانویه", "فوریه", "مارس", "آوریل", "مه", "ژوثن", "ژوییه", "اوت", "سپتامبر", "اكتبر", "نوامبر", "دسامبر")[monthNo];
		   case "df": return Array("شنبه", "یک‌شنبه", "دوشنبه", "سه‌شنبه", "چهارشنبه", "پنج‌شنبه", "جمعه")[monthNo];
		   case "de": return Array("Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday")[monthNo];
	   }
  	}
  	
	function addCard(th1,appointmentDate,tdTime){

        if($("#doctorCombo").val()>-1){
            $("#doctorTitleId").text($("#doctorCombo option:selected").text());
        }else{
            $( "#dialogDoctorError" ).dialog( "open" );
            return;
        }
		globalTdTime=tdTime;
	 	globalThAddress=th1;
	 	globalAppointmentDate=appointmentDate;
	 	globalAppointmentId=-1;
	 	$('#nameAndFam').removeAttr('disabled');
	    $( "#dialog-form" ).dialog( "open" );
	}

    function visit(pntPatientId,appointmentId,visitQueueId,aTag_visit,doctorId){
    	
	   $( "#visit-confirm" ).dialog({
	      resizable: false,
	      height:180,
	      modal: true,
	      autoOpen: false,
	      show: {
			effect: "slide",
			duration: 400
		  },
		  hide: {
			effect: "slide",
			duration: 400
		  },
	      buttons: {
	        "بلی": function() {
	                var data = {};
	                data.patient_id = pntPatientId;
	                data.appointment_Id = appointmentId;
	                data.doctor_Id = doctorId;
	                $.ajax({
	                    url: "${pageContext.request.contextPath}"+"/clinic/appointment/appointmentVisit/ready" ,
	                    type:"POST",
	                    data:JSON.stringify(data),
	                    dataType:"json",
	                    contentType:"application/json; charset=utf-8",
	                    success: function (data) {
	                        if(data.state=="success"){
	                            aTag_visit.childNodes[0].nodeValue="خروج از صف ویزیت";
	                            aTag_visit.className ="uk-button-danger";
	                            aTag_visit.onclick =function(){ sentVisit(pntPatientId,appointmentId,data.visitQueueId,aTag_visit,doctorId)};
	                        }else if(data.state=="error"){
                                $("#already-visited").dialog( "open" );
                            }
	                        
	                    }
	                    ,error:function(result){
                            if(result.status==401){
                                top.location.href=top.location.href;
                            }else{
                                $("#already-visited").dialog( "open" );
                            }
                        }
	                });
	                $( this ).dialog( "close" );
	
	        },
	        "خیر": function() {
	          $( this ).dialog( "close" );
	          return;
	        }
	      }
	    });
    
    
	    $( "#visit-confirm" ).dialog( "open" );
    };

    function sentVisit(pntPatientId,appointmentId,visitQueueId,aTag_visit,doctorId){
    
       $( "#remove-confirm" ).dialog({
	      resizable: false,
	      height:180,
	      modal: true,
	      autoOpen: false,
	      show: {
			effect: "slide",
			duration: 400
		  },
		  hide: {
			effect: "slide",
			duration: 400
		  },
	      buttons: {
	        "بلی": function() {
	                var data = {};
	                data.visitQueue_Id = visitQueueId;
    	            data.appointment_Id = appointmentId;

                $.ajax({
                    url: "${pageContext.request.contextPath}"+"/clinic/appointment/appointmentVisit/removeReadyQueue" ,
                    type:"POST",
                    data:JSON.stringify(data),
                    dataType:"json",
                    contentType:"application/json; charset=utf-8",
                    success: function (data) {
                        if(data.state=="success"){
                            aTag_visit.childNodes[0].nodeValue="ویزیت";
                            aTag_visit.className ="uk-button-primary";
                            aTag_visit.onclick =function(){visit(pntPatientId,appointmentId,visitQueueId,aTag_visit,doctorId)};
                        }else if(data.state=="error"){
//                            for(var i=0; i<data.errors.length; i++){
//                                alertify.error( data.errors[i].Field + ":  " +  data.errors[i].Message);
//                            }
                            $( "#visited" ).dialog( "open" );
                        }
                    },error:function(result){
                            if(result.status==401){
                                top.location.href=top.location.href;
                            }
                        }
                });
                $( this ).dialog( "close" );
	
	        },
	        "خیر": function() {
	          $( this ).dialog( "close" );
	          return;
	        }
	      }
	    });
	    $( "#remove-confirm" ).dialog( "open" );
    }
 
function makeCardAndAdd(appointmentId,clkTd,appDate,pntPatientId,pntFileNumber,patientNF,
						phone,cellPhone,cashVisitId,visitQueueId,
						isRegistered,isReady,isPayment,isVisited,isCanceled,isWaitingList,doctorId,doctorName,fatherName,description){
    	var aTag_visit = document.createElement("button");
		aTag_visit.href="#";
		aTag_visit.id="visit-"+appointmentId;

        aTag_visit.setAttribute('style', 'padding-right: 5px; margin-left: 5px');
        if(!isReady){ //REGISTERD,FINANCE_REGISTERD_NOT_READY4VISIT
            aTag_visit.appendChild(document.createTextNode("ویزیت"));
            aTag_visit.className ="uk-button-primary";     
            if(isToday(appDate)){
                //todo visit should have cashtype
//                aTag_visit.onclick=function(){visit(pntPatientId,appointmentId,visitQueueId,aTag_visit,doctorId)};
            }
        }else if(isReady){//FINANCE_REGISTERD_READY4VISIT,READY4VISIT_NOT_FINANCE_REGISTERD
            aTag_visit.appendChild(document.createTextNode("خروج از صف ویزیت"));
			aTag_visit.className ="uk-button-danger";
            if(isToday(appDate)){
                //todo visit should have cashtype
//                aTag_visit.onclick=function(){sentVisit(pntPatientId,appointmentId,visitQueueId,aTag_visit,doctorId)};
            }

        }

    	var aTag_reg = document.createElement("button");
        if(isToday(appDate)){
        	aTag_reg.onclick = function (event) {
        		window.location="${pageContext.request.contextPath}"+"/clinic/patientr/patientr/editWP/appointmentId="+appointmentId;
        	}
        }
		aTag_reg.className ="uk-button-primary";
		aTag_reg.appendChild(document.createTextNode("تعریف بیمار"));
		aTag_reg.setAttribute('style', 'margin-left: 5px');
		
		var aTag_edit = document.createElement("button");
		aTag_edit.className ="uk-button-primary";
		aTag_edit.appendChild(document.createTextNode("ویرایش"));
		aTag_edit.href="#";
		aTag_edit.setAttribute('style', 'padding-right: 10px; margin-left: 5px');
		
		aTag_edit.onclick= function (event) {
	        document.forms[0].nameAndFam.value=patientNF;
			document.forms[0].fileNumber.value=pntFileNumber;
	        document.forms[0].phone.value=phone;
	        document.forms[0].cellPhone.value=cellPhone;
	        document.forms[0].fatherName.value=fatherName;
            if(description!=undefined){
                document.forms[0].description.value=description;
            }

			globalAppointmentId=appointmentId;
	        //$('#nameAndFam').attr('disabled','disabled');
			$( "#dialog-form" ).dialog( "open" );
    	};

    	var aTag_pay = document.createElement("button");
    	aTag_pay.className ="uk-button-primary"
    	aTag_pay.id ="pay-"+appointmentId;
		if(isToday(appDate)){
        	aTag_pay.onclick = function (event) {
        		<%--window.location="${pageContext.request.contextPath}"+"/clinic/cash/cashVisit/editWP/appointmentId="+appointmentId+"&payment="+isPayment;--%>
                if(isPayment){
                    isPayment=false;
                }else{
                    isPayment=true;
                }
                $.ajax({
                    url: "${pageContext.request.contextPath}"+"/clinic/appointment/appointmentVisit/payment/"+appointmentId  ,
                    type:"POST",
                    data:JSON.stringify(isPayment),
                    dataType:"json",
                    contentType:"application/json; charset=utf-8",
                    success: function (data) {
                        if(isPayment){
                            aTag_pay.innerHTML="پرداخت شده";
                            aTag_pay.parentElement.parentElement.setAttribute('style', 'background-color:#faf09a;width:100%');
                            $("#visit-"+aTag_pay.id.split('pay-')[1]).show();
                            aTag_visit.setAttribute("style",aTag_visit.getAttribute("style")+";visibility:visible");

                            var countVal=$("#countValCash").text();
                            countVal++;
                            $("#countValCash").text(countVal);

                        }else{
                            aTag_pay.innerHTML="پرداخت";
                            aTag_pay.parentElement.parentElement.setAttribute('style', 'background-color:#fafafa;width:100%');
                            if(!isReady){
                                $("#visit-"+aTag_pay.id.split('pay-')[1]).hide();
                                aTag_visit.setAttribute("style",aTag_visit.getAttribute("style")+";visibility:hidden");
                            }
                            var countVal=$("#countValCash").text();
                            countVal--;
                            $("#countValCash").text(countVal);
                        }
                    }
                    ,error:function(result){
                        if(result.status==401){
                            top.location.href=top.location.href;
                        }
                    }
                });

        	}
        	if(!isPayment){
            	aTag_pay.appendChild(document.createTextNode("پرداخت"));
                $("#visit-"+aTag_pay.id.split('pay-')[1]).hide();
                if(!isReady){
                    aTag_visit.setAttribute("style",aTag_visit.getAttribute("style")+";visibility:hidden");
                }
            }else{
            	aTag_pay.appendChild(document.createTextNode("پرداخت شده"));
                aTag_visit.setAttribute("style",aTag_visit.getAttribute("style")+";visibility:visible");
            }
        }else{
                aTag_pay.setAttribute('href',"#");
        }
		aTag_pay.setAttribute('style', 'padding-right: 5px; margin-left: 5px');
		
		var aTag_cancel = document.createElement("a");
		var imgTag_cancel = document.createElement("img");
		imgTag_cancel.src="<c:url value='/resources/images/delete/Actions-button-cancel-icon8.png'/>"
		aTag_cancel.className ="p-kanban-pin uk-panel-badge";
		aTag_cancel.href="#";
		aTag_cancel.appendChild(imgTag_cancel);
		aTag_cancel.onclick = function (event) {
			event.stopPropagation();
            if(!isPayment){
                ConfirmDialog("آیا مطمئن هستید ؟",appointmentId);
            }else{
                $.getJSON("<c:url value='/' />" + "/clinic/appointment/appointmentVisit/load/" + appointmentId , function(data) {
                    var total=data.doctorCost - (data.insurancePercent * data.doctorCost / 100)-data.discount;
                    console.log('total:'+total+' appointmentId:'+appointmentId);
                    var part1="مبلغ باز پرداخت ";
                    var part2=" تومان می باشد. آیا مطمین به حذف این قرار هستید؟";

                    ConfirmDialog(part1+total+part2,appointmentId);
                });
            }

		};
		var h3 = document.createElement("h3");
		h3.className ="uk-panel-title";
//		h3.appendChild(document.createTextNode(patientNF));
		h3.innerHTML=patientSpecView(patientNF,
                            pntFileNumber,
                            phone,
                            cellPhone,doctorName,fatherName,description);
		h3.setAttribute('style', 'margin-bottom: 0px;display:inline-block;');
		h3.id="h3_ID_"+appointmentId;

        var h3_doctorName = document.createElement("label");
        h3_doctorName.className ="uk-panel-title";
        h3_doctorName.innerHTML="دکتر "+doctorName;
        h3_doctorName.setAttribute('style', 'margin-bottom: 0px;color:blue;display:inline-block;');
        h3_doctorName.id="h3_doctorName_ID_"+appointmentId;
		
		var d5 = document.createElement("div");
		d5.className ="p-card-links";
		today=new Date();
	    var compare=compareWithToday(appGlobalDate,today);
        if(compare!=-1){
	        if(!isVisited){//VISITED_NOT_FINANCE_REGISTERD,FINANCE_REGISTERD_VISITED
	            d5.appendChild(aTag_edit);
	            d5.appendChild(aTag_cancel);
	        }
        	if(!isRegistered){
                if (isToday(appDate)){
                    d5.appendChild(aTag_pay);
                }
                d5.appendChild(aTag_reg);
			}else{
                if (isToday(appDate)){
                    d5.appendChild(aTag_pay);
                }
	        	if(isToday(appDate) && !isVisited){
//	        	if(isToday(appDate) ){
	           		d5.appendChild(aTag_visit);
	        	}
			}

		}

		var d3 = document.createElement("div");
		d3.className ="uk-panel uk-panel-box";
		/* d3.style.width ="100%"; */
			
		 d3.setAttribute('style', 'height: 100%');
		 d3.setAttribute('style', 'width: 100%');
		 
		 d3.appendChild(h3);

         d5.appendChild(h3_doctorName);
		 d3.appendChild(d5);

		var tstLbl1 = document.createElement("label");
		tstLbl1.appendChild(document.createTextNode("ویزیت"));

		
		var d1 = document.createElement("div");
		d1.id=appointmentId;
		d1.style.width ="90%";
		d1.className="p-kanban-card";
		d1.appendChild(d3);
		d1.onclick = function (event) {
				event.stopPropagation();
		};

        if(isPayment){
            d3.setAttribute('style', 'background-color:#faf09a;width:100%');
        }

	  	document.getElementById(clkTd).appendChild(d1);
        var compare=compareWithToday(appGlobalDate,today);
        if(isVisited || compare==-1){//VISITED_NOT_FINANCE_REGISTERD,FINANCE_REGISTERD_VISITED
            $( "#"+appointmentId ).sortable({
                cancel: ".ui-state-disabled"
            });

            $( "#h3_ID_"+appointmentId ).sortable({
                 connectWith: ".connectedSortable",
                placeholder: 'ui-state-highlight',
                start: function (e,ui){        // new lines to
                    $(ui.placeholder).slideUp(); // remove popping
                },                             // effect on start
                change: function (e,ui){
                        $(ui.placeholder).hide().slideDown();
                }
            }).disableSelection();
        }
    }

    function isToday(dateForSearch){
        var today=new Date();
        todayForSearch=today.getFullYear()+"-"+(today.getMonth()+1)+"-"+today.getDate();
        return todayForSearch==dateForSearch;
    }

    function makeCardAndAddForWeek(clkTd,patientNF,appointmentId,isVisited){
		var h3 = document.createElement("label");
		h3.id="h3_wv_"+appointmentId;
		h3.appendChild(document.createTextNode(patientNF));

		var d3 = document.createElement("div");
		d3.className ="uk-panel uk-panel-box";
		d3.style.width ="60%";
		d3.appendChild(h3);
		d3.id="div_wv_"+appointmentId;
	  	document.getElementById(clkTd).appendChild(d3);
        if(isVisited){
            $( "#div_wv_"+appointmentId ).sortable({
                cancel: ".ui-state-disabled"
            }).disableSelection();
            $( "#h3_wv_"+appointmentId ).sortable({
                cancel: ".ui-state-disabled"
            }).disableSelection();
            $( "#"+clkTd ).sortable({
                items: 'div:not(.div_wv_22)'
            });
        }

//        $( "#"+appointmentId ).sortable({
//            cancel: ".ui-state-disabled"
//        });
//
//        $( "#h3_ID_"+appointmentId ).sortable({
//            connectWith: ".connectedSortable",
//            placeholder: 'ui-state-highlight',
//            start: function (e,ui){        // new lines to
//                $(ui.placeholder).slideUp(); // remove popping
//            },                             // effect on start
//            change: function (e,ui){
//                $(ui.placeholder).hide().slideDown();
//            }
//        }).disableSelection();
    }

    
    function deleteRow(tableID) {
    	try {
            var table = document.getElementById(tableID);
            var rowCount = table.rows.length;
            for(var i=1; i<rowCount; i++) {
                var row = table.rows[i];
                table.deleteRow(i);
                rowCount--;
                i--;
            }
            }catch(e) {
                alert(e);
            }
        }
        
     function deleteRowWithTh(tableID) {
    	try {
            var table = document.getElementById(tableID);
			table.deleteTHead();
            var rowCount = table.rows.length;
            for(var i=0; i<rowCount; i++) {
                var row = table.rows[i];
                table.deleteRow(i);
                rowCount--;
                i--;
            }
            }catch(e) {
                alert(e);
            }
     }

	
	function ConfirmDialog(message,appointmentId){
    	$('<div></div>').appendTo('body')
                    .html('<div><h6>'+message+'</h6></div>')
                    .dialog({
                        modal: true, title: 'لغو قرار', zIndex: 10000, autoOpen: true,
                        width: 'auto', resizable: false,
                        show: {
					        effect: "slide",
					        duration: 400
					    },
					    hide: {
					        effect: "slide",
					        duration: 400
					    },
                        buttons: {
                            بلی: function () {
                            	$.ajax({
									url: "${pageContext.request.contextPath}"+"/clinic/appointment/appointmentVisit/cancelAppointment/"+appointmentId  ,
						            type:"POST",
									data:JSON.stringify($('#nameAndFam').val()),
						            dataType:"json",
						            contentType:"application/json; charset=utf-8",
						            success: function (data) {
                                        if(data.state=="error"){
                                            $("#cancel-visited").dialog( "open" );
                                        }else{
                                            deleteRow('appTable');
                                            var yesterday = appGlobalDate;
                                            yesterdayForSearch=yesterday.getFullYear()+"-"+(yesterday.getMonth()+1)+"-"+yesterday.getDate();
                                            deleteRow('appTable');
                                            makeEmptyTable(yesterdayForSearch,yesterday);
                                            loadCurrentData(yesterdayForSearch);
                                        }

						            
				            		}
				            		,error:function(result){
			                            if(result.status==401){
			                                top.location.href=top.location.href;
			                            }
                        			}
				        		});
	                             $(this).dialog("close");
                            },
                            خیر: function () {
                                $(this).dialog("close");
                            }
                        },
                        close: function (event, ui) {
                            $(this).remove();
                        }
                    });
    };
    function cancelVisitAndReturnCash(){

    }

    function autoCompleteForSearchOnAppointment(date){
        $( "#nameAndFamForAppointment" ).autocomplete({
            source: function( request, response ) {

                $.ajax({
                    url: "${pageContext.request.contextPath}"+"/clinic/appointment/appointmentVisit/autoCompelete/loadSearchPatient/"+date,
                    type:"POST",
                    data:JSON.stringify($('#nameAndFamForAppointment').val()),
                    dataType:"json",
                    contentType:"application/json; charset=utf-8",
                    success: function (data) {
                        if($('#nameAndFam').val()=="" && currentCardSelectedInSearch!="" ){
                            if($("#pay-"+currentCardSelectedInSearch[0].id).size()!=0 && $("#pay-"+currentCardSelectedInSearch[0].id)[0].innerHTML=="پرداخت شده"){
                                currentCardSelectedInSearch.children().css('background-color','#faf09a');
                            }else{
                                currentCardSelectedInSearch.children().css('background-color','');
                            }
                            currentCardSelectedInSearch="";
                        }
                        response( $.map( data, function( item ) {
                            return {
                                label: item.nameAndFam,
                                id: item.id,
                                value: item.nameAndFam
                            }
                        }));
                        //response(ArrArr);
                    }
                    ,error:function(result){
                            if(result.status==401){
                                top.location.href=top.location.href;
                            }
                        }
                });
            },
            minLength: 0,
            select: function( event, ui ) {
                $('html,body').animate({
                            scrollTop: $("#"+ui.item.id).offset().top},
                        'slow');
                //$("#"+ui.item.id).children().css('background-color','-webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(230,240,163,1)), color-stop(50%,rgba(210,230,56,1)), color-stop(51%,rgba(195,216,37,1)), color-stop(100%,rgba(219,240,67,1)))');
                $("#"+ui.item.id).children().css('background-color','rgb(166,180,71)');
                currentCardSelectedInSearch=$("#"+ui.item.id);
            }

        });

    }
    function autoCompleteForSearchOnAppointmentForWeek(satDate,sunDate,monDate,tueDate,wedDate,thuDate,friDate){
        $( "#nameAndFamForAppointment" ).autocomplete({
            source: function( request, response ) {

                $.ajax({
                    url: "${pageContext.request.contextPath}"+"/clinic/appointment/appointmentVisit/autoCompelete/loadSearchPatientWeek/"+satDate+"/"+sunDate+"/"+monDate+"/"+tueDate+"/"+wedDate+"/"+thuDate+"/"+friDate,
                    type:"POST",
                    data:JSON.stringify($('#nameAndFamForAppointment').val()),
                    dataType:"json",
                    contentType:"application/json; charset=utf-8",
                    success: function (data) {
                        if($('#nameAndFam').val()=="" && currentCardSelectedInSearchForWeek!=""){
                            currentCardSelectedInSearchForWeek.children().css('background-color','');
                            currentCardSelectedInSearchForWeek="";
                        }
                        response( $.map( data, function( item ) {
                            return {
                                label: item.nameAndFam,
                                id: item.id,
                                value: item.nameAndFam
                            }
                        }));
                        //response(ArrArr);
                    }
                    ,error:function(result){
                            if(result.status==401){
                                top.location.href=top.location.href;
                            }
                        }
                });
            },
            minLength: 0,
            select: function( event, ui ) {
                $('html,body').animate({
                            scrollTop: $("#div_wv_"+ui.item.id).offset().top},
                        'slow');
                $("#div_wv_"+ui.item.id).children().css('background-color','blue');
                currentCardSelectedInSearchForWeek=$("#div_wv_"+ui.item.id);
  				selectionFlg=false;
            }

        });

    }

	function reLoadAfterChange(){

	    dayForSearch=appGlobalDate.getFullYear()+"-"+(appGlobalDate.getMonth()+1)+"-"+appGlobalDate.getDate();
	    autoCompleteForSearchOnAppointment(dayForSearch);
	    deleteRow('appTable');
	    makeEmptyTable(dayForSearch,appGlobalDate);
	    loadCurrentData(dayForSearch);
	}
	
	
		function timerIncrement() {
	    idleTime = idleTime + 1;
	    if (idleTime > 1) { // 20 minutes
	        //location.reload();
	    }
	}
	
//	function loadDataForWeekViewCount(dateForSearchInput,cellIdx){
	function loadDataForWeekViewCount(satDate,sunDate,monDate,tueDate,wedDate,thuDate,friDate){

	    $.getJSON("<c:url value='/' />" + "clinic/appointment/appointmentVisit/loadAppontmentWeekCount/" +satDate+"/"+
                sunDate+"/"+monDate+"/"+tueDate+"/"+wedDate+"/"+thuDate+"/"+friDate+"/"+$("#doctorCombo").val() , function(data) {
            $("#countValId").text(data.countVal);
            $("#countValCash").text(data.countPaymentVal);
	    }).fail(function( jqxhr, textStatus, error ) {
	                if(jqxhr.status==401){
	                    top.location.href=top.location.href;
	                }
	     });
	
	}
	function addString(firstStr,secondStr){
		if(firstStr==""){
			return secondStr;
		}else{
		  	return firstStr+','+secondStr;
		}
	}
	$("#nameAndFam").keydown(function(e) {
		if(e.keyCode==13 ||e.keyCode==9) return;
		if(selectionFlg==false){
             //document.forms[0].nameAndFam.value="";
            document.forms[0].fileNumber.value="";
            document.forms[0].phone.value="";
            document.forms[0].cellPhone.value="";
            document.forms[0].patientId.value="";
            selectionFlg=true;
		}
	});
	

</script>