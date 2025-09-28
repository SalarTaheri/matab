<div id="pastMedicalHistory">
    <h3>Past Medical History</h3>
    <div>
        <jsp:include page="PastMedicalHistory.jsp"/>
    </div>
</div>
<div id="drugHistory">
    <h3> Drug History</h3>
    <div>
        <jsp:include page="DrugHistory.jsp"/>
    </div>
</div>
<div id="habitalHistory">
    <h3>Habital History</h3>
    <div>
        <jsp:include page="HabitalHistory.jsp"/>
    </div>
</div>
<div id="familyHistory">
    <h3>Family History</h3>
    <div>
        <jsp:include page="FamilyHistory.jsp"/>
    </div>
</div>

<script>
    $("#pastMedicalHistory").accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true,
        active: false
    });
    $("#drugHistory").accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true,
        active: false
    });
    $("#habitalHistory").accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true,
        active: false
    });
    $("#familyHistory").accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true,
        active: false
    });
</script>