<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@ page import="com.artonis.core.base.core.Date" %>

<div style="margin-bottom: 5px;">
    <input type="hidden" id="followUpDateVal">
    <span>Date: </span>
    <input type="text" id="followUpDate" value="" />
</div>

<div class="uk-width-1-1" id="followUp-kanban-static" style="z-index:-1; height:100%">
    <textarea rows="5" name="p-followUp" id="p-followUp" style="overflow-y: auto;overflow-x:auto; width: 100%; width:100% !important; height:100%; direction: ltr; text-align: left"  >&nbsp;</textarea>
</div>

<div id="dialog-followUpDatePicker" title='Select Date' style="display:none; direction: ltr; height: 100% !important;">
    <form class="toPopup" style="direction: ltr">
        <table align="center" width="100%" style="margin-top: 20px;">
            <tr>
                <td>
                    <div>
                        <input type="hidden" id="yearValue">
                        <label>Year: </label>
                        <select id="yearCombobox" style="width: 80px; padding: 2px; border-radius: 4px;"></select>
                    </div>
                </td>
                <td>
                    <div>
                        <input type="hidden" id="monthValue">
                        <label>Month: </label>
                        <select id="monthCombobox" style="padding: 2px; border-radius: 4px;">
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

<script type="text/javascript">
    $(function(){
        initFollowUpAutocomplate();
    });

    function initFollowUpAutocomplate(){
        $("#p-followUp").textcomplete([{
            match: /(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
            search: function (term, callback) {
                Common.postJSON("${pageContext.request.contextPath}"+"/clinic/patient/visitMobileBase/followUpAutoComplete/" , JSON.stringify({token: term}), function(data){
                    var tokens = [];
                    tokens.push(term);
                    for(var i = 0; i< data.length; i++)
                        tokens.push(data[i].token);
                    callback(tokens);
                });
            },
            replace: function (word) {
                return '$1' + word + ' ';
            }
        }]);
    }

    $(document).ready(function() {
        $("#dialog-followUpDatePicker").dialog({
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
                    makeFollowUpDate();
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
        $("#followUpDate").click(function(){
            $("#yearCombobox").val($("#yearValue").val());
            $("#monthCombobox").val($("#monthValue").val());
            $("#dialog-followUpDatePicker").dialog("open");
        });
        //
        fillYearCombo();
        //
        checkForLoadYearAndMonth();
    });

    function fillYearCombo(){
        for (var i = 1390; i<=1450 ; i++) {
            $("#yearCombobox").append("<option>" + i + "</option>");
        }
    }

    function makeFollowUpDate(){
        var year = $("#yearCombobox").val();
        var month = $("#monthCombobox").val();
        if ($.isNumeric(year) && $.isNumeric(month)) {
            $("#yearValue").val(year);
            $("#monthValue").val(month);
            //
            $("#followUpDate").val($("#monthCombobox option:selected").text() + " " + year);
        }
    }

    function checkForLoadYearAndMonth(){
        var year;
        var month;
        if ($("#followUpDateVal").val() != undefined && $("#followUpDateVal").val() != "" && $("#followUpDateVal").val().trim().length > 0) {
            year = parseInt($("#followUpDateVal").val().split("-")[0]);
            month = parseInt($("#followUpDateVal").val().split("-")[1]);
        } else {
            var currDate = "<%=new Date(System.currentTimeMillis()).toString()%>";
            year = parseInt(currDate.split("/")[0]);
            month = parseInt(currDate.split("/")[1]);
        }
        $("#yearValue").val(year);
        $("#monthValue").val(month);
        $("#yearCombobox").val(year);
        $("#monthCombobox").val(month);
    }
</script>