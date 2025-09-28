
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>

<%@ tag import="java.util.ResourceBundle" %>
<%@ tag import="org.springframework.web.util.UrlPathHelper" %>
<%--<%@ attribute name="name" required="true" rtexprvalue="true"%>--%>
<%@ attribute name="categoryListPlaceHolder" required="true" rtexprvalue="true"%>
<%@ attribute name="categoryNameItem" required="true" rtexprvalue="true"%>
<%@ attribute name="operationAllUrl" required="true" rtexprvalue="true"%>
<%@ attribute name="saveUrl" required="true" rtexprvalue="true"%>



<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>


<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
	request.setAttribute("basePath", basePath);
 %>

 <input name="loadedId" type="hidden" id="loadedId" />

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<div id="header-toolbar">
		<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" id="userView-save"/>
	</div>
</div>

<div align="left" style=" display: inline-block; width: 100%; direction: ltr; ">
    <%--<div class="uk-width-6-10">--%>
    <div id="leftDiv" style="display: inline-block;width: 40%;vertical-align: top;;border:solid 1px #ccc;border-radius: 5px;overflow: auto;margin-left: 20px">
        <div id="nameCategoryList" style="direction: ltr;width: 100%;">
            <%--<input id="addLabtestName" placeholder="Add labtest category"/>--%>
            <input id="${categoryNameItem}" placeholder="${categoryListPlaceHolder}"/>
            <button id="addCategory">
                +
            </button>
            <ul class="list">
            </ul>

        </div>
    </div>

    <div id="rightDiv"style="display: inline-block;width: 50%;border:solid 1px #ccc;border-radius: 5px;overflow: auto;margin-left: 70px">
        <%--<base:optiion widthValue="40" absulotePath="clinic/customize/userLabTest/combo/loadAllMedicalTestGet"
                      name="orders_customized" key="" noneSelectedText="select customized LabTest"
                      checkAllEventMethod="checkAllCustomizeEvent" clickEventMethod="clickCustomizeEvent"
                      optgrouptoggleEventMethod="optgrouptoggleCustomizeEvent"
                      unCheckAllEventMethod="unCheckAllCustomizeEvent" beforeCloseEventMethod="beforeCloseCustomizeEvent" selectedList="0">
        </base:optiion>--%>
        
        <base:optiion widthValue="40" absulotePath="${operationAllUrl}"
                      name="orders_customized" key="" noneSelectedText="select..."
                       clickEventMethod="clickCustomizeEvent"
                      optgrouptoggleEventMethod="optgrouptoggleCustomizeEvent"
                      unCheckAllEventMethod="unCheckAllCustomizeEvent" beforeCloseEventMethod="beforeCloseCustomizeEvent" selectedList="0">
        </base:optiion>
        <div id="itemList" style="direction: ltr;width: 100%;">
            <input class="search" placeholder="Search" />
            <button class="sort" data-sort="item" id="sortItem">
                Sort by name
            </button>
            <ul class="list">
            </ul>
        </div>
    </div>
</div>
</div>
<base:dialogConfirm name="dialogDeleteNameCategory" key="action.alert.areYouSure.delete" yesFunction="yesDeleteNameCategory"/>
<base:dialogConfirm name="dialogDeleteItem" key="action.alert.areYouSure.delete" yesFunction="yesDeleteItem"/>
<base:dialogAlert name="dialogAlertDuplicatItem" key="action.alert.duplicate.item"/>

<div id="editNameCategory" class="uk-container uk-container-center my-uk-container" style="display:none;direction: rtl;">
    <div class="uk-grid uk-grid-preserve">
        <base:testBox styleClass="small" styledivLabel="width:10%;height:100%" name="nameCategory" key="clinic.patient.firstName" />
    </div>
</div>

<base:footer></base:footer>
<script>
var currentNameCategorySelect;
$('.ui-multiselect-all')[0].parentElement.remove();
$("#editNameCategory").dialog({
    autoOpen:false,
    show:{
        effect:"slide",
        duration:300
    },
    hide:{
        effect:"slide",
        duration:300
    },
//    height:800,
    width:800,
    modal:true,
    buttons:{
        "apply":function () {

            var oldValue=$(this).data('contents').parents()[1].childNodes[1].innerText;
//            $(this).data('contents').parents()[1].childNodes[1].innerText=$("#nameCategory").val();
            if(nameCategoryList.get('nameCategory', $("#nameCategory").val()).length>0){
                $(this).dialog("close");
                $("#dialogAlertDuplicatItem").dialog("open");
                return;
            }

            var item=nameCategoryList.get('nameCategory', oldValue)[0];
            item.values({
                nameCategory:$("#nameCategory").val()
            });

//            console.log($(this).data('contents'));
            var counter=0;
            Object.keys(nameCategoryMap).forEach(function(key) {
                counter++;
                if(key==oldValue){

                    nameCategoryMap[$("#nameCategory").val()] = nameCategoryMap[oldValue];
                    delete nameCategoryMap[key];
                }

            });
            if(counter>0){
                newSortCategory();
            }
            if(currentNameCategorySelect==oldValue){
                currentNameCategorySelect=$("#nameCategory").val();
            }
            $("#nameCategory").val("");
            console.log(nameCategoryMap);
            $(this).dialog("close");
        },
        "cancel":function () {

            $(this).dialog("close");
        }
    }
});

    $("#leftDiv").css("max-height",$(window).height()-($(".body-header").height()*2)) ;
    $("#rightDiv").css("max-height",$(window).height()-($(".body-header").height()*2)) ;
    var $widget = $("select").multiselect(),
            state = false;
    $widget.multiselect('disable');


    var options = {
        valueNames: [ 'item' ],
        page:1000,
        item: '<li style="display: inline-block;width: 95%"><span  class="sort-handle">&#8225;</span><h3 style="display: inline-block;" class="item"></h3><p hidden class="id"></p><a style="float: right;"  href="#"><img onclick="deleteLiItem($(this))" src="<c:url value='/resources/images/delete/Actions-button-cancel-icon8.png'/>" alt=""/></a></li>'
    };

    var optionsNameCategory = {
        valueNames: [ 'nameCategory' ],
//        item: '<li style="display: inline-block;width: 95%"><span  class="sort-handle">&#8225;</span><h3 style="display: inline-block;" class="nameCategory"></h3><span   style="float: right;"><a  href="#"><img onclick="deleteLi()"  alt=""/></a></span></li>'
        item: '<li style="display: inline-block;width: 95%"><span  class="sort-handle">&#8225;</span><h3 style="display: inline-block;" class="nameCategory"></h3><a style="float: right;margin-left:10px;" href="#"><span onclick="editClick($(this))" style="float:right" class="k-icon k-edit"></span></a><a style="float: right;"  href="#"><img onclick="deleteLiNameCategory($(this))" src="<c:url value='/resources/images/delete/Actions-button-cancel-icon8.png'/>" alt=""/></a></li>'
    };
//
    var nameCategoryList = new List('nameCategoryList', optionsNameCategory);

    var itemList = new List('itemList', options);

    var nameCategoryMap={};

    $('.list').selectable({
        cancel: '.sort-handle,img,span',
        selected: function( event, ui ) {
            console.log(event,ui);
            if(ui.selected.parentElement.parentElement.id=="nameCategoryList"){
                if(state==false){
                    state=true;
                    $widget.multiselect('enable');
                }
                if(currentNameCategorySelect!=ui.selected.childNodes[1].innerText){
                    itemList.clear();
                    var labTestCheckedList=$("#orders_customized").multiselect("widget").find(":checkbox:checked");
                    for(var i=0;i<labTestCheckedList.length;i++){
                        $("#orders_customized").multiselect("widget").find(":checkbox[value='" +labTestCheckedList[i].value + "']").attr("checked", "false");
                        $("#orders_customized option[value='" +labTestCheckedList[i].value  + "']").attr("selected", false);
//                        $("#orders_customized").multiselect("refresh");

                    }
                    currentNameCategorySelect=ui.selected.childNodes[1].innerText;

                    //load list item
                    var labTestListOfNameCategory=nameCategoryMap[currentNameCategorySelect];
                    if(labTestListOfNameCategory!=undefined){
                        for(var j=0;j<labTestListOfNameCategory.length;j++){
                            var labTestMap=labTestListOfNameCategory[j];
                            if(labTestMap['value']!=undefined){
                                itemList.add({ item: labTestMap['value'].trim() , id: labTestMap['id'].trim() });
                                $("#orders_customized").multiselect("widget").find(":checkbox[value='" +labTestMap['id']+ "']").attr("checked", "true");
                                $("#orders_customized option[value='" +labTestMap['id'] + "']").attr("selected", true);
                            }

                        }
                    }
                    $("#orders_customized").multiselect("refresh");


                }

            }

        }
    }).sortable({
                items: "> li",
                handle: '.sort-handle',
                helper: function(e, item) {
                    if ( ! item.hasClass('ui-selected') ) {
                        item.parent().children('.ui-selected').removeClass('ui-selected');
                        item.addClass('ui-selected');
                    }

                    var selected = item.parent().children('.ui-selected').clone();
                    item.data('multidrag', selected).siblings('.ui-selected').remove();

                    return $('<li/>').append(selected);
                },
                stop: function(e, ui) {
                    var selected = ui.item.data('multidrag');

                    if(ui.item[0].parentElement.parentElement.id=="nameCategoryList"){
                        newSortCategory();
                    }else{
                        newSortItems();
                    }
                    ui.item.after(selected);
                    ui.item.remove();

                }
            });

jQuery.ajax({
    <%--url:"<c:url value='/' />" +"clinic/customize/userLabTest/multiSelect/save",--%>
    url:basePath + '/load/',
    type:"GET",
    dataType:"json",
    contentType:"application/json; charset=utf-8",
    success:function (data) {
//        nameCategoryMap=data;
        console.log(data);

        for(var i=0;i< data.length;i++){
            var labTestListOfNameCategoryNew=[];
            for(var j=0;j<data[i].list.length;j++){
               var labTestIdtestMap={};
               if(j==data[i].list.length-1){
                   labTestIdtestMap["order"]=parseInt(data[i].list[j].order);
                   labTestListOfNameCategoryNew[j]=labTestIdtestMap;
               }else{
                   labTestIdtestMap["id"]=data[i].list[j].id;
                   labTestIdtestMap["value"]=data[i].list[j].value;
                   labTestListOfNameCategoryNew[j]=labTestIdtestMap;
               }
           }
           nameCategoryMap[data[i].string]=labTestListOfNameCategoryNew;

            nameCategoryList.add({ nameCategory: data[i].string });

        }
        console.log(nameCategoryMap);
    },
    error:function(result){
        if(result.status==401){
            window.location.href=getBaseUrl();
        }
    }
});
  /*  $.getJSON(basePath + '/load/', function(data) {
        nameCategoryMap=data;
          console.log(data);

        $.each(data, function (key, val) {
            if(currentNameCategorySelect==undefined){
//                currentNameCategorySelect=key;
            }
            nameCategoryList.add({ nameCategory: key });

        });

    });
*/
    $("#sortItem").on('click', function (event) {
        newSortItems();
    });


    function deleteLiNameCategory(e){

        $("#dialogDeleteNameCategory").data('contents',e).dialog("open");

    }

    function deleteLiItem(e){

        $("#dialogDeleteItem").data('contents',e).dialog("open");

    }

    function editClick(e){
        console.log(e);
        $("#nameCategory").val(e.parents()[1].childNodes[1].innerText);
        $("#editNameCategory").data('contents',e).dialog("open");
    }

    function yesDeleteNameCategory(e){
        nameCategoryList.remove("nameCategory",e.data('contents').parents()[1].childNodes[1].innerText);

        var newNameCategoryMap={};
        $.each(nameCategoryMap, function (key, val) {
            if(key!=e.data('contents').parents()[1].childNodes[1].innerText){
                newNameCategoryMap[key]=val;
            }
        });
        nameCategoryMap=newNameCategoryMap;
        console.log(nameCategoryMap);
    }

    function yesDeleteItem(e){
        var id=e.data('contents').parents()[1].childNodes[2].innerText;
        itemList.remove("id",id);
        removeItem(id);

        $("#orders_customized").multiselect("widget").find(":checkbox[value='" +id + "']").attr("checked", "false");
        $("#orders_customized option[value='" +id  + "']").attr("selected", false);
        $("#orders_customized").multiselect("refresh");
        console.log(nameCategoryMap);
    }

    $("#addCategory").on('click', function (event) {
        if(nameCategoryList.get('nameCategory', $('#${categoryNameItem}').val()).length==0){
            nameCategoryList.add({ nameCategory: $('#${categoryNameItem}').val() });
        }else{
            $("#dialogAlertDuplicatItem").dialog("open");
        }
        $('#${categoryNameItem}').val('');
    });

    function SelectSelectableElement (selectableContainer, elementsToSelect)
    {
        // add unselecting class to all elements in the styleboard canvas except the ones to select
        $(".ui-selected", selectableContainer).not(elementsToSelect).removeClass("ui-selected").addClass("ui-unselecting");

        // add ui-selecting class to the elements to select
        $(elementsToSelect).not(".ui-selected").addClass("ui-selecting");

        // trigger the mouse stop event (this will select all .ui-selecting elements, and deselect all .ui-unselecting elements)
        selectableContainer.data("ui-selectable")._mouseStop(null);
    }


    function callBack_after_full_date_orders_customized(){
//        $("#leftDiv").height($("#rightDiv").height());
    }

    function newSortItems(){
        var labTestListOfNameCategoryNew=[];
        for(var i=0;i< $('.list')[1].childNodes.length;i++){


            var labTestIdtestMap={};
            labTestIdtestMap["id"]=$('.list')[1].childNodes[i].childNodes[2].innerText;
            labTestIdtestMap["value"]=$('.list')[1].childNodes[i].childNodes[1].innerText;
            labTestListOfNameCategoryNew[i]=labTestIdtestMap;

        }
        nameCategoryMap[currentNameCategorySelect]=labTestListOfNameCategoryNew;
        newSortCategory();
        console.log(nameCategoryMap);
    }


    function newSortCategory(){
        var nameCategoryMapNew={};
        for(var i=0;i<$('.list')[0].childNodes.length;i++){
            var itemText=$('.list')[0].childNodes[i].childNodes[1].innerText;
            if(nameCategoryMap[itemText]!=undefined){
                if(nameCategoryMap[itemText][nameCategoryMap[itemText].length-1]['order']==undefined){
                    var labTestCategoryOrder={};
                    labTestCategoryOrder["order"]=i+1
                    nameCategoryMap[itemText][nameCategoryMap[itemText].length]=labTestCategoryOrder;
                    nameCategoryMapNew[itemText]=nameCategoryMap[itemText];
                }else{
                    nameCategoryMap[itemText][nameCategoryMap[itemText].length-1]['order']=i+1;
                    nameCategoryMapNew[itemText]=nameCategoryMap[itemText];
                }
            }
        }

        nameCategoryMap=nameCategoryMapNew;

        console.log(nameCategoryMap);
    }

    function addItem(id,value){

        var isDouplicate=false;
        $.each(nameCategoryMap, function (key, val) {

            for(var p=0;p<val.length;p++){
                if(val[p].id==id){

//                    $("#orders_customized").multiselect("widget").find(":checkbox[value='" +id + "']").attr("checked", "false");
//                    $("#orders_customized option[value='" +id  + "']").attr("selected", false);
//                    $("#orders_customized").multiselect("refresh");
                    isDouplicate=true;

                }
            }

        });
        if(isDouplicate==true){
            return false;
        }

        itemList.add({ item: value,id:id });
        if(nameCategoryMap[currentNameCategorySelect]==undefined){
            var labTestListOfNameCategory=[];

            var labTestIdtestMap={};
            labTestIdtestMap["id"]=id;
            labTestIdtestMap["value"]=value;
            labTestListOfNameCategory[0]=labTestIdtestMap;
            nameCategoryMap[currentNameCategorySelect]=labTestListOfNameCategory;

        }else{
            var labTestListOfNameCategory=nameCategoryMap[currentNameCategorySelect];

            var labTestIdtestMap={};
            labTestIdtestMap["id"]=id;
            labTestIdtestMap["value"]=value;
            labTestListOfNameCategory[labTestListOfNameCategory.length]=labTestIdtestMap;
            nameCategoryMap[currentNameCategorySelect]=labTestListOfNameCategory;

        }
    }

    function loadItem(id,value){

    }

    function removeItem(id){
        var labTestListOfNameCategory=nameCategoryMap[currentNameCategorySelect];
        for(var i=0;i<labTestListOfNameCategory.length;i++){
            var labTestIdtestMap=labTestListOfNameCategory[i];
            if(labTestIdtestMap["id"]==id){
                labTestListOfNameCategory.splice(i, 1);
            }else{

                labTestListOfNameCategory[i]=labTestIdtestMap;
            }
        }
        nameCategoryMap[currentNameCategorySelect]=labTestListOfNameCategory;
    }

function checkAllCustomizeEvent(event, ui){
    var falseReturnValue=false;
    for(var i=0;i<event.target.length;i++){
        if(itemList.get("item", event.target[i].innerText ).length==0){
            var isAdded=addItem(event.target[i].value,event.target[i].innerText.trim());
            if(isAdded==false){
                $("#dialogAlertDuplicatItem").dialog("open");
                event.preventDefault();
                return;
            }

        }
    }
    console.log(nameCategoryMap);
}

function clickCustomizeEvent(event,ui){
    var labtestname=$('#orders_customized option[value="' + ui.value + '"]').html();
    if(ui.checked==true){
         var isAdded=addItem(ui.value,labtestname);
        if(isAdded==false){
            $("#dialogAlertDuplicatItem").dialog("open");
            event.preventDefault();
            return;
        }
    }else{
        itemList.remove("id",ui.value);
        removeItem(ui.value);
    }

    console.log(nameCategoryMap);

}

function beforeCloseCustomizeEvent(event,ui){
    $("button")[2].childNodes[1].innerText="";
}

function optgrouptoggleCustomizeEvent(event,ui){
    if(ui.checked==true){
        var falseReturnValue=false;
        for(var i=0;i<ui.inputs.length;i++){
            if(itemList.get("item", ui.inputs[i].labels[0].innerText ).length==0){
//                itemList.add({ item: ui.inputs[i].labels[0].innerText.trim(),id:ui.inputs[0].value });
                var isAdded=addItem(ui.inputs[i].value,ui.inputs[i].labels[0].innerText.trim());
                if(isAdded==false){
                    falseReturnValue=true;
                }
            }
        }
        if(falseReturnValue==true){
            $("#dialogAlertDuplicatItem").dialog("open");
        }
    }else{
        for(var j=0;j<ui.inputs.length;j++){

            itemList.remove("id", ui.inputs[j].value);
            removeItem(ui.inputs[j].value);
        }

    }
    console.log(nameCategoryMap)
}

function unCheckAllCustomizeEvent(event,ui){

    itemList.clear();
    var labTestListOfNameCategory=[];
    nameCategoryMap[currentNameCategorySelect]=labTestListOfNameCategory;
    console.log(nameCategoryMap);
}

$("#userView-save").click(function(){

                jQuery.ajax({
                    <%--url:"<c:url value='/' />" +"clinic/customize/userLabTest/multiSelect/save",--%>
                    url:"<c:url value='/' />" +"${saveUrl}",
                    type:"POST",
                    data:JSON.stringify(nameCategoryMap),
                    dataType:"json",
                    contentType:"application/json; charset=utf-8",
                    success:function (result) {
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
                        if(result.status==401){
                            window.location.href=getBaseUrl();
                        }
                    }
                });
    });


</script>

<style>
	.uk-width-2-5, .uk-width-4-10 {
		width: 100%;
	}
	.ms-container {
		background: transparent url('../../../resources/js/img/switch.png') no-repeat 50% 50%;
		width: 100%;
		padding-top: 10px;
	}
	.uk-width-1-10 {
		width: 100%;
		height: 5%;
		text-align: -webkit-center;

	}

	.ms-list{
		direction: ltr;
	}
	.custom-header{
		text-align: center;
	}
		#body-content{
		background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#f2f5f6), color-stop(37%,#e3eaed), color-stop(100%,#c8d7dc)); /* Chrome,Safari4+ */
	}


    .list {
        font-family:sans-serif;
        margin:0;
        padding:20px 0 0;
    }
    .list > li {
        display:block;
        background-color: #eee;
        padding:10px;
        box-shadow: inset 0 1px 0 #fff;
    }
    .avatar {
        max-width: 150px;
    }
    img {
        max-width: 100%;
    }
    h3 {
        font-size: 16px;
        margin:0 0 0.3rem;
        font-weight: normal;
        font-weight:bold;
    }
    p {
        margin:0;
    }

    input {
        border:solid 1px #ccc;
        border-radius: 5px;
        padding:7px 14px;
        /*margin-bottom:10px*/
    }
    input:focus {
        outline:none;
        border-color:#aaa;
    }
    .sort {
        padding:8px 30px;
        border-radius: 6px;
        border:none;
        display:inline-block;
        color:#fff;
        text-decoration: none;
        background-color: #28a8e0;
        height:30px;
    }
    .sort:hover {
        text-decoration: none;
        background-color:#1b8aba;
    }
    .sort:focus {
        outline:none;
    }
    .sort:after {
        width: 0;
        height: 0;
        border-left: 5px solid transparent;
        border-right: 5px solid transparent;
        border-bottom: 5px solid transparent;
        content:"";
        position: relative;
        top:-10px;
        right:-5px;
    }
    .sort.asc:after {
        width: 0;
        height: 0;
        border-left: 5px solid transparent;
        border-right: 5px solid transparent;
        border-top: 5px solid #fff;
        content:"";
        position: relative;
        top:13px;
        right:-5px;
    }
    .sort.desc:after {
        width: 0;
        height: 0;
        border-left: 5px solid transparent;
        border-right: 5px solid transparent;
        border-bottom: 5px solid #fff;
        content:"";
        position: relative;
        top:-10px;
        right:-5px;
    }

    /*#list {*/
        /*list-style: none;*/
        /*padding-left: 0;*/
    /*}*/

    .list .sort-handle {
        display: none;
    }

    .list .ui-selected .sort-handle
    {
        display: inline;
        padding: 0 0.5em;
        cursor: pointer;
    }

    li.ui-selected {
        background-color: #8888cc;
        color: white;
        font-weight: bold;
        background-image: none;
    }
    li.ui-selecting {
        background-color: #ccccff;
        color: white;
        background-image: none;
    }


</style>