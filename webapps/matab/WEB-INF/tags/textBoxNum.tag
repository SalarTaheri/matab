
<%@tag import="java.util.ResourceBundle"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>

<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="key" required="true" rtexprvalue="true"%>
<%@ attribute name="disabled" required="false" rtexprvalue="true"%>
<%@ attribute name="direction" required="false" rtexprvalue="true"%>
<%@ attribute name="styleClass" required="false" rtexprvalue="true"%>
<%@ attribute name="isMandatory" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="isPassword" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="dataIgnore" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="styledivLabel" required="false" rtexprvalue="true" %>
<%
	String  divStyle="";
    if(direction==null || direction.equals(""))
        direction="direction:rtl";
    else
        direction="direction:ltr";
    if(styleClass==null ||styleClass.length()==0||styleClass.equals("normal"))
        styleClass="uk-width-4-10";
    else if(styleClass.equals("small"))
        styleClass="uk-width-2-10";
    else if(styleClass.equals("midsmall")){
         styleClass="uk-width-1-10";
        divStyle="style='width: 15%'";
    }else if(styleClass.equals("larg"))
        styleClass="uk-width-6-10";
    else if(styleClass.toLowerCase().equals("verysmall"))
        styleClass="uk-width-1-10";

    if(isMandatory==null){
        isMandatory=false;
    }
    if(isPassword==null){
        isPassword=false;
    }
    if(dataIgnore==null){
    	dataIgnore=false;	
    }
%>
<jsp:doBody />
<div class="uk-width-1-10 left-align" style="<%= styledivLabel%>">
    <label id="${name}_lbl_txt" for="${name}"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></label>
</div>
<%if(!isPassword){%>
<div <%=divStyle %> class="<%= styleClass%>">
    <%if(Boolean.valueOf(disabled)){%>
    <input type="text" id="${name}" name="${name}" class="uk-width-1-1" disabled data-ignore="${dataIgnore}" onkeypress="return onlyNos(event,this);">
    <%} else { %>
    <%if(!isMandatory){%>
    <input type="text" id="${name}" name="${name}" class="uk-width-1-1" style="${direction}" data-ignore="${dataIgnore}" onkeypress="return onlyNos(event,this);">
    <%}else {%>
    <input type="text" id="${name}" name="${name}" class="uk-width-1-1" style="background: rgb(206, 215, 235);${direction}" data-ignore="${dataIgnore}" onkeypress="return onlyNos(event,this);">
    <%} %>
    <%} %>
</div>
<%}else {%>
<div <%=divStyle %> class="<%= styleClass%>">
    <%if(Boolean.valueOf(disabled)){%>
    <input type="password" id="${name}" name="${name}" class="uk-width-1-1" disabled data-ignore="${dataIgnore}" onkeypress="return onlyNos(event,this);">
    <%} else { %>
    <%if(!isMandatory){%>
    <input type="password" id="${name}" name="${name}" class="uk-width-1-1" style="${direction}" data-ignore="${dataIgnore}" onkeypress="return onlyNos(event,this);">
    <%}else {%>
    <input type="password" id="${name}" name="${name}" class="uk-width-1-1" style="background: rgb(206, 215, 235);${direction}" data-ignore="${dataIgnore}" onkeypress="return onlyNos(event,this);">
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
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                return true;
            }
            catch (err) {
                alert(err.Description);
            }
        }

function addCommas(event,data){
	if(!(event.keyCode==8|| (event.keyCode>=48 && event.keyCode<=57)||(event.keyCode>=96 && event.keyCode<=105))){
		return;
	}
}
</script>
