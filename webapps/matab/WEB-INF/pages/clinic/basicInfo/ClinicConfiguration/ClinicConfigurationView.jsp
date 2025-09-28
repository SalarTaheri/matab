<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<script src="<c:url value='/resources/bootstrap-3.3.7/js/bootstrap.js' />"></script>
<link href="<c:url value='/resources/bootstrap-3.3.7/css/bootstrap.min.css'/>" rel="stylesheet"/>
<script src="<c:url value='/resources/js/blockUI/blockUI.js' />"></script>

<div class="container" style="width: 95%;">
    <div class="row">
        <section>
            <div class="wizard">
                <div class="wizard-inner">
                    <div class="connecting-line"></div>
                    <ul class="nav nav-tabs" role="tablist">

                        <li role="presentation" class="active">
                            <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="مرحله اول: مشخصات پزشک" data-placement="right">
                            <span class="round-tab">
								<img src="<c:url value='/resources/images/blue/user-card.png' />" style="width: 60%;">
                            </span>
                            </a>
                        </li>

                        <li role="presentation" class="disabled">
                            <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="مرحله دوم: مشخصات منشی" data-placement="right">
                            <span class="round-tab">
								<img src="<c:url value='/resources/images/blue/users.png' />" style="width: 60%;">
                            </span>
                            </a>
                        </li>

                        <li role="presentation" class="disabled">
                            <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="مرحله سوم: تخصیص خدمت" data-placement="right">
                            <span class="round-tab">
                                <img src="<c:url value='/resources/images/blue/site-map.png' />" style="width: 60%;">
                            </span>
                            </a>
                        </li>

                        <li role="presentation" class="disabled">
                            <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="پابان" data-placement="right">
                            <span class="round-tab">
                                <img src="<c:url value='/resources/images/blue/flag.png' />" style="width: 60%;">
                            </span>
                            </a>
                        </li>

                    </ul>
                </div>

                <form role="form">
                    <div class="tab-content">
                        <div class="tab-pane active" role="tabpanel" id="step1">

                            <jsp:include page="sections/MatabAndDoctorPartView.jsp"/>

                            <ul class="list-inline pull-right">
                                <li>
                                    <button type="button" class="btn btn-primary" onclick="matabAndDoctorViewNextPage()">مرحله بعد</button>
                                </li>
                            </ul>

                        </div>

                        <div class="tab-pane" role="tabpanel" id="step2">

                            <jsp:include page="sections/ClerksPartView.jsp"/>

                            <ul class="list-inline pull-right">
                                <li>
                                    <button type="button" class="btn btn-primary" onclick="saveClerkViewNextPage()">مرحله بعد</button>
                                </li>
                                <li>
                                    <button type="button" class="btn btn-default prev-step">مرحله قبل</button>
                                </li>
                            </ul>

                        </div>

                        <div class="tab-pane" role="tabpanel" id="step3">

                            <jsp:include page="sections/ServiceCostPartView.jsp"/>

                            <ul class="list-inline pull-right">
                                <li>
                                    <button type="button" class="btn btn-primary" onclick="serviceCostViewNextPage()">مرحله بعد</button>
                                </li>
                                <li>
                                    <button type="button" class="btn btn-default prev-step">مرحله قبل</button>
                                </li>
                            </ul>

                        </div>

                        <div class="tab-pane" role="tabpanel" id="complete">

                            <jsp:include page="sections/FinishPartView.jsp"/>

                            <ul class="list-inline pull-right">
                                <li>
                                    <button type="button" class="btn btn-default prev-step">مرحله قبل</button>
                                </li>
                            </ul>
                        </div>

                    </div>
                </form>
            </div>
        </section>
    </div>
</div>

<script>
    $(document).ready(function () {
        //Initialize tooltips
        $('.nav-tabs > li a[title]').tooltip();

        //Wizard
        $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
            var $target = $(e.target);
            if ($target.parent().hasClass('disabled')) {
                return false;
            }
        });

        $('a[data-toggle="tab"]').click(function(e){
            $($(e.target).parent().get(0)).parent().parent().nextAll().addClass("disabled")
        });

        $(".next-step").click(function (e) {
            var $active = $('.wizard .nav-tabs li.active');
            $active.next().removeClass('disabled');
            nextTab($active);
        });
        $(".prev-step").click(function (e) {
            var $active = $('.wizard .nav-tabs li.active');
            prevTab($active);
        });
        //
        $('[data-toggle="tooltip"]').tooltip();
    });

    function nextTab(elem) {
        $(elem).next().find('a[data-toggle="tab"]').click();
    }
    function prevTab(elem) {
        $(elem).prev().find('a[data-toggle="tab"]').click();
    }

    function customNextPage(){
        var $active = $('.wizard .nav-tabs li.active');
        $active.next().removeClass('disabled');
        nextTab($active);
    }
</script>

<style>
    .wizard {
    }

    .wizard .nav-tabs {
        position: relative;
        /*margin: 40px auto;*/
        margin-bottom: 0;
        border-bottom-color: #7d8b8b;
    }

    .wizard > div.wizard-inner {
        position: relative;
    }

    .connecting-line {
        height: 2px;
        background: #e0e0e0;
        position: absolute;
        width: 80%;
        margin: 0 auto;
        left: 0;
        right: 0;
        top: 50%;
        z-index: 1;
    }

    .wizard .nav-tabs > li.active > a, .wizard .nav-tabs > li.active > a:hover, .wizard .nav-tabs > li.active > a:focus {
        color: #555555;
        cursor: default;
        border: 0;
        border-bottom-color: transparent;
    }

    span.round-tab {
        width: 70px;
        height: 70px;
        line-height: 60px;
        display: inline-block;
        border-radius: 100px;
        background: #fff;
        border: 2px solid #e0e0e0;
        z-index: 2;
        position: absolute;
        left: 0;
        text-align: center;
        font-size: 25px;
    }

    span.round-tab i {
        color: #555555;
    }

    .wizard li.active span.round-tab {
        background: #fff;
        border: 2px solid #5bc0de;

    }

    .wizard li.active span.round-tab i {
        color: #5bc0de;
    }

    span.round-tab:hover {
        color: #333;
        border: 2px solid #333;
    }

    .wizard .nav-tabs > li {
        width: 25%;
    }

    .wizard li:after {
        content: " ";
        position: absolute;
        left: 46%;
        opacity: 0;
        margin: 0 auto;
        bottom: 0px;
        border: 5px solid transparent;
        border-bottom-color: #5bc0de;
        transition: 0.1s ease-in-out;
    }

    .wizard li.active:after {
        content: " ";
        position: absolute;
        left: 46%;
        opacity: 1;
        margin: 0 auto;
        bottom: 0px;
        border: 10px solid transparent;
        border-bottom-color: #5bc0de;
    }

    .wizard .nav-tabs > li a {
        width: 70px;
        height: 70px;
        margin: 20px auto;
        border-radius: 100%;
        padding: 0;
    }

    .wizard .nav-tabs > li a:hover {
        background: transparent;
    }

    .wizard .tab-pane {
        position: relative;
        padding-top: 20px;
    }

    .wizard h3 {
        margin-top: 0;
    }

    @media ( max-width: 585px ) {

        .wizard {
            width: 90%;
            height: auto !important;
        }

        span.round-tab {
            font-size: 16px;
            width: 50px;
            height: 50px;
            line-height: 50px;
        }

        .wizard .nav-tabs > li a {
            width: 50px;
            height: 50px;
            line-height: 50px;
        }

        .wizard li.active:after {
            content: " ";
            position: absolute;
            left: 35%;
        }
    }

    input.form-control {
        border-radius: 8px !important;
    }

    .form-group {
        margin-right: 10px;
    }

    .panel-body {
        padding-left: 5px;
        padding-right: 5px;
        padding-top: 0px;
        padding-bottom: 0px;
    }
</style>