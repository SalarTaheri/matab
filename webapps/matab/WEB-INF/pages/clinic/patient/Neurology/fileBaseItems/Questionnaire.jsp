<div>
	<input type="button" data-inline="true" value="Liver" id="Liver">
	<input type="button" data-inline="true" value="I.B.D">
	<input type="button" data-inline="true" value="Input3">
	<input type="button" data-inline="true" value="Input4">
	<input type="button" data-inline="true" value="Input5">
	<input type="button" data-inline="true" value="Input11">
	<input type="button" data-inline="true" value="Input21">
	<input type="button" data-inline="true" value="Input31">
</div>
<script>
	$("#Liver").click(function(){
			window.location = "${pageContext.request.contextPath}"+"/clinic/research/file/${patientId}" ;
	});
</script>