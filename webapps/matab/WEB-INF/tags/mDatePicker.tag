
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@tag import="com.artonis.core.base.core.Date"%>
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

	boolean isCurrentDate=(Boolean.valueOf(currentDate));
	String curStringDate="";
	if(isCurrentDate)
	{
		Date curDate=new Date(System.currentTimeMillis());
		curStringDate=curDate.toString();
	}
%>
<jsp:doBody />
			<div class="uk-width-1-10 left-align" style="<%= styledivLabel%>">
				<label for="${name}" id="${name}_lbl_date" style="<%= styleLabel%>"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></label>
			</div>	
			<div <%=divStyle %> class="<%= styleClass%>" style="<%= stylediv%>">
			<%if(Boolean.valueOf(disabled)){%>
				<input type="text" name="${name}" id="${name}" value="<%=curStringDate%>" class="uk-width-1-1" style="background: rgb(206, 215, 235); ${direction}; <%= style%>" autocomplete="off" disabled/>
			<%} else { %>
				<input type="text" name="${name}" id="${name}" value="<%=curStringDate%>" class="uk-width-1-1" style="${direction}; <%= style%>" autocomplete="off"/>
			<%} %>
			</div>	

			
			
        <script>
            $(document).ready(function() {
                // create DatePicker from input HTML element
                //$("#${name}").kendoDatePicker();
                /*$("#${name}").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    yearRange: "c-100:c+100",
                    beforeShow: function() {
                        setTimeout(function(){
                            $('.ui-datepicker').css('z-index', 99999999999999);
                        }, 0);
                    }
                });*/
                $("#${name}").persianDatepicker({
                	onSelect:function () {
		                if(typeof(callback_onSelect_${name})=="function"){
		                	callback_onSelect_${name}();
		                }
                	},
                     onShow: function() {
                        setTimeout(function(){
                            $('.pdp-default').css('z-index', 99999999999999);
    		                if(typeof(callback_onShow_${name})=="function"){
    		                	callback_onShow_${name}();
    		                }
                        }, 0);
                    }
                
                });
            });
        </script>
