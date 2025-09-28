<%@ page import="java.util.List" %>
<%@ page import="com.artonis.clinic.basicInfo.model.Image" %>
<%@ page import="com.mongodb.DBObject" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<%@ page import="com.artonis.clinic.customize.view.UserImageItemView" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String areUShureDeleteRow=resource.getString("clinic.patientfile.confirm.delete.row");
    String areUShureAddImage=resource.getString("clinic.patientfile.confirm.add.new.image");
    List<String> idClassRemoveList=new ArrayList<String>();
%>
<link rel="stylesheet" href="<c:url value='/resources/js/select2-3.4.5/select2.css' />" type="text/css"/>
<script type="text/javascript" src="<c:url value='/resources/js/select2-3.4.5/select2.js' />"></script>
<input id='tageForGetListTag' type='hidden'/>

<div class="uk-width-1-1" id="drug-kanban-static" style=" height:100%">
    <label dir="ltr">All procedure</label>
    <input type="hidden" id="p-imageMultiSelect" style="direction:ltr; width: 100%; height:100% "/>
</div>
<div>
    <div>
        <button name="AddImage" id="addImage" onclick="addImageClick()" title="AddImage">Add procedure</button>
    </div>

    <div id="tableImageDiv">
        <table id="tableImage" height="100%" width="100%" style="text-align: center;" border="2" dir="ltr">
            <tr>
                <th id="image">
                    procedure
                </th>
                <th id="description">
                    description
                </th>

                <th id="deleteImage">
                    delete
                </th>
            </tr>

        </table>
    </div>
</div>
<br>

<div id="dialog-image" title='select image' style="display:none;direction: ltr;height: 100% !important;">
    <form class="toPopup" style="direction: ltr">
        <%
            int column = 5;
            List<UserImageItemView> userImageItemViewList = (List<UserImageItemView>) request.getAttribute("imageAllList");
            int index = 0;
            Long currentCoding=0L;
            Long subCurrentCoding = 0L;
            Long previousCoding=0L;
            if(userImageItemViewList==null || userImageItemViewList.size()==0){
        %><table><%
            }
            for (UserImageItemView userImageItemView : userImageItemViewList) {
                currentCoding=userImageItemView.getUser_image_id();
                if (index == 0) {
                    if(currentCoding!=null){
                        previousCoding=currentCoding;
                   }
        %>
        <table>
            <tr style="background-color: #9cf;">
                <td>
                    <input type="checkbox" name="<%=userImageItemView.getName()%>"  onclick="groupOrderImageSelect(this)" isImageOrderGroup="true"
                           id="<%=userImageItemView.getName()%>-group-image-order"/>
                    <%--title="<%=image.getName()%>"><%=image.getName()%>/>--%>
                    <label for="<%=userImageItemView.getName()%>-group-image-order"><span style="font-weight:bold"><%=userImageItemView.getName()%></span>
                    </label>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <%--<tr id="image-order-coding-<%=currentCoding%>" class="lineBorder">--%>
            <tr id="image-order-coding-<%=currentCoding%>">
                <td>
                    <%--<base:checkbox styleClass="small" name="<%=medicalTest.getName()%>" id="<%=medicalTest.getId().toString()%>" caption="<%=medicalTest.getName()%>" direction="ltr"/>--%>

                    <input type="checkbox" name="<%=userImageItemView.getImageName()%>" groupOrderImageName="<%=userImageItemView.getName()%>"
                           id="<%=userImageItemView.getImage_id().toString()%>-image-checkbox"/>
                           <%--title="<%=image.getName()%>"><%=image.getName()%>--%>
                        <label for="<%=userImageItemView.getImage_id().toString()%>-image-checkbox"><%=userImageItemView.getImageName()%></label>
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


                    <input type="checkbox" name="<%=userImageItemView.getName()%>" onclick="groupOrderImageSelect(this)" isImageOrderGroup="true"
                           id="<%=userImageItemView.getName()%>-group-image-customize"/>
                    <%--title="<%=image.getName()%>"><%=image.getName()%>/>--%>
                    <label for="<%=userImageItemView.getName()%>-group-image-customize"><span style="font-weight:bold"><%=userImageItemView.getName()%></span>
                    </label>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <%--<tr id="image-order-coding-<%=currentCoding%>" class="lineBorder">--%>
            <tr id="image-order-coding-<%=currentCoding%>">
                <td>


                    <input type="checkbox" name="<%=userImageItemView.getImageName()%>" groupOrderImageName="<%=userImageItemView.getName()%>"
                           id="<%=userImageItemView.getImage_id().toString()%>-image-checkbox"/>
                           <%--title="<%=image.getName()%>"><%=image.getName()%>--%>
                    <label for="<%=userImageItemView.getImage_id().toString()%>-image-checkbox"><%=userImageItemView.getImageName()%></label>
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
            <tr id="image-order-coding-<%=trId%>" class="lineBorder">
                <td>

                    <input type="checkbox" name="<%=userImageItemView.getImageName()%>" groupOrderImageName="<%=userImageItemView.getName()%>"
                           id="<%=userImageItemView.getImage_id().toString()%>-image-checkbox"/>
                    <%--title="<%=image.getName()%>"><%=image.getName()%>--%>
                    <label for="<%=userImageItemView.getImage_id().toString()%>-image-checkbox"><%=userImageItemView.getImageName()%></label>
                </td>
                <%
                } else if (index % column != 0 && index % column != column - 1) {
                %>
                <td>

                    <input type="checkbox" name="<%=userImageItemView.getImageName()%>" groupOrderImageName="<%=userImageItemView.getName()%>"
                           id="<%=userImageItemView.getImage_id().toString()%>-image-checkbox"/>
                    <%--title="<%=image.getName()%>"><%=image.getName()%>--%>
                    <label for="<%=userImageItemView.getImage_id().toString()%>-image-checkbox"><%=userImageItemView.getImageName()%></label>
                </td>
                <%
                } else if (index % column == column - 1) {
                %>
                <td>


                    <input type="checkbox" name="<%=userImageItemView.getImageName()%>"  groupOrderImageName="<%=userImageItemView.getName()%>"
                           id="<%=userImageItemView.getImage_id().toString()%>-image-checkbox"/>
                    <%--title="<%=image.getName()%>"><%=image.getName()%>--%>
                    <label for="<%=userImageItemView.getImage_id().toString()%>-image-checkbox"><%=userImageItemView.getImageName()%></label>
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

<div id="dialog-confirm-delete-order-image"  style="display:none;direction: rtl;height: 100% !important;">
    <p><%=areUShureDeleteRow%></p>
</div>
<div id="dialog-confirm-save-order-image"  style="display:none;direction: rtl;height: 100% !important;">
    <p><%=areUShureAddImage%></p>
</div>


<script type="text/javascript">
<%--var list=<%=idClassRemoveList%>;--%>
<%--<% for (int i=0; i<idClassRemoveList.size(); i++) { %>--%>
<%--$("#image-order-coding-" + "<%= idClassRemoveList.get(i) %>").removeClass();--%>
<%--<% } %>--%>
function groupOrderImageSelect(e){

    <% for (UserImageItemView userImageItemView : userImageItemViewList)  {
    String groupName=userImageItemView.getName();%>
        if(e.name=='<%=groupName%>' && $("#"+"<%=userImageItemView.getImage_id()%>"+"-image-checkbox")[0].attributes["groupOrderImageName"].childNodes[0].data=="<%=userImageItemView.getName()%>"){
            $("#"+"<%=userImageItemView.getImage_id()%>"+"-image-checkbox").attr('checked',e.checked);
            $("#"+"<%=userImageItemView.getImage_id()%>"+"-image-checkbox").prop('checked',e.checked);
        }
    <%} %>

}
function saveOrderImage(newItemArray){
    var data = {};
    data.newImageCurrentOrder=newItemArray;
    if(newItemArray.length>0){
        $.ajax({
            url: '${pageContext.request.contextPath}'+'/clinic/patient/neurology/saveImage/',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            dataType: 'json',
            type: 'POST',
            success: function (data, success, xhr) {
                if(data.saveImage!=undefined){
                    var split = data.saveImage.split(';;;;');
                    if (split.length > 1) {
                        for (var i = 0; i < split.length - 1; i = i + 2) {
                            $("#dialog-image  tr:last td:last").after('<td><input type=\"checkbox\" name="' + split[i + 1] + '" id="' + split[i] + '-image-checkbox' + '" title="' + split[i + 1] + '">' + split[i + 1] + '</td>');
                            $('#tableImage').append('<tr id="' + split[i] + '-image-checkbox-rowImage' + '"></td><td contente="true">' + split[i+1] + '</td><td contente="true"><textarea rows="10"  id="'+split[i]+'-image'+'" class="image-description" style="overflow-y: auto;overflow-x:auto; width: 100%; width:100% !important;height:70px;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" onclick="deleteImageClick(this)" /></td></tr>' + '');
                            autoCompleteImageApply(split[i]+'-image');
                            var allImage = $("#dialog-image").find(":checkbox");
                            for (var w = 0; w < allImage.length; w++) {
                                if (allImage[w].id == split[i]+ '-image-checkbox') {
                                    allImage[w].checked = true;
                                }
                            }
                        }
                        initOrderImageSelect2(split[1],split[0]);
//                        initSelect2();
                    }
                }


            },
            error: function (e) {
//                alert('Error121212: ' + e.responseText);
            }
        });
    }
}

function autoCompleteImageApply(id){
//      var elem = $('#'+id);
    var elem = $("[id='"+ id+"']");
//    var imageName=elem.parent().parent().parent().find("td[contente=true]")[0].innerHTML;
    var imageName=$("#"+elem[0].id+'-checkbox-rowImage').find('td')[0].innerHTML;
    elem.textcomplete([{
        match: /(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
        search: function (term, callback) {
            Common.postJSON("${pageContext.request.contextPath}" +
                    "/clinic/patient/neurology/imageDescriptionAutoComplete/" + imageName, JSON.stringify({token:term}),
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

var selectOptionOrderImageArrayElement=[];
var initStateOrderImage=true;

<%
if(!(request.getAttribute("imageWithDescriptionForEdit") instanceof String)){
    List<DBObject> list = (List)request.getAttribute("imageWithDescriptionForEdit");
    if(list!=null){
        for(int i=0; i <list.size(); i++) {
            DBObject dbObject=list.get(i);
            String imageId=dbObject.get("imageId").toString().trim();
            String imageName=dbObject.get("imageName").toString().trim();
            String imageDescription=dbObject.get("imageDescription").toString().trim();
            if(imageDescription.length()==0){
               imageDescription=" ";
            }else {
              imageDescription=StringEscapeUtils.escapeEcmaScript(imageDescription);
            }
%>
var imageId = '<%=imageId%>';
var imageName = '<%=imageName%>';
var imageDescription = '<%=imageDescription%>';
$('#tableImage').append('<tr id="' + imageId + '-image-checkbox-rowImage' + '"></td><td contente="true">' + imageName + '</td><td contente="true"> <textarea rows="10"  id="'+imageId+'-image'+'" class="image-description" style="overflow-y: auto;overflow-x:auto; width: 100%; width:100% !important;height:70px;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" onclick="deleteImageClick(this)" /></td></tr>' + '');
autoCompleteImageApply(imageId+'-image');
$('#'+imageId+'-image').val(imageDescription);

selectOptionOrderImageArrayElement[selectOptionOrderImageArrayElement.length]=imageId;
var allImage = $("#dialog-image").find(":checkbox");
for (var w = 0; w < allImage.length; w++) {
    if (allImage[w].id == imageId+ '-image-checkbox') {
        allImage[w].checked = true;
    }
}
<%

           }
  }
  }
%>

    var imagepreload_data;
    var imageMultiSelectFD;
    var addNotShowOrderImage=[];
//    $(document).ready(function () {
    initOrderImageSelect2();
    function initOrderImageSelect2(deleteId,addId){
        var url=window.location.href;
        var isEditMode=false;
        if(url.indexOf("null")==-1){
            isEditMode=true;
        }
        var urlLoadImage="clinic/basicInfo/image/combo/loadOrderShowImage";
        if(isEditMode==true){
            urlLoadImage+='/'+'${visitId}';
        }
        $.getJSON("<c:url value='/' />" + urlLoadImage, function (data) {

            imagepreload_data = data;
//            imageMultiSelectFD=data;
//            imageMultiSelectFD=data;
            var preload_data2=[] ;

            if(deleteId!=undefined){
//                currentImagepreload_data.push({ComboID:addId,ComboCaption:deleteId})
                addNotShowOrderImage.push({ComboID:addId,ComboCaption:deleteId});

                $.each(addNotShowOrderImage, function () {

                    imagepreload_data.push({ComboID:this.ComboID, ComboCaption:this.ComboCaption });

                });
            }

            $.each(imagepreload_data, function () {

                preload_data2.push({id:this.ComboID, text:this.ComboCaption });

            });



            $('#p-imageMultiSelect').select2({
                multiple:true,
                query:function (query) {
                    var data = {results:[]};

                    $.each(imagepreload_data, function () {
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
                        return {id:term+'-newOrderMehrsysImage', text:term};
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
            deleteOrderImageOption(deleteId);
            selectOrderImageOption(addId);
            <!--$("#p-imageMultiSelect").select2('val', ${imageIds});-->

            if(initStateOrderImage==true){
                $("#p-imageMultiSelect").select2('val', selectOptionOrderImageArrayElement);
                initStateOrderImage=false;
            }

            $('#p-imageMultiSelect').on("select2-removed", function(e){

                if($("#"+ e.choice.id+"-image").val().trim().length>0){
                    $("#dialog-confirm-delete-order-image").data('e', e).dialog("open");
                }else{
                    if($('#' + e.choice.id + '-image-checkbox-rowImage').length>0){
                        $('#' + e.choice.id + '-image-checkbox-rowImage').remove();
                        var arrayCheckBox=$("#dialog-image").find(":checkbox:checked:not([isImageOrderGroup])");
                        for(var i=0;i<arrayCheckBox.length;i++){
                            if(arrayCheckBox[i].id== e.choice.id+"-image-checkbox"){
                                $("#"+e.choice.id+'-image-checkbox').attr('checked',false);
                                $("#"+e.choice.id+'-image-checkbox').prop('checked',false);
                            }
                        }
                    }                }
            });
            $('#p-imageMultiSelect').on("select2-selecting", function(e){
                var id=""+e.object.id;
                if(id.indexOf('-newOrderMehrsysImage')==-1){
                    addOrderImageToTableAndSelectCheckBox(e.object.id,e.object.text);
                }else{//should save on db
                    e.object.id=e.object.id.split('-newOrderMehrsysImage')[0];
                    var areUShureAddImage = "<%=areUShureAddImage%>";
                    var newItemArray=[];
                    newItemArray[0]=e.object.text;
                    newItemArray[1]=e.object.id;
                    $("#dialog-confirm-save-order-image").data('newItemArray',newItemArray).dialog('open');
                }

            });


        });

        $.getJSON("<c:url value='/' />" + "clinic/basicInfo/image/combo/loadAllImage", function (data) {
            imageMultiSelectFD=data;
        });
      }

        var cancelButtonImageOrderClick=false;
        $("#dialog-image").dialog({
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
                    popupImageOrderOkButton();
                    $(this).dialog("close");

                },
                "cancel":function () {
                    cancelButtonImageOrderClick=true;
                    $(this).dialog("close");
                }
            },
            close:function (event, ui ) {
                if(event.which!=undefined || cancelButtonImageOrderClick==true){
                    cancelEventImageOrder();
                    cancelButtonImageOrderClick=false;
                }
                $(this).dialog("close");
            },
            open:function (event, ui) {
                arrayCheckedBoxBeforeOpenedImageOrder=$("#dialog-image").find(":checkbox:checked:not([isImageOrderGroup])");
            }
        });

        $("#dialog-confirm-delete-order-image").dialog({
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
                        deleteOrderImageRow($(this).data('contents'));
                    }else if($(this).data('e')!=undefined){
                        var id=$(this).data('e').choice.id;
                        if($('#' + id + '-image-checkbox-rowImage').length>0){
                            $('#' + id + '-image-checkbox-rowImage').remove();
                            var arrayCheckBox=$("#dialog-image").find(":checkbox:checked:not([isImageOrderGroup])");
                            for(var i=0;i<arrayCheckBox.length;i++){
                                if(arrayCheckBox[i].id== id+"-image-checkbox"){
                                    $("#"+id+'-image-checkbox').attr('checked',false);
                                    $("#"+id+'-image-checkbox').prop('checked',false);
                                }
                            }
                        }
                    }

                    $(this).dialog("close");

                },
                "No":function () {
                    if($(this).data('e')!=undefined){
                        selectOrderImageOption($(this).data('e').choice.id);
                    }
                    $(this).dialog("close");
                }
            }
        });
        $("#dialog-confirm-save-order-image").dialog({
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
                    saveOrderImage(itemArray);
                    $(this).dialog("close");

                },
                "cancel":function () {
                    var newItemArray=$(this).data('newItemArray');

                    deleteOrderImageOption(newItemArray[1]);
                    $(this).dialog("close");
                }
            }
        });

        function addOrderImageToTableAndSelectCheckBox(imageId,imageText){
            if(imageId==imageText){
                return;
            }
            var imageOrderWithValueArray=$('#tableImage').parent().parent().find('textarea');
            var found=false;
            for(var i=0;i<imageOrderWithValueArray.length;i++){
                if(imageOrderWithValueArray[i].id== imageId+'-image'||imageOrderWithValueArray[i].id== imageText+'-image'){
                    found=true;
                    break;
                }
            }
            if(found==false){
                $('#tableImage').append('<tr id="' + imageId + '-image-checkbox-rowImage' + '"></td><td contente="true">' + imageText + '</td><td contente="true"><textarea rows="10"  id="'+imageId+'-image' +'" class="image-description" style="overflow-y: auto;overflow-x:auto; width: 100%; width:100% !important;height:70px;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" onclick="deleteImageClick(this)" /></td></tr>' + '');
                autoCompleteImageApply(imageId+'-image');

            }
            $("#"+imageId+'-image-checkbox').attr('checked',true);
            $("#"+imageId+'-image-checkbox').prop('checked',true);
        }

        function addImageClick() {

            $("#dialog-image").dialog("open");


        }

        jQuery('body')
                .bind(
                'click',
                function (e) {
                    if (
                            jQuery('#dialog-image').dialog('isOpen')
                                    && !jQuery(e.target).is('.ui-dialog, a')
                                    && !jQuery(e.target).closest('.ui-dialog').length
                                    && event.target.nodeName!="BUTTON"
                            ) {
                        popupImageOrderOkButton();
                        jQuery('#dialog-image').dialog('close');
                    }
                }
        );

        var arrayCheckedBoxBeforeOpenedImageOrder;
        function cancelEventImageOrder(){
            arrayCheckedBoxAfterCancel=$("#dialog-image").find(":checkbox:checked:not([isImageOrderGroup])");
            for(var i=0;i<arrayCheckedBoxAfterCancel.length;i++){
                $("#"+arrayCheckedBoxAfterCancel[i].id).attr('checked',false);
                $("#"+arrayCheckedBoxAfterCancel[i].id).prop('checked',false);
            }

            for(var j=0;j<arrayCheckedBoxBeforeOpenedImageOrder.length;j++){
                $("#"+arrayCheckedBoxBeforeOpenedImageOrder[j].id).attr('checked',true);
                $("#"+arrayCheckedBoxBeforeOpenedImageOrder[j].id).prop('checked',true);
            }

        }

        function popupImageOrderOkButton(){
            var imageOrderWithValueArray=$('#tableImage').parent().parent().find('textarea');
            var arrayCheckedImage = $("#dialog-image").find(":checkbox:checked:not([isImageOrderGroup])");
            var arrayAllImage = $("#dialog-image").find(":checkbox");
            for (var i = 0; i < arrayCheckedImage.length; i++) {
                var found=false;
                for(var j=0;j<imageOrderWithValueArray.length;j++){
                    if(arrayCheckedImage[i].id==imageOrderWithValueArray[j].id+'-checkbox'){
                        found=true;
                        break;
                    }
                }
                if(found==false){
                    $('#tableImage').append('<tr id="' + arrayCheckedImage[i].id + '-rowImage' + '"></td><td contente="true">' + arrayCheckedImage[i].name + '</td><td contente="true"><textarea rows="10"  id="'+arrayCheckedImage[i].id.split("-checkbox")[0] +'" class="image-description" style="overflow-y: auto;overflow-x:auto; width: 100%; width:100% !important;height:70px;   direction: ltr; text-align: left"  >&nbsp;</textarea></td><td><input type="button" value="delete" onclick="deleteImageClick(this)" /></td></tr>' + '');
                    autoCompleteImageApply(arrayCheckedImage[i].id.split("-checkbox")[0]);
                    selectOrderImageOption(arrayCheckedImage[i].id.split('-image-checkbox')[0]);
                }
            }

            for(var w=0;w<imageOrderWithValueArray.length;w++){
                var f=false;
                for(x=0;x<arrayCheckedImage.length;x++){
                    if(imageOrderWithValueArray[w].id+'-checkbox'==arrayCheckedImage[x].id){
                        f=true;
                        break;
                    }
                }
                if(f==false){
                    var foundInAllCustomizeImage=false;
                    for(var l=0;l<arrayAllImage.length;l++){
                        if(imageOrderWithValueArray[w].id+'-checkbox'==arrayAllImage[l].id){
                            foundInAllCustomizeImage=true;
                        }
                    }
                    if(foundInAllCustomizeImage==true){
                        $('#' + imageOrderWithValueArray[w].id + '-checkbox-rowImage').remove();
                        deleteOrderImageOption(imageOrderWithValueArray[w].id.split('-image')[0]);
                    }
                }
            }

        }

    function deleteImageClick(th) {
        var contents = $(th).parent().parent().find('td[contente=true]');
        if(contents[1].lastChild.children[1].value.trim().length>0){
            $("#dialog-confirm-delete-order-image").data('contents', contents).dialog("open");

        }else{
            deleteOrderImageRow(contents);
        }


    }

    function deleteOrderImageRow(contents){
        $('#' + contents[1].lastChild.children[1].id + '-checkbox-rowImage').remove();
        var arrayCheckedImage = $("#dialog-image").find(":checkbox:checked:not([isImageOrderGroup])");
        for (var i = 0; i < arrayCheckedImage.length; i++) {
            if (arrayCheckedImage[i].id == contents[1].lastChild.children[1].id+'-checkbox') {
                arrayCheckedImage[i].checked = false;
            }
        }
        var id=contents[1].lastChild.children[1].id.split('-image')[0];
        deleteOrderImageOption(id);
    }

    function deleteOrderImageOption(id){
        var imageIdSelect2Array=$("#p-imageMultiSelect").select2('val');
        var newImageIdSelect2Array=[];
        var index=0;
        for(var j=0;j<imageIdSelect2Array.length;j++){
            if(id!=imageIdSelect2Array[j]){
                newImageIdSelect2Array[index]=imageIdSelect2Array[j];
                index++;
            }
        }
        $("#p-imageMultiSelect").select2('val',newImageIdSelect2Array);
    }

    function  selectOrderImageOption(id){
        var imageIdSelect2Array=$("#p-imageMultiSelect").select2('val');
        imageIdSelect2Array[imageIdSelect2Array.length]=id;
        $("#p-imageMultiSelect").select2('val',imageIdSelect2Array);

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


