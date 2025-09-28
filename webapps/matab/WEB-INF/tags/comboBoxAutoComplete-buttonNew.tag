<%@tag import="java.util.ResourceBundle" %>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@tag import="org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>

<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="value" required="false" rtexprvalue="true" %>
<%@ attribute name="key" required="true" rtexprvalue="true" %>
<%@ attribute name="ignore" required="false" rtexprvalue="true" %>
<%@ attribute name="comboLoaderUrl" required="true" rtexprvalue="true" %>
<%@ attribute name="isListConstant" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="styleClass" required="false" rtexprvalue="true" %>
<%@ attribute name="style" required="false" rtexprvalue="true" %>
<%@ attribute name="dataTextField" required="true" rtexprvalue="true" %>
<%@ attribute name="dataValueField" required="true" rtexprvalue="true" %>
<%@ attribute name="minLength" required="true" rtexprvalue="true" %>
<%@ attribute name="hasTemplate" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="templateComaSep" required="false" rtexprvalue="true" %>
<%@ attribute name="headerTemplateComaSep" required="false" rtexprvalue="true" %>
<%@ attribute name="pageSize" required="false" rtexprvalue="true" type="java.lang.Integer" %>
<%@ attribute name="styledivLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="stylediv" required="false" rtexprvalue="true" %>
<%@ attribute name="iscomboLoaderUrlRelative" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="styleLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="baseUrl" required="false" rtexprvalue="true"  %>
<%@ attribute name="popupUrl" required="true" rtexprvalue="true"  %>
<%@ attribute name="saveUrl" required="false" rtexprvalue="true"  %>
<%@ attribute name="relativeSaveUrl" required="false" rtexprvalue="true"  %>
<%
    ignore = (ignore == null || ignore.equals("")) ? "false" : "true";
    String  localWidth="width: 85%;height:100%;";
    String  divStyle="";
    if (styleClass == null || styleClass.length() == 0 || styleClass.equals("normal")){
        styleClass = "uk-width-4-10";
    }else if (styleClass.equals("small")){
        styleClass = "uk-width-2-10";
    }else if (styleClass.equals("larg")){
        styleClass = "uk-width-6-10";
    }else if(styleClass.equals("midsmall")){
        styleClass="uk-width-2-10";
        divStyle="style='width: 15%'";
        localWidth="width: 75%;";
        stylediv="width: 15%";
   }
    if (hasTemplate == null) {
        hasTemplate = false;
    }
    if(pageSize==null){
        pageSize=10;
    }

    String headerTemplate="";
    String template = "";
    if (hasTemplate) {
        String[] headerTemplateElementArray = null;
        if (headerTemplateComaSep.length() > -1 && !headerTemplateComaSep.equals(" ")) {
            headerTemplateElementArray = headerTemplateComaSep.split(",");
        }
        if (templateComaSep.length() > -1 && !templateComaSep.equals(" ")) {
            String[] templateElementArray = templateComaSep.split(",");
            template = "<table><tr>";
            int i=-1;
            for (String templateElement : templateElementArray) {
                i++;
                template += "<td width='100px'>" +ResourceBoundleHolder.resourceBundle.getString(headerTemplateElementArray[i]) + ":</td>";
                template += "<td width='100px'>#: data." + templateElement + " #</td>";
            }
            template += "</tr></table>";
        }
    }
    if(iscomboLoaderUrlRelative!=null && iscomboLoaderUrlRelative){
        String basePath=request.getAttribute("controllerBasePath").toString();
        comboLoaderUrl=basePath+"/"+comboLoaderUrl;
    }
    if(relativeSaveUrl!=null){
        String basePath = (String) request.getAttribute("basePath");
        if(basePath.contains("/create")){
            String substring = basePath.substring(0, basePath.indexOf("/create"));
            saveUrl = substring +relativeSaveUrl;
        }else if(basePath.contains("/edit")){
            String substring = basePath.substring(0, basePath.indexOf("/edit"));
            saveUrl = substring + relativeSaveUrl;
        }else{
        	saveUrl = basePath + relativeSaveUrl;
        }
    }
%>
<jsp:doBody/>
<div id="item-modals-${name}" style="width:0;height: 0; direction: rtl"></div>
<div class="uk-width-1-10 left-align" style="<%= styledivLabel%>">
    <label for="${name}" style="<%= styleLabel%>"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></label>
</div>
<div class="<%= styleClass%> k-rtl" style="<%= stylediv%>">
    <input type="hidden" id="${name}" name="${name}" class="uk-width-1-1" data-ignore="${ignore}"/>
    <%if(value!=null) {%>
        <input type="hidden" id="${value}" name="${value}" class="uk-width-1-1" data-ignore="true"/>
    <% }%>


    <kendo:comboBox name="${name}_Comb"  template="<%=template%>" dataTextField="${dataTextField}"
                    dataValueField="${dataValueField}" filter="contains"
                    autoBind="false" minLength="${minLength}" select="_${name}_select_element" change="_${name}_change" dataBound="_${name}_dataBound" open="_${name}_open" data-ignore="true"
                    class="uk-width-1-1" placeholder='<%=ResourceBoundleHolder.resourceBundle.getString("system.combo.pleaseSelect")%>' close="_${name}_close" style="<%= localWidth%>" >

        <kendo:dataSource serverFiltering="true" pageSize="<%=pageSize%>" serverPaging="true" >
            <kendo:dataSource-transport>
                <kendo:dataSource-transport-read url="<%=comboLoaderUrl%>" type="POST" contentType="application/json"/>
                <kendo:dataSource-transport-parameterMap>
                    <script>
                        function parameterMap(options) {
                            return JSON.stringify(options);
                        }
                    </script>
                </kendo:dataSource-transport-parameterMap>
            </kendo:dataSource-transport>
            <kendo:dataSource-schema data="data" total="total">
            </kendo:dataSource-schema>
            <kendo:dataSource-error>
                <script>
                    function error(e) {
                        errorRequestAjax(e);
                    }
                </script>
            </kendo:dataSource-error>
        </kendo:dataSource>
    </kendo:comboBox>
        <button id="button-${name}-new" type="button" >
            +
        </button>
</div>

<script type="text/javascript">
	function cancel_${name}_Callback(){
	    $("#item-modals-${name}").dialog('close');
	}
	
	function success_save_Callback(){
	    $("#item-modals-${name}").dialog('close');
	    var combobox = $("#${name}_Comb").data("kendoComboBox");
	    combobox.dataSource.query();
	    combobox.refresh();
	}
	
	function success_save_${name}_Callback(){
	    $("#item-modals-${name}").dialog('close');
	    var combobox = $("#${name}_Comb").data("kendoComboBox");
	    combobox.dataSource.query();
	    combobox.refresh();
	    combobox.select(0);
	}
	
    function save_${name}_url(){
        return '<%=saveUrl%>';
    }
    
    function _${name}_change(e){
        if($("#${name}_Comb").val().length==0){
            $("#${name}").val("");
        }
        if (typeof(callback_change_${name}) == "function") {
            callback_change_${name}(e);
        }
    }
    function _${name}_close(e){
        $("#${name}").val(e.sender._old);
        if(typeof(callback_close_${name}) == "function"){
            callback_close_${name}(e);
        }
    }
    function _${name}_dataBound(e){
        if(typeof(callback_dataBound_${name}) == "function"){
            callback_dataBound_${name}(e);
        }
    }
    function _${name}_open(e){
        if(typeof(callback_open_${name}) == "function"){
            callback_open_${name}(e);
        }
    }

    $(document).ready(function() {
        var ${name}_val = $("#${name}");

        ${name}_val.data("value", ${name}_val.val());

        setInterval(function() {
            var data = ${name}_val.data("value"),
                val = ${name}_val.val();

            if (data !== val) {
                ${name}_val.data("value", val);
                if(val==""){
                    $("#${name}_Comb").data("kendoComboBox").text('');
                }
            }
        }, 100);

        var combobox = $("#${name}_Comb").data("kendoComboBox");
        combobox.input.bind("keydown", function(e) {
            if (e.keyCode == 40) {
                combobox.open();
            }
        });

        $("#button-${name}-new").click(function () {
            var url="";
            if("${baseUrl}"!=""){
                url="${pageContext.request.contextPath}" +"${baseUrl}"+"${popupUrl}";
            }else{
                url=getBaseUrl()+"${popupUrl}";
            }
            var add = $.get(url,
            function (data) {
                $("#item-modals-${name}").empty();
                $("#item-modals-${name}").append('<div id="modals-${name}"/>');
                $("#modals-${name}").append(data);
                $("#item-modals-${name}").dialog('open');
            }).fail(function (result) {
                if (result.status == 401) {
                    window.location.href = "";
                }
            });
        });

        $("#item-modals-${name}").dialog({
            modal : true,
            autoOpen: false,
            maxHeight: true,
            maxWidth: true,
            width: 1200,
            zIndex:10000,
            close: function( event, ui ) {
                $("#item-modals-${name}").empty();
            }
        });

    });

    function _${name}_select_element(e) {
        console.log(e);
        var item = e.item;
        var dataItem = this.dataItem(e.item.index());
        $("#${name}").val(dataItem.<%=dataValueField%>);
        if(typeof(callback_select_element_${name}) == "function"){
            callback_select_element_${name}(dataItem.<%=dataValueField%>);
        }
    }

    function _${name}_reset(){
        $("#${name}").value='';
        $("#${value}").value='';
    }

    window["bindToEntityById_after__${name}_Comb"] = function () {
        if ($("#${name}").val() == "") {
        } else {
            if ("${isListConstant}" == 'true') {
                var a2 = $("#${name}").val();
                var combobox = $("#${name}_Comb").data("kendoComboBox");
                combobox.dataSource.read();
                combobox.refresh();
                combobox.select(function (dataItem) {
                    return dataItem.ComboID == a2;
                });
                combobox.value(a2);

            } else {
                var combobox = $("#${name}_Comb").data("kendoComboBox");

                var a2 = $("#${name}").val();
                var a = $("#${value}").val();
                combobox.dataSource.data([
                    {"<%=dataTextField%>":a, "<%=dataValueField%>":a2}
                ]);
                combobox.dataSource.read({
                    filter: { field: "id", operator: "eq", value: a2 },
                    page : 1,
                    pageSize : 1
                });
                combobox.select(combobox.ul.children().eq(0));
            }
        }
    }
    
</script>

<style>
    .dropdown-header {
        font-size: 1.2em;
    }

    .dropdown-header > span {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        text-align: left;
        display: inline-block;
        border-style: solid;
        border-width: 0 0 1px 1px;
        padding: .3em .6em;
        width: 312px;
    }

    .dropdown-header > span:first-child {
        width: 82px;
        border-left-width: 0;
    }

    .demo-section {
        width: 400px;
        padding: 30px;
    }

    .demo-section h2 {
        text-transform: uppercase;
        font-size: 1.2em;
        margin-bottom: 10px;
    }

    #customers-list {
        padding-bottom: 26px;
    }

    #customers-list .k-item > span {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        display: inline-block;
        border-style: solid;
        border-width: 0 0 1px 1px;
        vertical-align: top;
        min-height: 95px;
        width: 79%;
        padding: .6em 0 0 .6em;
    }

    #customers-list .k-item > span:first-child {
        width: 77px;
        border-left-width: 0;
        padding: .6em 0 0 0;
    }

    #customers-list img {
        -moz-box-shadow: 0 0 2px rgba(0, 0, 0, .4);
        -webkit-box-shadow: 0 0 2px rgba(0, 0, 0, .4);
        box-shadow: 0 0 2px rgba(0, 0, 0, .4);
        width: 70px;
        height: 70px;
    }

    #customers-list h3 {
        font-size: 1.6em;
        margin: 0;
        padding: 0;
    }

    #customers-list p {
        margin: 0;
        padding: 0;
    }
</style>