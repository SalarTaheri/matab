<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<base:pageHeader/>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >


    <form class="uk-form" id="mainForm">
        <input type="hidden" id="id" name="id" >

        <div class="uk-grid uk-grid-preserve">
            <base:testBox name="name" key="thinkroom.membermanagent.member.name"/>
            <base:testBox name="lastname" key="thinkroom.membermanagent.member.lastname"/>
        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:comboBox name="sex" isListConstant="true" key="thinkroom.membermanagent.member.sex" comboLoaderUrl="combo/loadAllSex" />
            <base:testBox name="job" key="thinkroom.membermanagent.member.job" />
        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:testBox name="tel1" key="thinkroom.membermanagent.member.tel" />
            <base:testBox name="cellphone" key="thinkroom.membermanagent.member.cellphone" />
        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:testBox name="email" key="thinkroom.membermanagent.member.email" />
        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:checkbox name="member_card"  key="thinkroom.membermanagent.member.membercard"/>
            <base:checkbox name="business_card"  key="thinkroom.membermanagent.member.businesscard"/>

        </div>


    </form>
</div>
