
<%@tag import="java.util.ResourceBundle"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>

<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="key" required="true" rtexprvalue="true"%>
<%@ attribute name="disabled" required="false" rtexprvalue="true"%>
<%@ attribute name="direction" required="false" rtexprvalue="true"%>
<%@ attribute name="styleClass" required="false" rtexprvalue="true"%>
<%
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
 %>
<jsp:doBody />
			<div class="uk-width-1-10 left-align">
				<label for="${name}"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></label>
			</div>
                    <div class="<%= styleClass%>">
                        <%if(Boolean.valueOf(disabled)){%>
                              <input type="password" id="${name}" name="${name}" class="uk-width-1-1" disabled>
                        <%} else { %>
                                  <input type="password" id="${name}" name="${name}" class="uk-width-1-1" style="${direction}">
                        <%} %>
                    </div>
