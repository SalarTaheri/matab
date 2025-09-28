<%--
<div class="uk-width-1-1" id="drugHistory-kanban-static" style=" height:100%">
    <input type="hidden" id="p-drugHistoryMultiSelect" style="direction:ltr; width: 100%; height:100% "/>
</div>
<script type="text/javascript">

    $(document).ready(function () {
        var preload_data;
        $.getJSON("${pageContext.request.contextPath}" + "/clinic/drug/drug/combo/loadDrugGet", function (data) {
            preload_data = data;
            var preload_data2 = [];
            $.each(preload_data, function () {
                preload_data2.push({id: this.ComboID, text: this.ComboCaption});
            });
            $('#p-drugHistoryMultiSelect').select2({
                multiple: true,
                query: function (query) {
                    var data = {results: []};
                    $.each(preload_data, function () {
                        if (query.term.length == 0 || this.ComboCaption.toUpperCase().indexOf(query.term.toUpperCase()) >= 0) {
                            data.results.push({id: this.ComboID, text: this.ComboCaption});
                        }
                    });
                    query.callback(data);
                },
                createSearchChoice: function (term, data) {
                    if ($(data).filter(
                                    function () {
                                        return this.text.localeCompare(term) === 0;
                                    }).length === 0) {
                        return {id: term, text: term};
                    }
                }, initSelection: function (element, callback) {
                    if (element.val() == "-1") {
                        element.val("");
                        return;
                    }
                    var data = [];
                    $(element.val().split(",")).each(function () {
                        if (this != "-1") {
                            for (var i = 0; i < preload_data2.length; i++) {
                                if (this != "-1") {
                                    if (this == preload_data2[i].id) {

                                        data.push({id: this, text: preload_data2[i].text});
                                    }
                                }
                            }
                        }
                    });
                    callback(data);
                },
                data: preload_data2
            });
            $("#p-drugHistoryMultiSelect").select2('val', ${drugsHistory});
        });
    })
</script>
--%>
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
<div class="uk-width-1-1" id="drugHistory-kanban-static" style=" height:100%">
    <label dir="ltr">All drugHistory</label>
    <input type="hidden" id="p-drugHistoryMultiSelect" style="direction:ltr; width: 100%; height:100%;text-align: left "/>
    <%--<div>--%>
    <button name="AdddrugHistory" id="addCurrentdrugHistory" class="uk-button-success uk-active" style="margin-top:10px;height:29px" onclick="adddrugHistoryClick()"
            title="AdddrugHistory">Add drugHistory
    </button>
    <%--</div>--%>
    <div id="tableCurrentOperationDiv" style=" padding-top: 10px; ">
        <table id="tabledrugHistoryDesc" height="100%" width="100%" style="text-align: center;background-color: #ffffff;" border="2" dir="ltr">
            <tr style=" background: -webkit-linear-gradient(top, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%); height: 25px; ">
                <th id="drugHistory">
                    drugHistory
                </th>
                <th id="drugHistoryValue">
                    Description
                </th>

                <th id="deletedrugHistory">
                    Delete
                </th>
                <th id="highlightdrugHistory">
                    Highlight
                </th>
            </tr>

        </table>
    </div>
</div>

<div id="dialog-confirm-delete-drugHistory"  style="display:none;direction: rtl;height: 100% !important;">
    <p><%=areUShureDeleteRow%></p>
</div>

<div id="dialog-drugHistory" title='Select drugHistory'
     style="display:none;direction: ltr;height: 100% !important;">
    <form class="toPopup" style="direction: ltr">

        <table align="center" width="100%">
            <tr>
                <td>
                    <a href="#" id="All" onclick="categorydrugHistoryClick(this)">All</a>
                </td>
                <td>
                    <a href="#" id="A" onclick="categorydrugHistoryClick(this)">A</a>
                </td>
                <td>
                    <a href="#" id="B" onclick="categorydrugHistoryClick(this)">B</a>
                </td>
                <td>
                    <a href="#" id="C" onclick="categorydrugHistoryClick(this)">C</a>
                </td>
                <td>
                    <a href="#" id="D" onclick="categorydrugHistoryClick(this)">D</a>
                </td>
                <td>
                    <a href="#" id="E" onclick="categorydrugHistoryClick(this)">E</a>
                </td>
                <td>
                    <a href="#" id="F" onclick="categorydrugHistoryClick(this)">F</a>
                </td>
                <td>
                    <a href="#" id="G" onclick="categorydrugHistoryClick(this)">G</a>
                </td>
                <td>
                    <a href="#" id="H" onclick="categorydrugHistoryClick(this)">H</a>
                </td>
                <td>
                    <a href="#" id="I" onclick="categorydrugHistoryClick(this)">I</a>
                </td>
                <td>
                    <a href="#" id="J" onclick="categorydrugHistoryClick(this)">J</a>
                </td>
                <td>
                    <a href="#" id="K" onclick="categorydrugHistoryClick(this)">K</a>
                </td>
                <td>
                    <a href="#" id="L" onclick="categorydrugHistoryClick(this)">L</a>
                </td>
                <td>
                    <a href="#" id="M" onclick="categorydrugHistoryClick(this)">M</a>
                </td>
                <td>
                    <a href="#" id="N" onclick="categorydrugHistoryClick(this)">N</a>
                </td>
                <td>
                    <a href="#" id="O" onclick="categorydrugHistoryClick(this)">O</a>
                </td>
                <td>
                    <a href="#" id="P" onclick="categorydrugHistoryClick(this)">P</a>
                </td>
                <td>
                    <a href="#" id="Q" onclick="categorydrugHistoryClick(this)">Q</a>
                </td>
                <td>
                    <a href="#" id="R" onclick="categorydrugHistoryClick(this)">R</a>
                </td>
                <td>
                    <a href="#" id="S" onclick="categorydrugHistoryClick(this)">S</a>
                </td>
                <td>
                    <a href="#" id="T" onclick="categorydrugHistoryClick(this)">T</a>
                </td>
                <td>
                    <a href="#" id="U" onclick="categorydrugHistoryClick(this)">U</a>
                </td>
                <td>
                    <a href="#" id="V" onclick="categorydrugHistoryClick(this)">V</a>
                </td>
                <td>
                    <a href="#" id="W" onclick="categorydrugHistoryClick(this)">W</a>
                </td>
                <td>
                    <a href="#" id="X" onclick="categorydrugHistoryClick(this)">X</a>
                </td>
                <td>
                    <a href="#" id="Y" onclick="categorydrugHistoryClick(this)">Y</a>
                </td>
                <td>
                    <a href="#" id="Z" onclick="categorydrugHistoryClick(this)">Z</a>
                </td>

            </tr>

        </table>
        <%--<table id="drugHistory-table" align="center" width="100%" border="1" style="font-size: 30px !important; padding-top:40px;">--%>
        <table id="drugHistory-table" align="center">
        </table>
    </form>
</div>
<div id="dialog-confirm-save-drugHistory"  style="display:none;direction: rtl;height: 100% !important;">
    <p><%=areUShureAddDrug%></p>
</div>

<script type="text/javascript">
    var checkeddrugHistory=[]
    var beforeCancelPopupCheckeddrugHistory=[]
    var unCheckeddrugHistory=[];
    var drugHistoryPreload_data;
    var initStatedrugHistory=true;

    $(document).ready(function(){
        <%
        if(!(request.getAttribute("drugHistoryWithValueList") instanceof String)){
            List<DBObject> list = (List)request.getAttribute("drugHistoryWithValueList");
            if(list!=null){
                for(int i=0; i <list.size(); i++) {
                    if(!(list.get(i) instanceof  DBObject)){
                         continue;
                    }
                    DBObject dbObject=list.get(i);
                    String drugHistoryId=dbObject.get("drugHistoryId").toString().trim();
                    String drugHistoryName=dbObject.get("drugHistoryName").toString().trim();
                    String drugHistoryVal=dbObject.get("drugHistoryVal").toString().trim();
                    Object drugHistoryIsHighlight=dbObject.get("drugHistoryIsHighlight");
                    drugHistoryVal= StringEscapeUtils.escapeEcmaScript(drugHistoryVal);
        %>
        var drugHistoryId = '<%=drugHistoryId%>';
        var drugHistoryName = '<%=drugHistoryName%>';
        var drugHistoryVal = '<%=drugHistoryVal%>';
        var drugHistoryIsHighlight = '<%=drugHistoryIsHighlight%>';
        <%if(i%2==1){%>
        $('#tabledrugHistoryDesc').append('<tr style=" background-color: lightgray; " id="' + drugHistoryId + '-drugHistory-rowOperation' + '"></td><td contente="true">' + drugHistoryName + '</td><td contente="true"><textarea rows="10"  id="'+ drugHistoryId+'-drugHistory-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletedrugHistoryRowClick(this)" /></td><td><input type="checkbox" id="'+drugHistoryId+'-history-checkbox-highlight'+'"</td></tr>' + '');
        if(drugHistoryIsHighlight=='true'){
            $('#'+drugHistoryId+'-history-checkbox-highlight').prop('checked',true)
        }
        <%}else{%>
        $('#tabledrugHistoryDesc').append('<tr id="' + drugHistoryId + '-drugHistory-rowOperation' + '"></td><td contente="true">' + drugHistoryName + '</td><td contente="true"><textarea rows="10"  id="'+ drugHistoryId+'-drugHistory-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletedrugHistoryRowClick(this)" /></td><td><input type="checkbox" id="'+drugHistoryId+'-history-checkbox-highlight'+'"</td></tr>' + '');
        if(drugHistoryIsHighlight=='true'){
            $('#'+drugHistoryId+'-history-checkbox-highlight').prop('checked',true)
        }
        <%}%>
        autoCompleteCurrentdrugHistoryApply(drugHistoryId + '-drugHistory-rowOperation',
                drugHistoryId+ '-drugHistory-textarea');
        $('#'+drugHistoryId+'-drugHistory-textarea').val(drugHistoryVal);
        checkeddrugHistory[checkeddrugHistory.length]=drugHistoryId;

        <%

                   }
          }
          }
        %>
    });


    function initSelect2drugHistory(addId,deleteId) {
        var selected;
        if(addId!=undefined){
            selected=$("#p-drugHistoryMultiSelect").select2('val');
        }
        var urlLoad = "clinic/drug/drug/combo/loadAll";
        $.getJSON("<c:url value='/' />" + urlLoad, function (data) {

            drugHistoryPreload_data = data;
            var preload_data2 = [];

            $.each(drugHistoryPreload_data, function () {
                preload_data2.push({id:this.ComboID, text:this.ComboCaption });
            });

            $('#p-drugHistoryMultiSelect').select2({
                multiple:true,
                query:function (query) {
                    var data = {results:[]};

                    $.each(drugHistoryPreload_data, function () {
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
                        return {id:term+'-newMehrsysdrugHistory', text:term};
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
                $("#p-drugHistoryMultiSelect").select2('val',selected);
                deleteOptiondrugHistory(deleteId);
                selectOptiondrugHistory(addId);
            }
            if(initStatedrugHistory==true){
                initStatedrugHistory=false;
                $("#p-drugHistoryMultiSelect").select2('val', checkeddrugHistory);
            }
        });

    }

    $('#p-drugHistoryMultiSelect').on("select2-removed", function(e){

        var newCheckeddrugHistory=[];
        for(var i=0;i<checkeddrugHistory.length;i++){
            if(checkeddrugHistory[i]!=e.choice.id){
                newCheckeddrugHistory[newCheckeddrugHistory.length]=checkeddrugHistory[i];
            }
        }
        checkeddrugHistory= newCheckeddrugHistory;

        $('#' + e.choice.id + '-drugHistory-rowOperation').remove();
        afterRemoveRowFromTabledrugHistory()
//        addOrDeletedrugHistoryTableAfterClosePopup();
    });
    $('#p-drugHistoryMultiSelect').on("select2-selecting", function(e){
        var id=""+e.object.id;
        if(id.indexOf('-newMehrsysdrugHistory')==-1){
//            addOperationToTableAndSelectCheckBox(e.object.id,e.object.text);
            checkeddrugHistory[checkeddrugHistory.length]=e.object.id;
            addOrDeletedrugHistoryTableAfterClosePopup();
        }else{//should save on db
            e.object.id=e.object.id.split('-newMehrsysdrugHistory')[0];
            var newItemArray=[];
            newItemArray[0]=e.object.text;
            newItemArray[1]=e.object.id;

//            var newItemArray=$(this).data('newItemArray');

            var itemArray=[];
            itemArray[0]=newItemArray[0];
            savedrugHistory(itemArray);
//            $("#dialog-confirm-save-drugHistory").data('newItemArray',newItemArray).dialog('open');
        }



    });


    var cancelButtondrugHistoryClick=false;
    $(document).ready(function(){
        $("#dialog-drugHistory").dialog({
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
                    popupdrugHistoryOkButton();
                    $(this).dialog("close");
                },
                "cancel":function () {
                    //                popupdrugHistoryCancelButton();
                    cancelButtondrugHistoryClick=true;
                    $(this).dialog("close");
                }
            },
            close:function (event, ui) {
                if(event.which!=undefined || cancelButtondrugHistoryClick==true){
                    popupdrugHistoryCancelButton();
                    cancelButtondrugHistoryClick=false;
                }
                $(this).dialog("close");
            },
            open:function (event, ui) {
                //            arrayCheckedBoxBeforeOpeneddrugHistoryOrder=$("#dialog-customizedrugHistory").find(":checkbox:checked");
                beforeCancelPopupCheckeddrugHistory=[];
                for(var i=0;i<checkeddrugHistory.length;i++){
                    beforeCancelPopupCheckeddrugHistory[i]=checkeddrugHistory[i];
                }
                categorydrugHistoryClick();
            }
        });
        //
        initSelect2drugHistory();
    });

    //    $("#dialog-confirm-save-drugHistory").dialog({
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
        $("#dialog-confirm-delete-drugHistory").dialog({
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
                        deleteCurrentdrugHistoryRow($(this).data('contents'));
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

    function deleteCurrentdrugHistoryRow(contents){
        $('#' + contents[1].lastChild.children[1].id.split('-drugHistory-textarea')[0] + '-drugHistory-rowOperation').remove();
        afterRemoveRowFromTabledrugHistory();
        var newCheckeddrugHistory=[];
        for(var i=0;i<checkeddrugHistory.length;i++){
            if(checkeddrugHistory[i]!=contents[1].lastChild.children[1].id.split('-drugHistory-textarea')[0]){
                newCheckeddrugHistory[newCheckeddrugHistory.length]=checkeddrugHistory[i];
            }
        }
        checkeddrugHistory= newCheckeddrugHistory;
        $("#p-drugHistoryMultiSelect").select2('val',checkeddrugHistory);
//        var arrayCheckedOperation = $("#dialog-current-operation").find(":checkbox:checked:not([isOperationCurrentGroup])");
//        for (var i = 0; i < arrayCheckedOperation.length; i++) {
//            if (arrayCheckedOperation[i].id == contents[1].lastChild.children[1].id+'-checkbox') {
//                arrayCheckedOperation[i].checked = false;
//            }
//        }
//        var id=contents[1].lastChild.children[1].id.split('-operation-current')[0];
//        deleteOption(id);

    }

    function adddrugHistoryClick() {
        $("#dialog-drugHistory").dialog("open");
    }

    function categorydrugHistoryClick(e) {
        var id
        if(e==undefined){
//            id="A";
            id="All";
        }else{
            id= e.id;
        }
        $.getJSON("<c:url value='/' />" + "clinic/customize/userDrug/loadByFirstChar/" + id, function (data) {

//            try{
            deleteRowdrugHistory('drugHistory-table');
//            }catch(e){

//            }

            if (data.length > 0) {
                makeTabledrugHistory(data);
                checkingDialogPopupdrugHistory()
            }


        });
    }

    function makeTabledrugHistory(data) {
        queueRowCount = data.length;

        var tbl = document.getElementById('drugHistory-table');
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
//                checkbox.value = data[i].ComboID+'-drugHistory';
                checkbox.id = data[i].ComboID + '-drugHistory';
                checkbox.onclick =function(){ checkBoxdrugHistoryClick(this)};
                var label = document.createElement('label');
                label.htmlFor = data[i].ComboID + '-drugHistory';
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

    function  checkBoxdrugHistoryClick(e){
        var checkState=$(e).prop('checked');
        var newCheckeddrugHistory=[];
        if(checkState){
            checkeddrugHistory[checkeddrugHistory.length]= e.id.split('-drugHistory')[0];
        }else{
            unCheckeddrugHistory[unCheckeddrugHistory.length]= e.id.split('-drugHistory')[0];
            for(var i=0;i<checkeddrugHistory.length;i++){
                if(checkeddrugHistory[i]!=e.id.split('-drugHistory')[0]){
                    newCheckeddrugHistory[newCheckeddrugHistory.length]=checkeddrugHistory[i];
                }
            }
            checkeddrugHistory= newCheckeddrugHistory;
        }


    }

    function checkingDialogPopupdrugHistory(){
        var selected=$("#p-drugHistoryMultiSelect").select2('val');
        if(selected.length>0){
            for(w = 0; w < selected.length; w++){
                var found=false;
                for(j=0;j<unCheckeddrugHistory.length;j++){
                    if(unCheckeddrugHistory[j]==selected[w]){
                        found=true;
                    }
                }
                if(!found){
                    $("#"+selected[w]+"-drugHistory").attr('checked',true);
                    $("#"+selected[w]+"-drugHistory").prop('checked',true);
                }
            }
        }
        for(var i=0;i<checkeddrugHistory.length;i++){
            $("#"+checkeddrugHistory[i]+"-drugHistory").attr('checked',true);
            $("#"+checkeddrugHistory[i]+"-drugHistory").prop('checked',true);
        }
    }

    function deleteRowdrugHistory(tableID) {
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

    function  selectOptiondrugHistory(id){
        var operationIdSelect2Array=$("#p-drugHistoryMultiSelect").select2('val');
        operationIdSelect2Array[operationIdSelect2Array.length]=id;
        $("#p-drugHistoryMultiSelect").select2('val',operationIdSelect2Array);


    }

    function  afterRemoveRowFromTabledrugHistory(){
        var array=$('#tabledrugHistoryDesc').find('tr');
        if(array.length==1){
            return;
        }
        $('#tabledrugHistoryDesc').find('tr')[1].style.backgroundColor='';
        for(var i=2;i<array.length;i++){
            if(i%2==0){
                $('#tabledrugHistoryDesc').find('tr')[i].style.backgroundColor='lightgray'
            }else{
                $('#tabledrugHistoryDesc').find('tr')[i].style.backgroundColor=''
            }
        }
    }

    function addOrDeletedrugHistoryTable(){
        var drugHistoryDescArray= $('#tabledrugHistoryDesc').parent().parent().find('textarea');
        for(var i=0;i<drugHistoryDescArray.length;i++){
            var found=false;
            for(var j=0;j<checkeddrugHistory.length;j++){
                if(drugHistoryDescArray[i].id.split('-drugHistory-textarea')[0]==checkeddrugHistory[j]){
                    found=true;
                    break;
                }
            }
            //not found in  checkeddrugHistory so delete from table
            if(!found){
                $('#' + drugHistoryDescArray[i].id.split('-drugHistory-textarea')[0] + '-drugHistory-rowOperation').remove();
                afterRemoveRowFromTabledrugHistory()
            }
        }

        for(var k=0;k<checkeddrugHistory.length;k++){
            var founddrugHistory=false;
            for(var w=0;w<drugHistoryDescArray.length;w++){
                if(drugHistoryDescArray[w].id.split('-drugHistory-textarea')[0]==checkeddrugHistory[k]){
                    founddrugHistory=true;
                    break;
                }
            }
            //not found in  checkeddrugHistory so delete from table
            if(!founddrugHistory){
                var name;
                for(var l=0;l<drugHistoryPreload_data.length;l++){
                    if(drugHistoryPreload_data[l].ComboID==checkeddrugHistory[k]){
                        name= drugHistoryPreload_data[l].ComboCaption;
                    }
                }
                $('#tabledrugHistoryDesc').append('<tr id="' + checkeddrugHistory[k] + '-drugHistory-rowOperation' + '"></td><td contente="true">' + name + '</td><td contente="true"><textarea rows="10"  id="'+ checkeddrugHistory[k]+'-drugHistory-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletedrugHistoryRowClick(this)" /></td><td><input type="checkbox" id="'+checkeddrugHistory[k]+'-history-checkbox-highlight'+'"</td></tr>' + '');
                afterRemoveRowFromTabledrugHistory();
                autoCompleteCurrentdrugHistoryApply(checkeddrugHistory[k] + '-drugHistory-rowOperation',
                        checkeddrugHistory[k]+ '-drugHistory-textarea');
            }
        }
    }

    function addOrDeletedrugHistoryTableAfterClosePopup(){
        var drugHistoryDescArray= $('#tabledrugHistoryDesc').parent().parent().find('textarea');
        for(var i=0;i<drugHistoryDescArray.length;i++){
            var found=false;
            for(var j=0;j<checkeddrugHistory.length;j++){
                if(drugHistoryDescArray[i].id.split('-drugHistory-textarea')[0]==checkeddrugHistory[j]){
                    found=true;
                    break;
                }
            }
            //not found in  checkeddrugHistory so delete from table
            if(!found){
//                $('#' + drugHistoryDescArray[i].id.split('-drugHistory-textarea')[0] + '-drugHistory-rowOperation').remove();
//                afterRemoveRowFromTabledrugHistory()
            }
        }

        for(var k=0;k<checkeddrugHistory.length;k++){
            var founddrugHistory=false;
            for(var w=0;w<drugHistoryDescArray.length;w++){
                if(drugHistoryDescArray[w].id.split('-drugHistory-textarea')[0]==checkeddrugHistory[k]){
                    founddrugHistory=true;
                    break;
                }
            }
            //not found in  checkeddrugHistory so delete from table
            if(!founddrugHistory){
                var name;
                for(var l=0;l<drugHistoryPreload_data.length;l++){
                    if(drugHistoryPreload_data[l].ComboID==checkeddrugHistory[k]){
                        name= drugHistoryPreload_data[l].ComboCaption;
                    }
                }
                $('#tabledrugHistoryDesc').append('<tr id="' + checkeddrugHistory[k] + '-drugHistory-rowOperation' + '"></td><td contente="true">' + name + '</td><td contente="true"><textarea rows="10"  id="'+ checkeddrugHistory[k]+'-drugHistory-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletedrugHistoryRowClick(this)" /></td><td><input type="checkbox" id="'+checkeddrugHistory[k]+'-history-checkbox-highlight'+'"</td></tr>' + '');
                afterRemoveRowFromTabledrugHistory();
                autoCompleteCurrentdrugHistoryApply(checkeddrugHistory[k] + '-drugHistory-rowOperation',
                        checkeddrugHistory[k]+ '-drugHistory-textarea');
            }
        }
    }

    function deletedrugHistoryRowClick(th) {
        var contents = $(th).parent().parent().find('td[contente=true]');
        if(contents[1].lastChild.children[1].value.trim().length>0){

            $("#dialog-confirm-delete-drugHistory").data('contents', contents).dialog("open");

        }else{
            deleteCurrentdrugHistoryRow(contents);
        }
        <!--$("#p-operationMultiSelect-current").select2('val', ${operationIds});-->

    }

    function deleteOptiondrugHistory(id){
        var operationIdSelect2Array=$("#p-drugHistoryMultiSelect").select2('val');
        var newOperationIdSelect2Array=[];
        var index=0;
        for(var j=0;j<operationIdSelect2Array.length;j++){
            if(id!=operationIdSelect2Array[j]){
                newOperationIdSelect2Array[index]=operationIdSelect2Array[j];
                index++;
            }
        }
        $("#p-drugHistoryMultiSelect").select2('val',newOperationIdSelect2Array);
    }

    function popupdrugHistoryOkButton(){
//        var arrayCheckedLabTest = $("#dialog-drugHistory").find(":checkbox:checked");
        var selectedLabTestInComboArray = $("#p-drugHistoryMultiSelect").select2('val');
        if ($("#p-drugHistoryMultiSelect").select2('val').length>0 ) {
            for (var j = 0; j < selectedLabTestInComboArray.length; j++) {
                var found = false;
                for (var index = 0; index < checkeddrugHistory.length; index++) {
                    if (checkeddrugHistory[index] == selectedLabTestInComboArray[j]) {
                        found = true;
                        break;
                    }
                }
                if (found == false) {
//                    deleteOptiondrugHistory(selectedLabTestInComboArray[j])
                }
            }
        }
        for (var index = 0; index < checkeddrugHistory.length; index++) {
            var id = checkeddrugHistory[index];
            selectOptiondrugHistory(id);
        }
        addOrDeletedrugHistoryTableAfterClosePopup();

    }

    function popupdrugHistoryCancelButton(){
        checkeddrugHistory=[];
        for(var i=0;i<beforeCancelPopupCheckeddrugHistory.length;i++){
            checkeddrugHistory[i]=beforeCancelPopupCheckeddrugHistory[i];
        }
    }


    jQuery('body')
            .bind(
            'click',
            function (e) {
                if (
                        jQuery('#dialog-drugHistory').dialog('isOpen')
                        && !jQuery(e.target).is('.ui-dialog, a')
                        && !jQuery(e.target).closest('.ui-dialog').length
                        && event.target.nodeName!="BUTTON"
                ) {
                    popupdrugHistoryOkButton();
                    jQuery('#dialog-drugHistory').dialog('close');
                }
            }
    );

    function autoCompleteCurrentdrugHistoryApply(trId,textAreaId){
        var elem = $("[id='"+ textAreaId+"']");
        var drugHistoryName=$("#"+trId).find('td')[0].innerHTML;
        elem.textcomplete([{
            match: /(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
            search: function (term, callback) {
                Common.postJSON("${pageContext.request.contextPath}" +
                        "/clinic/patient/visitMobileBase/drugHistoryDescAutoComplete/" + drugHistoryName, JSON.stringify({token:term}),
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

    function savedrugHistory(newItemArray){
        var data = {};
        data.newdrugHistoryOrder=newItemArray;
        if(newItemArray.length>0){
            $.ajax({
                url: '${pageContext.request.contextPath}'+'/clinic/patient/visitMobileBase/savedrugHistory/',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                dataType: 'json',
                type: 'POST',
                success: function (data, success, xhr) {
                    if(data.drugHistoryId!=undefined){
//                        var split = data.saveOperation.split(';;;;');
//                        if (split.length > 1) {
//                            for (var i = 0; i < split.length - 1; i = i + 2) {
                        $('#tabledrugHistoryDesc').append('<tr id="' + data.drugHistoryId + '-drugHistory-rowOperation' + '"></td><td contente="true">' + data.drugHistoryName + '</td><td contente="true"><textarea rows="10"  id="'+ data.drugHistoryId+'-drugHistory-textarea' +'" class="operation-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletedrugHistoryRowClick(this)" /></td><td><input type="checkbox" id="'+data.drugHistoryId+'-history-checkbox-highlight'+'"</td></tr>' + '');
//                                $('#tableCurrentOperation').append('<tr id="' + split[i] + '-operation-current-checkbox-rowOperation' + '"></td><td contente="true">' + split[i+1] + '</td><td contente="true"><textarea rows="10"  id="'+split[i]+'-operation-current'+'" class="operation-description" style="overflow-y: auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteCurrentOperationClick(this)" /></td><td><input type="checkbox" id="'+split[i]+'-currentOperation-checkbox-highlight'+'"</td></tr>' + '');
                        autoCompleteCurrentdrugHistoryApply(data.drugHistoryId + '-drugHistory-rowOperation',
                                data.drugHistoryId+ '-drugHistory-textarea');
//                                var allOperation = $("#dialog-current-operation").find(":checkbox");
//                                for (var w = 0; w < allOperation.length; w++) {
//                                    if (allOperation[w].id == split[i]+ '-operation-current-checkbox') {
//                                        allOperation[w].checked = true;
//                                    }
//                                }
//                            }
                        initSelect2drugHistory(data.drugHistoryId,data.drugHistoryName);
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
