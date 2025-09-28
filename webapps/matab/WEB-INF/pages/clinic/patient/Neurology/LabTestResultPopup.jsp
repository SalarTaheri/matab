<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
    String x="popupVisitId="+(String)request.getParameter("popupVisitId");
%>


<c:url value="/clinic/patient/neurology/popup/saveAndUpdate" var="createUrl" />
<c:url value="/clinic/patient/neurology/popup/grid-read" var="readUrl" />
<c:url value="/clinic/patient/neurology/popup/saveAndUpdate" var="updateUrl" />
<c:url value="${basePath}/grid-read" var="destroyUrl" />


<div class="demo-section">
</div>
<div class="body-header" dir="ltr">
    <button class="uk-button uk-button-success" id="labtest-save"
            type="button">Save
    </button>
</div>
<div class="demo-section">

    <kendo:listView name="listView" template="template"  pageable="true"  autoBind="false">
        <kendo:dataSource pageSize="200" serverPaging="true" serverFiltering="true" sync="sync_end">
            <kendo:dataSource-transport>
                <kendo:dataSource-transport-create url="${createUrl}" type="POST" contentType="application/json" />
                <kendo:dataSource-transport-read url="${readUrl}" type="POST" contentType="application/json"/>
                <kendo:dataSource-transport-update url="${updateUrl}" type="POST" contentType="application/json" />
                <kendo:dataSource-transport-parameterMap>
                    <script>
                        function parameterMap(options,type) {
                            if(type==="read"){
                                return JSON.stringify(options);
                            } else {
                                return JSON.stringify(options);
                            }
                        }
                    </script>
                </kendo:dataSource-transport-parameterMap>
            </kendo:dataSource-transport>
            <kendo:dataSource-schema data="data" total="total">
                <kendo:dataSource-schema-model id="id">
                    <kendo:dataSource-schema-model-fields>
                        <kendo:dataSource-schema-model-field name="id"
                                                             editable="false" nullable="true">
                        </kendo:dataSource-schema-model-field>
                        <kendo:dataSource-schema-model-field name="testName">
                        </kendo:dataSource-schema-model-field>
                        <kendo:dataSource-schema-model-field name="value">
                        </kendo:dataSource-schema-model-field>
                    </kendo:dataSource-schema-model-fields>
                </kendo:dataSource-schema-model>
            </kendo:dataSource-schema>
        </kendo:dataSource>
    </kendo:listView>

</div>
<base:footer></base:footer>
<script type="text/x-kendo-tmpl" id="template">
    #if(visitDate!=lastvisitDate){#
    #lastvisitDate=visitDate#
    #uId=uid#


    <div class="product-view k-widget" id="#= uId #" data-uid="#: uid #">

        <dl>
            <dt style=" width: 100%; ">#:visitDate#</dt>
        </dl>
    </div>
    <div class="product-view2 k-widget" id="#= uId #" data-uid="#: uid #">
        <dl>
            <dt style=" width: 70%; ">#:testName#</dt>
            <dd style=" width: 20%; "><input type="text" id="#:id#" style=" width: 100%; " dir="ltr"
                                             data-bind="value:value" name="value" value="#:value#"
                                             onkeyup="myKeyDown(this,event)">
                <span data-for="value" class="k-invalid-msg"></span></dd>
        </dl>

    </div>
    #}else{#
    <div class="product-view2 k-widget" data-uid="#= uid #">
        <dl>

            <dt style=" width: 70%; ">#:testName#</dt>
            <%--<dd style=" width: 20%; "><input type="text" id="#:testName#" style=" width: 100%; " dir="ltr"--%>
            <dd style=" width: 20%; "><input type="text" id="#:id#" style=" width: 100%; " dir="ltr"
                                             data-bind="value:value" name="value" value="#:value#"
                                             onkeyup="myKeyDown(this,event)">
                <span data-for="value" class="k-invalid-msg"></span></dd>
        </dl>
    </div>
    #}#
</script>


<script>
    var lastvisitDate;
    $(document).ready(function() {
        $("#listView").kendoMobileListView({
            filterable: true
        });
        var listView = $("#listView").data("kendoListView");
        $(".k-add-button").click(function(e) {
            listView.add();
            e.preventDefault();
        });
        $filter = new Array();
        $filter.push({ field: "patient_id", operator: "eq", value: ${patientId}});
        listView.dataSource.filter($filter);
    });
    var labTestValues={};
//    $("#labtest-save").click(function(){
//        keyArrays=Object.keys(labTestValues);
//        for(var i=0;i<keyArrays.length;i++){
//            var value=labTestValues[keyArrays[i]]
//            var id=keyArrays[i];
//            var item=$("#listView").data("kendoListView").dataSource.get(id);
//            item.set("value",value) ;
//        }
//        $("#listView").data("kendoListView").dataSource.sync();
//    });
    $("#labtest-save").click(saveLabTest);
    function saveLabTest(){
        keyArrays=Object.keys(labTestValues);
        for(var i=0;i<keyArrays.length;i++){
            var value=labTestValues[keyArrays[i]]
            var id=keyArrays[i];
            var item=$("#listView").data("kendoListView").dataSource.get(id);
            item.set("value",value) ;
        }
        $("#listView").data("kendoListView").dataSource.sync();

    }
    function myKeyDown(thi,e){
        console.log("thi.value:"+thi.value);
        var dataId=thi.id;
        var listView = $("#listView").data("kendoListView");
        var data = listView.dataSource._data;
        for(var i=0;i<data.length;i++){

            if(data[i].id==dataId){
                var item=listView.dataSource.at(i);
                labTestValues[dataId]=thi.value;

            }
        }
    }

    function  sync_end(e){
        console.log(e);
        $("#listView").data("kendoListView").dataSource.read();
        parent.emptyPatientFile();
        parent.loadPatientFile();
        parent.emptyLabTestReport();
        parent.loadLabTestReport();
        labTestValues={};
    }
</script>

<style scoped>
    .demo-section {
        width: 100%;
    }
    .product-view
    {
        float: left;
        position: relative;
        /*width: 301px;*/
        width: 100%;
        margin: -1px -1px 0 0;
    }.product-view2
    {
        float: left;
        position: relative;
        width: 301px;
        margin: -1px -1px 0 0;
    }

    .product-view dl
    {
        margin: 10px 0;
        padding: 0;
        min-width: 0;
    } .product-view2 dl
    {
        margin: 10px 0;
        padding: 0;
        min-width: 0;
    }
    .product-view dt, dd
    {
        float: left;
        margin: 0;
        padding: 3px;
        height: 26px;
        width: 160px;
        line-height: 26px;
        overflow: hidden;
    } .product-view2 dt, dd
    {
        float: left;
        margin: 0;
        padding: 3px;
        height: 26px;
        width: 160px;
        line-height: 26px;
        overflow: hidden;
    }
    .product-view dt
    {
        clear: left;
        padding: 3px 5px 3px 0;
        text-align: center;
        opacity: 0.6;
        width: 100px;
    }.product-view2 dt
    {
        clear: left;
        padding: 3px 5px 3px 0;
        text-align: right;
        opacity: 0.6;
        width: 100px;
    }
    .k-listview
    {
        border: 0;
        padding: 0;
        min-width: 605px;
        /*min-height: 298px;*/
    }
    .k-listview:after, .product-view dl:after
    {
        content: ".";
        display: block;
        height: 0;
        clear: both;
        visibility: hidden;
    }
    .edit-buttons
    {
        position: absolute;
        top: 0;
        right: 0;
        width: 26px;
        height: 146px;
        padding: 2px 2px 0 3px;
        background-color: rgba(0,0,0,0.1);
    }
    .edit-buttons .k-button
    {
        width: 26px;
        margin-bottom: 1px;
    }
    .k-pager-wrap
    {
        border-top: 0;
    }
    span.k-invalid-msg
    {
        position: absolute;
        margin-left: 6px;
    }
</style>