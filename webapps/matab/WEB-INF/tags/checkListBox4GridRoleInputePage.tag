<%@tag import="java.util.ResourceBundle" %>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="chkControllerPath" required="true" rtexprvalue="true" %>

<jsp:doBody/>

<span style="padding-bottom: 5px;border-bottom-style: solid;border-bottom-width: thin;float: right;margin-right: 30px;margin-top: 5px;">
		<%=ResourceBoundleHolder.resourceBundle.getString("system.role.view.gridColsPermission")%>
</span>
<div id="${name}_chk_gcp_div" style="margin-right: 20px;border-style: outset;border-width: thin;padding: 15px;min-height: 100px;" align="right">

</div>

<script>
    function checkBoxGridColsBtnTriggerAfterTreeClick(menu_id) {
        var x = getBaseUrl();
        var role_id = $('#id').val();
        $.ajax({
            url: x + "${chkControllerPath}/" + menu_id + "/" + role_id,
            type: "GET",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                var div = document.getElementById('${name}_chk_gcp_div');
                div.innerHTML = "";
                for (var j = 0; j < data.length; j++) {
                    var chk = document.createElement('input');
                    chk.type = "checkbox";
                    chk.name = "${name}";
                    chk.value = data[j].modelID;
                    chk.id = 'id_gcp_' + data[j].modelID;
                    chk.setAttribute("data-ignore", true);
                    chk.checked = data[j].checked;
                    chk.onclick = function () {
                        $.ajax({
                            url: x + "roleColumnAction/" + this.value + "/" + role_id,
                            contentType: "application/json; charset=utf-8",
                            dataType: 'json',
                            type: 'GET',
                            success: function (data) {
                                if (data.state == "error") {
                                    alertify.error("Error");
                                } else {
                                    alertify.success(data.message);
                                }
                            },
                            error: function (e) {
                                alert('Error: ' + e.responseText);
                            }
                        });
                    };
                    var label = document.createElement('label');
                    label.htmlFor = 'id_gcp_' + data[j].modelID;
                    //console.log(data[j]);
                    label.appendChild(document.createTextNode(' ' + data[j].modelCaption));
                    var br1 = document.createElement('br');
                    div.appendChild(br1);
                    div.appendChild(chk);
                    div.appendChild(label);
                }
            }, error: function (result) {
                if (result.status == 401) {
                    top.location.href = top.location.href;
                }
            }
        });
    }

</script>