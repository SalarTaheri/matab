
<%@tag import="java.util.ResourceBundle" %>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>

<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="key" required="true" rtexprvalue="true" %>
<%@ attribute name="yesFunction" required="true" rtexprvalue="true" %>
<%@ attribute name="noFunction" required="false" rtexprvalue="true" %>

<%

            String yes=ResourceBoundleHolder.resourceBundle.getString("action.alert.areYouSure.yes");
            String no=ResourceBoundleHolder.resourceBundle.getString("action.alert.areYouSure.no");
%>

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
        modal:false,
        buttons:{
            "<%=no%>":function () {
                var noFunctionName='<%=noFunction%>';
                if(noFunctionName!=null || noFunctionName!='null'){
                    if(typeof(window[noFunctionName])=="function"){
                        window[noFunctionName]($(this));
                    }
                }
                $(this).dialog("close");
            },
            "<%=yes%>":function () {
                var yesFunctionName='<%=yesFunction%>';
                if(yesFunctionName!=null || yesFunctionName!='null'){
                    if(typeof(window[yesFunctionName])=="function"){
                        window[yesFunctionName]($(this));
                    }
                }
                $(this).dialog("close");
            }
        },
        open: function() {
//            $(this).parents('.ui-dialog-buttonpane button:eq(1)').focus();
        }
    });

</script>