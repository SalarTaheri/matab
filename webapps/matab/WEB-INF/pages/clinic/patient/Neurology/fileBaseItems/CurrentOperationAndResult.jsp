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
<link rel="stylesheet" href="<c:url value='/resources/js/select2-3.4.5/select2.css' />" type="text/css"/>
<script type="text/javascript" src="<c:url value='/resources/js/select2-3.4.5/select2.js' />"></script>
<input id='tageForGetListTag' type='hidden'/>

<div class="uk-width-1-1" id="drug-kanban-static" style=" height:100%">
    <label dir="ltr">All procedure</label>
    <input type="hidden" id="p-operationMultiSelect-current" style="direction:ltr; width: 100%; height:100% "/>
    <%--<div>--%>
        <button name="AddCurrentOperation" id="addCurrentOperation" onclick="addCurrentOperationClick()" title="AddCurrentOperation">Add current procedure</button>
    <%--</div>--%>
</div>
<div>


    <div id="tableCurrentOperationDiv">
        <table id="tableCurrentOperation" height="100%" width="100%" style="text-align: center;background-color: #ffffff;" border="2" dir="ltr">
            <tr>
                <th id="operation">
                    procedure
                </th>
                <th id="value">
                    value
                </th>

                <th id="deleteOperation">
                    delete
                </th>
                <th id="highlightOperation">
                    Highlight
                </th>
            </tr>

        </table>
    </div>
    <div id="operationAccordion">
        <jsp:include page="OperationDecription.jsp"/>
    </div>
</div>
<br>

<div id="dialog-current-operation" title='select operation' style="display:none;direction: ltr;height: 100% !important;">
    <form class="toPopup" style="direction: ltr">
        <%
            int column = 5;
            List<UserOperationItemView> userOperationItemViewList = (List<UserOperationItemView>) request.getAttribute("currentOperationAllList");
            int index = 0;
            Long currentCoding=0L;
            Long subCurrentCoding = 0L;
            Long previousCoding=0L;
            if(userOperationItemViewList==null || userOperationItemViewList.size()==0){
        %><table id="dialog-current-operation-table"><%
            }
            for (UserOperationItemView userOperationItemView : userOperationItemViewList) {
                currentCoding=userOperationItemView.getUser_operation_id();
                if (index == 0) {
                   if(currentCoding!=null){
                        previousCoding=currentCoding;
                   }
        %>
        <table id="dialog-current-operation-table" >
            <tr style="background-color: #9cf;">
                <td>
                    <input type="checkbox" name="<%=userOperationItemView.getName()%>"  onclick="groupCurrentSelect(this)" isOperationCurrentGroup="true"
                           id="<%=userOperationItemView.getName()%>-group-current-operation-customize"/>
                    <%--title="<%=operation.getName()%>"><%=operation.getName()%>/>--%>
                    <label for="<%=userOperationItemView.getName()%>-group-current-operation-customize"><span style="font-weight:bold"><%=userOperationItemView.getName()%></span>
                    </label>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <%--<tr id="current-coding-<%=currentCoding%>" class="lineBorder">--%>
            <tr id="current-coding-<%=currentCoding%>">
                <td width="25%">

                    <input type="checkbox" name="<%=userOperationItemView.getOperationName()%>"  groupOperationName="<%=userOperationItemView.getName()%>"
                           id="<%=userOperationItemView.getOperation_id().toString()%>-operation-current-checkbox"/>
                           <%--title="<%=operation.getName()%>"><%=operation.getName()%>--%>
                    <label for="<%=userOperationItemView.getOperation_id().toString()%>-operation-current-checkbox"><%=userOperationItemView.getOperationName()%></label>
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


                    <input type="checkbox" name="<%=userOperationItemView.getName()%>" onclick="groupCurrentSelect(this)" isOperationCurrentGroup="true"
                           id="<%=userOperationItemView.getName()%>-group-current-operation-customize"/>
                    <%--title="<%=operation.getName()%>"><%=operation.getName()%>/>--%>
                    <label for="<%=userOperationItemView.getName()%>-group-current-operation-customize"><span style="font-weight:bold"><%=userOperationItemView.getName()%></span>
                    </label>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <%--<tr id="current-coding-<%=currentCoding%>" class="lineBorder">--%>
            <tr id="current-coding-<%=currentCoding%>" >
                <td width="25%">


                    <input type="checkbox" name="<%=userOperationItemView.getOperationName()%>"  groupOperationName="<%=userOperationItemView.getName()%>"
                           id="<%=userOperationItemView.getOperation_id().toString()%>-operation-current-checkbox"/>
                           <%--title="<%=operation.getName()%>"><%=operation.getName()%>/>--%>
                    <label for="<%=userOperationItemView.getOperation_id().toString()%>-operation-current-checkbox"><%=userOperationItemView.getOperationName()%></label>
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
            <%--<tr id="current-coding-<%=trId%>" class="lineBorder">--%>
            <tr id="current-coding-<%=trId%>" >
                <td width="25%">

                    <input type="checkbox" name="<%=userOperationItemView.getOperationName()%>"  groupOperationName="<%=userOperationItemView.getName()%>"
                           id="<%=userOperationItemView.getOperation_id().toString()%>-operation-current-checkbox"/>
                           <%--title="<%=operation.getName()%>"><%=operation.getName()%>--%>
                    <label for="<%=userOperationItemView.getOperation_id().toString()%>-operation-current-checkbox"><%=userOperationItemView.getOperationName()%></label>
                </td>
                <%
                } else if (index % column != 0 && index % column != column - 1) {
                %>
                <td width="25%">


                    <input type="checkbox" name="<%=userOperationItemView.getOperationName()%>"  groupOperationName="<%=userOperationItemView.getName()%>"
                           id="<%=userOperationItemView.getOperation_id().toString()%>-operation-current-checkbox"/>
                    <label for="<%=userOperationItemView.getOperation_id().toString()%>-operation-current-checkbox"><%=userOperationItemView.getOperationName()%></label>
                </td>
                <%
                } else if (index % column == column - 1) {
                %>
                <td width="25%">


                    <input type="checkbox" name="<%=userOperationItemView.getOperationName()%>" groupOperationName="<%=userOperationItemView.getName()%>"
                           id="<%=userOperationItemView.getOperation_id().toString()%>-operation-current-checkbox"/>
                    <label for="<%=userOperationItemView.getOperation_id().toString()%>-operation-current-checkbox"><%=userOperationItemView.getOperationName()%></label>
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

<div id="dialog-confirm-delete-operation"  style="display:none;direction: rtl;height: 100% !important;">
    <p><%=areUShureDeleteRow%></p>
</div>
<div id="dialog-confirm-save-operation"  style="display:none;direction: rtl;height: 100% !important;">
    <p><%=areUShureAddOperation%></p>
</div>


<script type="text/javascript">
/*
var list=<%=idClassRemoveList%>;
<% for (int i=0; i<idClassRemoveList.size(); i++) { %>
$("#current-coding-" + "<%= idClassRemoveList.get(i) %>").removeClass();
<% } %>
*/

function groupCurrentSelect(e){

<% for (UserOperationItemView userOperationItemView : userOperationItemViewList)  {
String groupName=userOperationItemView.getName();%>
    if(e.name=='<%=groupName%>' && $("#"+"<%=userOperationItemView.getOperation_id()%>"+"-operation-current-checkbox")[0].attributes["groupOperationName"].childNodes[0].data=="<%=userOperationItemView.getName()%>"){
        $("#"+"<%=userOperationItemView.getOperation_id()%>"+"-operation-current-checkbox").attr('checked',e.checked);
        $("#"+"<%=userOperationItemView.getOperation_id()%>"+"-operation-current-checkbox").prop('checked',e.checked);
    }
<%} %>

}


function saveOperation(newItemArray){
    var data = {};
    data.newOperationCurrentOrder=newItemArray;
    if(newItemArray.length>0){
        $.ajax({
            url: '${pageContext.request.contextPath}'+'/clinic/patient/neurology/saveOperation/',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            dataType: 'json',
            type: 'POST',
            success: function (data, success, xhr) {
                if(data.saveOperation!=undefined){
                    var split = data.saveOperation.split(';;;;');
                    if (split.length > 1) {
                        for (var i = 0; i < split.length - 1; i = i + 2) {
                            $("#dialog-current-operation-table  tr:last td:last").after('<td><input type=\"checkbox\" name="' + split[i + 1] + '" id="' + split[i] + '-operation-current-checkbox' + '" title="' + split[i + 1] + '">' + split[i + 1] + '</td>');
                            $('#tableCurrentOperation').append('<tr id="' + split[i] + '-operation-current-checkbox-rowOperation' + '"></td><td contente="true">' + split[i+1] + '</td><td contente="true"><textarea rows="10"  id="'+split[i]+'-operation-current'+'" class="operation-description" style="overflow-y: auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteCurrentOperationClick(this)" /></td><td><input type="checkbox" id="'+split[i]+'-currentOperation-checkbox-highlight'+'"</td></tr>' + '');
                            autoCompleteCurrentOperationApply(split[i]+'-operation-current');
                            var allOperation = $("#dialog-current-operation").find(":checkbox");
                            for (var w = 0; w < allOperation.length; w++) {
                                if (allOperation[w].id == split[i]+ '-operation-current-checkbox') {
                                    allOperation[w].checked = true;
                                }
                            }
                        }
                        initSelect2(split[1],split[0]);
//                        initOrderSelect2();
                    }
                }


            },
            error: function (e) {
//                alert('Error121212: ' + e.responseText);
            }
        });
    }
}


function autoCompleteCurrentOperationApply(id){
//      var elem = $('#'+id);
    var elem = $("[id='"+ id+"']");
//    var operationName=elem.parent().parent().parent().find("td[contente=true]")[0].innerHTML;
    var operationName=$("#"+elem[0].id+'-checkbox-rowOperation').find('td')[0].innerHTML;
    elem.textcomplete([{
        match: /(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
        search: function (term, callback) {
            Common.postJSON("${pageContext.request.contextPath}" +
                    "/clinic/patient/neurology/operationAutoComplete/" + operationName, JSON.stringify({token:term}),
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
var selectOptionArrayElement=[];
var initState=true;
<%
if(!(request.getAttribute("currentOperationWithValueList") instanceof String)){
    List<DBObject> list = (List)request.getAttribute("currentOperationWithValueList");
    if(list!=null){
        for(int i=0; i <list.size(); i++) {
            DBObject dbObject=list.get(i);
            String operationId=dbObject.get("operationId").toString().trim();
            String operationName=dbObject.get("operationName").toString().trim();
            String operationVal=dbObject.get("operationVal").toString().trim();
            Object operationIsHighlight=dbObject.get("operationIsHighlight");
            operationVal= StringEscapeUtils.escapeEcmaScript(operationVal);
%>
var operationId = '<%=operationId%>';
var operationName = '<%=operationName%>';
var operationVal = '<%=operationVal%>';
var operationIsHighlight = '<%=operationIsHighlight%>';
$('#tableCurrentOperation').append('<tr id="' + operationId + '-operation-current-checkbox-rowOperation' + '"></td><td contente="true">' + operationName + '</td><td contente="true"> <textarea rows="10"  id="'+operationId+'-operation-current'+'" class="operation-description" style="overflow-y: auto;overflow-x:auto; width: 100%;height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteCurrentOperationClick(this)" /></td><td><input type="checkbox" id="'+operationId+'-currentOperation-checkbox-highlight'+'"</td></tr>' + '');
autoCompleteCurrentOperationApply(operationId+'-operation-current');
$('#'+operationId+'-operation-current').val(operationVal);
if(operationIsHighlight=='true'){
    $('#'+operationId+'-currentOperation-checkbox-highlight').prop('checked',true)
}

selectOptionArrayElement[selectOptionArrayElement.length]=operationId;
var allOperation = $("#dialog-current-operation").find(":checkbox");
for (var w = 0; w < allOperation.length; w++) {
    if (allOperation[w].id == operationId+ '-operation-current-checkbox') {
        allOperation[w].checked = true;
    }
}
<%

           }
  }
  }
%>

    var currentOperationpreload_data;
    var currentOperationMultiSelectFD;
    var addNotShowOperation=[];
//    $(document).ready(function () {
    initSelect2();
    function initSelect2(deleteId,addId){
        var url=window.location.href;
        var isEditMode=false;
        if(url.indexOf("null")==-1){
             isEditMode=true;
        }
        var urlLoadOperation="clinic/basicInfo/operation/combo/loadCurrentShowOperation";
        if(isEditMode==true){
            urlLoadOperation+='/'+'${visitId}';
        }
        $.getJSON("<c:url value='/' />" + urlLoadOperation, function (data) {

            currentOperationpreload_data = data;
            currentOperationMultiSelectFD=data;
//            operationMultiSelectFD=data;
            var preload_data2=[] ;

            if(deleteId!=undefined){
//                currentOperationpreload_data.push({ComboID:addId,ComboCaption:deleteId})
                addNotShowOperation.push({ComboID:addId,ComboCaption:deleteId});

                $.each(addNotShowOperation, function () {

                    currentOperationpreload_data.push({ComboID:this.ComboID, ComboCaption:this.ComboCaption });

                });
            }

            $.each(currentOperationpreload_data, function () {

                preload_data2.push({id:this.ComboID, text:this.ComboCaption });

            });



            $('#p-operationMultiSelect-current').select2({
                multiple:true,
                query:function (query) {
                    var data = {results:[]};

                    $.each(currentOperationpreload_data, function () {
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
                        return {id:term+'-newMehrsysOperation', text:term};
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
            deleteOption(deleteId);
            selectOption(addId);

            if(initState==true){
                $("#p-operationMultiSelect-current").select2('val', selectOptionArrayElement);
                initState=false;
            }

            $('#p-operationMultiSelect-current').on("select2-removed", function(e){

                if($("#"+ e.choice.id+"-operation-current").val().trim().length>0){
                    $("#dialog-confirm-delete-operation").data('e', e).dialog("open");
                }else{
                    if($('#' + e.choice.id + '-operation-current-checkbox-rowOperation').length>0){
                        $('#' + e.choice.id + '-operation-current-checkbox-rowOperation').remove();
                        var arrayCheckBox=$("#dialog-current-operation").find(":checkbox:checked:not([isOperationCurrentGroup])");
                        for(var i=0;i<arrayCheckBox.length;i++){
                            if(arrayCheckBox[i].id== e.choice.id+"-operation-current-checkbox"){
                                $("#"+e.choice.id+'-operation-current-checkbox').attr('checked',false);
                                $("#"+e.choice.id+'-operation-current-checkbox').prop('checked',false);
                            }
                        }
                    }
                }
            });
            $('#p-operationMultiSelect-current').on("select2-selecting", function(e){
                var id=""+e.object.id;
                if(id.indexOf('-newMehrsysOperation')==-1){
                    addOperationToTableAndSelectCheckBox(e.object.id,e.object.text);
                }else{//should save on db
                    e.object.id=e.object.id.split('-newMehrsysOperation')[0];
                    var areUShureAddOperation = "<%=areUShureAddOperation%>";
                     var newItemArray=[];
                     newItemArray[0]=e.object.text;
                     newItemArray[1]=e.object.id;
                    $("#dialog-confirm-save-operation").data('newItemArray',newItemArray).dialog('open');
                }

            });


        });

        $.getJSON("<c:url value='/' />" + "clinic/basicInfo/operation/combo/loadAllOperation", function (data) {
            operationMultiSelectFD=data;
        });
    }

        var cancelButtonCurrentOperationClick=false;
        $("#dialog-current-operation").dialog({
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
                    popupCurrentOperationOkButton();
                    $(this).dialog("close");

                },
                "cancel":function () {
                    cancelButtonCurrentOperationClick=true;
                    $(this).dialog("close");
                }
            },
            close:function (event, ui ) {
                if(event.which!=undefined || cancelButtonCurrentOperationClick==true){
                    cancelEventCurrentOperation();
                    cancelButtonCurrentOperationClick=false;
                }
                $(this).dialog("close");
            },
            open:function (event, ui) {
                arrayCheckedBoxBeforeOpenedCurrentOperation=$("#dialog-current-operation").find(":checkbox:checked:not([isOperationCurrentGroup])");
            }
        });

        $("#dialog-confirm-delete-operation").dialog({
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
                        deleteCurrentOperationRow($(this).data('contents'));
                    }else if($(this).data('e')!=undefined){
                        var id=$(this).data('e').choice.id;
                        if($('#' + id + '-operation-current-checkbox-rowOperation').length>0){
                            $('#' + id + '-operation-current-checkbox-rowOperation').remove();
                            var arrayCheckBox=$("#dialog-current-operation").find(":checkbox:checked:not([isOperationCurrentGroup])");
                            for(var i=0;i<arrayCheckBox.length;i++){
                                if(arrayCheckBox[i].id== id+"-operation-current-checkbox"){
                                    $("#"+id+'-operation-current-checkbox').attr('checked',false);
                                    $("#"+id+'-operation-current-checkbox').prop('checked',false);
                                }
                            }
                        }
                    }

                    $(this).dialog("close");

                },
                "No":function () {
                    if($(this).data('e')!=undefined){
                        selectOption($(this).data('e').choice.id);
                    }
                    $(this).dialog("close");
                }
            }
        });
        $("#dialog-confirm-save-operation").dialog({
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
                    saveOperation(itemArray);
                    $(this).dialog("close");

                },
                "cancel":function () {
                    var newItemArray=$(this).data('newItemArray');

                    deleteOption(newItemArray[1]);
                    $(this).dialog("close");
                }
            }
        });

        function addOperationToTableAndSelectCheckBox(operationId,operationText){
            if(operationId==operationText){
                return;
            }
            var operationOrderWithValueArray=$('#tableCurrentOperation').parent().parent().find('textarea');
            var found=false;
            for(var i=0;i<operationOrderWithValueArray.length;i++){
                if(operationOrderWithValueArray[i].id== operationId+'-operation-current' ||operationOrderWithValueArray[i].id== operationText+'-operation-current'){
                    found=true;
                    break;
                }
            }
            if(found==false){
                $('#tableCurrentOperation').append('<tr id="' + operationId + '-operation-current-checkbox-rowOperation' + '"></td><td contente="true">' + operationText + '</td><td contente="true"><textarea rows="10"  id="'+operationId+'-operation-current' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteCurrentOperationClick(this)" /></td><td><input type="checkbox" id="'+operationId+'-currentOperation-checkbox-highlight'+'"</td></tr>' + '');
                autoCompleteCurrentOperationApply(operationId+'-operation-current');

            }
            $("#"+operationId+'-operation-current-checkbox').attr('checked',true);
            $("#"+operationId+'-operation-current-checkbox').prop('checked',true);
        }

        function addCurrentOperationClick() {

            $("#dialog-current-operation").dialog("open");


        }

        jQuery('body')
                .bind(
                'click',
                function (e) {
                    if (
                            jQuery('#dialog-current-operation').dialog('isOpen')
                                    && !jQuery(e.target).is('.ui-dialog, a')
                                    && !jQuery(e.target).closest('.ui-dialog').length
                                    && event.target.nodeName!="BUTTON"
                            ) {
                        popupCurrentOperationOkButton();
                        jQuery('#dialog-current-operation').dialog('close');
                    }
                }
        );

        var arrayCheckedBoxBeforeOpenedCurrentOperation;
        function cancelEventCurrentOperation(){
            arrayCheckedBoxAfterCancel=$("#dialog-current-operation").find(":checkbox:checked:not([isOperationCurrentGroup])");
            for(var i=0;i<arrayCheckedBoxAfterCancel.length;i++){
                $("#"+arrayCheckedBoxAfterCancel[i].id).attr('checked',false);
                $("#"+arrayCheckedBoxAfterCancel[i].id).prop('checked',false);
            }

            for(var j=0;j<arrayCheckedBoxBeforeOpenedCurrentOperation.length;j++){
                $("#"+arrayCheckedBoxBeforeOpenedCurrentOperation[j].id).attr('checked',true);
                $("#"+arrayCheckedBoxBeforeOpenedCurrentOperation[j].id).prop('checked',true);
            }

        }

        function popupCurrentOperationOkButton(){
            var operationOrderWithValueArray=$('#tableCurrentOperation').parent().parent().find('textarea');
            var arrayCheckedOperation = $("#dialog-current-operation").find(":checkbox:checked:not([isOperationCurrentGroup])");
            var arrayAllOperation = $("#dialog-current-operation").find(":checkbox");
            for (var i = 0; i < arrayCheckedOperation.length; i++) {
                var found=false;
                for(var j=0;j<operationOrderWithValueArray.length;j++){
                    if(arrayCheckedOperation[i].id==operationOrderWithValueArray[j].id+'-checkbox'){
                        found=true;
                        break;
                    }
                }
                if(found==false){
                    $('#tableCurrentOperation').append('<tr id="' + arrayCheckedOperation[i].id + '-rowOperation' + '"></td><td contente="true">' + arrayCheckedOperation[i].name + '</td><td contente="true"><textarea rows="10"  id="'+arrayCheckedOperation[i].id.split("-checkbox")[0] +'" class="operation-description" style="overflow-y: auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteCurrentOperationClick(this)" /></td><td><input type="checkbox" id="'+arrayCheckedOperation[i].id.split("-operation-current-checkbox")[0]+'-currentOperation-checkbox-highlight'+'"</td></tr>' + '');
                    autoCompleteCurrentOperationApply(arrayCheckedOperation[i].id.split("-checkbox")[0]);
                    selectOption(arrayCheckedOperation[i].id.split('-operation-current-checkbox')[0]);
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
                        deleteOption(operationOrderWithValueArray[w].id.split('-operation-current')[0]);
                    }

                }
            }

        }

    function deleteCurrentOperationClick(th) {
        var contents = $(th).parent().parent().find('td[contente=true]');
        if(contents[1].lastChild.children[1].value.trim().length>0){

            $("#dialog-confirm-delete-operation").data('contents', contents).dialog("open");

        }else{
            deleteCurrentOperationRow(contents);
        }
        <!--$("#p-operationMultiSelect-current").select2('val', ${operationIds});-->

    }

    function deleteCurrentOperationRow(contents){
        $('#' + contents[1].lastChild.children[1].id + '-checkbox-rowOperation').remove();
        var arrayCheckedOperation = $("#dialog-current-operation").find(":checkbox:checked:not([isOperationCurrentGroup])");
        for (var i = 0; i < arrayCheckedOperation.length; i++) {
            if (arrayCheckedOperation[i].id == contents[1].lastChild.children[1].id+'-checkbox') {
                arrayCheckedOperation[i].checked = false;
            }
        }
        var id=contents[1].lastChild.children[1].id.split('-operation-current')[0];
        deleteOption(id);

    }

    function deleteOption(id){
        var operationIdSelect2Array=$("#p-operationMultiSelect-current").select2('val');
        var newOperationIdSelect2Array=[];
        var index=0;
        for(var j=0;j<operationIdSelect2Array.length;j++){
            if(id!=operationIdSelect2Array[j]){
                newOperationIdSelect2Array[index]=operationIdSelect2Array[j];
                index++;
            }
        }
        $("#p-operationMultiSelect-current").select2('val',newOperationIdSelect2Array);
    }

    function  selectOption(id){
        var operationIdSelect2Array=$("#p-operationMultiSelect-current").select2('val');
        operationIdSelect2Array[operationIdSelect2Array.length]=id;
        $("#p-operationMultiSelect-current").select2('val',operationIdSelect2Array);

    }

//    })

</script>
<style type="text/css">
    table {
        border-collapse: collapse;
        border: 2
    }

    .lineBorder td {
        border-bottom: 7px solid #9cf;
    }
</style>

