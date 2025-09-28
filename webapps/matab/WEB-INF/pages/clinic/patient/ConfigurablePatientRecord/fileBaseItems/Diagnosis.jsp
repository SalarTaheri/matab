<%@ page import="java.util.ResourceBundle" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<%@ page import="com.mongodb.DBObject" %>
<%@ page import="java.util.List" %>
<%@ page import="com.artonis.clinic.customize.view.DiagnosisCustomizationItemView" %>
<%@ page import="java.util.ArrayList" %>
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
<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String areUShureDeleteRow=resource.getString("clinic.patientfile.confirm.delete.row");
%>
<div class="uk-width-1-1" id="drug-kanban-static" style=" height:100%">
    <label dir="ltr">All Diagnosis</label>
    <input type="hidden" id="p-diagnosisMultiSelect" style="direction:ltr; width: 100%; height:100%;text-align: left "/>
    <div>
    <button name="Adddiagnosis" id="addCurrentdiagnosis" class="uk-button-success uk-active" style="margin-top:10px;height:29px" onclick="adddiagnosisClick()"
            title="Adddiagnosis">Add Diagnosis
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

<div id="dialog-current-diagnosis" title='select diagnosis' style="display:none;direction: ltr;height: 100% !important;">
    <form class="toPopup" style="direction: ltr">
        <%
        	List<String> idClassRemoveList = new ArrayList<String>();
            int column = 5;
            List<DiagnosisCustomizationItemView> diagnosisCustomizationItemViewList = (List<DiagnosisCustomizationItemView>) request.getAttribute("currentDiagnosisCustomizationList");
            int index = 0;
            Long currentCoding=0L;
            Long subCurrentCoding = 0L;
            Long previousCoding=0L;
            if(diagnosisCustomizationItemViewList==null || diagnosisCustomizationItemViewList.size()==0){
        %><table id="dialog-current-diagnosis-table"><%
            }
            for (DiagnosisCustomizationItemView diagnosisCustomizationItemView : diagnosisCustomizationItemViewList) {
                currentCoding=diagnosisCustomizationItemView.getDiagnosisCustomizationId();
                if (index == 0) {
                   if(currentCoding!=null){
                        previousCoding=currentCoding;
                   }
        %>
        <table id="dialog-current-diagnosis-table" >
            <tr style="background-color: #9cf;">
                <td>
                    <input type="checkbox" name="<%=diagnosisCustomizationItemView.getName()%>"  onclick="groupCurrentDiagnosisSelect(this)" isDiagnosisCurrentGroup="true"
                           id="<%=diagnosisCustomizationItemView.getName()%>-group-current-diagnosis-customize"/>
                    <%--title="<%=diagnosis.getName()%>"><%=diagnosis.getName()%>/>--%>
                    <label for="<%=diagnosisCustomizationItemView.getName()%>-group-current-diagnosis-customize"><span style="font-weight:bold"><%=diagnosisCustomizationItemView.getName()%></span>
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

                    <input type="checkbox" name="<%=diagnosisCustomizationItemView.getDiagnosisName()%>"  groupDiagnosisName="<%=diagnosisCustomizationItemView.getName()%>"
                           id="<%=diagnosisCustomizationItemView.getDiagnosisId().toString()%>-diagnosis-current-checkbox"/>
                           <%--title="<%=diagnosis.getName()%>"><%=diagnosis.getName()%>--%>
                    <label for="<%=diagnosisCustomizationItemView.getDiagnosisId().toString()%>-diagnosis-current-checkbox"><%=diagnosisCustomizationItemView.getDiagnosisName()%></label>
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
                    <input type="checkbox" name="<%=diagnosisCustomizationItemView.getName()%>" onclick="groupCurrentDiagnosisSelect(this)" isDiagnosisCurrentGroup="true"
                           id="<%=diagnosisCustomizationItemView.getName()%>-group-current-diagnosis-customize"/>
                    <%--title="<%=diagnosis.getName()%>"><%=diagnosis.getName()%>/>--%>
                    <label for="<%=diagnosisCustomizationItemView.getName()%>-group-current-diagnosis-customize"><span style="font-weight:bold"><%=diagnosisCustomizationItemView.getName()%></span>
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
                    <input type="checkbox" name="<%=diagnosisCustomizationItemView.getDiagnosisName()%>"  groupDiagnosisName="<%=diagnosisCustomizationItemView.getName()%>"
                           id="<%=diagnosisCustomizationItemView.getDiagnosisId().toString()%>-diagnosis-current-checkbox"/>
                           <%--title="<%=diagnosis.getName()%>"><%=diagnosis.getName()%>/>--%>
                    <label for="<%=diagnosisCustomizationItemView.getDiagnosisId().toString()%>-diagnosis-current-checkbox"><%=diagnosisCustomizationItemView.getDiagnosisName()%></label>
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
                    <input type="checkbox" name="<%=diagnosisCustomizationItemView.getDiagnosisName()%>"  groupDiagnosisName="<%=diagnosisCustomizationItemView.getName()%>"
                           id="<%=diagnosisCustomizationItemView.getDiagnosisId().toString()%>-diagnosis-current-checkbox"/>
                           <%--title="<%=diagnosis.getName()%>"><%=diagnosis.getName()%>--%>
                    <label for="<%=diagnosisCustomizationItemView.getDiagnosisId().toString()%>-diagnosis-current-checkbox"><%=diagnosisCustomizationItemView.getDiagnosisName()%></label>
                </td>
                <%
                } else if (index % column != 0 && index % column != column - 1) {
                %>
                <td width="25%">
                    <input type="checkbox" name="<%=diagnosisCustomizationItemView.getDiagnosisName()%>"  groupDiagnosisName="<%=diagnosisCustomizationItemView.getName()%>"
                           id="<%=diagnosisCustomizationItemView.getDiagnosisId().toString()%>-diagnosis-current-checkbox"/>
                    <label for="<%=diagnosisCustomizationItemView.getDiagnosisId().toString()%>-diagnosis-current-checkbox"><%=diagnosisCustomizationItemView.getDiagnosisName()%></label>
                </td>
                <%
                } else if (index % column == column - 1) {
                %>
                <td width="25%">
                    <input type="checkbox" name="<%=diagnosisCustomizationItemView.getDiagnosisName()%>" groupDiagnosisName="<%=diagnosisCustomizationItemView.getName()%>"
                           id="<%=diagnosisCustomizationItemView.getDiagnosisId().toString()%>-diagnosis-current-checkbox"/>
                    <label for="<%=diagnosisCustomizationItemView.getDiagnosisId().toString()%>-diagnosis-current-checkbox"><%=diagnosisCustomizationItemView.getDiagnosisName()%></label>
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
//        checkeddiagnosis[checkeddiagnosis.length]=e.object.id;
//        addOrDeletediagnosisTable();

        var id=""+e.object.id;
        if(id.indexOf('-newMehrsysdiagnosis')==-1){
            addDiagnosisToTableAndSelectCheckBox(e.object.id,e.object.text);
//            checkeddiagnosis[checkeddiagnosis.length]=e.object.id;
//            addOrDeletediagnosisTable();
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

    function addDiagnosisToTableAndSelectCheckBox(operationId,operationText){
        if(operationId==operationText){
            return;
        }
        var operationOrderWithValueArray=$('#tablediagnosisDesc').parent().parent().find('textarea');
        var found=false;
        for(var i=0;i<operationOrderWithValueArray.length;i++){
            if(operationOrderWithValueArray[i].id== operationId+'-diagnosis-textarea' ||operationOrderWithValueArray[i].id== operationText+'-diagnosis-textarea'){
                found=true;
                break;
            }
        }
        if(found==false){
            $('#tablediagnosisDesc').append('<tr id="' + operationId + '-diagnosis-rowDiagnosis' + '"></td><td contente="true">' + operationText + '</td><td contente="true"><textarea rows="10"  id="'+operationId+'-diagnosis-textarea' +'" class="diagnosis-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletediagnosisRowClick(this)" /></td><td><input type="checkbox" id="'+operationId+'-diagnosis-checkbox-highlight'+'"</td></tr>' + '');
            autoCompleteCurrentdiagnosisApply(operationId + '-diagnosis-rowDiagnosis',
                    operationId+ '-diagnosis-textarea');

        }
        $("#"+operationId+'-diagnosis-current-checkbox').attr('checked',true);
        $("#"+operationId+'-diagnosis-current-checkbox').prop('checked',true);
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
	        height:800,
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
	        height:800,
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

    function adddiagnosisClick() {
        $("#dialog-current-diagnosis").dialog("open");
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
        if(contents[1].lastChild.children[1].value.trim().length>0){

            $("#dialog-confirm-delete-diagnosis").data('contents', contents).dialog("open");

        }else{
            deleteCurrentdiagnosisRow(contents);
        }
        <!--$("#p-diagnosisMultiSelect-current").select2('val', ${diagnosisIds});-->

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

    function popupCurrentDiagnosisOkButton(){
        var operationOrderWithValueArray=$('#tablediagnosisDesc').parent().parent().find('textarea');
        var arrayCheckedOperation = $("#dialog-current-diagnosis").find(":checkbox:checked:not([isDiagnosisCurrentGroup])");
        var arrayAllOperation = $("#dialog-current-diagnosis").find(":checkbox");
        for (var i = 0; i < arrayCheckedOperation.length; i++) {
            var found=false;
            for(var j=0;j<operationOrderWithValueArray.length;j++){
                if(arrayCheckedOperation[i].id==operationOrderWithValueArray[j].id.split("-textarea")[0]+'-current-checkbox'){
                    found=true;
                    break;
                }
            }
            if(found==false){
                $('#tablediagnosisDesc').append('<tr id="' + arrayCheckedOperation[i].id.split("-diagnosis-current-checkbox")[0] + '-diagnosis-rowDiagnosis' + '"></td><td contente="true">' + arrayCheckedOperation[i].name + '</td><td contente="true"><textarea rows="10"  id="'+arrayCheckedOperation[i].id.split("-diagnosis-current-checkbox")[0] +'-diagnosis-textarea'+'" class="diagnosis-description" style="overflow-y: auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletediagnosisRowClick(this)" /></td><td><input type="checkbox" id="'+arrayCheckedOperation[i].id.split("-diagnosis-current-checkbox")[0]+'-diagnosis-checkbox-highlight'+'"</td></tr>' + '');
//                $('#tablediagnosisDesc').append('<tr id="' + checkeddiagnosis[k] + '-diagnosis-rowDiagnosis' + '"></td><td contente="true">' + name + '</td><td contente="true"><textarea rows="10"  id="'+ checkeddiagnosis[k]+'-diagnosis-textarea' +'" class="diagnosis-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletediagnosisRowClick(this)" /></td><td><input type="checkbox" id="'+checkeddiagnosis[k]+'-diagnosis-checkbox-highlight'+'"</td></tr>' + '');
                autoCompleteCurrentdiagnosisApply(arrayCheckedOperation[i].id.split("-diagnosis-current-checkbox")[0]+ '-diagnosis-rowDiagnosis',
                        arrayCheckedOperation[i].id.split("-diagnosis-current-checkbox")[0]+ '-diagnosis-textarea' );

                selectOptiondiagnosis(arrayCheckedOperation[i].id.split('-diagnosis-current-checkbox')[0]);
            }
        }

        for(var w=0;w<operationOrderWithValueArray.length;w++){
            var f=false;
            for(x=0;x<arrayCheckedOperation.length;x++){
                if(operationOrderWithValueArray[w].id.split("-textarea")[0]+'-current-checkbox'==arrayCheckedOperation[x].id){
                    f=true;
                    break;
                }
            }
            if(f==false){
                var foundInAllCustomizeOperation=false;
                for(var l=0;l<arrayAllOperation.length;l++){
                    if(operationOrderWithValueArray[w].id.split("-textarea")[0]+'-current-checkbox'==arrayAllOperation[l].id){
                        foundInAllCustomizeOperation=true;
                    }
                }
                if(foundInAllCustomizeOperation==true){
                    $('#' + operationOrderWithValueArray[w].id.split("-diagnosis-textarea")[0] + '-diagnosis-rowDiagnosis').remove();
                    deleteOptiondiagnosis(operationOrderWithValueArray[w].id.split('-diagnosis-textarea')[0]);
                }

            }
        }
        afterRemoveRowFromTablediagnosis();

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
                        jQuery('#dialog-current-diagnosis').dialog('isOpen')
                                && !jQuery(e.target).is('.ui-dialog, a')
                                && !jQuery(e.target).closest('.ui-dialog').length
                                && event.target.nodeName!="BUTTON"
                        ) {
                    popupCurrentDiagnosisOkButton();
                    jQuery('#dialog-current-diagnosis').dialog('close');
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
//                        var split = data.saveDiagnosis.split(';;;;');
//                        if (split.length > 1) {
//                            for (var i = 0; i < split.length - 1; i = i + 2) {
                        $('#tablediagnosisDesc').append('<tr id="' + data.diagnosisId + '-diagnosis-rowDiagnosis' + '"></td><td contente="true">' + data.diagnosisName + '</td><td contente="true"><textarea rows="10"  id="'+ data.diagnosisId+'-diagnosis-textarea' +'" class="diagnosis-description" style="overflow-y: width:100%; auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deletediagnosisRowClick(this)" /></td><td><input type="checkbox" id="'+data.diagnosisId+'-diagnosis-checkbox-highlight'+'"</td></tr>' + '');
                        afterRemoveRowFromTablediagnosis();
//                                $('#tableCurrentDiagnosis').append('<tr id="' + split[i] + '-diagnosis-current-checkbox-rowDiagnosis' + '"></td><td contente="true">' + split[i+1] + '</td><td contente="true"><textarea rows="10"  id="'+split[i]+'-diagnosis-current'+'" class="diagnosis-description" style="overflow-y: auto;overflow-x:auto; width: 100%; height:50px !important;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" class="uk-button uk-button-danger" onclick="deleteCurrentDiagnosisClick(this)" /></td><td><input type="checkbox" id="'+split[i]+'-currentDiagnosis-diagnosis-diagnosis-checkbox-highlight'+'"</td></tr>' + '');
                        autoCompleteCurrentdiagnosisApply(data.diagnosisId + '-diagnosis-rowDiagnosis',
                                data.diagnosisId+ '-diagnosis-textarea');
//                                var allDiagnosis = $("#dialog-current-diagnosis").find(":checkbox");
//                                for (var w = 0; w < allDiagnosis.length; w++) {
//                                    if (allDiagnosis[w].id == split[i]+ '-diagnosis-current-checkbox') {
//                                        allDiagnosis[w].checked = true;
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
