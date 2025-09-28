<%--<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>--%>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<%--<link rel="stylesheet" href="<c:url value='/resources/js/select2-3.4.5/select2.css' />" type="text/css"></link>--%>
<%--<script type="text/javascript" src="<c:url value='/resources/js/select2-3.4.5/select2.js' />"></script>--%>

    	<div class="uk-width-1-1" id="pastMedicalHistory-kanban-static" style=" height:100%">	
			<%--<select id="p-pastMedicalHistoryMultiSelect" style="direction:ltr; width: 100%" multiple="multiple">--%>
 			<%--</select>--%>
                <input type="hidden" id="p-pastMedicalHistoryMultiSelect" style="direction:ltr; width: 100%; height:100% "/>
    	</div>

<script type="text/javascript">
    $(document).ready(function () {
        var preload_data;
        $.getJSON("${pageContext.request.contextPath}" + "/clinic/basicInfo/diagnosis/combo/loadAllDiagnosisGet", function (data) {

            preload_data = data;

            var preload_data2=[] ;


            $.each(preload_data, function () {

                preload_data2.push({id:this.ComboID, text:this.ComboCaption });

            });



            $('#p-pastMedicalHistoryMultiSelect').select2({
                multiple:true,
                query:function (query) {
                    var data = {results:[]};

                    $.each(preload_data, function () {
                        if (query.term.length == 0 || this.ComboCaption.toUpperCase().indexOf(query.term.toUpperCase()) >= 0) {
                            data.results.push({id:this.ComboID, text:this.ComboCaption });
                        }
                    });

                    query.callback(data);
                },
                createSearchChoice:function (term, data) {
                    if ($(data).filter(
                            function () {
                                return this.text.localeCompare(term) === 0;
                            }).length === 0) {
                        return {id:term, text:term};
                    }
                }, initSelection:function (element, callback) {
                    if (element.val() == "-1") {
                        element.val("");
                        return;
                    }
                    var data = [];
                    $(element.val().split(",")).each(function (){
                        for(var i=0;i<preload_data2.length;i++){
                            if(this!="-1"){
                                if (this == preload_data2[i].id) {
                                    data.push({id:this, text:preload_data2[i].text});
                                }
                            }
                        }
                    });



                    callback(data);
                },
                data:preload_data2
            });

            $("#p-pastMedicalHistoryMultiSelect").select2('val', ${medicalHistoryIds});

        });
    });



    <%--$(document).ready(function() { $("#p-pastMedicalHistoryMultiSelect").select2({--%>
    <%--allowClear: true--%>
	<%--});  --%>
<%--});--%>

<%--$.getJSON("<c:url value='/' />" + "clinic/basicInfo/diagnosis/combo/loadAllDiagnosisGet" , function(data) {--%>
		<%--for ( var i = 0; i < data.length; i++) {--%>
			<%--$("#p-pastMedicalHistoryMultiSelect").append(--%>
					<%--"<option style='direction:ltr' value='" + data[i].ComboID + "' >" + data[i].ComboCaption + "</option>")--%>
		<%--}--%>
    <%--console.log('medicalHistoryIds:'+${medicalHistoryIds});--%>
    <%--$("#p-pastMedicalHistoryMultiSelect").select2('val',${medicalHistoryIds});--%>
    <%--$("#p-pastMedicalHistoryMultiSelect").select2('val',${medicalHistoryIds});--%>
    <%--console.log('after medicalHistoryIds');--%>
<%--});--%>
	
</script>
