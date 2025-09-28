<%@tag import="java.util.ResourceBundle" %>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@tag import="org.springframework.web.util.UrlPathHelper" %>

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
<%@ attribute name="styledivButton" required="false" rtexprvalue="true" %>
<%@ attribute name="styleButton" required="false" rtexprvalue="true" %>
<%@ attribute name="minLength" required="false" rtexprvalue="true" type="java.lang.Integer" %>
<%@ attribute name="popupUrl" required="true" rtexprvalue="true"  %>
<%@ attribute name="saveUrl" required="false" rtexprvalue="true"  %>
<%@ attribute name="relativeSaveUrl" required="false" rtexprvalue="true"  %>
<%@ attribute name="cascadeCombo" required="true" rtexprvalue="true"%>

<%
    ignore = (ignore == null || ignore.equals("")) ? "false" : "true";
	String  divStyle="";
	String  localWidth="width: 85%;";
    if (styleClass == null || styleClass.length() == 0 || styleClass.equals("normal"))
        styleClass = "uk-width-4-10";
    else if (styleClass.equals("small"))
        styleClass = "uk-width-2-10";
    else if (styleClass.equals("larg"))
        styleClass = "uk-width-6-10";
    else if(styleClass.equals("midsmall")){
        styleClass="uk-width-2-10";
        divStyle="style='width: 15%'";
        localWidth="width: 75%;";
        stylediv="width: 15%";
   }
    

    if (minLength == null) {
        minLength = 1;
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
<div id="item-modals-${name}" style="width:0;height: 0; "></div>
<div class="uk-width-1-10 left-align" style="<%= styledivLabel%>">
    <label for="${name}" style="<%= styleLabel%>"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></label>
</div>
<div class="<%= styleClass%> k-rtl" style="<%= stylediv%>">
    <%if(styleClass.equals("uk-width-4-10")){%>
        <input id="${name}_Comb" name="${name}_Comb" placeholder="Select type..." class="uk-width-1-1" style="width: 93%; <%= style%>"
               data-ignore="true"/>
    <%}else if(styleClass.equals("uk-width-2-10")){%>
        <input id="${name}_Comb" name="${name}_Comb" placeholder="Select type..." class="uk-width-1-1" style="<%= localWidth%> <%= style%>"
               data-ignore="true"/>
    <%}%>
    <input type="hidden" id="${name}" name="${name}" class="uk-width-1-1" data-ignore="${ignore}"/>
    <input type="hidden" id="${value}" name="${value}" class="uk-width-1-1" data-ignore="true"/>
        <button id="button-${name}-new" type="button" >
            +
        </button>
</div>

<script>
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

    $(document).ready(function () {
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

        $("#button-${name}-new").click(function () {
            var add = $.get(getBaseUrl()+"${popupUrl}",
                    function (data) {
                        $("#item-modals-${name}").empty();
                        $("#item-modals-${name}").append('<div id="modals-${name}"/>');
                        $("#modals-${name}").append(data);
                        $("#item-modals-${name}").dialog('open');
//                        afterBind();
                    }).fail(function (result) {
                        if (result.status == 401) {
                            window.location.href = "";
                        }
                    });

        });

        $("#item-modals-${name}").dialog({
            modal : true,
            autoOpen: false,
//        closeOnEscape: true ,
//        dialogClass: 'captcha',
//        show: 'explode',
//        hide: 'explode',
            maxHeight: true,
            maxWidth: true,
            position: 'center',
            width: 800,
            zIndex:10000,
            close: function( event, ui ) {
                $("#item-modals-${name}").empty();
            }

        });

        window["openCalled_${name}"] = false;
        var baseUrl = getBaseUrl();
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
                "url: baseUrl+" + "\"${comboLoaderUrl}\"," +
                "dataType:" + "\"json\" " +
                "}" +
                "}" +
                "});");

        var nameScript = "${name}";

        $("#${name}_Comb").kendoComboBox({
            placeholder:"<%=ResourceBoundleHolder.resourceBundle.getString("system.combo.pleaseSelect")%>",
            cascadeFrom: "${cascadeCombo}_Comb",
            dataTextField:"ComboCaption",
            dataValueField:"ComboID",
            filter:"contains",
            autoBind:false,
            minLength:"<%=minLength%>",
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
                    combobox.dataSource.query();
                    combobox.refresh();
                    combobox.close();
                    combobox.open();
                }
                if(typeof(callback_change_${name})=="function"){
                	callback_change_${name}(e);
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
            if (window["called_${name}"]) {
                return;
            } else {
                window["called_${name}"] = true;
            }
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
                    combobox.dataSource.data([
                        {ComboCaption:a, ComboID:a2}
                    ]);
                    combobox.dataSource.query();
                    combobox.select(combobox.ul.children().eq(0));
                }
            }
        }
    });
</script>