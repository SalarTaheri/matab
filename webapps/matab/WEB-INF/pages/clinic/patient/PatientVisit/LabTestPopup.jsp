<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<form class="uk-form" id="mainForm">
<input type="hidden" id="livesin" name="livesin"/> 
<table>
	<tr>
	<td>   
	</td>
		<td>
			<div class="uk-width-3-10 left-align">
				<label for="${name}"><%=ResourceBoundleHolder.resourceBundle.getString("clinic.visit.labTestNames")%></label>			
			</div>	
		</td>			
	</tr>
	<tr>
	<td>   
	</td>
		<td>
       		<base:checkBoxTree outputResultTag="livesin" name="aaa"  key="clinic.visit.labTestNames" dataLoaderController="tree/loadMedicalTest" loadOnDemand="false"></base:checkBoxTree>
       	</td>
	
	</tr>
	
	<tr>
	<td>   
	</td>
		<td width="100%">
			<div class="uk-width-6-10 left-align">
				<button onclick="selectMe()" class="uk-button uk-width-6-10 uk-button-success " id="closeform"
					type="button">
					<%=ResourceBoundleHolder.resourceBundle.getString("clinic.visit.labTestForSaveInVisit")%>
				</button>
			</div>
		</td>
	</tr>
</table>

</form>
<input type="hidden" id="cafeId"  />
<script type="text/javascript">
		function closeMe(){
			window.close();
		}
		function msg(x){
			document.forms[0].selectedId.value=x;
		}

		function selectMe(){
		    //return  livesin.value;
		    //window.alert( $("#resultdialog").data("foo"));
		    window.opener.document.getElementById("lebTestForSave").value=livesin.value;
		  console.log("dialog");
		   
		   $("#dialog").dialog('close');
		   $("#dialog").dialog('close');
		   //$("#resultdialog").modal.close();
		   // window.parent.$("#lebTestForSave").val=livesin.value;
			//opener.document.getElementById("lebTestForSave").value=livesin.value;
			//$.modal.close();
			// window.parent.document.getElementById("dialog").close();
			//$("div[role='dialog']").dialog("close");
			window.close();
		}
</script>
