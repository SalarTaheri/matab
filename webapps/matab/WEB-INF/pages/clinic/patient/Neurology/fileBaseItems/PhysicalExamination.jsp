<%@ page import="java.util.ResourceBundle" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<%@ page import="com.mongodb.DBObject" %>
<%@ page import="java.util.List" %>
<%--
    <div class="uk-width-1-1" id="physicalExamination-kanban-static" style="z-index:-1; height:100%">
        <textarea rows="5" name="p-physicalExamination" id="p-physicalExamination" style="overflow-y: auto;overflow-x:auto; width: 100%; width:100% !important; height:100%; direction: ltr; text-align: left"  >&nbsp;</textarea>
    </div>

<script type="text/javascript">
$(function(){
    initphysicalExaminationAutocomplate();
});

function initphysicalExaminationAutocomplate(){
    $("#p-physicalExamination").textcomplete([{
            match: /(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
            search: function (term, callback) {
                Common.postJSON("${pageContext.request.contextPath}"+"/clinic/patient/neurology/physicalExaminationAutoComplete/" , JSON.stringify({token: term}), function(data){
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
    <label dir="ltr">All Physical Examination</label>
    <input type="hidden" id="p-physicalExaminationMultiSelect" style="direction:ltr; width: 100%; height:100%;text-align: left "/>
    <%--<div>--%>
    <button name="AddphysicalExamination" id="addCurrentphysicalExamination" class="uk-button-success uk-active" style="margin-top:10px;height:29px" onclick="addphysicalExaminationClick()"
            title="AddphysicalExamination">Add physicalExamination
    </button>
    <%--</div>--%>
    <div id="tableCurrentOperationDiv" style=" padding-top: 10px; ">
        <table id="tablephysicalExaminationDesc" height="100%" width="100%" style="text-align: center;background-color: #ffffff;" border="2" dir="ltr">
            <tr style=" background: -webkit-linear-gradient(top, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%); height: 25px; ">
                <th id="physicalExamination">
                    physicalExamination
                </th>
                <th id="physicalExaminationValue">
                    Description
                </th>

                <th id="deletephysicalExamination">
                    Delete
                </th>
                <th id="highlightphysicalExamination">
                    Highlight
                </th>
            </tr>

        </table>
    </div>
</div>

<div id="dialog-confirm-delete-physicalExamination"  style="display:none;direction: rtl;height: 100% !important;">
    <p><%=areUShureDeleteRow%></p>
</div>

<div id="dialog-physicalExamination" title='Select physicalExamination'
     style="display:none;direction: ltr;height: 100% !important;">
    <form class="toPopup" style="direction: ltr">

        <table align="center" width="100%">
            <tr>
                <td>
                <a href="#" id="All" onclick="categoryphysicalExaminationClick(this)">All</a>
                </td>
                <td>
                    <a href="#" id="A" onclick="categoryphysicalExaminationClick(this)">A</a>
                </td>
                <td>
                    <a href="#" id="B" onclick="categoryphysicalExaminationClick(this)">B</a>
                </td>
                <td>
                    <a href="#" id="C" onclick="categoryphysicalExaminationClick(this)">C</a>
                </td>
                <td>
                    <a href="#" id="D" onclick="categoryphysicalExaminationClick(this)">D</a>
                </td>
                <td>
                    <a href="#" id="E" onclick="categoryphysicalExaminationClick(this)">E</a>
                </td>
                <td>
                    <a href="#" id="F" onclick="categoryphysicalExaminationClick(this)">F</a>
                </td>
                <td>
                    <a href="#" id="G" onclick="categoryphysicalExaminationClick(this)">G</a>
                </td>
                <td>
                    <a href="#" id="H" onclick="categoryphysicalExaminationClick(this)">H</a>
                </td>
                <td>
                    <a href="#" id="I" onclick="categoryphysicalExaminationClick(this)">I</a>
                </td>
                <td>
                    <a href="#" id="J" onclick="categoryphysicalExaminationClick(this)">J</a>
                </td>
                <td>
                    <a href="#" id="K" onclick="categoryphysicalExaminationClick(this)">K</a>
                </td>
                <td>
                    <a href="#" id="L" onclick="categoryphysicalExaminationClick(this)">L</a>
                </td>
                <td>
                    <a href="#" id="M" onclick="categoryphysicalExaminationClick(this)">M</a>
                </td>
                <td>
                    <a href="#" id="N" onclick="categoryphysicalExaminationClick(this)">N</a>
                </td>
                <td>
                    <a href="#" id="O" onclick="categoryphysicalExaminationClick(this)">O</a>
                </td>
                <td>
                    <a href="#" id="P" onclick="categoryphysicalExaminationClick(this)">P</a>
                </td>
                <td>
                    <a href="#" id="Q" onclick="categoryphysicalExaminationClick(this)">Q</a>
                </td>
                <td>
                    <a href="#" id="R" onclick="categoryphysicalExaminationClick(this)">R</a>
                </td>
                <td>
                    <a href="#" id="S" onclick="categoryphysicalExaminationClick(this)">S</a>
                </td>
                <td>
                    <a href="#" id="T" onclick="categoryphysicalExaminationClick(this)">T</a>
                </td>
                <td>
                    <a href="#" id="U" onclick="categoryphysicalExaminationClick(this)">U</a>
                </td>
                <td>
                    <a href="#" id="V" onclick="categoryphysicalExaminationClick(this)">V</a>
                </td>
                <td>
                    <a href="#" id="W" onclick="categoryphysicalExaminationClick(this)">W</a>
                </td>
                <td>
                    <a href="#" id="X" onclick="categoryphysicalExaminationClick(this)">X</a>
                </td>
                <td>
                    <a href="#" id="Y" onclick="categoryphysicalExaminationClick(this)">Y</a>
                </td>
                <td>
                    <a href="#" id="Z" onclick="categoryphysicalExaminationClick(this)">Z</a>
                </td>

            </tr>

        </table>
        <%--<table id="physicalExamination-table" align="center" width="100%" border="1" style="font-size: 30px !important; padding-top:40px;">--%>
        <table id="physicalExamination-table" align="center">
        </table>
    </form>
</div>

<script type="text/javascript">
    var checkedphysicalExamination=[]
    var beforeCancelPopupCheckedphysicalExamination=[]
    var unCheckedphysicalExamination=[];
    var physicalExaminationPreload_data;
    var initStatephysicalExamination=true;
    var selectedNewId=[];

    <%
    if(!(request.getAttribute("physicalExaminationWithValueList") instanceof String)){
        List<DBObject> list = (List)request.getAttribute("physicalExaminationWithValueList");
        if(list!=null){
            for(int i=0; i <list.size(); i++) {
                DBObject dbObject=list.get(i);
                String physicalExaminationId=dbObject.get("physicalExaminationId").toString().trim();
                String physicalExaminationName=dbObject.get("physicalExaminationName").toString().trim();
                String physicalExaminationVal=dbObject.get("physicalExaminationVal").toString().trim();
                Object physicalExaminationIsHighlight=dbObject.get("physicalExaminationIsHighlight");
                physicalExaminationVal= StringEscapeUtils.escapeEcmaScript(physicalExaminationVal);
    %>
    var physicalExaminationId = '<%=physicalExaminationId%>';
    var physicalExaminationName = '<%=physicalExaminationName%>';
    var physicalExaminationVal = '<%=physicalExaminationVal%>';
    var physicalExaminationIsHighlight = '<%=physicalExaminationIsHighlight%>';
    selectedNewId[selectedNewId.length]=physicalExaminationId;
    <%if(i%2==1){%>
        $('#tablephysicalExaminationDesc').append('<tr style=" background-color: lightgray; " id="' + physicalExaminationId + '-physicalExamination-rowOperation' + '"></td><td contente="true">' + physicalExaminationName + '</td><td contente="true"><textarea rows="10"  id="'+ physicalExaminationId+'-physicalExamination-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletephysicalExaminationRowClick(this)" /></td><td><input type="checkbox" id="'+physicalExaminationId+'-physicalExamination-checkbox-highlight'+'"</td></tr>' + '');
        if(physicalExaminationIsHighlight=='true'){
            $('#'+physicalExaminationId+'-physicalExamination-checkbox-highlight').prop('checked',true)
        }
    <%}else{%>
        $('#tablephysicalExaminationDesc').append('<tr id="' + physicalExaminationId + '-physicalExamination-rowOperation' + '"></td><td contente="true">' + physicalExaminationName + '</td><td contente="true"><textarea rows="10"  id="'+ physicalExaminationId+'-physicalExamination-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletephysicalExaminationRowClick(this)" /></td><td><input type="checkbox" id="'+physicalExaminationId+'-physicalExamination-checkbox-highlight'+'"</td></tr>' + '');
        if(physicalExaminationIsHighlight=='true'){
            $('#'+physicalExaminationId+'-physicalExamination-checkbox-highlight').prop('checked',true)
        }
    <%}%>
    autoCompleteCurrentphysicalExaminationApply(physicalExaminationId + '-physicalExamination-rowOperation',
            physicalExaminationId+ '-physicalExamination-textarea');
    $('#'+physicalExaminationId+'-physicalExamination-textarea').val(physicalExaminationVal);
    checkedphysicalExamination[checkedphysicalExamination.length]=physicalExaminationId;

    <%

               }
      }
      }
    %>
    initSelect2physicalExamination();

    function initSelect2physicalExamination(addId,deleteId) {
        var selected;
        var urlLoad;

        if(addId==undefined){
            selected=$("#p-physicalExaminationMultiSelect").select2('val');
            urlLoad = "clinic/basicInfo/physicalExamination/combo/loadAll";
            var url=window.location.href;
            if(url.indexOf("null")==-1 && initStatephysicalExamination==true){
                var newIdWithComma='-1';
                for(var j=0;j<selectedNewId.length;j++){
                    newIdWithComma+=','+selectedNewId[j];
                }
                urlLoad = "clinic/basicInfo/physicalExamination/combo/loadAll/"+newIdWithComma;
            }
        }else{
            selected=$("#p-physicalExaminationMultiSelect").select2('val');
            selectedNewId[selectedNewId.length]=addId;
            var newIdWithComma='-1';
            for(var j=0;j<selectedNewId.length;j++){
                newIdWithComma+=','+selectedNewId[j];
            }
            urlLoad = "clinic/basicInfo/physicalExamination/combo/loadAll/"+newIdWithComma;
            checkedphysicalExamination[checkedphysicalExamination.length]=addId;
        }

        $.getJSON("<c:url value='/' />" + urlLoad, function (data) {

             physicalExaminationPreload_data = data;
            var preload_data2 = [];

            $.each(physicalExaminationPreload_data, function () {
                preload_data2.push({id:this.ComboID, text:this.ComboCaption });
            });

            $('#p-physicalExaminationMultiSelect').select2({
                multiple:true,
                query:function (query) {
                    var data = {results:[]};

                    $.each(physicalExaminationPreload_data, function () {
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
                        return {id:term+'-newMehrsysphysicalExamination', text:term};
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
//            $("#p-physicalExaminationMultiSelect").select2('val', checkedphysicalExamination);
            if(deleteId!=undefined){
                $("#p-physicalExaminationMultiSelect").select2('val',selected);
                deleteOptionphysicalExamination(deleteId);
                selectOptionphysicalExamination(addId);
            }
            if(initStatephysicalExamination==true){
                initStatephysicalExamination=false;
                            $("#p-physicalExaminationMultiSelect").select2('val', checkedphysicalExamination);
            }
        });

    }

    $('#p-physicalExaminationMultiSelect').on("select2-removed", function(e){

        var newCheckedphysicalExamination=[];
        for(var i=0;i<checkedphysicalExamination.length;i++){
            if(checkedphysicalExamination[i]!=e.choice.id){
                newCheckedphysicalExamination[newCheckedphysicalExamination.length]=checkedphysicalExamination[i];
            }
        }
        checkedphysicalExamination= newCheckedphysicalExamination;

        var newSelectedNewId=[]
        for(var j=0;j<selectedNewId.length;j++){
            if(selectedNewId[j]!=e.choice.id){
                newSelectedNewId[newSelectedNewId.length]=selectedNewId[j];
            }
        }
        selectedNewId=newSelectedNewId;
        addOrDeletephysicalExaminationTable();
    });
    $('#p-physicalExaminationMultiSelect').on("select2-selecting", function(e){
//        checkedphysicalExamination[checkedphysicalExamination.length]=e.object.id;
//        addOrDeletephysicalExaminationTable();

        var id=""+e.object.id;
        if(id.indexOf('-newMehrsysphysicalExamination')==-1){
//            addOperationToTableAndSelectCheckBox(e.object.id,e.object.text);
            checkedphysicalExamination[checkedphysicalExamination.length]=e.object.id;
            addOrDeletephysicalExaminationTable();
        }else{//should save on db
            e.object.id=e.object.id.split('-newMehrsysphysicalExamination')[0];
            var newItemArray=[];
            newItemArray[0]=e.object.text;
            newItemArray[1]=e.object.id;

//            var newItemArray=$(this).data('newItemArray');

            var itemArray=[];
            itemArray[0]=newItemArray[0];
            savephysicalExamination(itemArray);
//            $("#dialog-confirm-save-drug").data('newItemArray',newItemArray).dialog('open');
        }
    });


    var cancelButtonphysicalExaminationClick=false;
    $("#dialog-physicalExamination").dialog({
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
                popupphysicalExaminationOkButton();
                $(this).dialog("close");
            },
            "cancel":function () {
//                popupphysicalExaminationCancelButton();
                cancelButtonphysicalExaminationClick=true;
                $(this).dialog("close");
            }
        },
        close:function (event, ui) {
            if(event.which!=undefined || cancelButtonphysicalExaminationClick==true){
                popupphysicalExaminationCancelButton();
                cancelButtonphysicalExaminationClick=false;
            }
            $(this).dialog("close");
        },
        open:function (event, ui) {
//            arrayCheckedBoxBeforeOpenedDrugOrder=$("#dialog-customizeDrug").find(":checkbox:checked");
            beforeCancelPopupCheckedphysicalExamination=[];
            for(var i=0;i<checkedphysicalExamination.length;i++){
                beforeCancelPopupCheckedphysicalExamination[i]=checkedphysicalExamination[i];
            }
            categoryphysicalExaminationClick();
        }
    });

    $("#dialog-confirm-delete-physicalExamination").dialog({
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
                    deleteCurrentphysicalExaminationRow($(this).data('contents'));
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

    function deleteCurrentphysicalExaminationRow(contents){
        $('#' + contents[1].lastChild.children[1].id.split('-physicalExamination-textarea')[0] + '-physicalExamination-rowOperation').remove();
        afterRemoveRowFromTablephysicalExamination();
        var newCheckedphysicalExamination=[];
        for(var i=0;i<checkedphysicalExamination.length;i++){
            if(checkedphysicalExamination[i]!=contents[1].lastChild.children[1].id.split('-physicalExamination-textarea')[0]){
                newCheckedphysicalExamination[newCheckedphysicalExamination.length]=checkedphysicalExamination[i];
            }
        }
        checkedphysicalExamination= newCheckedphysicalExamination;
        $("#p-physicalExaminationMultiSelect").select2('val',checkedphysicalExamination);
//        var arrayCheckedOperation = $("#dialog-current-operation").find(":checkbox:checked:not([isOperationCurrentGroup])");
//        for (var i = 0; i < arrayCheckedOperation.length; i++) {
//            if (arrayCheckedOperation[i].id == contents[1].lastChild.children[1].id+'-checkbox') {
//                arrayCheckedOperation[i].checked = false;
//            }
//        }
//        var id=contents[1].lastChild.children[1].id.split('-operation-current')[0];
//        deleteOption(id);

    }

    function addphysicalExaminationClick() {
        $("#dialog-physicalExamination").dialog("open");
    }

    function categoryphysicalExaminationClick(e) {
        var id
        if(e==undefined){
//            id="A";
            id="All";
        }else{
            id= e.id;
        }
        $.getJSON("<c:url value='/' />" + "clinic/basicInfo/physicalExamination/loadByFirstChar/" + id, function (data) {

//            try{
            deleteRowphysicalExamination('physicalExamination-table');
//            }catch(e){

//            }

            if (data.length > 0) {
                makeTablephysicalExamination(data);
                checkingDialogPopupphysicalExamination()
            }


        });
    }

    function makeTablephysicalExamination(data) {
        queueRowCount = data.length;

        var tbl = document.getElementById('physicalExamination-table');
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
//                checkbox.value = data[i].ComboID+'-physicalExamination';
                checkbox.id = data[i].ComboID + '-physicalExamination';
                checkbox.onclick =function(){ checkBoxClickphysicalExamination(this)};
                var label = document.createElement('label');
                label.htmlFor = data[i].ComboID + '-physicalExamination';
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

    function  checkBoxClickphysicalExamination(e){
        var checkState=$(e).prop('checked');
        var newCheckedphysicalExamination=[];
        if(checkState){
            checkedphysicalExamination[checkedphysicalExamination.length]= e.id.split('-physicalExamination')[0];
        }else{
            unCheckedphysicalExamination[unCheckedphysicalExamination.length]= e.id.split('-physicalExamination')[0];
            for(var i=0;i<checkedphysicalExamination.length;i++){
                if(checkedphysicalExamination[i]!=e.id.split('-physicalExamination')[0]){
                    newCheckedphysicalExamination[newCheckedphysicalExamination.length]=checkedphysicalExamination[i];
                }
            }
            checkedphysicalExamination= newCheckedphysicalExamination;
        }


    }

    function checkingDialogPopupphysicalExamination(){
        var selected=$("#p-physicalExaminationMultiSelect").select2('val');
        if(selected.length>0){
            for(w = 0; w < selected.length; w++){
                var found=false;
                for(j=0;j<unCheckedphysicalExamination.length;j++){
                    if(unCheckedphysicalExamination[j]==selected[w]){
                        found=true;
                    }
                }
                if(!found){
                    $("#"+selected[w]+"-physicalExamination").attr('checked',true);
                    $("#"+selected[w]+"-physicalExamination").prop('checked',true);
                }
            }
        }
        for(var i=0;i<checkedphysicalExamination.length;i++){
            $("#"+checkedphysicalExamination[i]+"-physicalExamination").attr('checked',true);
            $("#"+checkedphysicalExamination[i]+"-physicalExamination").prop('checked',true);
        }
    }

    function deleteRowphysicalExamination(tableID) {
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

    function  selectOptionphysicalExamination(id){
        var operationIdSelect2Array=$("#p-physicalExaminationMultiSelect").select2('val');
        operationIdSelect2Array[operationIdSelect2Array.length]=id;
        $("#p-physicalExaminationMultiSelect").select2('val',operationIdSelect2Array);


    }

    function  afterRemoveRowFromTablephysicalExamination(){
        var array=$('#tablephysicalExaminationDesc').find('tr');
        if(array.length==1){
            return;
        }
        $('#tablephysicalExaminationDesc').find('tr')[1].style.backgroundColor='';
        for(var i=2;i<array.length;i++){
            if(i%2==0){
                $('#tablephysicalExaminationDesc').find('tr')[i].style.backgroundColor='lightgray'
            }else{
                $('#tablephysicalExaminationDesc').find('tr')[i].style.backgroundColor=''
            }
        }
    }

    function addOrDeletephysicalExaminationTable(){
        var physicalExaminationDescArray= $('#tablephysicalExaminationDesc').parent().parent().find('textarea');
        for(var i=0;i<physicalExaminationDescArray.length;i++){
            var found=false;
            for(var j=0;j<checkedphysicalExamination.length;j++){
               if(physicalExaminationDescArray[i].id.split('-physicalExamination-textarea')[0]==checkedphysicalExamination[j]){
                   found=true;
                   break;
               }
            }
            //not found in  checkedphysicalExamination so delete from table
            if(!found){
                $('#' + physicalExaminationDescArray[i].id.split('-physicalExamination-textarea')[0] + '-physicalExamination-rowOperation').remove();
                afterRemoveRowFromTablephysicalExamination()
            }
        }

        for(var k=0;k<checkedphysicalExamination.length;k++){
            var foundphysicalExamination=false;
            for(var w=0;w<physicalExaminationDescArray.length;w++){
               if(physicalExaminationDescArray[w].id.split('-physicalExamination-textarea')[0]==checkedphysicalExamination[k]){
                   foundphysicalExamination=true;
                   break;
               }
            }
            //not found in  checkedphysicalExamination so delete from table
            if(!foundphysicalExamination){
                var name;
                for(var l=0;l<physicalExaminationPreload_data.length;l++){
                    if(physicalExaminationPreload_data[l].ComboID==checkedphysicalExamination[k]){
                         name= physicalExaminationPreload_data[l].ComboCaption;
                    }
                }
                $('#tablephysicalExaminationDesc').append('<tr id="' + checkedphysicalExamination[k] + '-physicalExamination-rowOperation' + '"></td><td contente="true">' + name + '</td><td contente="true"><textarea rows="10"  id="'+ checkedphysicalExamination[k]+'-physicalExamination-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletephysicalExaminationRowClick(this)" /></td><td><input type="checkbox" id="'+checkedphysicalExamination[k]+'-physicalExamination-checkbox-highlight'+'"</td></tr>' + '');
                afterRemoveRowFromTablephysicalExamination();
                autoCompleteCurrentphysicalExaminationApply(checkedphysicalExamination[k] + '-physicalExamination-rowOperation',
                        checkedphysicalExamination[k]+ '-physicalExamination-textarea');
            }
        }
    }

    function deletephysicalExaminationRowClick(th) {
        var contents = $(th).parent().parent().find('td[contente=true]');
        if(contents[1].lastChild.children[1].value.trim().length>0){

            $("#dialog-confirm-delete-physicalExamination").data('contents', contents).dialog("open");

        }else{
            deleteCurrentphysicalExaminationRow(contents);
        }
        <!--$("#p-operationMultiSelect-current").select2('val', ${operationIds});-->

    }

    function deleteOptionphysicalExamination(id){
        var operationIdSelect2Array=$("#p-physicalExaminationMultiSelect").select2('val');
        var newOperationIdSelect2Array=[];
        var index=0;
        for(var j=0;j<operationIdSelect2Array.length;j++){
            if(id!=operationIdSelect2Array[j]){
                newOperationIdSelect2Array[index]=operationIdSelect2Array[j];
                index++;
            }
        }
        $("#p-physicalExaminationMultiSelect").select2('val',newOperationIdSelect2Array);
    }

    function popupphysicalExaminationOkButton(){
//        var arrayCheckedLabTest = $("#dialog-physicalExamination").find(":checkbox:checked");
        var selectedLabTestInComboArray = $("#p-physicalExaminationMultiSelect").select2('val');
        if ($("#p-physicalExaminationMultiSelect").select2('val').length>0 ) {
            for (var j = 0; j < selectedLabTestInComboArray.length; j++) {
                var found = false;
                for (var index = 0; index < checkedphysicalExamination.length; index++) {
                    if (checkedphysicalExamination[index] == selectedLabTestInComboArray[j]) {
                        found = true;
                        break;
                    }
                }
                if (found == false) {
                    deleteOptionphysicalExamination(selectedLabTestInComboArray[j])
                }
            }
        }
        for (var index = 0; index < checkedphysicalExamination.length; index++) {
            var id = checkedphysicalExamination[index];
            selectOptionphysicalExamination(id);
        }
        addOrDeletephysicalExaminationTable();

    }

    function popupphysicalExaminationCancelButton(){
        checkedphysicalExamination=[];
        for(var i=0;i<beforeCancelPopupCheckedphysicalExamination.length;i++){
            checkedphysicalExamination[i]=beforeCancelPopupCheckedphysicalExamination[i];
        }
    }


    jQuery('body')
            .bind(
            'click',
            function (e) {
                if (
                        jQuery('#dialog-physicalExamination').dialog('isOpen')
                                && !jQuery(e.target).is('.ui-dialog, a')
                                && !jQuery(e.target).closest('.ui-dialog').length
                                && event.target.nodeName!="BUTTON"
                        ) {
                    popupphysicalExaminationOkButton();
                    jQuery('#dialog-physicalExamination').dialog('close');
                }
            }
    );

    function autoCompleteCurrentphysicalExaminationApply(trId,textAreaId){
        var elem = $("[id='"+ textAreaId+"']");
        var physicalExaminationName=$("#"+trId).find('td')[0].innerHTML;
        elem.textcomplete([{
            match: /(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
            search: function (term, callback) {
                Common.postJSON("${pageContext.request.contextPath}" +
                        "/clinic/patient/neurology/physicalExaminationAutoComplete/" + physicalExaminationName, JSON.stringify({token:term}),
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

    function savephysicalExamination(newItemArray){
        var data = {};
        data.newphysicalExaminationOrder=newItemArray;
        if(newItemArray.length>0){
            $.ajax({
                url: '${pageContext.request.contextPath}'+'/clinic/patient/neurology/savePhysicalExamination/',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                dataType: 'json',
                type: 'POST',
                success: function (data, success, xhr) {
                    if(data.physicalExaminationId!=undefined){
//                        var split = data.saveOperation.split(';;;;');
//                        if (split.length > 1) {
//                            for (var i = 0; i < split.length - 1; i = i + 2) {
                        $('#tablephysicalExaminationDesc').append('<tr id="' + data.physicalExaminationId + '-physicalExamination-rowOperation' + '"></td><td contente="true">' + data.physicalExaminationName + '</td><td contente="true"><textarea rows="10"  id="'+ data.physicalExaminationId+'-physicalExamination-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletephysicalExaminationRowClick(this)" /></td><td><input type="checkbox" id="'+data.physicalExaminationId+'-physicalExamination-checkbox-highlight'+'"</td></tr>' + '');
                        afterRemoveRowFromTablephysicalExamination();
//                                $('#tableCurrentOperation').append('<tr id="' + split[i] + '-operation-current-checkbox-rowOperation' + '"></td><td contente="true">' + split[i+1] + '</td><td contente="true"><textarea rows="10"  id="'+split[i]+'-operation-current'+'" class="operation-description" style="overflow-y: auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteCurrentOperationClick(this)" /></td><td><input type="checkbox" id="'+split[i]+'-currentOperation-physicalExamination-checkbox-highlight'+'"</td></tr>' + '');
                        autoCompleteCurrentphysicalExaminationApply(data.physicalExaminationId + '-physicalExamination-rowOperation',
                                data.physicalExaminationId+ '-physicalExamination-textarea');
//                                var allOperation = $("#dialog-current-operation").find(":checkbox");
//                                for (var w = 0; w < allOperation.length; w++) {
//                                    if (allOperation[w].id == split[i]+ '-operation-current-checkbox') {
//                                        allOperation[w].checked = true;
//                                    }
//                                }
//                            }
                            initSelect2physicalExamination(data.physicalExaminationId,data.physicalExaminationName);
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
