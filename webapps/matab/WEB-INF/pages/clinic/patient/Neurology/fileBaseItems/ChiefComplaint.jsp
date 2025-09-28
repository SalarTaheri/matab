<%@ page import="java.util.ResourceBundle" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<%@ page import="com.mongodb.DBObject" %>
<%@ page import="java.util.List" %>
<%--
    <div class="uk-width-1-1" id="chiefComplaint-kanban-static" style="z-index:-1; height:100%">
        <textarea rows="5" name="p-chiefComplaint" id="p-chiefComplaint" style="overflow-y: auto;overflow-x:auto; width: 100%; width:100% !important; height:100%; direction: ltr; text-align: left"  >&nbsp;</textarea>
    </div>

<script type="text/javascript">
$(function(){
    initChiefComplaintAutocomplate();
});

function initChiefComplaintAutocomplate(){
    $("#p-chiefComplaint").textcomplete([{
            match: /(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
            search: function (term, callback) {
                Common.postJSON("${pageContext.request.contextPath}"+"/clinic/patient/visitMobileBase/chiefComplaintAutoComplete/" , JSON.stringify({token: term}), function(data){
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
    <label dir="ltr">All ChiefCompliant</label>
    <input type="hidden" id="p-chiefCompliantMultiSelect" style="direction:ltr; width: 100%; height:100%;text-align: left "/>
    <%--<div>--%>
    <button name="AddChiefCompliant" id="addCurrentChiefCompliant" class="uk-button-success uk-active" style="margin-top:10px;height:29px" onclick="addChiefCompliantClick()"
            title="AddChiefCompliant">Add ChiefCompliant
    </button>
    <%--</div>--%>
    <div id="tableCurrentOperationDiv" style=" padding-top: 10px; ">
        <table id="tableChiefCompliantDesc" height="100%" width="100%" style="text-align: center;background-color: #ffffff;" border="2" dir="ltr">
            <tr style=" background: -webkit-linear-gradient(top, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%); height: 25px; ">
                <th id="chiefCompliant">
                    ChiefCompliant
                </th>
                <th id="chiefCompliantDetail">
                    Description
                </th>
                <th id="chiefCompliantValue">
                    Free Text
                </th>

                <th id="deleteChiefCompliant">
                    Delete
                </th>
                <th id="highlightChiefCompliant">
                    Highlight
                </th>
            </tr>

        </table>
    </div>
</div>

<div id="dialog-confirm-delete-chiefcomplaint"  style="display:none;direction: rtl;height: 100% !important;">
    <p><%=areUShureDeleteRow%></p>
</div>

<div id="dialog-chiefCompliant" title='Select ChiefCompliant'
     style="display:none;direction: ltr;height: 100% !important;">
    <form class="toPopup" style="direction: ltr">

        <table align="center" width="100%">
            <tr>
                <td>
                <a href="#" id="All" onclick="categoryChiefcomplaintClick(this)">All</a>
                </td>
                <td>
                    <a href="#" id="A" onclick="categoryChiefcomplaintClick(this)">A</a>
                </td>
                <td>
                    <a href="#" id="B" onclick="categoryChiefcomplaintClick(this)">B</a>
                </td>
                <td>
                    <a href="#" id="C" onclick="categoryChiefcomplaintClick(this)">C</a>
                </td>
                <td>
                    <a href="#" id="D" onclick="categoryChiefcomplaintClick(this)">D</a>
                </td>
                <td>
                    <a href="#" id="E" onclick="categoryChiefcomplaintClick(this)">E</a>
                </td>
                <td>
                    <a href="#" id="F" onclick="categoryChiefcomplaintClick(this)">F</a>
                </td>
                <td>
                    <a href="#" id="G" onclick="categoryChiefcomplaintClick(this)">G</a>
                </td>
                <td>
                    <a href="#" id="H" onclick="categoryChiefcomplaintClick(this)">H</a>
                </td>
                <td>
                    <a href="#" id="I" onclick="categoryChiefcomplaintClick(this)">I</a>
                </td>
                <td>
                    <a href="#" id="J" onclick="categoryChiefcomplaintClick(this)">J</a>
                </td>
                <td>
                    <a href="#" id="K" onclick="categoryChiefcomplaintClick(this)">K</a>
                </td>
                <td>
                    <a href="#" id="L" onclick="categoryChiefcomplaintClick(this)">L</a>
                </td>
                <td>
                    <a href="#" id="M" onclick="categoryChiefcomplaintClick(this)">M</a>
                </td>
                <td>
                    <a href="#" id="N" onclick="categoryChiefcomplaintClick(this)">N</a>
                </td>
                <td>
                    <a href="#" id="O" onclick="categoryChiefcomplaintClick(this)">O</a>
                </td>
                <td>
                    <a href="#" id="P" onclick="categoryChiefcomplaintClick(this)">P</a>
                </td>
                <td>
                    <a href="#" id="Q" onclick="categoryChiefcomplaintClick(this)">Q</a>
                </td>
                <td>
                    <a href="#" id="R" onclick="categoryChiefcomplaintClick(this)">R</a>
                </td>
                <td>
                    <a href="#" id="S" onclick="categoryChiefcomplaintClick(this)">S</a>
                </td>
                <td>
                    <a href="#" id="T" onclick="categoryChiefcomplaintClick(this)">T</a>
                </td>
                <td>
                    <a href="#" id="U" onclick="categoryChiefcomplaintClick(this)">U</a>
                </td>
                <td>
                    <a href="#" id="V" onclick="categoryChiefcomplaintClick(this)">V</a>
                </td>
                <td>
                    <a href="#" id="W" onclick="categoryChiefcomplaintClick(this)">W</a>
                </td>
                <td>
                    <a href="#" id="X" onclick="categoryChiefcomplaintClick(this)">X</a>
                </td>
                <td>
                    <a href="#" id="Y" onclick="categoryChiefcomplaintClick(this)">Y</a>
                </td>
                <td>
                    <a href="#" id="Z" onclick="categoryChiefcomplaintClick(this)">Z</a>
                </td>

            </tr>

        </table>
        <%--<table id="chiefCompliant-table" align="center" width="100%" border="1" style="font-size: 30px !important; padding-top:40px;">--%>
        <table id="chiefCompliant-table" align="center">
        </table>
    </form>
</div>

<script type="text/javascript">
    var checkedChiefComplaint=[]
    var beforeCancelPopupCheckedChiefComplaint=[]
    var unCheckedChiefComplaint=[];
    var chiefComplaintPreload_data;
    var initStateChiefCompliant=true;
    var selectedNewId=[];

    <%
    if(!(request.getAttribute("chiefComplaintWithValueList") instanceof String)){
        List<DBObject> list = (List)request.getAttribute("chiefComplaintWithValueList");
        if(list!=null){
            for(int i=0; i <list.size(); i++) {
                DBObject dbObject=list.get(i);
                String chiefComplaintId=dbObject.get("chiefComplaintId").toString().trim();
                String chiefComplaintName=dbObject.get("chiefComplaintName").toString().trim();
                String chiefComplaintVal=dbObject.get("chiefComplaintVal").toString().trim();
                Object chiefComplaintIsHighlight=dbObject.get("chiefComplaintIsHighlight");
                chiefComplaintVal= StringEscapeUtils.escapeEcmaScript(chiefComplaintVal);
                Object chiefComplaintDescription=dbObject.get("chiefComplaintDescription");
    %>
    var chiefComplaintId = '<%=chiefComplaintId%>';
    var chiefComplaintName = '<%=chiefComplaintName%>';
    var chiefComplaintVal = '<%=chiefComplaintVal%>';
    var chiefComplaintIsHighlight = '<%=chiefComplaintIsHighlight%>';
    var chiefComplaintDescription = '<%=chiefComplaintDescription%>';
    selectedNewId[selectedNewId.length]=chiefComplaintId;
    var multiSelectid='p-chiefCompliantMultiSelect-'+chiefComplaintId;
    <%if(i%2==1){%>
        $('#tableChiefCompliantDesc').append('<tr style=" background-color: lightgray; " id="' + chiefComplaintId + '-chiefcomplaint-rowOperation' + '"></td><td contente="true">' + chiefComplaintName + '</td><td><input type="hidden" id="'+multiSelectid+'" style="direction:ltr; width: 100%; height:100%;text-align: left "/><td contente="true"><textarea rows="10"  id="'+ chiefComplaintId+'-chiefcomplaint-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteChiefComplaintRowClick(this)" /></td><td><input type="checkbox" id="'+chiefComplaintId+'-chiefComplaint-checkbox-highlight'+'"</td></tr>' + '');
        applyMultiSelectOnDescriptionColumn(chiefComplaintId,multiSelectid,chiefComplaintDescription);
        if(chiefComplaintIsHighlight=='true'){
            $('#'+chiefComplaintId+'-chiefComplaint-checkbox-highlight').prop('checked',true)
        }
    <%}else{%>
        $('#tableChiefCompliantDesc').append('<tr id="' + chiefComplaintId + '-chiefcomplaint-rowOperation' + '"></td><td contente="true">' + chiefComplaintName + '</td><td><input type="hidden" id="'+multiSelectid+'" style="direction:ltr; width: 100%; height:100%;text-align: left "/><td contente="true"><textarea rows="10"  id="'+ chiefComplaintId+'-chiefcomplaint-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteChiefComplaintRowClick(this)" /></td><td><input type="checkbox" id="'+chiefComplaintId+'-chiefComplaint-checkbox-highlight'+'"</td></tr>' + '');
        applyMultiSelectOnDescriptionColumn(chiefComplaintId,multiSelectid,chiefComplaintDescription);
        if(chiefComplaintIsHighlight=='true'){
            $('#'+chiefComplaintId+'-chiefComplaint-checkbox-highlight').prop('checked',true)
        }
    <%}%>
    autoCompleteCurrentChiefComplaintApply(chiefComplaintId + '-chiefcomplaint-rowOperation',
            chiefComplaintId+ '-chiefcomplaint-textarea');
    $('#'+chiefComplaintId+'-chiefcomplaint-textarea').val(chiefComplaintVal);
    checkedChiefComplaint[checkedChiefComplaint.length]=chiefComplaintId;

    <%

               }
      }
      }
    %>
    initSelect2chiefComplaint();

    function initSelect2chiefComplaint(addId,deleteId) {
        var selected;
        var urlLoad;

        if(addId==undefined){
            selected=$("#p-chiefCompliantMultiSelect").select2('val');
            urlLoad = "clinic/basicInfo/chiefComplaint/combo/loadAll";
            var url=window.location.href;
            if(url.indexOf("null")==-1 && initStateChiefCompliant==true){
                var newIdWithComma='-1';
                for(var j=0;j<selectedNewId.length;j++){
                    newIdWithComma+=','+selectedNewId[j];
                }
                urlLoad = "clinic/basicInfo/chiefComplaint/combo/loadAll/"+newIdWithComma;
            }
        }else{
            selected=$("#p-chiefCompliantMultiSelect").select2('val');
            selectedNewId[selectedNewId.length]=addId;
            var newIdWithComma='-1';
            for(var j=0;j<selectedNewId.length;j++){
                newIdWithComma+=','+selectedNewId[j];
            }
            urlLoad = "clinic/basicInfo/chiefComplaint/combo/loadAll/"+newIdWithComma;
            checkedChiefComplaint[checkedChiefComplaint.length]=addId;
        }

        $.getJSON("<c:url value='/' />" + urlLoad, function (data) {

             chiefComplaintPreload_data = data;
            var preload_data2 = [];

            $.each(chiefComplaintPreload_data, function () {
                preload_data2.push({id:this.ComboID, text:this.ComboCaption });
            });

            $('#p-chiefCompliantMultiSelect').select2({
                multiple:true,
                query:function (query) {
                    var data = {results:[]};

                    $.each(chiefComplaintPreload_data, function () {
                        if (query.term.length == 0 || this.ComboCaption.toUpperCase().indexOf(query.term.toUpperCase()) >= 0) {
                            data.results.push({id:this.ComboID, text:this.ComboCaption });
                        }
                    });

                    query.callback(data);
                },
                createSearchChoice:function (term, data) {
                    term.trim();
                    if ($(data).filter(
                            function () {
                                return this.text.localeCompare(term) === 0;
                            }).length === 0) {
                        return {id:term+'-newMehrsysChiefComplaint', text:term};
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
//            $("#p-chiefCompliantMultiSelect").select2('val', checkedChiefComplaint);
            if(deleteId!=undefined){
                $("#p-chiefCompliantMultiSelect").select2('val',selected);
                deleteOptionChiefCompliant(deleteId);
                selectOptionChiefCompliant(addId);
            }
            if(initStateChiefCompliant==true){
                initStateChiefCompliant=false;
                            $("#p-chiefCompliantMultiSelect").select2('val', checkedChiefComplaint);
            }
        });

    }

    $('#p-chiefCompliantMultiSelect').on("select2-removed", function(e){

        var newCheckedChiefComplaint=[];
        for(var i=0;i<checkedChiefComplaint.length;i++){
            if(checkedChiefComplaint[i]!=e.choice.id){
                newCheckedChiefComplaint[newCheckedChiefComplaint.length]=checkedChiefComplaint[i];
            }
        }
        checkedChiefComplaint= newCheckedChiefComplaint;

        var newSelectedNewId=[]
        for(var j=0;j<selectedNewId.length;j++){
            if(selectedNewId[j]!=e.choice.id){
                newSelectedNewId[newSelectedNewId.length]=selectedNewId[j];
            }
        }
        selectedNewId=newSelectedNewId;
        addOrDeleteChiefComplaintTable();
    });
    $('#p-chiefCompliantMultiSelect').on("select2-selecting", function(e){
//        checkedChiefComplaint[checkedChiefComplaint.length]=e.object.id;
//        addOrDeleteChiefComplaintTable();

        var id=""+e.object.id;
        if(id.indexOf('-newMehrsysChiefComplaint')==-1){
//            addOperationToTableAndSelectCheckBox(e.object.id,e.object.text);
            checkedChiefComplaint[checkedChiefComplaint.length]=e.object.id;
            addOrDeleteChiefComplaintTable();
        }else{//should save on db
            e.object.id=e.object.id.split('-newMehrsysChiefComplaint')[0];
            var newItemArray=[];
            newItemArray[0]=e.object.text;
            newItemArray[1]=e.object.id;

//            var newItemArray=$(this).data('newItemArray');

            var itemArray=[];
            itemArray[0]=newItemArray[0];
            saveChiefComplaint(itemArray);
//            $("#dialog-confirm-save-drug").data('newItemArray',newItemArray).dialog('open');
        }
    });


    var cancelButtonChiefCompliantClick=false;
    $("#dialog-chiefCompliant").dialog({
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
                popupChiefComplaintOkButton();
                $(this).dialog("close");
            },
            "cancel":function () {
//                popupChiefComplaintCancelButton();
                cancelButtonChiefCompliantClick=true;
                $(this).dialog("close");
            }
        },
        close:function (event, ui) {
            if(event.which!=undefined || cancelButtonChiefCompliantClick==true){
                popupChiefComplaintCancelButton();
                cancelButtonChiefCompliantClick=false;
            }
            $(this).dialog("close");
        },
        open:function (event, ui) {
//            arrayCheckedBoxBeforeOpenedDrugOrder=$("#dialog-customizeDrug").find(":checkbox:checked");
            beforeCancelPopupCheckedChiefComplaint=[];
            for(var i=0;i<checkedChiefComplaint.length;i++){
                beforeCancelPopupCheckedChiefComplaint[i]=checkedChiefComplaint[i];
            }
            categoryChiefcomplaintClick();
        }
    });

    $("#dialog-confirm-delete-chiefcomplaint").dialog({
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
                    deleteCurrentChiefcomplaintRow($(this).data('contents'));
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

    function deleteCurrentChiefcomplaintRow(contents){
        $('#' + contents[1].lastChild.children[1].id.split('-chiefcomplaint-textarea')[0] + '-chiefcomplaint-rowOperation').remove();
        afterRemoveRowFromTableChiefCompliant();
        var newCheckedChiefComplaint=[];
        for(var i=0;i<checkedChiefComplaint.length;i++){
            if(checkedChiefComplaint[i]!=contents[1].lastChild.children[1].id.split('-chiefcomplaint-textarea')[0]){
                newCheckedChiefComplaint[newCheckedChiefComplaint.length]=checkedChiefComplaint[i];
            }
        }
        checkedChiefComplaint= newCheckedChiefComplaint;
        $("#p-chiefCompliantMultiSelect").select2('val',checkedChiefComplaint);
//        var arrayCheckedOperation = $("#dialog-current-operation").find(":checkbox:checked:not([isOperationCurrentGroup])");
//        for (var i = 0; i < arrayCheckedOperation.length; i++) {
//            if (arrayCheckedOperation[i].id == contents[1].lastChild.children[1].id+'-checkbox') {
//                arrayCheckedOperation[i].checked = false;
//            }
//        }
//        var id=contents[1].lastChild.children[1].id.split('-operation-current')[0];
//        deleteOption(id);

    }

    function addChiefCompliantClick() {
        $("#dialog-chiefCompliant").dialog("open");
    }

    function categoryChiefcomplaintClick(e) {
        var id
        if(e==undefined){
//            id="A";
            id="All";
        }else{
            id= e.id;
        }
        $.getJSON("<c:url value='/' />" + "clinic/basicInfo/chiefComplaint/loadByFirstChar/" + id, function (data) {

//            try{
            deleteRowChiefCompliant('chiefCompliant-table');
//            }catch(e){

//            }

            if (data.length > 0) {
                makeTableChiefCompliant(data);
                checkingDialogPopupChiefCompliant()
            }


        });
    }

    function makeTableChiefCompliant(data) {
        queueRowCount = data.length;

        var tbl = document.getElementById('chiefCompliant-table');
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
//                checkbox.value = data[i].ComboID+'-chiefCompliant';
                checkbox.id = data[i].ComboID + '-chiefCompliant';
                checkbox.onclick =function(){ checkBoxClickChiefCompliant(this)};
                var label = document.createElement('label');
                label.htmlFor = data[i].ComboID + '-chiefCompliant';
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

    function  checkBoxClickChiefCompliant(e){
        var checkState=$(e).prop('checked');
        var newCheckedChiefComplaint=[];
        if(checkState){
            checkedChiefComplaint[checkedChiefComplaint.length]= e.id.split('-chiefCompliant')[0];
        }else{
            unCheckedChiefComplaint[unCheckedChiefComplaint.length]= e.id.split('-chiefCompliant')[0];
            for(var i=0;i<checkedChiefComplaint.length;i++){
                if(checkedChiefComplaint[i]!=e.id.split('-chiefCompliant')[0]){
                    newCheckedChiefComplaint[newCheckedChiefComplaint.length]=checkedChiefComplaint[i];
                }
            }
            checkedChiefComplaint= newCheckedChiefComplaint;
        }


    }

    function checkingDialogPopupChiefCompliant(){
        var selected=$("#p-chiefCompliantMultiSelect").select2('val');
        if(selected.length>0){
            for(w = 0; w < selected.length; w++){
                var found=false;
                for(j=0;j<unCheckedChiefComplaint.length;j++){
                    if(unCheckedChiefComplaint[j]==selected[w]){
                        found=true;
                    }
                }
                if(!found){
                    $("#"+selected[w]+"-chiefCompliant").attr('checked',true);
                    $("#"+selected[w]+"-chiefCompliant").prop('checked',true);
                }
            }
        }
        for(var i=0;i<checkedChiefComplaint.length;i++){
            $("#"+checkedChiefComplaint[i]+"-chiefCompliant").attr('checked',true);
            $("#"+checkedChiefComplaint[i]+"-chiefCompliant").prop('checked',true);
        }
    }

    function deleteRowChiefCompliant(tableID) {
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

    function  selectOptionChiefCompliant(id){
        var operationIdSelect2Array=$("#p-chiefCompliantMultiSelect").select2('val');
        operationIdSelect2Array[operationIdSelect2Array.length]=id;
        $("#p-chiefCompliantMultiSelect").select2('val',operationIdSelect2Array);


    }

    function  afterRemoveRowFromTableChiefCompliant(){
        var array=$('#tableChiefCompliantDesc').find('tr');
        if(array.length==1){
            return;
        }
        $('#tableChiefCompliantDesc').find('tr')[1].style.backgroundColor='';
        for(var i=2;i<array.length;i++){
            if(i%2==0){
                $('#tableChiefCompliantDesc').find('tr')[i].style.backgroundColor='lightgray'
            }else{
                $('#tableChiefCompliantDesc').find('tr')[i].style.backgroundColor=''
            }
        }
    }

    function addOrDeleteChiefComplaintTable(){
        var chiefCompliantDescArray= $('#tableChiefCompliantDesc').parent().parent().find('textarea');
        for(var i=0;i<chiefCompliantDescArray.length;i++){
            var found=false;
            for(var j=0;j<checkedChiefComplaint.length;j++){
               if(chiefCompliantDescArray[i].id.split('-chiefcomplaint-textarea')[0]==checkedChiefComplaint[j]){
                   found=true;
                   break;
               }
            }
            //not found in  checkedChiefComplaint so delete from table
            if(!found){
                $('#' + chiefCompliantDescArray[i].id.split('-chiefcomplaint-textarea')[0] + '-chiefcomplaint-rowOperation').remove();
                afterRemoveRowFromTableChiefCompliant()
            }
        }

        for(var k=0;k<checkedChiefComplaint.length;k++){
            var foundChiefComplaint=false;
            for(var w=0;w<chiefCompliantDescArray.length;w++){
               if(chiefCompliantDescArray[w].id.split('-chiefcomplaint-textarea')[0]==checkedChiefComplaint[k]){
                   foundChiefComplaint=true;
                   break;
               }
            }
            //not found in  checkedChiefComplaint so delete from table
            if(!foundChiefComplaint){
                var name;
                for(var l=0;l<chiefComplaintPreload_data.length;l++){
                    if(chiefComplaintPreload_data[l].ComboID==checkedChiefComplaint[k]){
                         name= chiefComplaintPreload_data[l].ComboCaption;
                    }
                }
                var multiSelectid='p-chiefCompliantMultiSelect-'+checkedChiefComplaint[k];
                $('#tableChiefCompliantDesc').append('<tr id="' + checkedChiefComplaint[k] + '-chiefcomplaint-rowOperation' + '"></td><td contente="true">' + name + '</td><td><input type="hidden" id="'+multiSelectid+'" style="direction:ltr; width: 100%; height:100%;text-align: left "/></td><td contente="true"><textarea rows="10"  id="'+ checkedChiefComplaint[k]+'-chiefcomplaint-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteChiefComplaintRowClick(this)" /></td><td><input type="checkbox" id="'+checkedChiefComplaint[k]+'-chiefComplaint-checkbox-highlight'+'"</td></tr>' + '');
                applyMultiSelectOnDescriptionColumn(checkedChiefComplaint[k],multiSelectid);
                afterRemoveRowFromTableChiefCompliant();
                autoCompleteCurrentChiefComplaintApply(checkedChiefComplaint[k] + '-chiefcomplaint-rowOperation',
                        checkedChiefComplaint[k]+ '-chiefcomplaint-textarea');
            }
        }
    }

    function applyMultiSelectOnDescriptionColumn(chiefComplaintId,multiSelectId,chiefComplaintDescription){
        var urlLoad = "clinic/basicInfo/chiefComplaint/combo/loadDescriptionAllByParentId/"+chiefComplaintId;
        $.getJSON("<c:url value='/' />" + urlLoad, function (data) {

            var chiefComplaintDetail = data;
            var preload_data2 = [];

            $.each(chiefComplaintDetail, function () {
                preload_data2.push({id:this.ComboID, text:this.ComboCaption });
            });

            $('#'+multiSelectId).select2({
                multiple:true,
                query:function (query) {
                    var data = {results:[]};

                    $.each(chiefComplaintDetail, function () {
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
                        return {id:term+'-newMehrsysChiefComplaintDescription', text:term};
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
            if(chiefComplaintDescription!=undefined){
                $("#p-chiefCompliantMultiSelect-"+chiefComplaintId).select2('data',JSON.parse(chiefComplaintDescription));
            }
//            $("#p-chiefCompliantMultiSelect").select2('val', checkedChiefComplaint);
//            if(deleteId!=undefined){
//                $("#p-chiefCompliantMultiSelect").select2('val',selected);
//                deleteOptionChiefCompliant(deleteId);
//                selectOptionChiefCompliant(addId);
//            }
//            if(initStateChiefCompliant==true){
//                initStateChiefCompliant=false;
//                $("#p-chiefCompliantMultiSelect").select2('val', checkedChiefComplaint);
//            }
        });


        $('#'+multiSelectId).on("select2-selecting", function(e){
//        checkedChiefComplaint[checkedChiefComplaint.length]=e.object.id;
//        addOrDeleteChiefComplaintTable();
            var parentId=e.target.id.split('-')[2];
            var id=""+e.object.id;
            if(id.indexOf('-newMehrsysChiefComplaintDescription')==-1){
//            addOperationToTableAndSelectCheckBox(e.object.id,e.object.text);
//                checkedChiefComplaint[checkedChiefComplaint.length]=e.object.id;
//                addOrDeleteChiefComplaintTable();
            }else{//should save on db
                e.object.id=e.object.id.split('-newMehrsysChiefComplaintDescription')[0];
                var newItemArray=[];
                newItemArray[0]=e.object.text;
                newItemArray[1]=e.object.id;
                newItemArray[2]=parentId;

//            var newItemArray=$(this).data('newItemArray');

//                var itemArray=[];
//                itemArray[0]=newItemArray[0];
                saveChiefComplaintDescription(newItemArray);
//            $("#dialog-confirm-save-drug").data('newItemArray',newItemArray).dialog('open');
            }
        });

    }
    function deleteChiefComplaintRowClick(th) {
        var contents = $(th).parent().parent().find('td[contente=true]');
        if(contents[1].lastChild.children[1].value.trim().length>0){

            $("#dialog-confirm-delete-chiefcomplaint").data('contents', contents).dialog("open");

        }else{
            deleteCurrentChiefcomplaintRow(contents);
        }
        <!--$("#p-operationMultiSelect-current").select2('val', ${operationIds});-->

    }

    function deleteOptionChiefCompliant(id){
        var operationIdSelect2Array=$("#p-chiefCompliantMultiSelect").select2('val');
        var newOperationIdSelect2Array=[];
        var index=0;
        for(var j=0;j<operationIdSelect2Array.length;j++){
            if(id!=operationIdSelect2Array[j]){
                newOperationIdSelect2Array[index]=operationIdSelect2Array[j];
                index++;
            }
        }
        $("#p-chiefCompliantMultiSelect").select2('val',newOperationIdSelect2Array);
    }

    function popupChiefComplaintOkButton(){
//        var arrayCheckedLabTest = $("#dialog-chiefCompliant").find(":checkbox:checked");
        var selectedLabTestInComboArray = $("#p-chiefCompliantMultiSelect").select2('val');
        if ($("#p-chiefCompliantMultiSelect").select2('val').length>0 ) {
            for (var j = 0; j < selectedLabTestInComboArray.length; j++) {
                var found = false;
                for (var index = 0; index < checkedChiefComplaint.length; index++) {
                    if (checkedChiefComplaint[index] == selectedLabTestInComboArray[j]) {
                        found = true;
                        break;
                    }
                }
                if (found == false) {
                    deleteOptionChiefCompliant(selectedLabTestInComboArray[j])
                }
            }
        }
        for (var index = 0; index < checkedChiefComplaint.length; index++) {
            var id = checkedChiefComplaint[index];
            selectOptionChiefCompliant(id);
        }
        addOrDeleteChiefComplaintTable();

    }

    function popupChiefComplaintCancelButton(){
        checkedChiefComplaint=[];
        for(var i=0;i<beforeCancelPopupCheckedChiefComplaint.length;i++){
            checkedChiefComplaint[i]=beforeCancelPopupCheckedChiefComplaint[i];
        }
    }


    jQuery('body')
            .bind(
            'click',
            function (e) {
                if (
                        jQuery('#dialog-chiefCompliant').dialog('isOpen')
                                && !jQuery(e.target).is('.ui-dialog, a')
                                && !jQuery(e.target).closest('.ui-dialog').length
                                && event.target.nodeName!="BUTTON"
                        ) {
                    popupChiefComplaintOkButton();
                    jQuery('#dialog-chiefCompliant').dialog('close');
                }
            }
    );

    function autoCompleteCurrentChiefComplaintApply(trId,textAreaId){
        var elem = $("[id='"+ textAreaId+"']");
        var chiefComplaintName=$("#"+trId).find('td')[0].innerHTML;
        elem.textcomplete([{
            match: /(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
            search: function (term, callback) {
                Common.postJSON("${pageContext.request.contextPath}" +
                        "/clinic/patient/neurology/chiefComplaintDescAutoComplete/" + chiefComplaintName, JSON.stringify({token:term}),
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

    function saveChiefComplaint(newItemArray){
        var data = {};
        data.newChiefComplaintOrder=newItemArray;
        if(newItemArray.length>0){
            $.ajax({
                url: '${pageContext.request.contextPath}'+'/clinic/patient/neurology/saveChiefComplainttt/',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                dataType: 'json',
                type: 'POST',
                success: function (data, success, xhr) {
                    if(data.chiefComplaintId!=undefined){
//                        var split = data.saveOperation.split(';;;;');
//                        if (split.length > 1) {
//                            for (var i = 0; i < split.length - 1; i = i + 2) {
                        var multiSelectid='p-chiefCompliantMultiSelect-'+data.chiefComplaintId;
                        $('#tableChiefCompliantDesc').append('<tr id="' + data.chiefComplaintId + '-chiefcomplaint-rowOperation' + '"></td><td contente="true">' + data.chiefComplaintName + '</td><td><input type="hidden" id="'+multiSelectid+'" style="direction:ltr; width: 100%; height:100%;text-align: left "/><td contente="true"><textarea rows="10"  id="'+ data.chiefComplaintId+'-chiefcomplaint-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteChiefComplaintRowClick(this)" /></td><td><input type="checkbox" id="'+data.chiefComplaintId+'-chiefComplaint-checkbox-highlight'+'"</td></tr>' + '');
                        applyMultiSelectOnDescriptionColumn(data.chiefComplaintId,multiSelectid);
                        afterRemoveRowFromTableChiefCompliant();
//                                $('#tableCurrentOperation').append('<tr id="' + split[i] + '-operation-current-checkbox-rowOperation' + '"></td><td contente="true">' + split[i+1] + '</td><td contente="true"><textarea rows="10"  id="'+split[i]+'-operation-current'+'" class="operation-description" style="overflow-y: auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteCurrentOperationClick(this)" /></td><td><input type="checkbox" id="'+split[i]+'-currentOperation-chiefComplaint-checkbox-highlight'+'"</td></tr>' + '');
                        autoCompleteCurrentChiefComplaintApply(data.chiefComplaintId + '-chiefcomplaint-rowOperation',
                                data.chiefComplaintId+ '-chiefcomplaint-textarea');
//                                var allOperation = $("#dialog-current-operation").find(":checkbox");
//                                for (var w = 0; w < allOperation.length; w++) {
//                                    if (allOperation[w].id == split[i]+ '-operation-current-checkbox') {
//                                        allOperation[w].checked = true;
//                                    }
//                                }
//                            }
                            initSelect2chiefComplaint(data.chiefComplaintId,data.chiefComplaintName);
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

    function saveChiefComplaintDescription(newItemArray){
        var data = {};
        data.newChiefComplaintOrder=newItemArray;
        if(newItemArray.length>0){
            $.ajax({
                url: '${pageContext.request.contextPath}'+'/clinic/patient/neurology/saveChiefComplaintDescription/',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                dataType: 'json',
                type: 'POST',
                success: function (data, success, xhr) {

                    if(data.chiefComplaintDescriptionId!=undefined){

                        /*$('#tableChiefCompliantDesc').append('<tr id="' + data.chiefComplaintId + '-chiefcomplaint-rowOperation' + '"></td><td contente="true">' + data.chiefComplaintName + '</td><td contente="true"><textarea rows="10"  id="'+ data.chiefComplaintId+'-chiefcomplaint-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteChiefComplaintRowClick(this)" /></td><td><input type="checkbox" id="'+data.chiefComplaintId+'-chiefComplaint-checkbox-highlight'+'"</td></tr>' + '');
                        afterRemoveRowFromTableChiefCompliant();
                        autoCompleteCurrentChiefComplaintApply(data.chiefComplaintId + '-chiefcomplaint-rowOperation',
                                data.chiefComplaintId+ '-chiefcomplaint-textarea');

                        initSelect2chiefComplaint(data.chiefComplaintId,data.chiefComplaintName);*/
                        var multiSelectData=$("#p-chiefCompliantMultiSelect-"+data.chiefComplaintId).select2('data');
                        for(var i=0;i<multiSelectData.length;i++){
                            if(multiSelectData[i].text==data.chiefComplaintDescriptionName){
                                multiSelectData[i].id=data.chiefComplaintDescriptionId;
                            }
                        }

//                        document.getElementById('s2id_autogen12').focus();

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
