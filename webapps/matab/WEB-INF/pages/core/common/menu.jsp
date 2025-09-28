<%@page import="com.artonis.core.system.authentication.service.impl.MenuTools"%>
<%@page import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@page import="com.artonis.core.system.authentication.model.Menu"%>
<%@include file="/WEB-INF/taglibs.jsp"%>

<div id="header">
	<div class="k-rtl">
		<ul id="menu" style="height: 30px !important">			
			<%=MenuTools.loadMenuAsUnorderedList(GlobalVariable.getUser().getUserName()) %> 
		</ul>
	</div>
</div>


<script type="text/javascript">
	$(document).ready(function() {
	    $("#menu").kendoMenu({
	    	select: onSelect
	    });
	});
	function onSelect(e){
		var elem =$(".menu-action", e.item);
		var ctrl = elem.attr("data-ctrl");
		var action = elem.attr("data-action");
		window.location.href = "${pageContext.request.contextPath}/" + action;
		//console.log($(e.item));
	}
</script>