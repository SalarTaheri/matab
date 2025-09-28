
<%@tag import="java.util.ResourceBundle"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/resources/js/select2-3.4.5/select2.css' />" type="text/css"></link>
<script type="text/javascript" src="<c:url value='/resources/js/select2-3.4.5/select2.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/quicksearch-master/jquery.quicksearch.js' />"></script>
<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="value" required="false" rtexprvalue="true"%>
<%@ attribute name="key" required="true" rtexprvalue="true"%>
<%@ attribute name="ignore" required="false" rtexprvalue="true"%>
<%@ attribute name="absoluteLoaderUrl" required="true" rtexprvalue="true"%>
<%@ attribute name="isListConstant" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="styleClass" required="false" rtexprvalue="true"%>
<%
	ignore=(ignore==null ||ignore.equals(""))?"false":"true";
	
	if(styleClass==null ||styleClass.length()==0||styleClass.equals("normal"))
		styleClass="uk-width-4-10";
	else if(styleClass.equals("small"))
		styleClass="uk-width-2-10";
	else if(styleClass.equals("larg"))
		styleClass="uk-width-6-10";
%>
<jsp:doBody />
	<div class="uk-width-1-10 left-align">
		<label for="${name}_MultiSecttPanel"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></label>
	</div>
	<div class="<%= styleClass%> k-rtl" >
		<select name="${name}" id='${name}' multiple='multiple' class="uk-width-1-1" style=" display:none">
<%--		  <optgroup label='Friends'>--%>
<%--		    <option value='1'>Yoda</option>--%>
<%--		    <option value='2' selected>Obiwan</option>--%>
<%--		  </optgroup>--%>
<%--		  <optgroup label='Enemies'>--%>
<%--		    <option value='3'>Palpatine</option>--%>
<%--		    <option value='4' >Darth Vader</option>--%>
<%--		  </optgroup>--%>
		</select>
		
	</div>

<script>

$('#${name}').multiSelect({
    selectableOptgroup:true,
    selectableFooter:"<div class='custom-header'>All Items</div>",
    selectionFooter:"<div class='custom-header'>Selected Items</div>",
    selectableHeader:"<input type='text' class='search-input' autocomplete='off' placeholder='' style=' width: 100%; direction: ltr; '>",
    selectionHeader:"<input type='text' class='search-input' autocomplete='off' placeholder=''  style=' width: 100%; direction: ltr; '>",
    afterInit:function (ms) {
        var that = this,
                $selectableSearch = that.$selectableUl.prev(),
                $selectionSearch = that.$selectionUl.prev(),
                selectableSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selectable:not(.ms-selected)',
                selectionSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selection.ms-selected';

        that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
                .on('keydown', function (e) {
                    if (e.which === 40) {
                        that.$selectableUl.focus();
                        return false;
                    }
                });

        that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
                .on('keydown', function (e) {
                    if (e.which == 40) {
                        that.$selectionUl.focus();
                        return false;
                    }
                });
        var selectedClass = 'ui-state-highlight',
                clickDelay = 600,     // click time (milliseconds)
                lastClick, diffClick; // timestamps
        var list=$('.ms-selection .ms-list');

        list.sortable({
            revert: true,
            receive: function (event, ui) {
                alert("receive been triggered.");
            }
        }).droppable({ });

        $("ul, li").disableSelection();

    },
    afterSelect:function () {
        this.qs1.cache();
        this.qs2.cache();
    },
    afterDeselect:function () {
        this.qs1.cache();
        this.qs2.cache();
    }

});
function value(){

    var list=$('.ms-selection').find("li");
    var returnList=[];
    for(var i=0;i<list.length;i++){

        if($('.ms-selection').find("li")[i].style.cssText=="direction: ltr;"){

            var selected=$('.ms-selection').find("li")[i];
            returnList[returnList.length]=selected.id.split('-selection')[0];
        }
    }
    return returnList;
}
$.getJSON("<c:url value='/' />" + "${absoluteLoaderUrl}" , function(data) {
		$("#${name}").append(data.data);
		$("#${name}").multiSelect("refresh");
});


</script>
