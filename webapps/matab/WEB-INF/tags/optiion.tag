<%@tag import="java.util.ResourceBundle" %>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="key" required="true" rtexprvalue="true" %>
<%@ attribute name="widthValue" required="false" rtexprvalue="true" %>
<%@ attribute name="absulotePath" required="true" rtexprvalue="true" %>
<%@ attribute name="noneSelectedText" required="false" rtexprvalue="true" %>
<%@ attribute name="clickEventMethod" required="false" rtexprvalue="true" %>
<%@ attribute name="checkAllEventMethod" required="false" rtexprvalue="true" %>
<%@ attribute name="unCheckAllEventMethod" required="false" rtexprvalue="true" %>
<%@ attribute name="optgrouptoggleEventMethod" required="false" rtexprvalue="true" %>
<%@ attribute name="beforeCloseEventMethod" required="false" rtexprvalue="true" %>
<%@ attribute name="selectedList" required="false" rtexprvalue="true" type="java.lang.Integer" %>
<jsp:doBody/>
  <link href="<c:url value='/resources/js/jquery-ui-multiselect-widget-master/jquery.multiselect.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/js/jquery-ui-multiselect-widget-master/jquery.multiselect.filter.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/js/jquery-ui-multiselect-widget-master/demos/assets/style.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/js/jquery-ui-multiselect-widget-master/demos/assets/prettify.css'/>" rel="stylesheet" />

	<script src="<c:url value='/resources/js/jquery-ui-multiselect-widget-master/src/jquery.multiselect.js' />"></script>
	<script src="<c:url value='/resources/js/jquery-ui-multiselect-widget-master/src/jquery.multiselect.filter.js' />"></script>
	<script src="<c:url value='/resources/js/jquery-ui-multiselect-widget-master/demos/assets/prettify.js' />"></script>
  
	<%-- <h5><%=ResourceBoundleHolder.resourceBundle.getString(key)%></h5>--%>
	<select id="${name}" 
		 multiple="multiple" >
		
	</select>
<%
    if(selectedList==null){
        selectedList=60;
    }

%>

<script>
    var noneSelectedTextJs="${noneSelectedText}";
    var width=<%=widthValue%>;
	$("#${name}").multiselect({
 	  selectedList: <%=selectedList%>,
   	  hide: ["slide", 500],
      noneSelectedText:noneSelectedTextJs,
      checkAll: function(event, ui){
          var checkAllEventMethodName='<%=checkAllEventMethod%>';
          if(checkAllEventMethodName!=null || checkAllEventMethodName!='null'){
              if(typeof(window[checkAllEventMethodName])=="function"){
                  window[checkAllEventMethodName](event, ui);
              }
          }
      },
      click:function(event,ui){
          var clickEventMethodName='<%=clickEventMethod%>';
          if(clickEventMethodName!=null || clickEventMethodName!='null'){
              if(typeof(window[clickEventMethodName])=="function"){
                  window[clickEventMethodName](event, ui);
              }
          }

      },
      optgrouptoggle:function(event,ui){
          var optgrouptoggleEventMethodName='<%=optgrouptoggleEventMethod%>';
          if(optgrouptoggleEventMethodName!=null || optgrouptoggleEventMethodName!='null'){
              if(typeof(window[optgrouptoggleEventMethodName])=="function"){
                  window[optgrouptoggleEventMethodName](event, ui);
              }
          }

      },
      uncheckAll:function(event,ui){
          var uncheckAllEventMethodName='<%=unCheckAllEventMethod%>';
          if(uncheckAllEventMethodName!=null || uncheckAllEventMethodName!='null'){
              if(typeof(window[uncheckAllEventMethodName])=="function"){
                  window[uncheckAllEventMethodName](event, ui);
              }
          }

      },beforeclose:function(event,ui){
            var beforeCloseEventMethodName='<%=beforeCloseEventMethod%>';
            if(beforeCloseEventMethodName!=null || beforeCloseEventMethodName!='null'){
                if(typeof(window[beforeCloseEventMethodName])=="function"){
                    window[beforeCloseEventMethodName](event, ui);
                }
            }

      }
//      noneSelectedText:noneSelectedTextJs,
        <%--click: function(event, ui){--%>
            <%--console.log($("#${name}").multiselect("widget").find(":checkbox[value='"+ui.value+"']").parent().find('span').text());--%>
        <%--}--%>
        <%--,checkAll: function(event,ui){--%>
            <%--console.log(ui);--%>
        <%--}--%>

	}).multiselectfilter();
	$.getJSON("<c:url value='/' />" + "${absulotePath}" , function(data) {
			$("#${name}").append(data.data);
			$("#${name}").multiselect("refresh");
//        $(".ui-multiselect").style.width="100%"
        var size=$(".ui-multiselect").size();
        for(var i=0;i<size;i++){
            $(".ui-multiselect")[i].style.width="100%";
        }
        if(width != null){

            $(".ui-multiselect-menu").css("width",'<%=widthValue%>%');
        }
        if(typeof(window["callBack_after_full_date_"+"${name}"])=="function"){
            window["callBack_after_full_date_"+"${name}"]();
        }
	});


</script>

<style type="text/css">
    .ui-multiselect-menu {direction: ltr}
</style>