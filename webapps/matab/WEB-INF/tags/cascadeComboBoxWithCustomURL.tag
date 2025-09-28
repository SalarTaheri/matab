<%@tag import="java.util.ResourceBundle" %>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>

<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="value" required="false" rtexprvalue="true" %>
<%@ attribute name="key" required="true" rtexprvalue="true" %>
<%@ attribute name="ignore" required="false" rtexprvalue="true" %>
<%@ attribute name="comboLoaderFullUrl" required="true" rtexprvalue="true" %>
<%@ attribute name="isListConstant" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="styleClass" required="false" rtexprvalue="true" %>
<%@ attribute name="style" required="false" rtexprvalue="true" %>
<%@ attribute name="stylediv" required="false" rtexprvalue="true" %>
<%@ attribute name="styledivLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="styleLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="minLength" required="false" rtexprvalue="true" type="java.lang.Integer" %>
<%@ attribute name="cascadeCombo" required="true" rtexprvalue="true"%>
<%@ attribute name="selectIndex" required="false" rtexprvalue="true" type="java.lang.Integer" %>
<%
    ignore = (ignore == null || ignore.equals("")) ? "false" : "true";

    if (styleClass == null || styleClass.length() == 0 || styleClass.equals("normal"))
        styleClass = "uk-width-4-10";
    else if (styleClass.equals("small"))
        styleClass = "uk-width-2-10";
    else if (styleClass.equals("larg"))
        styleClass = "uk-width-6-10";

    if (minLength == null) {
        minLength = 1;
    }

    String basePath = (String) request.getAttribute("basePath");
    boolean isEditMode=false;
    if(basePath.indexOf("/edit/")>0){
        isEditMode=true;
    }
%>
<jsp:doBody/>
<div class="uk-width-1-10 left-align" style="<%= styledivLabel%>">
    <label for="${name}" style="<%= styleLabel%>"><%=ResourceBoundleHolder.resourceBundle.getString(key)%>
    </label>
</div>
<div class="<%= styleClass%> k-rtl" style="<%= stylediv%>">
    <input id="${name}_Comb" name="${name}_Comb" placeholder="Select type..." class="uk-width-1-1" style="<%= style%>"
           data-ignore="true"/>
    <input type="hidden" id="${name}" name="${name}" class="uk-width-1-1" data-ignore="${ignore}"/>
    <%if(value!=null) {%>
        <input type="hidden" id="${value}" name="${value}" class="uk-width-1-1" data-ignore="true"/>
    <% }%>
</div>
<script>
    $(document).ready(function () {
        var ${name}_isSetStartup_edit=false;
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
        var preUrl = '${pageContext.request.contextPath}' + '/' + '${comboLoaderFullUrl}';
        eval("var dataSource_" + "${name}" + " = new kendo.data.DataSource({" +
                "serverFiltering: true," +
                "transport: {" +
                "parameterMap: function (options) {" +
                "              return JSON.stringify(options);" +
                "          }," +
                "read: {" +
                "contentType: \"application/json\"," +
                "type: \"POST\"," +
                "async : false," +
                "url: preUrl " + "," +
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
            cascadeFrom: "${cascadeCombo}_Comb",
            dataTextField:"ComboCaption",
            dataValueField:"ComboID",
            filter:"contains",
            autoBind:false,
            minLength:"<%=minLength%>",
            dataSource:dataSource_${name},
            open:function (e) {
                if (!eval("openCalled_" + "${name}")) {
                    eval("openCalled_" + "${name}=true");
                    var combobox = $("#${name}_Comb").data("kendoComboBox");
                    combobox.setDataSource(eval("dataSource_" + "${name}"));
                    combobox.dataSource.query();
                    combobox.refresh();
                }
            },
            select:function (e) {
                var item = e.item;
                var dataItem = this.dataItem(e.item.index());
                $("#${name}").val(dataItem.ComboID);
            },
            change:function (e) {
                if ($("#${name}_Comb").val().length == 0) {
                    $("#${name}").val("");
                    <%--$("#${name}_Comb").data("kendoComboBox").dataSource._filter="";--%>
                }
            },
            cascade:function(e){
                if(e.sender._selectedValue==""){
                    $("#${name}").val("");
                }
            },
            dataBound:function (e) {
                var isEditMode=<%=isEditMode%>;
                if("${selectIndex}"!=""){
                    if(isEditMode==false){//create mode
                        if(e.sender.dataSource._data.length>0){
                            combobox.select(${selectIndex});
                            $("#${name}").val(e.sender.dataSource._data["${selectIndex}"].ComboID);
                        }
                    }else{//edit mode
                        if(${name}_isSetStartup_edit==false){//startup firstTime
                            ${name}_isSetStartup_edit=true;
                            combobox.value($("#${name}").val())
                        }else{
                            if(e.sender.dataSource._data.length>0){
                                combobox.select(${selectIndex});
                                $("#${name}").val(e.sender.dataSource._data["${selectIndex}"].ComboID);
                            }
                        }

                    }
                }else{
                    if(isEditMode==true){
                        if(${name}_isSetStartup_edit==false){
                            if($("#${name}").val()!=""){
                                combobox.value($("#${name}").val())
                            }
                            ${name}_isSetStartup_edit=true;
                        }
                        <%--else{--%>
                            <%--$("#${name}").val('');--%>
                            <%--$("#${name}_Comb").data("kendoComboBox").dataSource._filter="";--%>
                        <%--}--%>
                    }
                }
                if(typeof(callback_DataBound_${name})=="function"){
                	callback_DataBound_${name}(e);
                }

            },
            close:function(e){
                $("#${name}").val(e.sender._old);
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

                } else {
                     var combobox = $("#${name}_Comb").data("kendoComboBox");
                    var a2 = $("#${name}").val();
                    var a = $("#${value}").val();
                    combobox.select(function (dataItem) {
	                       return dataItem.ComboID == a2;
	                });
                }
            }
        }
    });

</script>
