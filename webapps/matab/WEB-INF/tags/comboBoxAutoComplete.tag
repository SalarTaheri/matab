<%@tag import="java.util.ResourceBundle" %>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@ tag import="org.springframework.web.util.UrlPathHelper" %>
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
<%@ attribute name="dataTextField" required="true" rtexprvalue="true" %>
<%@ attribute name="dataValueField" required="true" rtexprvalue="true" %>
<%@ attribute name="minLength" required="true" rtexprvalue="true" %>
<%@ attribute name="hasTemplate" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="templateComaSep" required="false" rtexprvalue="true" %>
<%@ attribute name="headerTemplateComaSep" required="false" rtexprvalue="true" %>
<%@ attribute name="pageSize" required="false" rtexprvalue="true" type="java.lang.Integer" %>
<%@ attribute name="iscomboLoaderUrlRelative" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="cascadeCombo" required="false" rtexprvalue="true"%>
<%@ attribute name="styledivLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="filteringType" required="false" rtexprvalue="true" %>
<%@ attribute name="isFiltering" required="false" rtexprvalue="true" type="java.lang.Boolean"%>


<%
    ignore = (ignore == null || ignore.equals("")) ? "false" : "true";
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
    if (hasTemplate == null) {
        hasTemplate = false;
    }
    if(pageSize==null){
        pageSize=10;
    }
    if(filteringType==null){
        filteringType="contains";
    }
    if(isFiltering==null){
        isFiltering=false;
    }

    String headerTemplate="";
    String template = "";
    if (hasTemplate) {

        String[] headerTemplateElementArray=null;
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
//                 template+="<p>#: data."+templateElement+" #</p>";
            }
            template += "</tr></table>";
        }


    }
    if(iscomboLoaderUrlRelative!=null && iscomboLoaderUrlRelative){
        String basePath=request.getAttribute("controllerBasePath").toString();
        comboLoaderUrl=basePath+"/"+comboLoaderUrl;
    }

%>
<jsp:doBody/>
<div class="uk-width-1-10 left-align" style="<%= styledivLabel%>">
    <label for="${name}"><%=ResourceBoundleHolder.resourceBundle.getString(key)%>
    </label>
</div>
<div <%=divStyle %> class="<%= styleClass%> k-rtl">
    <%--<input id="${name}_Comb" name="${name}_Comb" placeholder="Select type..." class="uk-width-1-1" data-ignore="true"/>--%>
    <input type="hidden" id="${name}" name="${name}" class="uk-width-1-1" data-ignore="${ignore}"/>
    <%if(value!=null) {%>
        <input type="hidden" id="${value}" name="${value}" class="uk-width-1-1" data-ignore="true"/>
    <% }%>

    <kendo:comboBox name="${name}_Comb" template="<%=template%>" dataTextField="${dataTextField}" cascadeFrom="${cascadeCombo}_Comb"
                    dataValueField="${dataValueField}" filter="<%=filteringType%>"
                    autoBind="false" minLength="${minLength}" select="_${name}_select_element" change="_${name}_change"
					dataBound="_${name}_dataBound" open="_${name}_open" data-ignore="true"
                    class="uk-width-1-1" placeholder='<%=ResourceBoundleHolder.resourceBundle.getString("system.combo.pleaseSelect")%>'
					close="_${name}_close">

        <kendo:dataSource serverFiltering="true" pageSize="<%=pageSize%>" serverPaging="true" >
            <kendo:dataSource-transport>
                <%--<kendo:dataSource-transport-read url="${comboLoaderUrl}" type="POST" contentType="application/json"/>--%>
                <kendo:dataSource-transport-read url="<%=comboLoaderUrl%>" type="POST" contentType="application/json"/>
                <kendo:dataSource-transport-parameterMap>
                    <script>
                        function parameterMap(options) {
                            if(typeof(callback_parameter_map_${name}) == "function"){
                                options=callback_parameter_map_${name}(options);
                            }
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
</div>

<script>
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

    });


    function _${name}_select_element(e) {
        var item = e.item;
        var dataItem = this.dataItem(e.item.index());
        $("#${name}").val(dataItem.<%=dataValueField%>);
        if(typeof(callback_select_element_${name}) == "function"){
            callback_select_element_${name}.call(this, e);
        }
    }

    function _${name}_reset(){
        $("#${name}").value='';
        $("#${value}").value='';
    }

    function _${name}_change(e){
        if($("#${name}_Comb").val().length==0){
            $("#${name}").val("");
        }
        if(typeof(callback_change_${name}) == "function"){
            callback_change_${name}.call(this, e)
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
            callback_dataBound_${name}.call(this, e)
        }
    }
    function _${name}_open(e){
        if(typeof(callback_open_${name}) == "function"){
            callback_open_${name}(e);
        }
    }


    window["bindToEntityById_after__${name}_Comb"] = function () {
        <%--if (window["called_${name}"]) {--%>
            <%--return;--%>
        <%--} else {--%>
            <%--window["called_${name}"] = true;--%>
        <%--}--%>
        if ($("#${name}").val() == "") {
            /*       console.log('resid val');
             var combobox = $("#
        ${name}_Comb").data("kendoComboBox");
             combobox.setDataSource(dataSource_
        ${name});
             combobox.refresh();*/
        } else {
            if ("${isListConstant}" == 'true') {
                var a2 = $("#${name}").val();
                var combobox = $("#${name}_Comb").data("kendoComboBox");
                <%--combobox.setDataSource(dataSource_${name});--%>
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
                if ("${isFiltering}" == 'true'){
                    combobox.dataSource.filter({ field: "id", operator: "eq", value: a2 });
                }else{
                    combobox.dataSource.read({
                        filter: { field: "id", operator: "eq", value: a2 },
                        page : 1,
                        pageSize : 1
                    });
                }
                combobox.select(combobox.ul.children().eq(0));
            }
        }
        if(typeof(callback_afterBind_${name}) == "function"){
            callback_afterBind_${name}();
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