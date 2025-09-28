
<%@tag import="java.util.ResourceBundle"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>

<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="key" required="true" rtexprvalue="true"%>
<%@ attribute name="disabled" required="false" rtexprvalue="true"%>
<%@ attribute name="direction" required="false" rtexprvalue="true"%>
<%@ attribute name="styleClass" required="false" rtexprvalue="true"%>
<%@ attribute name="min" required="false" rtexprvalue="true"%>
<%@ attribute name="max" required="false" rtexprvalue="true"%>
<%@ attribute name="step" required="false" rtexprvalue="true"%>
<%@ attribute name="format" required="false" rtexprvalue="true"%>
<%@ attribute name="isMandatory" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%
    //format="#.,"
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




%>
<jsp:doBody />
<div class="uk-width-1-10 left-align">
    <label for="${name}"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></label>
</div>
<div <%=divStyle %> class="<%= styleClass%> k-rtl">
    <%if(Boolean.valueOf(disabled)){%>
    <input type="number" id="${name}" name="${name}" min="${min}" max="${max}" step="${step}" class="uk-width-1-1" disabled>
    <%} else { %>
    <%if(isMandatory){%>
    <input type="number" id="${name}" name="${name}" min="${min}" max="${max}" step="${step}" class="uk-width-1-1" style="direction:ltr;background: rgb(206, 215, 235);">
    <%}else{ %>
    <input type="number" id="${name}" name="${name}" min="${min}" max="${max}" step="${step}" class="uk-width-1-1" style="direction:ltr;">
    <%} %>
    <%} %>
</div>


<script>
    $(document).ready(function () {
        var ${name}_val = $("#${name}");

        ${name}_val.data("value", ${name}_val.val());

        setInterval(function() {
            var data = ${name}_val.data("value"),
                    val = ${name}_val.val();

            if (data !== val) {
                ${name}_val.data("value", val);
                $("#${name}").data("kendoNumericTextBox").value($("#${name}").val());
                callback_${name}($("#${name}").val());
            <%--$("#${name}_Comb").data("kendoComboBox").text('');--%>
//                            }
            }
        }, 100);


        $("#${name}").kendoNumericTextBox({
            format:"${format}",
            change: function() {
//                            console.log("this.value():"+this.value());
                callback_${name}(this.value());
            },
            spin: function() {
//                            console.log("this.value():"+this.value());
                callback_${name}(this.value());
            }
        });


        <%--$("#${name}").data("kendoNumericTextBox").value($("#${name}").val());--%>

    });

</script>
