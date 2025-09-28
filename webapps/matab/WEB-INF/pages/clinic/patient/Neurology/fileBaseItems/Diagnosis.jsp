<%@ page import="java.util.ResourceBundle" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<%@ page import="com.mongodb.DBObject" %>
<%@ page import="java.util.List" %>
<%--
    <div class="uk-width-1-1" id="diagnosis-kanban-static" style="z-index:-1; height:100%">
        <textarea rows="5" name="p-diagnosis" id="p-diagnosis" style="overflow-y: auto;overflow-x:auto; width: 100%; width:100% !important; height:100%; direction: ltr; text-align: left"  >&nbsp;</textarea>
    </div>

<script type="text/javascript">
$(function(){
    initdiagnosisAutocomplate();
});

function initdiagnosisAutocomplate(){
    $("#p-diagnosis").textcomplete([{
            match: /(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
            search: function (term, callback) {
                Common.postJSON("${pageContext.request.contextPath}"+"/clinic/patient/visitMobileBase/diagnosisAutoComplete/" , JSON.stringify({token: term}), function(data){
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
    <label dir="ltr">All Diagnosis</label>
    <input type="hidden" id="p-diagnosisMultiSelect" style="direction:ltr; width: 100%; height:100%;text-align: left "/>
    <%--<div>--%>
    <button name="Adddiagnosis" id="addCurrentdiagnosis" class="uk-button-success uk-active" style="margin-top:10px;height:29px" onclick="adddiagnosisClick()"
            title="Adddiagnosis">Add Diagnosis
    </button>
    <%--</div>--%>
    <div id="tableCurrentOperationDiv" style=" padding-top: 10px; ">
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

<div id="dialog-Diagnosis" title='Select Diagnosis'
     style="display:none;direction: ltr;height: 100% !important;">
    <form class="toPopup" style="direction: ltr">

        <table align="center" width="100%">
            <tr>
                <td>
                <a href="#" id="All" onclick="categoryDiagnosisClick(this)">All</a>
                </td>
                <td>
                    <a href="#" id="A" onclick="categoryDiagnosisClick(this)">A</a>
                </td>
                <td>
                    <a href="#" id="B" onclick="categoryDiagnosisClick(this)">B</a>
                </td>
                <td>
                    <a href="#" id="C" onclick="categoryDiagnosisClick(this)">C</a>
                </td>
                <td>
                    <a href="#" id="D" onclick="categoryDiagnosisClick(this)">D</a>
                </td>
                <td>
                    <a href="#" id="E" onclick="categoryDiagnosisClick(this)">E</a>
                </td>
                <td>
                    <a href="#" id="F" onclick="categoryDiagnosisClick(this)">F</a>
                </td>
                <td>
                    <a href="#" id="G" onclick="categoryDiagnosisClick(this)">G</a>
                </td>
                <td>
                    <a href="#" id="H" onclick="categoryDiagnosisClick(this)">H</a>
                </td>
                <td>
                    <a href="#" id="I" onclick="categoryDiagnosisClick(this)">I</a>
                </td>
                <td>
                    <a href="#" id="J" onclick="categoryDiagnosisClick(this)">J</a>
                </td>
                <td>
                    <a href="#" id="K" onclick="categoryDiagnosisClick(this)">K</a>
                </td>
                <td>
                    <a href="#" id="L" onclick="categoryDiagnosisClick(this)">L</a>
                </td>
                <td>
                    <a href="#" id="M" onclick="categoryDiagnosisClick(this)">M</a>
                </td>
                <td>
                    <a href="#" id="N" onclick="categoryDiagnosisClick(this)">N</a>
                </td>
                <td>
                    <a href="#" id="O" onclick="categoryDiagnosisClick(this)">O</a>
                </td>
                <td>
                    <a href="#" id="P" onclick="categoryDiagnosisClick(this)">P</a>
                </td>
                <td>
                    <a href="#" id="Q" onclick="categoryDiagnosisClick(this)">Q</a>
                </td>
                <td>
                    <a href="#" id="R" onclick="categoryDiagnosisClick(this)">R</a>
                </td>
                <td>
                    <a href="#" id="S" onclick="categoryDiagnosisClick(this)">S</a>
                </td>
                <td>
                    <a href="#" id="T" onclick="categoryDiagnosisClick(this)">T</a>
                </td>
                <td>
                    <a href="#" id="U" onclick="categoryDiagnosisClick(this)">U</a>
                </td>
                <td>
                    <a href="#" id="V" onclick="categoryDiagnosisClick(this)">V</a>
                </td>
                <td>
                    <a href="#" id="W" onclick="categoryDiagnosisClick(this)">W</a>
                </td>
                <td>
                    <a href="#" id="X" onclick="categoryDiagnosisClick(this)">X</a>
                </td>
                <td>
                    <a href="#" id="Y" onclick="categoryDiagnosisClick(this)">Y</a>
                </td>
                <td>
                    <a href="#" id="Z" onclick="categoryDiagnosisClick(this)">Z</a>
                </td>

            </tr>

        </table>
        <%--<table id="Diagnosis-table" align="center" width="100%" border="1" style="font-size: 30px !important; padding-top:40px;">--%>
        <table id="Diagnosis-table" align="center">
        </table>
    </form>
</div>

<script type="text/javascript">
    var checkeddiagnosis=[]
    var beforeCancelPopupCheckeddiagnosis=[]
    var unCheckeddiagnosis=[];
    var diagnosisPreload_data;
    var initStatediagnosis=true;
    var selectedNewId=[];

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
    <%if(i%2==1){%>
        $('#tablediagnosisDesc').append('<tr style=" background-color: lightgray; " id="' + diagnosisId + '-diagnosis-rowOperation' + '"></td><td contente="true">' + diagnosisName + '</td><td contente="true"><textarea rows="10"  id="'+ diagnosisId+'-diagnosis-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletediagnosisRowClick(this)" /></td><td><input type="checkbox" id="'+diagnosisId+'-diagnosis-checkbox-highlight'+'"</td></tr>' + '');
        if(diagnosisIsHighlight=='true'){
            $('#'+diagnosisId+'-diagnosis-checkbox-highlight').prop('checked',true)
        }
    <%}else{%>
        $('#tablediagnosisDesc').append('<tr id="' + diagnosisId + '-diagnosis-rowOperation' + '"></td><td contente="true">' + diagnosisName + '</td><td contente="true"><textarea rows="10"  id="'+ diagnosisId+'-diagnosis-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletediagnosisRowClick(this)" /></td><td><input type="checkbox" id="'+diagnosisId+'-diagnosis-checkbox-highlight'+'"</td></tr>' + '');
        if(diagnosisIsHighlight=='true'){
            $('#'+diagnosisId+'-diagnosis-checkbox-highlight').prop('checked',true)
        }
    <%}%>
    autoCompleteCurrentdiagnosisApply(diagnosisId + '-diagnosis-rowOperation',
            diagnosisId+ '-diagnosis-textarea');
    $('#'+diagnosisId+'-diagnosis-textarea').val(diagnosisVal);
    checkeddiagnosis[checkeddiagnosis.length]=diagnosisId;

    <%

               }
      }
      }
    %>
    initSelect2diagnosis();

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
//            $("#p-diagnosisMultiSelect").select2('val', checkeddiagnosis);
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

        var newCheckeddiagnosis=[];
        for(var i=0;i<checkeddiagnosis.length;i++){
            if(checkeddiagnosis[i]!=e.choice.id){
                newCheckeddiagnosis[newCheckeddiagnosis.length]=checkeddiagnosis[i];
            }
        }
        checkeddiagnosis= newCheckeddiagnosis;

        var newSelectedNewId=[]
        for(var j=0;j<selectedNewId.length;j++){
            if(selectedNewId[j]!=e.choice.id){
                newSelectedNewId[newSelectedNewId.length]=selectedNewId[j];
            }
        }
        selectedNewId=newSelectedNewId;
        addOrDeletediagnosisTable();
    });
    $('#p-diagnosisMultiSelect').on("select2-selecting", function(e){
//        checkeddiagnosis[checkeddiagnosis.length]=e.object.id;
//        addOrDeletediagnosisTable();

        var id=""+e.object.id;
        if(id.indexOf('-newMehrsysdiagnosis')==-1){
//            addOperationToTableAndSelectCheckBox(e.object.id,e.object.text);
            checkeddiagnosis[checkeddiagnosis.length]=e.object.id;
            addOrDeletediagnosisTable();
        }else{//should save on db
            e.object.id=e.object.id.split('-newMehrsysdiagnosis')[0];
            var newItemArray=[];
            newItemArray[0]=e.object.text;
            newItemArray[1]=e.object.id;

//            var newItemArray=$(this).data('newItemArray');

            var itemArray=[];
            itemArray[0]=newItemArray[0];
            savediagnosis(itemArray);
//            $("#dialog-confirm-save-drug").data('newItemArray',newItemArray).dialog('open');
        }
    });


    var cancelButtondiagnosisClick=false;
    $("#dialog-Diagnosis").dialog({
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
                popupdiagnosisOkButton();
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
        }
    });

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
        height:800,
        width:800,
        modal:true,
        buttons:{
            "Yes":function () {
                if($(this).data('contents')!=undefined){
                    deleteCurrentdiagnosisRow($(this).data('contents'));
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

    function deleteCurrentdiagnosisRow(contents){
        $('#' + contents[1].lastChild.children[1].id.split('-diagnosis-textarea')[0] + '-diagnosis-rowOperation').remove();
        afterRemoveRowFromTablediagnosis();
        var newCheckeddiagnosis=[];
        for(var i=0;i<checkeddiagnosis.length;i++){
            if(checkeddiagnosis[i]!=contents[1].lastChild.children[1].id.split('-diagnosis-textarea')[0]){
                newCheckeddiagnosis[newCheckeddiagnosis.length]=checkeddiagnosis[i];
            }
        }
        checkeddiagnosis= newCheckeddiagnosis;
        $("#p-diagnosisMultiSelect").select2('val',checkeddiagnosis);
//        var arrayCheckedOperation = $("#dialog-current-operation").find(":checkbox:checked:not([isOperationCurrentGroup])");
//        for (var i = 0; i < arrayCheckedOperation.length; i++) {
//            if (arrayCheckedOperation[i].id == contents[1].lastChild.children[1].id+'-checkbox') {
//                arrayCheckedOperation[i].checked = false;
//            }
//        }
//        var id=contents[1].lastChild.children[1].id.split('-operation-current')[0];
//        deleteOption(id);

    }

    function adddiagnosisClick() {
        $("#dialog-Diagnosis").dialog("open");
    }

    function categoryDiagnosisClick(e) {
        var id
        if(e==undefined){
//            id="A";
            id="All";
        }else{
            id= e.id;
        }
        $.getJSON("<c:url value='/' />" + "clinic/basicInfo/diagnosis/loadByFirstChar/" + id, function (data) {

//            try{
            deleteRowdiagnosis('Diagnosis-table');
//            }catch(e){

//            }

            if (data.length > 0) {
                makeTablediagnosis(data);
                checkingDialogDiagnosisPopup()
            }


        });
    }

    function makeTablediagnosis(data) {
        queueRowCount = data.length;

        var tbl = document.getElementById('Diagnosis-table');
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
//                checkbox.value = data[i].ComboID+'-Diagnosis';
                checkbox.id = data[i].ComboID + '-Diagnosis';
                checkbox.onclick =function(){ checkBoxDiagnosisClick(this)};
                var label = document.createElement('label');
                label.htmlFor = data[i].ComboID + '-Diagnosis';
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

    function deleteRowdiagnosis(tableID) {
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

    function  selectOptiondiagnosis(id){
        var operationIdSelect2Array=$("#p-diagnosisMultiSelect").select2('val');
        operationIdSelect2Array[operationIdSelect2Array.length]=id;
        $("#p-diagnosisMultiSelect").select2('val',operationIdSelect2Array);


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
                $('#' + diagnosisDescArray[i].id.split('-diagnosis-textarea')[0] + '-diagnosis-rowOperation').remove();
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
                $('#tablediagnosisDesc').append('<tr id="' + checkeddiagnosis[k] + '-diagnosis-rowOperation' + '"></td><td contente="true">' + name + '</td><td contente="true"><textarea rows="10"  id="'+ checkeddiagnosis[k]+'-diagnosis-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletediagnosisRowClick(this)" /></td><td><input type="checkbox" id="'+checkeddiagnosis[k]+'-diagnosis-checkbox-highlight'+'"</td></tr>' + '');
                afterRemoveRowFromTablediagnosis();
                autoCompleteCurrentdiagnosisApply(checkeddiagnosis[k] + '-diagnosis-rowOperation',
                        checkeddiagnosis[k]+ '-diagnosis-textarea');
            }
        }
    }

    function deletediagnosisRowClick(th) {
        var contents = $(th).parent().parent().find('td[contente=true]');
        if(contents[1].lastChild.children[1].value.trim().length>0){

            $("#dialog-confirm-delete-diagnosis").data('contents', contents).dialog("open");

        }else{
            deleteCurrentdiagnosisRow(contents);
        }
        <!--$("#p-operationMultiSelect-current").select2('val', ${operationIds});-->

    }

    function deleteOptiondiagnosis(id){
        var operationIdSelect2Array=$("#p-diagnosisMultiSelect").select2('val');
        var newOperationIdSelect2Array=[];
        var index=0;
        for(var j=0;j<operationIdSelect2Array.length;j++){
            if(id!=operationIdSelect2Array[j]){
                newOperationIdSelect2Array[index]=operationIdSelect2Array[j];
                index++;
            }
        }
        $("#p-diagnosisMultiSelect").select2('val',newOperationIdSelect2Array);
    }

    function popupdiagnosisOkButton(){
//        var arrayCheckedLabTest = $("#dialog-Diagnosis").find(":checkbox:checked");
        var selectedLabTestInComboArray = $("#p-diagnosisMultiSelect").select2('val');
        if ($("#p-diagnosisMultiSelect").select2('val').length>0 ) {
            for (var j = 0; j < selectedLabTestInComboArray.length; j++) {
                var found = false;
                for (var index = 0; index < checkeddiagnosis.length; index++) {
                    if (checkeddiagnosis[index] == selectedLabTestInComboArray[j]) {
                        found = true;
                        break;
                    }
                }
                if (found == false) {
                    deleteOptiondiagnosis(selectedLabTestInComboArray[j])
                }
            }
        }
        for (var index = 0; index < checkeddiagnosis.length; index++) {
            var id = checkeddiagnosis[index];
            selectOptiondiagnosis(id);
        }
        addOrDeletediagnosisTable();

    }

    function popupdiagnosisCancelButton(){
        checkeddiagnosis=[];
        for(var i=0;i<beforeCancelPopupCheckeddiagnosis.length;i++){
            checkeddiagnosis[i]=beforeCancelPopupCheckeddiagnosis[i];
        }
    }


    jQuery('body')
            .bind(
            'click',
            function (e) {
                if (
                        jQuery('#dialog-Diagnosis').dialog('isOpen')
                                && !jQuery(e.target).is('.ui-dialog, a')
                                && !jQuery(e.target).closest('.ui-dialog').length
                                && event.target.nodeName!="BUTTON"
                        ) {
                    popupdiagnosisOkButton();
                    jQuery('#dialog-Diagnosis').dialog('close');
                }
            }
    );

    function autoCompleteCurrentdiagnosisApply(trId,textAreaId){
        var elem = $("[id='"+ textAreaId+"']");
        var diagnosisName=$("#"+trId).find('td')[0].innerHTML;
        elem.textcomplete([{
            match: /(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
            search: function (term, callback) {
                Common.postJSON("${pageContext.request.contextPath}" +
                        "/clinic/patient/neurology/diagnosisDescAutoComplete/" + diagnosisName, JSON.stringify({token:term}),
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
                url: '${pageContext.request.contextPath}'+'/clinic/patient/neurology/savediagnosistt/',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                dataType: 'json',
                type: 'POST',
                success: function (data, success, xhr) {
                    if(data.diagnosisId!=undefined){
//                        var split = data.saveOperation.split(';;;;');
//                        if (split.length > 1) {
//                            for (var i = 0; i < split.length - 1; i = i + 2) {
                        $('#tablediagnosisDesc').append('<tr id="' + data.diagnosisId + '-diagnosis-rowOperation' + '"></td><td contente="true">' + data.diagnosisName + '</td><td contente="true"><textarea rows="10"  id="'+ data.diagnosisId+'-diagnosis-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletediagnosisRowClick(this)" /></td><td><input type="checkbox" id="'+data.diagnosisId+'-diagnosis-checkbox-highlight'+'"</td></tr>' + '');
                        afterRemoveRowFromTablediagnosis();
//                                $('#tableCurrentOperation').append('<tr id="' + split[i] + '-operation-current-checkbox-rowOperation' + '"></td><td contente="true">' + split[i+1] + '</td><td contente="true"><textarea rows="10"  id="'+split[i]+'-operation-current'+'" class="operation-description" style="overflow-y: auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteCurrentOperationClick(this)" /></td><td><input type="checkbox" id="'+split[i]+'-currentOperation-diagnosis-diagnosis-checkbox-highlight'+'"</td></tr>' + '');
                        autoCompleteCurrentdiagnosisApply(data.diagnosisId + '-diagnosis-rowOperation',
                                data.diagnosisId+ '-diagnosis-textarea');
//                                var allOperation = $("#dialog-current-operation").find(":checkbox");
//                                for (var w = 0; w < allOperation.length; w++) {
//                                    if (allOperation[w].id == split[i]+ '-operation-current-checkbox') {
//                                        allOperation[w].checked = true;
//                                    }
//                                }
//                            }
                            initSelect2diagnosis(data.diagnosisId,data.diagnosisName);
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
