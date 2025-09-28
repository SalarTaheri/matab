
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%><%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="http://localhost:8080/g02/fnc/treasury/payment/paymentBill/combo/loadAllCoffer" var="readUrl" />
<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="multiSelectLoaderUrl" required="true" rtexprvalue="true"%>
<%@ attribute name="styledivLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="styleLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="styleClass" required="false" rtexprvalue="true" %>
<%@ attribute name="isMandatory" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="loadUrlIsAbsolute" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="key" required="true" rtexprvalue="true" %>
<%@ attribute name="isBoundInOpen" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="stylediv" required="false" rtexprvalue="true" %>
<%@ attribute name="serverFilter" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%
String  divStyle="";
if (styleClass == null || styleClass.length() == 0 || styleClass.equals("normal"))
        styleClass = "uk-width-4-10";
    else if (styleClass.equals("small"))
        styleClass = "uk-width-2-10";
    else if (styleClass.equals("larg"))
        styleClass = "uk-width-6-10";
    else if(styleClass.toLowerCase().equals("verysmall"))
        styleClass="uk-width-1-10";
    else if(styleClass.equals("midsmall")){
         styleClass="uk-width-1-10";
        divStyle="style='width: 15%'";
    }
   else if(styleClass.equals("verylarg")){
         styleClass="uk-width-9-10";
    }

    if(isMandatory==null){
        isMandatory=false;
    }

    if(isBoundInOpen==null){
    	isBoundInOpen=false;
    }
    if(serverFilter==null){
        serverFilter=false;
    }
    if(loadUrlIsAbsolute==null){
        loadUrlIsAbsolute=false;
    }

 %>
<div class="uk-width-1-10 left-align" style="<%= styledivLabel%>">
    <label for="${name}" style="<%= styleLabel%>"><%=ResourceBoundleHolder.resourceBundle.getString(key)%>
    </label>
</div>
<div <%=divStyle %> class="<%= styleClass%> k-rtl" style="<%= stylediv%>" id="${name}_Div">
	       		<select id="${name}_multiSelect"></select>
</div>
<script>

    var serverFilter_${name}=<%=serverFilter%>;
	$(document).ready(function() {
        var url_${name}=getBaseUrl();
        if(<%=loadUrlIsAbsolute%>){
            url_${name}= '${pageContext.request.contextPath}';
        }
        if(serverFilter_${name}){
            $("#${name}_multiSelect").kendoMultiSelect({
                placeholder: '<%=ResourceBoundleHolder.resourceBundle.getString("system.combo.pleaseSelect")%>',
                dataTextField: "ComboCaption",
                dataValueField: "ComboID",
                autoBind: <%=isBoundInOpen%>,
                dataSource: {
                    serverFiltering: true,
                    transport: {
                        parameterMap: function (options) {
                            return JSON.stringify(options);
                        },
                        read: {
                            contentType: "application/json",
                            type: "POST",
                            url: url_${name}+"${multiSelectLoaderUrl}",
                            dataType: "json"
                        }
                    }
                },
                change : function(e){
                    if(typeof(callback_change_${name}) == "function"){
                        callback_change_${name}(e);
                    }
                },
                dataBound: function(e) {
                    if(typeof(callback_dataBound_${name}) == "function"){
                        callback_dataBound_${name}(e);
                    }
                }
            });
        }else{
            $("#${name}_multiSelect").kendoMultiSelect({
                placeholder: '<%=ResourceBoundleHolder.resourceBundle.getString("system.combo.pleaseSelect")%>',
                dataTextField: "ComboCaption",
                dataValueField: "ComboID",
                autoBind: <%=isBoundInOpen%>,
                dataSource: {
                    transport: {
//                        parameterMap: function (options) {
//                            return JSON.stringify(options);
//                        },
                        read: {
                            contentType: "application/json",
                            type: "GET",
                            url: url_${name}+"${multiSelectLoaderUrl}",
                            dataType: "json"
                        }
                    }
                },
                change : function(e){
                    if(typeof(callback_change_${name}) == "function"){
                        callback_change_${name}(e);
                    }
                },
                dataBound: function(e) {
                    if(typeof(callback_dataBound_${name}) == "function"){
                        callback_dataBound_${name}(e);
                    }
                }
            });
        }

		$('.k-loading').remove();
		$('.k-input').addClass('k-input-ex');
		$('.k-multiselect').addClass('k-multiselect-ex');
    });
</script>
<style>
.k-multiselect-ex {
	min-height: 25px !important;
	padding-left: 2px;
	padding-top: 2px;
	padding-right: 2px;
	padding-bottom: 2px;
	cursor: text;
	background: white !important;
}
.k-input-ex{
	background-color: transparent;
	border-color: transparent;
}
</style>
