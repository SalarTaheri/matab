<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@ page import="java.util.ResourceBundle" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
    request.setAttribute("basePath", basePath);
    String menuSysCode = String.valueOf(request.getAttribute("menuSystemCode"));
%>

<input name="loadedId" type="hidden" id="loadedId" />

<div class="body-header">
    <ul class="uk-breadcrumb uk-h3" id="breadcrumb" style="margin: 10px;">
        <li id="breadcrumb-main-section"><span><%=ResourceBoundleHolder.resourceBundle.getString("clinic.basicInfo.penBackground.title")%></span></li>
    </ul>
    <div align="right">
        <base:button key="global.crud.save" id="savePage" stylediv="text-align: -webkit-auto;padding-right: 10px;padding-bottom: 10px;"/>
    </div>
</div>

<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
        <div class="p-q-radio uk-form-controls uk-grid uk-grid-preserve" >
            <input type="hidden" id="active" name="active" >
            <div class="uk-width-1-10 left-align">
                <label class="p-q-label uk-form-label" >
                    <%=ResourceBoundleHolder.resourceBundle.getString("clinic.basicInfo.penBackground.type")%>
                </label>
                :
            </div>
            <div class="uk-width-1-10" style="width: 15%; padding-right: 50px;">
                <label class="p-q-label uk-form-label" >
                    <%=ResourceBoundleHolder.resourceBundle.getString("clinic.basicInfo.penBackground.type.imageBackground")%>
                    <input type="radio" class="p-q-radio" name="backgroundTypeOption" value="1" onclick="handleBackgroundTypeClick(this)" />
                </label>
            </div>
            <div class="uk-width-1-10" style="">
                <label class="p-q-label uk-form-label" >
                    <%=ResourceBoundleHolder.resourceBundle.getString("clinic.basicInfo.penBackground.type.whiteBackground")%>
                    <input type="radio" class="p-q-radio" name="backgroundTypeOption" value="0" onclick="handleBackgroundTypeClick(this)" />
                </label>
            </div>
        </div>

        <div id="imageSelectionDiv" style="margin-top: 20px;">
            <table width="100%">
                <tr>
                    <td width="60%">
                        <div class="uk-grid uk-grid-preserve">
                            <div class="uk-width-1-10 left-align" style="width: 500px; text-align: right;">
                                <span class="infoHead"><%=ResourceBoundleHolder.resourceBundle.getString("clinic.basicInfo.penBackground.selectImage")%></span>
                            </div>
                        </div>
                        <div class="uk-grid uk-grid-preserve">
                            <input type="file" id="files">
                        </div>
                    </td>
                    <td width="40%">
                        <img alt="No Pic" src="" id="showImage" width="400px" style="border: solid black thin" title="Current Background">
                    </td>
                </tr>
            </table>
        </div>
    </form>
</div>

<script type="application/javascript">
    $(document).ready(function(){
        if (${active}) {
            $("#active").val(1);
            $('#showImage').attr('src', '${background}');
        }else {
            $("#active").val(0);
        }
        checkImageUploaderVisibility();
        //
        $("#files").kendoUpload({
            async: {
                saveUrl: "save",
                removeUrl: "remove",
                autoUpload: false
            },
            localization: {
                select: "<%=ResourceBoundleHolder.resourceBundle.getString("action.uploader.select")%>",
                remove: "<%=ResourceBoundleHolder.resourceBundle.getString("action.uploader.remove")%>",
                cancel: "<%=ResourceBoundleHolder.resourceBundle.getString("action.uploader.cancel")%>"
            },
            multiple: false,
            select: function(e) {
                var fileInfo = e.files[0];
                var wrapper = this.wrapper;
                setTimeout(function(){
                    addPreview(fileInfo, wrapper);
                });
            }
        });
    });

    function addPreview(file, wrapper) {
        var raw = file.rawFile;
        var reader  = new FileReader();
        if (raw) {
            reader.onloadend = function () {
                var preview = $("#showImage").attr("src", this.result);
                wrapper.find(".k-file[data-uid='" + file.uid + "'] .k-file-extension-wrapper").replaceWith(preview);
            };
            reader.readAsDataURL(raw);
        }
    }

    function handleBackgroundTypeClick(myRadio) {
        $("#active").val(myRadio.value);
        checkImageUploaderVisibility();
    }

    function checkImageUploaderVisibility() {
        if ($("#active").val() == 1) {
            $("#imageSelectionDiv").show();
            document.getElementsByName("backgroundTypeOption")[0].checked = true;
        }else{
            $("#imageSelectionDiv").hide();
            document.getElementsByName("backgroundTypeOption")[1].checked = true;
        }
    }

    $("#savePage").click(function(){
        if ($("#active").val() == 1 && $('#showImage').attr('src') == "") {
            alertify.error("Please select a picture");
            return;
        }
        var tmp = {};
        if ($("#active").val() == 1) {
            tmp.active = true;
        } else {
            tmp.active = false;
        }
        tmp.background = $('#showImage').attr('src');
        jQuery.ajax({
            url:getBaseUrl() + "save",
            headers: {
                'disableCharacterFilter': 'true'
            },
            type:"POST",
            data:JSON.stringify(tmp),
            dataType:"json",
            contentType:"application/json; charset=utf-8",
            success:function (result) {
                if (result.state == "error") {
                }
                if (result.state == "success") {
                    alertify.success(result.message);
                }
            },
            error:function(result){
                console.log(result);
            }
        });
    });

</script>

<style>
    .k-upload{
        width: 50%;
        padding-right: 20px;
    }
    .k-progress{
        display: none;
    }
    .k-upload-selected{
        display: none;
    }
</style>