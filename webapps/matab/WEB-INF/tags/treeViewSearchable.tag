
<%@tag import="java.util.ResourceBundle"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>

<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="key" required="true" rtexprvalue="true"%>
<%@ attribute name="dataLoaderController" required="true" rtexprvalue="true"%>
<%@ attribute name="disabled" required="false" rtexprvalue="true"%>
<%@ attribute name="direction" required="false" rtexprvalue="true"%>
<%@ attribute name="styleClass" required="false" rtexprvalue="true"%>
<%--<%@ attribute name="outputResultTag" required="true" rtexprvalue="true"%>--%>
<%--<%@ attribute name="previousResultTag" required="true" rtexprvalue="true"%>--%>

<%
    if(direction==null || direction.equals(""))
        direction="direction:rtl";
    else
        direction="direction:ltr";

    if(styleClass==null ||styleClass.length()==0||styleClass.equals("normal"))
        styleClass="uk-width-4-10";
    else if(styleClass.equals("small"))
        styleClass="uk-width-2-10";
    else if(styleClass.equals("larg"))
        styleClass="uk-width-6-10";
%>
<jsp:doBody />

<div class="container uk-width-6-10" style="width: 100%; " >

    <div class="treeview-back k-rtl" style="  width: 100%;" >
        <label style=" padding-right: 10px; " for='search-term_${name}'><%=ResourceBoundleHolder.resourceBundle.getString("global.crud.search")%> </label><input type=text id='search-term_${name}' style=" width: 95%; " autofill="off" autocomplete="off" />
        <div id="${name}" style="overflow: hidden"></div>
    </div>
</div>
<script>
    $(document).ready(function() {
//        split();
        $("#${name}").kendoTreeView({
            autoBind:true,
            dataSource: {
                transport: {
                    parameterMap: function (options) {
                        return JSON.stringify(options);
                    },
                    read: {
                        contentType: "application/json",
                        type: "POST",
                        url:"${pageContext.request.contextPath}" + "${dataLoaderController}",
                        dataType: "json"
                    }
                },
                schema: {
                    model: {
                        id: "modelID",
                        hasChildren: "hasChild"
                    }
                }
            },
            dataTextField: "modelCaption",
            select: function(e) {
//                console.log("dataItem:", this.dataItem(e.node));
                if(typeof(callback_treeview_select_${name}) == "function"){
                    callback_treeview_select_${name}(this.dataItem(e.node));
                }
            },dataBound:function(e){
              /*  var treeview = $("#${name}").data("kendoTreeView");
//                treeview.expand(".k-item");
                if(typeof(callback_treeview_dataBound_${name}) == "function"){
                    callback_treeview_dataBound_${name}(treeview,e);
                }*/
                if(!isExpandInLoading){
                    expandNextLevel();
                    isExpandInLoading=true;
                }
            }
        });

        var isExpandInLoading=false;
        function expandNextLevel() {
            setTimeout(function () {
                var treeview = $("#${name}").data("kendoTreeView");
                var b = $('.k-item .k-plus').length;
                treeview.expand(".k-item");
                treeview.trigger('dataBound');
                if (b > 0) {
                    expandNextLevel();
                }else{
                    $("#${name}").data("kendoTreeView").collapse(".k-item");
                }

            }, 20);
        }
        $('#search-term_${name}').on('keyup', function () {
            if(!isExpandInLoading){
//                expandNextLevel();
                isExpandInLoading=true;
            }
            $('span.k-in > span.highlight').each(function(){
                $(this).parent().text($(this).parent().text());
            });

            // ignore if no search term
            if ($.trim($(this).val()) == '') {
                $("#aaa").data("kendoTreeView").collapse(".k-item");
                return;
            }

            var term = this.value.toUpperCase();
            var tlen = term.length;

            $('#${name} span.k-in').each(function(index){
                var text = $(this).text();
                var html = '';
                var q = 0;
                while ((p = text.toUpperCase().indexOf(term,q)) >= 0)
                {
                    html += text.substring(q,p) + '<span class="highlight">' + text.substr(p,tlen) + '</span>';
                    q = p + tlen;
                }

                if (q > 0) {
                    html += text.substring(q);
                    $(this).html(html);

                    $(this).parentsUntil('.k-treeview').filter('.k-item').each(
                            function (index,element) {
                                tv.expand($(this));
                                $(this).data('search-term_${name}',term);
                            }
                    );
                }
            });

            $('#${name} .k-item').each(function(){
                if ($(this).data('search-term_${name}') != term) {
                    tv.collapse($(this));
                }
            });
        }) ;

        var tv = $('#${name}').data('kendoTreeView');

        $("#${name}").data("kendoTreeView").dataSource.bind("error", function(e){
            errorRequestAjax(e);
        });

    });

   /* function selectOneItem_${name}(item){
        $('span.k-in > span.highlight').each(function(){
            $(this).parent().text($(this).parent().text());
        });

        var tv = $('#${name}').data('kendoTreeView');
//        var term = this.value.toUpperCase();
        var term = item.toUpperCase();
        var tlen = term.length;

        $('#${name} span.k-in').each(function(index){
            var text = $(this).text();
            var html = '';
            var found = false;
            while ( text.toUpperCase()==term)
            {
                html +=  '<span class="highlight">' + text + '</span>';
                found=true;
                break;
            }

            if (found) {
                html += text;
                $(this).html(html);

                $(this).parentsUntil('.k-treeview').filter('.k-item').each(
                    function (index,element) {
                        tv.expand($(this));
                        $(this).data('search-term_${name}',text);
                    }
                );
            }
        });

        $('#${name} .k-item').each(function(){
            if ($(this).data('search-term_${name}') != term) {
                tv.collapse($(this));
            }
        });
    }*/

</script>
<style scoped>
    #treeview .k-sprite {
        background-image: url("../../content/web/treeview/coloricons-sprite.png");
    }

    .rootfolder { background-position: 0 0; }
    .folder     { background-position: 0 -16px; }
    .pdf        { background-position: 0 -32px; }
    .html       { background-position: 0 -48px; }
    .image      { background-position: 0 -64px; }

    .treeview-back
    {
        /*float: left;*/
        margin: 0 0 2em;
        padding: 0px;
        -moz-box-shadow: 0 1px 2px rgba(0,0,0,0.45), inset 0 0 30px rgba(0,0,0,0.07);
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,0.45), inset 0 0 30px rgba(0,0,0,0.07);
        box-shadow: 0 1px 2px rgba(0,0,0,0.45), inner 0 0 30px rgba(0,0,0,0.07);
        -webkit-border-radius: 8px;
        -moz-border-radius: 8px;
        border-radius: 8px;
    }

    .container
    {
        margin: 0 30px;
        float: left;
        width: 100%;
    }

    #result
    {
        /*float: left;*/
        padding: 0px;
        -moz-box-shadow: 0 1px 2px rgba(0,0,0,0.45), inset 0 0 30px rgba(0,0,0,0.07);
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,0.45), inset 0 0 30px rgba(0,0,0,0.07);
        box-shadow: 0 1px 2px rgba(0,0,0,0.45), inner 0 0 30px rgba(0,0,0,0.07);
        -webkit-border-radius: 8px;
        -moz-border-radius: 8px;
        border-radius: 8px;
    }

    span.k-in > span.highlight {background:yellow}
</style>