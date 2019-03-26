

<#assign shoppingCart = sessionAttributes.shoppingCart!>
<#if shoppingCart?has_content>
    <#assign shoppingCartSize = shoppingCart.size()>
<#else>
    <#assign shoppingCartSize = 0>
</#if>





	<div>
        <#if (shoppingCartSize > 0)>
        	<small>
			  	${uiLabelMap.EcommerceCartHas} <em class="highlight">${shoppingCart.getTotalQuantity()}
			  	${uiLabelMap.CommonProduct}</em>,
			  	<@ofbizCurrency amount=shoppingCart.getDisplayGrandTotal() isoCode=shoppingCart.getCurrency()/>
			</small>
			<br>
			<br>
        	
        <table cellspacing="0" class="cart">
			<tbody>  
		        <#if hidetoplinks?default("N") != "Y">
		          	<div class="cart-btn">
		              	<a href="<@ofbizUrl>showcart</@ofbizUrl>" class="col-sm-6">${uiLabelMap.OrderViewCart}</a>
		              	<#--<li><a href="<@ofbizUrl>checkoutoptions</@ofbizUrl>" class="button">${uiLabelMap.OrderCheckout}</a></li>-->
		              	<a href="<@ofbizUrl>quickcheckout</@ofbizUrl>" class="col-sm-6">${uiLabelMap.OrderCheckoutQuick}</a>
		              	<#--<li><a href="<@ofbizUrl>onePageCheckout</@ofbizUrl>" class="button">${uiLabelMap.EcommerceOnePageCheckout}</a></li>-->
		              	<#--<li><a href="<@ofbizUrl>googleCheckout</@ofbizUrl>" class="button">${uiLabelMap.EcommerceCartToGoogleCheckout}</a></li>-->
		          	</div>
		        </#if>
                
	            <#list shoppingCart.items() as cartLine>
	            <tr class="ci-item">
	              	<#if cartLine.getProductId()??>
	                  	<#if cartLine.getParentProductId()??>
	                  	  	<#assign parentProductId = cartLine.getParentProductId() />
	                  	<#else>
	                      	<#assign parentProductId = cartLine.getProductId() />
	                  	</#if>
	                  	<#assign smallImageUrl = Static["org.apache.ofbiz.product.product.ProductContentWrapper"].getProductContentAsText(cartLine.getProduct(), "LARGE_IMAGE_URL", locale, dispatcher, "url")! />
	            	  	<#if !smallImageUrl?string?has_content><#assign smallImageUrl = "/images/defaultImage.jpg" /></#if>
	            	  	<#if smallImageUrl?string?has_content>
		              		<td class="product-thumbnail">
								<a href="/products/p_${parentProductId}">
									<img height="90" width="90" alt="Product Image" class="img-responsive" src="<@ofbizContentUrl>${requestAttributes.contentPathPrefix!}${smallImageUrl}</@ofbizContentUrl>">
								</a>
							</td>
	            	  	</#if>
	            	  	<td class="product-name" style="padding-left: 30px;">
	                      	<#if cartLine.getParentProductId()??>
	                          	<h5><a href="/products/p_${parentProductId!}" class="linktext" style="white-space: normal;">
	                          	${cartLine.getName()}
	                          	</a></h5>
	                      	<#else>
	                          	<h5><a href="/products/p_${parentProductId!}" class="linktext" style="white-space: normal;">
	                          	${cartLine.getName()}
	                          	</a></h5>
	                      	</#if>
	                      	<p>${cartLine.getQuantity()?string.number} x <@ofbizCurrency amount=cartLine.getDisplayPrice() isoCode=shoppingCart.getCurrency()/>
	                      	<br>
	                      	= <@ofbizCurrency amount=cartLine.getDisplayItemSubTotal() isoCode=shoppingCart.getCurrency()/></p>
	                  	</td>
	              	<#else>
	                	<strong>${cartLine.getItemTypeDescription()!}</strong>
	              	</#if>
	                
	              
	              	<#if cartLine.getReservStart()??>
	                	<tr><td>&nbsp;</td><td colspan="2">(${cartLine.getReservStart()?string("yyyy-MM-dd")}, ${cartLine.getReservLength()} <#if cartLine.getReservLength() == 1>${uiLabelMap.CommonDay}<#else>${uiLabelMap.CommonDays}</#if>)</td></tr>
	              	</#if>
	            </tr>
	            </#list>
      		</tbody>
		</table>
		<#if hidebottomlinks?default("N") != "Y">
		<div class="ci-total">${uiLabelMap.OrderTotal}: <@ofbizCurrency amount=shoppingCart.getDisplayGrandTotal() isoCode=shoppingCart.getCurrency()/></div>
		<div class="cart-btn">
			<a href="<@ofbizUrl>showcart</@ofbizUrl>" type="submit">${uiLabelMap.OrderViewCart}</a>
			<a href="<@ofbizUrl>quickcheckout</@ofbizUrl>" type="submit" style="margin-left: 25px;">${uiLabelMap.OrderCheckoutQuick}</a>
		</div>
		</#if>
		
        <#else>
          	<p>${uiLabelMap.OrderShoppingCartEmpty}</p>
        </#if>
		
    </div>



	




								