<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div align="center">
	<div class="banner">
	</div>
</div>

<style>
.banner{
    background-image: url(<c:url value='/resources/images/banner.jpg' />);
	background-repeat: no-repeat;
    background-position: center center; 
    height: 1000px;
    width: 800px;
}
</style>