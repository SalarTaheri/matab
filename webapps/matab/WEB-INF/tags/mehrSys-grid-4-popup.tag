<%@tag import="com.artonis.core.base.components.ui.kendo.MyFieldTag"%>
<%@tag import="java.util.ArrayList"%>
<%@tag import="java.util.List"%>
<%@tag import="com.artonis.core.base.components.ui.kendo.MyColumnTag"%>
<%@tag import="java.util.ResourceBundle"%>
<%@ tag import="com.artonis.core.base.components.ui.kendo.MyFunctionTag" %>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="transportReadUrl" required="true" rtexprvalue="true"%>
<%@ attribute name="updateUrl" required="false" rtexprvalue="true"%>
<%@ attribute name="destroyUrl" required="false" rtexprvalue="true"%>
<%@ attribute name="inlineEditing" required="false" rtexprvalue="true"%>
<%@ attribute name="selectable" required="false" rtexprvalue="true"%>
<%@ attribute name="showOperation" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%
	request.setAttribute("fields", new ArrayList<MyFieldTag>());
	request.setAttribute("cols", new ArrayList<MyColumnTag>());
	request.setAttribute("functions", new ArrayList<MyFunctionTag>());
 %>

<jsp:doBody />

<%

    if(showOperation==null){
        showOperation=false;
    }

    List<MyColumnTag> cols = (List<MyColumnTag>) request.getAttribute("cols");
	List<MyFieldTag> fields = (List<MyFieldTag>) request.getAttribute("fields");
	List<MyFunctionTag> functions = (List<MyFunctionTag>) request.getAttribute("functions");
	inlineEditing=(inlineEditing==null||inlineEditing.length()==0)?"false":"true";	
%>


		<base:message title='action.groupBy' jsutDefine="true"/>
		<base:message title='action.operation' jsutDefine="true"/>
		<base:message title='action.edit' jsutDefine="true"/>
		<base:message title='action.delete' jsutDefine="true"/>
	<div class="k-rtl">	
		<kendo:grid  name="${name}" selectable="${selectable}" pageable="true" sortable="true" height="400"  columnReorder="true" columnResize="true" filterable="true" navigatable="true" editable="${inlineEditing}">
		<kendo:grid-groupable>
					<kendo:grid-groupable-messages empty='${label_action_groupBy}' />
		</kendo:grid-groupable>
		<%if(inlineEditing!=null &&inlineEditing.equals("true")){ %>
    		<kendo:grid-toolbar>
            	<kendo:grid-toolbarItem name="save" text='<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.save") %>'/>
            	<kendo:grid-toolbarItem name="cancel" text='<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.cancel") %>'/>
        	</kendo:grid-toolbar>
        <%} %>
		
	        <kendo:grid-columns>
	        	<%for(MyColumnTag col : cols) {%>
	        		<kendo:grid-column title='<%=col.getTitle() %>'  field="<%=col.getField() %>" width="<%=col.getWidth() %>"/>
	        	<%} %>
	        	<%if(showOperation){%>
	        		<kendo:grid-column title='${label_action_operation}' width="100px" >
            		</kendo:grid-column>
            	<%} %>            	
	        </kendo:grid-columns>
	        
	        
	        <kendo:dataSource batch="true"  pageSize="10" serverPaging="true" serverSorting="true" serverFiltering="true" serverGrouping="true"> 
		        <kendo:dataSource-transport>
                	<kendo:dataSource-transport-read  url="${transportReadUrl}" type="POST"  contentType="application/json"/>
                	<kendo:dataSource-transport-update url="${updateUrl}" type="POST" contentType="application/json" />
                	<kendo:dataSource-transport-destroy url="${destroyUrl}" type="POST" contentType="application/json" />
                	<kendo:dataSource-transport-parameterMap>
                		<script>
	                		function parameterMap(options,type) { 
	                		if(type==="read"){
	                			return JSON.stringify(options);
	                		} else {
	                			return JSON.stringify(options.models);
	                		}
	                	}
                		</script>
                	</kendo:dataSource-transport-parameterMap>
            	</kendo:dataSource-transport>
	            <kendo:dataSource-schema  data="data" total="total" groups="data">
	                <kendo:dataSource-schema-model id="id">
	                    <kendo:dataSource-schema-model-fields>
							<%for(MyFieldTag field : fields) {%>
								<kendo:dataSource-schema-model-field name="<%=field.getName() %>" type="<%=field.getType() %>" />
				        	<% }%>
	                    </kendo:dataSource-schema-model-fields>
	                </kendo:dataSource-schema-model>
	            </kendo:dataSource-schema>
                <kendo:dataSource-error>
                    <script>
                        function error(e) {
                            errorRequestAjax(e);
                        }
                    </script>
                </kendo:dataSource-error>
	        </kendo:dataSource>
	        <kendo:grid-pageable input="true" numeric="false" />
	        
        </kendo:grid>
       </div>
        