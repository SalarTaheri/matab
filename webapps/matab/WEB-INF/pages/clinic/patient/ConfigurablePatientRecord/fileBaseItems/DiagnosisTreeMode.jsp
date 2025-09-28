<%@ page import="java.util.ResourceBundle" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<%@ page import="com.mongodb.DBObject" %>
<%@ page import="java.util.List" %>
<%@ page import="com.artonis.clinic.customize.view.DiagnosisCustomizationItemView" %>
<%@ page import="java.util.ArrayList" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="<c:url value='/resources/css/mobile/fiori/kendo.common-fiori.min.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/css/mobile/fiori/kendo.fiori.min.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/css/mobile/fiori/kendo.fiori.mobile.min.css'/>" rel="stylesheet" />

<script src="<c:url value='/resources/js/kendo2017/js/kendo.all.min.js' />"></script>

<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String areUShureDeleteRow=resource.getString("clinic.patientfile.confirm.delete.row");
%>

<div class="uk-width-1-1" id="drug-kanban-static" style=" height:100%">
    <label dir="ltr">All Diagnosis</label>
    <input type="hidden" id="p-diagnosisMultiSelect" style="direction:ltr; width: 100%; height:100%;text-align: left "/>
    <div>
        <button name="Adddiagnosis" id="addCurrentdiagnosis" class="uk-button-success uk-active" style="margin-top:10px;height:29px" onclick="adddiagnosisClick()" title="Adddiagnosis">
            Add Diagnosis
        </button>
    </div>
    <div id="tableCurrentDiagnosisDiv" style=" padding-top: 10px; ">
        <table id="tablediagnosisDesc" height="100%" width="100%" style="text-align: center;background-color: #ffffff;" border="2" dir="ltr">
            <tr style=" background: -webkit-linear-gradient(top, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%); height: 25px; ">
                <th id="Diagnosis">
                    Diagnosis
                </th>
                <th id="diagnosisValue">
                    Description
                </th>
                <th id="deletediagnosis">
                    Delete
                </th>
                <th id="highlightdiagnosis">
                    Highlight
                </th>
            </tr>
        </table>
    </div>
</div>

<div id="dialog-confirm-delete-diagnosis"  style="display:none;direction: rtl;height: 100% !important;">
    <p><%=areUShureDeleteRow%></p>
</div>

<div id="dialog-confirm-delete-diagnosis-from-tree"  style="display:none;direction: rtl;height: 100% !important;">
    <p><%=areUShureDeleteRow%></p>
</div>

<div id="dialog-current-diagnosis" title='Select Diagnosis' style="display:none;direction: ltr;">
    <form class="toPopup" style="direction: ltr">
        <input type="hidden" id="diagnosisIdCommaSep" name="diagnosisIdCommaSep">
        <input type="hidden" id="previousDiagnosisIdCommaSep" name="previousDiagnosisIdCommaSep">

        <div style="margin-bottom: 15px;">
            <label for="searchNode" style="font-weight: bold">Search :</label>
            <input type="text" id="searchNode">
        </div>

        <div class="treeview-back">
            <div id="diagnosisTreeview" style=" max-height: 500px"></div>
        </div>
    </form>
</div>

<script id="item-template" type="text/x-kendo-template">
     #= data.item.modelCaption # <input type="button" title="Removing This Diagnosis" id="#= item.id #-buttonremove" style="margin-right: 20px;" value="-" onclick="removeDiagnosisTolist(this)" /> <input type="text" id="#= item.id #-text"/><input type="button" title="Add Diagnosis under  node" id="#= item.id #-button" value="+" onclick="addDiagnosisTolist(this)" />
</script>

<script type="text/javascript">
    var checkeddiagnosis=[]
    var beforeCancelPopupCheckeddiagnosis=[]
    var unCheckeddiagnosis=[];
    var diagnosisPreload_data;
    var initStatediagnosis=true;
    var selectedNewId=[];

    $(document).ready(function(){
        <%
        if(!(request.getAttribute("diagnosisWithValueList") instanceof String)){
            List<DBObject> list = (List)request.getAttribute("diagnosisWithValueList");
            if(list!=null){
                for(int i=0; i <list.size(); i++) {
                    DBObject dbObject=list.get(i);
                    String diagnosisId=dbObject.get("diagnosisId").toString().trim();
                    String diagnosisName=dbObject.get("diagnosisName").toString().trim();
                    String diagnosisVal=dbObject.get("diagnosisVal").toString().trim();
                    Object diagnosisIsHighlight=dbObject.get("diagnosisIsHighlight");
                    diagnosisVal= StringEscapeUtils.escapeEcmaScript(diagnosisVal);
        %>
        var diagnosisId = '<%=diagnosisId%>';
        var diagnosisName = '<%=diagnosisName%>';
        var diagnosisVal = '<%=diagnosisVal%>';
        var diagnosisIsHighlight = '<%=diagnosisIsHighlight%>';
        selectedNewId[selectedNewId.length]=diagnosisId;
        var checkboxDiagnosis = $("#dialog-current-diagnosis").find(":checkbox");
        for (var w = 0; w < checkboxDiagnosis.length; w++) {
            if (checkboxDiagnosis[w].id == diagnosisId+ '-diagnosis-current-checkbox') {
                checkboxDiagnosis[w].checked = true;
            }
        }
        <%if(i%2==1){%>
        $('#tablediagnosisDesc').append('<tr style=" background-color: lightgray; " id="' + diagnosisId + '-diagnosis-rowDiagnosis' + '"></td><td contente="true">' + diagnosisName + '</td><td contente="true"><textarea rows="10"  id="'+ diagnosisId+'-diagnosis-textarea' +'" class="diagnosis-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletediagnosisRowClick(this)" /></td><td><input type="checkbox" id="'+diagnosisId+'-diagnosis-checkbox-highlight'+'"</td></tr>' + '');
        if(diagnosisIsHighlight=='true'){
            $('#'+diagnosisId+'-diagnosis-checkbox-highlight').prop('checked',true)
        }
        <%}else{%>
        $('#tablediagnosisDesc').append('<tr id="' + diagnosisId + '-diagnosis-rowDiagnosis' + '"></td><td contente="true">' + diagnosisName + '</td><td contente="true"><textarea rows="10"  id="'+ diagnosisId+'-diagnosis-textarea' +'" class="diagnosis-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletediagnosisRowClick(this)" /></td><td><input type="checkbox" id="'+diagnosisId+'-diagnosis-checkbox-highlight'+'"</td></tr>' + '');
        if(diagnosisIsHighlight=='true'){
            $('#'+diagnosisId+'-diagnosis-checkbox-highlight').prop('checked',true)
        }
        <%}%>
        autoCompleteCurrentdiagnosisApply(diagnosisId + '-diagnosis-rowDiagnosis',
            diagnosisId+ '-diagnosis-textarea');
        $('#'+diagnosisId+'-diagnosis-textarea').val(diagnosisVal);
        checkeddiagnosis[checkeddiagnosis.length]=diagnosisId;

        <%

                   }
          }
          }
        %>
    });


    function groupCurrentDiagnosisSelect(e){
        $('#dialog-current-diagnosis input[groupDiagnosisName=' + e.name + ']').prop('checked', e.checked);
    }

    function initSelect2diagnosis(addId,deleteId) {
        var selected;
        var urlLoad;

        if(addId==undefined){
            selected=$("#p-diagnosisMultiSelect").select2('val');
            urlLoad = "clinic/basicInfo/diagnosis/combo/loadAll";
            var url=window.location.href;
            if(url.indexOf("null")==-1 && initStatediagnosis==true){
                var newIdWithComma='-1';
                for(var j=0;j<selectedNewId.length;j++){
                    newIdWithComma+=','+selectedNewId[j];
                }
                urlLoad = "clinic/basicInfo/diagnosis/combo/loadAll/"+newIdWithComma;
            }
        }else{
            selected=$("#p-diagnosisMultiSelect").select2('val');
            selectedNewId[selectedNewId.length]=addId;
            var newIdWithComma='-1';
            for(var j=0;j<selectedNewId.length;j++){
                newIdWithComma+=','+selectedNewId[j];
            }
            urlLoad = "clinic/basicInfo/diagnosis/combo/loadAll/"+newIdWithComma;
            checkeddiagnosis[checkeddiagnosis.length]=addId;
        }

        $.getJSON("<c:url value='/' />" + urlLoad, function (data) {

            diagnosisPreload_data = data;
            var preload_data2 = [];

            $.each(diagnosisPreload_data, function () {
                preload_data2.push({id:this.ComboID, text:this.ComboCaption });
            });

            $('#p-diagnosisMultiSelect').select2({
                multiple:true,
                query:function (query) {
                    var data = {results:[]};

                    $.each(diagnosisPreload_data, function () {
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
                        return {id:term+'-newMehrsysdiagnosis', text:term};
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
            if(deleteId!=undefined){
                $("#p-diagnosisMultiSelect").select2('val',selected);
                deleteOptiondiagnosis(deleteId);
                selectOptiondiagnosis(addId);
            }
            if(initStatediagnosis==true){
                initStatediagnosis=false;
                $("#p-diagnosisMultiSelect").select2('val', checkeddiagnosis);
            }
        });
    }

    $('#p-diagnosisMultiSelect').on("select2-removed", function(e){

        if($("#"+ e.choice.id+"-diagnosis-textarea").val().trim().length>0){
            $("#dialog-confirm-delete-diagnosis").data('e', e).dialog("open");
        }else{
            if($('#' + e.choice.id + '-diagnosis-rowDiagnosis').length>0){
                $('#' + e.choice.id + '-diagnosis-rowDiagnosis').remove();
                var arrayCheckBox=$("#dialog-current-diagnosis").find(":checkbox:checked:not([isDiagnosisCurrentGroup])");
                for(var i=0;i<arrayCheckBox.length;i++){
                    if(arrayCheckBox[i].id== e.choice.id+"-diagnosis-current-checkbox"){
                        $("#"+e.choice.id+'-diagnosis-current-checkbox').attr('checked',false);
                        $("#"+e.choice.id+'-diagnosis-current-checkbox').prop('checked',false);
                    }
                }
            }
        }
    });

    $('#p-diagnosisMultiSelect').on("select2-selecting", function(e){
        var id = "" + e.object.id;
        if (id.indexOf('-newMehrsysdiagnosis') == -1) {
            addDiagnosisToTableAndSelectCheckBox(e.object.id, e.object.text);
        } else {
            e.object.id = e.object.id.split('-newMehrsysdiagnosis')[0];
            var newItemArray = [];
            newItemArray[0] = e.object.text;
            newItemArray[1] = e.object.id;
            var itemArray = [];
            itemArray[0] = newItemArray[0];
            savediagnosis(itemArray);
        }
    });

    function addDiagnosisToTableAndSelectCheckBox(operationId, operationText) {
        if (operationId == operationText) {
            return;
        }
        var operationOrderWithValueArray = $('#tablediagnosisDesc').parent().parent().find('textarea');
        var found = false;
        for (var i = 0; i < operationOrderWithValueArray.length; i++) {
            if (operationOrderWithValueArray[i].id == operationId + '-diagnosis-textarea' || operationOrderWithValueArray[i].id == operationText + '-diagnosis-textarea') {
                found = true;
                break;
            }
        }
        if (found == false) {
            $('#tablediagnosisDesc').append('<tr id="' + operationId + '-diagnosis-rowDiagnosis' + '"></td><td contente="true">' + operationText + '</td><td contente="true"><textarea rows="10"  id="' + operationId + '-diagnosis-textarea' + '" class="diagnosis-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletediagnosisRowClick(this)" /></td><td><input type="checkbox" id="' + operationId + '-diagnosis-checkbox-highlight' + '"</td></tr>' + '');
            autoCompleteCurrentdiagnosisApply(operationId + '-diagnosis-rowDiagnosis', operationId + '-diagnosis-textarea');
        }
        $("#" + operationId + '-diagnosis-current-checkbox').attr('checked', true);
        $("#" + operationId + '-diagnosis-current-checkbox').prop('checked', true);
        afterRemoveRowFromTablediagnosis();
    }


    var cancelButtondiagnosisClick=false;
    $(document).ready(function(){
        $("#dialog-current-diagnosis").dialog({
            autoOpen:false,
            show:{
                effect:"slide",
                duration:300
            },
            hide:{
                effect:"slide",
                duration:300
            },
            width:800,
            modal:true,
            buttons:{
                "ok":function () {
                    popupCurrentDiagnosisOkButton();
                    $(this).dialog("close");
                },
                "cancel":function () {
                    //                popupdiagnosisCancelButton();
                    cancelButtondiagnosisClick=true;
                    $(this).dialog("close");
                }
            },
            close:function (event, ui) {
                if(event.which!=undefined || cancelButtondiagnosisClick==true){
                    popupdiagnosisCancelButton();
                    cancelButtondiagnosisClick=false;
                }
                $(this).dialog("close");
            },
            open:function (event, ui) {
                //            arrayCheckedBoxBeforeOpenedDrugOrder=$("#dialog-customizeDrug").find(":checkbox:checked");
                beforeCancelPopupCheckeddiagnosis=[];
                for(var i=0;i<checkeddiagnosis.length;i++){
                    beforeCancelPopupCheckeddiagnosis[i]=checkeddiagnosis[i];
                }
                categoryDiagnosisClick();
            },
            position: {
                my: "center",
                at: "center top",
                of: window
            }
        });
        //
        initSelect2diagnosis();
    });

    $(document).ready(function(){
        $("#dialog-confirm-delete-diagnosis").dialog({
            autoOpen:false,
            show:{
                effect:"slide",
                duration:300
            },
            hide:{
                effect:"slide",
                duration:300
            },
            width:800,
            modal:true,
            buttons:{
                "Yes":function () {
                    if($(this).data('contents')!=undefined){
                        deleteCurrentdiagnosisRow($(this).data('contents'));
                    }else if($(this).data('e')!=undefined){
                        var id=$(this).data('e').choice.id+"";
                        if($('#' + id + '-diagnosis-rowDiagnosis').length>0){
                            $('#' + id + '-diagnosis-rowDiagnosis').remove();
                            var arrayCheckBox=$("#dialog-current-diagnosis").find(":checkbox:checked:not([isDiagnosisCurrentGroup])");
                            for(var i=0;i<arrayCheckBox.length;i++){
                                if(arrayCheckBox[i].id== id+"-diagnosis-current-checkbox"){
                                    $("#"+id+'-diagnosis-current-checkbox').attr('checked',false);
                                    $("#"+id+'-diagnosis-current-checkbox').prop('checked',false);
                                }
                            }
                        }
                    }

                    $(this).dialog("close");

                },
                "No":function () {
                    if($(this).data('e')!=undefined){
                        selectOptiondiagnosis($(this).data('e').choice.id);
                    }
                    $(this).dialog("close");
                }
            }
        });
    });

    $("#dialog-confirm-delete-diagnosis-from-tree").dialog({
            autoOpen:false,
            show:{
                effect:"slide",
                duration:300
            },
            hide:{
                effect:"slide",
                duration:300
            },
            width:800,
            modal:true,
            buttons:{
                "Yes":function () {
                    if($(this).data('contents')!=undefined){
                        removeDiagnosisUnderParent($(this).data('contents'));
                    }
                    $(this).dialog("close");

                },
                "No":function () {

                    $(this).dialog("close");
                }
            }

    });

    function deleteCurrentdiagnosisRow(contents){
        $('#' + contents[1].lastChild.children[1].id.split('-diagnosis-textarea')[0] + '-diagnosis-rowDiagnosis').remove();
        afterRemoveRowFromTablediagnosis();
        var arrayCheckedOperation = $("#dialog-current-diagnosis").find(":checkbox:checked:not([isDiagnosisCurrentGroup])");
        for (var i = 0; i < arrayCheckedOperation.length; i++) {
            if (arrayCheckedOperation[i].id == contents[1].lastChild.children[1].id.split('-diagnosis-textarea')[0]+'-diagnosis-current-checkbox') {
                arrayCheckedOperation[i].checked = false;
            }
        }
        var id=contents[1].lastChild.children[1].id.split('-diagnosis-textarea')[0];
        deleteOptiondiagnosis(id);
        afterRemoveRowFromTablediagnosis();

    }

    function addDiagnosisTolist(e){
        var treeview = $("#diagnosisTreeview").data("kendoTreeView");
        var parentId=e.id.split('-')[0];
        var text =$("#"+e.id.split('-')[0]+'-text').val();
        saveDiagnosisUnderParent(parentId,text);
    }

    function removeDiagnosisTolist(e){
        var treeview = $("#diagnosisTreeview").data("kendoTreeView");
        var id=e.id.split('-')[0];
        // var text =$("#"+e.id.split('-')[0]+'-text').val();

        $("#dialog-confirm-delete-diagnosis-from-tree").data('contents', id).dialog("open");
    }

    function saveDiagnosisUnderParent(parentId,text){
        var data = {};
        data.parentId = parentId;
        data.text = text;
        $.ajax({
            url: '${pageContext.request.contextPath}' + '/clinic/patient/configurablePatientRecord/saveDiagnosisUnderParent/',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            dataType: 'json',
            type: 'POST',
            success: function (result) {
                if(result.state == "success"){
                    alertify.success(result.message);
                    var savedDiagnosisId=result.diagnosisId;
                    if(savedDiagnosisId!=undefined){
                        var treeview = $("#diagnosisTreeview").data("kendoTreeView");
                        var barDataItem = treeview.dataSource.get(parentId);
                        var barElement = treeview.findByUid(barDataItem.uid);
                        treeview.append({ modelCaption: text,modelID:savedDiagnosisId,hasChild:false,checked:false },barElement);
                        // setTimeout(function(){
                        //     $("#diagnosisTreeview").data("kendoTreeView").collapse(".k-item");
                        // }, 1000);
                        // setTimeout(function(){
                        //     treeview.expand(barElement);
                        // }, 1000);

                        $("#"+parentId+'-text').val('');
                    }

                }else if(result.state == "error"){
                    for(var i=0; i<result.errors.length; i++){
                        alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                    }
                }

            },
            error: function (e) {
                alertify.error("can not call saving diagnosis");
            }
        });
    }

    function removeDiagnosisUnderParent(id){
        var data = {};
        data.id = id;
        $.ajax({
            url: '${pageContext.request.contextPath}' + '/clinic/patient/configurablePatientRecord/removeDiagnosisUnderParent/',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            dataType: 'json',
            type: 'POST',
            success: function (result) {
                if(result.state == "success"){
                    alertify.success(result.message);
                    var treeview = $("#diagnosisTreeview").data("kendoTreeView");
                    var barDataItem = treeview.dataSource.get(id);
                    var barElement = treeview.findByUid(barDataItem.uid);
                    treeview.remove(barElement);

                }else if(result.state == "error"){
                    for(var i=0; i<result.errors.length; i++){
                        alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                    }
                }

            },
            error: function (e) {
                alertify.error("can not call saving diagnosis");
            }
        });

    }


    var diagnosisTreeIsLoad=false;
    function adddiagnosisClick() {
        $("#diagnosisTreeview .k-checkbox").prop("checked", false).trigger("change");
        //
        if ($("#diagnosisTreeview").data("kendoTreeView") == undefined) {
            initDiagnosisTree();
        } else {
            setSelectedDiagnosisToTreeView();
        }
        //
        $("#dialog-current-diagnosis").dialog("open");
    }

    function initDiagnosisTree(){
        $("#diagnosisTreeview").kendoTreeView({
            template: kendo.template($("#item-template").html()),
            loadOnDemand: true,
            autoBind: true,
            checkboxes: {
                checkChildren: true,
                template: "<input type='checkbox' id='#= item.id #' value='true' />"
            },
            dataSource: {
                transport: {
                    parameterMap: function (options) {
                        return JSON.stringify(options);
                    },
                    read: {
                        contentType: "application/json",
                        type: "POST",
                        url: "${pageContext.request.contextPath}" + "/clinic/patient/configurablePatientRecord/diagnosisTreeView/load",
                        dataType: "json"
                    }
                },
                schema: {
                    model: {
                        id: "modelID",
                        hasChildren: "hasChild",
                        checked: "checked"
                    }
                }
            },
            dataTextField: "modelCaption",
            checkboxes: true,
            change: diagnosisTreeViewChange,
            dataBound: diagnosisTreeViewDataBound
        });
    }

    function getCheckedItems(treeview){
        var node;
        var checkedNodes = [];
        var nodes = treeview.dataSource.view();

        for (var i = 0; i < nodes.length; i++) {
            node = nodes[i];
            if (node.checked) {
                checkedNodes.push(node);
            }
        }

        return checkedNodes;
    }

    var diagnosisTreeViewDataSource;
    function diagnosisTreeViewDataBound (e) {
        setSelectedDiagnosisToTreeView();
        //
        $("#diagnosisTreeview").data("kendoTreeView").expand(".k-item");
        //
        if ($(".k-i-expand").length == 0 && !diagnosisTreeIsLoad) {
            $("#diagnosisTreeview").data("kendoTreeView").collapse(".k-item");
            diagnosisTreeIsLoad=true;
        }
        //
        diagnosisTreeViewDataSource = $("#diagnosisTreeview").data("kendoTreeView").dataSource;
    }

    // function that gathers IDs of checked nodes
    function checkedNodeIds(nodes, checkedNodes) {
        for (var i = 0; i < nodes.length; i++) {
            if (nodes[i].checked) {
                checkedNodes.push(nodes[i].id);
            }
            if (nodes[i].hasChildren) {
                checkedNodeIds(nodes[i].children.view(), checkedNodes);
            }
        }
    }

    function setSelectedDiagnosisToTreeView() {
        if ($("tr[id*=-diagnosis-rowDiagnosis]").length > 0) {
            var treeview = $("#diagnosisTreeview").data("kendoTreeView");
            //
            var tr = $("tr[id*=-diagnosis-rowDiagnosis]");
            for (var i = 0; i < tr.length; i++) {
                var dataSource = treeview.dataSource;
                var dataItem = dataSource.get(tr[i].id.split('-')[0]);
                if (dataItem != null && dataItem != undefined) {
                    var nodeElement = treeview.findByUid(dataItem.uid);
                    var node = treeview.dataItem(nodeElement);
                    node.set("checked", true);
                }
            }
        }
    }

    function split(e) {
        if ($("#previousDiagnosisIdCommaSep").val().length > 0) {
            var splitArray = $("#previousDiagnosisIdCommaSep").val().split(',');
            for (var i = 0; i < splitArray.length; i++) {
                for (var j = 0; j < e.items.length; j++) {
                    if (splitArray[j] == e.items[j].id) {
                        $("#" + e.items[j].id).prop('checked', true);
                    }
                }
            }
        }
    }

    // show checked node IDs on datasource change
    function diagnosisTreeViewChange (e) {
        fillDiagnosisIdCommaSep();
    };

    function fillDiagnosisIdCommaSep () {
        var checkedNodes = [],
            treeView = $("#diagnosisTreeview").data("kendoTreeView"),
            message;

        checkedNodeIds(treeView.dataSource.view(), checkedNodes);

        if (checkedNodes.length > 0) {
            message = checkedNodes.join(",");
        } else {
            message = "";
        }

        $("#diagnosisIdCommaSep").html(message);
        document.getElementById("diagnosisIdCommaSep").value = message;
    }

    function categoryDiagnosisClick(e) {
        var id
        if(e==undefined){
            id="All";
        }else{
            id= e.id;
        }
        $.getJSON("<c:url value='/' />" + "clinic/basicInfo/diagnosis/loadByFirstChar/" + id, function (data) {
            if (data.length > 0) {
                checkingDialogDiagnosisPopup()
            }
        });
    }

    function  checkBoxDiagnosisClick(e){
        var checkState=$(e).prop('checked');
        var newCheckeddiagnosis=[];
        if(checkState){
            checkeddiagnosis[checkeddiagnosis.length]= e.id.split('-Diagnosis')[0];
        }else{
            unCheckeddiagnosis[unCheckeddiagnosis.length]= e.id.split('-Diagnosis')[0];
            for(var i=0;i<checkeddiagnosis.length;i++){
                if(checkeddiagnosis[i]!=e.id.split('-Diagnosis')[0]){
                    newCheckeddiagnosis[newCheckeddiagnosis.length]=checkeddiagnosis[i];
                }
            }
            checkeddiagnosis= newCheckeddiagnosis;
        }
    }

    function checkingDialogDiagnosisPopup(){
        var selected=$("#p-diagnosisMultiSelect").select2('val');
        if(selected.length>0){
            for(w = 0; w < selected.length; w++){
                var found=false;
                for(j=0;j<unCheckeddiagnosis.length;j++){
                    if(unCheckeddiagnosis[j]==selected[w]){
                        found=true;
                    }
                }
                if(!found){
                    $("#"+selected[w]+"-Diagnosis").attr('checked',true);
                    $("#"+selected[w]+"-Diagnosis").prop('checked',true);
                }
            }
        }
        for(var i=0;i<checkeddiagnosis.length;i++){
            $("#"+checkeddiagnosis[i]+"-Diagnosis").attr('checked',true);
            $("#"+checkeddiagnosis[i]+"-Diagnosis").prop('checked',true);
        }
    }

    function  selectOptiondiagnosis(id){
        var diagnosisIdSelect2Array=$("#p-diagnosisMultiSelect").select2('val');
        diagnosisIdSelect2Array[diagnosisIdSelect2Array.length]=id;
        $("#p-diagnosisMultiSelect").select2('val',diagnosisIdSelect2Array);
    }

    function  afterRemoveRowFromTablediagnosis(){
        var array=$('#tablediagnosisDesc').find('tr');
        if(array.length==1){
            return;
        }
        $('#tablediagnosisDesc').find('tr')[1].style.backgroundColor='';
        for(var i=2;i<array.length;i++){
            if(i%2==0){
                $('#tablediagnosisDesc').find('tr')[i].style.backgroundColor='lightgray'
            }else{
                $('#tablediagnosisDesc').find('tr')[i].style.backgroundColor=''
            }
        }
    }

    function addOrDeletediagnosisTable(){
        var diagnosisDescArray= $('#tablediagnosisDesc').parent().parent().find('textarea');
        for(var i=0;i<diagnosisDescArray.length;i++){
            var found=false;
            for(var j=0;j<checkeddiagnosis.length;j++){
                if(diagnosisDescArray[i].id.split('-diagnosis-textarea')[0]==checkeddiagnosis[j]){
                    found=true;
                    break;
                }
            }
            //not found in  checkeddiagnosis so delete from table
            if(!found){
                $('#' + diagnosisDescArray[i].id.split('-diagnosis-textarea')[0] + '-diagnosis-rowDiagnosis').remove();
                afterRemoveRowFromTablediagnosis()
            }
        }

        for(var k=0;k<checkeddiagnosis.length;k++){
            var founddiagnosis=false;
            for(var w=0;w<diagnosisDescArray.length;w++){
                if(diagnosisDescArray[w].id.split('-diagnosis-textarea')[0]==checkeddiagnosis[k]){
                    founddiagnosis=true;
                    break;
                }
            }
            //not found in  checkeddiagnosis so delete from table
            if(!founddiagnosis){
                var name;
                for(var l=0;l<diagnosisPreload_data.length;l++){
                    if(diagnosisPreload_data[l].ComboID==checkeddiagnosis[k]){
                        name= diagnosisPreload_data[l].ComboCaption;
                    }
                }
                $('#tablediagnosisDesc').append('<tr id="' + checkeddiagnosis[k] + '-diagnosis-rowDiagnosis' + '"></td><td contente="true">' + name + '</td><td contente="true"><textarea rows="10"  id="'+ checkeddiagnosis[k]+'-diagnosis-textarea' +'" class="diagnosis-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletediagnosisRowClick(this)" /></td><td><input type="checkbox" id="'+checkeddiagnosis[k]+'-diagnosis-checkbox-highlight'+'"</td></tr>' + '');
                afterRemoveRowFromTablediagnosis();
                autoCompleteCurrentdiagnosisApply(checkeddiagnosis[k] + '-diagnosis-rowDiagnosis',
                    checkeddiagnosis[k]+ '-diagnosis-textarea');
            }
        }
    }

    function deletediagnosisRowClick(th) {
        var contents = $(th).parent().parent().find('td[contente=true]');
        if(contents[1].lastChild.children[1].value.trim().length >0){

            $("#dialog-confirm-delete-diagnosis").data('contents', contents).dialog("open");

        }else{
            deleteCurrentdiagnosisRow(contents);
        }
    }

    function deleteOptiondiagnosis(id){
        var diagnosisIdSelect2Array=$("#p-diagnosisMultiSelect").select2('val');
        var newDiagnosisIdSelect2Array=[];
        var index=0;
        for(var j=0;j<diagnosisIdSelect2Array.length;j++){
            if(id!=diagnosisIdSelect2Array[j]){
                newDiagnosisIdSelect2Array[index]=diagnosisIdSelect2Array[j];
                index++;
            }
        }
        $("#p-diagnosisMultiSelect").select2('val',newDiagnosisIdSelect2Array);
    }

    function popupCurrentDiagnosisOkButton() {
        var operationOrderWithValueArray = $('#tablediagnosisDesc').parent().parent().find('textarea');
        //
        fillDiagnosisIdCommaSep();
        var data = $("#diagnosisIdCommaSep").val().split(',');
        //
        for (var j = 0; j < operationOrderWithValueArray.length; j++) {
            var found = false;
            for (var i = 0; i < data.length; i++) {
                if (data[i] == "") {
                    break;
                }
                if (data[i] == operationOrderWithValueArray[j].id.split("-")[0]) {
                    found = true;
                    break;
                }
            }
            if (found == false) {
                var btn = $("#" + operationOrderWithValueArray[j].id.split("-")[0] + "-diagnosis-rowDiagnosis input[type='button']")[0];
                var contents = $(btn).parent().parent().find('td[contente=true]');
                deleteCurrentdiagnosisRow(contents);
            }
        }
        //
        if (data[0] == "") {
            return;
        }
        //
        for (var i = 0; i < data.length; i++) {
            var found = false;
            for (var j = 0; j < operationOrderWithValueArray.length; j++) {
                if (data[i] == operationOrderWithValueArray[j].id.split("-")[0]) {
                    found = true;
                    break;
                }
            }
            if (found == false) {
                var treeview = $("#diagnosisTreeview").data("kendoTreeView");
                var dataSource = treeview.dataSource;
                var dataItem = dataSource.get(data[i]);
                //
                $('#tablediagnosisDesc').append('<tr id="' + data[i] + '-diagnosis-rowDiagnosis' + '"></td><td contente="true">' + dataItem.modelCaption
                    + '</td><td contente="true"><textarea rows="10" id="' + data[i] + '-diagnosis-textarea' + '"'
                    + ' class="diagnosis-description" style="overflow-y: auto;overflow-x:auto; width: 100%; height:50px !important; '
                    + ' direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete"'
                    + ' class="uk-button uk-button-danger" onclick="deletediagnosisRowClick(this)" /></td><td><input type="checkbox"'
                    + ' id="' + data[i] + '-diagnosis-checkbox-highlight' + '"</td></tr>' + '');
                //
                autoCompleteCurrentdiagnosisApply(data[i] + '-diagnosis-rowDiagnosis', data[i] + '-diagnosis-textarea');
                //
                selectOptiondiagnosis(data[i]);
            }
        }
        //
        afterRemoveRowFromTablediagnosis();
    }

    function popupdiagnosisCancelButton(){
        checkeddiagnosis=[];
        for(var i=0;i<beforeCancelPopupCheckeddiagnosis.length;i++){
            checkeddiagnosis[i]=beforeCancelPopupCheckeddiagnosis[i];
        }
    }

    jQuery('body').bind('click', function (e) {
        if (
            jQuery('#dialog-current-diagnosis').dialog('isOpen')
            && !jQuery(e.target).is('.ui-dialog, a')
            && !jQuery(e.target).closest('.ui-dialog').length
            && event.target.nodeName != "BUTTON"
            && (e.target.id.split('-').length==0 || e.target.id=="")
        ) {
            popupCurrentDiagnosisOkButton();
            jQuery('#dialog-current-diagnosis').dialog('close');
        }
    });

    function autoCompleteCurrentdiagnosisApply(trId,textAreaId){
        var elem = $("[id='"+ textAreaId+"']");
        var diagnosisName=$("#"+trId).find('td')[0].innerHTML;
        elem.textcomplete([{
            match: /(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
            search: function (term, callback) {
                Common.postJSON("${pageContext.request.contextPath}" +
                    "/clinic/patient/visitMobileBase/diagnosisDescAutoComplete/" + diagnosisName, JSON.stringify({token:term}),
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

    function savediagnosis(newItemArray){
        var data = {};
        data.newdiagnosisOrder=newItemArray;
        if(newItemArray.length>0){
            $.ajax({
                url: '${pageContext.request.contextPath}'+'/clinic/patient/visitMobileBase/savediagnosistt/',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                dataType: 'json',
                type: 'POST',
                success: function (data, success, xhr) {
                    if(data.diagnosisId!=undefined){
                        $('#tablediagnosisDesc').append('<tr id="' + data.diagnosisId + '-diagnosis-rowDiagnosis' + '"></td><td contente="true">' + data.diagnosisName + '</td><td contente="true"><textarea rows="10"  id="'+ data.diagnosisId+'-diagnosis-textarea' +'" class="diagnosis-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletediagnosisRowClick(this)" /></td><td><input type="checkbox" id="'+data.diagnosisId+'-diagnosis-checkbox-highlight'+'"</td></tr>' + '');
                        afterRemoveRowFromTablediagnosis();
                        autoCompleteCurrentdiagnosisApply(data.diagnosisId + '-diagnosis-rowDiagnosis',
                            data.diagnosisId+ '-diagnosis-textarea');
                        initSelect2diagnosis(data.diagnosisId,data.diagnosisName);
                        document.getElementById('s2id_autogen12').focus();
                    }
                },
                error: function (e) {
                }
            });
        }
    }

    String.prototype.replaceAll = function(search, replacement) {
        var target = this;
        return target.replace(new RegExp(search, 'g'), replacement);
    };

    $('#searchNode').on('keyup', function () {
        $("#diagnosisTreeview li").css("display","block")

        $('span.k-in > span.highlight').each(function () {
            // $(this).parent().text($(this).parent().text());
            if($(this).parent().html()!=undefined && $(this).parent().html().indexOf('<span class="highlight">')>-1){
                var html=$(this).parent().html();
                html=html.replaceAll('<span class="highlight">','');
                html=html.replaceAll('</span>','');
                $(this).parent().html(html);
            }
        });

        // ignore if no search term
        if ($.trim($(this).val()) == '') {
            return;
        }

        var term = this.value.toUpperCase();
        var tlen = term.length;

        console.log('--keyup--');
        $('#diagnosisTreeview span.k-in').each(function (index) {
            var text = $(this).text();
            var currentHtml =  $(this).html();
            var html =  '';
            var q = 0;
            while ((p = text.toUpperCase().indexOf(term, q)) >= 0) {
                html += text.substring(q, p) + '<span class="highlight">' + text.substr(p, tlen) + '</span>';
                // html=html.replace(text.trim(),text.substring(q, p) + '<span class="highlight">' + text.substr(p, tlen) + '</span>')
                q = p + tlen;
            }

            if (q > 0) {
                html += text.substring(q);
                html=html.trim();
                html=currentHtml.replace(text.trim(),html);

                $(this).html(html.trim());

                $(this).parentsUntil('.k-treeview').filter('.k-item').each(
                    function (index, element) {
                        $('#diagnosisTreeview').data('kendoTreeView').expand($(this));
                        $(this).data('search-term', term);
                    }
                );
            }
        });

        $('#diagnosisTreeview .k-item').each(function () {
            if ($(this).data('search-term') != term) {
                $(this).hide();
            }
        });
    }) ;

</script>

<style type="text/css">
    a:visited {
        color: #000000;
    }

    /* visited link */
    a:hover {
        color: #FF00FF;
    }

    /* mouse over link */
    a:active {
        color: #0000FF;
    }

    /* selected link */
    .select2-results {
        text-align: left;
    }

    tr.border_top td {
        border-top: 1pt solid black;
    }

    .k-i-expand::before {
        content: url("<c:url value='/resources/css/web/Default/sprite.png'/>") !important;
        -moz-transform:rotate(90deg) !important;
        -webkit-transform:rotate(90deg) !important;
        -o-transform:rotate(90deg) !important;
        -ms-transform:rotate(90deg) !important;
    }

    .k-i-collapse::before {
        content: url("<c:url value='/resources/css/web/Default/sprite.png'/>") !important;
    }

    #diagnosisTreeview li[aria-expanded="false"] {
        margin-left: 3px;
    }

    #diagnosisTreeview li[aria-expanded="true"] {
        margin-left: 3px;
    }

    #searchNode {
        width: 350px;
        padding: 5px;
        color: red;
        border-radius: 4px;
        border-style: solid;
        border-width: thin;
        border-color: gray;
        background-color: rgba(204, 204, 204, 0.32);
        font-size: 20px !important;
    }

    span.k-in > span.highlight {
        background: yellow;
        font-size: 20px !important;
    }

    span.k-state-selected > span.highlight {
        background: yellow;
        color: black !important;
        font-size: 20px !important;
    }

    span.k-in {
        font-size: 20px !important;
    }
</style>