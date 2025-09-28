<%@tag import="java.util.ResourceBundle"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@tag import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="key" required="true" rtexprvalue="true"%>
<%@ attribute name="disabled" required="false" rtexprvalue="true"%>
<%@ attribute name="direction" required="false" rtexprvalue="true"%>
<%@ attribute name="styleClass" required="false" rtexprvalue="true"%>
<%@ attribute name="isMandatory" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="isPassword" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="dataIgnore" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="onChangeFunction" required="false" rtexprvalue="false"%>
<%@ attribute name="styledivLabel" required="false" rtexprvalue="true" %>

<%
	String menuSysCode =String.valueOf(request.getAttribute("menuSystemCode"));
	String  divStyle="";
    if(direction==null || direction.equals(""))
        direction="direction:rtl";
    else
        direction="direction:ltr";
    if(styleClass==null ||styleClass.length()==0||styleClass.equals("normal"))
        styleClass="uk-width-4-10";
    else if(styleClass.equals("small"))
        styleClass="uk-width-2-10";
    else if(styleClass.equals("larg"))
        styleClass="uk-width-6-10";
    else if(styleClass.toLowerCase().equals("verysmall"))
        styleClass="uk-width-1-10";
    else if(styleClass.equals("midsmall")){
         styleClass="uk-width-1-10";
        divStyle="style='width: 15%'";
    }
    if(isMandatory==null){
        isMandatory=false;
    }
    if(isPassword==null){
        isPassword=false;
    }
     if(dataIgnore==null){
    	dataIgnore=false;	
    }
     
     String onChangeFunctionName = "";
     if(onChangeFunction!=null && onChangeFunction.length()>0){
    	 onChangeFunctionName = "," + onChangeFunction;
     }

%>
<jsp:doBody />
<% if(GlobalVariable.getButtonContainer(menuSysCode,name)){ %>
	<div class="uk-width-1-10 left-align" style="<%= styledivLabel%>">
		<input type="hidden" id="${name}" name="${name}"  data-ignore="${dataIgnore}" />
	    <label for="${name}"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></label>
	</div>
	<%if(!isPassword){%>
	<div <%=divStyle %>class="<%= styleClass%>">
	    <%if(Boolean.valueOf(disabled)){%>
	    <input type="text" id="${name}_txt" name="${name}_txt" class="uk-width-1-1" disabled data-ignore="true" onkeypress="return onlyNos(event,this);" onkeyup="addCommas(event,this)<%=onChangeFunctionName%>" data-numericEx="true">
	    <%} else { %>
	    <%if(!isMandatory){%>
	    <input type="text" id="${name}_txt" name="${name}_txt" class="uk-width-1-1" style="${direction}" data-ignore="true" onkeypress="return onlyNos(event,this);" onkeyup="addCommas(event,this)<%=onChangeFunctionName%>" data-numericEx="true">
	    <%}else {%>
	    <input type="text" id="${name}_txt" name="${name}_txt" class="uk-width-1-1" style="background: rgb(206, 215, 235);${direction}" data-ignore="true" onkeypress="return onlyNos(event,this);" onkeyup="addCommas(event,this)<%=onChangeFunctionName%>" data-numericEx="true">
	    <%} %>
	    <%} %>
	</div>
	<%}else {%>
	<div class="<%= styleClass%>">
	    <%if(Boolean.valueOf(disabled)){%>
	    	<input type="password" id="${name}_txt" name="${name}_txt" class="uk-width-1-1" disabled data-ignore="true" onkeypress="return onlyNos(event,this);" onkeyup="addCommas(event,this)<%=onChangeFunctionName%>" data-numericEx="true">
	    <%} else { %>
		    <%if(!isMandatory){%>
		    	<input type="password" id="${name}_txt" name="${name}_txt" class="uk-width-1-1" style="${direction}" data-ignore="true" onkeypress="return onlyNos(event,this);" onkeyup="addCommas(event,this)<%=onChangeFunctionName%>" data-numericEx="true">
		    <%}else {%>
		    	<input type="password" id="${name}_txt" name="${name}_txt" class="uk-width-1-1" style="background: rgb(206, 215, 235);${direction}" data-ignore="true" onkeypress="return onlyNos(event,this);" onkeyup="addCommas(event,this)<%=onChangeFunctionName%>" data-numericEx="true">
		    <%} %>
	    <%} %>
	</div>
	<%} %>
	<script>
	
	function onlyNos(e, t) {
				
	            try {
	                if (window.event) {
	                    var charCode = window.event.keyCode;
	                }
	                else if (e) {
	                    var charCode = e.which;
	                }
	                else { return true; }
	                if (charCode!=46 && charCode > 31 && (charCode < 48 || charCode > 57 )) {
	                    return false;
	                }
	                return true;
	            }
	            catch (err) {
	                alert(err.Description);
	            }
	        }
	
	function addCommas(event,data){
		if(!(event.keyCode==110 || event.keyCode==190 || event.keyCode==8 || (event.keyCode>=46 && event.keyCode<=57)||(event.keyCode>=96 && event.keyCode<=105))){
			return;
		}
		var nStr = data.value.replace(/,/g, '');
		document.getElementById(data.id.replace('_txt','')).value = nStr;
		nStr += '';
		x = nStr.split('.');
		x1 = x[0];
		x2 = x.length > 1 ? '.' + x[1] : '';
		var rgx = /(\d+)(\d{3})/;
		while (rgx.test(x1)) {
			x1 = x1.replace(rgx, '$1' + ',' + '$2');
		}
		document.getElementById(data.id).value = x1 + x2; 
	}
	</script>
<%}%>