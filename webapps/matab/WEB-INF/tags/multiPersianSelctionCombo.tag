
<%@tag import="java.util.ResourceBundle"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/resources/js/select2-3.4.5/select2.css' />" type="text/css"></link>
<script type="text/javascript" src="<c:url value='/resources/js/select2-3.4.5/select2.js' />"></script>

<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="value" required="false" rtexprvalue="true"%>
<%@ attribute name="key" required="true" rtexprvalue="true"%>
<%@ attribute name="ignore" required="false" rtexprvalue="true"%>
<%@ attribute name="comboLoaderUrl" required="true" rtexprvalue="true"%>
<%@ attribute name="isListConstant" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="styleClass" required="false" rtexprvalue="true"%>
<%
	ignore=(ignore==null ||ignore.equals(""))?"false":"true";
	
	if(styleClass==null ||styleClass.length()==0||styleClass.equals("normal"))
		styleClass="uk-width-4-10";
	else if(styleClass.equals("small"))
		styleClass="uk-width-2-10";
	else if(styleClass.equals("larg"))
		styleClass="uk-width-6-10";
%>
<jsp:doBody />
	<div class="uk-width-1-10 left-align">
		<label for="${name}_Comb"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></label>
	</div>
	<div class="<%= styleClass%> k-rtl" >
		<select id="${name}" id="${name}" class="uk-width-1-1" multiple="multiple">
		</select>
	</div>

<script>
$(document).ready(function() { $("#${name}").select2({
    allowClear: true
	});  
});

$(document).ready(function() {
	$.getJSON(getBaseUrl() + "${comboLoaderUrl}" , function(data) {
		for ( var i = 0; i < data.length; i++) {
			$("#${name}").append(
					"<option style='direction:rtl' value='" + data[i].ComboID + "' >" + data[i].ComboCaption + "</option>")
		}
		 $(".select2-choices").css('direction','initial');
		 $(".select2-input").css('direction','rtl');
		 
	});
});

</script>