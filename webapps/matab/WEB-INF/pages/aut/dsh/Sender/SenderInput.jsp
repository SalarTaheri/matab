<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<base:pageHeader/>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="attachFileListCommaSep" name="attachFileListCommaSep" >
		<div class="uk-grid uk-grid-preserve">
			<%--<base:testBox styleClass="small" name="senderUser_id" key="com.artonis.aut.dsh.sender.senderUser_id"/>--%>
            <base:multiSelctionCombo name="receiverUserIdListCommaSep" key="aut.dsh.sender.userList" comboLoaderUrl="/combo/loadAllUser"/>
            <%--<base:mDatePicker styleClass="small" name="date" key="aut.dsh.sender.date"/>--%>

            <%--<base:testBox styleClass="small" name="letter_id" key="com.artonis.aut.dsh.sender.letter_id"/>--%>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:testBox name="subject" key="aut.dsh.sender.subject"/>
        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:richTestBox name="letter" key="aut.dsh.sender.letter"/>
        </div>
        <div class="uk-grid uk-grid-preserve">

            <base:fileUploader fileRemoveUrl="file/fileRemove" name="files" key="hrm.basicInfo.formule.name" fileSaveUrl="file/fileUpload"
                               uploadedFileAddress="attachFileListCommaSep"/>
        </div>
	</form>
</div>
<script type="text/javascript">
    function customSerialize(tmp){
//        tmp['senderUserIdListCommaSep']=$("#senderUserIdListCommaSep").val();
        var array=$("#receiverUserIdListCommaSep").val();
        var sep='';
        for(var i=0;i<array.length;i++){
           sep+=array[i]+',';
        }
        tmp['receiverUserIdListCommaSep']=sep.substring(0,sep.length-1);

        return tmp;
    }

    function bindToEntityById_after_letter(){
        var editor = $("#letter").data("kendoEditor");
        editor.paste($("#letter").val());
    }

</script>
