<%@tag import="java.util.ResourceBundle" %>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>

<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="textField" required="true" rtexprvalue="true" %>
<%@ attribute name="key" required="true" rtexprvalue="true"%>
<%@ attribute name="transportReadUrl" required="true" rtexprvalue="true" %>
<%@ attribute name="minLength" required="true" rtexprvalue="true" type="java.lang.Integer" %>
<%@ attribute name="styleClass" required="false" rtexprvalue="true"%>
<%

    if(styleClass==null ||styleClass.length()==0||styleClass.equals("normal"))
        styleClass="uk-width-4-10";
    else if(styleClass.equals("small"))
        styleClass="uk-width-2-10";
    else if(styleClass.equals("larg"))
        styleClass="uk-width-6-10";
%>
<jsp:doBody />


<div class="uk-width-1-10 left-align">
    <label for="${name}"><%=ResourceBoundleHolder.resourceBundle.getString(key)%>
    </label>
</div>
<div class="<%= styleClass%> k-rtl">
    <kendo:autoComplete name="${name}"  dataTextField="${textField}" filter="contains" minLength="${minLength}"
                        style="width:250px">
        <kendo:dataSource serverFiltering="true" pageSize="10" serverPaging="true" >
            <kendo:dataSource-transport>
                <kendo:dataSource-transport-read url="${transportReadUrl}" type="POST" contentType="application/json"/>
                <kendo:dataSource-transport-parameterMap>
                    <script>
                        function parameterMap(options, type) {
                            return JSON.stringify(options);
                        }
                    </script>
                </kendo:dataSource-transport-parameterMap>
            </kendo:dataSource-transport>
            <kendo:dataSource-schema data="data" total="total">
            </kendo:dataSource-schema>
        </kendo:dataSource>
    </kendo:autoComplete>
</div>
