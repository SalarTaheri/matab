var staticPagesData = "";
$.getJSON(basePath.replace("/file/", "/load/") , function(data) {
    staticPagesData = data;
});

$(function(){
    var i = 0;
    //for(i=0; i<pages.length; i++){

    //}

    var i=0, page;

    var kanbanTmpl = doT.template($("#p_kanban_tmpl").html());
    var kanbanStaticTmpl = doT.template($("#p_kanban_tmpl_static").html());

    /*for(i=0; i<pages.length; i++){
        page = pages[i];
        extend(page, PageMixin);
        page.index = i + 1;
        page.uid = "q_page_" + page.id();

        if(page.isStatic){
            $("#p-kanban-static").append(kanbanStaticTmpl(page));
        }else{
            appendKanbanPage(page, kanbanTmpl);
        }

    }*/

    $("#p-card-navigator-right").click(function(e){
        cardNavigator(e, 1);
    });
    $("#p-card-navigator-left").click(function(e){
        cardNavigator(e, -1);
    });

    bindFunctionalityToCards();
});

function cardNavigator(e, step){
    var count = parseInt($("#p-card-navigator-count").text());
    var curr = parseInt($("#p-card-navigator-current").text());
    curr += step;
    if(curr > count)
        curr = 1;
    if(curr < 1)
        curr = count;
    $("#p-card-navigator-current").text(curr);
    var uid = $("#p-card-view-pages form:visible").attr("id");
    loadPage(uid, curr);

    e.preventDefault();
}

var currentLoadedPageId;
function loadPage(uid, index){
    var page = pages.filter(function(page) {
        return page.uid == uid;
    })[0];
    $.getJSON(basePath.replace(/file\/\w*/, "file/load/" + page.id() + "/" + masterId + "/" + index) , function(data) {
        Clinic.populatePage(data);
        currentLoadedPageId = data._id.$oid;
    });
}

function appendKanbanPage(page, kanbanTmpl){
    $.getJSON(basePath.replace("/file/", "/file/count/") + "/" + page.id() , function(data) {
        page.count = data.count;
        if(data.count > 0)
            $("#p-kanban-main").append(kanbanTmpl(page));
        else
            $("#p-kanban-unused").append(kanbanTmpl(page));

        detailsClickHandller();
        prescriptionClickHandller();
        unusedCardsClickHandller();
    });
}

var viewPageSlide, kanbanPageSlide;

function bindFunctionalityToCards(){
    unusedCardsClickHandller();

    viewPageSlide = kendo.fx($("#p-card-view-page")).slideIn("right");
    kanbanPageSlide = kendo.fx($("#p-kanban-view-page")).slideIn("right");

    detailsClickHandller();
    prescriptionClickHandller();

    $("#p-btn-card-back").click(function(){
        $("form.p-myform").hide();
        viewPageSlide.reverse();
        $("#p-card-view-page").hide();
        kanbanPageSlide.play();
        detailsClickHandller();
    });

    $("#p-btn-card-save").click(function(){
        var uid = $("#p-card-view-pages form:visible").attr("id");
        savePage(uid);
    });

    $("#p-btn-card-prescription").click(function(){
        var uid = $("#p-card-view-pages form:visible").attr("id");
        $("#p-card-navigator").hide();
        currentLoadedPageId = "";
        var page = pages.filter(function(page) {
            return page.uid == uid;
        })[0];
        Clinic.populatePage(page);
    });
}

function savePage(uid){
    var page = pages.filter(function(page) {
        return page.uid == uid;
    })[0];
    var data = Clinic.collectDataFromPage(page);

//    data["patientId"] = patientId;
    data[masterIdStr] = masterId;
    data["id"] = currentLoadedPageId;

    Common.postJSON(basePath.replace(/file\/\w*/, "save") , JSON.stringify(data), function(){
        $("form.p-myform").hide();
        viewPageSlide.reverse();
        $("#p-card-view-page").hide();
        kanbanPageSlide.play();

        $.getJSON(basePath.replace("/file/", "/file/count/") + "/" + page.id() , function(data) {
            page.count = data.count;
            $("#card_" + uid + " .p-count").text(data.count);
            $("#card_" + uid).removeClass (function (index, css) {
                return (css.match (/\bp-cards-\S+/g) || []).join(' ');
            });
            $("#card_" + uid).addClass("p-cards-" + data.count);
        });

        detailsClickHandller();
        prescriptionClickHandller();
    });
}

function unusedCardsClickHandller(){
    $(".p-kanban-unused > div.p-kanban-card").unbind("click").click(function(){
        var t = $(this).remove();
        $("#p-kanban-main").append(t);

        prescriptionClickHandller();
    });
}

function detailsClickHandller(){
    $(".p-card-details").unbind("click").click(function(e){
        var card = $(this).parent().parent().parent();
        renderCardPage(card.attr("id").replace(/^card_/, ""));

        $("#p-btn-card-save").show();
        if($(this).attr("data-isStatic")){
            $("#p-btn-card-save").hide();
        }

        var count = $(".p-count", card).text();
        $("#p-card-navigator").hide();
        $("#p-btn-card-prescription").show();

        kanbanPageSlide.reverse();
        $("#p-kanban-view-page").hide();
        viewPageSlide.play();
        e.preventDefault();

        if(count > 0){
            $("#p-card-navigator").show();
            $("#p-card-navigator-count").text(count);
            $("#p-card-navigator-current").text(1);

            var uid = $("#p-card-view-pages form:visible").attr("id");
            loadPage(uid, 1);
        }else{
            $("#p-card-navigator").hide();
            $("#p-btn-card-prescription").hide();
        }
        return false;
    });
}

function prescriptionClickHandller(){
    $(".p-card-prescription").unbind("click").click(function(e){
        renderCardPage($(this).parent().parent().parent().attr("id").replace(/^card_/, ""));
        if($(this).attr("data-isStatic")){
            alert("Kasafat chera?!");
            return;
        }
        $("#p-btn-card-prescription").hide();
        $("#p-card-navigator").hide();
        $("#p-btn-card-save").show();
        kanbanPageSlide.reverse();
        $("#p-kanban-view-page").hide();
        viewPageSlide.play();
        e.preventDefault();
        return false;
    });
}

function renderCardPage(id){
    var page = pages.filter(function(page){
        return page.uid == id;
    })[0];

    if(page.isRendred){
        $("#" + id).show();
        return;
    }

    var pageTmpl = doT.template($("#p_page").html());

    page.content = renderQuestions(page.qs, page.uid);
    $("#p-card-view-pages").append(pageTmpl(page));
    page.content = "";
    page.isRendred = true;
    if(page.isStatic)
        Clinic.populatePage(staticPagesData[page.title]);
    bindFunctionalityToPage();
}
