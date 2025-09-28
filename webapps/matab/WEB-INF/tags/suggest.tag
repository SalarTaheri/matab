
<%@tag import="java.util.ResourceBundle"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>

<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="key" required="true" rtexprvalue="true"%>
<%@ attribute name="fieldNames" required="true" rtexprvalue="true"%>
<%@ attribute name="tagNames" required="true" rtexprvalue="true"%>
<%@ attribute name="suggestLoaderController" required="true" rtexprvalue="true"%>
<%@ attribute name="styleClass" required="false" rtexprvalue="true"%>
<%@ attribute name="value" required="false" rtexprvalue="true" %>
<%@ attribute name="ignore" required="false" rtexprvalue="true" %>
<%--<%@ attribute name="comboLoaderUrl" required="true" rtexprvalue="true" %>--%>
<%@ attribute name="isListConstant" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="style" required="false" rtexprvalue="true" %>
<%@ attribute name="stylediv" required="false" rtexprvalue="true" %>
<%@ attribute name="styledivLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="styleLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="minLength" required="false" rtexprvalue="true" type="java.lang.Integer" %>

<%
	String  divStyle="";
	if(styleClass==null ||styleClass.length()==0||styleClass.equals("normal"))
	    styleClass="uk-width-4-10";
	else if(styleClass.equals("small"))
	    styleClass="uk-width-2-10";
	else if(styleClass.equals("larg"))
	    styleClass="uk-width-6-10";
	else if(styleClass.toLowerCase().equals("verysmall"))
	    styleClass="uk-width-1-10";
	else if(styleClass.equals("midsmall")){
         styleClass="uk-width-1-10";
        divStyle="style='width: 15%'";
    }
%>

<jsp:doBody />
			<div class="uk-width-1-10 left-align">
				<label for="${name}"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></label>
			</div>
			<%--<div class="<%= styleClass%> k-rtl" >--%>
					<%--<input  id="${name}" name="${name}" placeholder="Select type..." class="uk-width-1-1"/>--%>
			<%--</div>--%>
            <%--<div class="<%= styleClass%> k-rtl" style="<%= stylediv%>">--%>
            <div <%=divStyle %> class="<%= styleClass%> k-rtl" >
                    <%--<input id="${name}_Comb" name="${name}_Comb" placeholder="Select type..." class="uk-width-1-1" style="<%= style%>"--%>
                    <input id="${name}_Comb" name="${name}_Comb" placeholder="Select type..." class="uk-width-1-1"
                           data-ignore="true"/>
                    <input type="hidden" id="${name}" name="${name}" class="uk-width-1-1" data-ignore="${ignore}"/>
                    <input type="hidden" id="${value}" name="${value}" class="uk-width-1-1" data-ignore="true"/>
            </div>

			<script>
		$(document).ready(function() {
                    $("#${name}_Comb").kendoComboBox({
                        placeholder: "<%=ResourceBoundleHolder.resourceBundle.getString("system.pleaseSelect")%>",
                        dataBound: function(e) {
                            if($("#${name}").val()!=""){
                                var combobox = $("#${name}_Comb").data("kendoComboBox");
                                combobox.select(combobox.ul.children().eq(0));
                            }
						},
                        dataTextField: "suggestCaption",
                        dataValueField: "suggestHiddenField",
                        filter: "contains",
                        autoBind: false,
                        minLength: 2,
                        change: function( event) {

                        var inp=$("#${name}_Comb").val();
                        var sepInp=[];
                        var tmp_fieldnames=[];
                        var tmp_tagNames=[];
                        sepInp=inp.split('@@@');
                        tmp_fieldnames="${fieldNames}".split(',');
                        tmp_tagNames="${tagNames}".split(',');
                        $.each( tmp_fieldnames, function( index, value ) {

							$.each( sepInp, function( key, secvalue ) {
								var tt=[];
								tt=secvalue.split(':');
								if(tt[0]==value){
									if($("#"+tmp_tagNames[index]).prop("tagName")=='P'){
										var container = document.getElementById(tmp_tagNames[index]);
										for(i=0;i<100;i++){
							  				var img1 = document.getElementById("img"+i);
							  				try{
     											container.removeChild(img1);
     										}catch(err){
     											break;
     										}
     									}
										var addrs=tt[1].split("|");
										for(i=0;i<addrs.length-1;i++){
							  				var img = new Image();
							  				img.id="img"+i;
     										img.src = window.location.protocol+"//"+window.location.host+"${pageContext.request.contextPath}"+'/resources/uploads/'+addrs[i];
     										container.appendChild(img);
     									}
									}else{
										$("#"+tmp_tagNames[index]).val(tt[1] );
									}

									}



							});

						});


        					},
                        dataSource: {
                            serverFiltering: true,
                            serverPaging:true,
                            transport: {
                            parameterMap: function (options) {
				                    return JSON.stringify(options);
				                },
                                read: {
                                	contentType: "application/json",
                                	type: "POST",
                                    url: getBaseUrl() + "${suggestLoaderController}",
                                    dataType: "json"
                                }
                            }
                        }
                    });

            window["called_${name}"] = false;

            window["bindToEntityById_after__${name}_Comb"] = function () {
                if (window["called_${name}"]) {
                    return;
                } else {
                    window["called_${name}"] = true;
                }
                if ($("#${name}").val() == "") {
                    <%--var combobox = $("#${name}_Comb").data("kendoComboBox");--%>
                    <%--combobox.setDataSource(dataSource_${name});--%>
//                    combobox.refresh();
                } else {
                    if ("${isListConstant}" == 'true') {
                        var a2 = $("#${name}").val();
                        var combobox = $("#${name}_Comb").data("kendoComboBox");
                        combobox.setDataSource(dataSource_${name});
                        combobox.dataSource.read();
                        combobox.refresh();
                        combobox.select(function (dataItem) {
                            return dataItem.ComboID == a2;
                        });

                    } else {
                        var combobox = $("#${name}_Comb").data("kendoComboBox");
                        var a2 = $("#${name}").val();
                        var a = $("#${value}").val();
//                        combobox.dataSource.data([
//                            {suggestCaption:a, suggestHiddenField:a2}
//                        ]);
//                        combobox.dataSource.query();
//                        combobox.options.autoBind=true;
                        combobox.dataSource.read({
                            filter: { field: "id", operator: "eq", value: a2 },
                            page : 1,
                            pageSize : 1,
                            take : 1
                        });
//                        combobox.options.autoBind=false;
                        combobox.select(combobox.ul.children().eq(0));
//                        combobox.options.autoBind=false;
                    }
                }

            }
                });
            </script>
