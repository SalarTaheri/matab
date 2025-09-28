
<%@tag import="java.util.ResourceBundle"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>

<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="key" required="true" rtexprvalue="true"%>
<%@ attribute name="disabled" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="direction" required="false" rtexprvalue="true"%>
<%@ attribute name="height" required="false" rtexprvalue="true"%>
<%@ attribute name="width" required="false" rtexprvalue="true"%>
<%@ attribute name="divWidth" required="false" rtexprvalue="true"%>
<%@ attribute name="styledivLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="divWidthVal" required="false" rtexprvalue="true" %>


<%
String heightValue = "";
if (height!=null && height.length() > 0 )
{
	heightValue="height: " + height+"px;";
}

String widthValue = "width:100%";
if (width!=null && width.length() > 0 )
{
	widthValue="width: " + width+"px;";
}

String disabledString = "";
if(disabled!=null && disabled==true){
	disabledString = "disabled"; 
}
String DivwidthValue = "50%";
if (divWidthVal!=null )
{
	DivwidthValue="width: " + divWidthVal+"%;";
}
if(divWidthVal==null)
{
	DivwidthValue="width: " + "50"+"%;";
}
 %>
<jsp:doBody />
			<div class="uk-width-1-10 left-align" style="<%= styledivLabel%>">
				<label for="${name}"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></label>			
			</div>	
			<div class="uk-width-9-10" style="<%=DivwidthValue%>">
			<% if(direction==null || direction.equals("")){%>
				<textarea id="${name}" name="${name}" style="<%=widthValue%>;<%=heightValue%> direction:rtl" <%=disabledString%> cols="0" rows="10" placeholder="">
				</textarea>
			<%}else {%>
				<textarea id="${name}" name="${name}" style="<%=widthValue%>;<%=heightValue%> direction:rtl" <%=disabledString%> cols="0" rows="10" placeholder="">
				</textarea>
			<%}%>
			</div>	
