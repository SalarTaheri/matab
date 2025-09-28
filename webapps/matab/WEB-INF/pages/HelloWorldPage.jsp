<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<c:set var="Title" scope="request">OOha!</c:set>

<base:header>
<meta charset="UTF-8"/> 
</base:header>

	<h2>${emp1.name}</h2>
	<div class="k-rtl">
		<kendo:grid name="grid" pageable="true" sortable="true" filterable="true" navigatable="true" groupable="true">
	        <kendo:grid-columns>
	            <kendo:grid-column title="Name" field="firstName" encoded="utf8"/>
	            <kendo:grid-column title="Fam" field="lastName"  />
	            <kendo:grid-column title="&nbsp;" width="160px" >
            	<kendo:grid-column-command>
            		<kendo:grid-column-commandItem className="uk-button uk-button-success" name="edit" />
            		<kendo:grid-column-commandItem className="uk-button uk-button-danger" name="destroy" />
            	</kendo:grid-column-command>
            </kendo:grid-column>
	        </kendo:grid-columns>
	        <kendo:dataSource data="${emps}" pageSize="10">        
	            <kendo:dataSource-schema>
	                <kendo:dataSource-schema-model>
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

<base:footer></base:footer>