<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@tag import="java.util.ResourceBundle"%>
<%@tag import="org.springframework.web.util.UrlPathHelper"%>
<%@ tag import="java.util.List" %>
<%@ tag import="java.util.ArrayList" %>

<%--<%@ attribute name="formItemTabInputs" required="true" rtexprvalue="true"%>--%>
<%@ attribute name="formItemTabViewJspFiles" required="true" rtexprvalue="true"%>
<%@ attribute name="titleKeys" required="true" rtexprvalue="true"%>
<%@ attribute name="masterIdStr" required="true" rtexprvalue="true"%>
<%@ attribute name="isPopup" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%--<%@ attribute name="popupUrl" required="false" rtexprvalue="true"  %>--%>
<%
    if(isPopup==null){
        isPopup=false;
    }
    String basePath = new UrlPathHelper().getOriginatingRequestUri(request).replace("create", "");
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
//    int pos = basePath.indexOf("/edit/");
//    if(pos < 0){
//
//        pos = basePath.length();
//    }
    if (basePath.indexOf("/create") > -1) {
        basePath = basePath.substring(0, basePath.indexOf("/create"));
    } else if (basePath.indexOf("/edit") > -1) {
        basePath = basePath.substring(0, basePath.indexOf("/edit"));
    }
    String comboLoaderAccount = basePath + "/combo/loadAllAccount";


//    String[] formItemTabInputArray = formItemTabInputs.split(",");

    String[] formItemTabViewJspFileArray = formItemTabViewJspFiles.split(",");
    String[] titleKeyArray = titleKeys.split(",");
//    String comboLoaderUrl=basePath.substring(0,pos)+"/popup/grid-read";
%>

<script type="text/javascript">
    var basePath = "<%=basePath%>/";
    var masterIdStr = "${masterIdStr}";
    var isPopup = "<%=isPopup%>";

    <%--var popupUrl = "${popupUrl}";--%>
</script>
<jsp:doBody />
<%--

<%for(MyColumnTag col : cols) {%>
<kendo:grid-column title='<%=col.getTitle() %>'  field="<%=col.getField() %>" width="<%=col.getWidth() %>"/>
<%} %>

--%>
<div class="" style="margin-top: 20px;">
    <ul class="uk-tab" data-uk-tab data-uk-switcher="{connect:'#pattern2-tabs'}">
        <%int i=0 ;%>
        <%for (String titleKey: titleKeyArray){%>
        <%if(i==0){%>
        <li class="uk-active"><a href=""><%=resource.getString(titleKey)%></a></li>
        <%}else{%>
        <li><a href=""><%=resource.getString(titleKey)%></a></li>
        <%}i++;%>
        <%}%>
        <%--<li class="uk-active"><a href=""><%=resource.getString(titleKey)%></a></li>--%>
        <%--<li><a href=""><%=resource.getString(titleKey)%></a></li>--%>
    </ul>
    <ul id="pattern2-tabs" class="uk-switcher">
        <%int j=0;%>
        <%for (String formItemTabView: formItemTabViewJspFileArray){%>
        <li>
            <div class="uk-containerX">
                <div class="body-header" style="padding-top: 10px;">
                    <div class="uk-grid uk-grid-preserve k-rtl">

                        <base:comboBoxAutoComplete-buttonAddToCombo name="account_id" key="fnc.generalAccounting.accounting.code"
                                                                    comboLoaderUrl="<%=comboLoaderAccount%>" dataTextField="nameCode" popupUrlIsRelative="false"
                                                                    dataValueField="id" minLength="0"
                                                                    hasTemplate="true"
                                                                    styleClass="larg"
                                                                    headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
                                                                    templateComaSep="name,code" popupUrl="${pageContext.request.contextPath}/fnc/generalAccounting/accounting/accountOwners/popup/treeAccount"/>
                        <base:button id="button-select" key="action.select" styleClass="" stylediv="width: 10%;" style="width: 100%;"/>
                    </div>
                </div>
                <%--<jsp:include page="${formItemTabViewJspFile}.jsp"></jsp:include>--%>
                <jsp:include page="<%=formItemTabViewJspFileArray[j]%>"></jsp:include>
            </div>
        </li>
        <%j++;}%>

    </ul>
</div>
<script type="text/javascript">

    $(function(){
        <%--$("button[data-popup='true']").click(function(){--%>
            <%--var tab = $(this).attr("data-tab"),--%>
                    <%--action = $(this).attr("data-action"),--%>
                    <%--modalElem = $("#" + tab + action)--%>
                    <%--;--%>

            <%--if(modalElem.length > 0){--%>
                <%--openPopup(tab + action, tab);--%>
                <%--afterBind();--%>
            <%--}else{--%>
                <%--if(isPopup=='true'){--%>
                    <%--$.get(popupUrl, function (data) {--%>
                        <%--$("#item-modals-${name}").empty();--%>
                        <%--$("#item-modals-${name}").append('<div id="' + tab + action + '" class="uk-modal">');--%>
                        <%--$("#" + tab + action).append(data);--%>
                        <%--openPopup(tab + action, tab);--%>

                    <%--});--%>
                <%--}else{--%>
                    <%--$.get(basePath + "item/" + tab, function (data) {--%>
                        <%--$("#item-modals-${name}").empty();--%>
                        <%--$("#item-modals-${name}").append('<div id="' + tab + action + '" class="uk-modal">');--%>
                        <%--$("#" + tab + action).append(data);--%>
                        <%--openPopup(tab + action, tab);--%>
                        <%--afterBind();--%>
                    <%--});--%>
                <%--}--%>
            <%--}--%>
        <%--});--%>

        <%--$("#button-add").click(function () {--%>
           <%--var add= $.get("${pageContext.request.contextPath}/thinkRoom/sessionManagement/thinkRoomSession/createpopup", function (data) {--%>
                <%--$("#item-modals-member-view").empty();--%>
                <%--$("#item-modals-member-view").append('<div id="memberview">');--%>
                <%--$("#memberview").append(data);--%>
                <%--$("#item-modals-member-view").dialog('open');--%>
                <%--afterBind();--%>
            <%--}).fail(function(result){--%>
               <%--if(result.status==401){--%>
                    <%--window.location.href=getBaseUrl();--%>
               <%--}--%>
            <%--});--%>

        <%--});--%>

        <%--$("#item-modals-member-view").dialog({--%>
            <%--modal : true,--%>
            <%--autoOpen: false,--%>
<%--//        closeOnEscape: true ,--%>
<%--//        dialogClass: 'captcha',--%>
<%--//        show: 'explode',--%>
<%--//        hide: 'explode',--%>
            <%--maxHeight: true,--%>
            <%--maxWidth: true,--%>
            <%--position: 'center',--%>
            <%--width: 800,--%>
            <%--zIndex:10000,--%>
            <%--close: function( event, ui ) {--%>
<%--//                $("#grid").data("kendoGrid").dataSource.read();--%>
                <%--$("#item-modals-member-view").empty();--%>

            <%--}--%>

        <%--});--%>

        $("#button-select").click(function () {
            var tmp = {};
            if(document.getElementById("id").value!=''){
                document.getElementById("loadedId").value=document.getElementById("id").value;
            }
            tmp[masterIdStr]=document.getElementById("loadedId").value;
            if($("#account_id_Comb").val().length!=0){
//                if($("#account_id_Comb").val().indexOf('group')>-1){
//                    var account_id=$("#account_id_Comb").val().substring(0,$("#account_id_Comb").val().indexOf('group'));
//                }
                tmp["account_id"]=$("#account_id_Comb").val();
            }
            jQuery.ajax ({
                url: basePath + "save/AccountOwnersItem",
                type: "POST",
                data: JSON.stringify(tmp),
                dataType: "json",
                context: $(this),
                contentType: "application/json; charset=utf-8",
                async :false,
                success: function(result){
                    if(result.state == "error"){
                        for(var i=0; i<result.errors.length; i++){
                            alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                        }
                    }
                    if(result.state == "success"){
                        alertify.success(result.message);

                        var urlGrid=$("#AccountOwnersItem").data("kendoGrid").dataSource.transport.options.read.url;
                        var indexnumber=urlGrid.valueOf().lastIndexOf("/");
                        var subUrlGrid=urlGrid.valueOf().substring(0,indexnumber);
//                                    urlGrid=subUrlGrid.valueOf()+"/"+document.getElementById("id").value;
                        urlGrid=subUrlGrid.valueOf()+"/"+document.getElementById("loadedId").value;
                        $("#AccountOwnersItem").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
                        $("#AccountOwnersItem").data("kendoGrid").dataSource.read();

                    }
                },
                error:function(result){
                    if(result.status==401){
                        window.location.href=getBaseUrl();
                    }
                }

            });
        });



        <%--function openPopup(id, tab){--%>
            <%--if(document.getElementById("id").value!=''){--%>
                <%--document.getElementById("loadedId").value=document.getElementById("id").value;--%>
            <%--}--%>
            <%--var modal = new $.UIkit.modal.Modal("#" + id);--%>
            <%--$("#" + id).on(--%>
                    <%--{--%>
                        <%--'uk.modal.hide': function(){--%>
                            <%--$("#item-modals-${name}").empty();--%>
                            <%--if(isPopup){--%>
                                <%--var itemName = tab.replace("TabInput", "")--%>
                                <%--var urlGrid=$("#" + itemName).data("kendoGrid").dataSource.transport.options.read.url;--%>
                                <%--var indexnumber=urlGrid.valueOf().lastIndexOf("/");--%>
                                <%--var subUrlGrid=urlGrid.valueOf().substring(0,indexnumber);--%>
<%--//                                    urlGrid=subUrlGrid.valueOf()+"/"+document.getElementById("id").value;--%>
                                <%--urlGrid=subUrlGrid.valueOf()+"/"+document.getElementById("loadedId").value;--%>
                                <%--$("#"   + itemName).data("kendoGrid").dataSource.transport.options.read.url=urlGrid;--%>
                                <%--$("#" + itemName).data("kendoGrid").dataSource.read();--%>
                                <%--afterHidePopup();--%>
                            <%--}--%>
                        <%--}--%>
                    <%--}--%>
            <%--);--%>
            <%--$('button[data-action="save"]', $("#" + id)).unbind("click").click(function(){--%>
                <%--var form = $("form", $("#" + id)),--%>
                        <%--tmp = {},--%>
                        <%--itemName = tab.replace("TabInput", "")--%>
                        <%--;--%>
                <%--$("input[role='combobox']").attr("disabled", "disabled");--%>
                <%--$("input[data-ignore='true']").attr("disabled", "disabled");--%>
                <%--$(form.serializeArray()).each(function(){--%>
                    <%--tmp[this.name] = this.value;--%>
                <%--});--%>
                <%--$("input[role='combobox']").removeAttr("disabled");--%>
                <%--$("input[data-ignore='true']").removeAttr("disabled");--%>
<%--//					tmp['factor_id']=document.getElementById("loadedId").value;--%>
                <%--tmp[masterIdStr]=document.getElementById("loadedId").value;--%>
                <%--jQuery.ajax ({--%>
                    <%--url: basePath + "save/" + itemName,--%>
                    <%--type: "POST",--%>
                    <%--data: JSON.stringify(tmp),--%>
                    <%--dataType: "json",--%>
                    <%--contentType: "application/json; charset=utf-8",--%>
                    <%--success: function(result){--%>
                        <%--if(result.state == "error"){--%>
                            <%--for(var i=0; i<result.errors.length; i++){--%>
                                <%--alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);--%>
                            <%--}--%>
                        <%--}--%>
                        <%--if(result.state == "success"){--%>
                            <%--alertify.success(result.message);--%>
                            <%--var urlGrid=$("#" + itemName).data("kendoGrid").dataSource.transport.options.read.url;--%>
                            <%--var indexnumber=urlGrid.valueOf().lastIndexOf("/");--%>
                            <%--var subUrlGrid=urlGrid.valueOf().substring(0,indexnumber);--%>
                            <%--urlGrid=subUrlGrid.valueOf()+"/"+loadedId.value;--%>
                            <%--$("#" + itemName).data("kendoGrid").dataSource.transport.options.read.url=urlGrid;--%>
                            <%--$("#" + itemName).data("kendoGrid").dataSource.read();--%>
                            <%--modal.hide();--%>
                        <%--}--%>
                    <%--}--%>
                <%--});--%>
            <%--});--%>
            <%--modal.show();--%>
        <%--}--%>

        <%--function afterBind(){--%>
            <%--var arra=Object.keys(window);--%>
            <%--for (var i = 0; i < arra.length; i++){--%>
                <%--if (typeof(window[arra[i]]) === "function" && arra[i].indexOf('bindToEntityById_after')>-1){--%>
                    <%--window[arra[i]]();--%>
                <%--}--%>
            <%--}--%>
        <%--}--%>


    });

//    function closeCallback(){
//        $("#item-modals-member-view").dialog('close');
//    }


</script>
<%--<div id="item-modals-${name}" >--%>

<%--</div>--%>
<%--<div id="item-modals-member-view" />--%>