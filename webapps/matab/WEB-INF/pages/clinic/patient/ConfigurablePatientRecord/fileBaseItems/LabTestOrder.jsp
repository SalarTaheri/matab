<%@ page import="java.util.List" %>
<%@ page import="com.artonis.clinic.core.model.MedicalTest" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.artonis.clinic.customize.view.UserLabTestItemView" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <%--<select id="p-allLabTest"  style="direction:ltr; width: 100%; height:100% " multiple="multiple">--%>
    <%--</select>--%>
    <input type="hidden" id="p-allLabTest" style="direction:ltr; width: 100%; height:100% "/>
</div>
<%
    List<String> idClassRemoveList = new ArrayList<String>();
%>
<div>
	<select id="labTestOrders_customized" multiple="multiple"></select>
    <button name="customizedLabTest" id="customizedLabTest" onclick="customizedLabTestClick()">select customized LabTest
    </button>
</div>
<div id="dialog-customizeLabtest" title='select lab test' style="display:none;direction: ltr;height: 100% !important;">
    <form class="toPopup" style="direction: ltr">
        <%
            int column = 5;
            List<UserLabTestItemView> userLabTestList = (List<UserLabTestItemView>) request.getAttribute("userLabTestList");
            int index = 0;
            Long currentCoding = 0L;
            Long subCurrentCoding = 0L;
            Long previousCoding = 0L;
            if(userLabTestList==null || userLabTestList.size()==0){
                %><table><%
            }
            for (UserLabTestItemView userLabTestItemView : userLabTestList) {
                currentCoding=userLabTestItemView.getUser_labtest_id();
                if (index == 0) {
                  if(currentCoding!=null){
                      previousCoding=currentCoding;
                  }
        %>
        <table>
            <tr id="all-select-order-labtest">
                <td>
                    <input type="checkbox" id="all-select-order-labtest-checkbox"
                           name="all-select-order-labtest-checkbox"
                           onclick="selectAllOrderLabTestCheckBox(this)"/>
                    <label for="all-select-order-labtest-checkbox">select all
                    </label>
                </td>
            </tr>
            <tr style="background-color: #9cf;">

               <%-- <td>

                    <input type="checkbox" name="cbc-select" onclick="cbcSelect(this)"
                           id="cbc-select"/>
                           &lt;%&ndash;title="<%=medicalTest.getName()%>"><%=medicalTest.getName()%>&ndash;%&gt;
                        <label for="cbc-select">CBC:
                        </label>
                </td>--%>
               <td>


                   <input type="checkbox" name="<%=userLabTestItemView.getName()%>"  onclick="groupSelect(this)"
                          id="<%=userLabTestItemView.getName()%>-group-customize"/>
                   <%--title="<%=operation.getName()%>"><%=operation.getName()%>/>--%>
                   <label for="<%=userLabTestItemView.getName()%>-group-customize"><span style="font-weight:bold"><%=userLabTestItemView.getName()%></span>
                   </label>
               </td>
               <td></td>
               <td></td>
               <td></td>
               <td></td>
            </tr>
            <%--<tr id="order-labtest-coding-<%=currentCoding%>" class="lineBorder">--%>
            <tr id="order-labtest-coding-<%=currentCoding%>" >
                <td>

                    <input type="checkbox" name="<%=userLabTestItemView.getMedicalTestName()%>"
                           id="<%=userLabTestItemView.getMedicalTest_id().toString()%>-customize" groupName="<%=userLabTestItemView.getName()%>"/>
                           <%--title="<%=medicalTest.getName()%>"><%=medicalTest.getName()%>--%>
                        <label for="<%=userLabTestItemView.getMedicalTest_id().toString()%>-customize"><%=userLabTestItemView.getMedicalTestName()%>
                        </label>
                </td>
                <%
                } else if ((previousCoding==null &&currentCoding!=null)||
                        (previousCoding!=null &&currentCoding==null) ||
                        ((previousCoding!=null &&currentCoding!=null) && !previousCoding.equals(currentCoding))) {
                    previousCoding = currentCoding;
                    subCurrentCoding=0L;
                    int def = 0;
                    if (index % column != 0) {
                        def = column - (index % column);
                        index += column - (index % column);
                        if (def > 0) {
                            for (int j = 0; j < def; j++) {%>
                <td>&nbsp;</td>
                <%
                            }
                        }

                    }
                %>
            </tr>
            <tr style="background-color: #9cf;">
                <td >


                    <input type="checkbox" name="<%=userLabTestItemView.getName()%>" onclick="groupSelect(this)"
                           id="<%=userLabTestItemView.getName()%>-group-customize"/>
                    <%--title="<%=operation.getName()%>"><%=operation.getName()%>/>--%>
                    <label for="<%=userLabTestItemView.getName()%>-group-customize"><span style="font-weight:bold"><%=userLabTestItemView.getName()%></span>
                    </label>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <%--<tr id="order-labtest-coding-<%=currentCoding%>" class="lineBorder">--%>
            <tr id="order-labtest-coding-<%=currentCoding%>" >
                <td>


                    <input type="checkbox" name="<%=userLabTestItemView.getMedicalTestName()%>"
                           id="<%=userLabTestItemView.getMedicalTest_id().toString()%>-customize" groupName="<%=userLabTestItemView.getName()%>"/>
                    <%--title="<%=operation.getName()%>"><%=operation.getName()%>/>--%>
                    <label for="<%=userLabTestItemView.getMedicalTest_id().toString()%>-customize"><%=userLabTestItemView.getMedicalTestName()%>
                    </label>
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
            <%--<tr id="order-labtest-coding-<%=trId%>" class="lineBorder">--%>
            <tr id="order-labtest-coding-<%=trId%>">
                <td>
                    <%--<base:checkbox styleClass="small" name="<%=medicalTest.getName()%>" id="<%=medicalTest.getId().toString()%>" caption="<%=medicalTest.getName()%>" direction="ltr"/>--%>

                    <input type="checkbox" name="<%=userLabTestItemView.getMedicalTestName()%>"
                           id="<%=userLabTestItemView.getMedicalTest_id().toString()%>-customize" groupName="<%=userLabTestItemView.getName()%>"/>
                           <%--title="<%=medicalTest.getName()%>"><%=medicalTest.getName()%>--%>
                        <label for="<%=userLabTestItemView.getMedicalTest_id().toString()%>-customize"><%=userLabTestItemView.getMedicalTestName()%>
                        </label>
                </td>
                <%
                } else if (index % column != 0 && index % column != column - 1) {
                %>
                <td>
                    <%--<base:checkbox styleClass="small" name="<%=medicalTest.getName()%>" id="<%=medicalTest.getId().toString()%>" caption="<%=medicalTest.getName()%>" direction="ltr"/>--%>

                    <input type="checkbox" name="<%=userLabTestItemView.getMedicalTestName()%>"
                           id="<%=userLabTestItemView.getMedicalTest_id().toString()%>-customize" groupName="<%=userLabTestItemView.getName()%>"/>
                           <%--title="<%=medicalTest.getName()%>"><%=medicalTest.getName()%>--%>
                    <label for="<%=userLabTestItemView.getMedicalTest_id().toString()%>-customize"><%=userLabTestItemView.getMedicalTestName()%>
                    </label>
                </td>
                <%
                } else if (index % column == column - 1) {
                %>
                <td>
                    <%--<base:checkbox styleClass="small" name="<%=medicalTest.getName()%>" id="<%=medicalTest.getId().toString()%>" caption="<%=medicalTest.getName()%>" direction="ltr"/>--%>

                    <input type="checkbox" name="<%=userLabTestItemView.getMedicalTestName()%>"
                           id="<%=userLabTestItemView.getMedicalTest_id().toString()%>-customize" groupName="<%=userLabTestItemView.getName()%>"/>
                           <%--title="<%=medicalTest.getName()%>"><%=medicalTest.getName()%>--%>
                    <label for="<%=userLabTestItemView.getMedicalTest_id().toString()%>-customize"><%=userLabTestItemView.getMedicalTestName()%>
                    </label>
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
<script type="text/javascript">
function onClickCheckBoxLabTestOrder(){

}

function selectAllOrderLabTestCheckBox(e) {
    var checkBoxElementArray = $("#dialog-customizeLabtest").find(":checkbox");
    for (var i = 1; i < checkBoxElementArray.length; i++) {
        checkBoxElementArray[i].checked = e.checked;
    }
}

function cbcSelect(e){
    $("#2-customize").attr('checked',e.checked);
    $("#2-customize").prop('checked',e.checked);
    $("#480-customize").attr('checked',e.checked);
    $("#480-customize").prop('checked',e.checked);
    $("#14-customize").attr('checked',e.checked);
    $("#14-customize").prop('checked',e.checked);
    $("#6-customize").attr('checked',e.checked);
    $("#6-customize").prop('checked',e.checked);
}

function groupSelect(e){
/*
    <% for (UserLabTestItemView userLabTestItemView : userLabTestList)  {
        String groupName=userLabTestItemView.getName();%>
        if(e.name=='<%=groupName%>' && $("#"+"<%=userLabTestItemView.getMedicalTest_id()%>"+"-customize")[0].attributes["groupname"].childNodes[0].data=="<%=userLabTestItemView.getName()%>"){
            $("#"+"<%=userLabTestItemView.getMedicalTest_id()%>"+"-customize").attr('checked',e.checked);
            $("#"+"<%=userLabTestItemView.getMedicalTest_id()%>"+"-customize").prop('checked',e.checked);
        }
    <%} %>
*/
	$('#dialog-customizeLabtest input[groupname=' + e.name + ']').prop('checked', e.checked);
}

var allLabTestFD = {};
var labTestList = new Array();
$(document).ready(function () {
    <%--var listIdClassRemoveOrder =<%=idClassRemoveList%>;--%>
    /*var listIdClassRemoveOrder=[];
    <% for (int i=0; i<idClassRemoveList.size(); i++) { %>
        $("#order-labtest-coding-" + "<%= idClassRemoveList.get(i) %>").removeClass();
    <% } %>*/



    var url=window.location.href;
    var isEditMode=false;
    if(url.indexOf("null")==-1){
        isEditMode=true;
    }
    var urlLoadOrderLabTest = "clinic/medicaltest/medicalTest/loadMedicalTestChildWithoutMine";
    if(isEditMode==true){
        urlLoadOrderLabTest+='/'+'${visitId}';
    }

    var preload_data_labtest;

    $.getJSON("<c:url value='/' />" + urlLoadOrderLabTest, function (data) {

        preload_data_labtest = data;
        allLabTestFD = data;
        var preload_data2 = [];

        $.each(preload_data_labtest, function () {

            preload_data2.push({id:this.ComboID, text:this.ComboCaption });

        });

        $('#p-allLabTest').select2({
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
                    return {id:term, text:term};
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


//            for ( var i = 0; i < data.length; i++) {
//                $("#p-allLabTest").append(
//                        "<option style='direction:ltr' value='" + data[i].ComboID + "' >" + data[i].ComboCaption + "</option>")
//            }
        $("#p-allLabTest").select2('val', ${labTestIds});


        <%
           if(!request.getAttribute("labTestIds").toString().equals("-1")){


           List<String> list = (List)request.getAttribute("labTestIds");
           if(list!=null){
           for(int count=0; count <list.size(); count++) {
        %>
        labTestList[<%= count %>] = '<%= list.get(count) %>';
        <% } %>
        <% } %>
        <% } %>
        var allcustomizeLabtest=$("#dialog-customizeLabtest").find(":checkbox");
        i = 0, size = labTestList.length;
        for (i; i < size; i++) {
            $("#labTestOrders_customized").multiselect("widget").find(":checkbox[value='" + labTestList[i] + "']").attr("checked", "checked");
            $("#labTestOrders_customized option[value='" + labTestList[i] + "']").attr("selected", 1);

            for(z=0;z<allcustomizeLabtest.length;z++){
                if(labTestList[i]==allcustomizeLabtest[z].id.split('-customize')[0]){
                    allcustomizeLabtest[z].checked=true;
                }
            }
        }
        $("#labTestOrders_customized").multiselect("refresh");
        var size = $(".ui-multiselect").size();
        for (var i = 0; i < size; i++) {
            $(".ui-multiselect")[i].style.width = "65%";
        }

        $(".ui-multiselect-menu").css("width", '70%');

    });



    var cancelButtenLabTestOrderClick=false;
    $("#dialog-customizeLabtest").dialog({
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
                popUpLabTestOrderOkButton();

                $(this).dialog("close");

            },
            "cancel":function () {
                cancelButtenLabTestOrderClick=true;
                $(this).dialog("close");
            }
        },
        close:function (event, ui ) {
            if(event.which!=undefined || cancelButtenLabTestOrderClick==true){
                cancelEventLabTestOrder();
              cancelButtenLabTestOrderClick=false;
            }
            $(this).dialog("close");
        },
        open:function (event, ui) {
            arrayCheckedBoxBeforeOpenedLabTestOrder=$("#dialog-customizeLabtest").find(":checkbox:checked");

        }
    });

    jQuery('body')
            .bind(
            'click',
            function (e) {
                if (
                        jQuery('#dialog-customizeLabtest').dialog('isOpen')
                                && !jQuery(e.target).is('.ui-dialog, a')
                                && !jQuery(e.target).closest('.ui-dialog').length
                                && event.target.nodeName!="BUTTON"
                        ) {
                    popUpLabTestOrderOkButton();
                    jQuery('#dialog-customizeLabtest').dialog('close');
                }
            }
    );

});
var arrayCheckedBoxBeforeOpenedLabTestOrder;
function cancelEventLabTestOrder(){
    arrayCheckedBoxAfterCancel=$("#dialog-customizeLabtest").find(":checkbox:checked");
    for(var i=0;i<arrayCheckedBoxAfterCancel.length;i++){
        $("#"+arrayCheckedBoxAfterCancel[i].id).attr('checked',false);
        $("#"+arrayCheckedBoxAfterCancel[i].id).prop('checked',false);
    }

    for(var j=0;j<arrayCheckedBoxBeforeOpenedLabTestOrder.length;j++){
        $("#"+arrayCheckedBoxBeforeOpenedLabTestOrder[j].id).attr('checked',true);
        $("#"+arrayCheckedBoxBeforeOpenedLabTestOrder[j].id).prop('checked',true);
    }


}

function popUpLabTestOrderOkButton(){
    var arrayCheckedLabTest = $("#dialog-customizeLabtest").find(":checkbox:checked");
    var selectedLabTestInComboArray = $("#labTestOrders_customized").val();
    if ($("#labTestOrders_customized").val() != null) {

        for (var j = 0; j < selectedLabTestInComboArray.length; j++) {
            var found = false;
            for (var index = 0; index < arrayCheckedLabTest.length; index++) {

                if (arrayCheckedLabTest[index].id.split('-customize')[0] == selectedLabTestInComboArray[j]) {
                    found = true;
                    break;
                }
            }
            if (found == false) {

                $("#labTestOrders_customized").multiselect("widget").find(":checkbox[value='" +selectedLabTestInComboArray[j] + "']").attr("checked", "false");
                $("#labTestOrders_customized option[value='" + selectedLabTestInComboArray[j] + "']").attr("selected", false);
//                $("#labTestOrders_customized").multiselect("refresh");
            }
        }
    }
    for (var index = 0; index < arrayCheckedLabTest.length; index++) {
        var id = arrayCheckedLabTest[index].id.split('-customize')[0];
        $("#labTestOrders_customized").multiselect("widget").find(":checkbox[value='" + id + "']").attr("checked", "checked");
        $("#labTestOrders_customized option[value='" + id + "']").attr("selected", 1);
    }
    $("#labTestOrders_customized").multiselect("refresh");

    var size = $(".ui-multiselect").size();
    for (var i = 0; i < size; i++) {
        $(".ui-multiselect")[i].style.width = "65%";
    }
    $(".ui-multiselect-menu").css("width", '70%');
}
function customizedLabTestClick() {

    $("#dialog-customizeLabtest").dialog("open");
}

function checkAllCustomizeLabTestEvent(event, ui){
    for(var i=0;i<event.target.length;i++){
        if($("#"+event.target[i].value+"-customize").length>0){
            $("#"+event.target[i].value+"-customize").attr('checked',true);
            $("#"+event.target[i].value+"-customize").prop('checked',true);
        }
    }
}

function clickCustomizeLabTestEvent(event,ui){
    if(ui.checked==true){
        $("#"+ui.value+"-customize").attr('checked',true)
        $("#"+ui.value+"-customize").prop('checked',true)
    }else if(ui.checked==false){
        $("#"+ui.value+"-customize").attr('checked',false)
        $("#"+ui.value+"-customize").prop('checked',false)
    }
    console.log(ui);
}

function optgrouptoggleCustomizeLabTestEvent(event,ui){
    for(var i=0;i<ui.inputs.length;i++){
        if($("#"+ui.inputs[i].value+"-customize").length>0){
            $("#"+ui.inputs[i].value+"-customize").attr('checked',ui.checked);
            $("#"+ui.inputs[i].value+"-customize").prop('checked',ui.checked);
        }
    }
}

function unCheckAllCustomizeLabTestEvent(event,ui){
    for(var i=0;i<event.target.length;i++){
        if($("#"+event.target[i].value+"-customize").length>0){
            $("#"+event.target[i].value+"-customize").attr('checked',false);
            $("#"+event.target[i].value+"-customize").prop('checked',false);
        }
    }
}


var mapToArray = {};
$("#labTestOrders_customized2").on("multiselectclick", function (event, ui) {

    isChecked = ui.checked;
    value = ui.value;
    var array;

    array = $("#p-allLabTest").select2('val');
    var arrayLength = array.length;
//        console.log(array);
    if (isChecked == false && value in mapToArray) {
        delete mapToArray[value];
    }


    $.getJSON("<c:url value='/' />" + "clinic/customize/userLabTestGroup/loadLabTestGroupItem/" + ui.value, function (data, ui) {

//              for(var i=0;i<data.length;i++){
//                  $("#labTestOrders_customized").multiselect("widget").find(":checkbox[value='"+data[i]+"']").attr("checked","checked");
//                  $("#labTestOrders_customized option[value='" + data[i] + "']").attr("selected", 1);
//                  $("#labTestOrders_customized").multiselect("refresh");
//              }
        if (isChecked == true) {
            mapToArray[value] = data;
        }

        for (var i = 0; i < data.length; i++) {

            $("#labTestOrders_customized").multiselect("widget").find(":checkbox").each(function () {
                if (this.value == data[i]) {
                    if (isChecked == true || this.checked == true) {
                        isFound = false;
                        for (var key in mapToArray) {
                            if (key == value) {
                                continue;
                            }
                            ar = mapToArray[key];
                            for (var j = 0; j < ar.length; j++) {
                                if (ar[j] == data[i]) {
                                    isFound = true;
                                    break;
                                }
                            }
                            if (isFound == true) {
                                break;

                            }

                        }
                        if (isFound == false) {
                            this.click();
                        }

                    }
                }
            });

            if (isChecked == true) {
                array[arrayLength + i] = data[i];
            } else {
                isFound = false;
                for (var key in mapToArray) {
                    if (key == value) {
                        continue;
                    }
                    ar = mapToArray[key];
                    for (var j = 0; j < ar.length; j++) {
                        if (ar[j] == data[i]) {
                            isFound = true;
                            break;
                        }
                    }
                    if (isFound == true) {
                        break;

                    }

                }
                if (isFound == false) {
                    index = array.indexOf(data[i]);
                    if (index > -1) {
                        array.splice(index, 1);
                    }
                }
            }

        }

        $("#p-allLabTest").select2('val', array);

    });
});

function callBack_after_full_date_labTestOrders_customized(){
    var i = 0, size = labTestList.length;
    for (i; i < size; i++) {
        $("#labTestOrders_customized").multiselect("widget").find(":checkbox[value='" + labTestList[i] + "']").attr("checked", "checked");
        $("#labTestOrders_customized option[value='" + labTestList[i] + "']").attr("selected", 1);
    }
    $("#labTestOrders_customized").multiselect("refresh");
}
////////////////////////////////////
$(document).ready(function(){
	var noneSelectedTextJs="select customized LabTest";
	var width = 70;
	$("#labTestOrders_customized").multiselect({
		  selectedList: 60,
		  hide: ["slide", 500],
	  noneSelectedText:noneSelectedTextJs,
	  checkAll: function(event, ui){
	      var checkAllEventMethodName='checkAllCustomizeLabTestEvent';
	      if(checkAllEventMethodName!=null || checkAllEventMethodName!='null'){
	          if(typeof(window[checkAllEventMethodName])=="function"){
	              window[checkAllEventMethodName](event, ui);
	          }
	      }
	  },
	  click:function(event,ui){
	      var clickEventMethodName='clickCustomizeLabTestEvent';
	      if(clickEventMethodName!=null || clickEventMethodName!='null'){
	          if(typeof(window[clickEventMethodName])=="function"){
	              window[clickEventMethodName](event, ui);
	          }
	      }
	
	  },
	  optgrouptoggle:function(event,ui){
	      var optgrouptoggleEventMethodName='optgrouptoggleCustomizeLabTestEvent';
	      if(optgrouptoggleEventMethodName!=null || optgrouptoggleEventMethodName!='null'){
	          if(typeof(window[optgrouptoggleEventMethodName])=="function"){
	              window[optgrouptoggleEventMethodName](event, ui);
	          }
	      }
	
	  },
	  uncheckAll:function(event,ui){
	      var uncheckAllEventMethodName='unCheckAllCustomizeLabTestEvent';
	      if(uncheckAllEventMethodName!=null || uncheckAllEventMethodName!='null'){
	          if(typeof(window[uncheckAllEventMethodName])=="function"){
	              window[uncheckAllEventMethodName](event, ui);
	          }
	      }
	
	  }
	
	}).multiselectfilter();
	
	$.getJSON("<c:url value='/' />" + "clinic/customize/userLabTest/combo/loadSelectedLabTestGet" , function(data) {
			$("#labTestOrders_customized").append(data.data);
			$("#labTestOrders_customized").multiselect("refresh");
	    var size=$(".ui-multiselect").size();
	    for(var i=0;i<size;i++){
	        $(".ui-multiselect")[i].style.width="100%";
	    }
	        $(".ui-multiselect-menu").css("width",'70%');
	    if(typeof(window["callBack_after_full_date_"+"labTestOrders_customized"])=="function"){
	        window["callBack_after_full_date_"+"labTestOrders_customized"]();
	    }
	});
});


</script>

<style type="text/css">
    .ui-multiselect-menu {direction: ltr}
</style>