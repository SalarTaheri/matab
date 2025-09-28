<select id="depId4Send">

<select>

<button onclick="send()">ارسال</button>

<script>
       
function send(){
        $.ajax({
            url: '${pageContext.request.contextPath}'+'/clinic/patient/visitMobileBase/sendToResearch/'+ ${patientId}+'/'+$('#depId4Send').val(),
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            type: 'GET',
            success: function (data, success, xhr) {
            	if(data.state=='error'){
            		alertify.error(data.message);
            	}else{
                	alertify.success(data.message);
                }
            },
            error: function (e) {
               alert('Error send to researc departments : ' + e.responseText);
            }
        });
}
</script>