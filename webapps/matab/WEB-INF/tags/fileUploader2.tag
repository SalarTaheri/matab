<%@tag import="java.util.ArrayList"%>
<%@tag import="java.util.ResourceBundle" %>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="key" required="true" rtexprvalue="true" %>
<%@ attribute name="fileSaveUrl" required="true" rtexprvalue="true" %>
<%@ attribute name="fileRemoveUrl" required="true" rtexprvalue="true" %>
<%@ attribute name="uploadedFileAddress" required="true" rtexprvalue="true" %>
<%@ attribute name="multiple" required="false" rtexprvalue="true" %>
<%@ attribute name="valueFieldName" required="false" rtexprvalue="true" %>
<%@ attribute name="urlLoadFile" required="false" rtexprvalue="true" %>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>

<%
    boolean multipleValue;
    if (multiple == null)
        multipleValue = true;
    else
        multipleValue = Boolean.valueOf(multiple);

    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String enterCode = resource.getString("action.alert.enterPersonelCode");
    
    Object initialFiles = request.getAttribute("initialFiles");
    if(initialFiles == null){
   		initialFiles = new ArrayList();
    }
%>

<jsp:doBody/>

<input type="hidden" id="${name}_uploaderChangeState" name="${name}_uploaderChangeState">

<div class="uk-width-1-10 left-align">
    <span class="infoHead"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></span>
</div>

<div class="uk-width-4-10 k-rtl">
    <kendo:upload  name="${name}" files="<%=initialFiles%>" success="onSuccess" remove="onRemove" upload="onUpload" multiple="true" error="onError">
        <kendo:upload-async autoUpload="true" saveUrl="${fileSaveUrl}" removeUrl="${fileRemoveUrl}"/>
        <kendo:upload-localization select='<%=ResourceBoundleHolder.resourceBundle.getString("action.uploader.select")%>'
                                   remove='<%=ResourceBoundleHolder.resourceBundle.getString("action.uploader.remove")%>'
                                   cancel='<%=ResourceBoundleHolder.resourceBundle.getString("action.uploader.cancel")%>'/>
    </kendo:upload>

    <div id="file-preview-${name}">
    </div>
</div>

<script>
    var imageCounter = 0;
    var tag_ui = document.createElement("ui");
    var tag_li = document.createElement("li");
    tag_li.id = "li-images";
    tag_ui.appendChild(tag_li);

    $(document).ready(function(){
    	$('.k-dropzone').append('<div class="inside-k-dropzone"><%=ResourceBoundleHolder.resourceBundle.getString("action.uploader.dragAndDropHere")%></div>');
    });
    
    function fileuploadEdit(){
        var idValue=$("#id").val();
        if(idValue.length>0){
            $.getJSON("${urlLoadFile}/"+idValue, function (data) {
                $.each(data, function(name, val){
                    $.each(val, function (filename, url) {
                        if (imageCounter == 0) {
                            $("#file-preview-${name}").append(tag_ui);
                        }

                        var imgTag = document.createElement("img");
                        imgTag.id = "showImage-" + filename;
                        imgTag.style.width = "100px";
                        imgTag.style.height = "75px";
                        imgTag.style.paddingRight = "5px";

                        var aTag = document.createElement("a");
                        aTag.className = "fancybox";
                        aTag.rel = "gallery1";
                        aTag.href = url;
                        aTag.appendChild(imgTag);

                        $("#li-images").append(imgTag);

                        $("#showImage-" + filename).attr('src', url);
                    });
                });
            });
        }
        $('.k-upload-status.k-upload-status-total').hide();
    }
    
    function onSuccess(e) {
        if (e.operation == "upload") {
            if(typeof(callback_successUploadFile_${name})=="function"){
                callback_successUploadFile_${name}(e);
                return;
            }
            var fileName=e.files[0].rawFile.name.split('.')[0];
            var fileReader = new FileReader();
            fileReader.onload = function (event) {
                imageCounter++;
                var mapImage = event.target.result;

                if (imageCounter == 1) {
                    $("#file-preview-${name}").append(tag_ui);
                }

                var imgTag = document.createElement("img");
                imgTag.id = "showImage-" + fileName;
                imgTag.style.width = "100px";
                imgTag.style.height = "75px";
                imgTag.style.paddingRight = "5px";

                var aTag = document.createElement("a");
                aTag.className = "fancybox";
                aTag.rel = "gallery1";
                aTag.href = mapImage;
                aTag.appendChild(imgTag);

                $("#li-images").append(imgTag);

                $("#showImage-" + fileName).attr('src', mapImage);

            }
            fileReader.readAsDataURL(e.files[0].rawFile);
            document.getElementById("${uploadedFileAddress}").value += e.response.savedFile + "|";
        }else if(e.operation == "remove"){
            var fileAddresses = document.getElementById("${uploadedFileAddress}").value;
            var filesNames = fileAddresses.split('|');
            var newFileNames = '';
            for (var i = 0; i < filesNames.length; i++) {
                fileName = filesNames[i];
                if(fileName.length==0){
                    continue;
                }
                var filenameWithoutPostfix = fileName.split('.')[0];
                var fileNameRemoving = e.files[0].name.split('.')[0];
                $("#showImage-"+fileNameRemoving).remove();
                if(fileName.indexOf(e.files[0].name)==-1){
                    newFileNames += fileName+"|";
                }
                if(typeof(callback_successRemoveFile_${name})=="function"){
                    callback_successRemoveFile_${name}(fileNameRemoving);
                }
            }
            document.getElementById("${uploadedFileAddress}").value = newFileNames;
        }
        if(typeof(callback_onSuccess_${name})=="function"){
        	callback_onSuccess_${name}(e);
        }
        $('.k-upload-status.k-upload-status-total').hide();
    }
    
    function onRemove(e) {
        var removeUrl = "${fileRemoveUrl}";
        var value_ = $("#${valueFieldName}").val();
        this.options.async.removeUrl = removeUrl + "/" + value_;
        $('.k-upload-status.k-upload-status-total').hide();
        $('#${name}_uploaderChangeState').val('changed');
    }
    
    function onUpload(e) {
        var temp = "${valueFieldName}";
        var valueFieldName_ = "${valueFieldName}";
        var saveUrl_ = "${fileSaveUrl}";
        if (temp != null && temp != "") {
            var value_ = $("#" + valueFieldName_).val();
            if (value_ != null && value_ != "") {
            	var idVal = "${id}";
            	if(idVal == null || idVal == ""){
            		idVal = "-1";
            	}
                this.options.async.saveUrl = saveUrl_ + "/" + value_ + "/" + idVal + "/" + imageCounter + "?disableCharacterFilter=true";
            }
        }
        $('.k-upload-status.k-upload-status-total').hide();
        $('#${name}_uploaderChangeState').val('changed');
    }

    function onError(e){
        alertify.error(e.XMLHttpRequest.responseText);
        $('.k-upload-status.k-upload-status-total').hide();
    }
    
    function reset_${name}(){
    	$(".k-upload-files").remove();
    	$(".k-upload-status").remove();
    	$(".k-upload.k-header").addClass("k-upload-empty");
    	$(".k-upload-button").removeClass("k-state-focused");
    	$('#li-images').html('');
    	$('#${name}_uploaderChangeState').val('');
    }
</script>

<style>
.k-dropzone{
    height: 100px;
    border-style: dashed;
    border-width: medium;
    border-color: rgb(235, 235, 235);
}

.k-filename{
	min-width: 200px;
	max-width: 250px;
}

.inside-k-dropzone{
	margin-top: 10px;
	margin-right: 25%;
	color: rgb(243, 243, 243);
}
</style>