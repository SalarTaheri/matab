<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="key" required="true" rtexprvalue="true"%>
<%@ attribute name="cols" required="false" rtexprvalue="false"%>

<%
	String colsValue = "";
	if (cols!=null && cols.length() > 0 ){
		colsValue = cols;
	}else{
		colsValue = "90";
	}
%>

<jsp:doBody />
	<div class="uk-width-1-10 left-align" >
		<label for="${name}"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></label>			
	</div>	
	<div class="uk-width-9-10" style="">
		<textarea id="${name}" name="${name}" style="direction:rtl" cols="<%= colsValue%>" rows="50">
		</textarea>
	</div>
	
<script>
$(document).ready(function() {
	nicEditorConfig = bkClass.extend({
		buttons : {
			'bold' : {name : __('Click to Bold'), command : 'Bold', tags : ['B','STRONG'], css : {'font-weight' : 'bold'}, key : 'b'},
			'italic' : {name : __('Click to Italic'), command : 'Italic', tags : ['EM','I'], css : {'font-style' : 'italic'}, key : 'i'},
			'underline' : {name : __('Click to Underline'), command : 'Underline', tags : ['U'], css : {'text-decoration' : 'underline'}, key : 'u'},
			'left' : {name : __('Left Align'), command : 'justifyleft', noActive : true},
			'center' : {name : __('Center Align'), command : 'justifycenter', noActive : true},
			'right' : {name : __('Right Align'), command : 'justifyright', noActive : true},
			'justify' : {name : __('Justify Align'), command : 'justifyfull', noActive : true},
			'ol' : {name : __('Insert Ordered List'), command : 'insertorderedlist', tags : ['OL']},
			'ul' : 	{name : __('Insert Unordered List'), command : 'insertunorderedlist', tags : ['UL']},
			'subscript' : {name : __('Click to Subscript'), command : 'subscript', tags : ['SUB']},
			'superscript' : {name : __('Click to Superscript'), command : 'superscript', tags : ['SUP']},
			'strikethrough' : {name : __('Click to Strike Through'), command : 'strikeThrough', css : {'text-decoration' : 'line-through'}},
			'removeformat' : {name : __('Remove Formatting'), command : 'removeformat', noActive : true},
			'indent' : {name : __('Indent Text'), command : 'indent', noActive : true},
			'outdent' : {name : __('Remove Indent'), command : 'outdent', noActive : true},
			'hr' : {name : __('Horizontal Rule'), command : 'insertHorizontalRule', noActive : true}
		},
		iconsPath : '<%=request.getContextPath()%>/resources/images/nicEditorIcons.gif',
		buttonList : ['save','bold','italic','underline','left','center','right','justify','ol','ul','fontSize','fontFamily','fontFormat','indent','outdent','image','upload','link','unlink','forecolor','bgcolor'],
		iconList : {"bold":1,"center":2,"hr":3,"indent":4,"italic":5,"justify":6,"left":7,"ol":8,"outdent":9,"removeformat":10,"right":11,"save":20,"strikethrough":13,"subscript":14,"superscript":15,"ul":16,"underline":17,"image":18,"close":19,"arrow":21}
	});
	 
	bkLib.onDomLoaded(function(){
		  var myInstance = new nicEditor().panelInstance('${name}');
		  console.log(myInstance);
		  var nst = myInstance.nicPanel.elm.getElementsByClassName('nicEdit-selectTxt');
		  for(var i =0; i<nst.length; i++)
		  	nst[i].style.cssText="overflow: hidden; float: left; width: 66px; height: 15px; margin-top: 1px; font-family: sans-serif; text-align: center; font-size: 12px;"
	});
	
});
</script>