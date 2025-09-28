<%@page import="java.util.ResourceBundle"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:sortableClinicItem categoryListPlaceHolder="Add Goods category"
                         categoryNameItem="addGoodsName" operationAllUrl="inv/basicInfo/goodsTemplate/combo/loadAllGoodsGet"
                         saveUrl="inv/basicInfo/goodsTemplate/save" />