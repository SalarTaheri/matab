
<%@page import="java.util.ResourceBundle"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="uk-container uk-container-center my-uk-container" >

    <form class="uk-form" id="mainForm">

        <div class="uk-grid uk-grid-preserve">
            <base:button key="global.crud.save" styleClass="" id="imprtFromExcel"/>
            <base:testBox styleClass="normal" name="excelPath" key="global.crud.save"/>
        </div>

    </form>
</div>

<base:sortableClinicItem  categoryListPlaceHolder="Add labtest category" categoryNameItem="addLabtestName" operationAllUrl="clinic/customize/userLabTest/combo/loadAllMedicalTestGet" saveUrl="clinic/customize/userLabTest/multiSelect/save"/>

<script>


    $("#imprtFromExcel").click(function(){
        $("#imprtFromExcel").prop("disabled", true);
        var data = {};
        data.excelPath=$("#excelPath").val();
        jQuery.ajax({
            <%--url:"<c:url value='/' />" +"clinic/customize/userLabTest/multiSelect/save",--%>
            url:"<c:url value='/' />" +"clinic/customize/userLabTest/importLabTestFromExcel",
            data: JSON.stringify(data),
            type:"POST",
            dataType:"json",
            contentType:"application/json; charset=utf-8",
            success:function (result) {
                $("#imprtFromExcel").prop("disabled", false);
                if (result.state == "error") {
                    for (var i = 0; i < result.errors.length; i++) {
                        if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                            alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                        } else {
                            alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);

                        }
                    }
                }
                if (result.state == "success") {
                    alertify.success(result.message);
                    <%--window.location.href='<%= request.getHeader("referer")%>';--%>
                }
            },
            error:function(result){
                $("#imprtFromExcel").prop("disabled", false);
                if(result.status==401){
                    window.location.href=getBaseUrl();
                }
            }
        });
    });

</script>