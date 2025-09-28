<script type="text/javascript">


    var customFormSave;
    var customFormLoad;
    $(function () {
        renderPages(pages);

        customFormSave = function () {
            if (typeof(entityId) != "undefined") {
                Clinic.savePages(entityId);
            } else {
                Clinic.savePages();
            }

        };

        customFormLoad = function () {
            Clinic.loadPages(entityId);
        };
    });

    function createPagesSelector() {
        $("#pages > form").each(function () {
            $("#pages-selector-ul").append("<li class='p-tab-caption'><a data-page-id='" + $(this).attr("id") + "' href='#'>" + $(this).attr("data-title") + "</a></li>");
            var t = $(this).wrap("<li class='p-tab-content' />").parent().detach();
            $("#pages-tabs").append(t);
        });

        $(".p-tab-caption a").click(function () {
            var id = $(this).attr("data-page-id");
            $(".p-tab-content").fadeOut();
            $("#" + id).parent().fadeIn();
        });

        $(".p-tab-caption:first a").click();
    }
</script>