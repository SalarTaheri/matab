<%@tag import="com.artonis.clinic.basicInfo.service.util.BasicInfoServiceUtil"%>
<%@tag import="com.artonis.hrm.core.model.Employee"%>
<%@tag import="com.artonis.hrm.employee.service.util.EmployeeServiceUtil"%>
<%@tag import="com.artonis.core.system.authentication.model.GlobalVariable"%>
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
<%@ taglib prefix="kedo" uri="http://www.kendoui.com/jsp/tags" %>

<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="transportReadUrl" required="true" rtexprvalue="true"%>
<%@ attribute name="updateUrl" required="false" rtexprvalue="true"%>
<%@ attribute name="destroyUrl" required="false" rtexprvalue="true"%>
<%@ attribute name="inlineEditing" required="false" rtexprvalue="true"%>
<%@ attribute name="selectable" required="false" rtexprvalue="true"%>
<%@ attribute name="editLabel" required="false" rtexprvalue="true"%>
<%@ attribute name="isPopup" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="noDeleteButton" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="noEditButton" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="showOperation" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%
	request.setAttribute("fields", new ArrayList<MyFieldTag>());
	request.setAttribute("cols", new ArrayList<MyColumnTag>());
	request.setAttribute("functions", new ArrayList<MyFunctionTag>());

    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String areUShure=resource.getString("action.alert.areYouSure.delete");
    
        String menuSysCode4Grid =String.valueOf(request.getAttribute("menuSystemCode"));
    
 %>
 
<script type="text/javascript">
function _onDataBound(e) {
    var rows = this.items();
    var pageNumber = this.dataSource.page();
    var preNumber = 0;
    if(pageNumber>1){
    	preNumber = (pageNumber-1) * this.dataSource.pageSize();
    }
    $(rows).each(function () {
        var index = preNumber + $(this).index() + 1;
        var rowLabel = $(this).find(".grid-row-number");
        $(rowLabel).html(index);
    });

    if(typeof(onDataBound_callback) == "function"){
        onDataBound_callback(e);
    }
}
function exToExcel_toolbar_click() {
	$("#exportToWxcelBtn").click();
 	return false;
}
</script>
<jsp:doBody />
<base:exportToExcel type="simple_grid"/>
<%

    if(isPopup==null){
        isPopup=false;
    }
    if(noDeleteButton==null){
        noDeleteButton=false;
    }
    if(noEditButton==null){
    	noEditButton=false;
    }    
    if(showOperation==null){
    	showOperation=true;
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
	<%--<div class="k-rtl" style=" width: 100%; height: 100%;" >	--%>
	<div class="k-rtl">
		<kendo:grid  name="${name}" selectable="${selectable}" pageable="true" sortable="true" height="400"  columnReorder="true" columnResize="true" filterable="true"
			navigatable="true" editable="${inlineEditing}" dataBound="_onDataBound">
		<%--<kendo:grid  name="${name}" selectable="${selectable}" pageable="true" sortable="true" columnReorder="true" columnResize="true" filterable="true" navigatable="true" editable="${inlineEditing}">--%>
		<kendo:grid-groupable>
					<kendo:grid-groupable-messages empty='${label_action_groupBy}' />
		</kendo:grid-groupable>
    		<kendo:grid-toolbar>
     			<kendo:grid-toolbarItem name="exportToExcel" text="exportToExcel"
					template="<a class='k-button-exToExcel' href='\#' onclick='return exToExcel_toolbar_click()'></a>" />
    			<%if(inlineEditing!=null && inlineEditing.equals("true")){ %>
	            	<kendo:grid-toolbarItem name="save" text="global.crud.save"/>
	            	<kendo:grid-toolbarItem name="cancel" text="global.crud.cancel"/>
            	<%} %>
        	</kendo:grid-toolbar>
		
	        <kendo:grid-columns>
                <%String rowNumTemplate="<label for=\"rowNum\" class=\"grid-row-number\" />";%>
                <kendo:grid-column title='<%=ResourceBoundleHolder.resourceBundle.getString("global.row")%>' field="rowNumber"
                	filterable="false" attributes=" align='center'" sortable="false" headerAttributes=" align='center'" width="1%" template="<%=rowNumTemplate%>"/>
	        	<%for(MyColumnTag col : cols) {
                    		if(col.isCombo()){ %>
                				<%String template="<input type=\"checkbox\" #="+col.getField()+"  === true ? checked=\"checked\" : \"\" #  disabled />";%>
                				<kendo:grid-column title='<%=col.getTitle() %>'  field="<%=col.getField() %>" width="<%=col.getWidth() %>" template="<%=template%>"/>
                    		<%}else{ %>
                        		<kendo:grid-column title='<%=col.getTitle() %>' format="{0:#,0}" field="<%=col.getField() %>" width="<%=col.getWidth() %>"/>
	        	    		<%} 
	        	    		
	        	} %>
	        	
	        	<%
	        	//BasicInfoServiceUtil.loadAllDoctorByServiceId(Long.parseLong(String.valueOf(request.getAttribute("serviceIdParam"))))
	        	List<Employee> doctors = EmployeeServiceUtil.loadAllDoctor();
	        	String template = "<select class=\"doctorCombo\"> ";
	        	for (Employee doctor : doctors) {
	        		template += "<option value=\""+doctor.getId()+"\">"+doctor.getFullName()+"</option> ";
	        	}
	        	template += " </select>";
	        	 %>
          		<kendo:grid-column title='<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.doctor") %>'
					 field="doctorId" width="50px" template="<%=template%>"/>

   				<%String templatePercent="<input type=\"text\" name=\"percentOffTextBox\" onkeyup=\"changePercentOffTextBox(this)\" />";%>
   				<kendo:grid-column title='<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.offPercent")%>'
   							 field="offPercent" width="50px" template="<%=templatePercent%>"/>
   				
   				<kendo:grid-column title='<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.totalCost")%>' format="{0:#,0}" field="totalCost" width="50px"/>
   				
   				
				<%if(showOperation){%>
		        	<kendo:grid-column title='${label_action_operation}' width="70px" >
		            	<kendo:grid-column-command >
		            		<%for(MyFunctionTag myFunctionTag : functions) {
		            			if(GlobalVariable.getButtonContainer(menuSysCode4Grid,myFunctionTag.getName())){
			            			if((myFunctionTag.getStyleClass().equals("uk-button-success"))){%>
	    	                            <kendo:grid-column-commandItem className="uk-button uk-button-success" click='<%=myFunctionTag.getFunctionClick() %>'  name="<%=myFunctionTag.getName() %>" text="<%=myFunctionTag.getText() %>"/>
	        	                 <%}else if((myFunctionTag.getStyleClass().equals("uk-button-danger"))){  %>
	            	          	   		<kendo:grid-column-commandItem className="uk-button uk-button-danger" click='<%=myFunctionTag.getFunctionClick() %>'  name="<%=myFunctionTag.getName() %>" text="<%=myFunctionTag.getText() %>"/>
	                	         <% }else{ %>
	                    	     		<kendo:grid-column-commandItem className="uk-button" click='<%=myFunctionTag.getFunctionClick() %>'  name="<%=myFunctionTag.getName() %>" text="<%=myFunctionTag.getText() %>"/>
	                        	 <% } %>       
	                        	<%} 
	                        }%>
	                        <%if(!isPopup){%>
	                        	<%if(!noEditButton){
	                        		if(GlobalVariable.getButtonContainer(menuSysCode4Grid,"grid-edit-button")){
		                            	if(editLabel==null){%>
			            		        	<kendo:grid-column-commandItem className="uk-button uk-button-success" click="_${name}_onEdit" name="edit" text='${label_action_edit}' />
		                            	<%}else {%>
			            		        	 <kendo:grid-column-commandItem className="uk-button uk-button-success" click="_${name}_onEdit" name="edit" text='<%=ResourceBoundleHolder.resourceBundle.getString(editLabel)%>' />
	                            	<%	  }
	                            	}
	                            
	                            }%>
	                            <%if(!noDeleteButton && GlobalVariable.getButtonContainer(menuSysCode4Grid,"grid-remove-button")){%>
	                        		<kendo:grid-column-commandItem className="uk-button uk-button-danger" click="_${name}_onDelete" name="delete" text='${label_action_delete}' />
	                        	<%} %>
	                        <%}else{ %>
	                            <%if(noDeleteButton && GlobalVariable.getButtonContainer(menuSysCode4Grid,"grid-edit-button")){%>
	                                <kendo:grid-column-commandItem className="uk-button uk-button-success" click="_${name}_onEdit" name="edit" text='${label_action_edit}' />
	                            <%} %>
	                        <%} %>

	
		            	</kendo:grid-column-command>
	            	</kendo:grid-column> 
	           	<%} %>           	
	        </kendo:grid-columns>
	        
	        
	        
	        <kendo:dataSource  pageSize="10" serverPaging="true" serverSorting="true" serverFiltering="true" serverGrouping="true" requestEnd="_${name}_requestEnd">
		        <kendo:dataSource-transport>
                	<kendo:dataSource-transport-read  url="${transportReadUrl}" type="POST"  contentType="application/json"/>
                	<kendo:dataSource-transport-update url="${updateUrl}" type="POST" contentType="application/json" />
                	<kendo:dataSource-transport-destroy url="${destroyUrl}" type="POST" contentType="application/json" />
                	<kendo:dataSource-transport-parameterMap>
                		<script>
	                		function parameterMap(options,type) { 
	                				return JSON.stringify(options);
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
        
        <script>
   	        function _${name}_onDelete(e){
                var areUShure = "<%=areUShure%>";
	          	var data = this.dataItem($(e.target).closest("tr"));
	            alertify.confirm(areUShure, function (e) {
				    if (e) {
				        jQuery.ajax ({
						    url: basePath + "remove",
						    type: "POST",
						    data: JSON.stringify({id: data.id}),
						    dataType: "json",
						    contentType: "application/json; charset=utf-8",
						    success: function(result){
						        if(result.state == "success"){
						        	$("#grid").data("kendoGrid").dataSource.read();
					        		alertify.success(result.message);
						        }else if(result.state == "error"){
						        	for(var i=0; i<result.errors.length; i++){
						        		alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
						        	}
						        }else{
						        	lertify.error("Something is not good! O_o");
						        }
						        
						    },
                            error:function(result){
                                if(result.status==401){
                                    window.location.href="";
                                }
                            }
						});
				    }
				});
	        }
	        
	        function _${name}_onEdit(e){
	          	var data = this.dataItem($(e.target).closest("tr"));
                if(typeof(grid_onEdit)=="function"){
                    grid_onEdit(data);
                }else{
                    window.location = basePath + "edit/" + data.id;
                }
	        }

            function _${name}_requestEnd(e){
                if(typeof(${name}_requestEnd_callback) == "function"){
                    ${name}_requestEnd_callback(e);
                }
            }
            

$(document).ready(function(){
	$(".k-grid-toolbar").css('height','24px');
	var url = "url(<%=request.getContextPath()%>/resources/images/extractToExcel.png) no-repeat";
	$(".k-button-exToExcel").css("background", url);
});
</script>
<style>
.grid-row-number , .k-header:first-child {
    color: red;
    text-align: center !important;
}
.k-button-exToExcel {
  padding: 0px 5px 10px 25px;
}
</style>