<div id="recommend">
    <h3>Recommendation</h3>
    <div>
        <jsp:include page="Recommendation.jsp"/>
    </div>
</div>

<script>
    $("#recommend").accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true
    });
</script>