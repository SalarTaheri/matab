
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@tag import="com.artonis.core.base.core.Date"%>
<%@ tag import="com.artonis.clinic.core.service.util.ClinicCoreServiceUtil" %>
<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="key" required="true" rtexprvalue="true"%>
<%@ attribute name="currentDate" required="false" rtexprvalue="true"%>
<%@ attribute name="disabled" required="false" rtexprvalue="true"%>
<%@ attribute name="direction" required="false" rtexprvalue="true"%>
<%@ attribute name="styleClass" required="false" rtexprvalue="true"%>
<%@ attribute name="style" required="false" rtexprvalue="true"%>
<%@ attribute name="stylediv" required="false" rtexprvalue="true"%>
<%@ attribute name="styledivLabel" required="false" rtexprvalue="true"%>
<%@ attribute name="styleLabel" required="false" rtexprvalue="true"%>
<%@ attribute name="align" required="false" rtexprvalue="true"%>

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
	
	boolean isCurrentDate=(Boolean.valueOf(currentDate));
	String curStringDate="";
	if(isCurrentDate)
	{
		Date curDate=new Date(System.currentTimeMillis());
		curDate=ClinicCoreServiceUtil.getClinicWorkingDate(curDate);
		curStringDate=curDate.toString();
	}
%>
<jsp:doBody />
				<label for="${name}" style="<%= styleLabel%>"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></label>
			<%if(Boolean.valueOf(disabled)){%>
					<input  id="${name}" name="${name}" class="uk-width-1-1" disabled>
					<input name="${name}" id="${name}" value="<%=curStringDate%>"  style="${direction}" disabled/>
				<%} else { %>
					<input type="text" name="${name}" id="${name}" value="<%=curStringDate%>"  style="${direction} <%= style%>"/>
				<%} %>

			
			
        <script>
            $(document).ready(function() {
                // create DatePicker from input HTML element
                //$("#${name}").kendoDatePicker();
                <%--$("#${name}").datepicker();--%>
                $("#${name}").persianDatepicker();
            });
        </script>
