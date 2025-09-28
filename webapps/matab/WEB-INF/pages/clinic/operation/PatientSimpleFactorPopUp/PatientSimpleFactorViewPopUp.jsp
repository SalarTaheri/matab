<%@ page import="com.artonis.clinic.core.service.util.ClinicCoreServiceUtil" %>
<%@ page import="com.artonis.clinic.core.model.Patientr" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<link rel="stylesheet" type="text/css" media="all" href="<c:url value='/resources/lightBox/css/styles.css'/>">
<link rel="stylesheet" type="text/css" media="all" href="<c:url value='/resources/lightBox/css/jquery.lightbox-0.5.css'/>">
<script type="text/javascript" src="<c:url value='/resources/lightBox/js/jquery.lightbox-0.5.min.js'/>"></script>
<%
	String attachFileListBarSep = "";
	Integer patientId = (Integer) request.getAttribute("id");
	if(patientId!=null && patientId.longValue()>0){
		Patientr patientr = ClinicCoreServiceUtil.loadPatient(patientId.longValue());
		attachFileListBarSep = patientr.getAttachFileListBarSep();

	}
%>

<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 4px; ">
    <form class="uk-form" id="PatientSimpleFactor">
		<input type="hidden" id="attachFileListBarSepInPopup" name="attachFileListBarSepInPopup" >
		<div class="uk-grid uk-grid-preserve">
			<base:textArea name="addressInPopup" key="clinic.patient.address" height="60" styledivLabel="float: right;padding-left: 2%;"/>
			<%--<div class="left-align ">--%>
				<%--<base:simpleLabel name="address" key="clinic.patient.address"/>--%>
			<%--</div>--%>
			<%--<div class="patientInfoField">--%>
				<%--<textarea  id="address" class="text ui-widget-content ui-corner-all"  cols="40" rows="3" placeholder="" ></textarea>--%>
			<%--</div>--%>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:fileUploader2 fileRemoveUrl="file/fileRemove" name="files" key="com.artonis.clinic.patientr.patientFilePicture" fileSaveUrl="file/fileUpload"
								uploadedFileAddress="attachFileListBarSepInPopup" multiple="true" valueFieldName="uniqueLongForFileUpload" urlLoadFile="fileLoad"/>
			<div id="thumbnails" style="padding-right: 110px; padding-top: 10px;">
				<ul class="clearfix" id="clearfixUl">
				</ul>
			</div>
		</div>
	</form>	 
</div>


<base:footer/>

<script type="text/javascript">

	/*function addImageToThumbnails(fileName){
		if(fileName=="")
			return;
		var imgElement = document.createElement("img");
		imgElement.src="/prjResource/patientFile/"+fileName;
		imgElement.className="thumbnailsImg";
		var aElement = document.createElement("a");
		aElement.href="/prjResource/patientFile/"+fileName;
		aElement.appendChild(imgElement);
		var liElement = document.createElement("li");
		liElement.appendChild(aElement);
		$("#clearfixUl")[0].appendChild(liElement);
		$('#thumbnails a').lightBox();
	}*/

	$(function() {
		$('#thumbnails a').lightBox();
	});
	$(document).ready(function (){
		/*var attachFileListBarSep = '<%= attachFileListBarSep%>';
		var fileNames = attachFileListBarSep.substring(0, attachFileListBarSep.length - 1).split("|");
		for(i=0; i<fileNames.length ;i++){
			addImageToThumbnails(fileNames[i]);
		}
*/
	});

</script>

<style type="text/css" >
	.thumbnailsImg {
		height: 200px;
	}
</style>

