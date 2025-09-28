<%@ page import="java.util.List" %>
<%@ page import="com.artonis.clinic.basicInfo.model.Operation" %>
<%@ page import="com.mongodb.DBObject" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<%@ page import="com.artonis.clinic.customize.view.UserOperationItemView" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String areUShureDeleteRow=resource.getString("clinic.patientfile.confirm.delete.row");
    String areUShureAddOperation=resource.getString("clinic.patientfile.confirm.add.new.operation");
    List<String> idClassRemoveList=new ArrayList<String>();
%>
<input id='tageForGetListTag' type='hidden'/>

<div class="uk-width-1-1" id="drug-kanban-static" style=" height:100%">
    <label dir="ltr">All procedure</label>
    <input type="hidden" id="p-operationMultiSelect" style="direction:ltr; width: 100%; height:100% "/>
</div>
<div>
    <div>
        <button name="AddOperation" id="addOperation" onclick="addOperationClick()" title="AddOperation">Add procedure</button>
    </div>
    <div id="tableOperationDiv">
        <table id="tableOperation" height="100%" width="100%" style="text-align: center; background-color: #ffffff;" border="2" dir="ltr">
            <tr style=" background: -webkit-linear-gradient(top, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%); height: 25px; ">
                <th id="operation">
                    procedure
                </th>
                <th id="description">
                    description
                </th>
                <th id="deleteOperation">
                    delete
                </th>
	            <th id="highlightOperation">
	            	highlight
	            </th>
            </tr>
        </table>
    </div>
</div>
<br>

<div id="dialog-operation" title='select operation' style="display:none;direction: ltr;height: 100% !important;">
    <form class="toPopup" style="direction: ltr">
        <%
            int column = 5;
            List<UserOperationItemView> userOperationItemViewList = (List<UserOperationItemView>) request.getAttribute("operationAllList");
            int index = 0;
            Long currentCoding=0L;
            Long subCurrentCoding = 0L;
            Long previousCoding=0L;
            if(userOperationItemViewList==null || userOperationItemViewList.size()==0){
        %><table><%
            }
            for (UserOperationItemView userOperationItemView : userOperationItemViewList) {
                currentCoding=userOperationItemView.getUser_operation_id();
                if (index == 0) {
                    if(currentCoding!=null){
                        previousCoding=currentCoding;
                   }
        %>
        <table>
            <tr style="background-color: #9cf;">
                <td>
                    <input type="checkbox" name="<%=userOperationItemView.getName()%>"  onclick="groupOrderOperationSelect(this)" isOperationOrderGroup="true"
                           id="<%=userOperationItemView.getName()%>-group-operation-order"/>
                    <label for="<%=userOperationItemView.getName()%>-group-operation-order"><span style="font-weight:bold"><%=userOperationItemView.getName()%></span>
                    </label>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr id="order-coding-<%=currentCoding%>">
                <td>
                    <input type="checkbox" name="<%=userOperationItemView.getOperationName()%>" groupOrderOperationName="<%=userOperationItemView.getName()%>"
                           id="<%=userOperationItemView.getOperation_id().toString()%>-operation-checkbox"/>
                        <label for="<%=userOperationItemView.getOperation_id().toString()%>-operation-checkbox"><%=userOperationItemView.getOperationName()%></label>
                </td>
                    <%
                     } else if ((previousCoding==null &&currentCoding!=null)||
                             (previousCoding!=null &&currentCoding==null) ||
                             ((previousCoding!=null &&currentCoding!=null) && !previousCoding.equals(currentCoding))) {
                        previousCoding=currentCoding;
                        subCurrentCoding=0L;
                        int def=0;
                        if(index%column !=0){
                            def=column-(index%column);
                            index+=column-(index%column);
                            if(def>0){
                                for(int j=0;j<def;j++){%><td>&nbsp;</td><%}
                            }
                        }
                    %>
            </tr>
            <tr style="background-color: #9cf;">
                <td >
                    <input type="checkbox" name="<%=userOperationItemView.getName()%>" onclick="groupOrderOperationSelect(this)" isOperationOrderGroup="true"
                           id="<%=userOperationItemView.getName()%>-group-operation-customize"/>
                    <label for="<%=userOperationItemView.getName()%>-group-operation-customize"><span style="font-weight:bold"><%=userOperationItemView.getName()%></span>
                    </label>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr id="order-coding-<%=currentCoding%>">
                <td>

                    <input type="checkbox" name="<%=userOperationItemView.getOperationName()%>" groupOrderOperationName="<%=userOperationItemView.getName()%>"
                           id="<%=userOperationItemView.getOperation_id().toString()%>-operation-checkbox"/>
                    <label for="<%=userOperationItemView.getOperation_id().toString()%>-operation-checkbox"><%=userOperationItemView.getOperationName()%></label>
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
            </tr>
            <tr id="order-coding-<%=trId%>" class="lineBorder">
                <td>

                    <input type="checkbox" name="<%=userOperationItemView.getOperationName()%>" groupOrderOperationName="<%=userOperationItemView.getName()%>"
                           id="<%=userOperationItemView.getOperation_id().toString()%>-operation-checkbox"/>
                    <label for="<%=userOperationItemView.getOperation_id().toString()%>-operation-checkbox"><%=userOperationItemView.getOperationName()%></label>
                </td>
                <%
                } else if (index % column != 0 && index % column != column - 1) {
                %>
                <td>
                    <input type="checkbox" name="<%=userOperationItemView.getOperationName()%>" groupOrderOperationName="<%=userOperationItemView.getName()%>"
                           id="<%=userOperationItemView.getOperation_id().toString()%>-operation-checkbox"/>
                    <label for="<%=userOperationItemView.getOperation_id().toString()%>-operation-checkbox"><%=userOperationItemView.getOperationName()%></label>
                </td>
                <%
                } else if (index % column == column - 1) {
                %>
                <td>
                    <input type="checkbox" name="<%=userOperationItemView.getOperationName()%>"  groupOrderOperationName="<%=userOperationItemView.getName()%>"
                           id="<%=userOperationItemView.getOperation_id().toString()%>-operation-checkbox"/>
                    <label for="<%=userOperationItemView.getOperation_id().toString()%>-operation-checkbox"><%=userOperationItemView.getOperationName()%></label>
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

<div id="dialog-confirm-delete-order-operation"  style="display:none;direction: rtl;height: 100% !important;">
    <p><%=areUShureDeleteRow%></p>
</div>
<div id="dialog-confirm-save-order-operation"  style="display:none;direction: rtl;height: 100% !important;">
    <p><%=areUShureAddOperation%></p>
</div>

<script type="text/javascript">
function groupOrderOperationSelect(e){
/*
    <% for (UserOperationItemView userOperationItemView : userOperationItemViewList)  {
    String groupName=userOperationItemView.getName();%>
        if(e.name=='<%=groupName%>' && $("#"+"<%=userOperationItemView.getOperation_id()%>"+"-operation-checkbox")[0].attributes["groupOrderOperationName"].childNodes[0].data=="<%=userOperationItemView.getName()%>"){
            $("#"+"<%=userOperationItemView.getOperation_id()%>"+"-operation-checkbox").attr('checked',e.checked);
            $("#"+"<%=userOperationItemView.getOperation_id()%>"+"-operation-checkbox").prop('checked',e.checked);
        }
    <%} %>
*/
	$('#dialog-operation input[groupOrderOperationName=' + e.name + ']').prop('checked', e.checked);
}
function saveOrderOperation(newItemArray){
    var data = {};
    data.newOperationCurrentOrder=newItemArray;
    if(newItemArray.length>0){
        $.ajax({
            url: '${pageContext.request.contextPath}'+'/clinic/patient/visitMobileBase/saveOperation/',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            dataType: 'json',
            type: 'POST',
            success: function (data, success, xhr) {
                if(data.saveOperation!=undefined){
                    var split = data.saveOperation.split(';;;;');
                    if (split.length > 1) {
                        for (var i = 0; i < split.length - 1; i = i + 2) {
                            $("#dialog-operation  tr:last td:last").after('<td><input type=\"checkbox\" name="' + split[i + 1] + '" id="' + split[i] + '-operation-checkbox' + '" title="' + split[i + 1] + '">' + split[i + 1] + '</td>');
                            $('#tableOperation').append('<tr id="' + split[i] + '-operation-checkbox-rowOperation' + '"></td><td contente="true">' + split[i+1] + '</td><td contente="true"><textarea rows="10"  id="'+split[i]+'-operation'+'" class="operation-description" style="overflow-y: auto;overflow-x:auto; width: 100%; width:100% !important;height:70px;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteOperationClick(this)" /></td><td><input type="checkbox" id="'+split[i]+'-operation-checkbox-highlight'+'"/></td></tr>');
                            autoCompleteApply(split[i]+'-operation');
                            var allOperation = $("#dialog-operation").find(":checkbox");
                            for (var w = 0; w < allOperation.length; w++) {
                                if (allOperation[w].id == split[i]+ '-operation-checkbox') {
                                    allOperation[w].checked = true;
                                }
                            }
                        }
                        initOrderSelect2(split[1],split[0]);
                    }
                }
            },
            error: function (e) {
            }
        });
    }
}

function autoCompleteApply(id){
    var elem = $("[id='"+ id+"']");
    var operationName=$("#"+elem[0].id+'-checkbox-rowOperation').find('td')[0].innerHTML;
    elem.textcomplete([{
        match: /(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
        search: function (term, callback) {
            Common.postJSON("${pageContext.request.contextPath}" +
                    "/clinic/patient/visitMobileBase/operationDescriptionAutoComplete/" + operationName, JSON.stringify({token:term}),
                    function (data) {
                        var tokens = [];
                        tokens.push(term);
                        for (var j = 0; j < data.length; j++)
                            tokens.push(data[j].token);
                        callback(tokens);
                    });
        },
        replace: function (word) {
            return '$1' + word + ' ';
        }
    }]);
}

var selectOptionOrderOperationArrayElement=[];
var initStateOrderOperation=true;
$(document).ready(function(){
	<%
	if(!(request.getAttribute("operationWithDescriptionForEdit") instanceof String)){
	    List<DBObject> list = (List)request.getAttribute("operationWithDescriptionForEdit");
	    if(list!=null){
	        for(int i=0; i <list.size(); i++) {
	            DBObject dbObject=list.get(i);
	            String operationId=dbObject.get("operationId").toString().trim();
	            String operationName=dbObject.get("operationName").toString().trim();
	            String operationDescription=dbObject.get("operationDescription").toString().trim();
	            String operationIsHighlight=dbObject.get("operationIsHighlight").toString().trim();
	            
	            if(operationDescription.length()==0){
	               operationDescription=" ";
	            }else {
	              operationDescription=StringEscapeUtils.escapeEcmaScript(operationDescription);
	            }
	%>
	var operationId = '<%=operationId%>';
	var operationName = '<%=operationName%>';
	var operationDescription = '<%=operationDescription%>';
	var operationIsHighlight = '<%=operationIsHighlight%>';
	$('#tableOperation').append('<tr id="' + operationId + '-operation-checkbox-rowOperation' + '"></td><td contente="true">' + operationName + '</td><td contente="true"> <textarea rows="10"  id="'+operationId+'-operation'+'" class="operation-description" style="overflow-y: auto;overflow-x:auto; width: 100%; width:100% !important;height:70px;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteOperationClick(this)" /></td><td><input type="checkbox" id="'+operationId+'-operation-checkbox-highlight'+'"/></td></tr>' + '');
	autoCompleteApply(operationId+'-operation');
	$('#'+operationId+'-operation').val(operationDescription);
	if(operationIsHighlight=='true'){
	    $("#"+operationId+'-operation-checkbox-highlight').prop('checked',true);
	}
	selectOptionOrderOperationArrayElement[selectOptionOrderOperationArrayElement.length]=operationId;
	var allOperation = $("#dialog-operation").find(":checkbox");
	for (var w = 0; w < allOperation.length; w++) {
	    if (allOperation[w].id == operationId+ '-operation-checkbox') {
	        allOperation[w].checked = true;
	    }
	}
	<%
	           }
	  }
	  }
	%>
});
    var operationpreload_data;
    var operationMultiSelectFD;
    var addNotShowOrderOperation=[];
    
    function initOrderSelect2(deleteId,addId){
        var url=window.location.href;
        var isEditMode=false;
        if(url.indexOf("null")==-1){
            isEditMode=true;
        }
        var urlLoadOperation="clinic/basicInfo/operation/combo/loadOrderShowOperation";
        if(isEditMode==true){
            urlLoadOperation+='/'+'${visitId}';
        }
        $.getJSON("<c:url value='/' />" + urlLoadOperation, function (data) {

            operationpreload_data = data;
            var preload_data2=[] ;

            if(deleteId!=undefined){
                addNotShowOrderOperation.push({ComboID:addId,ComboCaption:deleteId});

                $.each(addNotShowOrderOperation, function () {

                    operationpreload_data.push({ComboID:this.ComboID, ComboCaption:this.ComboCaption });

                });
            }

            $.each(operationpreload_data, function () {
                preload_data2.push({id:this.ComboID, text:this.ComboCaption });
            });

            $('#p-operationMultiSelect').select2({
                multiple:true,
                query:function (query) {
                    var data = {results:[]};
                    $.each(operationpreload_data, function () {
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
                        return {id:term+'-newOrderMehrsysOperation', text:term};
                    }
                }, initSelection:function (element, callback) {
                    if (element.val() == "-1") {
                        element.val("");
                        return;
                    }
                    var data = [];
                    $(element.val().split(",")).each(function (){
                        for(var i=0;i<preload_data2.length;i++){
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
            deleteOrderOption(deleteId);
            selectOrderOption(addId);
            <!--$("#p-operationMultiSelect").select2('val', ${operationIds});-->

            if(initStateOrderOperation==true){
                $("#p-operationMultiSelect").select2('val', selectOptionOrderOperationArrayElement);
                initStateOrderOperation=false;
            }

            $('#p-operationMultiSelect').on("select2-removed", function(e){
                if($("#"+ e.choice.id+"-operation").val().trim().length>0){
                    $("#dialog-confirm-delete-order-operation").data('e', e).dialog("open");
                }else{
                    if($('#' + e.choice.id + '-operation-checkbox-rowOperation').length>0){
                        $('#' + e.choice.id + '-operation-checkbox-rowOperation').remove();
                        var arrayCheckBox=$("#dialog-operation").find(":checkbox:checked:not([isOperationOrderGroup])");
                        for(var i=0;i<arrayCheckBox.length;i++){
                            if(arrayCheckBox[i].id== e.choice.id+"-operation-checkbox"){
                                $("#"+e.choice.id+'-operation-checkbox').attr('checked',false);
                                $("#"+e.choice.id+'-operation-checkbox').prop('checked',false);
                            }
                        }
                    }                }
            });
            $('#p-operationMultiSelect').on("select2-selecting", function(e){
                var id=""+e.object.id;
                if(id.indexOf('-newOrderMehrsysOperation')==-1){
                    addOrderOperationToTableAndSelectCheckBox(e.object.id,e.object.text);
                }else{//should save on db
                    e.object.id=e.object.id.split('-newOrderMehrsysOperation')[0];
                    var areUShureAddOperation = "<%=areUShureAddOperation%>";
                    var newItemArray=[];
                    newItemArray[0]=e.object.text;
                    newItemArray[1]=e.object.id;
                    $("#dialog-confirm-save-order-operation").data('newItemArray',newItemArray).dialog('open');
                }

            });

        });

        $.getJSON("<c:url value='/' />" + "clinic/basicInfo/operation/combo/loadAllOperation", function (data) {
            operationMultiSelectFD=data;
        });
      }

        var cancelButtonOperationOrderClick=false;
        $(document).ready(function(){
	        $("#dialog-operation").dialog({
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
	                    popupOperationOrderOkButton();
	                    $(this).dialog("close");
	
	                },
	                "cancel":function () {
	                    cancelButtonOperationOrderClick=true;
	                    $(this).dialog("close");
	                }
	            },
	            close:function (event, ui ) {
	                if(event.which!=undefined || cancelButtonOperationOrderClick==true){
	                    cancelEventOperationOrder();
	                    cancelButtonOperationOrderClick=false;
	                }
	                $(this).dialog("close");
	            },
	            open:function (event, ui) {
	                arrayCheckedBoxBeforeOpenedOperationOrder=$("#dialog-operation").find(":checkbox:checked:not([isOperationOrderGroup])");
	            }
	        });
        });

        $(document).ready(function(){
	        $("#dialog-confirm-delete-order-operation").dialog({
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
	                    if($(this).data('contents')!=undefined){
	                        deleteRow($(this).data('contents'));
	                    }else if($(this).data('e')!=undefined){
	                        var id=$(this).data('e').choice.id;
	                        if($('#' + id + '-operation-checkbox-rowOperation').length>0){
	                            $('#' + id + '-operation-checkbox-rowOperation').remove();
	                            var arrayCheckBox=$("#dialog-operation").find(":checkbox:checked:not([isOperationOrderGroup])");
	                            for(var i=0;i<arrayCheckBox.length;i++){
	                                if(arrayCheckBox[i].id== id+"-operation-checkbox"){
	                                    $("#"+id+'-operation-checkbox').attr('checked',false);
	                                    $("#"+id+'-operation-checkbox').prop('checked',false);
	                                }
	                            }
	                        }
	                    }
	
	                    $(this).dialog("close");
	
	                },
	                "No":function () {
	                    if($(this).data('e')!=undefined){
	                        selectOrderOption($(this).data('e').choice.id);
	                    }
	                    $(this).dialog("close");
	                }
	            }
	        });

	        $("#dialog-confirm-save-order-operation").dialog({
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
	                    var newItemArray=$(this).data('newItemArray');
	
	                    var itemArray=[];
	                    itemArray[0]=newItemArray[0];
	                    saveOrderOperation(itemArray);
	                    $(this).dialog("close");
	
	                },
	                "cancel":function () {
	                    var newItemArray=$(this).data('newItemArray');
	
	                    deleteOrderOption(newItemArray[1]);
	                    $(this).dialog("close");
	                }
	            }
	        });
	        //
	        initOrderSelect2();
        });

        function addOrderOperationToTableAndSelectCheckBox(operationId,operationText){
            if(operationId==operationText){
                return;
            }
            var operationOrderWithValueArray=$('#tableOperation').parent().parent().find('textarea');
            var found=false;
            for(var i=0;i<operationOrderWithValueArray.length;i++){
                if(operationOrderWithValueArray[i].id== operationId+'-operation'||operationOrderWithValueArray[i].id== operationText+'-operation'){
                    found=true;
                    break;
                }
            }
            if(found==false){
                $('#tableOperation').append('<tr id="' + operationId + '-operation-checkbox-rowOperation' + '"></td><td contente="true">' + operationText + '</td><td contente="true"><textarea rows="10"  id="'+operationId+'-operation' +'" class="operation-description" style="overflow-y: auto;overflow-x:auto; width: 100%; width:100% !important;height:70px;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteOperationClick(this)" /></td><td><input type="checkbox" id="'+operationId+'-operation-checkbox-highlight'+'"/></td></tr>' + '');
                autoCompleteApply(operationId+'-operation');

            }
            $("#"+operationId+'-operation-checkbox').attr('checked',true);
            $("#"+operationId+'-operation-checkbox').prop('checked',true);
            
            $("#"+operationId+'-operation-checkbox-highlight').attr('checked',true);
            $("#"+operationId+'-operation-checkbox-highlight').prop('checked',true);
        }

        function addOperationClick() {
            $("#dialog-operation").dialog("open");
        }

        jQuery('body')
                .bind(
                'click',
                function (e) {
                    if (
                            jQuery('#dialog-operation').dialog('isOpen')
                                    && !jQuery(e.target).is('.ui-dialog, a')
                                    && !jQuery(e.target).closest('.ui-dialog').length
                                    && event.target.nodeName!="BUTTON"
                            ) {
                        popupOperationOrderOkButton();
                        jQuery('#dialog-operation').dialog('close');
                    }
                }
        );

        var arrayCheckedBoxBeforeOpenedOperationOrder;
        function cancelEventOperationOrder(){
            arrayCheckedBoxAfterCancel=$("#dialog-operation").find(":checkbox:checked:not([isOperationOrderGroup])");
            for(var i=0;i<arrayCheckedBoxAfterCancel.length;i++){
                $("#"+arrayCheckedBoxAfterCancel[i].id).attr('checked',false);
                $("#"+arrayCheckedBoxAfterCancel[i].id).prop('checked',false);
            }

            for(var j=0;j<arrayCheckedBoxBeforeOpenedOperationOrder.length;j++){
                $("#"+arrayCheckedBoxBeforeOpenedOperationOrder[j].id).attr('checked',true);
                $("#"+arrayCheckedBoxBeforeOpenedOperationOrder[j].id).prop('checked',true);
            }

        }

        function popupOperationOrderOkButton(){
            var operationOrderWithValueArray=$('#tableOperation').parent().parent().find('textarea');
            var arrayCheckedOperation = $("#dialog-operation").find(":checkbox:checked:not([isOperationOrderGroup])");
            var arrayAllOperation = $("#dialog-operation").find(":checkbox");
            for (var i = 0; i < arrayCheckedOperation.length; i++) {
                var found=false;
                for(var j=0;j<operationOrderWithValueArray.length;j++){
                    if(arrayCheckedOperation[i].id==operationOrderWithValueArray[j].id+'-checkbox'){
                        found=true;
                        break;
                    }
                }
                if(found==false){
                    var realId=arrayCheckedOperation[i].id.split('-operation-checkbox')[0];
                    $('#tableOperation').append('<tr id="' + arrayCheckedOperation[i].id + '-rowOperation' + '"></td><td contente="true">' + arrayCheckedOperation[i].name + '</td><td contente="true"><textarea rows="10"  id="'+arrayCheckedOperation[i].id.split("-checkbox")[0] +'" class="operation-description" style="overflow-y: auto;overflow-x:auto; width: 100%; width:100% !important;height:70px;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteOperationClick(this)" /></td><td><input type="checkbox" id="'+realId+'-operation-checkbox-highlight'+'"/></td></tr>' + '');
                    autoCompleteApply(arrayCheckedOperation[i].id.split("-checkbox")[0]);
                    selectOrderOption(arrayCheckedOperation[i].id.split('-operation-checkbox')[0]);
                }
            }

            for(var w=0;w<operationOrderWithValueArray.length;w++){
                var f=false;
                for(x=0;x<arrayCheckedOperation.length;x++){
                    if(operationOrderWithValueArray[w].id+'-checkbox'==arrayCheckedOperation[x].id){
                        f=true;
                        break;
                    }
                }
                if(f==false){
                    var foundInAllCustomizeOperation=false;
                    for(var l=0;l<arrayAllOperation.length;l++){
                        if(operationOrderWithValueArray[w].id+'-checkbox'==arrayAllOperation[l].id){
                            foundInAllCustomizeOperation=true;
                        }
                    }
                    if(foundInAllCustomizeOperation==true){
                        $('#' + operationOrderWithValueArray[w].id + '-checkbox-rowOperation').remove();
                        deleteOrderOption(operationOrderWithValueArray[w].id.split('-operation')[0]);
                    }
                }
            }

        }

    function deleteOperationClick(th) {
        var contents = $(th).parent().parent().find('td[contente=true]');
        if(contents[1].lastChild.children[1].value.trim().length>0){
            $("#dialog-confirm-delete-order-operation").data('contents', contents).dialog("open");
        }else{
            deleteRow(contents);
        }
    }

    function deleteRow(contents){
        $('#' + contents[1].lastChild.children[1].id + '-checkbox-rowOperation').remove();
        var arrayCheckedOperation = $("#dialog-operation").find(":checkbox:checked:not([isOperationOrderGroup])");
        for (var i = 0; i < arrayCheckedOperation.length; i++) {
            if (arrayCheckedOperation[i].id == contents[1].lastChild.children[1].id+'-checkbox') {
                arrayCheckedOperation[i].checked = false;
            }
        }
        var id=contents[1].lastChild.children[1].id.split('-operation')[0];
        deleteOrderOption(id);
    }

    function deleteOrderOption(id){
        var operationIdSelect2Array=$("#p-operationMultiSelect").select2('val');
        var newOperationIdSelect2Array=[];
        var index=0;
        for(var j=0;j<operationIdSelect2Array.length;j++){
            if(id!=operationIdSelect2Array[j]){
                newOperationIdSelect2Array[index]=operationIdSelect2Array[j];
                index++;
            }
        }
        $("#p-operationMultiSelect").select2('val',newOperationIdSelect2Array);
    }

    function  selectOrderOption(id){
        var operationIdSelect2Array=$("#p-operationMultiSelect").select2('val');
        operationIdSelect2Array[operationIdSelect2Array.length]=id;
        $("#p-operationMultiSelect").select2('val',operationIdSelect2Array);
    }

</script>

<style type="text/css">
    table {
        border-collapse: collapse;
        border: 2
    }

    .lineBorder td {
        border-bottom: 7px solid #9cf;
    }
    
    #tableOperation	tr:nth-child(odd) {
    	background-color: lightgray;
    }
</style>