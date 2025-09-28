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

<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="transportReadUrl" required="true" rtexprvalue="true"%>
<%@ attribute name="categoriesReadUrl" required="true" rtexprvalue="true"%>
<%@ attribute name="comboId" required="true" rtexprvalue="true"%>
<%@ attribute name="comboCaption" required="true" rtexprvalue="true"%>
<%@ attribute name="comboLabelCaptionKey" required="true" rtexprvalue="true"%>
<%@ attribute name="modelFieldFilterCombo" required="true" rtexprvalue="true"%>
<%@ attribute name="modelFieldFilterText" required="true" rtexprvalue="true"%>
<%@ attribute name="selectable" required="false" rtexprvalue="true"%>
<%@ attribute name="followFunction" required="false" rtexprvalue="true"%>
<%@ attribute name="hasSearchDate" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="isPopup" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="dateFieldName" required="false" rtexprvalue="true" %>
<%@ attribute name="selectedIndexDropDown" required="false" rtexprvalue="true" type="java.lang.Integer" %>
<%@ attribute name="keyConfirmCheck" required="false" rtexprvalue="true" %>
<%@ attribute name="pageSize" required="false" rtexprvalue="true"  type="java.lang.Integer"%>
<%
	request.setAttribute("fields", new ArrayList<MyFieldTag>());
	request.setAttribute("cols", new ArrayList<MyColumnTag>());
	request.setAttribute("functions", new ArrayList<MyFunctionTag>());
	String menuSysCode4Grid =String.valueOf(request.getAttribute("menuSystemCode"));

	if(pageSize==null){
		pageSize=10;
	}
	
 %>

<jsp:doBody />

<%

    if(isPopup==null){
        isPopup=false;
    }

    List<MyColumnTag> cols = (List<MyColumnTag>) request.getAttribute("cols");
	List<MyFieldTag> fields = (List<MyFieldTag>) request.getAttribute("fields");
	List<MyFunctionTag> functions = (List<MyFunctionTag>) request.getAttribute("functions");
	
	String categoriesReadUrl=transportReadUrl;
%>

        <base:dialogConfirm name="dialogconfirmCheck" key="${keyConfirmCheck}" yesFunction="confirmYes"/>
		<base:message title='action.groupBy' jsutDefine="true"/>
		<base:message title='action.operation' jsutDefine="true"/>
		<base:message title='action.edit' jsutDefine="true"/>
		<base:message title='action.delete' jsutDefine="true"/>
	<div class="k-rtl">	
		<kendo:grid  name="${name}" dataBound="_${name}_onDataBound" selectable="${selectable}" pageable="true" sortable="true" height="400"  columnReorder="true" columnResize="true" filterable="true" navigatable="true">
		<kendo:grid-groupable>
					<kendo:grid-groupable-messages empty='${label_action_groupBy}' />
		</kendo:grid-groupable>
		<kendo:grid-toolbarTemplate>
		<div class="toolbar">
				<label class="category-label" for="categories1"><%=ResourceBoundleHolder.resourceBundle.getString("global.search") %></label>
	    		<input style=" width:18%" type="text" id="categoriesId" name="categories" onkeyup="categoriesChange1(event)" >
	    		<%if(hasSearchDate){ %>
					<base:mDatePickerNoDiv name="fromDate" key="global.fromDate" styleClass="small" currentDate="true"/>
					<base:mDatePickerNoDiv name="toDate" key="global.toDate" styleClass="small" currentDate="true"/>
				<%} %>
				<input type="image" src="<c:url value='/resources/images/docx.png'/>" alt="Submit" onclick="doSearchLikeOnGrid()">
			<div>
				<label class="category-label" for="categories2"><%=ResourceBoundleHolder.resourceBundle.getString(comboLabelCaptionKey) %></label>
	    		<kendo:dropDownList name="categories" optionLabel='<%=ResourceBoundleHolder.resourceBundle.getString("global.all") %>' dataTextField="${comboCaption}" 
	    				dataValueField="${comboId}" autoBind="true" change="categoriesChange2" dataBound="dataBound_dropdown">
	    			<kendo:dataSource>
		    			<kendo:dataSource-transport>            	
			                <kendo:dataSource-transport-read url="${categoriesReadUrl}" />                
			            </kendo:dataSource-transport>
	    			</kendo:dataSource>    			   			    			
	    		</kendo:dropDownList>
			</div>
   		</div>    		
    	</kendo:grid-toolbarTemplate>
	
	        <kendo:grid-columns>
				<%String rowNumTemplate="<label for=\"rowNum\" class=\"grid-row-number\" />";%>
				<%--<kendo:grid-column title='<%=ResourceBoundleHolder.resourceBundle.getString("global.row")%>' field="rowNumber"--%>
								   <%--filterable="false" attributes=" align='center'" sortable="false" headerAttributes=" align='center'" width="1%" template="<%=rowNumTemplate%>"/>--%>
	        	<%for(MyColumnTag col : cols) {
                    if(col.isFlag()){%>
                        <%String template="<img data-destination-address=\""+col.getFlagDestinationUrl()+"\" "+
                        " onclick=\"_anchorHandleClick(this,event)\" src=\""+request.getContextPath()+col.getFlagIconUrl()+"\" "+
                        " onmouseover=\"mouseOver(this)\" onmouseout=\"mouseOut(this)\" "+
                        " style=\"width: 17px; height: 17px;\">";%>
                        <kendo:grid-column attributes=" align='center'" title='<%=col.getTitle() %>' field="<%=col.getField() %>" width="<%=col.getWidth() %>" template="<%=template%>"/>
                    <%}else{ %>
                        <kendo:grid-column headerAttributes="style=\"height: auto;overflow: visible; white-space: normal;\"" title='<%=col.getTitle() %>' format="{0:#,0}" field="<%=col.getField() %>" width="<%=col.getWidth() %>"/>
                    <%}
                }%>

	        	<kendo:grid-column title='${label_action_operation}' width="100px" >
	            	<kendo:grid-column-command >
                        <%if(!isPopup && GlobalVariable.getButtonContainer(menuSysCode4Grid,"grid-edit-button")){%>
	            		    <kendo:grid-column-commandItem className="uk-button uk-button-success" click="_${name}_onEdit" name="edit" text='${label_action_edit}' />
                        <%} %>

						<%if(!isPopup && GlobalVariable.getButtonContainer(menuSysCode4Grid,"grid-remove-button")){%>
	            		    <kendo:grid-column-commandItem className="uk-button uk-button-danger" click="_${name}_onDelete" name="delete" text='${label_action_delete}' />
                        <%} %>

                        <%for(MyFunctionTag myFunctionTag : functions) {%>
                        	<%if(GlobalVariable.getButtonContainer(menuSysCode4Grid,myFunctionTag.getName())){%>
                                <kendo:grid-column-commandItem click='<%=myFunctionTag.getFunctionClick() %>'  name="<%=myFunctionTag.getName() %>" text="<%=myFunctionTag.getText() %>"/>
                        	<%} %>
                        <%} %>

	            	</kendo:grid-column-command>
            	</kendo:grid-column>            	
	        </kendo:grid-columns>
	        
	        
	        <kendo:dataSource  pageSize="<%=pageSize%>" serverPaging="true" serverSorting="true" serverFiltering="true" serverGrouping="true">
		        <kendo:dataSource-transport>
                	<kendo:dataSource-transport-read  url="${transportReadUrl}" type="POST"  contentType="application/json"/>
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
            function _anchorHandleClick(img,e){
                <%--var entityGrid = $("#${name}").data("kendoGrid");--%>
//                var rows = entityGrid.select();
                $("#dialogconfirmCheck").data('contents',e).dialog("open");

            }

            function confirmYes(e){
//                var img=e.data('contents');
                var event=e.data('contents');
                <%--var entityGrid = $("#${name}").data("kendoGrid");--%>
                var grid = $("#${name}").data("kendoGrid");
//                var rows = entityGrid.select();
//                var rowEntity = [rows.length];
//                rows.each(function(index, row) {
//                    var selectedItem = entityGrid.dataItem(row);
//                    rowEntity[index] = selectedItem;
//                });
				row=$(event.target).closest("tr");

                var destinationUrl = event.target.getAttribute('data-destination-address');
                var baseUrlPath = getBaseUrl();
//                destinationUrl = baseUrlPath + '/' + destinationUrl + '/' + rowEntity[0].id;
                destinationUrl = baseUrlPath + '/' + destinationUrl + '/' +  grid.dataItem(row).id;
                $.getJSON(destinationUrl, function(result){
                    if(result.state == "success"){
                        $("#${name}").data("kendoGrid").dataSource.read();
                        if(typeof(_${name}_confirmYes_callback) == "function"){
                            _${name}_confirmYes_callback(e);
                        }
                        alertify.success(result.message);
                    }else if(result.state == "error"){
                        for(var i=0; i<result.errors.length; i++){
                            alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                        }
                    }else{
                        lertify.error("Something is not good! O_o");
                    }
                });
            }
            function mouseOver(img){
                img.className = 'mouseOverCursor';
            }
            function mouseOut(img){
                img.removeAttribute('mouseOverCursor');
            }
   	        function _${name}_onDelete(e){
	          	var data = this.dataItem($(e.target).closest("tr"));
	            alertify.confirm("Are you sure?", function (e) {
				    if (e) {
				        jQuery.ajax ({
						    url: basePath + "remove",
						    type: "POST",
						    data: JSON.stringify({id: data.id}),
						    dataType: "json",
						    contentType: "application/json; charset=utf-8",
						    success: function(result){
						        if(result.state == "success"){
						        	$("#${name}").data("kendoGrid").dataSource.read();
					        		alertify.success(result.message);
						        }else if(result.state == "error"){
						        	for(var i=0; i<result.errors.length; i++){
						        		alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
						        	}
						        }else{
						        	lertify.error("Something is not good! O_o");
						        }
						        
						    }
						});
				    }
				});
	        }
	        
	        function _${name}_onEdit(e){
	          	var data = this.dataItem($(e.target).closest("tr"));
	            window.location = basePath + "edit/" + data.id;
	        }

            function _${name}_onDataBound(e){
                <%--var grid = $("#${name}").data("kendoGrid");--%>
                <%--var data = grid.dataSource.data();--%>
                <%--$.each(data, function (i, row) {--%>
                    <%--if (row.state == 1){--%>
                        <%--$('tr[data-uid="' + row.uid + '"] ').css("background-color", "green");--%>
                    <%--}--%>
                    <%--else if (row.state == 3){--%>
                        <%--$('tr[data-uid="' + row.uid + '"] ').css("background-color", "gold");--%>
                    <%--}--%>
                <%--});--%>
                <%--_${name}_onDataBound_callback(e);--%>
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
                if(typeof(_${name}_onDataBound_callback) == "function"){
                    _${name}_onDataBound_callback(e);
                }

            }
	        
	    function categoriesChange2() {
			doSearchLikeOnGrid();
		}
	        
	     function categoriesChange1(event) {
			if(event.keyCode==13|| $(categoriesId).val().length==0){
				doSearchLikeOnGrid();		 
	      	}
		}
		
		function doSearchLikeOnGrid(){
			var valueC = $(categories).val(),grid = $("#${name}").data("kendoGrid");
		 	var valueT = $(categoriesId).val(),grid = $("#${name}").data("kendoGrid");
		 	var valueT = $(categoriesId).val(),grid = $("#${name}").data("kendoGrid");
		 	var valueFD = $(fromDate).val(),grid = $("#${name}").data("kendoGrid");
		 	var valueTD = $(toDate).val(),grid = $("#${name}").data("kendoGrid");
		 	var searchFilters=[];
         	if (valueC) {
            	searchFilters.push({ field: "${modelFieldFilterCombo}", operator: "eq", value: parseInt(valueC) });
         	}
         	if (valueT) {
		    	searchFilters.push({ field: "${modelFieldFilterText}", operator: "contains", value: (valueT) });
	     	}
	     	if (valueFD) {
		    	searchFilters.push({ field: "${dateFieldName}", operator: "gte", value: (valueFD) });
	     	}
	     	if (valueTD) {
		    	searchFilters.push({ field: "${dateFieldName}", operator: "lte", value: (valueTD) });
	     	}
	     	//
            if(typeof(${name}_finalizeSearchFilter) == "function"){
                ${name}_finalizeSearchFilter(searchFilters);
            }
			//
	     	grid.dataSource.filter(searchFilters);
	     	${followFunction}(); 
		}

		function  dataBound_dropdown(e){
            if("${selectedIndexDropDown}"!=""){
                if(e.sender.dataSource._data.length>0){
                    $("#categories").data("kendoDropDownList").select(${selectedIndexDropDown});
                    <!--$("#${name}").val(e.sender.dataSource._data["${selectIndex}"].ComboID);-->
                }
            }
        }		
        </script>