<%@page import="java.io.File"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
    function cancel_doctorId_Callback(){
        $("#item-modals-doctorId").dialog('close');
    }

    function success_save_Callback(){
        $("#item-modals-doctorId").dialog('close');
        var combobox = $("#doctorId_Comb").data("kendoComboBox");
        combobox.dataSource.query();
        combobox.refresh();
    }

    function success_save_doctorId_Callback(){
        $("#item-modals-doctorId").dialog('close');
        var combobox = $("#doctorId_Comb").data("kendoComboBox");
        combobox.dataSource.query();
        combobox.refresh();
        combobox.select(0);
    }

    function save_doctorId_url(){
        <%--taghir return '<%=saveUrl%>';--%>
    }

    function _doctorId_change(){
        if($("#doctorId_Comb").val().length==0){
            $("#doctorId").val("");
        }
    }
    function _doctorId_close(e){
        $("#doctorId").val(e.sender._old);
        if(typeof(callback_close_doctorId) == "function"){
            callback_close_doctorId(e);
        }
    }
    function _doctorId_dataBound(e){
        if(typeof(callback_dataBound_doctorId) == "function"){
            callback_dataBound_doctorId(e);
        }
    }
    function _doctorId_open(e){
        if(typeof(callback_open_doctorId) == "function"){
            callback_open_doctorId(e);
        }
    }

    $(document).ready(function() {
        /*var doctorId_val = $("#doctorId");

        doctorId_val.data("value", doctorId_val.val());

        setInterval(function() {
            var data = doctorId_val.data("value"),
                    val = doctorId_val.val();

            if (data !== val) {
                doctorId_val.data("value", val);
                if(val==""){
                    $("#doctorId_Comb").data("kendoComboBox").text('');
                }
            }
        }, 100);

        var combobox = $("#doctorId_Comb").data("kendoComboBox");
        combobox.input.bind("keydown", function(e) {
            if (e.keyCode == 40) {
                combobox.open();
            }
        });*/

        $("#button-doctorId-new").click(function () {
            var add = $.get(getBaseUrl()+"popup/doctorInput",
                    function (data) {
                        $("#item-modals-doctorId").empty();
                        $("#item-modals-doctorId").append('<div id="modals-doctorId"/>');
                        $("#modals-doctorId").append(data);
                        $("#item-modals-doctorId").dialog('open');
                    }).fail(function (result) {
                        if (result.status == 401) {
                            window.location.href = "";
                        }
                    });
        });

        $("#item-modals-doctorId").dialog({
            modal : true,
            autoOpen: false,
            maxHeight: true,
            maxWidth: true,
            width: 1200,
            zIndex:10000,
            close: function( event, ui ) {
                $("#item-modals-doctorId").empty();
            }
        });

    });

    function _doctorId_select_element(e) {
        console.log(e);
        var item = e.item;
        var dataItem = this.dataItem(e.item.index());
        $("#doctorId").val(dataItem.id);
        if(typeof(callback_select_element_doctorId) == "function"){
            callback_select_element_doctorId(dataItem.id);
        }
    }

    function _doctorId_reset(){
        $("#doctorId").value='';
        $("#${value}").value='';
    }

    /*window["bindToEntityById_after__doctorId_Comb"] = function () {
        if ($("#doctorId").val() == "") {
        } else {
            if ("${isListConstant}" == 'true') {
                var a2 = $("#doctorId").val();
                var combobox = $("#doctorId_Comb").data("kendoComboBox");
                combobox.dataSource.read();
                combobox.refresh();
                combobox.select(function (dataItem) {
                    return dataItem.ComboID == a2;
                });
                combobox.value(a2);

            } else {
                var combobox = $("#doctorId_Comb").data("kendoComboBox");

                var a2 = $("#doctorId").val();
                var a = $("#${value}").val();
                combobox.dataSource.data([
                    {"fullName":a, "id":a2}
                ]);
                combobox.dataSource.read({
                    filter: { field: "id", operator: "eq", value: a2 },
                    page : 1,
                    pageSize : 1
                });
                combobox.select(combobox.ul.children().eq(0));
            }
        }
    }*/

</script>