
<%@tag import="java.util.ResourceBundle" %>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>

<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="key" required="true" rtexprvalue="true" %>



<div id="${name}" style="display:none;direction: rtl;height: 100% !important;">
    <p><%=ResourceBoundleHolder.resourceBundle.getString(key)%>
    </p>
</div>

<script type="text/javascript">


    $("#${name}").dialog({
        autoOpen:false,
        show:{
            effect:"slide",
            duration:300
        },
        hide:{
            effect:"slide",
            duration:300
        },
//        height:800,
        width:800,
        modal:true,
        zIndex:99999,
        buttons:{
            "OK":function () {
                $(this).dialog("close");
            }
        }
    });

</script>

<style type="text/css">
    .ui-dialog { z-index: 999999 !important ;}
</style>