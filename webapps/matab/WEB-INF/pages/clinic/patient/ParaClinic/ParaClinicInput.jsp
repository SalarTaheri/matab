<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<script src="<c:url value='/resources/js/ajax_card/jquery.livequery.js' />"></script>
<link href="<c:url value='/resources/js/ajax_card/css.css'/>" 	rel="stylesheet" />


<%--<div align="left" style="height:100%">--%>
<div class="uk-container uk-container-center my-uk-container" >
	<div class="uk-grid uk-grid-preserve">
        <base:comboBox styleClass="small" name="paraClinicListItem" key="his.patient.doctorName" value="doctorFullName" comboLoaderUrl="combo/loadAllDoctor"/>
	</div>

	<div id="wrap" align="left">
		<ul id="paraClinicList">
		</ul>
		<br clear="all" />
<%--		<div id="bottomBar" align="left"><img src="<c:url value='/resources/images/shoppingCard/carts3.gif'/>" id="cart" /></div>--%>
	</div>
	
		<div id="left_bar"> 
		<form action="#" id="cart_form" name="cart_form">
			<div class="cart-info"></div>
			<div class="cart-total">
				<b>Total Charges:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b> Rial <span>0</span>
				<input type="hidden" name="total-hidden-charges" id="total-hidden-charges" value="0" />
			</div>
			<button type="submit" id="Submit">CheckOut</button>
		</form>
	</div> 

</div>
<script type="text/javascript">
var Arrays=new Array();
$(document).ready(function() {
	
	
	$('.remove').livequery('click', function() {
		
		var deduct = $(this).parent().children(".shopp-price").find('em').html();
		var prev_charges = $('.cart-total span').html();
		
		var thisID = $(this).parent().attr('id').replace('each-','');
		
		var pos = getpos(Arrays,thisID);
		Arrays.splice(pos,1,"0")
		
		prev_charges = parseInt(prev_charges)-parseInt(deduct);
		$('.cart-total span').html(prev_charges);
		$('#total-hidden-charges').val(prev_charges);
		$(this).parent().remove();
		
	});	
	
	$('#Submit').livequery('click', function() {
		
		var totalCharge = $('#total-hidden-charges').val();
		
		$('#left_bar').html('Total Charges: Rial '+totalCharge);
		
		return false;
		
	});	
	
});

function callback_select_paraClinicListItem(e){
		$.getJSON("<c:url value='/' />" + "clinic/basicInfo/diagnosis/combo/loadAllDiagnosisGet" ,
	 function(data) {
		for ( var i = 0; i < data.length; i++) {
		
		xurl='<c:url value='/resources/images/shoppingCard'/>';
		xurl+='/'+i+'.jpg';
		var xx='<li id="'+i+'">';
			xx+='<img src='+xurl+' class="items" height="100" />';
			xx+='<br clear="all" />';
			xx+='<div><span class="name">'+data[i].ComboCaption+': Price</span>: $<span class="price">'+i*1000+'</span> </div>';
			xx+='</li>';
			$("#paraClinicList").append(xx);
		}
		myRefresh();
	});
}


function myRefresh(){
		$('#wrap li').click(function(){
			var thisID = $(this).attr('id');
			
			var itemname  = $(this).find('div .name').html();
			var itemprice = $(this).find('div .price').html();
				
			if(include(Arrays,thisID))
			{
				var price 	 = $('#each-'+thisID).children(".shopp-price").find('em').html();
				var quantity = $('#each-'+thisID).children(".shopp-quantity").html();
				quantity = parseInt(quantity)+parseInt(1);
				
				var total = parseInt(itemprice)*parseInt(quantity);
				
				$('#each-'+thisID).children(".shopp-price").find('em').html(total);
				$('#each-'+thisID).children(".shopp-quantity").html(quantity);
				
				var prev_charges = $('.cart-total span').html();
				prev_charges = parseInt(prev_charges)-parseInt(price);
				
				prev_charges = parseInt(prev_charges)+parseInt(total);
				$('.cart-total span').html(prev_charges);
				
				$('#total-hidden-charges').val(prev_charges);
			}
			else
			{
				Arrays.push(thisID);
				
				var prev_charges = $('.cart-total span').html();
				prev_charges = parseInt(prev_charges)+parseInt(itemprice);
				
				$('.cart-total span').html(prev_charges);
				$('#total-hidden-charges').val(prev_charges);
				
				$('#left_bar .cart-info').append('<div class="shopp" id="each-'+thisID+'"><div class="label">'+itemname+'</div><div class="shopp-price"> Rial <em>'+itemprice+'</em></div><span class="shopp-quantity">1</span><img src="${pageContext.request.contextPath}/resources/images/shoppingCard/remove.png" class="remove" /><br class="all" /></div>');
				
				$('#cart').css({'-webkit-transform' : 'rotate(-10deg)','-moz-transform' : 'rotate(20deg)' });
			}
			
			setTimeout('angle()',200);
		});	
	}

function include(arr, obj) {
  for(var i=0; i<arr.length; i++) {
    if (arr[i] == obj) return true;
  }
}
function getpos(arr, obj) {
  for(var i=0; i<arr.length; i++) {
    if (arr[i] == obj) return i;
  }
}
function angle(){$('#cart').css({'-webkit-transform' : 'rotate(0deg)','-moz-transform' : 'rotate(0deg)' });}

</script>
