<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->
<#-- variable setup -->
<#assign price = priceMap! />
<#assign productImageList = productImageList! />
<#-- end variable setup -->

<#-- virtual product javascript -->
${virtualJavaScript!}
${virtualVariantJavaScript!}
<script type="text/javascript">
//<![CDATA[
    var detailImageUrl = null;
    function setAddProductId(name) {
        document.addform.add_product_id.value = name;
        if (document.addform.quantity == null) return;
        if (name == '' || name == 'NULL' || isVirtual(name) == true) {
            document.addform.quantity.disabled = true;
            var elem = document.getElementById('product_id_display');
            var txt = document.createTextNode('');
            if(elem.hasChildNodes()) {
                elem.replaceChild(txt, elem.firstChild);
            } else {
                elem.appendChild(txt);
            }
        } else {
            document.addform.quantity.disabled = false;
            var elem = document.getElementById('product_id_display');
            var txt = document.createTextNode(name);
            if(elem.hasChildNodes()) {
                elem.replaceChild(txt, elem.firstChild);
            } else {
                elem.appendChild(txt);
            }
        }
    }
    function setVariantPrice(sku) {
        if (sku == '' || sku == 'NULL' || isVirtual(sku) == true) {
            var elem = document.getElementById('variant_price_display');
            var txt = document.createTextNode('');
            if(elem.hasChildNodes()) {
                elem.replaceChild(txt, elem.firstChild);
            } else {
                elem.appendChild(txt);
            }
        }
        else {
            var elem = document.getElementById('variant_price_display');
            var price = getVariantPrice(sku);
            var txt = document.createTextNode(price);
            if(elem.hasChildNodes()) {
                elem.replaceChild(txt, elem.firstChild);
            } else {
                elem.appendChild(txt);
            }
        }
    }
    function isVirtual(product) {
        var isVirtual = false;
        <#if virtualJavaScript??>
        for (i = 0; i < VIR.length; i++) {
            if (VIR[i] == product) {
                isVirtual = true;
            }
        }
        </#if>
        return isVirtual;
    }
    function addItem() {
       if (document.addform.add_product_id.value == 'NULL') {
           showErrorAlert("${uiLabelMap.CommonErrorMessage2}","${uiLabelMap.CommonPleaseSelectAllRequiredOptions}");
           return;
       } else {
           if (isVirtual(document.addform.add_product_id.value)) {
               document.location = '<@ofbizUrl>product?category_id=${categoryId!}&amp;product_id=</@ofbizUrl>' + document.addform.add_product_id.value;
               return;
           } else {
               document.addform.submit();
           }
       }
    }

    function popupDetail(specificDetailImageUrl) {
        if( specificDetailImageUrl ) {
            detailImageUrl = specificDetailImageUrl;
        }
        else {
            var defaultDetailImage = "${firstDetailImage?default(mainDetailImageUrl?default("_NONE_"))}";
            if (defaultDetailImage == null || defaultDetailImage == "null" || defaultDetailImage == "") {
               defaultDetailImage = "_NONE_";
            }

            if (detailImageUrl == null || detailImageUrl == "null") {
                detailImageUrl = defaultDetailImage;
            }
        }

        if (detailImageUrl == "_NONE_") {
            hack = document.createElement('span');
            hack.innerHTML="${uiLabelMap.CommonNoDetailImageAvailableToDisplay}";
            showErrorAlert("${uiLabelMap.CommonErrorMessage2}","${uiLabelMap.CommonNoDetailImageAvailableToDisplay}");
            return;
        }
        detailImageUrl = detailImageUrl.replace(/\&\#47;/g, "/");
        popUp("<@ofbizUrl>detailImage?detail=" + detailImageUrl + "</@ofbizUrl>", 'detailImage', '600', '600');
    }

    function toggleAmt(toggle) {
        if (toggle == 'Y') {
            changeObjectVisibility("add_amount", "visible");
        }

        if (toggle == 'N') {
            changeObjectVisibility("add_amount", "hidden");
        }
    }

    function findIndex(name) {
        for (i = 0; i < OPT.length; i++) {
            if (OPT[i] == name) {
                return i;
            }
        }
        return -1;
    }

    function getList(name, index, src) {
        currentFeatureIndex = findIndex(name);

        if (currentFeatureIndex == 0) {
            // set the images for the first selection
            if (IMG[index] != null) {
                if (document.images['mainImage'] != null) {
                    document.images['mainImage'].src = IMG[index];
                    detailImageUrl = DET[index];
                }
            }

            // set the drop down index for swatch selection
            document.forms["addform"].elements[name].selectedIndex = (index*1)+1;
        }

        if (currentFeatureIndex < (OPT.length-1)) {
            // eval the next list if there are more
            var selectedValue = document.forms["addform"].elements[name].options[(index*1)+1].value;
            if (index == -1) {
              <#if featureOrderFirst??>
                var Variable1 = eval("list" + "${featureOrderFirst}" + "()");
              </#if>
            } else {
                var Variable1 = eval("list" + OPT[(currentFeatureIndex+1)] + selectedValue + "()");
            }
            // set the product ID to NULL to trigger the alerts
            setAddProductId('NULL');

            // set the variant price to NULL
            setVariantPrice('NULL');
        } else {
            // this is the final selection -- locate the selected index of the last selection
            var indexSelected = document.forms["addform"].elements[name].selectedIndex;

            // using the selected index locate the sku
            var sku = document.forms["addform"].elements[name].options[indexSelected].value;
            
            // display alternative packaging dropdown
            ajaxUpdateArea("product_uom", "<@ofbizUrl>ProductUomDropDownOnly</@ofbizUrl>", "productId=" + sku);

            // set the product ID
            setAddProductId(sku);

            // set the variant price
            setVariantPrice(sku);

            // check for amount box
            toggleAmt(checkAmtReq(sku));
        }
    }

    function validate(x){
        var msg=new Array();
        msg[0]="Please use correct date format [yyyy-mm-dd]";

        var y=x.split("-");
        if(y.length!=3){ showAlert(msg[0]);return false; }
        if((y[2].length>2)||(parseInt(y[2])>31)) { showAlert(msg[0]); return false; }
        if(y[2].length==1){ y[2]="0"+y[2]; }
        if((y[1].length>2)||(parseInt(y[1])>12)){ showAlert(msg[0]); return false; }
        if(y[1].length==1){ y[1]="0"+y[1]; }
        if(y[0].length>4){ showAlert(msg[0]); return false; }
        if(y[0].length<4) {
            if(y[0].length==2) {
                y[0]="20"+y[0];
            } else {
                showAlert(msg[0]);
                return false;
            }
        }
        return (y[0]+"-"+y[1]+"-"+y[2]);
    }

    function showAlert(msg){
        showErrorAlert("${uiLabelMap.CommonErrorMessage2}", msg);
    }

    function additemSubmit(){
        <#if product.productTypeId! == "ASSET_USAGE" || product.productTypeId! == "ASSET_USAGE_OUT_IN">
        newdatevalue = validate(document.addform.reservStart.value);
        if (newdatevalue == false) {
            document.addform.reservStart.focus();
        } else {
            document.addform.reservStart.value = newdatevalue;
            document.addform.submit();
        }
        <#else>
        document.addform.submit();
        </#if>
    }

    function addShoplistSubmit(){
        <#if product.productTypeId! == "ASSET_USAGE" || product.productTypeId! == "ASSET_USAGE_OUT_IN">
        if (document.addToShoppingList.reservStartStr.value == "") {
            document.addToShoppingList.submit();
        } else {
            newdatevalue = validate(document.addToShoppingList.reservStartStr.value);
            if (newdatevalue == false) {
                document.addToShoppingList.reservStartStr.focus();
            } else {
                document.addToShoppingList.reservStartStr.value = newdatevalue;
                // document.addToShoppingList.reservStart.value = ;
                document.addToShoppingList.reservStartStr.value.slice(0,9)+" 00:00:00.000000000";
                document.addToShoppingList.submit();
            }
        }
        <#else>
        document.addToShoppingList.submit();
        </#if>
    }

    <#if product.virtualVariantMethodEnum! == "VV_FEATURETREE" && featureLists?has_content>
        function checkRadioButton() {
            var block1 = document.getElementById("addCart1");
            var block2 = document.getElementById("addCart2");
            <#list featureLists as featureList>
                <#list featureList as feature>
                    <#if feature_index == 0>
                        var myList = document.getElementById("FT${feature.productFeatureTypeId}");
                         if (myList.options[0].selected == true){
                             block1.style.display = "none";
                             block2.style.display = "block";
                             return;
                         }
                        <#break>
                    </#if>
                </#list>
            </#list>
            block1.style.display = "block";
            block2.style.display = "none";
        }
    </#if>
    
    function displayProductVirtualVariantId(variantId) {
        if(variantId){
            document.addform.product_id.value = variantId;
        }else{
            document.addform.product_id.value = '';
            variantId = '';
        }
        
        var elem = document.getElementById('product_id_display');
        var txt = document.createTextNode(variantId);
        if(elem.hasChildNodes()) {
            elem.replaceChild(txt, elem.firstChild);
        } else {
            elem.appendChild(txt);
        }
        
        var priceElem = document.getElementById('variant_price_display');
        var price = getVariantPrice(variantId);
        var priceTxt = null;
        if(price){
            priceTxt = document.createTextNode(price);
        }else{
            priceTxt = document.createTextNode('');
        }
        if(priceElem.hasChildNodes()) {
            priceElem.replaceChild(priceTxt, priceElem.firstChild);
        } else {
            priceElem.appendChild(priceTxt);
        }
    }
    
    function radioChecked(radio){
		var radios = document.getElementsByName("productRating");
		for(var i=0;i<radios.length;i++){
			if(radios[i].checked==true){
				var radioCheck = 1;
			}
			
		}
		if ( radioCheck == 1){
			document.getElementById("button1").removeAttribute("disabled");
		}else{
			document.getElementById("button1").setAttribute("disabled",'true');
		}
	
	}
    
//]]>
$(function(){
    $('a[id^=productTag_]').click(function(){
        var id = $(this).attr('id');
        var ids = id.split('_');
        var productTagStr = ids[1];
        if (productTagStr) {
            $('#productTagStr').val(productTagStr);
            $('#productTagsearchform').submit();
        }
    });
})


 </script>

<#macro showUnavailableVarients>
  <#if unavailableVariants??>
    <ul>
      <#list unavailableVariants as prod>
        <#assign features = prod.getRelated("ProductFeatureAppl", null, null, false)/>
        <li>
          <#list features as feature>
            <em>${feature.getRelatedOne("ProductFeature", false).description}</em><#if feature_has_next>, </#if>
          </#list>
          <span>${uiLabelMap.ProductItemOutOfStock}</span>
        </li>
      </#list>
    </ul>
  </#if>
</#macro>

<div class="page_header space40">
	<div class="page_header_parallax" style="background-image: url(/images/defaultCatgoryBg.jpg) !important;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h3 class="title">${productContentWrapper.get("PRODUCT_NAME", "html")!}</h3>
    				<h6 class="sub-title" style="color: whitesmoke;">${productContentWrapper.get("DESCRIPTION", "html")!}</h6>
				</div>
			</div>
		</div>
	</div>
	<div class="bcrumb-wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="bcrumbs">
						<li><a href="/market"><i class="fa fa-home"></i>${uiLabelMap.CommonMain}</a></li>
						<li>${productContentWrapper.get("PRODUCT_NAME", "html")!}</li>
					</ul>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12" id="p-single">
			<div class="row">
				<div class="col-md-5">
					<div class="gal-wrap">
						<div id="gal-slider" class="flexslider">
							<ul class="slides">
								<!--浜у搧鍥剧墖-->
						        <#assign productLargeImageUrl = productContentWrapper.get("LARGE_IMAGE_URL", "url")! />
						        <#if firstLargeImage?has_content>
						        	<#assign productLargeImageUrl = firstLargeImage />
						        </#if>
						        <!--杩藉姞鍥剧墖-->
						        <#assign productAdditionalImage1 = productContentWrapper.get("ADDITIONAL_IMAGE_1", "url")! />
							  	<#assign productAdditionalImage2 = productContentWrapper.get("ADDITIONAL_IMAGE_2", "url")! />
							  	<#assign productAdditionalImage3 = productContentWrapper.get("ADDITIONAL_IMAGE_3", "url")! />
							  	<#assign productAdditionalImage4 = productContentWrapper.get("ADDITIONAL_IMAGE_4", "url")! />
						        <#if productLargeImageUrl?string?has_content>
					            	<li>
						            	<img src="<@ofbizContentUrl>${productLargeImageUrl!}</@ofbizContentUrl>" name="mainImage" vspace="5" hspace="5" class="img-responsive" alt=""/>
					            	</li>
					            </#if>
					            <#if productAdditionalImage1?string?has_content>
					            	<li>
						            	<img src="<@ofbizContentUrl>${productAdditionalImage1!}</@ofbizContentUrl>" name="mainImage" vspace="5" hspace="5" class="img-responsive" alt=""/>
					            	</li>
					            </#if>
				            	<#if productAdditionalImage2?string?has_content>
					            	<li>
						            	<img src="<@ofbizContentUrl>${productAdditionalImage2!}</@ofbizContentUrl>" name="mainImage" vspace="5" hspace="5" class="img-responsive" alt=""/>
					            	</li>
					            </#if>
					            <#if productAdditionalImage3?string?has_content>
					            	<li>
						            	<img src="<@ofbizContentUrl>${productAdditionalImage3!}</@ofbizContentUrl>" name="mainImage" vspace="5" hspace="5" class="img-responsive" alt=""/>
					            	</li>
					            </#if>
							</ul>
						</div>
						
						<!--涓嬮潰鏄剧ず鐨勫皬鍥�-->
						<ul class="gal-nav">
							<li>
								<div>
								    <img src="<@ofbizContentUrl>${productLargeImageUrl!}</@ofbizContentUrl>" name="mainImage" vspace="5" hspace="5" class="img-responsive" alt=""/>
								</div>
							</li>
							<li>
								<div>
								    <img id="detailImage" src="<@ofbizContentUrl>${productAdditionalImage1!}</@ofbizContentUrl>" name="mainImage" vspace="5" hspace="5" class="img-responsive" alt=""/>
								</div>
							</li>
							<li>
								<div>
								    <img id="detailImage" src="<@ofbizContentUrl>${productAdditionalImage2!}</@ofbizContentUrl>" name="mainImage" vspace="5" hspace="5" class="img-responsive" alt=""/>
								</div>
							</li>
							<li>
								<div>
								    <img id="detailImage" src="<@ofbizContentUrl>${productAdditionalImage3!}</@ofbizContentUrl>" name="mainImage" vspace="5" hspace="5" class="img-responsive" alt=""/>
								</div>
							</li>
						</ul>
						
					</div>
				</div>
				<div class="col-md-7 product-single">
				
					<!--浜у搧鍚嶇О-->
					<h2 class="uppercase no-margin">${productContentWrapper.get("PRODUCT_NAME", "html")!}</h2>
					<div class="space10"></div>
					
					<!--鏄剧ず浜у搧浠锋牸-->
					<div class="p-price">
						<#if price.isSale?? && price.isSale>
							<span class="salePrice">${uiLabelMap.OrderOnSale}!</span>
							<#assign priceStyle = "salePrice" />
						  <#else>
							<#assign priceStyle = "regularPrice" />
						</#if>
						<#if "Y" = product.isVirtual!>
							${uiLabelMap.CommonFrom}
						</#if>
						<span class="label label-success">${uiLabelMap.CrowdPrice}:&nbsp;<@ofbizCurrency amount=price.price isoCode=price.currencyUsed /></span>
						<span class="label label-primary" style="color: white;margin-top: 5px;">${uiLabelMap.TargetAmount}:<@ofbizCurrency amount=price.listPrice isoCode=price.currencyUsed /></span>
						<#if product.productTypeId! == "ASSET_USAGE" || product.productTypeId! == "ASSET_USAGE_OUT_IN">
							<#if product.reserv2ndPPPerc?? && product.reserv2ndPPPerc != 0><br/>
								<span class="${priceStyle}">
									${uiLabelMap.ProductReserv2ndPPPerc}
									<#if !product.reservNthPPPerc?? || product.reservNthPPPerc == 0>
									    ${uiLabelMap.CommonUntil} ${product.reservMaxPersons!1}
									</#if>
									<@ofbizCurrency amount=product.reserv2ndPPPerc*price.price/100 isoCode=price.currencyUsed />
								</span>
							</#if>
							<#if product.reservNthPPPerc?? &&product.reservNthPPPerc != 0><br/>
							    <span class="${priceStyle}">
									${uiLabelMap.ProductReservNthPPPerc}
									<#if !product.reserv2ndPPPerc?? || product.reserv2ndPPPerc == 0>
								  		${uiLabelMap.ProductReservSecond}
									<#else>
								  		${uiLabelMap.ProductReservThird}
									</#if>
										${uiLabelMap.CommonUntil} ${product.reservMaxPersons!1}, ${uiLabelMap.ProductEach}:
								<@ofbizCurrency amount=product.reservNthPPPerc*price.price/100 isoCode=price.currencyUsed />
							    </span>
							</#if>
							<#if (!product.reserv2ndPPPerc?? || product.reserv2ndPPPerc == 0) && (!product.reservNthPPPerc?? ||
								product.reservNthPPPerc == 0)>
							  <br/>${uiLabelMap.ProductMaximum} ${product.reservMaxPersons!1} ${uiLabelMap.ProductPersons}.
							</#if>
						</#if>
					</div>
					
					<!--浜у搧鎻忚堪-->
					<p>${productContentWrapper.get("DESCRIPTION", "html")!}</p>
					<br/>
					 <!--鏀惰棌-->
				    <div>
				    	<#if sessionAttributes.userLogin?has_content && sessionAttributes.userLogin.userLoginId != "anonymous">
				            <#if ShoppingListId?has_content>
					            <#list ShoppingListItem as ShoppingListItem>
					            	<#if ShoppingListItem.shoppingListId = ShoppingListId>
					            		<#assign shoppingListItemSeqId = ShoppingListItem.shoppingListItemSeqId>
					            	</#if>
					            </#list>
					            <#if shoppingListItemSeqId??>
					            	<form method="post" action="<@ofbizUrl>removeFromShoppingListProduct</@ofbizUrl>" name='removeform_shoppingListItem'>
						              <input type="hidden" name="shoppingListId" value="${ShoppingListId}" />
						              <input type="hidden" name="shoppingListItemSeqId" value="${shoppingListItemSeqId}" />
						            </form>
				            		<i class="fa fa-heart" style="color: red;"></i>&nbsp;&nbsp;<a href="javascript:document.removeform_shoppingListItem.submit();">${uiLabelMap.haveCollected}</a>
				            	<#else>
						        <form name="addToShoppingList" method="post" action="<@ofbizUrl>addItemToShoppingList</@ofbizUrl>">
						          	<fieldset>
						            	<input type="hidden" name="productId" value="${product.productId}"/>
						            	<input type="hidden" name="product_id" value="${product.productId}"/>
						            	<input type="hidden" name="productStoreId" value="${productStoreId}"/>
						            	<input type="hidden" name="reservStart" value=""/>
						            	<input type="hidden" name="shoppingListId" value="${ShoppingListId}"/>
						            	<#if product.productTypeId! == "ASSET_USAGE">
							              <@htmlTemplate.renderDateTimeField name="reservStartStr" event="" action="" value="${startDate}"
							                  className="" alert="" title="Format: yyyy-MM-dd HH:mm:ss.SSS" size="15" maxlength="30"
							                  id="reservStartStr" dateType="date" shortDateInput=false timeDropdownParamName=""
							                  defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1=""
							                  hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected=""
							                  compositeType="" formName=""/>
							              <input type="hidden" size="4" name="reservLength"/>&nbsp;<br/>
							              <input type="hidden" size="4" name="reservPersons" value="1"/>
							              <input type="hidden" size="5" name="quantity" value="1"/>
							            <#elseif product.productTypeId! == "ASSET_USAGE_OUT_IN">
							              <@htmlTemplate.renderDateTimeField name="reservStartStr" event="" action="" value="${startDate}"
							                  className="" alert="" title="Format: yyyy-MM-dd HH:mm:ss.SSS" size="15" maxlength="30"
							                  id="reservStartStr" dateType="date" shortDateInput=false timeDropdownParamName=""
							                  defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1=""
							                  hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected=""
							                  compositeType="" formName=""/>
							              <input type="hidden" size="4" name="reservLength"/>
							              <input type="hidden" size="4" name="reservPersons" value="1"/><br/>
							              <input type="hidden" size="5" name="quantity" value="1"/>
							            <#else>
							              <input type="hidden" size="5" name="quantity" value="1"/>
							              <input type="hidden" name="reservStartStr" value=""/>
							            </#if>
						            	<a href="javascript:addShoplistSubmit();" class="buttontext"><i class="fa fa-heart-o"></i>&nbsp;&nbsp;${uiLabelMap.collecte}</a>
						          	</fieldset>
						        </form>
						        </#if>
					        <#else>
					        	<form name="updateList" method="post" action="<@ofbizUrl>createEmptyShoppingList</@ofbizUrl>">
						          <input type="hidden" name="partyId" value="${userLogin.partyId}">
						          <input type="hidden" name="shoppingListTypeId" value="COLLECTE">
					              <input type="hidden" name="listName" value="COLLECTE">
					              <input type="hidden" name="isActive" value="Y">
			              			<a href="javascript:document.updateList.submit();" class="buttontext">${uiLabelMap.CreateList}</a>
						        </form>
					        </#if>
				      	<#else>
					        ${uiLabelMap.OrderYouMust}
					        <a href="<@ofbizUrl>checkLogin</@ofbizUrl>" class="buttontext">${uiLabelMap.CommonBeLogged}</a>
					        ${uiLabelMap.AddItemsToShoppingList}.
				      	</#if>
				    </div>

					<br/>
					<!--娣诲姞鍒拌喘鐗╄溅-->
					<div class="shop-btn-wrap">
						<div id="addItemForm">
						  <form method="post" action="<@ofbizUrl>additem</@ofbizUrl>" name="addform" style="margin: 0;">
							<fieldset>
							<#assign inStock = true />
							
							<#if product.isVirtual!?upper_case == "Y">
							  <#if product.virtualVariantMethodEnum! == "VV_FEATURETREE" && featureLists?has_content>
								<#list featureLists as featureList>
								  <#list featureList as feature>
									<#if feature_index == 0>
									  <div>
										${feature.description}:
										<select id="FT${feature.productFeatureTypeId}" name="FT${feature.productFeatureTypeId}"
											onchange="javascript:checkRadioButton();">
										  <option value="select" selected="selected">
											${uiLabelMap.EcommerceSelectOption}
										  </option>
									<#else>
									  <option value="${feature.productFeatureId}">
										${feature.description}
										<#if feature.price??>
										  (+ <@ofbizCurrency amount=feature.price?string isoCode=feature.currencyUomId />)
										</#if>
									  </option>
									</#if>
								  </#list>
								</select>
								</div>
								</#list>
								<input type="hidden" name="add_product_id" value="${product.productId}"/>
								<div id="addCart1" style="display:none;">
								<span style="white-space: nowrap;"><strong>${uiLabelMap.CommonQuantity}:</strong></span>&nbsp;
								  <a href="javascript:javascript:addItem();" class="button btn-small"><span
									  style="white-space: nowrap;">${uiLabelMap.OrderAddToCart}</span></a>
								  &nbsp;
								</div>
								<div id="addCart2" style="display:block;">
								  <span style="white-space: nowrap;"><strong>${uiLabelMap.CommonQuantity}:</strong></span>&nbsp;
								  <input type="text" size="5" value="1" disabled="disabled"/>
								  <a href="javascript:showErrorAlert("${uiLabelMap.CommonErrorMessage2}","${uiLabelMap.CommonPleaseSelectAllFeaturesFirst}");"
								  class="buttontext"><span style="white-space: nowrap;">${uiLabelMap.OrderAddToCart}</span></a>
								  &nbsp;
								</div>
							  </#if>
							  <#if !product.virtualVariantMethodEnum?? || product.virtualVariantMethodEnum == "VV_VARIANTTREE">
								<#if variantTree?? && (variantTree.size() &gt; 0)>
								  <#list featureSet as currentType>
									<div>
									  <select name="FT${currentType}" onchange="javascript:getList(this.name, (this.selectedIndex-1), 1);">
										<option>${featureTypes.get(currentType)}</option>
									  </select>
									</div>
								  </#list>
								  <span id="product_uom"></span>
								  <input type="hidden" name="product_id" value="${product.productId}"/>
								  <input type="hidden" name="add_product_id" value="NULL"/>
								  <div>
									<strong><span id="product_id_display"> </span></strong>
									<strong>
									  <div id="variant_price_display"></div>
									</strong>
								  </div>
								<#else>
								  <input type="hidden" name="add_product_id" value="NULL"/>
								  <#assign inStock = false />
								</#if>
							  </#if>
							<#else>
							  <input type="hidden" name="add_product_id" value="${product.productId}"/>
							  <#if mainProducts?has_content>
								<input type="hidden" name="product_id" value=""/>
								<select name="productVariantId" onchange="javascript:displayProductVirtualVariantId(this.value);">
								  <option value="">Select Unit Of Measure</option>
								  <#list mainProducts as mainProduct>
									<option value="${mainProduct.productId}">${mainProduct.uomDesc} : ${mainProduct.piecesIncluded}</option>
								  </#list>
								</select><br/>
								<div>
								  <strong><span id="product_id_display"> </span></strong>
								  <strong>
									<div id="variant_price_display"></div>
								  </strong>
								</div>
							  </#if>
							  <#if (availableInventory??) && (availableInventory <= 0) && product.requireAmount?default("N") == "N">
								<#assign inStock = false />
							  </#if>
							</#if>
							<#-- check to see if introductionDate hasnt passed yet -->
							<#if product.introductionDate?? && nowTimestamp.before(product.introductionDate)>
							  <p>&nbsp;</p>
							  <div style="color: red;">${uiLabelMap.ProductProductNotYetMadeAvailable}.</div>
							<#-- check to see if salesDiscontinuationDate has passed -->
							<#elseif product.salesDiscontinuationDate?? && nowTimestamp.after(product.salesDiscontinuationDate)>
							  <div style="color: red;">${uiLabelMap.ProductProductNoLongerAvailable}.</div>
							<#-- check to see if the product requires inventory check and has inventory -->
							<#elseif product.virtualVariantMethodEnum! != "VV_FEATURETREE">
							  <#if inStock>
								<#if product.requireAmount?default("N") == "Y">
								  <#assign hiddenStyle = "visible" />
								<#else>
								  <#assign hiddenStyle = "hidden"/>
								</#if>
								<div id="add_amount" class="${hiddenStyle}">
								  <span style="white-space: nowrap;"><strong>${uiLabelMap.CommonAmount}:</strong></span>&nbsp;
								  <input type="text" size="5" name="add_amount" value=""/>
								</div>
								<#if product.productTypeId! == "ASSET_USAGE" || product.productTypeId! == "ASSET_USAGE_OUT_IN">
								  <div>
									<label>
									  Start Date(yyyy-mm-dd)
									</label>
									<@htmlTemplate.renderDateTimeField event="" action="" name="reservStart" className="" alert=""
										title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="${startDate}" size="25" maxlength="30"
										id="reservStart1" dateType="date" shortDateInput=true timeDropdownParamName=""
										defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString=""
										hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected=""
										pmSelected="" compositeType="" formName=""/>
								  </div>
								  <div>
								  <#--td nowrap="nowrap" align="right">Number<br />of days</td>
									  <td><input type="textt" size="4" name="reservLength"/></td></tr>
									  <tr><td>&nbsp;</td><td align="right" nowrap="nowrap">&nbsp;</td-->
									Number of days<input type="text" size="4" name="reservLength" value=""/>
									Number of persons<input type="text" size="4" name="reservPersons" value="2"/>
									Number of rooms<input type="text" size="5" name="quantity" value="1"/>
								  </div>
								  <a href="javascript:addItem()" class="button btn-small"><span
									  style="white-space: nowrap;">${uiLabelMap.OrderAddToCart}</span></a>
								<#else>
								  <a href="javascript:addItem()" id="addToCart" name="addToCart"
									class="button btn-small">${uiLabelMap.OrderAddToCart}</a>
								  <@showUnavailableVarients/>
								</#if>
							  <#else>
								<#if productStore??>
								  <#if productStore.requireInventory?? && productStore.requireInventory == "N">
									<a href="javascript:addItem()" id="addToCart" name="addToCart"
									  class="button btn-small">${uiLabelMap.OrderAddToCart}</a>
									<@showUnavailableVarients/>
								  <#else>
									<a href="javascript:void(0);" disabled="disabled" class="class="button btn-small"">${uiLabelMap.OrderAddToCart}</a><br/>
									<span>${uiLabelMap.ProductItemOutOfStock}<#if product.inventoryMessage??>&mdash; ${product.inventoryMessage}</#if></span>
								  </#if>
								</#if>
							  </#if>
							</#if>
							<#if variantPriceList??>
							  <#list variantPriceList as vpricing>
								<#assign variantName = vpricing.get("variantName")!>
								<#assign secondVariantName = vpricing.get("secondVariantName")!>
								<#assign minimumQuantity = vpricing.get("minimumQuantity")>
								<#if minimumQuantity &gt; 0>
								  <div>minimum order quantity for ${secondVariantName!} ${variantName!} is ${minimumQuantity!}</div>
								</#if>
							  </#list>
							<#elseif minimumQuantity?? && minimumQuantity?has_content && minimumQuantity &gt; 0>
							  <div>minimum order quantity for ${productContentWrapper.get("PRODUCT_NAME", "html")!}
								is ${minimumQuantity!}</div>
							</#if>
							</fieldset>
						  </form>
						</div>
					</div>
				</div>
			</div>
			<#if price.listPrice??>
				<#assign sumprice = 0 />
				<#if OrderItemAndProduct??>
					<#list OrderItemAndProduct as order>
						<#assign sumprice = sumprice + (order.unitPrice)*(order.quantity) />
					</#list>	
				</#if>
				<#assign sumpercent = sumprice/price.listPrice>
				<#if sumpercent gt 1><#assign sumpercent = 1></#if>
				<#assign sumdata = sumpercent*100>
				<div class="progress">
					<div style="width:${sumpercent?string("0.00%")};" class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sumpercent?string("0.00%")} ${uiLabelMap.Raisedsofar}<span>${sumpercent?string("0.00%")}</span>
					</div>
				</div>
			</#if>
			<div class="clearfix space40"></div>
			<div class="tab-style3">
				<!-- Nav Tabs -->
				<div class="align-center mb-40 mb-xs-30">
					<ul class="nav nav-tabs tpl-minimal-tabs animate">
						<li class="active col-md-3">
							<a aria-expanded="true" href="#ProductDetail" data-toggle="tab">${uiLabelMap.ProductDetail}</a>
						</li>
						<li class="col-md-3">
							<a aria-expanded="false" href="#ProductReview" data-toggle="tab">${uiLabelMap.ProductReview}</a>
						</li>
						<li class="col-md-3">
							<a aria-expanded="false" href="#ProductDiscuss" data-toggle="tab">${uiLabelMap.ProductDiscuss}</a>
						</li>
						<li class="col-md-3">
							<a aria-expanded="false" href="#FileDownload" data-toggle="tab">${uiLabelMap.FileDownload}</a>
						</li>
					</ul>
				</div>
				<!-- End Nav Tabs -->
				<!-- Tab panes -->
				<div style="height: auto;" class="tab-content tpl-minimal-tabs-cont align-center section-text">
					<!--浜у搧璇︽儏鍧�-->
					<div style="" class="tab-pane fade active in" id="ProductDetail">
						<div>
						    <img id="detailImage" src="${product.detailImageUrl!}" name="mainImage" vspace="5" hspace="5" class="img-responsive" alt=""/>
						</div>
						<p>${productContentWrapper.get("LONG_DESCRIPTION", "html")!}</p>
						<p>${productContentWrapper.get("WARNINGS", "html")!}</p>
					</div>
					<!--浜у搧璇勮鍧�-->
					<div style="" class="tab-pane fade" id="ProductReview">
						<!--鏂板姞鐨勪骇鍝佽瘎璁�-->
					    <div id="productReviewCommunication">
					    	<div>
					    		<#assign countNum = 0 />
					    		<#list ProductReviewList as ProductReviewList>
					    			<#assign countNum = countNum + 1 />
					    		</#list>
					    	</div>
					    	<div class="padding70">
								<h4 class="uppercase space30">${uiLabelMap.ProductReview}&nbsp;&nbsp;<span>(${countNum})</span></h4>
								<ul class="comment-list">
									<#list ProductReviewList as ProductReviewList>
										<li>
											<#assign productReviewByUserLoginId = ProductReviewList.userLoginId/>
											<#list UserLoginList as UserLoginList>
												<#if (UserLoginList.userLoginId == productReviewByUserLoginId)>
													<#assign pId = UserLoginList.partyId/>
													<#assign personLogoUrl = "/market/images/headdefault.jpg"!/>
													<#list PartyContent?sort_by('fromDate') as PartyContent>
														<#if PartyContent.partyId == pId>
															<#assign personContentId = PartyContent.contentId!/>
															<#assign personLogoUrl = "/content/control/stream?contentId=${personContentId}"!/>
														</#if>
													</#list>
												</#if>
											</#list>
											<a class="pull-left" href="#"><img class="comment-avatar" src="${personLogoUrl}" alt="" height="50" width="50"></a>
											<div class="comment-meta">
												<a href="#">${ProductReviewList.userLoginId}</a>
												<span>
													<em>${ProductReviewList.postedDateTime?string("yyyy-MM-dd HH:mm:ss")}</em>
													<#switch ProductReviewList.productRating>
														<#case 5>
															<i class="fa fa-heart" style="color: red;"></i>
															<i class="fa fa-heart" style="color: red;"></i>
															<i class="fa fa-heart" style="color: red;"></i>
															<i class="fa fa-heart" style="color: red;"></i>
															<i class="fa fa-heart" style="color: red;"></i>
															<#break>
														<#case 4>
															<i class="fa fa-heart" style="color: red;"></i>
															<i class="fa fa-heart" style="color: red;"></i>
															<i class="fa fa-heart" style="color: red;"></i>
															<i class="fa fa-heart" style="color: red;"></i>
															<#break>
														<#case 3>
															<i class="fa fa-heart" style="color: red;"></i>
															<i class="fa fa-heart" style="color: red;"></i>
															<i class="fa fa-heart" style="color: red;"></i>
															<#break>
														<#case 2>
															<i class="fa fa-heart" style="color: red;"></i>
															<i class="fa fa-heart" style="color: red;"></i>
															<#break>
														<#case 1>
															<i class="fa fa-heart" style="color: red;"></i>
															<#break>
														<#default>
															<i class="fa fa-heart" style="color: red;"></i>
															<i class="fa fa-heart" style="color: red;"></i>
															<i class="fa fa-heart" style="color: red;"></i>
															<i class="fa fa-heart" style="color: red;"></i>
															<i class="fa fa-heart" style="color: red;"></i>
													</#switch>
												</span>
											</div>
											<p>
												${ProductReviewList.productReview}
											</p>
										</li>
									</#list>
								</ul>
							</div>
					    	<#if userLogin?has_content && userLogin.userLoginId != "anonymous">
								<form id="reviewProduct" method="post" action="<@ofbizUrl>createProductReview</@ofbizUrl>" class="form">
									<fieldset class="inline">
									<input type="hidden" name="productStoreId" value="${productStoreId}" />
									<input type="hidden" name="productId" value="${product.productId}" />
									<input type="hidden" name="product_id" value="${product.productId}" />
									<#if requestParameters.category_id??>
									<input type="hidden" name="category_id" value="${requestParameters.category_id}" />
									<#else>
									<input type="hidden" name="category_id" value="${product.categoryId!}" />
									</#if>
									<!--浠ヤ笅鏄垽鏂拱杩囨墠鑳借瘎浠�-->
									<#if userLogin?has_content>
								    	<#assign orderNum=0/>
								    	<#list OrderItem as OrderItem>
								    		<#if OrderItem.statusId=="COM_COMPLETE">
								    			<#assign orderNum+=1/>
								    		</#if>
								    	</#list>
								    	<#assign reviewNum=0/>
								    	<#list ProductReviewList as ProductReviewList>
								    		<#if ProductReviewList.userLoginId==userLogin.userLoginId>
								    			<#assign reviewNum+=1/>
								    		</#if>
								    	</#list>
								    	<#if (reviewNum < orderNum) >
								    		<!--璇勭骇-->
											<div class="space20">
												<span><label for="one">${uiLabelMap.EcommerceRating}:</label></span>
												<span>
													<label for="one">1</label>
													<input type="radio" id="one" name="productRating" value="1.0"  onclick="radioChecked(this)"/>
												</span>
												<span>
													<label for="two">2</label>
													<input type="radio" id="two" name="productRating" value="2.0"  onclick="radioChecked(this)"/>
												</span>
												<span>
													<label for="three">3</label>
													<input type="radio" id="three" name="productRating" value="3.0"  onclick="radioChecked(this)"/>
												</span>
												<span>
													<label for="four">4</label>
													<input type="radio" id="four" name="productRating" value="4.0"  onclick="radioChecked(this)"/>
												</span>
												<span>
													<label for="five">5</label>
													<input type="radio" id="five" name="productRating" value="5.0"  onclick="radioChecked(this)"/>
												</span>
											</div>
											<!--璇勮妗�-->
											<div class="space20">
												<textarea name="productReview" id="text" class="textAreaBox input-md form-control" rows="6" placeholder="${uiLabelMap.CommonReview}" maxlength="400"></textarea>
											</div>
											<button type="submit" class="button btn-xs" id="button1" disabled="disabled"> 
												[${uiLabelMap.CommonSave}]
											</button>
								    	<#else>
								    	</#if>
							    	</#if>
									<!--浠ヤ笂鏄垽鏂拱杩囨墠鑳借瘎浠�-->
									</fieldset>
								</form>
							<#else>
								<h5 class="uppercase space10">
									<a>
										( ${uiLabelMap.OrderYouMust}${uiLabelMap.CommonLogin}${uiLabelMap.ProductReviewThisProduct} )
									</a>
								</h5>
							</#if>
					   </div>	
					<!--鏂板姞鐨勪骇鍝佽瘎璁� end-->
					</div>
					<!--浜у搧璁ㄨ鍧�-->
					<div style="" class="tab-pane fade" id="ProductDiscuss">
						<!--閬嶅巻姝や骇鍝佺殑鎵�鏈夎璁�-->
						<h3 class="uppercase text-center space50">${uiLabelMap.CommArea}</h3>
						<ul class="comment-list">
							<#assign colcommunicationEvents=0>
							<#list disscussCommunicationEvents as communicationEvents>
								<#if !communicationEvents.parentCommEventId?has_content>
									<#list commPersonList as commPersonList>
										<#if commPersonList.partyId = communicationEvents.partyIdFrom>
											<#assign nickName = commPersonList.nickname!/>
											<#assign pUL = "/market/images/headdefault.jpg">
											<#list PartyContent?sort_by('fromDate') as PartyContent>
												<#if PartyContent.partyId = commPersonList.partyId>
													<#assign personContentId = PartyContent.contentId!/>
													<#if personContentId?has_content>
														<#assign pUL = "/content/control/stream?contentId=${personContentId}"!/>
													</#if>
												</#if>
											</#list>
										</#if>
										<#if !nickName?has_content>
											<#assign nickName = communicationEvents.partyIdFrom!/>
										</#if>
									</#list>
									<div class="commparent">
									<li>
										<a class="pull-left" href="#"><img class="comment-avatar" src="${pUL}" alt="" width="50" height="50"></a>
										<div class="comment-meta">
											<span class="replycomm">${nickName}</span>
											<span><em>${communicationEvents.entryDate.toString().substring(0,19)!}</em></span>
											<a data-toggle="modal" data-target=".parent_${colcommunicationEvents}"  href="#" class="replycomm">&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-comment"></i>&nbsp;${uiLabelMap.PartyReply}</a>						
											<!-- 鐐瑰嚮鍥炲寮瑰嚭鐨勫皬妗� -->
											<div class="modal fade parent_${colcommunicationEvents}">
											  <div class="modal-dialog" style="top: 30%;">
											    <div class="modal-content">
											    <form method="post" action="<@ofbizUrl secure="true">createDisscussProductCommunicationEvent?detailId=comm</@ofbizUrl>" name="CreateTopicEvent_${communicationEvents.communicationEventId}" class="border" onsubmit="return checkIP1();">
											      	<div class="modal-header">
											        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">${uiLabelMap.Close}</span></button>
											        	<h4 class="modal-title">${uiLabelMap.PartyReply}${nickName}</h4>
											      	</div>
											      	<div class="modal-body">
											        <#if userPartyId??>
													<!--鍥炲鎻愪氦鐨勮〃鍗�-->
														<input name="action" type="hidden"/>
														  	<input name="my" type="hidden"/>
														  	<input name="messageId" type="hidden"/>
														  	<input name="productId" value="${product.productId}" type="hidden"/>
														  	<input name="parentCommEventId" value="${communicationEvents.communicationEventId}" type="hidden"/>
														  	<input name="communicationEventTypeId" value="PRODUCT_DISSCUSS" type="hidden"/>
														  	<input name="statusId" value="COM_COMPLETE" type="hidden"/>
														  	<input name="partyIdFrom" value="${userPartyId}" type="hidden"/>
														  	<input name="partyIdTo" value="${communicationEvents.partyIdFrom}" type="hidden"/>
														  	<input name="contactMechTypeId" type="hidden"/>
														  	<input name="contactMechIdFrom" autocomplete="off" type="hidden"/>
														  	<input name="contactMechIdTo" autocomplete="off" type="hidden"/>
														  	<input name="roleTypeIdFrom" value="_NA_" type="hidden"/>
														  	<input name="roleTypeIdTo" value="_NA_" type="hidden"/>
														  	<input name="contactListId" type="hidden"/>
														  	<input name="datetimeStarted" type="hidden"/>
														  	<input name="datetimeEnded" type="hidden"/>
														  	<input name="reasonEnumId" type="hidden"/>
														  	<input name="contentMimeTypeId" value="text/plain" type="hidden"/>
														  	<input name="note" type="hidden" value="${communicationEvents.communicationEventId}"/>
														  	<input name="subject" type="hidden" value="${uiLabelMap.Project}[${productContentWrapper.get("PRODUCT_NAME", "html")!}]${uiLabelMap.OfDissuiss}"/>
														<!-- Field 2 -->
														<div class="input-email form-group">
															<textarea id="url1" name="content" class="textarea-message form-control" placeholder="${uiLabelMap.PartyReply}${nickName}" rows="4" ></textarea>
														</div>
													<#else>
													  	<h5 class="uppercase text-center space30">${uiLabelMap.EcommerceLoggedToPost}</h5>
													</#if>
											      	</div>
											      	<div class="modal-footer">
											        	<button type="button" class="btn btn-default" data-dismiss="modal">${uiLabelMap.Close}</button>
											        	<button type="submit" class="btn btn-primary">${uiLabelMap.EcommerceBlogPostedOn}<i class="uni-paper-plane"></i></button>
											      	</div>
											      </form>
											    </div>
											  </div>
											</div>
											<p>${communicationEvents.content!}</p>
										</div>
									</li>
									<!-- Comments Replay 鎵�鏈夊璇勮鐨勫洖澶�-->
									<#assign colChildevents=0>
									<#list childEvents as childEvents>
										<#if childEvents.parentCommEventId?has_content&&childEvents.parentCommEventId = communicationEvents.communicationEventId>
											<#list commPersonList as commPersonList>
												<#if commPersonList.partyId = childEvents.partyIdFrom>
													<#assign nickNamechildFrom = commPersonList.nickname!/>
												</#if>
												<#if !nickName?has_content>
													<#assign nickNamechildFrom = childEvents.partyIdFrom!/>
												</#if>
												<#if commPersonList.partyId = childEvents.partyIdTo>
													<#assign nickNamechildTo= commPersonList.nickname!/>
												</#if>
												<#if !nickNamechildTo?has_content>
													<#assign nickNamechildTo = childEvents.partyIdTo!/>
												</#if>
											</#list>
											<li class="childcomm">
												<div class="comment-meta">
													<span class="replycomm">${nickNamechildFrom!}</span>&nbsp;&nbsp;${uiLabelMap.PartyReply}&nbsp;<span class="replycomm">${nickNamechildTo!}</span>
													<span><em>${childEvents.entryDate.toString().substring(0,19)!}</em></span>
													<a data-toggle="modal" data-target=".${colChildevents}"  href="#" class="replycomm">&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-comment"></i>&nbsp;${uiLabelMap.PartyReply}${nickNamechildFrom!}</a>								
													<div class="modal fade ${colChildevents}">
													  	<div class="modal-dialog"  style="top: 30%;">
														    <div class="modal-content">
														    <form method="post" action="<@ofbizUrl secure="true">createDisscussProductCommunicationEvent?detailId=comm</@ofbizUrl>" name="CreateTopicEvent_${communicationEvents.communicationEventId}" class="border" onsubmit="return checkIP1();">
														      	<div class="modal-header">
														        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">${uiLabelMap.Close}</span></button>
														        	<h4 class="modal-title">${uiLabelMap.PartyReply}${nickNamechildFrom}</h4>
														      	</div>
														      	<div class="modal-body">
														        <#if userPartyId??>
																<!--鍥炲鎻愪氦鐨勮〃鍗�-->
																<input name="action" type="hidden"/>
																  	<input name="my" type="hidden"/>
																  	<input name="messageId" type="hidden"/>
																  	<input name="productId" value="${product.productId}" type="hidden"/>
																  	<input name="parentCommEventId" value="${communicationEvents.communicationEventId}" type="hidden"/>
																  	<input name="communicationEventTypeId" value="PRODUCT_DISSCUSS" type="hidden"/>
																  	<input name="statusId" value="COM_COMPLETE" type="hidden"/>
																  	<input name="partyIdFrom" value="${userPartyId}" type="hidden"/>
																  	<input name="partyIdTo" value="${childEvents.partyIdFrom}" type="hidden"/>
																  	<input name="contactMechTypeId" type="hidden"/>
																  	<input name="contactMechIdFrom" autocomplete="off" type="hidden"/>
																  	<input name="contactMechIdTo" autocomplete="off" type="hidden"/>
																  	<input name="roleTypeIdFrom" value="_NA_" type="hidden"/>
																  	<input name="roleTypeIdTo" value="_NA_" type="hidden"/>
																  	<input name="contactListId" type="hidden"/>
																  	<input name="datetimeStarted" type="hidden"/>
																  	<input name="datetimeEnded" type="hidden"/>
																  	<input name="reasonEnumId" type="hidden"/>
																  	<input name="contentMimeTypeId" value="text/plain" type="hidden"/>
																  	<input name="note" type="hidden" value="${childEvents.communicationEventId}"/>
																  	<input name="subject" type="hidden" value="${uiLabelMap.Project}[${productContentWrapper.get("PRODUCT_NAME", "html")!}]${uiLabelMap.OfDissuiss}"/>
																<!-- Field 2 -->
																<div class="input-email form-group">
																	<textarea id="url2" name="content" class="textarea-message form-control" placeholder="${uiLabelMap.PartyReply}${nickNamechildFrom}" rows="4" ></textarea>
																</div>
																<#else>
																  	<h5 class="uppercase text-center space30">${uiLabelMap.EcommerceLoggedToPost}</h5>
																</#if>
														      	</div>
														      	<div class="modal-footer">
														        	<button type="button" class="btn btn-default" data-dismiss="modal">${uiLabelMap.Close}</button>
														        	<button type="submit" class="btn btn-primary">${uiLabelMap.EcommerceBlogPostedOn}<i class="uni-paper-plane"></i></button>
														      	</div>
														      	</form>
														    </div><!-- /.modal-content -->
														</div><!-- /.modal-dialog -->
													</div><!-- /.modal -->
													<p>${childEvents.content!}</p>
												</div>
											</li>
										</#if>
										<#assign colChildevents = colChildevents + 1>
									</#list>
									</div>
								</#if>
							<#assign colcommunicationEvents= colcommunicationEvents + 1>
							</#list>
						</ul>
						<!--閬嶅巻姝や骇鍝佺殑鎵�鏈夎璁� end-->
						<!-- 鍙戣捣璁ㄨ -->
						<#if userPartyId??>
							<!-- Post Comment Form -->
							<h3 class="uppercase text-center space30">${uiLabelMap.StartDiscuss} : </h3>
							<!--鍙戣捣璇勮鏃舵彁浜ょ殑琛ㄥ崟-->
							<form class="form" method="post" action="<@ofbizUrl secure="true">createDisscussProductCommunicationEvent?detailId=comm</@ofbizUrl>" name="CreateTopicEvent">
								<input name="action" type="hidden"/>
							  	<input name="my" type="hidden"/>
							  	<input name="messageId" type="hidden"/>
							  	<input name="productId" value="${product.productId}" type="hidden"/>
							  	<input name="parentCommEventId" value="" type="hidden"/>
							  	<input name="communicationEventTypeId" value="PRODUCT_DISSCUSS" type="hidden"/>
							  	<input name="statusId" value="COM_COMPLETE" type="hidden"/>
							  	<input name="partyIdFrom" value="${userPartyId}" type="hidden"/>
							  	<input name="partyIdTo" type="hidden"/>
							  	<input name="contactMechTypeId" type="hidden"/>
							  	<input name="contactMechIdFrom" autocomplete="off" type="hidden"/>
							  	<input name="contactMechIdTo" autocomplete="off" type="hidden"/>
							  	<input name="roleTypeIdFrom" value="_NA_" type="hidden"/>
							  	<input name="roleTypeIdTo" value="_NA_" type="hidden"/>
							  	<input name="contactListId" type="hidden"/>
							  	<input name="datetimeStarted" type="hidden"/>
							  	<input name="datetimeEnded" type="hidden"/>
							  	<input name="reasonEnumId" type="hidden"/>
							  	<input name="contentMimeTypeId" value="text/plain" type="hidden"/>
							  	<input name="note" type="hidden"/>
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<input type="hidden" class="form-control" name="subject" id="exampleInputName" require="" value="${uiLabelMap.Project}[${productContentWrapper.get("PRODUCT_NAME", "html")!}]${uiLabelMap.OfDissuiss}"/>
										</div>
										<div class="form-group textarea-message ">
											<textarea name="content" class="textarea-message form-control" placeholder="${uiLabelMap.CommonContent}" rows="8" id="url3"></textarea>
										</div>
										<button type="submit" class="button btn-border btn-lg btn-radius btn-center">${uiLabelMap.EcommerceBlogPostedOn}</button>
									</div><!-- Column -->
								</div><!-- Row -->
							</form><!-- Post Comment Form -->
						<#else>
						  	<h3 class="uppercase text-center space30">${uiLabelMap.EcommerceLoggedToPost}</h3><!-- 蹇呴』鐧诲綍鎵嶈兘鐣欒█ -->
						</#if>
						<!-- 鍙戣捣璁ㄨ end -->
					</div>
					<!--浜у搧璁ㄨ鍧�  end-->
					<!--鏂囦欢涓嬭浇鍧�-->
					<div class="tab-pane fade" id="FileDownload">
						<p>${uiLabelMap.FileDownload}</p>
					    <#if downloadProductContentAndInfoList?has_content>
					        <div id="download-files">
						     <#if userLogin?has_content && userLogin.userLoginId != "anonymous">
								<#list downloadProductContentAndInfoList as downloadProductContentAndInfo>
						            <div>
						            	<h5>
						            	${downloadProductContentAndInfo.contentName!}
						            	<#if downloadProductContentAndInfo.description?has_content>
						            		 - ${downloadProductContentAndInfo.description}
						            	</#if>
						            	<a href="ViewBinaryDataResource?externalLoginKey=${requestAttributes.externalLoginKey!}&contentId=${downloadProductContentAndInfo.contentId}">
						            		&nbsp;&nbsp;&nbsp;&nbsp;download
						            	</a>
						            	</h5>
						            </div>
					        	</#list>
							<#else>
								<h5 class="uppercase space10">
									<a>
									( ${uiLabelMap.OrderYouMust}${uiLabelMap.CommonLogin}${uiLabelMap.DownloadFile} )
									</a>
								</h5>
							</#if>
					        </div>
					    </#if>
					</div>
					<!--鏂囦欢涓嬭浇鍧桬ND-->
				</div>
			</div>
		</div>
	</div>
	<!--row END-->
</div>
<!--container END-->









    
    
   
	
    

    
    	
  

  
  
  
