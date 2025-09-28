<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="java.util.ResourceBundle"%>
<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader/>
<base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container" >

    <form class="uk-form" id="mainForm">
        <input type="hidden" id="id" name="id" >
        <input type="hidden" id="user_id" name="user_id" >
        <div class="uk-grid uk-grid-preserve">
            <base:testBox name="name" key="clinic.customize.userDrugGroup.name"/>
        </div>

        <div class="uk-grid uk-grid-preserve">
            <div class="uk-width-1-10 left-align">
                <label for="drugOrders_customized"><%=ResourceBoundleHolder.resourceBundle.getString("clinic.customize.userDrugGroup")%></label>
            </div>
            <div class="uk-width-4-10">
                <%--<base:optiion widthValue="70" absulotePath="clinic/customize/userLabTest/combo/loadSelectedLabTestGet"--%>
                <%--<base:optiion widthValue="40" absulotePath="clinic/customize/userLabTestGroup/combo/loadAllMedicalTestGet"--%>
                <base:optiion widthValue="40" absulotePath="clinic/drug/drug/combo/loadAllDrugMultiSelect"
                              name="drugOrders_customized" key="" noneSelectedText="select drugs"/>
            </div>
        </div>

    </form>
</div>

<script type="text/javascript">
    function callback_afterSerialize(tmp){
        tmp['userDrugGroupItem']=$("#drugOrders_customized").val();
        return tmp;
    }
    function callback_deserialize(data){
        if(data['userDrugGroupItem']==null){
            $("#drugOrders_customized").multiselect("uncheckAll");
            return;
        }
        labTestList=data['userDrugGroupItem'];
        i = 0, size = data['userDrugGroupItem'].length;
        for(i; i < size; i++){
            $("#drugOrders_customized").multiselect("widget").find(":checkbox[value='"+labTestList[i]+"']").attr("checked","checked");
            $("#drugOrders_customized option[value='" + labTestList[i] + "']").attr("selected", 1);
            $("#drugOrders_customized").multiselect("refresh");

        }
        var size=$(".ui-multiselect").size();
        for(var i=0;i<size;i++){
            $(".ui-multiselect")[i].style.width="65%";
        }
        $(".ui-multiselect-menu").css("width",'36%');
    }
</script>