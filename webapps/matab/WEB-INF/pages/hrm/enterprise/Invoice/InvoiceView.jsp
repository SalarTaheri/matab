<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="java.util.ResourceBundle"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String jsFileName = pageContext.getPage().getClass().getName();
	jsFileName = jsFileName.substring(jsFileName.lastIndexOf(".") + 1).replace("_jsp", ".js,jsp");	

	System.out.println("--->"+ jsFileName);	
	String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
	String transportReadUrl = basePath + "grid-read";
	String transportRemoveUrl = basePath + "remove";
 %>

 <c:set var="transportReadUrl" value="<%=transportReadUrl %>" />
 <c:set var="transportRemoveUrl" value="<%=transportRemoveUrl %>" />
 <base:pageHeader></base:pageHeader>
 
	<div class="k-rtl">
		<kendo:grid  name="grid" pageable="true" sortable="true" height="400"  columnReorder="true" columnResize="true" filterable="true" navigatable="true" >
	    	<kendo:grid-editable mode="popup" confirmation="Are you sure?" />
			<kendo:grid-groupable>
				<kendo:grid-groupable-messages empty='<%=resource.getString("action.groupBy")%>' />
			</kendo:grid-groupable>
	        <kendo:grid-columns>
	            <kendo:grid-column title='<%=resource.getString("system.name")%>' field="field1" width="100px"/>
	            <kendo:grid-column title='<%=resource.getString("system.code")%>' field="field2"  width="50px"/>

	           <kendo:grid-column title='<%=resource.getString("action.operation")%>' width="100px" > 
	            	<kendo:grid-column-command >
	            		<kendo:grid-column-commandItem className="uk-button uk-button-success" name="edit" text='<%=resource.getString("action.edit")%>' />
	            		<kendo:grid-column-commandItem className="uk-button uk-button-danger" click="onDelete" name="destroy" text='<%=resource.getString("action.delete")%>' />
	            	</kendo:grid-column-command>
            	</kendo:grid-column>
	        </kendo:grid-columns>
	        
	        <kendo:dataSource  pageSize="10" serverPaging="true" serverSorting="true" serverFiltering="true" serverGrouping="true"> 
		        <kendo:dataSource-transport>
	            	<kendo:dataSource-transport-read  url="${transportReadUrl}" type="POST"  contentType="application/json"/>
	            	<kendo:dataSource-transport-destroy  url="${transportRemoveUrl}" type="POST"  contentType="application/json"/>
	            	<kendo:dataSource-transport-parameterMap>
                		function(options){return JSON.stringify(options);}
                	</kendo:dataSource-transport-parameterMap>  
			    </kendo:dataSource-transport>
	            <kendo:dataSource-schema  data="data" total="total" groups="data">
	                <kendo:dataSource-schema-model id="id">
	                    <kendo:dataSource-schema-model-fields>
	                        <kendo:dataSource-schema-model-field name="field1" type="string" />
	                        <kendo:dataSource-schema-model-field name="field2" type="number" />	          
	                    </kendo:dataSource-schema-model-fields>
	                </kendo:dataSource-schema-model>
	            </kendo:dataSource-schema>
	        </kendo:dataSource>
	        <kendo:grid-pageable input="true" numeric="false" />
	    </kendo:grid>
    </div>

	<script>
		function onDelete(e){
		    alert("aaa");
		}
	</script>

