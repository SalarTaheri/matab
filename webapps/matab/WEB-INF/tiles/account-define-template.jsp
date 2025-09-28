<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@ page import="com.artonis.core.system.authentication.service.util.AuthenticationServiceUtil" %>
<%@ page import="com.artonis.fnc.core.model.FinanceYear" %>
<%@ page import="com.artonis.clinic.core.service.util.ClinicCoreServiceUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@include file="/WEB-INF/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html >
<head>
    <title>${pageTitle}</title>
    <meta charset='utf-8'>
    <script src="<c:url value='/resources/js/jquery.min.js' />"></script>
    <%--<script src="<c:url value='/resources/js/jquery-1.4.2.js' />"></script>--%>
    <script src="<c:url value='/resources/js/jquery-ui.js' />"></script>
    <link href="<c:url value='/resources/css/web/kendo.common.min.css'/>" 	rel="stylesheet" />
    <link href="<c:url value='/resources/css/web/kendo.default.min.css'/>" rel="stylesheet" id="kendo_style" />
    <link href="<c:url value='/resources/css/web/kendo.rtl.min.css'/>" 	rel="stylesheet" />
    <link href="<c:url value='/resources/css/dataviz/kendo.dataviz.default.min.css'/>" 	rel="stylesheet" />
    <link href="<c:url value='/resources/uikit/css/uikit.gradient.min.rtl.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/main.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/alterify/css/alertify.core.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/alterify/css/alertify.bootstrap.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/chosen/chosen.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/jqueryui/jquery-ui-1.10.3/themes/ui-lightness/jquery-ui-1.10.3.custom.min.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/js/lou-multi-select/multi-select.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/persianDatepicker-master/css/persianDatepicker-default.css'/>" rel="stylesheet" />

    <script src="<c:url value='/resources/js/kendo.all.min.js' />"></script>
    <script src="<c:url value='/resources/js/cultures/kendo.culture.fa-IR.js' />"></script>
    <script src="<c:url value='/resources/js/jquery.ui.datepicker.fa.js' />"></script>
    <script src="<c:url value='/resources/alterify/js/alertify.js' />"></script>
    <script src="<c:url value='/resources/uikit/js/uikit.min.js' />"></script>
    <script src="<c:url value='/resources/jquery.deserialize.js' />"></script>
    <script src="<c:url value='/resources/js/jquery.sticky.js' />"></script>
    <script src="<c:url value='/resources/js/jquery.alphanum.js' />"></script>
    <script src="<c:url value='/resources/chosen/chosen.jquery.min.js' />"></script>
    <script src="<c:url value='/resources/common.js' />"></script>
    <script src="<c:url value='/resources/js/lou-multi-select/jquery.multi-select.js' />"></script>
    <script src="<c:url value='/resources/persianDatepicker-master/js/persianDatepicker.js'/>"></script>



</head>


<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String cancelUrl=request.getHeader("referer");
    request.setAttribute("cancelUrl", cancelUrl);
    String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
    request.setAttribute("basePath", basePath);
    String createUrl="";
    if(basePath.contains("/edit/group/")){
        String id = basePath.substring(basePath.indexOf("/edit/group/") + "/edit/group/".length());
        int idInt=-1;
        try {
             idInt = Integer.parseInt(id);
        } catch (NumberFormatException e) {
//            e.printStackTrace();
        }
        if(idInt>-1){
            createUrl=basePath.substring(0,basePath.indexOf("/edit/group/"));
            createUrl+="/create/group/"+idInt;
        }
    }else if(basePath.contains("/edit/accountCoding/")){
        String id = basePath.substring(basePath.indexOf("/edit/accountCoding/") + "/edit/accountCoding/".length());
        int idInt=-1;
        try {
            idInt = Integer.parseInt(id);
        } catch (NumberFormatException e) {
//            e.printStackTrace();
        }
        if(idInt>-1){
            createUrl=basePath.substring(0,basePath.indexOf("/edit/accountCoding/"));
            createUrl+="/create/accountCoding/"+idInt;
        }

    }else if(basePath.contains("/edit/floatAccount/")){
        String id = basePath.substring(basePath.indexOf("/edit/floatAccount/") + "/edit/floatAccount/".length());
        int idInt=-1;
        try {
            idInt = Integer.parseInt(id);
        } catch (NumberFormatException e) {
//            e.printStackTrace();
        }
        if(idInt>-1){
            createUrl=basePath.substring(0,basePath.indexOf("/edit/floatAccount/"));
            createUrl+="/create/floatAccount/"+idInt;
        }

    }else{
        createUrl = basePath + "create";
    }
    
	
    String isEditForFloatDetailTxt = (String) request.getAttribute("isEditForFloatDetail");
    boolean isEditForFloatDetail = false;
    if(isEditForFloatDetailTxt != null)
    	isEditForFloatDetail = Boolean.parseBoolean(isEditForFloatDetailTxt);

    String isEditForAccountTxt = (String) request.getAttribute("isEditForAccount");
    boolean isEditForAccount = false;
    if(isEditForAccountTxt != null)
    	isEditForAccount = Boolean.parseBoolean(isEditForAccountTxt);
    
    String isEditForGroupTxt = (String) request.getAttribute("isEditForGroup");
    boolean isEditForGroup = false;
    if(isEditForGroupTxt != null)
    	isEditForGroup = Boolean.parseBoolean(isEditForGroupTxt);
    
%>

<c:set var="createUrl" value="<%=createUrl %>" />

<script type="text/javascript">
    var basePath = "${basePath}";
    var cancelUrl = "${cancelUrl}";
    var isEditForFloatDetail=false;
</script>

<c:if test="${bindToEntity}">
    <script type="text/javascript">
        var bindToEntity = ${bindToEntity};
        var entityId = "${entityId}";
    </script>
</c:if>
<c:choose>
    <c:when test="<%=isEditForGroup%>">
        <script type="text/javascript">
            var isEditForGroup = <%=isEditForGroup%>;
        </script>
    </c:when>
    <c:when test="${not isEditForGroup}">
        <script type="text/javascript">
            var isEditForGroup = <%=isEditForGroup%>;
        </script>
    </c:when>
</c:choose>
<c:choose>
    <c:when test="<%=isEditForAccount%>">
        <script type="text/javascript">
            var isEditForAccount = <%=isEditForAccount%>;
        </script>
    </c:when>
    <c:when test="${not isEditForAccount}">
        <script type="text/javascript">
            var isEditForAccount = <%=isEditForAccount%>;
        </script>
    </c:when>
</c:choose>
<c:choose>
    <c:when test="<%=isEditForFloatDetail%>">
        <script type="text/javascript">
             isEditForFloatDetail = <%=isEditForFloatDetail%>;
        </script>
    </c:when>
    <c:when test="${not isEditForFloatDetail}">
        <script type="text/javascript">
             isEditForFloatDetail = <%=isEditForFloatDetail%>;
        </script>
    </c:when>
</c:choose>


<body dir="rtl">
<%--<div id="header">--%>
    <%--<div class="k-rtl">--%>
        <%--<ul id="menu">--%>
            <%--<%=GlobalVariable.getMenu() %>--%>
            <%--<p id="demo" dir="ltr"></p>--%>
        <%--</ul>--%>

    <%--</div>--%>
<%--</div>--%>
<body dir="rtl">
<div id="header">
    <div class="k-rtl">
        <ul id="menu" style="height: 30px !important">
            <%=GlobalVariable.getMenu() %>
            <li>
                <%--<%=GlobalVariable.getUser().getUserName()%>--%>
                <%=GlobalVariable.getEmployee().getFullName()%>
                <ul style="width: 220px">
                    <li style="width: 100%" class="k-item k-state-default k-first k-last k-state-hover">
                        <div id="template" style="padding: 10px; width: inherit;background-color: gray">
                            <table border="2" width="100%">
                                <tr>
                                    <td width="20">
                                        <a class="uk-button uk-button-success" style="width: 100%" href="" >صندوق نامه (0) </a>
                                        <br>
                                        <br>
                                        <br>
                                        <a href="#" class="uk-button uk-button-success" style="width: 100%" id="changePassLink" href="" >تغییر کلمه عبور</a>
                                        <br>
                                        <br>
                                        <br>
                                        <a class="uk-button uk-button-danger" href="j_spring_security_logout" style="width: 100%">خروج</a>
                                    </td>

                                    <td width="80" align="center">
                                        <table>
                                            <tr>
                                                <td style="text-align: center;">
                                                    <img src="/prjResource/employeePic/<%=GlobalVariable.getEmployee().getPersonnelCode()%>.jpg" style="width: 100%" alt="" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <h1><%=GlobalVariable.getUser().getUserName()%></h1>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                <tr>
                                </tr>
                            </table>
                        </div>
                    </li>
                </ul>
            </li>
            <%if(AuthenticationServiceUtil.canCurrentUserSeeFinanceYearMenu()){%>
            <li>
                <%=resource.getString("global.menu.financeYear")%>
                <ul style="width: 220px">
                    <li>
                        <div id="template" style="padding: 10px; width: inherit">
                            <form action="">
                                <table border="2" style="width: 200px">
                                    <tr>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <h2> <b><%=resource.getString("global.menu.activeFinanceYear")%></b></h2>
                                                    </td>
                                                </tr>
                                                <%
                                                    List<FinanceYear> financeYears = ClinicCoreServiceUtil.loadAllFinanceYear();
                                                    boolean permission = GlobalVariable.getButtonContainer("006002001","financeYear-menuPopup-changePermission");
                                                    if(permission){
                                                        for (FinanceYear financeYear : financeYears) {
                                                            String checked = financeYear.getState()==1 ? "checked" : "";
                                                %>
                                                <tr>
                                                    <td>
                                                        <h2>
                                                            <input type="radio" name="activeFinanceYearMenu" value="<%=financeYear.getId()%>" <%=checked%> onclick="handleClick(this)">
                                                            <%=financeYear.getName()%>
                                                            </input>
                                                        </h2>
                                                    </td>
                                                </tr>
                                                <%
                                                    }
                                                }else{
                                                    for (FinanceYear financeYear : financeYears) {
                                                        if(financeYear.getState() == 1){
                                                %>
                                                <tr>
                                                    <td>
                                                        <h2>
                                                            &nbsp <%=financeYear.getName()%>
                                                        </h2>
                                                    </td>
                                                </tr>
                                                <%
                                                            }
                                                        }
                                                    }
                                                %>
                                            </table>

                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </li>
                </ul>
            </li>
            <%}%>
            <div dir="ltr" style="margin-top: 6px; margin-left: 2px;">
                <section>
                    <span class="softwareVersionNumber" style="font-size: x-small !important;">Ver. <%=ResourceBoundleHolder.config.getString("system.versionNumber") %></span>
                    <span> &nbsp; - &nbsp; </span>
                    <span class="curDate" id="demo" dir="ltr"></span>
                </section>
            </div>
        </ul>
    </div>
</div>
<div id="body-t" style="width:  100%;height:  100%;">
    <table  id="body-table1" height="100%" width="100%" >
        <tr height="100%" width="100%">
            <td id="body-side-left"  height="100%" width="100%">
                <div id="changePassWND" title="تغییر کلمه عبور" style="display: none" >
                    <table >
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <label for="oldPassword"><%=ResourceBoundleHolder.resourceBundle.getString("login.oldPassword")%></label>
                                        </td>
                                        <td>
                                            <input style="direction: ltr" type="password" id="oldPassword" name="oldPassword" class="uk-width-1-1">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="newPassword"><%=ResourceBoundleHolder.resourceBundle.getString("login.newPassword")%></label>

                                        </td>
                                        <td>
                                            <input style="direction: ltr" type="password" id="newPassword" name="newPassword" class="uk-width-1-1">
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="confirmPassword"><%=ResourceBoundleHolder.resourceBundle.getString("login.confirmPassword")%></label>
                                        </td>
                                        <td>
                                            <input style="direction: ltr" type="password" id="confirmPassword" name="confirmPassword" class="uk-width-1-1">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr >
                            <td align="center" style="padding-top: 10px;">
                                <button class="uk-button uk-button-success" id="confirmChangePassBTN" type="button">
                                    <%=resource.getString("global.crud.confirm")%>
                                </button>
                                <a href="" class="uk-button uk-button-danger" id="cancelChangePassBTN"><%=resource.getString("global.crud.cancel")%></a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="display: flex">
                    <div style="width: 40%; ">
                        <tiles:insertAttribute name="tree"/>
                    </div>
                    <div id="body-contents" style="width: 80%; " >
                        <tiles:insertAttribute name="body" />
                    </div>
                </div>
                <%--<iframe id="myIframe" height="100%" width="100%" src="" ></iframe>--%>
            </td>
        </tr>

        <%--			<tr>--%>
        <%--				<td id="body-side-bottum" bgcolor="green" >--%>
        <%--                    aaaa--%>
        <%--				</td>--%>
        <%--			</tr>--%>
    </table>
</div>
<%--<div id="body">
    <table id="body-table">
        <tr>
            &lt;%&ndash;<td id="body-side-right">&ndash;%&gt;
                &lt;%&ndash;<div align="center">&ndash;%&gt;
                    &lt;%&ndash;<b><%=GlobalVariable.getCompany().getName() %>&ndash;%&gt;
                    &lt;%&ndash;</b>&ndash;%&gt;
                    &lt;%&ndash;<br>&ndash;%&gt;
                    &lt;%&ndash;<img src="<c:url value='/resources/images/images.jpg'/>"></img>&ndash;%&gt;
                    &lt;%&ndash;<br>&ndash;%&gt;
                    &lt;%&ndash;<b><%=GlobalVariable.getUser().getUserName() %>&ndash;%&gt;
                    &lt;%&ndash;</b>&ndash;%&gt;
                    &lt;%&ndash;<br>&ndash;%&gt;
                    &lt;%&ndash;<b><%=GlobalVariable.getEmployee().getFirstName() + " " + GlobalVariable.getEmployee().getLastName() %>&ndash;%&gt;
                    &lt;%&ndash;</b>&ndash;%&gt;
                    &lt;%&ndash;<br>&ndash;%&gt;
                    &lt;%&ndash;<!-- <b><a href="http://www.w3schools.com">Inbox(10)</a></b> -->&ndash;%&gt;
                &lt;%&ndash;</div>&ndash;%&gt;
            &lt;%&ndash;</td>&ndash;%&gt;
            <td id="body-side-left" bgcolor="white" >
            <td  style=" width: 25%; ">

                <div style=" height: 100%; ">
                    <tiles:insertAttribute name="tree"/>
                </div>

            </td>
            <td  style=" width: 75%; ">

                <div id="body-contents" style=" height: 100%; ">
                    <tiles:insertAttribute name="body"/>
                </div>

            </td>
            </td>


        </tr>
    </table>
</div>--%>

<script>
$(document).ready(function() {
    $("#changePassLink").click(function(){
        $("#changePassWND").data("kendoWindow").open();
        $("#changePassWND").data("kendoWindow").center();
        $(".k-window").addClass("newCssClassforK_window");
        $(".k-window").css("top",Math.floor(window.innerHeight/2)-200);
    });

    $("#changePassWND").kendoWindow({
        modal: true,
        title: "تغییر کلمه عبور",
        actions: [
            "Close"
        ]
    });
    $("#menu").kendoMenu({
        //animation: { open: { effects: "fadeIn" } },
//        animation: { open: { effects: "zoomIn" } },
        animation: { open: { effects: "slideIn:down" } },

        select: onSelect,
        openOnClick: false,
        closeOnClick: true
    });

    function setHeights(){
        var winHeight = $(window).height() - $("#header").height();
        $("body").css("height", winHeight);
        $("#body-content").css("height", winHeight - $(".body-header").height() - 20);
    }

    $(window).resize(function() {
        setHeights();
    });
    setHeights();

    $("#menu").sticky({topSpacing:0});
    $("#menu").css("min-width", $("#menu").width());
    $("#menu").css("z-index", 99999);

    //$(".body-header").sticky({topSpacing:35});
    //$(".body-header").css("min-width", $(".body-header").width());
    //$(".body-header").css("z-index", 2);

    $("#body-heade-create").click(function(){
        if(typeof(customFormSave) === "function"){
            customFormSave();
            return;
        }
        window.location.href = "${createUrl}";
    });

    if(window.location.href.indexOf("/create") == window.location.href.length - "/create".length){
        createMode();
        $.getJSON(basePath + 'reset/' + 0, function(data) {
            //alert("ok!?");
            $('#mainForm').deserialize(data);
            bToEntityById();
        });
    }else if(window.location.href.indexOf("/create/group/")>-1){
        createMode();
        var id=window.location.href.substr(window.location.href.lastIndexOf('/')+1,window.location.href.length)
        $.getJSON(basePath.substr(0,basePath.indexOf("/create")) + '/create/group/reset/' + id, function(data) {
            //alert("ok!?");
            $('#mainForm').deserialize(data);
            bToEntityById();
            if(typeof(call_back_bindToEntityById) == "function"){
                call_back_bindToEntityById(data);
            }
        });
    }else if(window.location.href.indexOf("/create/accountCoding/")>-1){
        createMode();
        var id=window.location.href.substr(window.location.href.lastIndexOf('/')+1,window.location.href.length)
        $.getJSON(basePath.substr(0,basePath.indexOf("/create")) + '/create/accountCoding/reset/' + id, function(data) {
            //alert("ok!?");
            $('#mainForm').deserialize(data);
            bToEntityById();
            if(typeof(call_back_bindToEntityById) == "function"){
                call_back_bindToEntityById(data);
            }
        });
    }else if(window.location.href.indexOf("/create/floatAccount/")>-1){
        createMode();
        var id=window.location.href.substr(window.location.href.lastIndexOf('/')+1,window.location.href.length)
        $.getJSON(basePath.substr(0,basePath.indexOf("/create")) + '/create/floatAccount/reset/' + id, function(data) {
            //alert("ok!?");
            $('#mainForm').deserialize(data);
            bToEntityById();
            if(typeof(call_back_bindToEntityById) == "function"){
                call_back_bindToEntityById(data);
            }
        });
    }

    if(window.location.href.indexOf("/editWP/")  > 0){
        editWPMode();
    }

    if(window.location.href.indexOf("/edit/")  > 0){
        editMode();
    }


    $("input[type='number']").numeric();


    $("#body-heade-save").click(function(){

        if(typeof(customFormSave) === "function"){
            customFormSave();
            return;
        }
        var form = $("#mainForm");
        var tmp = {};
        $("input[role='combobox']").attr("disabled", "disabled");
        $("input[data-ignore='true']").attr("disabled", "disabled");
        //$("input[role='datepicker']").attr("disabled", "disabled");
        checkBoxUncheck=jQuery('#mainForm input[type=checkbox]:not(:checked)').map(
                function() {
                    if(this.name!=""){
                        return {"name": this.name, "value": false}
                    }
                }).get();
        $(form.serializeArray()).each(function(){
//					if(this.name=="date")
//						this.value=1;
            if($("input[name='"+this.name+"']").attr('type')=='checkbox'){
                if($("input[name='"+this.name+"']").val()=='on'){
                    tmp[this.name]='true';
                }else{
                    tmp[this.name]='false';
                }
            }else{
                tmp[this.name] = this.value;
            }
        });
        for(var i=0;i<checkBoxUncheck.length;i++){
            tmp[checkBoxUncheck[i].name]=checkBoxUncheck[i].value;
        }
        if(typeof(customSerialize) === "function"){
            tmp=customSerialize(tmp);
        }


        $("input[data-ignore='true']").removeAttr("disabled");
        $("input[role='combobox']").removeAttr("disabled");
        //$("input[role='datepicker']").removeAttr("disabled");
        jQuery.ajax({
            url:getBaseUrl() + "save",
            type:"POST",
            data:JSON.stringify(tmp),
            dataType:"json",
            contentType:"application/json; charset=utf-8",
            success:function (result) {
                if (result.state == "error") {
                    for (var i = 0; i < result.errors.length; i++) {
                        if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                            alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                        } else {
                            alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);

                        }
                    }
                }
                if (result.state == "success") {
                    alertify.success(result.message);
                    if (document.getElementById("loadedId") != null) {
                        document.getElementById("loadedId").value = result.baseObjectId;
                    }
                    document.getElementById("id").value = result.baseObjectId;
                    if(basePath.indexOf("/create/group/")>-1){
                        $("#aaa").data("kendoTreeView").dataSource.read();
                        $.getJSON(basePath.substr(0,basePath.indexOf("/create")) + '/create/group/reset/' + id, function(data) {
                            //alert("ok!?");
                            $('#mainForm').deserialize(data);
                            bToEntityById();
                        });
                    }else if(basePath.indexOf("/create/accountCoding/")>-1){
                        $("#aaa").data("kendoTreeView").dataSource.read();
                        $.getJSON(basePath.substr(0,basePath.indexOf("/create")) + '/create/accountCoding/reset/' + id, function(data) {
                            //alert("ok!?");
                            $('#mainForm').deserialize(data);
                            bToEntityById();
                        });
                    }else if(basePath.indexOf("/create/floatAccount/")>-1){
                        $("#aaa").data("kendoTreeView").dataSource.read();
                        $.getJSON(basePath.substr(0,basePath.indexOf("/create")) + '/create/floatAccount/reset/' + id, function(data) {
                            //alert("ok!?");
                            $('#mainForm').deserialize(data);
                            bToEntityById();
                        });
                    }else if(window.location.href.indexOf("/accountCoding/edit/")>-1){
                        $("#aaa").data("kendoTreeView").dataSource.read();
//                        $.getJSON(basePath.substr(0,basePath.indexOf("/create")) + '/create/account/reset/' + id, function(data) {
//                            //alert("ok!?");
//                            $('#mainForm').deserialize(data);
//                        });
                    }else{
                        $.getJSON(basePath + 'reset/', function (data) {
                            //alert("ok!?");
                            $("#aaa").data("kendoTreeView").dataSource.read();
                            $('#mainForm').deserialize(data);
                            bToEntityById();
                        });
                    }

                }
                if(result.state == "successPrint"){
                    alertify.success(result.message);
                    if (document.getElementById("loadedId") != null) {
                        document.getElementById("loadedId").value = result.baseObjectId;
                    }
                    document.getElementById("id").value = result.baseObjectId;
                    $.getJSON(basePath + 'reset/', function (data) {
                        $('#mainForm').deserialize(data);
                        bToEntityById()
                    });
                    //var gridContent = $("#jqxgrid").jqxGrid('exportdata', 'html');
                    var newWindow = window.open('', '', 'width=800, height=500'),
                            document1 = newWindow.document.open(),
                            pageContent =
                                    '<!DOCTYPE html>\n' +
                                            '<html>\n' +
                                            '<head>\n' +
                                            '<meta charset="utf-8" />\n' +
                                            '<title>Behbood</title>\n' +
                                            '</head>\n' +
                                            '<body>\n'+result.printMessage +'\n</body>\n</html>';
                    document1.write(pageContent);
                    document1.close();
                    newWindow.print();
                }

            },
            error:function(result){
                if(result.status==401){
                    window.location.href="";
                }
            }
        });
    });



    $("#body-heade-saveAndClose").click(function(){

        if(typeof(customFormSave) === "function"){
            customFormSave();
            return;
        }
        var form = $("#mainForm");
        var tmp = {};
        $("input[role='combobox']").attr("disabled", "disabled");
        $("input[data-ignore='true']").attr("disabled", "disabled");
        checkBoxUncheck=jQuery('#mainForm input[type=checkbox]:not(:checked)').map(
                function() {
                    if(this.name!=""){
                        return {"name": this.name, "value": false}
                    }
                }).get();
        $(form.serializeArray()).each(function(){
//                    if(this.name=="date")
//                        this.value=1;
            if($("input[name='"+this.name+"']").attr('type')=='checkbox'){
                if($("input[name='"+this.name+"']").val()=='on'){
                    tmp[this.name]='true';
                }else{
                    tmp[this.name]='false';
                }
            }else{
                tmp[this.name] = this.value;
            }
        });
        for(var i=0;i<checkBoxUncheck.length;i++){
            tmp[checkBoxUncheck[i].name]=checkBoxUncheck[i].value;
        }
        if(typeof(customSerialize) === "function"){
            tmp=customSerialize(tmp);
        }
        $("input[data-ignore='true']").removeAttr("disabled");
        $("input[role='combobox']").removeAttr("disabled");
        //$("input[role='datepicker']").removeAttr("disabled");
        jQuery.ajax ({
            url: getBaseUrl() + "save",
            type: "POST",
            data: JSON.stringify(tmp),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function(result){
                if(result.state == "error"){
                    for(var i=0; i<result.errors.length; i++){
                        if($("label[for='"+ result.errors[i].Field + "']").text().length>0){
                            alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                        }else{
                            alertify.error( result.errors[i].Field + ":  " +  result.errors[i].Message);
                        }
                    }
                }
                if(result.state == "success"){
                    //alertify.success(result.message);
                    //document.getElementById("loadedId").value=result.baseObjectId;
                    if(window.location.href.indexOf("/create/group/")>-1){
                        var returnUrl=window.location.href.replace("/create/group/","/edit/group/");
//                        returnUrl=returnUrl.substr(0,returnUrl.length-1);
                        window.location.href = returnUrl;
                    }else if(window.location.href.indexOf("/create/accountCoding/")>-1){
                        var returnUrl=window.location.href.replace("/create/accountCoding/","/edit/accountCoding/");
//                        returnUrl=returnUrl.substr(0,returnUrl.length-1);
                        window.location.href = returnUrl;
                    }else if(window.location.href.indexOf("/create/floatAccount/")>-1){
                        var returnUrl=window.location.href.replace("/create/floatAccount/","/edit/floatAccount/");
//                        returnUrl=returnUrl.substr(0,returnUrl.length-1);
                        window.location.href = returnUrl;
                    }else if(window.location.href.indexOf("/accountCoding/edit/")>-1){

                            window.location.href = cancelUrl;
                    }else{
                        window.location.href = getBaseUrl();
                    }
                }
            },
            error:function(result){
//                        console.log(result);
                if(result.status==401){
                    window.location.href="";
                }
            }
        });
    });




    if(window.location.href.indexOf("/editWP/")  > 0){
        BindToEntityQueue();
    }else{
        BindToEntity();
    }

});

function getBaseUrl(){
    var p = window.location.href.indexOf("/create");
    if( p < 0 )
        p = window.location.href.indexOf("/edit/");
    if( p < 0 )
        p = window.location.href.indexOf("/editWP/");
    if( p < 0 ){
        p = window.location.href.indexOf("/search");
    }if( p < 0 ){
//                alert("error andar error!");
        return "";
    }
    return window.location.href.substr(0, p + 1);
}

function createMode(){
    var backUrl = getBaseUrl();
    $("#breadcrumb-main-section").html(
            "<a href='" + backUrl + "'>" +
                    $("#breadcrumb-main-section").html() +
                    "</a>"
    );

    var returnUrl;
    if(basePath.indexOf("/create/group/")>-1){
        var returnUrl=basePath.replace("/create/group/","/edit/group/");
        returnUrl=returnUrl.substr(0,returnUrl.length);

    }else if(basePath.indexOf("/create/accountCoding/")>-1){
        var returnUrl=basePath.replace("/create/accountCoding/","/edit/accountCoding/");
        returnUrl=returnUrl.substr(0,returnUrl.length);

    }else if(basePath.indexOf("/create/floatAccount/")>-1){
        var returnUrl=basePath.replace("/create/floatAccount/","/edit/floatAccount/");
        returnUrl=returnUrl.substr(0,returnUrl.length);

    }else{
//        window.location.href = getBaseUrl();
        returnUrl = getBaseUrl();
    }

    $("#breadcrumb-main-section-cancel").attr("href", returnUrl);

    if(window.location.href.indexOf('/create/group')>-1 || window.location.href.indexOf('/create/accountCoding')>-1 || window.location.href.indexOf('/create/floatAccount')>-1){
        $("#breadcrumb").append('<li id="breadcrumb-action" class="uk-active"><span><label id="parentTitle" name="parentTitle" /></span></li>');
    }else{
        $("#breadcrumb").append('<li id="breadcrumb-action" class="uk-active"><span><%=resource.getString("global.crud.new")%></span></li>');
    }
    $("#body-heade-create").hide();
    $("#body-heade-save-div").show();
//    var arra=Object.keys(window);
//    for (var i = 0; i < arra.length; i++){
//        if (typeof(window[arra[i]]) === "function" && arra[i].indexOf('bindToEntityById_after')>-1){
//            window[arra[i]]();
//        }
//    }
}

function editMode(){
    var backUrl = getBaseUrl();
    $("#breadcrumb-main-section").html(
            "<a href='" + backUrl + "'>" +
                    $("#breadcrumb-main-section").html() +
                    "</a>"
    );
    if(window.location.href.indexOf('/accountCoding/edit')>-1){
        $("#breadcrumb-main-section-cancel").attr("href", cancelUrl);
    }else{
        $("#breadcrumb-main-section-cancel").attr("href", backUrl);
    }
    if(window.location.href.indexOf('/edit/group')>-1 || window.location.href.indexOf('/edit/accountCoding')>-1|| window.location.href.indexOf('/edit/floatAccount')>-1){
        $("#breadcrumb").append('<li id="breadcrumb-action" class="uk-active"><div style="display: inline-block;"><a id="titleUrl" href=""><div id="title"/></a></div></li>');
    }else{
        $("#breadcrumb").append('<li id="breadcrumb-action" class="uk-active"><span><%=resource.getString("global.crud.save")%></span></li>');
    }
    if(window.location.href.indexOf('/fnc/generalAccounting/accounting/accountCoding/edit/accountCoding')>-1){
        $("#body-heade-create").show();
        $("#body-heade-save-div").hide();
    }else if(window.location.href.indexOf('/fnc/generalAccounting/accounting/accountCoding/edit/group')>-1 ||window.location.href.indexOf('/fnc/generalAccounting/accounting/floatAccount/edit/floatAccount')>-1){
        $("#body-heade-create").show();
        $("#body-heade-save-div").hide();
    }else{
        $("#body-heade-create").hide();
        $("#body-heade-save-div").show();
    }
}

function editWPMode(){
    var backUrl = getBaseUrl();
    $("#breadcrumb-main-section").html(
            "<a href='" + backUrl + "'>" +
                    $("#breadcrumb-main-section").html() +
                    "</a>"
    );
    $("#breadcrumb-main-section-cancel").attr("href", backUrl);
    $("#breadcrumb").append('<li id="breadcrumb-action" class="uk-active"><span><%=resource.getString("global.crud.save")%></span></li>');
    $("#body-heade-create").hide();
    $("#body-heade-save-div").show();
}


function onSelect(e){
    var elemSpan =$("span", e.item).first();
    var elem = $(".menu-action", elemSpan);
    var ctrl = elem.attr("data-ctrl");
    var action = elem.attr("data-action");
    if(action!=undefined)
        window.location.href = "${pageContext.request.contextPath}/" + action;
}



function BindToEntityQueue(){
    if(typeof(bindToEntity) == "undefined" || !bindToEntity) {
        return;
    }
    if(typeof(customFormLoad) === "function"){
        customFormLoadQueue();
        return;
    }

    bindToEntityByIdQueue(entityId);
}

function BindToEntity(){
    if(typeof(bindToEntity) == "undefined" || !bindToEntity)
        return;

    if(typeof(customFormLoad) === "function"){
        customFormLoad();
        return;
    }

    bindToEntityById(entityId);
}
function bindToEntityById(Id){
    var loadUrl
    if(isEditForFloatDetail ==true){
        if(basePath.indexOf('/edit')>0){
            basePath=basePath.substr(0,basePath.indexOf('/edit'));
        }
        loadUrl=basePath + '/load/floatAccount/' + Id;

    }
    else if(isEditForGroup==true){
        if(basePath.indexOf('/edit')>0){
           basePath=basePath.substr(0,basePath.indexOf('/edit'));
        }
        loadUrl=basePath + '/load/group/' + Id;
    }else{
        if(isEditForAccount==true){
            if(basePath.indexOf('/edit')>0){
                basePath=basePath.substr(0,basePath.indexOf('/edit'));
            }
            loadUrl=basePath + '/load/accountCoding/' + Id;
        }else{
            loadUrl=basePath + '/load/' + Id;
        }
    }

    $.getJSON(loadUrl, function(data) {
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
        $('#mainForm').deserialize(data);
        if(typeof(call_back_bindToEntityById) == "function"){
            call_back_bindToEntityById(data);
        }
        bToEntityById();
        var arra=Object.keys(window);
        for (var i = 0; i < arra.length; i++){
            if (typeof(window[arra[i]]) === "function" && arra[i].indexOf('bindToEntityById_after')>-1){
                window[arra[i]]();
            }
        }
//                if(typeof(window['bindToEntityById_after']) === "function" ){
//                    window['bindToEntityById_after']();
//                }
    });
}

function bindToEntityByIdQueue(Id){
    var newPath=basePath.replace('editWP','loadWP');
    $.getJSON(newPath , function(data) {
        $('#mainForm').deserialize(data);
        var arra=Object.keys(window);
        for (var i = 0; i < arra.length; i++){
            if (typeof(window[arra[i]]) === "function" && arra[i].indexOf('bindToEntityById_after')>-1){
                window[arra[i]]();
            }
        }
//                if(typeof(window['bindToEntityById_after']) === "function" ){
//                    window['bindToEntityById_after']();
//                }
    });
}
function bToEntityById(){

	var arra=Object.keys(window);
        for (var i = 0; i < arra.length; i++){
            if (typeof(window[arra[i]]) === "function" && arra[i].indexOf('bindToEntityById_after')>-1){
                window[arra[i]]();
            }
        }
}
function errorRequestAjax(e){
    if(e.errorThrown=="Unauthorized"){
        window.location.href = "";
    }
}

</script>
<script>
    var myVar=setInterval(function(){myTimer()},1000);

    function myTimer()
    {
        var d=new Date();
        var t=d.toLocaleTimeString()+" "+d.toDateString();
        //window.alert(t);
        // document.getElementById("demo").innerHTML=((d.getHours()<10)?"0"+d.getHours():d.getHours())+":"+((d.getMinutes()<10)?"0"+d.getMinutes():d.getMinutes())+":"+((d.getSeconds()<10)?"0"+d.getSeconds():d.getSeconds())+"    "+ToShamsi(d.getFullYear(),d.getMonth()+1,d.getDate(),"Long")+" "+d.toDateString();
    }
</script>
<SCRIPT language="JavaScript" type="text/javascript">


    var grgSumOfDays=Array(Array(0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365),Array(0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366));
    var hshSumOfDays=Array(Array(0, 31, 62, 93, 124, 155, 186, 216, 246, 276, 306, 336, 365), Array(0, 31, 62, 93, 124, 155, 186, 216, 246, 276, 306, 336, 366));

    function ToShamsi(grgYear,grgMonth,grgDay,Format)
    {
        var hshYear = grgYear-621;
        var hshMonth,hshDay;

        var grgLeap=grgIsLeap (grgYear);
        var hshLeap=hshIsLeap (hshYear-1);

        var hshElapsed;
        var grgElapsed = grgSumOfDays[(grgLeap ? 1:0)][grgMonth-1]+grgDay;

        var XmasToNorooz = (hshLeap && grgLeap) ? 80 : 79;

        if (grgElapsed <= XmasToNorooz)
        {
            hshElapsed = grgElapsed+286;
            hshYear--;
            if (hshLeap && !grgLeap)
                hshElapsed++;
        }
        else
        {
            hshElapsed = grgElapsed - XmasToNorooz;
            hshLeap = hshIsLeap (hshYear);
        }

        for (var i=1; i <= 12 ; i++)
        {
            if (hshSumOfDays [(hshLeap ? 1:0)][i] >= hshElapsed)
            {
                hshMonth = i;
                hshDay = hshElapsed - hshSumOfDays [(hshLeap ? 1:0)][i-1];
                break;
            }
        }


        if (Format=="Long")
            return hshDayName (hshDayOfWeek(hshYear,hshMonth,hshDay)) + "  " + hshDay + " " + calNames("hf", hshMonth-1) + " " + hshYear;
        else
            return hshYear + " /" + hshMonth + " /" + hshDay;
    }


    function ToGregorian (hshYear,hshMonth,hshDay)
    {
        var grgYear = hshYear+621;
        var grgMonth,grgDay;

        var hshLeap=hshIsLeap (hshYear);
        var grgLeap=grgIsLeap (grgYear);

        var hshElapsed=hshSumOfDays [hshLeap ? 1:0][hshMonth-1]+hshDay;
        var grgElapsed;

        if (hshMonth > 10 || (hshMonth == 10 && hshElapsed > 286+(grgLeap ? 1:0)))
        {
            grgElapsed = hshElapsed - (286 + (grgLeap ? 1:0));
            grgLeap = grgIsLeap (++grgYear);
        }
        else
        {
            hshLeap = hshIsLeap (hshYear-1);
            grgElapsed = hshElapsed + 79 + (hshLeap ? 1:0) - (grgIsLeap(grgYear-1) ? 1:0);
        }

        for (var i=1; i <= 12; i++)
        {
            if (grgSumOfDays [grgLeap ? 1:0][i] >= grgElapsed)
            {
                grgMonth = i;
                grgDay = grgElapsed - grgSumOfDays [grgLeap ? 1:0][i-1];
                break;
            }
        }

        return grgYear+"-"+grgMonth+"-"+grgDay;
    }

    function grgIsLeap (Year)
    {
        return ((Year%4) == 0 && ((Year%100) != 0 || (Year%400) == 0));
    }

    function hshIsLeap (Year)
    {
        Year = (Year - 474) % 128;
        Year = ((Year >= 30) ? 0 : 29) + Year;
        Year = Year - Math.floor(Year/33) - 1;
        return ((Year % 4) == 0);
    }


    function hshDayOfWeek(hshYear, hshMonth, hshDay)
    {
        var value;
        value = hshYear - 1376 + hshSumOfDays[0][hshMonth-1] + hshDay - 1;

        for (var i=1380; i<hshYear; i++)
            if (hshIsLeap(i)) value++;
        for (var i=hshYear; i<1380; i++)
            if (hshIsLeap(i)) value--;

        value=value%7;
        if (value<0) value=value+7;

        return (value);
    }

    function hshDayName(DayOfWeek)
    {
        return calNames("df", DayOfWeek%7);
    }

    function calNames(calendarName, monthNo)
    {
        switch (calendarName)
        {
            case "hf": return Array("فروردين", "ارديبهشت", "خرداد", "تير", "مرداد", "شهريور", "مهر", "آبان", "آذر", "دی", "بهمن", "اسفند")[monthNo];
            case "ge": return Array(" January ", " February ", " March ", " April ", " May ", " June ", " July ", " August ", " September ", " October ", " November ", " December ")[monthNo];
            case "gf": return Array("ژانویه", "فوریه", "مارس", "آوریل", "مه", "ژوثن", "ژوییه", "اوت", "سپتامبر", "اكتبر", "نوامبر", "دسامبر")[monthNo];
            case "df": return Array("شنبه", "یک‌شنبه", "دوشنبه", "سه‌شنبه", "چهارشنبه", "پنج‌شنبه", "جمعه")[monthNo];
            case "de": return Array("Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday")[monthNo];
        }
    }
</SCRIPT>
<SCRIPT language="JavaScript" type="text/javascript">

    /*
     Hijri Shamsi (Khayyami)/Gregorian sub-labels calendar
     Version 1.1

     charset=utf-8

     simorgh.ws
     */


    function UpdateCalendar(targetId, gregorianMonths, year, month)
    {
        var newRow, newCell;
        var currentDay=1;
        var holidays=getHolidays(year, month);
        var lastDay=31;
        var dtToday=new Date();
        var strToday=dtToday.getFullYear()+"-"+(dtToday.getMonth()+1)+"-"+dtToday.getDate();

        if (month>6) lastDay--;
        if (month==12 && !hshIsLeap(year)) lastDay--;


        while (targetId.rows.length>0) targetId.deleteRow(0);


        newRow=targetId.insertRow(0);
        for (var i=0; i<hshDayOfWeek(year,month,1); i++) newRow.insertCell(-1).innerHTML=" ";
        for (var i=hshDayOfWeek(year,month,1); i<7; i++) {
            newCell=newRow.insertCell(-1);
            newCell.className="normalDay";
            newCell.innerHTML="<p class=ShamsiDayNo>" + currentDay + "</p><p dir=ltr class=GregorianDayNo>" + ToGregorian(year,month,currentDay).split("-")[2];
            if (holidays.substr(currentDay-1,1)=="x") newCell.className="Holiday";
            if (ToGregorian(year, month, currentDay)==strToday) newCell.className="Today";
            currentDay++;
        }

        while (currentDay<=lastDay) {
            newRow=targetId.insertRow(-1);
            for (var i=0; i<7; i++) {
                newCell=newRow.insertCell(-1);
                newCell.innerHTML="<p class=ShamsiDayNo>" + currentDay + "</p><p dir=ltr class=GregorianDayNo>" + ToGregorian(year,month,currentDay).split("-")[2];
                newCell.className="normalDay";
                if (holidays.substr(currentDay-1,1)=="x") newCell.className="Holiday";
                if (ToGregorian(year, month, currentDay)==strToday) newCell.className="Today";
                currentDay++;
                if (currentDay>lastDay) break;
            }
        }
        for (var i=newRow.cells.length; i<7; i++) newRow.insertCell(-1).innerHTML=" ";

        if (gregorianMonths != null) {
            gregorianMonths.getElementsByTagName('p')[0].innerHTML=calNames("ge", ToGregorian (year,month,1).split("-")[1]-1)+" "+(ToGregorian (year,month,1).split("-")[0])+" - "+calNames("ge", ToGregorian (year,month,30).split("-")[1]-1)+" "+ToGregorian (year,month,30).split("-")[0];
            gregorianMonths.getElementsByTagName('p')[1].innerHTML=calNames("gf", ToGregorian (year,month,1).split("-")[1]-1)+" "+(ToGregorian (year,month,1).split("-")[0])+" - "+calNames("gf", ToGregorian (year,month,30).split("-")[1]-1)+" "+ToGregorian (year,month,30).split("-")[0];
        }
    }

    function FillSelectWithMonthNames(targetId)
    {
        for (var i=0; i<12; i++) {
            var mitem = document.createElement("OPTION");
            mitem.value=i+1;
            mitem.text=calNames("hf", i);
            targetId.options.add(mitem);
        }
    }

    function getHolidays(year, month)
    {
        switch (year) {
            case 1380: return Array("xxxx56789x1xx4xxx890123x567890x", "123456x890123x567890x234567x901", "x2xx567890x23xx67x9x1234x678901", "x234567x901234x678901x345678x01", "1234x678901x345678x012345x78901", "xx345678x012345x789012x456789x1", "12345x78x012x456789x12x456x890", "123x56789xx234567x901234x67890", "1x345678x012345x789012x45x789x", "123456x890123x56789xx234567x90", "1234x678901x345678x01x345x7890", "12xx56789x1x3456x890123x5678x")[month-1];
            case 1381: return Array("xxxxx678x01xx45x789012x456789x1", "12345x789012x456789xx2x456x8901", "12x45678xx123xx6x890123x567890x", "123456x890123x567890x234567x901", "123x567890x234567x90x234x678901", "x234567x901234x678901x345678xx1", "1234x678901xx45678x012345x789x", "12x456789x123456x890123x567890", "x234x67x901234x678901x345678x0", "12345x78x012x456789x123456x890", "123x567890x234567x901xx4x67890", "xx345678x012345x78901xx45678x")[month-1];
            case 1382: return Array("xxxx567x901xx4x678901x345678x01", "12x4x67890xx345678x012345x78x01", "1x345678x0123xxx789012x456789x1", "12345x789012x456789x123456x8901", "12x456789xx23456x890123x567890x", "123456x890123x5678x0x234567x901", "1x3x567890x234567x9x1234x67890", "1x345678x012345x789012x4x6789x", "1234x6x890123x567890x234567xx0", "1234x678901x345678x012345x7890", "12x456789x12x456x890xx3x567890", "x234567x90xx34x678901x345678x")[month-1];
            case 1383: return Array("xxxx56x8901xxx567890x234567x901", "123x567890x234567x901234x678901", "x234567x90123xx678901x345678x01", "1234x678901x345678x012345x78901", "1x345678x012345x789012x456789x1", "12345x789012x456789x123456x8901", "12x456789x123456x890123x567890", "x234567x901234x678901x345678x0", "12345x789012x456789x123456x890", "123x567890x234567x901234x67890", "1x345678x012345x78901xx456789x", "123456x890123x567890x234567xx0")[month-1];
        }
    }

</SCRIPT>
<SCRIPT language="JavaScript" type="text/javascript">
    function switchCalendar()
    {
        var frm = document.getElementById("convert");
        var today = new Date();

        while (frm.year.options.length<100) frm.year.options.add(document.createElement("OPTION"));

        while (frm.month.options.length<12) {
            var newMonth = document.createElement("OPTION");
            newMonth.value=frm.month.options.length+1;
            frm.month.options.add(newMonth);
        }

        while (frm.day.options.length<31) {
            var newDay = document.createElement("OPTION");
            newDay.value=frm.day.options.length+1;
            newDay.text=frm.day.options.length+1;
            frm.day.options.add(newDay);
        }

        if (frm.calendar[0].checked) {
            for (var i=0; i<100; i++) {
                frm.year.options[i].text=i+1300;
                frm.year.options[i].value=i+1300;
            }

            for (var i=0; i<12; i++) frm.month.options[i].text = calNames("hf", i);

            var shToday = ToShamsi(today.getFullYear(), today.getMonth()+1, today.getDate(),'short');
            frm.year.value=Number(shToday.split('/')[0]);
            frm.month.value=Number(shToday.split('/')[1]);
            frm.day.value=Number(shToday.split('/')[2]);
        }
        else {
            for (var i=0; i<100; i++) {
                frm.year.options[i].text=i+1930;
                frm.year.options[i].value=i+1930;
            }

            for (var i=0; i<12; i++) frm.month.options[i].text = calNames("ge", i);

            frm.year.value=today.getFullYear();
            frm.month.value=today.getMonth()+1;
            frm.day.value=today.getDate();
        }

        convertDate();
    }


    function convertDate() {
        frm = document.getElementById("convert");

        if (frm.calendar[0].checked) {
            var grg=ToGregorian(parseInt(frm.year.value), parseInt(frm.month.value), parseInt(frm.day.value));
            document.getElementById("resultDate").innerHTML = calNames("df", hshDayOfWeek(parseInt(frm.year.value), parseInt(frm.month.value), parseInt(frm.day.value)))+" "+grg.split("-")[2]+" "+calNames("gf", grg.split("-")[1]-1)+" ("+grg.split("-")[1]+") "+grg.split("-")[0];
            document.getElementById("resultDate").innerHTML += "<br><font face='tahoma' size=3>"+calNames("de",hshDayOfWeek(parseInt(frm.year.value), parseInt(frm.month.value), parseInt(frm.day.value)))+", "+calNames("ge", grg.split("-")[1]-1)+" "+grg.split("-")[2]+", "+grg.split("-")[0]+"</font>";
        }
        else {
            var hsh=ToShamsi(parseInt(frm.year.value), parseInt(frm.month.value), parseInt(frm.day.value), "Long");
            document.getElementById("resultDate").innerHTML=hsh;
        }
    }
</SCRIPT>
<style>
    html{ overflow-y: scroll;}
    #template img {
        margin: 5px 20px 0 0;
        float: left;
    }
    #template {
        width: 380px;
    }
    #template ol {
        float: left;
        margin: 0 0 0 30px;
        padding: 10px 10px 0 10px;
    }
    #template:after {
        content: ".";
        display: block;
        height: 0;
        clear: both;
        visibility: hidden;
    }
    #template .k-button {
        float: left;
        clear: left;
        margin: 5px 0 5px 12px;
    }

    .k-menu .k-animation-container, .k-popup .k-animation-container {
        margin-top: -1px;
        padding-left: 1px;
        top: 0px;
    }

    #container{
        max-width: 400px;
        width: 100%;
        margin: 20px auto;
    }
    #demo_box{
        width: 300px;
    }

    .fa{
        font-size: 40px;
        line-height: 70px;
    }
    .fa-bars{
        color: #3498db;
    }
    footer{
        margin-top: 150px;
    }
    .k-separator{
        background-color: rgba(112, 128, 144, 0.76) !important;
        width: 98% !important;
    }



    /* We do the heading of the panel, as a corner of paper folder: */
    #feedbackButton{
        font-weight : bold;
        margin-left : 10px;
        margin-top : -6px;
        border : 1px solid #717277;
        border-radius : 0px 0px 10px 10px;
        text-align : center;
        width : 100px;
        margin-bottom : 5px;
        color : #FFFFFF;
        background : red;
    }

    .body-content-class{
        width : 100%;
        height : 100%;
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#f2f5f6), color-stop(37%,#e3eaed), color-stop(100%,#c8d7dc));
        background-image: url(<c:url value='/resources/images/firstPageLogo.png' />);
        background-size:   80%;
        background-repeat: no-repeat;
        background-position: center center;
    }

    .newCssClassforK_window {height : 130px !important;}

</style>
</body>
</html>
