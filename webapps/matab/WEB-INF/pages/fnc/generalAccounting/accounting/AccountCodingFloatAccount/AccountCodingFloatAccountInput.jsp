<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
    String basePath = new UrlPathHelper().getOriginatingRequestUri(request);

    if(basePath.indexOf("/create")>-1){
        basePath=basePath.substring(0,basePath.indexOf("/create"));
    }else if(basePath.indexOf("/edit")>-1){
        basePath=basePath.substring(0,basePath.indexOf("/edit"));
    }
    String comboLoaderAccount=basePath+"/combo/loadAllAccountCoding";
    String comboLoaderFloatAccount=basePath+"/combo/loadAllFloatAccount";
    String gridRead=basePath+"/grid-read";
//    request.setAttribute("basePath",basePath);

%>

<base:pageHeader/>
<base:pageInputHeader/>
<c:url value='<%=basePath%>' var="transportReadUrl"/>
<div class="uk-container uk-container-center my-uk-container" >

    <form class="uk-form" id="mainForm">
        <input type="hidden" id="id" name="id" >
        <%--<input type="hidden" id="floatDetailAccountIdCommaSep" name="floatDetailAccountIdCommaSep" >--%>
        <%--<input type="hidden" id="previousFloatDetailAccountCommaSep" name="previousFloatDetailAccountCommaSep" >--%>

        <div class="uk-grid uk-grid-preserve">

            <base:comboBoxAutoComplete name="account_id" key="fnc.generalAccounting.accounting.name" comboLoaderUrl="<%=comboLoaderAccount%>" dataTextField="nameCode" dataValueField="id" minLength="0"
                    hasTemplate="true" headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code" templateComaSep="name,code"/>
            <base:comboBoxAutoComplete name="floatDetailAccount_id" key="fnc.generalAccounting.accounting.detail.float" comboLoaderUrl="<%=comboLoaderFloatAccount%>" dataTextField="nameCode" dataValueField="id" minLength="0"
                                       hasTemplate="true" headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code" templateComaSep="name,code"/>
        </div>

        <div class="k-rtl uk-grid uk-grid-preserve" >
            <%--<base:checkBoxTree outputResultTag="floatDetailAccountIdCommaSep" previousResultTag="previousFloatDetailAccountCommaSep"--%>
                               <%--name="aaa"  key="clinic.visit.labTestNames" dataLoaderController="treeview/loadFloatDetailAccount" loadOnDemand="false"/>--%>
        </div>
    </form>

    <div style=" width: 100%; height: 100%;">
        <base:my-grid name="grid" transportReadUrl="<%=gridRead%>" selectable="single" isPopup="true">
            <base:my-grid-column title='fnc.generalAccounting.accounting.group.name' field="accountName" width="50px"/>
            <base:my-grid-column title='fnc.generalAccounting.accounting.group.code' field="accountCode" width="50px"/>
            <base:my-grid-column title='fnc.generalAccounting.accounting.detail.float.name' field="floatAccountName" width="50px"/>
            <base:my-grid-column title='fnc.generalAccounting.accounting.detail.float.code' field="floatAccountCode" width="50px"/>
            <base:my-grid-function text="action.delete" functionClick="_grid_onDelete"  name="delete"/>


            <base:my-grid-schema-field name="accountName" type="string"/>
            <base:my-grid-schema-field name="accountCode" type="string"/>
            <base:my-grid-schema-field name="floatAccountName" type="string"/>
            <base:my-grid-schema-field name="floatAccountCode" type="string"/>


        </base:my-grid>

    </div>
</div>

<script>


    function callback_save_success(){

        $("#grid").data("kendoGrid").dataSource.read();
    }
/*
    function callback_close_account_id(e){
//        $("#aaa").data("kendoTreeView").expand(".k-item");
//        $("#aaa").data("kendoTreeView").options.checkboxes.checkChildren=false;
        $.getJSON(getBaseUrl() + 'loadByAccountId/' + e.sender._old, function(data) {
            $("#0").click();
            if($("#floatDetailAccountIdCommaSep").val().length>0){
                var splitArray=  $("#floatDetailAccountIdCommaSep").val().split(',');
                for(var i= 0;i<splitArray.length;i++){
//                     $("#" + splitArray[i]).prop('checked', true);
                    if($("#" + splitArray[i]).prop('checked')==true){
                        $("#" + splitArray[i]).click();
                    }

                }
            }
            jQuery.each(data, function(name, val){
                var $el = $('[name="'+name+'"]'),
                        type = $el.attr('type');

                switch(type){
                    case 'checkbox':
                        $el.prop('checked', val);
                        break;
                    case 'radio':
                        $el.filter('[value="'+val+'"]').attr('checked', 'checked');
                        break;
                    default:
                        $el.val(val);
                }
            });

            if($("#previousFloatDetailAccountCommaSep").val().length>0){
                var splitArray=  $("#previousFloatDetailAccountCommaSep").val().split(',');
                for(var i= 0;i<splitArray.length;i++){
//                     $("#" + splitArray[i]).prop('checked', true);
                    if($("#" + splitArray[i]).prop('checked')==false){
                        $("#" + splitArray[i]).click();
                    }

                }
            }else if($("#floatDetailAccountIdCommaSep").val().length>0){


            }
            $('#mainForm').deserialize(data);
//            $("#aaa").data("kendoTreeView").options.checkboxes.checkChildren=true;

        });
    }
*/
    /*function callback_deserialize(){
        if($("#floatDetailAccountIdCommaSep").val().length>0){
            var splitArray=  $("#floatDetailAccountIdCommaSep").val().split(',');
            for(var i= 0;i<splitArray.length;i++){
//                     $("#" + splitArray[i]).prop('checked', true);
                if($("#" + splitArray[i]).prop('checked')==true){
                    $("#" + splitArray[i]).click();
                }

            }
        }
    }
*/
</script>


