<%@tag import="java.util.ResourceBundle" %>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>

<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="value" required="false" rtexprvalue="true" %>
<%@ attribute name="key" required="true" rtexprvalue="true" %>
<%@ attribute name="ignore" required="false" rtexprvalue="true" %>
<%@ attribute name="comboLoaderUrl" required="true" rtexprvalue="true" %>
<%@ attribute name="isListConstant" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="styleClass" required="false" rtexprvalue="true" %>
<%@ attribute name="style" required="false" rtexprvalue="true" %>
<%@ attribute name="stylediv" required="false" rtexprvalue="true" %>
<%@ attribute name="styledivLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="styleLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="minLength" required="false" rtexprvalue="true" type="java.lang.Integer" %>
<%@ attribute name="selectIndex" required="false" rtexprvalue="true" type="java.lang.Integer" %>
<%@ attribute name="isMandatory" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="isBoundInOpen" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="isUrlComplete" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
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
    if (minLength == null) {
        minLength = 1;
    }
    boolean autoBind=false;
    if(selectIndex!=null){
        autoBind=true;
    }
    if(isMandatory==null){
        isMandatory=false;
    }
    if(isBoundInOpen==null){
    	isBoundInOpen=true;
    }
    if(isUrlComplete==null){
        isUrlComplete=false;
    }
%>
<jsp:doBody/>
<div class="uk-width-1-10 left-align" style="<%= styledivLabel%>">
    <label for="${name}" style="<%= styleLabel%>"><%=ResourceBoundleHolder.resourceBundle.getString(key)%>
    </label>
</div>
<div <%=divStyle %> class="<%= styleClass%> k-rtl" style="<%= stylediv%>" id="${name}_Div">
    <%if(!isMandatory){%>
    <input id="${name}_Comb" name="${name}_Comb" placeholder="Select type..." class="uk-width-1-1" style="<%= style%> ;height:100%;"
           data-ignore="true"/>
    <%}else {%>
    <input id="${name}_Comb" name="${name}_Comb" placeholder="Select type..." class="uk-width-1-1" style=" background: rgb(206, 215, 235);"
           data-ignore="true"/>
    <%} %>
    <%--<input id="${name}_Comb" name="${name}_Comb" placeholder="Select type..." class="uk-width-1-1" style="<%= style%>"--%>
    <%--data-ignore="true"/>--%>
    <input type="hidden" id="${name}" name="${name}" class="uk-width-1-1" data-ignore="${ignore}"/>
    <%if(value!=null) {%>
    <input type="hidden" id="${value}" name="${value}" class="uk-width-1-1" data-ignore="true"/>
    <% }%>
</div>

<script>
    $(document).ready(function () {
        var ${name}_val = $("#${name}");

        ${name}_val.data("value", ${name}_val.val());

        <%--setInterval(function() {--%>
            <%--var data = ${name}_val.data("value"),--%>
                    <%--val = ${name}_val.val();--%>

            <%--if (data !== val) {--%>
                <%--${name}_val.data("value", val);--%>
                <%--if(val==""){--%>
                    <%--$("#${name}_Comb").data("kendoComboBox").text('');--%>
                <%--}--%>
            <%--}--%>
        <%--}, 100);--%>

        window["openCalled_${name}"] = false;
        var baseUrl = getBaseUrl();
        var isUrlComplete=<%=isUrlComplete%>;
        if(isUrlComplete==true){
            baseUrl='';
        }
        eval("var dataSource_" + "${name}" + " = new kendo.data.DataSource({" +
                "serverFiltering: true," +
                "transport: {" +
                "parameterMap: function (options) {" +
                "              return JSON.stringify(options);" +
                "          }," +
                "read: {" +
                "contentType: \"application/json\"," +
                "type: \"POST\"," +
                "async : true," +
                "url: baseUrl+" + "\"${comboLoaderUrl}\"," +
                "dataType:" + "\"json\" " +
                "}" +
                "}" +
                "});");

        dataSource_${name}.bind("error",dataSource_error);
        function dataSource_error(e) {
            errorRequestAjax(e);
        }
        var nameScript = "${name}";

        $("#${name}_Comb").kendoComboBox({
            placeholder:"<%=ResourceBoundleHolder.resourceBundle.getString("system.combo.pleaseSelect")%>",
            dataTextField:"ComboCaption",
            dataValueField:"ComboID",
            filter:"contains",
            autoBind:"<%=autoBind%>",
            minLength:"<%=minLength%>",
            dataSource:dataSource_${name},
            open:function (e) {
                if (("${isListConstant}" != 'true' && !eval("openCalled_" + "${name}")&& "${isBoundInOpen}" == 'true')
                        ||(window.location.href.indexOf("/create")>-1)) {
                    eval("openCalled_" + "${name}=true");
                    var combobox = $("#${name}_Comb").data("kendoComboBox");
                    combobox.setDataSource(eval("dataSource_" + "${name}"));
                    combobox.dataSource.query();
                    combobox.refresh();
                }
            },
            select:function (e) {
                if(typeof(callback_before_select_${name})=="function"){
                    var value = callback_before_select_${name}(e);
                    if (value == false) {
                        return;
                    }
                }
                var item = e.item;
                var dataItem = this.dataItem(e.item.index());
                $("#${name}").val(dataItem.ComboID);
            },
            change:function (e) {
                if ($("#${name}_Comb").val().length == 0) {
                    $("#${name}").val("");
                }
                if(typeof(callback_change_${name})=="function"){
                	callback_change_${name}(e);
                }
            },
            close:function(e){
                $("#${name}").val(e.sender._old);
            },
            dataBound:function(e){
                if("${selectIndex}"!=""){
                    if(e.sender.dataSource._data.length>0){
                        combobox.select(${selectIndex});
                        $("#${name}").val(e.sender.dataSource._data["${selectIndex}"].ComboID);
                    }
                }
                if(typeof(callback_DataBound_${name})=="function"){
                	callback_DataBound_${name}(e);
                }
            }
        });
        var combobox = $("#${name}_Comb").data("kendoComboBox");

        combobox.input.bind("keydown", function (e) {
            if (e.keyCode == 40) {
                combobox.open();
            }
        });

        window["called_${name}"] = false;

        window["bindToEntityById_after__${name}_Comb"] = function () {
            <%--if (window["called_${name}"]) {--%>
                <%--return;--%>
            <%--} else {--%>
                <%--window["called_${name}"] = true;--%>
            <%--}--%>
            $("#${name}_Comb").data("kendoComboBox").dataSource._filter=undefined;
            if ($("#${name}").val() == "") {
                var combobox = $("#${name}_Comb").data("kendoComboBox");
                combobox.setDataSource(dataSource_${name});
                combobox.refresh();
            } else {
                if ("${isListConstant}" == 'true') {
                    var a2 = $("#${name}").val();
                    var combobox = $("#${name}_Comb").data("kendoComboBox");
                    combobox.setDataSource(dataSource_${name});
                    combobox.dataSource.read();
                    combobox.refresh();
                    combobox.select(function (dataItem) {
                        return dataItem.ComboID == a2;
                    });
                    combobox.value(a2);
//                    combobox.trigger("change");

                } else {
                    var combobox = $("#${name}_Comb").data("kendoComboBox");
                    var a2 = $("#${name}").val();
                    var a = $("#${value}").val();
                    if(a==undefined && a2==undefined){
                        return;
                    }
                    combobox.dataSource.data([
                        {ComboCaption:a, ComboID:a2}
                    ]);
//                    combobox.dataSource.query();
                    if(a==undefined){
//                        combobox.dataSource.filter({ 'ComboID':a2});
                        combobox.dataSource.filter({field: "ComboID", operator: "eq", value: a2});
                    }else{
//                        combobox.dataSource.filter({'ComboCaption':a, 'ComboID':a2});
                        combobox.dataSource.filter({field: "ComboCaption", operator: "eq", value: a},
                                                    {field: "ComboID", operator: "eq", value: a2});
                    }
                    combobox.select(combobox.ul.children().eq(0));
                    combobox.dataSource._filter=undefined;
                }
            }

        }
    });

</script>