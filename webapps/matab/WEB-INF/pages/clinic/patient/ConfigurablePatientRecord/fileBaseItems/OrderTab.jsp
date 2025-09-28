<div id="orderDrugg">
    <h3>Order medicine</h3>
    <div>
        <jsp:include page="Drug.jsp"/>
    </div>
</div>
<div id="orderLab">
    <h3>Order LabTest</h3>
    <div>
        <jsp:include page="LabTestOrder.jsp"/>
    </div>
</div>

<script>
    $("#orderLab").accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true,
        active: false
    });
    $("#orderDrugg").accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true,
        active: false
    });
</script>