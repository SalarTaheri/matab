function extend(destination, source) {
    for (var k in source) {
        if (source.hasOwnProperty(k)) {
            destination[k] = source[k];
        }
    }
    return destination;
}

var textToId = function (text) {
    return text.replace(/\s/g, "_");
};

var PageMixin = {
    id:function () {
        return textToId(this.title);
    },
};

var QuestionMixin = {
    id:function () {
        return textToId(this.title);
    },
};

function renderPages(pages) {
    var i = 0, page;
    var pageTmpl = doT.template($("#p_page").html());

    for (i = 0; i < pages.length; i++) {
        page = pages[i];
        extend(page, PageMixin);
        page.index = i + 1;
        renderPage(page, pageTmpl);
    }
    bindFunctionalityToPage();
}

function renderPage(page, pageTmpl) {
    var i, q, qHtml;
    if (page.qs == undefined)
        return;

    page.uid = "q_page_" + page.id();
    page.content = renderQuestions(page.qs, page.uid);
    $("#pages").append(pageTmpl(page));
    page.content = "";
}

function renderQuestions(qs, parentUid, partial) {
    var i, result = "";

    partial = partial || false;
    for (i = 0; i < qs.length; i++) {
        result += renderAQuestion(qs[i], i + 1, parentUid, partial);
    }
    return result;
}

function renderAQuestion(q, index, parentUid, partial) {
    var result = "";
    var qWarpperTmpl = doT.template($("#p_question_wrapper").html());
    var qTmplElem = $("#p_type_" + q.type);

    extend(q, QuestionMixin);
    q.uid = parentUid + "_" + q.id();
    q.index = index;

    if (qTmplElem.length != 1) {
        qTmplElem = $("#p_type_unknown");
    }

    if (q.ifYesQuestion) {
        q.ifYesQuestion.content = renderAQuestion(q.ifYesQuestion, 0, q.uid, true);
        //console.log(q);
    }

    if (typeof(window["renderQuestion_" + q.type]) === "function")
        qHtml = window["renderQuestion_" + q.type](q, qTmplElem, parentUid);
    else
        qHtml = renderQuestion(q, qTmplElem, parentUid);

    if (!partial)
        result += qWarpperTmpl({content:qHtml, uid:q.uid, title:q.title, index:q.index, ifYesQuestion:q.ifYesQuestion, width:q.width, height:q.height, cols:q.cols, rows:q.rows, dir:q.dir});
    else
        result += qHtml;


    return result;
}

function renderQuestion(q, qTmplElem, parentUid) {
    var qTmpl = doT.template(qTmplElem.html());
    return qTmpl(q);
}


function renderQuestion_group(q, qTmplElem, parentUid) {
    q.content = renderQuestions(q.qs, parentUid + "_" + q.id());
    var qTmpl = doT.template(qTmplElem.html());
    var result = qTmpl(q);
    q.content = "";
    return result;
}

function renderQuestion_simple_matrix(q, qTmplElem, parentUid) {
    var t = renderQuestions(q.q, parentUid + "_" + q.id(), true);
    t = t.replace("p-q-select-chosen", "");
    q.content = t;

    q.getContentWithFixedName = function (row, col) {
        return  q.content.replace(/name="(\w*)"/i, 'name="$1___' + row + '_' + col + '"');
    };

    var qTmpl = doT.template(qTmplElem.html());
    var result = qTmpl(q);
    q.content = "";
    return result;
}

function renderQuestion_tabular(q, qTmplElem, parentUid) {
    for (var i = 0; i < q.cols.length; i++) {
        if (q.cols[i].type) {
            var t = [], tmpTitle;
            tmpTitle = q.cols[i].title;
            q.cols[i].title = q.title;
            t.push(q.cols[i]);
            q.cols[i].content = renderQuestions(t, parentUid, true);
            q.cols[i].content = q.cols[i].content.replace("p-q-select-chosen", "");
            q.cols[i].getContentWithFixedName = function (row, col) {
                return  q.cols[col].content.replace(/name="(\w*)"/i, 'name="$1_' + row + '_' + col + '"');
            };
            q.cols[i].title = tmpTitle;
        }
    }


    var qTmpl = doT.template(qTmplElem.html());
    return qTmpl(q);
}

var Clinic = new function () {

    this.savePages = function (id) {
        var data = {}, i;
        for (i = 0; i < pages.length; i++) {
            data[pages[i].title] = Clinic.collectDataFromPage(pages[i]);
        }

        data.collection = "Patient";
        if (typeof(id) !== "undefined")
            data["id"] = id;
        basePath = basePath.replace("/create", "/");
        Common.postJSON(basePath + "save", JSON.stringify(data));
    };

    this.savePage = function (uid, autoSave) {
        autoSave = autoSave || true;
        var page = pages.filter(function (page) {
            return page.uid == uid;
        })[0];
        var data = Clinic.collectDataFromPage(page);

        if (autoSave)
            Common.postJSON(basePath + "save", JSON.stringify(data));

        return data;
    };

    this.collectDataFromPage = function (page) {
        var data = {};
        data.title = page.title;
        data.collection = page.id();

        data.qs = Clinic.collectQuestions(page.qs);
        return data;
    };

    this.collectQuestions = function (qs) {
        var result = [], i, q, p;
        for (i = 0; i < qs.length; i++) {
            q = qs[i];
            p = {};
            p.title = q.title;
            p.uid = q.uid;
            p.type = q.type;
            if (typeof(Clinic["collectQuestion_" + q.type]) === "function")
                result.push(Clinic["collectQuestion_" + q.type](q, p));
            else
                result.push(Clinic.collectQuestion(q, p));
        }
        return result;
    };

    this.collectQuestion = function (q, p) {
        p.value = $("input[name='" + q.uid + "']").val();
        return p;
    };

    this.collectQuestion_textarea = function (q, p) {
        p.value = $("textarea[name='" + q.uid + "']").val();
        return p;
    };

    this.collectQuestion_group = function (q, p) {
        p.qs = Clinic.collectQuestions(q.qs);
        return p;
    };

    this.collectQuestion_yesno = function (q, p) {
        p.value = $("input[name='" + q.uid + "']:checked").val();
        return p;
    };

    this.collectQuestion_yesnoif = function (q, p) {
        p.value = $("input[name='" + q.uid + "']:checked").val();
        p.yes_value = "";
        if (p.value == "yes")
            p.yes_value = $("input[name='" + q.uid + "_ifyes']").val();
        return p;
    };

    this.collectQuestion_radio = function (q, p) {
        p.value = $("input[name='" + q.uid + "']:checked").val();
        return p;
    };

    this.collectQuestion_checkboxes = function (q, p) {
        p.options = [];
        for (var i = 0; i < q.options.length; i++) {
            var option = q.options[i], title = option.title || option, myid = q.uid + "_" + title.replace(/\s/g, "_");
            p.options.push({
                title:title,
                checked:$("input[name='" + myid + "']").is(':checked')
            });

        }
        p.value = $("#" + q.uid).val();
        return p;
    };

    this.collectQuestion_selectbox = function (q, p) {
        p.value = $("select[name='" + q.uid + "']").val();
        return p;
    };

    this.collectQuestion_simple_matrix = function (q, p) {
        var cell, tmp1, tmp2;
        p.values = [];
        p.cells_uid = p.uid + "_" + textToId(q.q[0].title);
        for (var r = 0; r < q.rows.length; r++) {
            tmp1 = [];
            for (var c = 0; c < q.cols.length; c++) {
                cell = {};
                cell.title = q.cols[c];
                cell.value = $("select[name='" + p.cells_uid + "___" + r + '_' + c + "']").val();
                tmp1.push(cell);
            }
            tmp2 = {};
            tmp2.title = q.rows[r];
            tmp2.values = tmp1;
            p.values.push(tmp2);
        }
        return p;
    };

    this.collectQuestion_tabular = function (q, p) {
        var cell;
        p.values = [];
        for (var c = 0; c < q.cols.length; c++) {
            var tmp = [];
            for (var r = 0; r < q.rows; r++) {
                cell = {};
                cell.value = $("[name='" + p.uid + "_" + r + '_' + c + "']").val();
                tmp.push(cell);
            }
            if (q.cols[c].type) {
                p.values.push({title:q.cols[c].title, values:tmp});
            } else {
                p.values.push({title:q.cols[c], values:tmp});
            }
        }
        return p;
    };

    /*******************************/

    this.loadPages = function (Id) {
        var data = {}, i;
        basePath = basePath.replace(/edit\/\w*/, "");
        $.getJSON(basePath + 'load/' + Id, function (data) {
            for (var page in data) {
                if (page == "collection" || page == "_id")
                    continue;
                Clinic.populatePage(data[page]);
            }
        });
    };

    this.loadPage = function (uid) {
        var page = pages.filter(function (page) {
            return page.uid == uid;
        })[0];
        var Id = -1;

        $.getJSON(basePath + 'load/' + Id + "/" + page.id(), function (data) {
            Clinic.populatePage(data);
        });
    };

    this.populatePage = function (data) {
        Clinic.populateQuestions(data.qs);
    };

    this.populateQuestions = function (qs) {
        var i, q;
        for (i = 0; i < qs.length; i++) {
            q = qs[i];

            if (typeof(Clinic["populateQuestion_" + q.type]) === "function")
                Clinic["populateQuestion_" + q.type](q);
            else
                Clinic.populateQuestion(q);
        }
    };

    this.populateQuestion = function (q) {
        $("input[name='" + q.uid + "']").val(q.value);
    };

    this.populateQuestion_textarea = function (q) {
        $("textarea[name='" + q.uid + "']").val(q.value);
    };

    this.populateQuestion_group = function (q) {
        Clinic.populateQuestions(q.qs);
    };

    this.populateQuestion_yesno = function (q) {
        $("input[name='" + q.uid + "']").removeAttr("checked");
        $("input[name='" + q.uid + "'][value='" + q.value + "']").attr("checked", "checked");
    };

    this.populateQuestion_yesnoif = function (q) {
        $("input[name='" + q.uid + "']").removeAttr("checked");
        $("input[name='" + q.uid + "_ifyes']").val(q.yes_value);
        $("#div_" + q.uid + "_ifyes").hide();
        $("input[name='" + q.uid + "'][value='" + q.value + "']").click();

    };

    this.populateQuestion_radio = function (q) {
        $("input[name='" + q.uid + "']").removeAttr("checked");
        $("input[name='" + q.uid + "'][value='" + q.value + "']").click();
    };

    this.populateQuestion_checkboxes = function (q) {
        for (var i = 0; i < q.options.length; i++) {
            var option = q.options[i], title = option.title || option, myid = q.uid + "_" + title.replace(/\s/g, "_");
            $("input[name='" + myid + "']").removeAttr("checked");
            if (option.checked)
                $("input[name='" + myid + "']").attr("checked", "checked");
        }

    };

    this.populateQuestion_selectbox = function (q) {
        $("select[name='" + q.uid + "']").selectedIndex = 0;
        $("select[name='" + q.uid + "']").val(q.value).trigger("chosen:updated");
        ;
    };

    this.populateQuestion_simple_matrix = function (q) {
        var row, col;
        if (!q.values) {
            $("select[id='" + q.uid + "_" + textToId(q.q[0].title) + "']").val("")
            return;
        }
        for (var r = 0; r < q.values.length; r++) {
            row = q.values[r];
            for (var c = 0; c < row.values.length; c++) {
                col = row.values[c];
                $("select[name='" + q.cells_uid + "___" + r + '_' + c + "']").val(col.value);
            }
        }
    };

    this.populateQuestion_tabular = function (q) {
        var row, col;
        if (!q.values) {
            for (var c = 0; c < q.cols.length; c++)
                for (var r = 0; r < q.rows; r++)
                    $("[name='" + q.uid + "_" + r + '_' + c + "']").val("");
            return;
        }

        for (var c = 0; c < q.values.length; c++) {
            col = q.values[c];
            for (var r = 0; r < col.values.length; r++) {
                row = col.values[r];
                $("[name='" + q.uid + "_" + r + '_' + c + "']").val(row.value);
            }
        }

    };


    /*******************************/
    this.clearPage = function (uid) {
        var page = pages.filter(function (page) {
            return page.uid == uid;
        })[0];

        Clinic.populatePage(page);
    };
};

function createPagesSelector() {
    var pages_selector_li_idx = 1;
    $("#pages > form").each(function () {
        $("#pages-selector-ul").append("<li><a data-page-id='" + $(this).attr("id") + "' href='#'>" + (pages_selector_li_idx++) + ". " + $(this).attr("data-title") + "</a></li>");
        $(this).hide();
    });

    $("#pages-selector-ul > li > a").click(function () {
        $("#pages > form").hide();
        $("#pages-selector-ul > li").removeClass("uk-active");
        $(this).parent().addClass("uk-active");
        $("#" + $(this).attr("data-page-id")).fadeIn();
    });

    $("#pages-selector-ul > li > a:first").click();
}

function bindFunctionalityToPage() {
    createPagesSelector();

    $(".p_btn_saveForm").unbind("click").click(function (e) {
        e.preventDefault();
        var form = $(this).parents('form:first');
        Clinic.savePage(form.attr("id"));
    });
    $(".p_btn_loadForm").unbind("click").click(function (e) {
        e.preventDefault();
        var form = $(this).parents('form:first');
        Clinic.loadPage(form.attr("id"));
    });
    $(".p_btn_clearForm").unbind("click").click(function (e) {
        e.preventDefault();
        var form = $(this).parents('form:first');
        Clinic.clearPage(form.attr("id"));
    });

    $(".p-q-yesnoif").unbind("click").click(function (e) {
        var targetElem = $("#div_" + $(this).attr("name") + "_ifyes");
        targetElem.hide();
        if ($(this).attr("value") == "yes")
            targetElem.show();
    });


    $(".p-q-select-chosen").each(function () {
        var elem = $(this);
        var max = elem.attr("data-max");
        if (elem.attr("multiple") == "multiple" && max.length > 0) {
            elem.chosen({max_selected_options:max, width:"200px"});
        } else {
            elem.chosen({width:"200px"});
        }
    });


    $("input[role='datepicker'][lang='fa']").datepicker();
    $("input[role='datepicker'][lang='en']").kendoDatePicker();
}