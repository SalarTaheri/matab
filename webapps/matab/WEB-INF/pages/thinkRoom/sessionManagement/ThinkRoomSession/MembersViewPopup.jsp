<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<%--<base:pageGridPopup/>--%>

<base:thinking-grid name="grid" transportReadUrl="${basePath}/grid-read" isPopup="true">
    <base:my-grid-column title='thinkroom.membermanagent.member.name'  field="name" width="50px"/>
    <base:my-grid-column title='thinkroom.membermanagent.member.lastname' field="lastname"  width="50px"/>
    <base:my-grid-column title='thinkroom.membermanagent.member.sex' field="sexStr"  width="50px"/>
    <base:my-grid-column title='thinkroom.membermanagent.member.job' field="job"  width="50px"/>
    <base:my-grid-column title='thinkroom.membermanagent.member.tel' field="tel1"  width="50px"/>
    <base:my-grid-column title='thinkroom.membermanagent.member.cellphone' field="cellphone"  width="50px"/>
    <base:my-grid-column title='thinkroom.membermanagent.member.email' field="email"  width="50px"/>
    <base:my-grid-column title='thinkroom.membermanagent.member.membercard' field="memberCardStr"  width="50px"/>
    <base:my-grid-column title='thinkroom.membermanagent.member.businesscard' field="businessCardStr"  width="50px"/>

    <base:my-grid-schema-field name="name" type="string" />
    <base:my-grid-schema-field name="lastname" type="string" />
    <base:my-grid-schema-field name="sexStr" type="string" />
    <base:my-grid-schema-field name="job" type="string" />
    <base:my-grid-schema-field name="tel1" type="string" />
    <base:my-grid-schema-field name="cellphone" type="string" />
    <base:my-grid-schema-field name="email" type="string" />
    <base:my-grid-schema-field name="memberCardStr" type="string" />
    <base:my-grid-schema-field name="businessCardStr" type="string" />
    <base:my-grid-function name="select" text="action.select"   functionClick="selectRow_OnClick" />
    <%--<base:my-grid-function name="select" text="action.select"   functionClick="_grid_onEdit" />--%>
</base:thinking-grid>

<base:footer></base:footer>


<script >

    $(function(){
        $("#body-grid-popup-create").click(function(){

            $.get("${pageContext.request.contextPath}/thinkRoom/sessionManagement/thinkRoomSession/createpopup", function (data) {
                $("#item-modals-memberCr").empty();
//                $("#item-modals-memberCr").append('<div id="membercreate" class="uk-modal-dialog">');
                $("#item-modals-memberCr").append('<div id="membercreate">');
                $("#membercreate").append(data);
                $("#item-modals-memberCr").dialog('open');
                afterBind();
            });
        });
    });

    $("#item-modals-memberCr").dialog({
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
            $("#grid").data("kendoGrid").dataSource.read();
            $("#item-modals-memberCr").empty();

        }

    });

    function afterHidePopup(){
        $("#item-modals-memberCr").remove();

    }



    function afterBind(){
        var arra=Object.keys(window);
        for (var i = 0; i < arra.length; i++){
            if (typeof(window[arra[i]]) === "function" && arra[i].indexOf('bindToEntityById_after')>-1){
                window[arra[i]]();
            }
        }
    }

    function closeCallback(){
        $("#item-modals-memberCr").dialog('close');
    }

</script>

<div id="item-modals-memberCr" >

</div>

