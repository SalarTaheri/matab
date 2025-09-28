
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.department.code'  field="code" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.department.name'  field="name" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.department.type'  field="type" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.department.hasPacsConnect'  field="hasPacsConnect" width="50px"  isCombo="true"/>

	<base:my-grid-function text="com.artonis.clinic.basicInfo.department.sendRecordToAppServer" functionClick="grid_onSendRecordToAppServer" name="sendRecordToAppServer" />
    
    <base:my-grid-schema-field name="code" type="string"/>
    <base:my-grid-schema-field name="name" type="string"/>
</base:my-grid>
<base:footer/>
<script>
function grid_onSendRecordToAppServer(e){
    var data = this.dataItem($(e.target).closest("tr"));
    jQuery.ajax ({
	    url:  "${pageContext.request.contextPath}"+"/clinic/basicInfo/department/sendRecordToAppServer/" + data.id,
	    type: "GET",
	    dataType: "json",
	    contentType: "application/json; charset=utf-8",
	    success: function(result){
	        if(result.state == "success"){
        		alertify.success(result.message);
	        }else if(result.errorMsg == "error"){
	        		alertify.error(result.errorMsg);
	        }
	    },
        error:function(result){
            if(result.status==401){
                window.location.href="";
            }
        }
  });
    
}
</script>