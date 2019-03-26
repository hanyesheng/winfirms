
<script type="text/javascript">
//<![CDATA[
function toggle(e) {
    e.checked = !e.checked;
}
function checkToggle(e) {
    var cform = document.cartform;
    if (e.checked) {
        var len = cform.elements.length;
        var allchecked = true;
        for (var i = 0; i < len; i++) {
            var element = cform.elements[i];
            if (element.name == "selectedItem" && !element.checked) {
                allchecked = false;
            }
            cform.selectAll.checked = allchecked;
        }
    } else {
        cform.selectAll.checked = false;
    }
}
function toggleAll(e) {
    var cform = document.cartform;
    var len = cform.elements.length;
    for (var i = 0; i < len; i++) {
        var element = cform.elements[i];
        if (element.name == "selectedItem" && element.checked != e.checked) {
            toggle(element);
        }
    }
}
function removeSelected() {
    var cform = document.cartform;
    cform.removeSelected.value = true;
    cform.submit();
}
function addToList() {
    var cform = document.cartform;
    cform.action = "<@ofbizUrl>addBulkToShoppingList</@ofbizUrl>";
    cform.submit();
}
function gwAll(e) {
    var cform = document.cartform;
    var len = cform.elements.length;
    var selectedValue = e.value;
    if (selectedValue == "") {
        return;
    }

    var cartSize = ${shoppingCartSize};
    var passed = 0;
    for (var i = 0; i < len; i++) {
        var element = cform.elements[i];
        var ename = element.name;
        var sname = ename.substring(0,16);
        if (sname == "option^GIFT_WRAP") {
            var options = element.options;
            var olen = options.length;
            var matching = -1;
            for (var x = 0; x < olen; x++) {
                var thisValue = element.options[x].value;
                if (thisValue == selectedValue) {
                    element.selectedIndex = x;
                    passed++;
                }
            }
        }
    }
    if (cartSize > passed && selectedValue != "NO^") {
        showErrorAlert("${uiLabelMap.CommonErrorMessage2}","${uiLabelMap.EcommerceSelectedGiftWrap}");
    }
    cform.submit();
}
//]]>
</script>

<script type="text/javascript">
//<![CDATA[
function setAlternateGwp(field) {
  window.location=field.value;
};
//]]>
</script>
<div class="page_header space20 project">
	<div class="page_header_parallax4" style="background: url(/images/defaultCatgoryBg.jpg) no-repeat fixed center;background-size: cover;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h3>${uiLabelMap.OrderViewCart}</h3>
				</div>
			</div>
		</div>
	</div>
	<div class="bcrumb-wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="bcrumbs">
						<li><a href="<@ofbizUrl>main</@ofbizUrl>"><i class="fa fa-home"></i>&nbsp;&nbsp;${uiLabelMap.CommonMain}</a></li>
						<li>${uiLabelMap.PageTitleShoppingCart}</li>
					</ul>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Page Main -->
<div role="main" class="main">
	<div class="page-default bg-grey typo-dark">
		<!-- Container -->
		<div class="container">




<#assign fixedAssetExist = shoppingCart.containAnyWorkEffortCartItems() /> <#-- change display format when rental items exist in the shoppingcart -->

<#--
<div>
    <h2>
        <#if ((sessionAttributes.lastViewedProducts)?has_content && sessionAttributes.lastViewedProducts?size > 0)>
          <#assign continueLink = "/product?product_id=" + sessionAttributes.lastViewedProducts.get(0) />
        <#else>
          <#assign continueLink = "/main" />
        </#if>
        <a href="<@ofbizUrl>${continueLink}</@ofbizUrl>" class="submenutext">${uiLabelMap.EcommerceContinueShopping}</a>
        <#if (shoppingCartSize > 0)><a href="<@ofbizUrl>checkoutoptions</@ofbizUrl>" class="submenutext">${uiLabelMap.OrderCheckout}</a><#else><span class="submenutextrightdisabled">${uiLabelMap.OrderCheckout}</span></#if>
        ${uiLabelMap.CommonQuickAdd}
    </h2>
    <div>
        <div>
            <form method="post" action="<@ofbizUrl>additem<#if requestAttributes._CURRENT_VIEW_?has_content>/${requestAttributes._CURRENT_VIEW_}</#if></@ofbizUrl>" name="quickaddform">
                <fieldset>
                ${uiLabelMap.EcommerceProductNumber}<input type="text" class="inputBox" name="add_product_id" value="${requestParameters.add_product_id!}" />
                <#if (product?? && product.getString("productTypeId") == "ASSET_USAGE") || (product?? && product.getString("productTypeId") == "ASSET_USAGE_OUT_IN")>
                    ${uiLabelMap.EcommerceStartDate}: <input type="text" class="inputBox" size="10" name="reservStart" value="${requestParameters.reservStart?default("")}" />
                    ${uiLabelMap.EcommerceLength}: <input type="text" class="inputBox" size="2" name="reservLength" value="${requestParameters.reservLength?default("")}" />
                    </div>
                    <div>
                    &nbsp;&nbsp;${uiLabelMap.OrderNbrPersons}: <input type="text" class="inputBox" size="3" name="reservPersons" value="${requestParameters.reservPersons?default("1")}" />
                </#if>
                ${uiLabelMap.CommonQuantity}: <input type="text" class="inputBox" size="5" name="quantity" value="${requestParameters.quantity?default("1")}" />
                <input type="submit" class="smallSubmit" value="${uiLabelMap.OrderAddToCart}" />
                </fieldset>
            </form>
        </div>
    </div>
</div>
-->

<script type="text/javascript">
//<![CDATA[
  document.quickaddform.add_product_id.focus();
//]]>
</script>

<div>
    
    <#--
    <div>
        <div>
            <div class="lightbuttontextdisabled">
              <#if (shoppingCartSize > 0)>
                <a href="javascript:document.cartform.submit();" class="submenutext">${uiLabelMap.EcommerceRecalculateCart}</a>
                <a href="<@ofbizUrl>emptycart</@ofbizUrl>" class="submenutext">${uiLabelMap.EcommerceEmptyCart}</a>
                <a href="javascript:removeSelected();" class="submenutext">${uiLabelMap.EcommerceRemoveSelected}</a>
              <#else>
                <span class="submenutextdisabled">${uiLabelMap.EcommerceRecalculateCart}</span>
                <span class="submenutextdisabled">${uiLabelMap.EcommerceEmptyCart}</span>
                <span class="submenutextdisabled">${uiLabelMap.EcommerceRemoveSelected}</span>
              </#if>
              <#if (shoppingCartSize > 0)><a href="<@ofbizUrl>checkoutoptions</@ofbizUrl>" class="submenutextright">${uiLabelMap.OrderCheckout}</a><#else><span class="submenutextrightdisabled">${uiLabelMap.OrderCheckout}</span></#if>
            </div>
        </div>
        <br />
        <h2>&nbsp;${uiLabelMap.OrderShoppingCart}</h2>
    </div>
    -->
    
    <div>




  <#if (shoppingCartSize > 0)>
    <form method="post" action="<@ofbizUrl>modifycart</@ofbizUrl>" name="cartform">
      <fieldset>
      <input type="hidden" name="removeSelected" value="false" />
      <table class="cart-table table table-bordered" id="showcart-table1">
        <thead>
            <tr>
              <th></th>
              <th>${uiLabelMap.CommonImage}</th>
              <th scope="row">${uiLabelMap.OrderProduct}</th>
              <#if asslGiftWraps?has_content && productStore.showCheckoutGiftOptions! != "N">>
                <th scope="row">
                  <select class="selectBox" name="GWALL" onchange="javascript:gwAll(this);">
                    <option value="">${uiLabelMap.EcommerceGiftWrapAllItems}</option>
                    <option value="NO^">${uiLabelMap.EcommerceNoGiftWrap}</option>
                    <#list allgiftWraps as option>
                      <option value="${option.productFeatureId}">${option.description} : ${option.defaultAmount?default(0)}</option>
                    </#list>
                  </select>
              <#else>
                <th scope="row">&nbsp;</th>
              </#if>
              <#if fixedAssetExist == true>
                <td>
                    <table>
                        <tr>
                            <td>- ${uiLabelMap.EcommerceStartDate} -</td>
                            <td>- ${uiLabelMap.EcommerceNbrOfDays} -</td>
                        </tr>
                        <tr>
                            <td >- ${uiLabelMap.EcommerceNbrOfPersons} -</td>
                            <td >- ${uiLabelMap.CommonQuantity} -</td>
                        </tr>
                    </table>
                </td>
              <#else>
                <th scope="row">${uiLabelMap.CommonQuantity}</th>
              </#if>
              <th scope="row">${uiLabelMap.EcommerceUnitPrice}</th>
              <th scope="row">${uiLabelMap.EcommerceAdjustments}</th>
              <th scope="row">${uiLabelMap.EcommerceItemTotal}</th>
              <th scope="row"><input type="checkbox" name="selectAll" value="0" onclick="javascript:toggleAll(this);" /></th>
            </tr>
        </thead>
        <tbody>
        <#assign itemsFromList = false />
        <#assign promoItems = false />
        <#list shoppingCart.items() as cartLine>
          <#assign cartLineIndex = shoppingCart.getItemIndex(cartLine) />
          <#assign lineOptionalFeatures = cartLine.getOptionalProductFeatures() />
          <#-- show adjustment info -->
          <#list cartLine.getAdjustments() as cartLineAdjustment>
            <!-- cart line ${cartLineIndex} adjustment: ${cartLineAdjustment} -->
          </#list>

          <tr id="cartItemDisplayRow_${cartLineIndex}">
            <td>
                <#if cartLine.getShoppingListId()??>
                  <#assign itemsFromList = true />
                  <a href="<@ofbizUrl>editShoppingList?shoppingListId=${cartLine.getShoppingListId()}</@ofbizUrl>" class="linktext">L</a>&nbsp;&nbsp;
                <#elseif cartLine.getIsPromo()>
                  <#assign promoItems = true />
                  <a href="<@ofbizUrl>view/showcart</@ofbizUrl>" class="button">P</a>&nbsp;&nbsp;
                <#else>
                  &nbsp;
                </#if>
            </td>
            <td>
                  <#if cartLine.getProductId()??>
                    <#-- product item -->
                    <#-- start code to display a small image of the product -->
                    <#if cartLine.getParentProductId()??>
                      <#assign parentProductId = cartLine.getParentProductId() />
                    <#else>
                      <#assign parentProductId = cartLine.getProductId() />
                    </#if>
                    <#assign smallImageUrl = Static["org.apache.ofbiz.product.product.ProductContentWrapper"].getProductContentAsText(cartLine.getProduct(), "LARGE_IMAGE_URL", locale, dispatcher, "url")! />
                    <#if !smallImageUrl?string?has_content><#assign smallImageUrl = "/images/defaultImage.jpg" /></#if>
                    <#if smallImageUrl?string?has_content>
                      <a href="/products/p_${parentProductId!}">
                        <img src="<@ofbizContentUrl>${requestAttributes.contentPathPrefix!}${smallImageUrl}</@ofbizContentUrl>" alt="Product Image" class="imageborder" height="90" width="90"/>
                      </a>
                    </#if>
            </td>
            <td>
                    <#-- end code to display a small image of the product -->
                    <#-- ${cartLineIndex} - -->
                    <a href="/products/p_${parentProductId!}" class="linktext">
                    ${cartLine.getName()!}</a>
                    <#-- For configurable products, the selected options are shown -->
                    <#if cartLine.getConfigWrapper()??>
                      <#assign selectedOptions = cartLine.getConfigWrapper().getSelectedOptions()! />
                      <#if selectedOptions??>
                        <div>&nbsp;</div>
                        <#list selectedOptions as option>
                          <div>
                            ${option.getDescription()}
                          </div>
                        </#list>
                      </#if>
                    </#if>

                    <#-- if inventory is not required check to see if it is out of stock and needs to have a message shown about that... -->
                    <#assign itemProduct = cartLine.getProduct() />
                    <#assign isStoreInventoryNotRequiredAndNotAvailable = Static["org.apache.ofbiz.product.store.ProductStoreWorker"].isStoreInventoryRequiredAndAvailable(request, itemProduct, cartLine.getQuantity(), false, false) />
                    <#if isStoreInventoryNotRequiredAndNotAvailable && itemProduct.inventoryMessage?has_content>
                        (${itemProduct.inventoryMessage})
                    </#if>

                  <#else>
                    <#-- this is a non-product item -->
                    ${cartLine.getItemTypeDescription()!}: ${cartLine.getName()!}
                  </#if>
                  <#assign attrs = cartLine.getOrderItemAttributes()/>
                  <#if attrs?has_content>
                    <#assign attrEntries = attrs.entrySet()/>
                    <ul>
                    <#list attrEntries as attrEntry>
                        <li>
                            ${attrEntry.getKey()} : ${attrEntry.getValue()}
                        </li>
                    </#list>
                    </ul>
                  </#if>
                <#if (cartLine.getIsPromo() && cartLine.getAlternativeOptionProductIds()?has_content)>
                  <#-- Show alternate gifts if there are any... -->
                  <div class="tableheadtext">${uiLabelMap.OrderChooseFollowingForGift}:</div>
                  <select name="dummyAlternateGwpSelect${cartLineIndex}" onchange="setAlternateGwp(this);" class="selectBox">
                  <option value="">- ${uiLabelMap.OrderChooseAnotherGift} -</option>
                  <#list cartLine.getAlternativeOptionProductIds() as alternativeOptionProductId>
                    <#assign alternativeOptionName = Static["org.apache.ofbiz.product.product.ProductWorker"].getGwpAlternativeOptionName(dispatcher, delegator, alternativeOptionProductId, requestAttributes.locale) />
                    <option value="<@ofbizUrl>setDesiredAlternateGwpProductId?alternateGwpProductId=${alternativeOptionProductId}&alternateGwpLine=${cartLineIndex}</@ofbizUrl>">${alternativeOptionName?default(alternativeOptionProductId)}</option>
                  </#list>
                  </select>
                  <#-- this is the old way, it lists out the options and is not as nice as the drop-down
                  <ul>
                  <#list cartLine.getAlternativeOptionProductIds() as alternativeOptionProductId>
                    <#assign alternativeOptionName = Static["org.apache.ofbiz.product.product.ProductWorker"].getGwpAlternativeOptionName(delegator, alternativeOptionProductId, requestAttributes.locale) />
                    <li><a href="<@ofbizUrl>setDesiredAlternateGwpProductId?alternateGwpProductId=${alternativeOptionProductId}&alternateGwpLine=${cartLineIndex}</@ofbizUrl>" class="button">Select: ${alternativeOptionName?default(alternativeOptionProductId)}</a></li>
                  </#list>
                  </ul>
                  -->
                </#if>
            </td>

            <#-- gift wrap option -->
            <#assign showNoGiftWrapOptions = false />
            <td >
              <#assign giftWrapOption = lineOptionalFeatures.GIFT_WRAP! />
              <#assign selectedOption = cartLine.getAdditionalProductFeatureAndAppl("GIFT_WRAP")! />
              <#if giftWrapOption?has_content>
                <select class="selectBox" name="option^GIFT_WRAP_${cartLineIndex}" onchange="javascript:document.cartform.submit()">
                  <option value="NO^">${uiLabelMap.EcommerceNoGiftWrap}</option>
                  <#list giftWrapOption as option>
                    <option value="${option.productFeatureId}" <#if ((selectedOption.productFeatureId)?? && selectedOption.productFeatureId == option.productFeatureId)>selected="selected"</#if>>${option.description} : ${option.amount?default(0)}</option>
                  </#list>
                </select>
              <#elseif showNoGiftWrapOptions>
                <select class="selectBox" name="option^GIFT_WRAP_${cartLineIndex}" onchange="javascript:document.cartform.submit()">
                  <option value="">${uiLabelMap.EcommerceNoGiftWrap}</option>
                </select>
              <#else>
                &nbsp;
              </#if>
            </td>
            <#-- end gift wrap option -->

            <td>
                <#if cartLine.getIsPromo() || cartLine.getShoppingListId()??>
                       <#if fixedAssetExist == true>
                        <#if cartLine.getReservStart()??>
                            <table >
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>${cartLine.getReservStart()?string("yyyy-mm-dd")}</td>
                                    <td>${cartLine.getReservLength()?string.number}</td></tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>${cartLine.getReservPersons()?string.number}</td>
                                    <td>
                        <#else>
                            <table >
                                <tr>
                                    <td >--</td>
                                    <td>--</td>
                                </tr>
                                <tr>
                                    <td>--</td>
                                    <td>    
                        </#if>
                        ${cartLine.getQuantity()?string.number}</td></tr></table>
                    <#else><#-- fixedAssetExist -->
                        ${cartLine.getQuantity()?string.number}
                    </#if>
                <#else><#-- Is Promo or Shoppinglist -->
                       <#if fixedAssetExist == true><#if cartLine.getReservStart()??><table><tr><td>&nbsp;</td><td><input type="text" class="inputBox" size="10" name="reservStart_${cartLineIndex}" value=${cartLine.getReservStart()?string}/></td><td><input type="text" class="inputBox" size="2" name="reservLength_${cartLineIndex}" value="${cartLine.getReservLength()?string.number}"/></td></tr><tr><td>&nbsp;</td><td><input type="text" class="inputBox" size="3" name="reservPersons_${cartLineIndex}" value=${cartLine.getReservPersons()?string.number} /></td><td><#else>
                           <table><tr><td>--</td><td>--</td></tr><tr><td>--</td><td></#if>
                        <input size="6" class="inputBox" type="text" name="update_${cartLineIndex}" value="${cartLine.getQuantity()?string.number}" /></td></tr></table>
                    <#else><#-- fixedAssetExist -->
                        <input size="6" class="inputBox" type="text" name="update_${cartLineIndex}" value="${cartLine.getQuantity()?string.number}" />
                    </#if>
                </#if>
            </td>
            <td><@ofbizCurrency amount=cartLine.getDisplayPrice() isoCode=shoppingCart.getCurrency()/></td>
            <td><@ofbizCurrency amount=cartLine.getOtherAdjustments() isoCode=shoppingCart.getCurrency()/></td>
            <td><@ofbizCurrency amount=cartLine.getDisplayItemSubTotal() isoCode=shoppingCart.getCurrency()/></td>
            <td><#if !cartLine.getIsPromo()><input type="checkbox" name="selectedItem" value="${cartLineIndex}" onclick="javascript:checkToggle(this);" /><#else>&nbsp;</#if></td>
          </tr>
        </#list>
        <tr>
	        <td colspan="9" style="text-align:right">
	          <strong>
	          ${uiLabelMap.EcommerceCartTotal}: <@ofbizCurrency amount=shoppingCart.getDisplayGrandTotal() isoCode=shoppingCart.getCurrency()/>
	          </strong>
	        </td>
	    </tr>
        
    </tbody>
    </table>
    <#--
    <table>
        <#if shoppingCart.getAdjustments()?has_content>
            <tr>
              <th>${uiLabelMap.CommonSubTotal}:</th>
              <td><@ofbizCurrency amount=shoppingCart.getDisplaySubTotal() isoCode=shoppingCart.getCurrency()/></td>
              <td>&nbsp;</td>
            </tr>
            <#if (shoppingCart.getDisplayTaxIncluded() > 0.0)>
              <tr>
                <th>${uiLabelMap.OrderSalesTaxIncluded}:</th>
                <td><@ofbizCurrency amount=shoppingCart.getDisplayTaxIncluded() isoCode=shoppingCart.getCurrency()/></td>
                <td>&nbsp;</td>
              </tr>
            </#if>
            <#list shoppingCart.getAdjustments() as cartAdjustment>
              <#assign adjustmentType = cartAdjustment.getRelatedOne("OrderAdjustmentType", true) />
              <tr>
                <th>
                    ${uiLabelMap.EcommerceAdjustment} - ${adjustmentType.get("description",locale)!}
                    <#if cartAdjustment.productPromoId?has_content><a href="<@ofbizUrl>showPromotionDetails?productPromoId=${cartAdjustment.productPromoId}</@ofbizUrl>" class="button">${uiLabelMap.CommonDetails}</a></#if>:
                </th>
                <td><@ofbizCurrency amount=Static["org.apache.ofbiz.order.order.OrderReadHelper"].calcOrderAdjustment(cartAdjustment, shoppingCart.getSubTotal()) isoCode=shoppingCart.getCurrency()/></td>
                <td>&nbsp;</td>
              </tr>
            </#list>
        </#if>
        <tr>
          <th>${uiLabelMap.EcommerceCartTotal}:</th>
          <td><@ofbizCurrency amount=shoppingCart.getDisplayGrandTotal() isoCode=shoppingCart.getCurrency()/></td>
        </tr>
        <#if itemsFromList>
        <tr>
          <td>L - ${uiLabelMap.EcommerceItemsfromShopingList}.</td>
        </tr>
        </#if>
        <#if promoItems>
        <tr>
          <td>P - ${uiLabelMap.EcommercePromotionalItems}.</td>
        </tr>
        </#if>
        <#if !itemsFromList && !promoItems>
        <tr>
          <td>&nbsp;</td>
        </tr>
        </#if>
        <tr>
          <td>
              <#if sessionAttributes.userLogin?has_content && sessionAttributes.userLogin.userLoginId != "anonymous">
              <select name="shoppingListId" class="selectBox">
                <#if shoppingLists?has_content>
                  <#list shoppingLists as shoppingList>
                    <option value="${shoppingList.shoppingListId}">${shoppingList.listName}</option>
                  </#list>
                </#if>
                <option value="">---</option>
                <option value="">${uiLabelMap.OrderNewShoppingList}</option>
              </select>
              &nbsp;&nbsp;
              <a href="javascript:addToList();" class="button">${uiLabelMap.EcommerceAddSelectedtoList}</a>&nbsp;&nbsp;
              <#else>
               ${uiLabelMap.OrderYouMust} <a href="<@ofbizUrl>checkLogin/showcart</@ofbizUrl>" class="button">${uiLabelMap.CommonBeLogged}</a>
                ${uiLabelMap.OrderToAddSelectedItemsToShoppingList}.&nbsp;
              </#if>
          </td>
        </tr>
        <tr>
          <td>
              <#if sessionAttributes.userLogin?has_content && sessionAttributes.userLogin.userLoginId != "anonymous">
              &nbsp;&nbsp;
              <a href="<@ofbizUrl>createCustRequestFromCart</@ofbizUrl>" class="button">${uiLabelMap.OrderCreateCustRequestFromCart}</a>&nbsp;&nbsp;
              &nbsp;&nbsp;
              <a href="<@ofbizUrl>createQuoteFromCart</@ofbizUrl>" class="button">${uiLabelMap.OrderCreateQuoteFromCart}</a>&nbsp;&nbsp;
              <#else>
               ${uiLabelMap.OrderYouMust} <a href="<@ofbizUrl>checkLogin/showcart</@ofbizUrl>" class="button">${uiLabelMap.CommonBeLogged}</a>
                ${uiLabelMap.EcommerceToOrderCreateCustRequestFromCart}.&nbsp;
              </#if>
          </td>
        </tr>
        <tr>
          <td>
            <input type="checkbox" onclick="javascript:document.cartform.submit()" name="alwaysShowcart" <#if shoppingCart.viewCartOnAdd()>checked="checked"</#if>/>${uiLabelMap.EcommerceAlwaysViewCartAfterAddingAnItem}.
          </td>
        </tr>
      </table>
      -->
      </fieldset>
    </form>
    <table class="cart-table table table-bordered" id="showcart-table2">
    	<#list productPromos as productPromo>
	    	<#assign hasPromo = "N">
	    	<#list shoppingCart.items() as cartLine>
	    	<#if (shoppingCartSize > 0)>
	    		<#if cartLine.getProductId()??>
	                <#if cartLine.getParentProductId()??>
	                  <#assign parentProductId = cartLine.getParentProductId() />
	                <#else>
	                  <#assign parentProductId = cartLine.getProductId() />
	                </#if>
					<#list ProductPromoProduct as ProductPromoProduct>
						<#if (ProductPromoProduct.productId = parentProductId) && (productPromo.productPromoId = ProductPromoProduct.productPromoId)>
							<#assign hasPromo = "Y">
						</#if>
					</#list>
				</#if>
			</#if>
			</#list>
			<#if hasPromo?? && hasPromo = "Y"><tr><td><span class="label label-success">${StringUtil.wrapString(productPromo.promoText!)}</span></td></tr></#if>
		</#list>
    	<tr>
			<td colspan="9" class="actions">
				<div class="col-md-4">
					<div class="coupon">
						<form method="post" action="<@ofbizUrl>addpromocode<#if requestAttributes._CURRENT_VIEW_?has_content>/${requestAttributes._CURRENT_VIEW_}</#if></@ofbizUrl>" name="addpromocodeform">
			                <fieldset>
			                <label>${uiLabelMap.AddPromoCode}:</label><br>
			                <input type="text" placeholder="${uiLabelMap.AddPromoCode}" class="inputBox" size="15" name="productPromoCodeId" value="" />
			                <button type="submit">${uiLabelMap.OrderAddCode}</button>
			                <#assign productPromoCodeIds = (shoppingCart.getProductPromoCodesEntered())! />
			                <#if productPromoCodeIds?has_content>
			                    ${uiLabelMap.ProductPromoCodesEntered}
			                    <ul>
			                    <#list productPromoCodeIds as productPromoCodeId>
			                        <li>${productPromoCodeId}</li>
			                    </#list>
			                    </ul>
			                </#if>
			                </fieldset>
			            </form>
					</div>
				</div>
				<div class="col-md-8">
					<div class="cart-btn">
						<#if ((sessionAttributes.lastViewedProducts)?has_content && sessionAttributes.lastViewedProducts?size > 0)>
          					<#assign continueLink = "/product?product_id=" + sessionAttributes.lastViewedProducts.get(0) />
        				<#else>
          					<#assign continueLink = "/main" />
        				</#if>
        				<a style="color: white;" href="<@ofbizUrl>${continueLink}</@ofbizUrl>">${uiLabelMap.EcommerceContinueShopping}</a>
        				<a href="<@ofbizUrl>quickcheckout</@ofbizUrl>">${uiLabelMap.OrderCheckout}</a>
						<a href="javascript:document.cartform.submit();">${uiLabelMap.EcommerceRecalculateCart}</a>
                		<a href="<@ofbizUrl>emptycart</@ofbizUrl>">${uiLabelMap.EcommerceEmptyCart}</a>
                		<a href="javascript:removeSelected();">${uiLabelMap.EcommerceRemoveSelected}</a>
					</div>
				</div>
			</td>
		</tr>
		<tr><td><span class="label label-success">${uiLabelMap.MyPromoCode}</span></td></tr>
		<tr>
			<td>
				<#if userLogin?has_content && userLogin.userLoginId != "anonymous">
					<#list productPromos as productPromo>
				    	<#assign hasPromo = "N">
				    	<#list shoppingCart.items() as cartLine>
				    	<#if (shoppingCartSize > 0)>
				    		<#if cartLine.getProductId()??>
				                <#if cartLine.getParentProductId()??>
				                  <#assign parentProductId = cartLine.getParentProductId() />
				                <#else>
				                  <#assign parentProductId = cartLine.getProductId() />
				                </#if>
								<#list ProductPromoProduct as ProductPromoProduct>
									<#if (ProductPromoProduct.productId = parentProductId) && (productPromo.productPromoId = ProductPromoProduct.productPromoId)>
										<#assign hasPromo = "Y">
									</#if>
								</#list>
							</#if>
						</#if>
						</#list>
						<#if hasPromo?? && hasPromo = "Y">
							<#list ProductPromoCode as ProductPromoCode>
								<#if ProductPromoCode.productPromoId = productPromo.productPromoId>
									<#assign isYourCode = "N">
									<#list ProductPromoCodeParty as ProductPromoCodeParty>
										<#if ProductPromoCodeParty.productPromoCodeId = ProductPromoCode.productPromoCodeId>
											<#assign isYourCode = "Y">
										</#if>
									</#list>
									<#if isYourCode = "Y">
										<span class="label label-primary">${ProductPromoCode.productPromoCodeId}</span>
									</#if>
								</#if>
							</#list>
						</#if>
					</#list>
				<#else>
					<a href="<@ofbizUrl>checkLogin</@ofbizUrl>">${uiLabelMap.CommonLogin}</a>${uiLabelMap.SeePromoCode}
				</#if>
			</td>
		</tr>
    </table>
    
    
    
  <#else>
    <h2>${uiLabelMap.EcommerceYourShoppingCartEmpty}.</h2>
  </#if>
<#-- Copy link bar to bottom to include a link bar at the bottom too -->
    </div>
</div>





<#if associatedProducts?has_content>
<div>
    <div>
        <h2>${uiLabelMap.EcommerceYouMightAlsoIntrested}:</h2>
    </div>
    <div>
        <#-- random complementary products -->
        <#list associatedProducts as assocProduct>
            <div>
                ${setRequestAttribute("optProduct", assocProduct)}
                ${setRequestAttribute("listIndex", assocProduct_index)}
                ${screens.render("component://ecommerce/widget/CatalogScreens.xml#productsummary")}
            </div>
        </#list>
    </div>
</div>
</#if>

		</div>
	</div>
</div>


