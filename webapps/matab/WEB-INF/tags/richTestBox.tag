
<%@tag import="java.util.ResourceBundle"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="key" required="true" rtexprvalue="true"%>
<%@ attribute name="disabled" required="false" rtexprvalue="true"%>
<%@ attribute name="direction" required="false" rtexprvalue="true"%>
<%@ attribute name="styleClass" required="false" rtexprvalue="true"%>
<%@ attribute name="isMandatory" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="isPassword" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%
    if(direction==null || direction.equals(""))
        direction="direction:rtl";
    else
        direction="direction:ltr";
    if(styleClass==null ||styleClass.length()==0||styleClass.equals("normal"))
        styleClass="uk-width-4-10";
    else if(styleClass.equals("small"))
        styleClass="uk-width-2-10";
    else if(styleClass.equals("larg"))
        styleClass="uk-width-6-10";

    if(isMandatory==null){
        isMandatory=false;
    }
    if(isPassword==null){
        isPassword=false;
    }

%>
<jsp:doBody />
<div class="uk-width-1-10 left-align">
    <label for="${name}"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></label>
</div>

<div class="k-rtl uk-width-9-10" >
    <%--<%if(Boolean.valueOf(disabled)){%>--%>
    <kendo:editor id="${name}" name="${name}" class="uk-width-1-1" >
        <%--<kendo:editor-tools>--%>
            <%--<kendo:editor-tool name="bold" />--%>
            <%--<kendo:editor-tool name="italic" />--%>
            <%--<kendo:editor-tool name="underline" />--%>
            <%--<kendo:editor-tool name="strikethrough" />--%>

            <%--<kendo:editor-tool name="justifyLeft" />--%>
            <%--<kendo:editor-tool name="justifyCenter" />--%>
            <%--<kendo:editor-tool name="justifyRight" />--%>
            <%--<kendo:editor-tool name="justifyFull" />--%>

            <%--<kendo:editor-tool name="insertUnorderedList" />--%>
            <%--<kendo:editor-tool name="insertOrderedList" />--%>
            <%--<kendo:editor-tool name="indent" />--%>
            <%--<kendo:editor-tool name="outdent" />--%>

            <%--<kendo:editor-tool name="createLink" />--%>
            <%--<kendo:editor-tool name="unlink" />--%>
            <%--<kendo:editor-tool name="insertImage" />--%>

            <%--<kendo:editor-tool name="subscript" />--%>
            <%--<kendo:editor-tool name="superscript" />--%>

            <%--<kendo:editor-tool name="createTable" />--%>
            <%--<kendo:editor-tool name="addRowAbove" />--%>
            <%--<kendo:editor-tool name="addRowBelow" />--%>
            <%--<kendo:editor-tool name="addColumnLeft" />--%>
            <%--<kendo:editor-tool name="addColumnRight" />--%>
            <%--<kendo:editor-tool name="deleteRow" />--%>
            <%--<kendo:editor-tool name="deleteColumn" />--%>

            <%--<kendo:editor-tool name="viewHtml" />--%>

            <%--<kendo:editor-tool name="formatting" />--%>
            <%--<kendo:editor-tool name="fontName" />--%>
            <%--<kendo:editor-tool name="fontSize" />--%>
            <%--<kendo:editor-tool name="foreColor" />--%>
            <%--<kendo:editor-tool name="backColor" />--%>

        <%--</kendo:editor-tools>--%>
    </kendo:editor>
    <%--<%} else { %>--%>
    <%--<%if(!isMandatory){%>--%>
    <%--<input type="text" id="${name}" name="${name}" class="uk-width-1-1" style="${direction}">--%>
    <%--<%}else {%>--%>
    <%--<input type="text" id="${name}" name="${name}" class="uk-width-1-1" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(237,247,220,1)), color-stop(100%,rgba(255,255,204,1)));${direction}">--%>
    <%--<%} %>--%>
    <%--<%} %>--%>
</div>
