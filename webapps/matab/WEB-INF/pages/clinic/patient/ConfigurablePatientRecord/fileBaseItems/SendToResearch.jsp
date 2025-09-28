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

$.ajax({
    url: '${pageContext.request.contextPath}' + '/clinic/patient/visitMobileBase/loadDepartments',
    contentType: "application/json; charset=utf-8",
    dataType: 'json',
    type: 'GET',
    success: function (data, success, xhr) {
        $.each(data, function (i, item) {
            $('#depId4Send').append($('<option>', {
                value: item.key,
                text: item.title
            }));
        });
    },
    error: function (e) {
        alert('Error load departments : ' + e.responseText);
    }
});
</script>