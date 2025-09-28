<%@include file="/WEB-INF/taglibs.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	border: 0;
}

.k-button * {
	display: block;
}
hr {
border: none;
border-bottom: 2px black solid;
height: 1px;
}
</style>

<table width="100%">
    <base:aWithOutPermission classNames="uk-button uk-button-danger" id="return_button" key="global.crud.return" />
	<tr>
		<td width="50%">&nbsp;</td>
		<td align="left">
			<hr />
			<form method="POST" action="reportPreview">
				<table width="50%">
					<tr>
                        <c:choose>
                            <c:when test="${page < lastPage}">
                                <td><a class="k-button" href='<c:url value="reportPreview?page=${page + 1}"/>'><span class="k-icon k-i-arrow-e"></span></a></td>
                                <td><a class="k-button" href='<c:url value="reportPreview?page=${lastPage}"/>'><span class="k-icon k-i-seek-e"></span></a></td>
                            </c:when>
                            <c:otherwise>
                                <td><a class="k-button"><span class="k-icon k-i-arrow-e"></span></a></td>
                                <td><a class="k-button"><span class="k-icon k-i-seek-e"></span></a></td>
                            </c:otherwise>
                        </c:choose>

						<td style="padding-left: 10px;"><input type="text" name="page" id="page" value="${page}" style="width: 80px;" /></td>
						<td style="padding-right: 10px;"><label for="page" >${pageSize}  </label></td>
						<td style="padding-right: 10px;"><a class="k-button" href='<c:url value="javascript:document.forms[0].submit();"/>'><span class="k-icon k-i-tick"></span></a></td>
                        <c:choose>
                            <c:when test="${page > 1}">
                                <td><a class="k-button" href='<c:url value="reportPreview?page=1"/>'><span class="k-icon k-i-seek-w"></span></a></td>
                                <td><a class="k-button" href='<c:url value="reportPreview?page=${page - 1}"/>'><span class="k-icon k-i-arrow-w"></span></a></td>
                            </c:when>
                            <c:otherwise>
                                <td><a class="k-button"><span class="k-icon k-i-seek-w"></span></a></td>
                                <td><a class="k-button"><span class="k-icon k-i-arrow-w"></span></a></td>
                            </c:otherwise>
                        </c:choose>
						<%--<td><a class="k-button" href='<c:url value="reportPreview?exportType=XLS"/>'><img src="<c:url value='/resources/images/excel.png'/>" title="Excel 2003"></a></td>--%>
						<%--<td><a class="k-button" href='<c:url value="reportPreview?exportType=XLSX"/>'><img src="<c:url value='/resources/images/xlsx.png'/>" title="Excel 2007"></a></td>--%>
						<td><a class="k-button" href='<c:url value="reportPreview?exportType=PDF"/>'><img src="<c:url value='/resources/images/pdf.png'/>" title="Adobe PDF"></a></td>
						<%--<td><a class="k-button" href='<c:url value="reportPreview?exportType=DOCX"/>'><img src="<c:url value='/resources/images/docx2.png'/>" title="Microsoft Word 2007"></a></td>--%>
						<%--<td><a class="k-button" href='<c:url value="reportPreview?exportType=JPG"/>'><img src="<c:url value='/resources/images/jpg.png'/>" title="JPG Image"></a></td>--%>
					</tr>
				</table>
			</form>
			<hr />
		</td>
		<td width="50%">&nbsp;</td>
	</tr>
	<tr>
		<td width="50%">&nbsp;</td>
		<td align="center" dir="ltr">${preview}</td>
		<td width="50%">&nbsp;</td>
	</tr>
</table>
<script type="text/javascript">
$(document).ready(function() {
    var referer='<%= request.getHeader("referer")%>';
    if(referer.indexOf('reportPreview')>-1){
        var indexOfreferer=referer.indexOf('reportPreview')
        referer=referer.substring(0,indexOfreferer);
    }
    $("#return_button").attr("href", referer);


    $("#page").kendoNumericTextBox({
            min: 1,
            max: ${lastPage},
            format: "#",
            decimals: 0
    });


});
</script>
