<%@ page import="java.util.ResourceBundle" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<%@ page import="com.mongodb.DBObject" %>
<%@ page import="java.util.List" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String areUShureDeleteRow=resource.getString("clinic.patientfile.confirm.delete.row");
    String areUShureAddDrug=resource.getString("clinic.patientfile.confirm.add.new.drug");
%>
<div class="uk-width-1-1" id="drug-kanban-static" style=" height:100%">
    <label dir="ltr">All drug</label>
    <input type="hidden" id="p-drugMultiSelect" style="direction:ltr; width: 100%; height:100%;text-align: left "/>
    <%--<div>--%>
    <button name="Adddrug" id="addCurrentdrug" class="uk-button-success uk-active" style="margin-top:10px;height:29px" onclick="adddrugClick()"
            title="Adddrug">Add drug
    </button>
    <%--</div>--%>
    <div id="tableCurrentOperationDiv" style=" padding-top: 10px; ">
        <table id="tabledrugDesc" height="100%" width="100%" style="text-align: center;background-color: #ffffff;" border="2" dir="ltr">
            <tr style=" background: -webkit-linear-gradient(top, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%); height: 25px; ">
                <th id="drug">
                    drug
                </th>
                <th id="drugValue">
                    Description
                </th>

                <th id="deletedrug">
                    Delete
                </th>
                <th id="highlightdrug">
                    Highlight
                </th>
            </tr>

        </table>
    </div>
</div>

<div id="dialog-confirm-delete-drug"  style="display:none;direction: rtl;height: 100% !important;">
    <p><%=areUShureDeleteRow%></p>
</div>

<div id="dialog-drug" title='Select drug'
     style="display:none;direction: ltr;height: 100% !important;">
    <form class="toPopup" style="direction: ltr">

        <table align="center" width="100%">
            <tr>
                <td>
                    <a href="#" id="All" onclick="categoryDrugClick(this)">All</a>
                </td>
                <td>
                    <a href="#" id="A" onclick="categoryDrugClick(this)">A</a>
                </td>
                <td>
                    <a href="#" id="B" onclick="categoryDrugClick(this)">B</a>
                </td>
                <td>
                    <a href="#" id="C" onclick="categoryDrugClick(this)">C</a>
                </td>
                <td>
                    <a href="#" id="D" onclick="categoryDrugClick(this)">D</a>
                </td>
                <td>
                    <a href="#" id="E" onclick="categoryDrugClick(this)">E</a>
                </td>
                <td>
                    <a href="#" id="F" onclick="categoryDrugClick(this)">F</a>
                </td>
                <td>
                    <a href="#" id="G" onclick="categoryDrugClick(this)">G</a>
                </td>
                <td>
                    <a href="#" id="H" onclick="categoryDrugClick(this)">H</a>
                </td>
                <td>
                    <a href="#" id="I" onclick="categoryDrugClick(this)">I</a>
                </td>
                <td>
                    <a href="#" id="J" onclick="categoryDrugClick(this)">J</a>
                </td>
                <td>
                    <a href="#" id="K" onclick="categoryDrugClick(this)">K</a>
                </td>
                <td>
                    <a href="#" id="L" onclick="categoryDrugClick(this)">L</a>
                </td>
                <td>
                    <a href="#" id="M" onclick="categoryDrugClick(this)">M</a>
                </td>
                <td>
                    <a href="#" id="N" onclick="categoryDrugClick(this)">N</a>
                </td>
                <td>
                    <a href="#" id="O" onclick="categoryDrugClick(this)">O</a>
                </td>
                <td>
                    <a href="#" id="P" onclick="categoryDrugClick(this)">P</a>
                </td>
                <td>
                    <a href="#" id="Q" onclick="categoryDrugClick(this)">Q</a>
                </td>
                <td>
                    <a href="#" id="R" onclick="categoryDrugClick(this)">R</a>
                </td>
                <td>
                    <a href="#" id="S" onclick="categoryDrugClick(this)">S</a>
                </td>
                <td>
                    <a href="#" id="T" onclick="categoryDrugClick(this)">T</a>
                </td>
                <td>
                    <a href="#" id="U" onclick="categoryDrugClick(this)">U</a>
                </td>
                <td>
                    <a href="#" id="V" onclick="categoryDrugClick(this)">V</a>
                </td>
                <td>
                    <a href="#" id="W" onclick="categoryDrugClick(this)">W</a>
                </td>
                <td>
                    <a href="#" id="X" onclick="categoryDrugClick(this)">X</a>
                </td>
                <td>
                    <a href="#" id="Y" onclick="categoryDrugClick(this)">Y</a>
                </td>
                <td>
                    <a href="#" id="Z" onclick="categoryDrugClick(this)">Z</a>
                </td>

            </tr>

        </table>
        <%--<table id="drug-table" align="center" width="100%" border="1" style="font-size: 30px !important; padding-top:40px;">--%>
        <table id="drug-table" align="center">
        </table>
    </form>
</div>
<div id="dialog-confirm-save-drug"  style="display:none;direction: rtl;height: 100% !important;">
    <p><%=areUShureAddDrug%></p>
</div>

<script type="text/javascript">
    var checkeddrug=[]
    var beforeCancelPopupCheckeddrug=[]
    var unCheckeddrug=[];
    var drugPreload_data;
    var initStateDrug=true;

    $(document).ready(function(){
	    <%
	    if(!(request.getAttribute("drugWithValueList") instanceof String)){
	        List<DBObject> list = (List)request.getAttribute("drugWithValueList");
	        if(list!=null){
	            for(int i=0; i <list.size(); i++) {
	                DBObject dbObject=list.get(i);
	                String drugId=dbObject.get("drugId").toString().trim();
	                String drugName=dbObject.get("drugName").toString().trim();
	                String drugVal=dbObject.get("drugVal").toString().trim();
	                Object drugIsHighlight=dbObject.get("drugIsHighlight");
	                drugVal= StringEscapeUtils.escapeEcmaScript(drugVal);
	    %>
	    var drugId = '<%=drugId%>';
	    var drugName = '<%=drugName%>';
	    var drugVal = '<%=drugVal%>';
	    var drugIsHighlight = '<%=drugIsHighlight%>';
	    <%if(i%2==1){%>
	    $('#tabledrugDesc').append('<tr style=" background-color: lightgray; " id="' + drugId + '-drug-rowOperation' + '"></td><td contente="true">' + drugName + '</td><td contente="true"><textarea rows="10"  id="'+ drugId+'-drug-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletedrugRowClick(this)" /></td><td><input type="checkbox" id="'+drugId+'-checkbox-highlight'+'"</td></tr>' + '');
	    if(drugIsHighlight=='true'){
	        $('#'+drugId+'-checkbox-highlight').prop('checked',true)
	    }
	    <%}else{%>
	    $('#tabledrugDesc').append('<tr id="' + drugId + '-drug-rowOperation' + '"></td><td contente="true">' + drugName + '</td><td contente="true"><textarea rows="10"  id="'+ drugId+'-drug-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletedrugRowClick(this)" /></td><td><input type="checkbox" id="'+drugId+'-checkbox-highlight'+'"</td></tr>' + '');
	    if(drugIsHighlight=='true'){
	        $('#'+drugId+'-checkbox-highlight').prop('checked',true)
	    }
	    <%}%>
	    autoCompleteCurrentdrugApply(drugId + '-drug-rowOperation',
	            drugId+ '-drug-textarea');
	    $('#'+drugId+'-drug-textarea').val(drugVal);
	    checkeddrug[checkeddrug.length]=drugId;
	
	    <%
	
	               }
	      }
	      }
	    %>
    });


    function initSelect2drug(addId,deleteId) {
        var selected;
        if(addId!=undefined){
            selected=$("#p-drugMultiSelect").select2('val');
        }
        var urlLoad = "clinic/drug/drug/combo/loadAll";
        $.getJSON("<c:url value='/' />" + urlLoad, function (data) {

            drugPreload_data = data;
            var preload_data2 = [];

            $.each(drugPreload_data, function () {
                preload_data2.push({id:this.ComboID, text:this.ComboCaption });
            });

            $('#p-drugMultiSelect').select2({
                multiple:true,
                query:function (query) {
                    var data = {results:[]};

                    $.each(drugPreload_data, function () {
                        if (query.term.length == 0 || this.ComboCaption.toUpperCase().indexOf(query.term.toUpperCase()) == 0) {
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
                        return {id:term+'-newMehrsysDrug', text:term};
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
                $("#p-drugMultiSelect").select2('val',selected);
                deleteOptiondrug(deleteId);
                selectOptiondrug(addId);
            }
            if(initStateDrug==true){
                initStateDrug=false;
                $("#p-drugMultiSelect").select2('val', checkeddrug);
            }
        });

    }

    $('#p-drugMultiSelect').on("select2-removed", function(e){

        var newCheckeddrug=[];
        for(var i=0;i<checkeddrug.length;i++){
            if(checkeddrug[i]!=e.choice.id){
                newCheckeddrug[newCheckeddrug.length]=checkeddrug[i];
            }
        }
        checkeddrug= newCheckeddrug;

        $('#' + e.choice.id + '-drug-rowOperation').remove();
        afterRemoveRowFromTabledrug()
//        addOrDeletedrugTableAfterClosePopup();
    });
    $('#p-drugMultiSelect').on("select2-selecting", function(e){
        var id=""+e.object.id;
        if(id.indexOf('-newMehrsysDrug')==-1){
//            addOperationToTableAndSelectCheckBox(e.object.id,e.object.text);
            checkeddrug[checkeddrug.length]=e.object.id;
            addOrDeletedrugTableAfterClosePopup();
        }else{//should save on db
            e.object.id=e.object.id.split('-newMehrsysDrug')[0];
            var newItemArray=[];
            newItemArray[0]=e.object.text;
            newItemArray[1]=e.object.id;

//            var newItemArray=$(this).data('newItemArray');

            var itemArray=[];
            itemArray[0]=newItemArray[0];
            saveDrug(itemArray);
//            $("#dialog-confirm-save-drug").data('newItemArray',newItemArray).dialog('open');
        }



    });


    var cancelButtondrugClick=false;
    $(document).ready(function(){
	    $("#dialog-drug").dialog({
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
	                popupdrugOkButton();
	                $(this).dialog("close");
	            },
	            "cancel":function () {
	//                popupdrugCancelButton();
	                cancelButtondrugClick=true;
	                $(this).dialog("close");
	            }
	        },
	        close:function (event, ui) {
	            if(event.which!=undefined || cancelButtondrugClick==true){
	                popupdrugCancelButton();
	                cancelButtondrugClick=false;
	            }
	            $(this).dialog("close");
	        },
	        open:function (event, ui) {
	//            arrayCheckedBoxBeforeOpenedDrugOrder=$("#dialog-customizeDrug").find(":checkbox:checked");
	            beforeCancelPopupCheckeddrug=[];
	            for(var i=0;i<checkeddrug.length;i++){
	                beforeCancelPopupCheckeddrug[i]=checkeddrug[i];
	            }
	            categoryDrugClick();
	        }
	    });
	    //
	    initSelect2drug();
    });

//    $("#dialog-confirm-save-drug").dialog({
//        autoOpen:false,
//        show:{
//            effect:"slide",
//            duration:300
//        },
//        hide:{
//            effect:"slide",
//            duration:300
//        },
//        height:800,
//        width:800,
//        modal:true,
//        buttons:{
//            "ok":function () {
//
//                $(this).dialog("close");
//
//            },
//            "cancel":function () {
//                var newItemArray=$(this).data('newItemArray');
//
//                deleteOption(newItemArray[1]);
//                $(this).dialog("close");
//            }
//        }
//    });

	$(document).ready(function(){
	    $("#dialog-confirm-delete-drug").dialog({
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
	                    deleteCurrentdrugRow($(this).data('contents'));
	                }else if($(this).data('e')!=undefined){
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
	});

    function deleteCurrentdrugRow(contents){
        $('#' + contents[1].lastChild.children[1].id.split('-drug-textarea')[0] + '-drug-rowOperation').remove();
        afterRemoveRowFromTabledrug();
        var newCheckeddrug=[];
        for(var i=0;i<checkeddrug.length;i++){
            if(checkeddrug[i]!=contents[1].lastChild.children[1].id.split('-drug-textarea')[0]){
                newCheckeddrug[newCheckeddrug.length]=checkeddrug[i];
            }
        }
        checkeddrug= newCheckeddrug;
        $("#p-drugMultiSelect").select2('val',checkeddrug);
//        var arrayCheckedOperation = $("#dialog-current-operation").find(":checkbox:checked:not([isOperationCurrentGroup])");
//        for (var i = 0; i < arrayCheckedOperation.length; i++) {
//            if (arrayCheckedOperation[i].id == contents[1].lastChild.children[1].id+'-checkbox') {
//                arrayCheckedOperation[i].checked = false;
//            }
//        }
//        var id=contents[1].lastChild.children[1].id.split('-operation-current')[0];
//        deleteOption(id);

    }

    function adddrugClick() {
        $("#dialog-drug").dialog("open");
    }

    function categoryDrugClick(e) {
        var id
        if(e==undefined){
//            id="A";
            id="All";
        }else{
            id= e.id;
        }
        $.getJSON("<c:url value='/' />" + "clinic/customize/userDrug/loadByFirstChar/" + id, function (data) {

//            try{
            deleteRowdrug('drug-table');
//            }catch(e){

//            }

            if (data.length > 0) {
                makeTabledrug(data);
                checkingDialogPopupDrug()
            }


        });
    }

    function makeTabledrug(data) {
        queueRowCount = data.length;

        var tbl = document.getElementById('drug-table');
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
//                checkbox.value = data[i].ComboID+'-drug';
                checkbox.id = data[i].ComboID + '-drug';
                checkbox.onclick =function(){ checkBoxDrugClick(this)};
                var label = document.createElement('label');
                label.htmlFor = data[i].ComboID + '-drug';
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

    function  checkBoxDrugClick(e){
        var checkState=$(e).prop('checked');
        var newCheckeddrug=[];
        if(checkState){
            checkeddrug[checkeddrug.length]= e.id.split('-drug')[0];
        }else{
            unCheckeddrug[unCheckeddrug.length]= e.id.split('-drug')[0];
            for(var i=0;i<checkeddrug.length;i++){
                if(checkeddrug[i]!=e.id.split('-drug')[0]){
                    newCheckeddrug[newCheckeddrug.length]=checkeddrug[i];
                }
            }
            checkeddrug= newCheckeddrug;
        }


    }

    function checkingDialogPopupDrug(){
        var selected=$("#p-drugMultiSelect").select2('val');
        if(selected.length>0){
            for(w = 0; w < selected.length; w++){
                var found=false;
                for(j=0;j<unCheckeddrug.length;j++){
                    if(unCheckeddrug[j]==selected[w]){
                        found=true;
                    }
                }
                if(!found){
                    $("#"+selected[w]+"-drug").attr('checked',true);
                    $("#"+selected[w]+"-drug").prop('checked',true);
                }
            }
        }
        for(var i=0;i<checkeddrug.length;i++){
            $("#"+checkeddrug[i]+"-drug").attr('checked',true);
            $("#"+checkeddrug[i]+"-drug").prop('checked',true);
        }
    }

    function deleteRowdrug(tableID) {
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

    function  selectOptiondrug(id){
        var operationIdSelect2Array=$("#p-drugMultiSelect").select2('val');
        operationIdSelect2Array[operationIdSelect2Array.length]=id;
        $("#p-drugMultiSelect").select2('val',operationIdSelect2Array);


    }

    function  afterRemoveRowFromTabledrug(){
        var array=$('#tabledrugDesc').find('tr');
        if(array.length==1){
            return;
        }
        $('#tabledrugDesc').find('tr')[1].style.backgroundColor='';
        for(var i=2;i<array.length;i++){
            if(i%2==0){
                $('#tabledrugDesc').find('tr')[i].style.backgroundColor='lightgray'
            }else{
                $('#tabledrugDesc').find('tr')[i].style.backgroundColor=''
            }
        }
    }

    function addOrDeletedrugTable(){
        var drugDescArray= $('#tabledrugDesc').parent().parent().find('textarea');
        for(var i=0;i<drugDescArray.length;i++){
            var found=false;
            for(var j=0;j<checkeddrug.length;j++){
                if(drugDescArray[i].id.split('-drug-textarea')[0]==checkeddrug[j]){
                    found=true;
                    break;
                }
            }
            //not found in  checkeddrug so delete from table
            if(!found){
                $('#' + drugDescArray[i].id.split('-drug-textarea')[0] + '-drug-rowOperation').remove();
                afterRemoveRowFromTabledrug()
            }
        }

        for(var k=0;k<checkeddrug.length;k++){
            var founddrug=false;
            for(var w=0;w<drugDescArray.length;w++){
                if(drugDescArray[w].id.split('-drug-textarea')[0]==checkeddrug[k]){
                    founddrug=true;
                    break;
                }
            }
            //not found in  checkeddrug so delete from table
            if(!founddrug){
                var name;
                for(var l=0;l<drugPreload_data.length;l++){
                    if(drugPreload_data[l].ComboID==checkeddrug[k]){
                        name= drugPreload_data[l].ComboCaption;
                    }
                }
                $('#tabledrugDesc').append('<tr id="' + checkeddrug[k] + '-drug-rowOperation' + '"></td><td contente="true">' + name + '</td><td contente="true"><textarea rows="10"  id="'+ checkeddrug[k]+'-drug-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletedrugRowClick(this)" /></td><td><input type="checkbox" id="'+checkeddrug[k]+'-checkbox-highlight'+'"</td></tr>' + '');
                afterRemoveRowFromTabledrug();
                autoCompleteCurrentdrugApply(checkeddrug[k] + '-drug-rowOperation',
                        checkeddrug[k]+ '-drug-textarea');
            }
        }
    }

    function addOrDeletedrugTableAfterClosePopup(){
        var drugDescArray= $('#tabledrugDesc').parent().parent().find('textarea');
        for(var i=0;i<drugDescArray.length;i++){
            var found=false;
            for(var j=0;j<checkeddrug.length;j++){
                if(drugDescArray[i].id.split('-drug-textarea')[0]==checkeddrug[j]){
                    found=true;
                    break;
                }
            }
            //not found in  checkeddrug so delete from table
            if(!found){
//                $('#' + drugDescArray[i].id.split('-drug-textarea')[0] + '-drug-rowOperation').remove();
//                afterRemoveRowFromTabledrug()
            }
        }

        for(var k=0;k<checkeddrug.length;k++){
            var founddrug=false;
            for(var w=0;w<drugDescArray.length;w++){
                if(drugDescArray[w].id.split('-drug-textarea')[0]==checkeddrug[k]){
                    founddrug=true;
                    break;
                }
            }
            //not found in  checkeddrug so delete from table
            if(!founddrug){
                var name;
                for(var l=0;l<drugPreload_data.length;l++){
                    if(drugPreload_data[l].ComboID==checkeddrug[k]){
                        name= drugPreload_data[l].ComboCaption;
                    }
                }
                $('#tabledrugDesc').append('<tr id="' + checkeddrug[k] + '-drug-rowOperation' + '"></td><td contente="true">' + name + '</td><td contente="true"><textarea rows="10"  id="'+ checkeddrug[k]+'-drug-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletedrugRowClick(this)" /></td><td><input type="checkbox" id="'+checkeddrug[k]+'-checkbox-highlight'+'"</td></tr>' + '');
                afterRemoveRowFromTabledrug();
                autoCompleteCurrentdrugApply(checkeddrug[k] + '-drug-rowOperation',
                        checkeddrug[k]+ '-drug-textarea');
            }
        }
    }

    function deletedrugRowClick(th) {
        var contents = $(th).parent().parent().find('td[contente=true]');
        if(contents[1].lastChild.children[1].value.trim().length>0){

            $("#dialog-confirm-delete-drug").data('contents', contents).dialog("open");

        }else{
            deleteCurrentdrugRow(contents);
        }
        <!--$("#p-operationMultiSelect-current").select2('val', ${operationIds});-->

    }

    function deleteOptiondrug(id){
        var operationIdSelect2Array=$("#p-drugMultiSelect").select2('val');
        var newOperationIdSelect2Array=[];
        var index=0;
        for(var j=0;j<operationIdSelect2Array.length;j++){
            if(id!=operationIdSelect2Array[j]){
                newOperationIdSelect2Array[index]=operationIdSelect2Array[j];
                index++;
            }
        }
        $("#p-drugMultiSelect").select2('val',newOperationIdSelect2Array);
    }

    function popupdrugOkButton(){
//        var arrayCheckedLabTest = $("#dialog-drug").find(":checkbox:checked");
        var selectedLabTestInComboArray = $("#p-drugMultiSelect").select2('val');
        if ($("#p-drugMultiSelect").select2('val').length>0 ) {
            for (var j = 0; j < selectedLabTestInComboArray.length; j++) {
                var found = false;
                for (var index = 0; index < checkeddrug.length; index++) {
                    if (checkeddrug[index] == selectedLabTestInComboArray[j]) {
                        found = true;
                        break;
                    }
                }
                if (found == false) {
//                    deleteOptiondrug(selectedLabTestInComboArray[j])
                }
            }
        }
        for (var index = 0; index < checkeddrug.length; index++) {
            var id = checkeddrug[index];
            selectOptiondrug(id);
        }
        addOrDeletedrugTableAfterClosePopup();

    }

    function popupdrugCancelButton(){
        checkeddrug=[];
        for(var i=0;i<beforeCancelPopupCheckeddrug.length;i++){
            checkeddrug[i]=beforeCancelPopupCheckeddrug[i];
        }
    }


    jQuery('body')
            .bind(
            'click',
            function (e) {
                if (
                        jQuery('#dialog-drug').dialog('isOpen')
                        && !jQuery(e.target).is('.ui-dialog, a')
                        && !jQuery(e.target).closest('.ui-dialog').length
                        && event.target.nodeName!="BUTTON"
                ) {
                    popupdrugOkButton();
                    jQuery('#dialog-drug').dialog('close');
                }
            }
    );

    function autoCompleteCurrentdrugApply(trId,textAreaId){
        var elem = $("[id='"+ textAreaId+"']");
        var drugName=$("#"+trId).find('td')[0].innerHTML;
        elem.textcomplete([{
            match: /(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
            search: function (term, callback) {
                Common.postJSON("${pageContext.request.contextPath}" +
                        "/clinic/patient/visitMobileBase/drugDescAutoComplete/" + drugName, JSON.stringify({token:term}),
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

    function saveDrug(newItemArray){
        var data = {};
        data.newDrugOrder=newItemArray;
        if(newItemArray.length>0){
            $.ajax({
                url: '${pageContext.request.contextPath}'+'/clinic/patient/visitMobileBase/saveDrug/',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                dataType: 'json',
                type: 'POST',
                success: function (data, success, xhr) {
                    if(data.drugId!=undefined){
//                        var split = data.saveOperation.split(';;;;');
//                        if (split.length > 1) {
//                            for (var i = 0; i < split.length - 1; i = i + 2) {
                        $('#tabledrugDesc').append('<tr id="' + data.drugId + '-drug-rowOperation' + '"></td><td contente="true">' + data.drugName + '</td><td contente="true"><textarea rows="10"  id="'+ data.drugId+'-drug-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletedrugRowClick(this)" /></td><td><input type="checkbox" id="'+data.drugId+'-checkbox-highlight'+'"</td></tr>' + '');
//                                $('#tableCurrentOperation').append('<tr id="' + split[i] + '-operation-current-checkbox-rowOperation' + '"></td><td contente="true">' + split[i+1] + '</td><td contente="true"><textarea rows="10"  id="'+split[i]+'-operation-current'+'" class="operation-description" style="overflow-y: auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteCurrentOperationClick(this)" /></td><td><input type="checkbox" id="'+split[i]+'-currentOperation-checkbox-highlight'+'"</td></tr>' + '');
                        autoCompleteCurrentdrugApply(data.drugId + '-drug-rowOperation',
                                data.drugId+ '-drug-textarea');
//                                var allOperation = $("#dialog-current-operation").find(":checkbox");
//                                for (var w = 0; w < allOperation.length; w++) {
//                                    if (allOperation[w].id == split[i]+ '-operation-current-checkbox') {
//                                        allOperation[w].checked = true;
//                                    }
//                                }
//                            }
                            initSelect2drug(data.drugId,data.drugName);
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
