<%@page contentType="text/html;charset=UTF-8" %>

<div align="center" style="margin-top: 20px;">
    <p>عملیات راه اندازی و تنظیمات اولیه سیستم با موفقیت به پایان رسید برای ورود به سامانه بر روی دکمه زیر کلیک کنید</p>
</div>
<div align="center">
    <button type="button" class="btn btn-success prev-step" onclick="loadFirstPage()" style="width: 100px; margin: 25px; margin-bottom: 50px;">ورود</button>
</div>

<script>
    function loadFirstPage(){
        parent.document.location = "${pageContext.request.contextPath}/j_spring_security_logout";
    }
</script>