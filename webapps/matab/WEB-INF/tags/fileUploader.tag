<%@tag import="java.util.ResourceBundle"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="key" required="true" rtexprvalue="true"%>
<%@ attribute name="fileSaveUrl" required="true" rtexprvalue="true"%>
<%@ attribute name="fileRemoveUrl" required="true" rtexprvalue="true"%>
<%@ attribute name="uploadedFileAddress" required="true" rtexprvalue="true"%>
<%@ attribute name="multiple" required="false" rtexprvalue="true"%>
<%@ attribute name="valueFieldName" required="false" rtexprvalue="true"%>

<%
	boolean multipleValue;
	if (multiple == null)
		multipleValue = true;
	else
		multipleValue = Boolean.valueOf(multiple);
	
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String enterCode = resource.getString("action.alert.enterPersonelCode");
%>
<jsp:doBody />
			
          <div class="uk-width-1-10 left-align">
                <span class="infoHead"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></span>
          </div>
          <div class="uk-width-4-10 k-rtl" >
                 <input name="${name}" id="${name}" type="file" />
          </div>

<script>
                $(document).ready(function() {
                var tmp = {};
                    $("#${name}").kendoUpload({
                        async: {
                            saveUrl: "${fileSaveUrl}",
                            removeUrl: "${fileRemoveUrl}",
                            autoUpload: true
                        },
        				localization: {
            				select: "<%=ResourceBoundleHolder.resourceBundle.getString("action.uploader.select")%>",
            				remove: "<%=ResourceBoundleHolder.resourceBundle.getString("action.uploader.remove")%>",
            				cancel: "<%=ResourceBoundleHolder.resourceBundle.getString("action.uploader.cancel")%>"
        				},
				    success: onSuccess,
                    remove:onRemove,
		            upload: onUpload,
                    multiple: <%=multipleValue%>
                    });
                });
                function onSuccess(e) {
                    if (e.operation == "upload") {
                        console.log(e);
                        console.log(document.getElementById("${uploadedFileAddress}").value);
                        document.getElementById("${uploadedFileAddress}").value += e.response.savedFile + "|";
                        console.log(document.getElementById("${uploadedFileAddress}").value);
                    }
                }
                function onRemove(e){
                    console.log(e);
                    var fileAddresses=document.getElementById("${uploadedFileAddress}").value;
                    var filesNames = fileAddresses.split('|');
                    var newFileNames='';
                    for(var i=0;i<filesNames.length;i++){
                        fileName=filesNames[i];
                        var filenameWithoutPostfix=fileName.split('.')[0];
                        var fileNameRemoving=e.files[0].name.split('.')[0];
//                        if(fileName.substring(0,e.files[0].name.length)==e.files[0].name){
                        if(filenameWithoutPostfix.substring(0,fileNameRemoving.length)==fileNameRemoving){
                            e.files[0].name=fileName;
                        }else{
                            newFileNames+=fileName;
                        }

                    }
                    document.getElementById("${uploadedFileAddress}").value =newFileNames;


                }
               function onUpload(e){
               		var temp = "${valueFieldName}";
               		var valueFieldName_ = "${valueFieldName}";
               		var saveUrl_ = "${fileSaveUrl}";
               		if (temp != null && temp != ""){
						var value_ = $("#"+valueFieldName_).val();
	               		if (value_ != null && value_ != ""){
							this.options.async.saveUrl = saveUrl_ + "/" + value_;
			                   var fileReader = new FileReader();
			                   fileReader.onload = function (event) {
			                       console.log(event);
			                       var mapImage = event.target.result;
			                       $("#showImage").attr('src', mapImage);
			                   }
			                   fileReader.readAsDataURL(e.files[0].rawFile);
	               		}else{
	               			var enterCode = "<%=enterCode%>";
	               			alertify.alert(enterCode);
	               			this.options.async.saveUrl = saveUrl_ + "/-2";
	               		}
               		}
               }
</script>
