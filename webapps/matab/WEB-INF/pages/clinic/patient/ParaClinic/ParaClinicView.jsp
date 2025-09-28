<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script src="<c:url value='/resources/js/ajax_card/jquery.livequery.js' />"></script>
<link href="<c:url value='/resources/js/ajax_card/css.css'/>" 	rel="stylesheet" />


<div align="left">
	<div id="wrap" align="left">
		
		<ul>
			<li id="1">
				<img src="<c:url value='/resources/images/shoppingCard/1.png'/>" class="items" height="100" alt="" />
				
				<br clear="all" />
				<div><span class="name">Mac/OS X: Price</span>: $<span class="price">800</span> </div>
			</li>
			<li id="2">
				<img src="<c:url value='/resources/images/shoppingCard/5.png'/>" class="items" height="100" alt="" />
				
				<br clear="all" />
				<div><span class="name">IPhone 3GS </span>: $<span class="price">500 </span></div>
			</li>
			<li id="3">
				<img src="<c:url value='/resources/images/shoppingCard/1.png'/>" class="items" height="100" alt="" />
				
				<br clear="all" />
				<div><span class="name">Apple IPad </span>: $<span class="price">450</span></div>
			</li>
			
			<li id="4">
				<img src="<c:url value='/resources/images/shoppingCard/6.png'/>" class="items" height="100" alt="" />
				
				<br clear="all" />
				<div><span class="name">Mac NoteBook </span>: $<span class="price">1200 </span></div>
			</li>
			<li id="5">
				<img src="<c:url value='/resources/images/shoppingCard/7.png'/>" class="items" height="100" alt="" />
				
				<br clear="all" />
				<div> <span class="name">Bag : Buy Now Price </span>: $<span class="price">65</span></div>
			</li>
			
			<li id="6">
				<img src="<c:url value='/resources/images/shoppingCard/5.png'/>" class="items" height="100" alt="" />
				
				<br clear="all" />
				<div><span class="name">IPhone 4GS </span>: $<span class="price">800</span> </div>
			</li>
			
			<li id="7">
				<img src="<c:url value='/resources/images/shoppingCard/7.png'/>" class="items" height="100" alt="" />
				
				<br clear="all" />
				<div><span class="name"> Bag : Buy Now Price </span>: $<span class="price">45</span></div>
			</li>
			<li id="8">
				<img src="<c:url value='/resources/images/shoppingCard/6.png'/>" class="items" height="100" alt="" />
				
				<br clear="all" />
				<div><span class="name">Mac NoteBook </span>: $<span class="price">900 </span></div>
			</li>
			
			<li id="9">
				<img src="<c:url value='/resources/images/shoppingCard/8.png'/>" class="items" height="100" alt="" />
				
				<br clear="all" />
				<div><span class="name">Sony Super Ear Phone </span>: $<span class="price">20</span></div>
			</li>
			
		</ul>
		
		<br clear="all" />
		
		<div id="bottomBar" align="left"><img src="<c:url value='/resources/images/shoppingCard/carts.png'/>" id="cart" /></div>
	
	</div>
	
	<div id="left_bar"> 
		
		<form action="#" id="cart_form" name="cart_form">
		
		<div class="cart-info"></div>
		
		<div class="cart-total">
		
			<b>Total Charges:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b> $<span>0</span>
			
			<input type="hidden" name="total-hidden-charges" id="total-hidden-charges" value="0" />
		</div>
		
		<button type="submit" id="Submit">CheckOut</button>
		
		</form>
	</div> 
</div>
<script type="text/javascript">

$(document).ready(function() {
	
	var Arrays=new Array();
	
	$('#wrap li').mousemove(function(){
		
		var position = $(this).position();
		
		$('#cart').stop().animate({
																									
				left   : position.left+'px',
				
			},250,function(){
			
		});			
	}).mouseout(function(){
		
	});	
	
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
			
			$('#left_bar .cart-info').append('<div class="shopp" id="each-'+thisID+'"><div class="label">'+itemname+'</div><div class="shopp-price"> $<em>'+itemprice+'</em></div><span class="shopp-quantity">1</span><img src="${pageContext.request.contextPath}/resources/images/shoppingCard/remove.png" class="remove" /><br class="all" /></div>');
			
			$('#cart').css({'-webkit-transform' : 'rotate(20deg)','-moz-transform' : 'rotate(20deg)' });
		}
		
		setTimeout('angle()',200);
	});	
	
	
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
		
		$('#left_bar').html('Total Charges: $'+totalCharge);
		
		return false;
		
	});	
	
});

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
