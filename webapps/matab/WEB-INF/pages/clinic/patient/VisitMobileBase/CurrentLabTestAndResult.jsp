<%@page import="org.springframework.web.util.UrlPathHelper" %>
<%@ page import="java.util.List" %>
<%@ page import="com.artonis.clinic.core.model.MedicalTest" %>
<%@ page import="com.artonis.clinic.core.model.MedicalTestVisitQueue" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<%@ page import="com.artonis.clinic.customize.view.UserLabTestItemView" %>
<%@ page import="com.mongodb.DBObject" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html;charset=UTF-8" %>

<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String areUShureDeleteRow = resource.getString("clinic.patientfile.confirm.delete.row");
    String areUShureAddLabTest = resource.getString("clinic.patientfile.confirm.add.new.labtest");
    List<String> idClassRemoveList = new ArrayList<String>();
    String visitQueueId = (String) request.getAttribute("visitQueueId");
%>

<div>
    <div>
        <div class="uk-width-1-1" id="drug-kanban-static" style=" height:100%">
            <label dir="ltr">All LabTest</label>
            <input type="hidden" id="p-labtestMultiSelect-current" style="direction:ltr; width: 100%; height:100% "/>
        </div>
        <div>
            <button name="Add" id="add" onclick="addClick()" title="Add">Add current LabTest</button>
        </div>
        <div id="tableDiv">
            <table id="table" height="100%" width="60%" style="text-align: center;background-color: #ffffff;" border="2" dir="ltr">
                <tr>
                    <th id="labTest" style="width: 40%">
                        lab test
                    </th>
                    <th id="values" style="width: 20%">
                        value
                    </th>
                    <th id="delete">
                        delete
                    </th>
                    <th id="highlightCurrentLabTest">
                        Highlight
                    </th>
                </tr>
            </table>
        </div>
        <div style="margin-top: 5px;">
			<!-- <button id="saveLabTestItemBtn" onclick="saveLabTestItem()" class="uk-button uk-button-success" disabled >Save Lab Test</button> -->
			<!-- <button id="addToLabTestReportBtn" onclick="addToLabTestReport()" class="uk-button uk-button-success" disabled >Add To Lab Test Report</button> -->
        </div>
        <div>
            <%-- <iframe id="labTestResultPopupId" width="100%" height="50%" align="middle" 
            			src="${pageContext.request.contextPath}/clinic/patient/visitMobileBase/popup/${patientId}">
            </iframe> --%>
        </div>
    </div>
    <br>

    <div id="dialog-f" title='select lab test' style="display:none;direction: ltr;height: 100% !important;">
        <form class="toPopup" style="direction: ltr">
            <%
                int rowPerColumn = 10;
                int column = 5;
                List<UserLabTestItemView> userLabTestList = (List<UserLabTestItemView>) request.getAttribute("userLabTestList");
                int index = 0;
                Long currentCoding = 0L;
                Long subCurrentCoding = 0L;
                Long previousCoding = 0L;
                if (userLabTestList == null || userLabTestList.size() == 0) {
            %>
            <table id="dialog-current-labtest-table"><%
                }
                for (UserLabTestItemView userLabTestItemView : userLabTestList) {
                    currentCoding=userLabTestItemView.getUser_labtest_id();
                    if (index == 0) {
                         if(currentCoding!=null){
                              previousCoding=currentCoding;
                         }
            %>
                <table id="dialog-current-labtest-table">
                    <tr id="current-labtest-coding-<%=currentCoding%>" >
			            <tr style="background-color: #9cf;">
			           		<td>
			                   <label for="<%=userLabTestItemView.getName()%>-group-customize"><span style="font-weight:bold"><%=userLabTestItemView.getName()%></span>
			                   </label>
			               </td>
			               <td></td>
			               <td></td>
			               <td></td>
			               <td></td>
			               <td></td>
			               <td></td>
			               <td></td>
			               <td></td>
			               <td></td>
			            </tr>
                        <td style="width: 15%" align="right">

                            <input type="checkbox" name="<%=userLabTestItemView.getMedicalTestName()%>" style=" opacity: 0; "
                                   id="<%=userLabTestItemView.getMedicalTest_id().toString()%>-current-labtest-checkbox"/>
                            <label for="<%=userLabTestItemView.getMedicalTest_id().toString()%>-current-labtest-checkbox"><%=userLabTestItemView.getMedicalTestName()%>
                            </label>
                        </td>
                        <td style="width: 5%">
                            <textarea rows="1" id="<%=userLabTestItemView.getMedicalTest_id().toString()%>-current-labtest-value" onkeyup="textArea_popup_onchange(this)"
                                      style="resize: none;width: 100%;"></textarea>
                        </td>
                        <%
                        } else if ((previousCoding == null && currentCoding != null) ||
                                (previousCoding != null && currentCoding == null) ||
                                ((previousCoding != null && currentCoding != null) && !previousCoding.equals(currentCoding))) {
                            previousCoding = currentCoding;
                            subCurrentCoding=0L;
                            int def = 0;
                            if (index % column != 0) {
                                def = column - (index % column);
                                index += column - (index % column);
                                if (def > 0) {
                                    for (int j = 0; j < def; j++) {%>
                        <td>&nbsp;</td><td>&nbsp;</td>
                        <%
                                    }
                                }

                            }
                        %>
                    </tr>
                    <tr id="current-labtest-coding-<%=currentCoding%>" >
			            <tr style="background-color: #9cf;">
			               <td>
			                   <label for="<%=userLabTestItemView.getName()%>-group-customize"><span style="font-weight:bold"><%=userLabTestItemView.getName()%></span>
			                   </label>
			               </td>
			               <td></td>
			               <td></td>
			               <td></td>
			               <td></td>
			               <td></td>
			               <td></td>
			               <td></td>
			               <td></td>
			               <td></td>
			            </tr>
                        <td style="width: 15%" align="right">

                            <input type="checkbox" name="<%=userLabTestItemView.getMedicalTestName()%>" style=" opacity: 0; "
                                   id="<%=userLabTestItemView.getMedicalTest_id().toString()%>-current-labtest-checkbox"/>
                            <%--title="<%=operation.getName()%>"><%=operation.getName()%>/>--%>
                            <label for="<%=userLabTestItemView.getMedicalTest_id().toString()%>-current-labtest-checkbox"><%=userLabTestItemView.getMedicalTestName()%>
                            </label>
                        </td>
                        <td style="width: 5%">
                            <textarea rows="1" id="<%=userLabTestItemView.getMedicalTest_id().toString()%>-current-labtest-value" onkeyup="textArea_popup_onchange(this)"
                                      style="resize: none;width: 100%;"></textarea>
                        </td>
                            <%
                    } else if (index % column == 0) {
                          String trId="";
                         if(subCurrentCoding==0){
                            subCurrentCoding++;
                            trId=String.valueOf(currentCoding)+"_"+String.valueOf(subCurrentCoding);
                            idClassRemoveList.add(String.valueOf(currentCoding));
                         }else {
                            subCurrentCoding++;
                            trId=String.valueOf(currentCoding)+"_"+String.valueOf(subCurrentCoding);
                            idClassRemoveList.add(String.valueOf(currentCoding)+"_"+String.valueOf(subCurrentCoding-1));
                         }
                    %>
                    <tr id="current-labtest-coding-<%=trId%>" >
                        <td style="width: 15%" align="right">
                            <input type="checkbox" name="<%=userLabTestItemView.getMedicalTestName()%>" style=" opacity: 0; "
                                   id="<%=userLabTestItemView.getMedicalTest_id().toString()%>-current-labtest-checkbox"/>
                            <label for="<%=userLabTestItemView.getMedicalTest_id().toString()%>-current-labtest-checkbox"><%=userLabTestItemView.getMedicalTestName()%>
                            </label>
                        </td>
                        <td style="width: 5%">
                            <textarea rows="1" id="<%=userLabTestItemView.getMedicalTest_id().toString()%>-current-labtest-value"  onkeyup='textArea_popup_onchange(this)'
                                      style="resize: none;width: 100%;"></textarea>
                        </td>
                        <%
                        } else if (index % column != 0 && index % column != column - 1) {
                        %>
                        <td style="width: 15%" align="right">

                            <input type="checkbox" name="<%=userLabTestItemView.getMedicalTestName()%>" style=" opacity: 0; "
                                   id="<%=userLabTestItemView.getMedicalTest_id().toString()%>-current-labtest-checkbox"/>
                            <label for="<%=userLabTestItemView.getMedicalTest_id().toString()%>-current-labtest-checkbox"><%=userLabTestItemView.getMedicalTestName()%>
                            </label>
                        </td>
                        <td style="width: 5%">
                            <textarea rows="1" id="<%=userLabTestItemView.getMedicalTest_id().toString()%>-current-labtest-value" onkeyup='textArea_popup_onchange(this)'
                                      style="resize: none;width: 100%;"></textarea>
                        </td>
                        <%
                        } else if (index % column == column - 1) {
                        %>
                        <td style="width: 15%" align="right">

                            <input type="checkbox" name="<%=userLabTestItemView.getMedicalTestName()%>"  style=" opacity: 0; "
                                   id="<%=userLabTestItemView.getMedicalTest_id().toString()%>-current-labtest-checkbox"/>
                            <label for="<%=userLabTestItemView.getMedicalTest_id().toString()%>-current-labtest-checkbox"><%=userLabTestItemView.getMedicalTestName()%>
                            </label>
                        </td>
                        <td style="width: 5%">
                            <textarea rows="1" id="<%=userLabTestItemView.getMedicalTest_id().toString()%>-current-labtest-value" onkeyup='textArea_popup_onchange(this)'
                                      style="resize: none;width: 100%;"></textarea>
                        </td>
                    </tr>
                    <%
                            }
                            index++;
                        }
                        if(subCurrentCoding==0){
                            idClassRemoveList.add(String.valueOf(currentCoding));
                        }else {
                            idClassRemoveList.add(String.valueOf(currentCoding)+"_"+String.valueOf(subCurrentCoding));
                        }
                    %>
                </table>
        </form>
    </div>
</div>
<div id="dialog-confirm-delete-current-labtest" style="display:none;direction: rtl;height: 100% !important;">
    <p><%=areUShureDeleteRow%>
    </p>
</div>
<div id="dialog-confirm-save-current-labtest" style="display:none;direction: rtl;height: 100% !important;">
    <p><%=areUShureAddLabTest%>
    </p>
</div>
<script>

function textArea_popup_onchange(e){
    var id=e.id.split('-current-labtest-value')[0];
    var checkBox=$("#"+id+"-current-labtest-checkbox");
    if(e.value.length>0){
        checkBox.attr('checked', true);
        checkBox.prop('checked', true);
    }else{
        checkBox.attr('checked', false);
        checkBox.prop('checked', false);
    }
}

function textArea_onKeyUp(e){
    $("#"+e.id+'-current-labtest-value').val(e.value);
    enableSaveLabTestItemBtnAndAddToLabTestReportBtn();
}

function selectAllCurrentLabTestCheckBox(e) {

    var checkBoxElementArray = $("#dialog-f").find(":checkbox");
    for (var i = 1; i < checkBoxElementArray.length; i++) {
        checkBoxElementArray[i].checked = e.checked;
    }
}

<% for (int i=0; i<idClassRemoveList.size(); i++) { %>
    $("#current-labtest-coding-" + "<%= idClassRemoveList.get(i) %>").removeClass();
<% } %>
function saveCurrentLabTest(newItemArray) {
    var data = {};
    data.newLabTestCurrentOrder = newItemArray;
    if (newItemArray.length > 0) {
        $.ajax({
            url:'${pageContext.request.contextPath}' + '/clinic/patient/visitMobileBase/saveMedicalTest/',
            contentType:"application/json; charset=utf-8",
            data:JSON.stringify(data),
            dataType:'json',
            type:'POST',
            success:function (data, success, xhr) {
                if (data.saveMedicalTest != undefined) {
                    var split = data.saveMedicalTest.split(';;;;');
                    if (split.length > 1) {
                        for (var i = 0; i < split.length - 1; i = i + 2) {

                            $('#table').append('<tr id="' + split[i] + '-row' + '"></td><td contente="true">' + split[i + 1] + '</td><td contente="true"> <textarea onkeyup="textArea_onKeyUp(this)" id="' + split[i] + '" style=" width: 100%;resize:none; "/></td><td><input type="button" value="delete" class="uk-button-mini uk-button-danger" onclick="deleteClick(this)" /></td><td><input type="checkbox" id="'+split[i]+'-currentLabtest-checkbox-highlight'+'"</td></tr>' + '');

                        }
                        initCurrentLabtestSelect2(split[1], split[0]);
                    }
                }


            },
            error:function (e) {
//                alert('Error121212: ' + e.responseText);
            }
        });
    }
}
var selectCurrentLabTestArrayElement=[];
var initCurrentLabState=true;
<%
if(!(request.getAttribute("labTestCurrent") instanceof String)){
List<MedicalTestVisitQueue> list = (List)request.getAttribute("labTestCurrent");
if(list!=null){
for(int i=0; i <list.size(); i++) {
MedicalTestVisitQueue medicalTestVisitQueue=list.get(i);
long medicalTestId=medicalTestVisitQueue.getMedicalTest_id();
String medicaltestname=medicalTestVisitQueue.getMedicalTestName();
String value=medicalTestVisitQueue.getValue();
%>
var medicaltestId = '<%=medicalTestId%>';
<%
 Boolean labTestIsHighlight=false;
 if(!(request.getAttribute("labTestResultWithValueList") instanceof String)){
    List<DBObject> labTestResultWithValueList = (List)request.getAttribute("labTestResultWithValueList");
    for (DBObject dbObject : labTestResultWithValueList) {
       if(dbObject.get("labTestId").equals(medicalTestId)){
           if(dbObject.get("labTestIsHighlight")!=null){
                labTestIsHighlight=(Boolean) dbObject.get("labTestIsHighlight");
           }
       }
    }
 }
%>
var medicaltestname = '<%=medicaltestname%>';
var labTestIsHighlight = '<%=labTestIsHighlight%>';
selectCurrentLabTestArrayElement[selectCurrentLabTestArrayElement.length]=medicaltestId;
var value = '<%=StringEscapeUtils.escapeEcmaScript(value)%>';
$('#table').append('<tr id="' + medicaltestId + '-row' + '"></td><td contente="true">' + medicaltestname + '</td><td contente="true"> <textarea onkeyup="textArea_onKeyUp(this)" id="' + medicaltestId + '" style=" width: 100%;resize: none; "><%=StringEscapeUtils.escapeEcmaScript(value)%></textarea></td><td><input type="button" value="delete" class="uk-button-mini uk-button-danger" onclick="deleteClick(this)" /></td><td><input type="checkbox" id="'+medicaltestId+'-currentLabtest-checkbox-highlight'+'"</td></tr>' + '');
if(labTestIsHighlight=='true'){
    $('#'+medicaltestId+'-currentLabtest-checkbox-highlight').prop('checked',true)
}
var allUserLabTest = $("#dialog-f").find(":checkbox");
for (var w = 0; w < allUserLabTest.length; w++) {
    if (allUserLabTest[w].id == medicaltestId + '-current-labtest-checkbox') {
        allUserLabTest[w].checked = true;
        $('#'+medicaltestId+'-current-labtest-value').val(value);
    }
}
<%

           }
  }
  }
%>
var cancelButtonCurrentLabTestOrderClick = false;
$(document).ready(function(){
	$("#dialog-f").dialog({
	    autoOpen:false,
	    show:{
	        effect:"slide",
	        duration:300
	    },
	    hide:{
	        effect:"slide",
	        duration:300
	    },
	    height:800,
	    width:900,
	    modal:true,
	    buttons:{
	        "ok":function () {
	            popupCurrentLabTestOkButton();
	            $(this).dialog("close");
	            enableSaveLabTestItemBtnAndAddToLabTestReportBtn();
	        },
	        "cancel":function () {
	            cancelButtonCurrentLabTestOrderClick = true;
	            $(this).dialog("close");
	        }
	    },
	    close:function (event, ui) {
	        if (event.which != undefined || cancelButtonCurrentLabTestOrderClick == true) {
	            cancelEventCurrentLabTest();
	            cancelButtonCurrentLabTestOrderClick = false;
	        }
	        $(this).dialog("close");
	    },
	    open:function (event, ui) {
	        arrayCheckedBoxBeforeOpenedCurrentLabTest = $("#dialog-f").find(":checkbox:checked");
	    }
	});
	//
	initCurrentLabtestSelect2();
});

$('#dialog-f textarea').keypress(function(e){
	if (e.keyCode == 13) {

		var index = $('#dialog-f textarea').index(this) + 1;
		$('#dialog-f textarea, #dialog-f+div button').eq(index).focus();

		e.preventDefault();
	}
});

$('#dialog-f textarea').focus(function(e){
	$('#dialog-f label').removeClass('hasFocus');
	var id = $(this).attr('id');
	id = id.replace('value', 'checkbox');
	$('#dialog-f label[for="' + id + '"]').addClass('hasFocus');
});

$('#dialog-f textarea').blur(function(e){
	var id = $(this).attr('id');
	id = id.replace('value', 'checkbox');
	$('#dialog-f label[for="' + id + '"]').removeClass('hasFocus');
});

$(document).ready(function(){
	$("#dialog-confirm-delete-current-labtest").dialog({
	    autoOpen:false,
	    show:{
	        effect:"slide",
	        duration:300
	    },
	    hide:{
	        effect:"slide",
	        duration:300
	    },
	    height:800,
	    width:800,
	    modal:true,
	    buttons:{
	        "Yes":function () {
	            if ($(this).data('contents') != undefined) {
	                deleteCurrentLabTestRow($(this).data('contents'));
	            } else if ($(this).data('e') != undefined) {
	                var id = $(this).data('e').choice.id;
	                var idStr="";
	                for(var j=0;j<id.length;j++){
	                    idStr+=id[j];
	                }
	                if(idStr.length>0){
	                    id=idStr;
	                }
	                $('#' +id + '-row').remove();
	                if ($('#' + id + '-operation-current-checkbox-rowOperation').length > 0) {
	                    $('#' + id + '-operation-current-checkbox-rowOperation').remove();
	                    var arrayCheckBox = $("#dialog-current-operation").find(":checkbox:checked");
	                    for (var i = 0; i < arrayCheckBox.length; i++) {
	                        if (arrayCheckBox[i].id == id + "-operation-current-checkbox") {
	                            $("#" + id + '-operation-current-checkbox').attr('checked', false);
	                            $("#" + id + '-operation-current-checkbox').prop('checked', false);
	                        }
	                    }
	                }
	            }
	            $(this).dialog("close");
	            enableSaveLabTestItemBtnAndAddToLabTestReportBtn();
	        },
	        "No":function () {
	            if ($(this).data('e') != undefined) {
	                selectCurrentLabtestOption($(this).data('e').choice.id);
	            }
	            $(this).dialog("close");
	        }
	    }
	});
});

$(document).ready(function(){
	$("#dialog-confirm-save-current-labtest").dialog({
	    autoOpen:false,
	    show:{
	        effect:"slide",
	        duration:300
	    },
	    hide:{
	        effect:"slide",
	        duration:300
	    },
	    height:800,
	    width:800,
	    modal:true,
	    buttons:{
	        "ok":function () {
	            var newItemArray = $(this).data('newItemArray');
	            var itemArray = [];
	            itemArray[0] = newItemArray[0];
	            saveCurrentLabTest(itemArray);
	            $(this).dialog("close");
	        },
	        "cancel":function () {
	            var newItemArray = $(this).data('newItemArray');
	            deleteCurrentLabTestOption(newItemArray[1]);
	            $(this).dialog("close");
	        }
	    }
	});
});

function deleteCurrentLabTestRow(contents) {
    $('#' + contents[1].lastChild.id + '-row').remove();
    var arrayCheckedLabTest = $("#dialog-f").find(":checkbox:checked");
    for (var i = 0; i < arrayCheckedLabTest.length; i++) {
        if (arrayCheckedLabTest[i].id == contents[1].lastChild.id + '-current-labtest-checkbox') {
            arrayCheckedLabTest[i].checked = false;
            $("#"+contents[1].lastChild.id+"-current-labtest-value").val("");
        }
    }
    var id = contents[1].lastChild.id;
    deleteCurrentLabTestOption(id);


}
function deleteCurrentLabTestOption(id) {
    var labTestIdSelect2Array = $("#p-labtestMultiSelect-current").select2('val');
    var newLabTestIdSelect2Array = [];
    var index = 0;
    for (var j = 0; j < labTestIdSelect2Array.length; j++) {
        if (id != labTestIdSelect2Array[j]) {
            newLabTestIdSelect2Array[index] = labTestIdSelect2Array[j];
            index++;
        }
    }
    $("#p-labtestMultiSelect-current").select2('val', newLabTestIdSelect2Array);
}

jQuery('body')
        .bind(
        'click',
        function (e) {
            if (
                    jQuery('#dialog-f').dialog('isOpen')
                            && !jQuery(e.target).is('.ui-dialog, a')
                            && !jQuery(e.target).closest('.ui-dialog').length
                            && event.target.nodeName != "BUTTON"
                    ) {
                popupCurrentLabTestOkButton();
                jQuery('#dialog-f').dialog('close');
            }
        }
);

var arrayCheckedBoxBeforeOpenedCurrentLabTest;
function cancelEventCurrentLabTest() {
    arrayCheckedBoxAfterCancel = $("#dialog-f").find(":checkbox:checked");
    for (var i = 0; i < arrayCheckedBoxAfterCancel.length; i++) {
        $("#" + arrayCheckedBoxAfterCancel[i].id).attr('checked', false);
        $("#" + arrayCheckedBoxAfterCancel[i].id).prop('checked', false);
    }

    for (var j = 0; j < arrayCheckedBoxBeforeOpenedCurrentLabTest.length; j++) {
        $("#" + arrayCheckedBoxBeforeOpenedCurrentLabTest[j].id).attr('checked', true);
        $("#" + arrayCheckedBoxBeforeOpenedCurrentLabTest[j].id).prop('checked', true);
    }

}

function popupCurrentLabTestOkButton() {
    var currentLabTestWithValueArray = $('#table').parent().find('textarea');
    var arrayCheckedLabTest = $("#dialog-f").find(":checkbox:checked");
    var selectedLabTestIds = $("#p-labtestMultiSelect-current").select2('val');
    for (var i = 0; i < arrayCheckedLabTest.length; i++) {
        var found = false;
        for (var j = 0; j < currentLabTestWithValueArray.length; j++) {
            if (arrayCheckedLabTest[i].id == currentLabTestWithValueArray[j].id + '-current-labtest-checkbox') {
                found = true;
                var textBoxValue = $("#" + currentLabTestWithValueArray[j].id + "-current-labtest-value").val();
                $('#'+currentLabTestWithValueArray[j].id).val(textBoxValue);
                break;
            }
        }
        if (found == false && arrayCheckedLabTest[i].id != 'all-select-c-labtest-checkbox') {
            var id = arrayCheckedLabTest[i].id.split('-current-labtest-checkbox')[0];
            var textBoxValue = $("#" + id + "-current-labtest-value").val();
            $('#table').append('<tr id="' + arrayCheckedLabTest[i].id.split('-current-labtest-checkbox')[0] + '-row' + '"></td><td contente="true">' + arrayCheckedLabTest[i].name + '</td><td contente="true"> <textarea onkeyup="textArea_onKeyUp(this)" style="width:100%;resize: none;" id="' + arrayCheckedLabTest[i].id.split('-current-labtest-checkbox')[0] + '" style=" width: 100%; ">'+textBoxValue+'</textarea></td><td><input type="button" value="delete" class="uk-button-mini uk-button-danger" onclick="deleteClick(this)" /></td><td><input type="checkbox" id="'+arrayCheckedLabTest[i].id.split('-current-labtest-checkbox')[0]+'-currentLabtest-checkbox-highlight'+'"</td></tr>' + '');
        }
    }

    for (var w = 0; w < currentLabTestWithValueArray.length; w++) {
        var f = false;
        for (x = 0; x < arrayCheckedLabTest.length; x++) {
            if (currentLabTestWithValueArray[w].id + '-current-labtest-checkbox' == arrayCheckedLabTest[x].id) {
                f = true;
                break;
            }
        }
        if (f == false) {
            for (var l = 0; l < selectedLabTestIds.length; l++) {
                if (currentLabTestWithValueArray[w].id == selectedLabTestIds[l]) {
                    f = true;
                    break;
                }
            }
            if (f == false) {
                $('#' + currentLabTestWithValueArray[w].id + '-row').remove();
            }
        }
    }

}

function deleteClick(th) {
    var contents = $(th).parent().parent().find('td[contente=true]');
    if (contents[1].lastChild.value.trim().length > 0) {
        $("#dialog-confirm-delete-current-labtest").data('contents', contents).dialog("open");
    } else {
        deleteCurrentLabTestRow(contents);
    }
}
function addClick() {

    $("#dialog-f").dialog("open");
    $("#dialog-f").find(":checkbox:checked");

}

var addNotShowLabTest = [];
function initCurrentLabtestSelect2(deleteId, addId) {
    var url=window.location.href;
     var isEditMode=false;
     if(url.indexOf("null")==-1){
     isEditMode=true;
     }
    var urlLoadOperation = "clinic/medicaltest/medicalTest/loadCurrentMedicalTestChildWithoutMine";
    if(isEditMode==true){
     urlLoadOperation+='/'+'${visitId}';
     }
    var preload_data_labtest;

    $.getJSON("<c:url value='/' />" + urlLoadOperation, function (data) {

        preload_data_labtest = data;
//        currentOperationpreload_data = data;
//        currentOperationMultiSelectFD=data;

        var preload_data2 = [];


        if (deleteId != undefined) {

            addNotShowLabTest.push({ComboID:addId, ComboCaption:deleteId});

            $.each(addNotShowLabTest, function () {

                preload_data_labtest.push({ComboID:this.ComboID, ComboCaption:this.ComboCaption });

            });
        }


        $.each(preload_data_labtest, function () {

            preload_data2.push({id:this.ComboID, text:this.ComboCaption });

        });


        $('#p-labtestMultiSelect-current').select2({
            multiple:true,
            query:function (query) {
                var data = {results:[]};

                $.each(preload_data_labtest, function () {
                    if (query.term.length == 0 || this.ComboCaption.toUpperCase().indexOf(query.term.toUpperCase()) >= 0) {
                        data.results.push({id:this.ComboID, text:this.ComboCaption });
                    }
                });

                query.callback(data);
            },
            createSearchChoice:function (term, data) {
                if ($(data).filter(
                        function () {
                            return this.text.localeCompare(term) === 0;
                        }).length === 0) {
                    return {id:term + '-newMehrsysLabtest', text:term};
                }
            }, initSelection:function (element, callback) {
                if (element.val() == "-1") {
                    element.val("");
                    return;
                }
                var data = [];
                $(element.val().split(",")).each(function () {
                    for (var i = 0; i < preload_data2.length; i++) {
                        if (this != "-1") {
                            if (this == preload_data2[i].id) {

                                data.push({id:this, text:preload_data2[i].text});
                            }
                        }
                    }
                });
                callback(data);
            },
            data:preload_data2
        });
        deleteCurrentLabTestOption(deleteId);
        selectCurrentLabtestOption(addId);

         if(initCurrentLabState==true){
         $("#p-labtestMultiSelect-current").select2('val', selectCurrentLabTestArrayElement);
             initCurrentLabState=false;
         }

        $('#p-labtestMultiSelect-current').on("select2-removed", function (e) {

            if ($("#" + e.choice.id).val().trim().length > 0) {
                $("#dialog-confirm-delete-current-labtest").data('e', e).dialog("open");
            } else {
                if ($('#' + e.choice.id + '-row').length > 0) {
                    $('#' + e.choice.id + '-row').remove();
                    var arrayCheckBox = $("#dialog-f").find(":checkbox:checked");
                    for (var i = 0; i < arrayCheckBox.length; i++) {
                        if (arrayCheckBox[i].id == e.choice.id) {
                            $("#" + e.choice.id).attr('checked', false);
                            $("#" + e.choice.id).prop('checked', false);
                        }
                    }
                }
            }
        });
        $('#p-labtestMultiSelect-current').on("select2-selecting", function (e) {
            var id = "" + e.object.id;
            if (id.indexOf('-newMehrsysLabtest') == -1) {
                addLabTestToTableAndSelectCheckBox(e.object.id, e.object.text);
            } else {//should save on db
                e.object.id = e.object.id.split('-newMehrsysLabtest')[0];
                var areUShureAddOperation = "<%=areUShureAddLabTest%>";
                var newItemArray = [];
                newItemArray[0] = e.object.text;
                newItemArray[1] = e.object.id;
                $("#dialog-confirm-save-current-labtest").data('newItemArray', newItemArray).dialog('open');
            }

        });


    });
}

function addLabTestToTableAndSelectCheckBox(labTestId, labTestText) {
    if (labTestId == labTestText) {
        return;
    }
    var currentLabTestOrderWithValueArray = $('#table').parent().find('textarea');
    var found = false;
    for (var i = 0; i < currentLabTestOrderWithValueArray.length; i++) {
        if (currentLabTestOrderWithValueArray[i].id == labTestId || currentLabTestOrderWithValueArray[i].id == labTestText) {
            found = true;
            break;
        }
    }
    if (found == false) {
        $('#table').append('<tr id="' + labTestId + '-row' + '"></td><td contente="true">' + labTestText + '</td><td contente="true"> <textarea  onkeyup="textArea_onKeyUp(this)" id="' + labTestId + '" style=" width: 100%;resize: none; "/></td><td><input type="button" value="delete"  class="uk-button-mini uk-button-danger" onclick="deleteClick(this)" /></td><td><input type="checkbox" id="'+labTestId+'-currentLabtest-checkbox-highlight'+'"</td></tr>' + '');
    }
    $("#" + labTestId + "-current-labtest-checkbox").attr('checked', true);
    $("#" + labTestId + "-current-labtest-checkbox").prop('checked', true);
    enableSaveLabTestItemBtnAndAddToLabTestReportBtn();
}

function selectCurrentLabtestOption(id) {
    var labTestIdSelect2Array = $("#p-labtestMultiSelect-current").select2('val');
    labTestIdSelect2Array[labTestIdSelect2Array.length] = id;
    $("#p-labtestMultiSelect-current").select2('val', labTestIdSelect2Array);

}

$(currentLabTestCheckboxEventHandler());
function currentLabTestCheckboxEventHandler(){
	$("input[id*='-currentLabtest-checkbox-highlight']").change(function() {
		enableSaveLabTestItemBtnAndAddToLabTestReportBtn();
	});
}

function enableSaveLabTestItemBtnAndAddToLabTestReportBtn(){
	$("#saveLabTestItemBtn").removeAttr("disabled");
	$("#addToLabTestReportBtn").removeAttr("disabled");
}

function saveLabTestItem(){
	$("#saveLabTestItemBtn").attr("disabled","disabled");
	currentLabTestCheckboxEventHandler();
	//
	var data = {};
	data.visitQueueId = "<%=visitQueueId%>";
	data.visitId = cuVisitId;
	
    var currentLabTestWithValueArray = $("#table").parent().find("textarea");
    var currentLabTestWithValueMap = {};
    
    if(currentLabTestWithValueArray.length > 0){
        for(var w=0; w<currentLabTestWithValueArray.length; w++){
            var value = [];
            value[0] = currentLabTestWithValueArray[w].value;
            value[1] = $("#"+currentLabTestWithValueArray[w].id + "-currentLabtest-checkbox-highlight").prop("checked");
            currentLabTestWithValueMap[currentLabTestWithValueArray[w].id] = value;
        }
        data.currentLabTestWithValueMap = currentLabTestWithValueMap;
    }
    //
    $.ajax({
        url: "${pageContext.request.contextPath}" + "/clinic/patient/visitMobileBase/saveLabTestItem/",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(data),
        dataType: "json",
        type: "POST",
        success: function (data, success, xhr) {
            alertify.success(data.message);
            //
            cuVisitId = data.backVisitId;
            //
        	emptyPatientFile();
        	loadPatientFile();
        	//
        },
        error: function (e) {
            alert("Error In Saving Lab Test Item: " + e.responseText);
        }
    });
}

function addToLabTestReport(){
	alertify.success("New Lab Test Item(s) Added To Report");
}
</script>

<style scoped>
    .demo-section {
        width: 605px;
    }

    .product-view {
        float: left;
        position: relative;
        width: 301px;
        margin: -1px -1px 0 0;
    }

    .product-view dl {
        margin: 10px 0;
        padding: 0;
        min-width: 0;
    }

    .product-view dt, dd {
        float: left;
        margin: 0;
        padding: 3px;
        height: 26px;
        width: 160px;
        line-height: 26px;
        overflow: hidden;
    }

    .product-view dt {
        clear: left;
        padding: 3px 5px 3px 0;
        text-align: right;
        opacity: 0.6;
        width: 100px;
    }

    .k-listview {
        border: 0;
        padding: 0;
        min-width: 605px;
        min-height: 298px;
    }

    .k-listview:after, .product-view dl:after {
        content: ".";
        display: block;
        height: 0;
        clear: both;
        visibility: hidden;
    }

    .edit-buttons {
        position: absolute;
        top: 0;
        right: 0;
        width: 26px;
        height: 146px;
        padding: 2px 2px 0 3px;
        background-color: rgba(0, 0, 0, 0.1);
    }

    .edit-buttons .k-button {
        width: 26px;
        margin-bottom: 1px;
    }

    .k-pager-wrap {
        border-top: 0;
    }

    span.k-invalid-msg {
        position: absolute;
        margin-left: 6px;
    }

    .Table {
        display: table;
    }

    .Title {
        display: table-caption;
        text-align: center;
        font-weight: bold;
        font-size: larger;
    }

    .Heading {
        display: table-row;
        font-weight: bold;
        text-align: center;
    }

    .Row {
        display: table-row;
    }

    .Cell {
        display: table-cell;
        border: solid;
        border-width: thin;
        padding-left: 5px;
        padding-right: 5px;
    }

	#dialog-f label.hasFocus, #dialog-f+div button:focus {
		color: #00a8e6 !important;
		font-weight: bold;
	}

	#dialog-f textarea:focus {
		border: 1px solid #00a8e6 !important;
	}
	
	textarea {
		height: 25px;
	}
</style>