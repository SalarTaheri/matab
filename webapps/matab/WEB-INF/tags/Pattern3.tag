<%@tag import="org.springframework.web.util.UrlPathHelper"%>
<%@tag import="java.util.ResourceBundle"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
    function callback_save_success(){
        var grid=$("div[data-role='grid']");
        if(grid.length>0){
            grid.data("kendoGrid").dataSource.read();
        }
    }

    function grid_onEdit(data){
        bindToEntityById(data.id);
    }
</script>