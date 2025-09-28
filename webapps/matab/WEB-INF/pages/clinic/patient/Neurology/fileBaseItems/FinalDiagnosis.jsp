<%@ page import="java.util.ResourceBundle" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<%@ page import="com.mongodb.DBObject" %>
<%@ page import="java.util.List" %>
<%--
    <div class="uk-width-1-1" id="Finaldiagnosis-kanban-static" style="z-index:-1; height:100%">
        <textarea rows="5" name="p-Finaldiagnosis" id="p-Finaldiagnosis" style="overflow-y: auto;overflow-x:auto; width: 100%; width:100% !important; height:100%; direction: ltr; text-align: left"  >&nbsp;</textarea>
    </div>

<script type="text/javascript">
$(function(){
    initFinaldiagnosisAutocomplate();
});

function initFinaldiagnosisAutocomplate(){
    $("#p-Finaldiagnosis").textcomplete([{
            match: /(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
            search: function (term, callback) {
                Common.postJSON("${pageContext.request.contextPath}"+"/clinic/patient/visitMobileBase/FinaldiagnosisAutoComplete/" , JSON.stringify({token: term}), function(data){
                    var tokens = [];
                    tokens.push(term);
                    for(var i = 0; i< data.length; i++)
                        tokens.push(data[i].token);
                    callback(tokens);
                });
            },
            replace: function (word) {
                return '$1' + word + ' ';
            }
    }]);
}
</script>--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/js/select2-3.4.5/select2.css' />" type="text/css"/>
<script type="text/javascript" src="<c:url value='/resources/js/select2-3.4.5/select2.js' />"></script>
<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String areUShureDeleteRow=resource.getString("clinic.patientfile.confirm.delete.row");
%>
<div class="uk-width-1-1" id="drug-kanban-static" style=" height:100%">
    <label dir="ltr">Final Diagnosis</label>
    <input type="hidden" id="p-FinaldiagnosisMultiSelect" style="direction:ltr; width: 100%; height:100%;text-align: left "/>
    <%--<div>--%>
    <button name="AddFinaldiagnosis" id="addCurrentFinaldiagnosis" class="uk-button-success uk-active" style="margin-top:10px;height:29px" onclick="addFinaldiagnosisClick()"
            title="AddFinaldiagnosis">Add FinalDiagnosis
    </button>
    <%--</div>--%>
    <div id="tableCurrentOperationDiv" style=" padding-top: 10px; ">
        <table id="tableFinaldiagnosisDesc" height="100%" width="100%" style="text-align: center;background-color: #ffffff;" border="2" dir="ltr">
            <tr style=" background: -webkit-linear-gradient(top, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%); height: 25px; ">
                <th id="FinalDiagnosis">
                    FinalDiagnosis
                </th>
                <th id="FinaldiagnosisValue">
                    Description
                </th>

                <th id="deleteFinaldiagnosis">
                    Delete
                </th>
                <th id="highlightFinaldiagnosis">
                    Highlight
                </th>
            </tr>

        </table>
    </div>
</div>

<div id="dialog-confirm-delete-Finaldiagnosis"  style="display:none;direction: rtl;height: 100% !important;">
    <p><%=areUShureDeleteRow%></p>
</div>

<div id="dialog-FinalDiagnosis" title='Select FinalDiagnosis'
     style="display:none;direction: ltr;height: 100% !important;">
    <form class="toPopup" style="direction: ltr">

        <table align="center" width="100%">
            <tr>
                <td>
                <a href="#" id="All" onclick="categoryFinalDiagnosisClick(this)">All</a>
                </td>
                <td>
                    <a href="#" id="A" onclick="categoryFinalDiagnosisClick(this)">A</a>
                </td>
                <td>
                    <a href="#" id="B" onclick="categoryFinalDiagnosisClick(this)">B</a>
                </td>
                <td>
                    <a href="#" id="C" onclick="categoryFinalDiagnosisClick(this)">C</a>
                </td>
                <td>
                    <a href="#" id="D" onclick="categoryFinalDiagnosisClick(this)">D</a>
                </td>
                <td>
                    <a href="#" id="E" onclick="categoryFinalDiagnosisClick(this)">E</a>
                </td>
                <td>
                    <a href="#" id="F" onclick="categoryFinalDiagnosisClick(this)">F</a>
                </td>
                <td>
                    <a href="#" id="G" onclick="categoryFinalDiagnosisClick(this)">G</a>
                </td>
                <td>
                    <a href="#" id="H" onclick="categoryFinalDiagnosisClick(this)">H</a>
                </td>
                <td>
                    <a href="#" id="I" onclick="categoryFinalDiagnosisClick(this)">I</a>
                </td>
                <td>
                    <a href="#" id="J" onclick="categoryFinalDiagnosisClick(this)">J</a>
                </td>
                <td>
                    <a href="#" id="K" onclick="categoryFinalDiagnosisClick(this)">K</a>
                </td>
                <td>
                    <a href="#" id="L" onclick="categoryFinalDiagnosisClick(this)">L</a>
                </td>
                <td>
                    <a href="#" id="M" onclick="categoryFinalDiagnosisClick(this)">M</a>
                </td>
                <td>
                    <a href="#" id="N" onclick="categoryFinalDiagnosisClick(this)">N</a>
                </td>
                <td>
                    <a href="#" id="O" onclick="categoryFinalDiagnosisClick(this)">O</a>
                </td>
                <td>
                    <a href="#" id="P" onclick="categoryFinalDiagnosisClick(this)">P</a>
                </td>
                <td>
                    <a href="#" id="Q" onclick="categoryFinalDiagnosisClick(this)">Q</a>
                </td>
                <td>
                    <a href="#" id="R" onclick="categoryFinalDiagnosisClick(this)">R</a>
                </td>
                <td>
                    <a href="#" id="S" onclick="categoryFinalDiagnosisClick(this)">S</a>
                </td>
                <td>
                    <a href="#" id="T" onclick="categoryFinalDiagnosisClick(this)">T</a>
                </td>
                <td>
                    <a href="#" id="U" onclick="categoryFinalDiagnosisClick(this)">U</a>
                </td>
                <td>
                    <a href="#" id="V" onclick="categoryFinalDiagnosisClick(this)">V</a>
                </td>
                <td>
                    <a href="#" id="W" onclick="categoryFinalDiagnosisClick(this)">W</a>
                </td>
                <td>
                    <a href="#" id="X" onclick="categoryFinalDiagnosisClick(this)">X</a>
                </td>
                <td>
                    <a href="#" id="Y" onclick="categoryFinalDiagnosisClick(this)">Y</a>
                </td>
                <td>
                    <a href="#" id="Z" onclick="categoryFinalDiagnosisClick(this)">Z</a>
                </td>

            </tr>

        </table>
        <%--<table id="FinalDiagnosis-table" align="center" width="100%" border="1" style="font-size: 30px !important; padding-top:40px;">--%>
        <table id="FinalDiagnosis-table" align="center">
        </table>
    </form>
</div>

<script type="text/javascript">
    var checkedFinaldiagnosis=[]
    var beforeCancelPopupCheckedFinaldiagnosis=[]
    var unCheckedFinaldiagnosis=[];
    var FinaldiagnosisPreload_data;
    var initStateFinaldiagnosis=true;
    var selectedNewId=[];

    <%
    if(!(request.getAttribute("finalDiagnosisWithValueList") instanceof String)){
        List<DBObject> list = (List)request.getAttribute("finalDiagnosisWithValueList");
        if(list!=null){
            for(int i=0; i <list.size(); i++) {
                DBObject dbObject=list.get(i);
                String FinaldiagnosisId=dbObject.get("diagnosisId").toString().trim();
                String FinaldiagnosisName=dbObject.get("diagnosisName").toString().trim();
                String FinaldiagnosisVal=dbObject.get("diagnosisVal").toString().trim();
                Object FinaldiagnosisIsHighlight=dbObject.get("diagnosisIsHighlight");
                FinaldiagnosisVal= StringEscapeUtils.escapeEcmaScript(FinaldiagnosisVal);
    %>
    var FinaldiagnosisId = '<%=FinaldiagnosisId%>';
    var FinaldiagnosisName = '<%=FinaldiagnosisName%>';
    var FinaldiagnosisVal = '<%=FinaldiagnosisVal%>';
    var FinaldiagnosisIsHighlight = '<%=FinaldiagnosisIsHighlight%>';
    selectedNewId[selectedNewId.length]=FinaldiagnosisId;
    <%if(i%2==1){%>
        $('#tableFinaldiagnosisDesc').append('<tr style=" background-color: lightgray; " id="' + FinaldiagnosisId + '-Finaldiagnosis-rowOperation' + '"></td><td contente="true">' + FinaldiagnosisName + '</td><td contente="true"><textarea rows="10"  id="'+ FinaldiagnosisId+'-Finaldiagnosis-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteFinaldiagnosisRowClick(this)" /></td><td><input type="checkbox" id="'+FinaldiagnosisId+'-Finaldiagnosis-checkbox-highlight'+'"</td></tr>' + '');
        if(FinaldiagnosisIsHighlight=='true'){
            $('#'+FinaldiagnosisId+'-Finaldiagnosis-checkbox-highlight').prop('checked',true)
        }
    <%}else{%>
        $('#tableFinaldiagnosisDesc').append('<tr id="' + FinaldiagnosisId + '-Finaldiagnosis-rowOperation' + '"></td><td contente="true">' + FinaldiagnosisName + '</td><td contente="true"><textarea rows="10"  id="'+ FinaldiagnosisId+'-Finaldiagnosis-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteFinaldiagnosisRowClick(this)" /></td><td><input type="checkbox" id="'+FinaldiagnosisId+'-Finaldiagnosis-checkbox-highlight'+'"</td></tr>' + '');
        if(FinaldiagnosisIsHighlight=='true'){
            $('#'+FinaldiagnosisId+'-Finaldiagnosis-checkbox-highlight').prop('checked',true)
        }
    <%}%>
    autoCompleteCurrentFinaldiagnosisApply(FinaldiagnosisId + '-Finaldiagnosis-rowOperation',
            FinaldiagnosisId+ '-Finaldiagnosis-textarea');
    $('#'+FinaldiagnosisId+'-Finaldiagnosis-textarea').val(FinaldiagnosisVal);
    checkedFinaldiagnosis[checkedFinaldiagnosis.length]=FinaldiagnosisId;

    <%

               }
      }
      }
    %>
    initSelect2Finaldiagnosis();

    function initSelect2Finaldiagnosis(addId,deleteId) {
        var selected;
        var urlLoad;

        if(addId==undefined){
            selected=$("#p-FinaldiagnosisMultiSelect").select2('val');
            urlLoad = "clinic/basicInfo/diagnosis/combo/loadAll";
            var url=window.location.href;
            if(url.indexOf("null")==-1 && initStateFinaldiagnosis==true){
                var newIdWithComma='-1';
                for(var j=0;j<selectedNewId.length;j++){
                    newIdWithComma+=','+selectedNewId[j];
                }
                urlLoad = "clinic/basicInfo/diagnosis/combo/loadAll/"+newIdWithComma;
            }
        }else{
            selected=$("#p-FinaldiagnosisMultiSelect").select2('val');
            selectedNewId[selectedNewId.length]=addId;
            var newIdWithComma='-1';
            for(var j=0;j<selectedNewId.length;j++){
                newIdWithComma+=','+selectedNewId[j];
            }
            urlLoad = "clinic/basicInfo/diagnosis/combo/loadAll/"+newIdWithComma;
            checkedFinaldiagnosis[checkedFinaldiagnosis.length]=addId;
        }

        $.getJSON("<c:url value='/' />" + urlLoad, function (data) {

             FinaldiagnosisPreload_data = data;
            var preload_data2 = [];

            $.each(FinaldiagnosisPreload_data, function () {
                preload_data2.push({id:this.ComboID, text:this.ComboCaption });
            });

            $('#p-FinaldiagnosisMultiSelect').select2({
                multiple:true,
                query:function (query) {
                    var data = {results:[]};

                    $.each(FinaldiagnosisPreload_data, function () {
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
                        return {id:term+'-newMehrsysFinaldiagnosis', text:term};
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
//            $("#p-FinaldiagnosisMultiSelect").select2('val', checkedFinaldiagnosis);
            if(deleteId!=undefined){
                $("#p-FinaldiagnosisMultiSelect").select2('val',selected);
                deleteOptionFinaldiagnosis(deleteId);
                selectOptionFinaldiagnosis(addId);
            }
            if(initStateFinaldiagnosis==true){
                initStateFinaldiagnosis=false;
                            $("#p-FinaldiagnosisMultiSelect").select2('val', checkedFinaldiagnosis);
            }
        });

    }

    $('#p-FinaldiagnosisMultiSelect').on("select2-removed", function(e){

        var newCheckedFinaldiagnosis=[];
        for(var i=0;i<checkedFinaldiagnosis.length;i++){
            if(checkedFinaldiagnosis[i]!=e.choice.id){
                newCheckedFinaldiagnosis[newCheckedFinaldiagnosis.length]=checkedFinaldiagnosis[i];
            }
        }
        checkedFinaldiagnosis= newCheckedFinaldiagnosis;

        var newSelectedNewId=[]
        for(var j=0;j<selectedNewId.length;j++){
            if(selectedNewId[j]!=e.choice.id){
                newSelectedNewId[newSelectedNewId.length]=selectedNewId[j];
            }
        }
        selectedNewId=newSelectedNewId;
        addOrDeleteFinaldiagnosisTable();
    });
    $('#p-FinaldiagnosisMultiSelect').on("select2-selecting", function(e){
//        checkedFinaldiagnosis[checkedFinaldiagnosis.length]=e.object.id;
//        addOrDeleteFinaldiagnosisTable();

        var id=""+e.object.id;
        if(id.indexOf('-newMehrsysFinaldiagnosis')==-1){
//            addOperationToTableAndSelectCheckBox(e.object.id,e.object.text);
            checkedFinaldiagnosis[checkedFinaldiagnosis.length]=e.object.id;
            addOrDeleteFinaldiagnosisTable();
        }else{//should save on db
            e.object.id=e.object.id.split('-newMehrsysFinaldiagnosis')[0];
            var newItemArray=[];
            newItemArray[0]=e.object.text;
            newItemArray[1]=e.object.id;

//            var newItemArray=$(this).data('newItemArray');

            var itemArray=[];
            itemArray[0]=newItemArray[0];
            saveFinaldiagnosis(itemArray);
//            $("#dialog-confirm-save-drug").data('newItemArray',newItemArray).dialog('open');
        }
    });


    var cancelButtonFinaldiagnosisClick=false;
    $("#dialog-FinalDiagnosis").dialog({
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
                popupFinaldiagnosisOkButton();
                $(this).dialog("close");
            },
            "cancel":function () {
//                popupFinaldiagnosisCancelButton();
                cancelButtonFinaldiagnosisClick=true;
                $(this).dialog("close");
            }
        },
        close:function (event, ui) {
            if(event.which!=undefined || cancelButtonFinaldiagnosisClick==true){
                popupFinaldiagnosisCancelButton();
                cancelButtonFinaldiagnosisClick=false;
            }
            $(this).dialog("close");
        },
        open:function (event, ui) {
//            arrayCheckedBoxBeforeOpenedDrugOrder=$("#dialog-customizeDrug").find(":checkbox:checked");
            beforeCancelPopupCheckedFinaldiagnosis=[];
            for(var i=0;i<checkedFinaldiagnosis.length;i++){
                beforeCancelPopupCheckedFinaldiagnosis[i]=checkedFinaldiagnosis[i];
            }
            categoryFinalDiagnosisClick();
        }
    });

    $("#dialog-confirm-delete-Finaldiagnosis").dialog({
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
                    deleteCurrentFinaldiagnosisRow($(this).data('contents'));
                    console.log($(this).data('contents'))
                }else if($(this).data('e')!=undefined){
                    console.log("undef:"+$(this).data('contents'))

//                    var id=$(this).data('e').choice.id;
//                    if($('#' + id + '-operation-current-checkbox-rowOperation').length>0){
//                        $('#' + id + '-operation-current-checkbox-rowOperation').remove();
//                        var arrayCheckBox=$("#dialog-current-operation").find(":checkbox:checked:not([isOperationCurrentGroup])");
//                        for(var i=0;i<arrayCheckBox.length;i++){
//                            if(arrayCheckBox[i].id== id+"-operation-current-checkbox"){
//                                $("#"+id+'-operation-current-checkbox').attr('checked',false);
//                                $("#"+id+'-operation-current-checkbox').prop('checked',false);
//                            }
//                        }
//                    }
                }

                $(this).dialog("close");

            },
            "No":function () {
//                if($(this).data('e')!=undefined){
//                    selectOption($(this).data('e').choice.id);
//                }
                $(this).dialog("close");
            }
        }
    });

    function deleteCurrentFinaldiagnosisRow(contents){
        $('#' + contents[1].lastChild.children[1].id.split('-Finaldiagnosis-textarea')[0] + '-Finaldiagnosis-rowOperation').remove();
        afterRemoveRowFromTableFinaldiagnosis();
        var newCheckedFinaldiagnosis=[];
        for(var i=0;i<checkedFinaldiagnosis.length;i++){
            if(checkedFinaldiagnosis[i]!=contents[1].lastChild.children[1].id.split('-Finaldiagnosis-textarea')[0]){
                newCheckedFinaldiagnosis[newCheckedFinaldiagnosis.length]=checkedFinaldiagnosis[i];
            }
        }
        checkedFinaldiagnosis= newCheckedFinaldiagnosis;
        $("#p-FinaldiagnosisMultiSelect").select2('val',checkedFinaldiagnosis);
//        var arrayCheckedOperation = $("#dialog-current-operation").find(":checkbox:checked:not([isOperationCurrentGroup])");
//        for (var i = 0; i < arrayCheckedOperation.length; i++) {
//            if (arrayCheckedOperation[i].id == contents[1].lastChild.children[1].id+'-checkbox') {
//                arrayCheckedOperation[i].checked = false;
//            }
//        }
//        var id=contents[1].lastChild.children[1].id.split('-operation-current')[0];
//        deleteOption(id);

    }

    function addFinaldiagnosisClick() {
        $("#dialog-FinalDiagnosis").dialog("open");
    }

    function categoryFinalDiagnosisClick(e) {
        var id
        if(e==undefined){
//            id="A";
            id="All";
        }else{
            id= e.id;
        }
        $.getJSON("<c:url value='/' />" + "clinic/basicInfo/diagnosis/loadByFirstChar/" + id, function (data) {

//            try{
            deleteRowFinaldiagnosis('FinalDiagnosis-table');
//            }catch(e){

//            }

            if (data.length > 0) {
                makeTableFinaldiagnosis(data);
                checkingDialogFinalDiagnosisPopup()
            }


        });
    }

    function makeTableFinaldiagnosis(data) {
        queueRowCount = data.length;

        var tbl = document.getElementById('FinalDiagnosis-table');
        tbl.setAttribute('style', 'width: 100%');
        var tbdyPos = document.createElement('tbody');
        var currentFirstChar='';

        if (queueRowCount > 0) {
            var tr = document.createElement("tr");
            var j=0;
            for (i = 0; i < data.length; i++) {

//                if(i%4==0 || data[i].ComboCaption[0].toLowerCase()!=currentFirstChar){
                if( data[i].ComboCaption[0].toLowerCase()!=currentFirstChar){
                    currentFirstChar=data[i].ComboCaption[0].toLowerCase();
                    if(j%4!=0){
                        var w=4-j%4;
                        for(var index=0;index<w;index++){
                            blankTd = document.createElement("td");
//                            blankTd.appendChild(&nbsp);
                            tr.appendChild(blankTd);
                        }
                    }
                    tbdyPos.appendChild(tr);
                    tr = document.createElement("tr");
                    tr.className="border_top";
                    j=0
                }else if(j%4==0){
                    tbdyPos.appendChild(tr);
                    tr = document.createElement("tr");
                }
                j++;

                var td3 = document.createElement("td");
                var checkbox = document.createElement('input');
                checkbox.type = "checkbox";
                checkbox.name = data[i].ComboCaption;
//                checkbox.value = data[i].ComboID+'-FinalDiagnosis';
                checkbox.id = data[i].ComboID + '-FinalDiagnosis';
                checkbox.onclick =function(){ checkBoxFinalDiagnosisClick(this)};
                var label = document.createElement('label');
                label.htmlFor = data[i].ComboID + '-FinalDiagnosis';
                label.appendChild(document.createTextNode(data[i].ComboCaption));

                td3.appendChild(checkbox);
                td3.appendChild(label);
                tr.appendChild(td3);
            }
            tbdyPos.appendChild(tr);
            ///////////////////////////////////////////
        }
        tbl.appendChild(tbdyPos);
    }

    function  checkBoxFinalDiagnosisClick(e){
        var checkState=$(e).prop('checked');
        var newCheckedFinaldiagnosis=[];
        if(checkState){
            checkedFinaldiagnosis[checkedFinaldiagnosis.length]= e.id.split('-FinalDiagnosis')[0];
        }else{
            unCheckedFinaldiagnosis[unCheckedFinaldiagnosis.length]= e.id.split('-FinalDiagnosis')[0];
            for(var i=0;i<checkedFinaldiagnosis.length;i++){
                if(checkedFinaldiagnosis[i]!=e.id.split('-FinalDiagnosis')[0]){
                    newCheckedFinaldiagnosis[newCheckedFinaldiagnosis.length]=checkedFinaldiagnosis[i];
                }
            }
            checkedFinaldiagnosis= newCheckedFinaldiagnosis;
        }


    }

    function checkingDialogFinalDiagnosisPopup(){
        var selected=$("#p-FinaldiagnosisMultiSelect").select2('val');
        if(selected.length>0){
            for(w = 0; w < selected.length; w++){
                var found=false;
                for(j=0;j<unCheckedFinaldiagnosis.length;j++){
                    if(unCheckedFinaldiagnosis[j]==selected[w]){
                        found=true;
                    }
                }
                if(!found){
                    $("#"+selected[w]+"-FinalDiagnosis").attr('checked',true);
                    $("#"+selected[w]+"-FinalDiagnosis").prop('checked',true);
                }
            }
        }
        for(var i=0;i<checkedFinaldiagnosis.length;i++){
            $("#"+checkedFinaldiagnosis[i]+"-FinalDiagnosis").attr('checked',true);
            $("#"+checkedFinaldiagnosis[i]+"-FinalDiagnosis").prop('checked',true);
        }
    }

    function deleteRowFinaldiagnosis(tableID) {
        try {
            var table = document.getElementById(tableID);
            var rowCount = table.rows.length;
            for (var i = 0; i < rowCount; i++) {
                var row = table.rows[i];
                /*var chkbox = row.cells[0].childNodes[0];*/
                /*if (null != chkbox && true == chkbox.checked)*/
                table.deleteRow(i);
                rowCount--;
                i--;
            }
        } catch (e) {
            alert(e);
        }
    }

    function  selectOptionFinaldiagnosis(id){
        var operationIdSelect2Array=$("#p-FinaldiagnosisMultiSelect").select2('val');
        operationIdSelect2Array[operationIdSelect2Array.length]=id;
        $("#p-FinaldiagnosisMultiSelect").select2('val',operationIdSelect2Array);


    }

    function  afterRemoveRowFromTableFinaldiagnosis(){
        var array=$('#tableFinaldiagnosisDesc').find('tr');
        if(array.length==1){
            return;
        }
        $('#tableFinaldiagnosisDesc').find('tr')[1].style.backgroundColor='';
        for(var i=2;i<array.length;i++){
            if(i%2==0){
                $('#tableFinaldiagnosisDesc').find('tr')[i].style.backgroundColor='lightgray'
            }else{
                $('#tableFinaldiagnosisDesc').find('tr')[i].style.backgroundColor=''
            }
        }
    }

    function addOrDeleteFinaldiagnosisTable(){
        var FinaldiagnosisDescArray= $('#tableFinaldiagnosisDesc').parent().parent().find('textarea');
        for(var i=0;i<FinaldiagnosisDescArray.length;i++){
            var found=false;
            for(var j=0;j<checkedFinaldiagnosis.length;j++){
               if(FinaldiagnosisDescArray[i].id.split('-Finaldiagnosis-textarea')[0]==checkedFinaldiagnosis[j]){
                   found=true;
                   break;
               }
            }
            //not found in  checkedFinaldiagnosis so delete from table
            if(!found){
                $('#' + FinaldiagnosisDescArray[i].id.split('-Finaldiagnosis-textarea')[0] + '-Finaldiagnosis-rowOperation').remove();
                afterRemoveRowFromTableFinaldiagnosis()
            }
        }

        for(var k=0;k<checkedFinaldiagnosis.length;k++){
            var foundFinaldiagnosis=false;
            for(var w=0;w<FinaldiagnosisDescArray.length;w++){
               if(FinaldiagnosisDescArray[w].id.split('-Finaldiagnosis-textarea')[0]==checkedFinaldiagnosis[k]){
                   foundFinaldiagnosis=true;
                   break;
               }
            }
            //not found in  checkedFinaldiagnosis so delete from table
            if(!foundFinaldiagnosis){
                var name;
                for(var l=0;l<FinaldiagnosisPreload_data.length;l++){
                    if(FinaldiagnosisPreload_data[l].ComboID==checkedFinaldiagnosis[k]){
                         name= FinaldiagnosisPreload_data[l].ComboCaption;
                    }
                }
                $('#tableFinaldiagnosisDesc').append('<tr id="' + checkedFinaldiagnosis[k] + '-Finaldiagnosis-rowOperation' + '"></td><td contente="true">' + name + '</td><td contente="true"><textarea rows="10"  id="'+ checkedFinaldiagnosis[k]+'-Finaldiagnosis-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteFinaldiagnosisRowClick(this)" /></td><td><input type="checkbox" id="'+checkedFinaldiagnosis[k]+'-Finaldiagnosis-checkbox-highlight'+'"</td></tr>' + '');
                afterRemoveRowFromTableFinaldiagnosis();
                autoCompleteCurrentFinaldiagnosisApply(checkedFinaldiagnosis[k] + '-Finaldiagnosis-rowOperation',
                        checkedFinaldiagnosis[k]+ '-Finaldiagnosis-textarea');
            }
        }
    }

    function deleteFinaldiagnosisRowClick(th) {
        var contents = $(th).parent().parent().find('td[contente=true]');
        if(contents[1].lastChild.children[1].value.trim().length>0){

            $("#dialog-confirm-delete-Finaldiagnosis").data('contents', contents).dialog("open");

        }else{
            deleteCurrentFinaldiagnosisRow(contents);
        }
        <!--$("#p-operationMultiSelect-current").select2('val', ${operationIds});-->

    }

    function deleteOptionFinaldiagnosis(id){
        var operationIdSelect2Array=$("#p-FinaldiagnosisMultiSelect").select2('val');
        var newOperationIdSelect2Array=[];
        var index=0;
        for(var j=0;j<operationIdSelect2Array.length;j++){
            if(id!=operationIdSelect2Array[j]){
                newOperationIdSelect2Array[index]=operationIdSelect2Array[j];
                index++;
            }
        }
        $("#p-FinaldiagnosisMultiSelect").select2('val',newOperationIdSelect2Array);
    }

    function popupFinaldiagnosisOkButton(){
//        var arrayCheckedLabTest = $("#dialog-FinalDiagnosis").find(":checkbox:checked");
        var selectedLabTestInComboArray = $("#p-FinaldiagnosisMultiSelect").select2('val');
        if ($("#p-FinaldiagnosisMultiSelect").select2('val').length>0 ) {
            for (var j = 0; j < selectedLabTestInComboArray.length; j++) {
                var found = false;
                for (var index = 0; index < checkedFinaldiagnosis.length; index++) {
                    if (checkedFinaldiagnosis[index] == selectedLabTestInComboArray[j]) {
                        found = true;
                        break;
                    }
                }
                if (found == false) {
                    deleteOptionFinaldiagnosis(selectedLabTestInComboArray[j])
                }
            }
        }
        for (var index = 0; index < checkedFinaldiagnosis.length; index++) {
            var id = checkedFinaldiagnosis[index];
            selectOptionFinaldiagnosis(id);
        }
        addOrDeleteFinaldiagnosisTable();

    }

    function popupFinaldiagnosisCancelButton(){
        checkedFinaldiagnosis=[];
        for(var i=0;i<beforeCancelPopupCheckedFinaldiagnosis.length;i++){
            checkedFinaldiagnosis[i]=beforeCancelPopupCheckedFinaldiagnosis[i];
        }
    }


    jQuery('body')
            .bind(
            'click',
            function (e) {
                if (
                        jQuery('#dialog-FinalDiagnosis').dialog('isOpen')
                                && !jQuery(e.target).is('.ui-dialog, a')
                                && !jQuery(e.target).closest('.ui-dialog').length
                                && event.target.nodeName!="BUTTON"
                        ) {
                    popupFinaldiagnosisOkButton();
                    jQuery('#dialog-FinalDiagnosis').dialog('close');
                }
            }
    );

    function autoCompleteCurrentFinaldiagnosisApply(trId,textAreaId){
        var elem = $("[id='"+ textAreaId+"']");
        var FinaldiagnosisName=$("#"+trId).find('td')[0].innerHTML;
        elem.textcomplete([{
            match: /(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
            search: function (term, callback) {
                Common.postJSON("${pageContext.request.contextPath}" +
                        "/clinic/patient/neurology/diagnosisDescAutoComplete/" + FinaldiagnosisName, JSON.stringify({token:term}),
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

    function saveFinaldiagnosis(newItemArray){
        var data = {};
        data.newFinaldiagnosisOrder=newItemArray;
        if(newItemArray.length>0){
            $.ajax({
                url: '${pageContext.request.contextPath}'+'/clinic/patient/neurology/savediagnosistt/',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                dataType: 'json',
                type: 'POST',
                success: function (data, success, xhr) {
                    if(data.FinaldiagnosisId!=undefined){
//                        var split = data.saveOperation.split(';;;;');
//                        if (split.length > 1) {
//                            for (var i = 0; i < split.length - 1; i = i + 2) {
                        $('#tableFinaldiagnosisDesc').append('<tr id="' + data.FinaldiagnosisId + '-Finaldiagnosis-rowOperation' + '"></td><td contente="true">' + data.FinaldiagnosisName + '</td><td contente="true"><textarea rows="10"  id="'+ data.FinaldiagnosisId+'-Finaldiagnosis-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteFinaldiagnosisRowClick(this)" /></td><td><input type="checkbox" id="'+data.FinaldiagnosisId+'-Finaldiagnosis-checkbox-highlight'+'"</td></tr>' + '');
                        afterRemoveRowFromTableFinaldiagnosis();
//                                $('#tableCurrentOperation').append('<tr id="' + split[i] + '-operation-current-checkbox-rowOperation' + '"></td><td contente="true">' + split[i+1] + '</td><td contente="true"><textarea rows="10"  id="'+split[i]+'-operation-current'+'" class="operation-description" style="overflow-y: auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteCurrentOperationClick(this)" /></td><td><input type="checkbox" id="'+split[i]+'-currentOperation-Finaldiagnosis-Finaldiagnosis-checkbox-highlight'+'"</td></tr>' + '');
                        autoCompleteCurrentFinaldiagnosisApply(data.FinaldiagnosisId + '-Finaldiagnosis-rowOperation',
                                data.FinaldiagnosisId+ '-Finaldiagnosis-textarea');
//                                var allOperation = $("#dialog-current-operation").find(":checkbox");
//                                for (var w = 0; w < allOperation.length; w++) {
//                                    if (allOperation[w].id == split[i]+ '-operation-current-checkbox') {
//                                        allOperation[w].checked = true;
//                                    }
//                                }
//                            }
                            initSelect2Finaldiagnosis(data.FinaldiagnosisId,data.FinaldiagnosisName);
                            document.getElementById('s2id_autogen12').focus();
//                        initOrderSelect2();
//                        }
                    }


                },
                error: function (e) {
//                alert('Error121212: ' + e.responseText);
                }
            });
        }
    }




</script>
<style type="text/css">
    /*a {color:#FF0000;}      *//* unvisited link */
    a:visited {color:#000000;}  /* visited link */
    a:hover {color:#FF00FF;}  /* mouse over link */
    a:active {color:#0000FF;}  /* selected link */

    .select2-results{
        text-align: left;
    }

    tr.border_top td {
        border-top:1pt solid black;
    }
</style>
