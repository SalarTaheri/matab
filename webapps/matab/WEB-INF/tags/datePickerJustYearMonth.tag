
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@tag import="com.artonis.core.base.core.Date"%>
<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%--<%@ attribute name="key" required="true" rtexprvalue="true"%>--%>
<%--<%@ attribute name="currentDate" required="false" rtexprvalue="true"%>--%>
<%--<%@ attribute name="disabled" required="false" rtexprvalue="true"%>--%>
<%--<%@ attribute name="direction" required="false" rtexprvalue="true"%>--%>
<%--<%@ attribute name="styleClass" required="false" rtexprvalue="true"%>--%>
<%--<%@ attribute name="style" required="false" rtexprvalue="true"%>--%>
<%--<%@ attribute name="stylediv" required="false" rtexprvalue="true"%>--%>
<%--<%@ attribute name="styledivLabel" required="false" rtexprvalue="true"%>--%>
<%--<%@ attribute name="styleLabel" required="false" rtexprvalue="true"%>--%>
<%--<%@ attribute name="align" required="false" rtexprvalue="true"%>--%>

<%
//	String  divStyle="";
//	if(direction==null || direction.equals(""))
//		direction="direction:rtl";
//	else
//		direction="direction:ltr";
//
//	if(styleClass==null ||styleClass.length()==0||styleClass.equals("normal"))
//		styleClass="uk-width-4-10";
//	else if(styleClass.equals("small"))
//		styleClass="uk-width-2-10";
//	else if(styleClass.equals("larg"))
//		styleClass="uk-width-6-10";
//    else if(styleClass.toLowerCase().equals("verysmall"))
//        styleClass="uk-width-1-10";
//	else if(styleClass.equals("midsmall")){
//         styleClass="uk-width-1-10";
//        divStyle="style='width: 15%'";
//    }
//
//	boolean isCurrentDate=(Boolean.valueOf(currentDate));
//	String curStringDate="";
//	if(isCurrentDate)
//	{
//		Date curDate=new Date(System.currentTimeMillis());
//		curStringDate=curDate.toString();
//	}
%>
<jsp:doBody />
			<%--<div class="uk-width-1-10 left-align" style="<%= styledivLabel%>">--%>
				<%--<label for="${name}" id="${name}_lbl_date" style="<%= styleLabel%>"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></label>--%>
			<%--</div>	--%>
			<%--<div <%=divStyle %> class="<%= styleClass%>" style="<%= stylediv%>">--%>
			<%--<%if(Boolean.valueOf(disabled)){%>--%>
				<%--<input type="text" name="${name}" id="${name}" value="<%=curStringDate%>" class="uk-width-1-1" style="background: rgb(206, 215, 235); ${direction}; <%= style%>" disabled/>--%>
			<%--<%} else { %>--%>
				<%--<input type="text" name="${name}" id="${name}" value="<%=curStringDate%>" class="uk-width-1-1" style="${direction}; <%= style%>"/>--%>
			<%--<%} %>--%>
			<%--</div>--%>
<div style="margin-bottom: 5px;">
	<input type="hidden" id="${name}_followUpDateVal">
	<span>Date: </span>
	<input type="text" id="${name}_followUpDate" value="" />
</div>
<div id="${name}_dialog-datePicker" title='Select Date' style="display:none; direction: ltr; height: 100% !important;">
	<form class="toPopup" style="direction: ltr">
		<table align="center" width="100%" style="margin-top: 20px;">
			<tr>
				<td>
					<div>
						<input type="hidden" id="${name}_yearValue">
						<label>Year: </label>
						<select id="${name}_yearCombobox" style="width: 80px; padding: 2px; border-radius: 4px;"></select>
					</div>
				</td>
				<td>
					<div>
						<input type="hidden" id="${name}_monthValue">
						<label>Month: </label>
						<select id="${name}_monthCombobox" style="padding: 2px; border-radius: 4px;">
							<option value="1"><%=ResourceBoundleHolder.resourceBundle.getString("calendar.farvardin")%></option>
							<option value="2"><%=ResourceBoundleHolder.resourceBundle.getString("calendar.ordibehesht")%></option>
							<option value="3"><%=ResourceBoundleHolder.resourceBundle.getString("calendar.khordad")%></option>
							<option value="4"><%=ResourceBoundleHolder.resourceBundle.getString("calendar.tir")%></option>
							<option value="5"><%=ResourceBoundleHolder.resourceBundle.getString("calendar.mordad")%></option>
							<option value="6"><%=ResourceBoundleHolder.resourceBundle.getString("calendar.shahrivar")%></option>
							<option value="7"><%=ResourceBoundleHolder.resourceBundle.getString("calendar.mehr")%></option>
							<option value="8"><%=ResourceBoundleHolder.resourceBundle.getString("calendar.aban")%></option>
							<option value="9"><%=ResourceBoundleHolder.resourceBundle.getString("calendar.azar")%></option>
							<option value="10"><%=ResourceBoundleHolder.resourceBundle.getString("calendar.dey")%></option>
							<option value="11"><%=ResourceBoundleHolder.resourceBundle.getString("calendar.bahman")%></option>
							<option value="12"><%=ResourceBoundleHolder.resourceBundle.getString("calendar.esfand")%></option>
						</select>
					</div>
				</td>
			</tr>
		</table>
	</form>
</div>

			
			
        <script>
            $(document).ready(function() {
				$("#${name}_dialog-datePicker").dialog({
					autoOpen: false,
					show: {
						effect: "clip",
						duration: 300
					},
					hide: {
						effect: "clip",
						duration: 300
					},
					height: 150,
					width: 300,
					modal: true,
					buttons: {
						"ok": function () {
							${name}_makeFollowUpDate();
							$(this).dialog("close");
						},
						"cancel": function () {
							$(this).dialog("close");
						}
					},
					close: function (event, ui) {
						$(this).dialog("close");
					},
					open: function (event, ui) {
					}
				});
				//
				$("#${name}_followUpDate").click(function(){
					$("#${name}_yearCombobox").val($("#${name}_yearValue").val());
					$("#${name}_monthCombobox").val($("#${name}_monthValue").val());
					$("#${name}_dialog-datePicker").dialog("open");
				});
				//
				${name}_fillYearCombo();
				//
				${name}_checkForLoadYearAndMonth();

            });

			function ${name}_fillYearCombo(){
				for (var i = 1390; i<=1450 ; i++) {
					$("#${name}_yearCombobox").append("<option>" + i + "</option>");
				}
			}

			function ${name}_makeFollowUpDate(){
				var year = $("#${name}_yearCombobox").val();
				var month = $("#${name}_monthCombobox").val();
				if ($.isNumeric(year) && $.isNumeric(month)) {
					$("#${name}_yearValue").val(year);
					$("#${name}_monthValue").val(month);
					//
					$("#${name}_followUpDate").val($("#${name}_monthCombobox option:selected").text() + " " + year);
				}
			}

			function ${name}_checkForLoadYearAndMonth(){
				var year;
				var month;
				if ($("#${name}_followUpDateVal").val() != undefined && $("#${name}_followUpDateVal").val() != "" && $("#${name}_followUpDateVal").val().trim().length > 0) {
					year = parseInt($("#${name}_followUpDateVal").val().split("-")[0]);
					month = parseInt($("#${name}_followUpDateVal").val().split("-")[1]);
				} else {
					var currDate = "<%=new Date(System.currentTimeMillis()).toString()%>";
					year = parseInt(currDate.split("/")[0]);
					month = parseInt(currDate.split("/")[1]);
				}
				$("#${name}_yearValue").val(year);
				$("#${name}_monthValue").val(month);
				$("#${name}_yearCombobox").val(year);
				$("#${name}_monthCombobox").val(month);
			}
        </script>
