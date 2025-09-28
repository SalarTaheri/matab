<%@page import="java.util.ResourceBundle"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
ResourceBundle resource = ResourceBundle.getBundle("application_fa");
 %>

<c:set var="Title" scope="request">OOha!</c:set>
<c:url var="transportReadUrl" value="/hello/grid-read" />
<c:url var="transportRemoveUrl" value="/hello/remove" />

<base:header>
</base:header>

	<h2>${emp1.name}</h2>
	<div class="k-rtl">
		<kendo:grid  name="grid" pageable="true" sortable="true" height="400"  columnReorder="true" columnResize="true" filterable="true" navigatable="true">
	    	<kendo:grid-editable mode="popup" confirmation="Are you sure?" />
			<kendo:grid-groupable>
				<kendo:grid-groupable-messages empty='<%=resource.getString("action.groupBy")%>' />
			</kendo:grid-groupable>
	        <kendo:grid-toolbar>
	            <kendo:grid-toolbarItem name="create" text='<%=resource.getString("action.insert")%>'/>
	        </kendo:grid-toolbar>
	        <kendo:grid-columns>
	            <kendo:grid-column title='<%=resource.getString("hrm.employee.firstName")%>'  field="firstName" width="100px"/>
	            <kendo:grid-column title='<%=resource.getString("hrm.employee.lastName")%>' field="lastName"  width="100px"/>
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
	                        <kendo:dataSource-schema-model-field name="name" type="string" />
	                        <kendo:dataSource-schema-model-field name="fam" type="string" />	          
	                    </kendo:dataSource-schema-model-fields>
	                </kendo:dataSource-schema-model>
	            </kendo:dataSource-schema>
	        </kendo:dataSource>
	        <kendo:grid-pageable input="true" numeric="false" />
	    </kendo:grid>
    </div>
    
    <hr>
  <%--
      <c:forEach var="x" items="${emps}">
  		 name:  <c:out value="${x.name}"/><p>
	</c:forEach>
    
   --%>
    <script>
        function onDelete(e){
            alert("aaa");
        }
    </script>

<base:footer></base:footer>