<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="gridPopupName" required="true" rtexprvalue="true" %>
<%@ attribute name="selectGridName" required="true" rtexprvalue="true" %>
<%@ attribute name="relativePopupUrl" required="true" rtexprvalue="true" %>
<%@ attribute name="fieldQueryPopup" required="true" rtexprvalue="true" %>
<%@ attribute name="functionValueQueryPopup" required="true" rtexprvalue="true" %>


<script type="text/javascript">
    //todo just for resolve error o function:begin
    function _${gridPopupName}_onDelete(e){
        var areUShure = "test";
        var data = this.dataItem($(e.target).closest("tr"));
        alertify.confirm(areUShure, function (e) {
            if (e) {
                jQuery.ajax ({
                    url: basePath + "remove",
                    type: "POST",
                    data: JSON.stringify({id: data.id}),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function(result){
                        if(result.state == "success"){
                            $("#grid").data("kendoGrid").dataSource.read();
                            alertify.success(result.message);
                        }else if(result.state == "error"){
                            for(var i=0; i<result.errors.length; i++){
                                alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                            }
                        }else{
                            lertify.error("Something is not good! O_o");
                        }

                    },
                    error:function(result){
                        if(result.status==401){
                            window.location.href="";
                        }
                    }
                });
            }
        });
    }

    function _${gridPopupName}_onEdit(e){
        var data = this.dataItem($(e.target).closest("tr"));
        if(typeof(grid_onEdit)=="function"){
            grid_onEdit(data);
        }else{
            window.location = basePath + "edit/" + data.id;
        }
    }

    function _${gridPopupName}_requestEnd(e){
        if(typeof(${gridPopupName}_requestEnd_callback) == "function"){
            ${gridPopupName}_requestEnd_callback(e);
        }
    }
    //todo just for resolve error o function:begin

    function  _${selectGridName}_popup(e,rowData){

        var relativePopupUrl="<%=relativePopupUrl%>";
        var popUpUrl = getBaseUrl() + relativePopupUrl;
        if(typeof(${selectGridName}_beforeCallRelativePopupUrl) == "function"){
            popUpUrl=${selectGridName}_beforeCallRelativePopupUrl(e,popUpUrl,rowData);
        }
        $.get(popUpUrl, function (data) {
            $("#modal-detail").empty();
            var id = 'detail_popup';
            $("#modal-detail").append('<div id="' + id + '" class="uk-modal">');
//            $("#modal-detail").append(data);
            $("#" + id).append(data);
            var modal = new $.UIkit.modal.Modal("#" + id);

            $("#" + id).on(
                    {
                        'uk.modal.hide':function () {
                            $("#modal-detail").empty();
                        }
                    }
            );
            var selectGrid = $("#"+"${selectGridName}").data("kendoGrid");
            var row = selectGrid.dataItem($(e.target).closest("tr"));
            grid = $("#"+"${gridPopupName}").data("kendoGrid");
//            var realId = row.realId.split(':');

            var value=window["${functionValueQueryPopup}"](row);

            var fieldQueryPopupComma="${fieldQueryPopup}";

            var fieldQueryPopupArray=fieldQueryPopupComma.split(',');

            var filterArray=[];
            for(var i=0;i<fieldQueryPopupArray.length;i++){
                var filterItemMap={};
                filterItemMap['field']=fieldQueryPopupArray[i];
                filterItemMap['operator']="eq";
                filterItemMap['value']=value[i];
                filterArray[i]=filterItemMap;
            }

            grid.dataSource.filter([
                {"logic":"and",
                    "filters":filterArray}
            ]);

            modal.show();

            if ("${disableBackground}" == "true") {
                $('.uk-modal').css('background', 'rgba(255, 255, 255, 0)');
            }

            $("#cancel-button").click(function () {
                modal.hide();

            });
            $(".my-popup-body").css('padding','0px');
        });
    }


</script>
