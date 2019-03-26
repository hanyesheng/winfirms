<script type="text/javascript">
function choosePayment(){
	var obj = document.getElementById("selectPayment"); 
	var index = obj.selectedIndex; 
	var value = obj.options[index].value; 
	document.getElementById("checkOutPaymentId22").value=value;
}

function chooseShipping(){
	var obj = document.getElementById("selectShipping"); 
	var index = obj.selectedIndex; 
	var value = obj.options[index].value; 
	document.getElementById("shipping_method22").value=value;
}


//<![CDATA[
function submitForm(form, mode, value) {
    if (mode == "DN") {
        // done action; checkout
        form.action="<@ofbizUrl>checkout</@ofbizUrl>";
        form.submit();
    } else if (mode == "CS") {
        // continue shopping
        form.action="<@ofbizUrl>updateCheckoutOptions/showcart</@ofbizUrl>";
        form.submit();
    } else if (mode == "NA") {
        // new address
        form.action="<@ofbizUrl>updateCheckoutOptions/editcontactmech1?DONE_PAGE=quickcheckout&partyId=${shoppingCart.getPartyId()}&preContactMechTypeId=POSTAL_ADDRESS&contactMechPurposeTypeId=SHIPPING_LOCATION</@ofbizUrl>";
        form.submit();
    } else if (mode == "EA") {
        // edit address
        form.action="<@ofbizUrl>updateCheckoutOptions/editcontactmech?DONE_PAGE=quickcheckout&partyId=${shoppingCart.getPartyId()}&contactMechId="+value+"</@ofbizUrl>";
        form.submit();
    } else if (mode == "NC") {
        // new credit card
        form.action="<@ofbizUrl>updateCheckoutOptions/editcreditcard?DONE_PAGE=quickcheckout&partyId=${shoppingCart.getPartyId()}</@ofbizUrl>";
        form.submit();
    } else if (mode == "EC") {
        // edit credit card
        form.action="<@ofbizUrl>updateCheckoutOptions/editcreditcard?DONE_PAGE=quickcheckout&partyId=${shoppingCart.getPartyId()}&paymentMethodId="+value+"</@ofbizUrl>";
        form.submit();
    } else if (mode == "GC") {
        // edit gift card
        form.action="<@ofbizUrl>updateCheckoutOptions/editgiftcard?DONE_PAGE=quickcheckout&partyId=${shoppingCart.getPartyId()}&paymentMethodId="+value+"</@ofbizUrl>";
        form.submit();
    } else if (mode == "NE") {
        // new eft account
        form.action="<@ofbizUrl>updateCheckoutOptions/editeftaccount?DONE_PAGE=quickcheckout&partyId=${shoppingCart.getPartyId()}</@ofbizUrl>";
        form.submit();
    } else if (mode == "EE") {
        // edit eft account
        form.action="<@ofbizUrl>updateCheckoutOptions/editeftaccount?DONE_PAGE=quickcheckout&partyId=${shoppingCart.getPartyId()}&paymentMethodId="+value+"</@ofbizUrl>";
        form.submit();
    } else if (mode == "SP") {
        // split payment
        form.action="<@ofbizUrl>updateCheckoutOptions/checkoutpayment?partyId=${shoppingCart.getPartyId()}</@ofbizUrl>";
        form.submit();
    } else if (mode == "SA") {
        // selected shipping address
        form.action="<@ofbizUrl>updateCheckoutOptions/quickcheckout</@ofbizUrl>";
        form.submit();
    } else if (mode == "SC") {
        // selected ship to party
        form.action="<@ofbizUrl>cartUpdateShipToCustomerParty</@ofbizUrl>";
        form.submit();
    }
}
//]]>
</script>

<!-- Page Header -->
<div class="page_header space20 project">
	<div class="page_header_parallax4" style="background: url(/images/defaultCatgoryBg.jpg) no-repeat fixed center;background-size: cover;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h3>${uiLabelMap.OrderCheckout}</h3>
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
						<li>${uiLabelMap.OrderCheckout}</li>
					</ul>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Page Main -->
<div role="main" class="main shop">
	<div class="page-default bg-grey typo-dark">
		<!-- Container -->
		<div class="container">
		
		<#assign shipping = !shoppingCart.containAllWorkEffortCartItems()> <#-- contains items which need shipping? -->
		<#--购物提交的表单-->
		<form method="post" name="checkoutInfoForm" style="margin:0;">
			<#--前面是隐藏的字段-->
		  	<input type="hidden" name="checkoutpage" value="quick"/>
		  	<input type="hidden" name="BACK_PAGE" value="quickcheckout"/>
		  	
		  	
		  	<#--送货到哪里-->
		  	<#--送货到哪个会员-->
		  	<div class="space20"></div>
		  	<div class="col-md-12">
                <h5>
                	<strong style="font-size: medium;">
                		${uiLabelMap.OrderShipToParty}:
                	</strong>
                </h5>
                <select name="shipToCustomerPartyId" onchange="javascript:submitForm(document.checkoutInfoForm, 'SC', null);" class="form-control">
                    <#list cartParties as cartParty>
                    <option value="${cartParty}">${cartParty}</option>
                    </#list>
                </select>
                
                <#if (shoppingCart.getTotalQuantity() > 1) && !shoppingCart.containAllWorkEffortCartItems()> <#-- no splitting when only rental items -->
                    <hr />
                    <a href="<@ofbizUrl>splitship</@ofbizUrl>" class="button btn-md">${uiLabelMap.OrderSplitIntoMultipleShipments}</a>
                    <#if (shoppingCart.getShipGroupSize() > 1)>
                      	<div style="color: red;">${uiLabelMap.OrderNOTEMultipleShipmentsExist}.</div>
                    </#if>
                </#if>
                
                
            </div>
            <#--送货到哪个会员 end-->
            
            <#--选择收货人-->
            <div class="col-md-12" id="ChooseSendAddress" style="display: none;">
	            <#if shippingContactMechList?has_content>
	            	<div>
				    	<div class="col-md-6" style="padding: 0;">
				    		<h5>
				    			<strong style="font-size: medium;">
				    				${uiLabelMap.ChooseSendAddress}:
				    			</strong>
				    		</h5>
				    	</div>
				    	<#--新建收货地址-->
				    	<div class="col-md-6" style="padding: 0;">
					    	<h6 style="float: right; font-style: italic;">
					    		<a href="javascript:submitForm(document.checkoutInfoForm, 'NA', '');" style="color: #005ea7;">${uiLabelMap.AddNewAddress}</a>
					    	</h6>
				    	</div>
				    	<#--新建收货地址 end-->
				    </div>
				    <table class="table table-bordered extra-padding">
						<tbody>
							<#list shippingContactMechList as shippingContactMech>
								<#assign shippingAddress = shippingContactMech.getRelatedOne("PostalAddress", false)>
								<tr>
									<th>
										<input checked="checked" type="radio" class="css-checkbox" name="shipping_contact_mech_id" value="${shippingAddress.contactMechId}" <#if shoppingCart.getShippingContactMechId()?default("") == shippingAddress.contactMechId> checked="checked"</#if>/>
										<#--不让它选择的时候刷新页面,去掉了onclick="javascript:submitForm(document.checkoutInfoForm, 'SA', null);"-->
										<#--
										<input type="radio" class="css-checkbox" name="shipping_contact_mech_id" value="${shippingAddress.contactMechId}" onclick="javascript:submitForm(document.checkoutInfoForm, 'SA', null);"<#if shoppingCart.getShippingContactMechId()?default("") == shippingAddress.contactMechId> checked="checked"</#if>/>
										-->
									</th>
									<td>
										<#if shippingAddress.toName?has_content><b>${uiLabelMap.CommonTo}:</b>&nbsp;${shippingAddress.toName}</#if>
										<#if shippingAddress.attnName?has_content><b>${uiLabelMap.PartyAddrAttnName}:</b>&nbsp;${shippingAddress.attnName}</#if>
										<#if shippingAddress.address1?has_content>${shippingAddress.address1}</#if>
										<#if shippingAddress.address2?has_content>${shippingAddress.address2}</#if>
										<#if shippingAddress.city?has_content>${shippingAddress.city}</#if>
										<#if shippingAddress.stateProvinceGeoId?has_content>${shippingAddress.stateProvinceGeoId}</#if>
										<#if shippingAddress.postalCode?has_content>${shippingAddress.postalCode}</#if>
										<#if shippingAddress.countryGeoId?has_content>${shippingAddress.countryGeoId}</#if>
										<a href="javascript:submitForm(document.checkoutInfoForm, 'EA', '${shippingAddress.contactMechId}');" class="buttontext" style="font-style: italic; color: #005ea7;">${uiLabelMap.CommonUpdate}</a>
									</td>
								</tr>
							</#list>
						</tbody>
					</table>
	            </#if>
            </div>
		  	<#--选择收货人 end-->
		  	
		  	<#if shipping == true>
		  	<#--选择送货方式 -->
		  	<div class="col-md-12" style="display: none;">
		  		<h5 class="uppercase">
		            <#if shipping == true>
		            	
		                	<div class="h5">
		                		<strong style="font-size: medium;">
		                			${uiLabelMap.OrderHowShallWeShipIt}:
		                		</strong>
		                	</div>
		            <#else>
		                <div class="h5">
			                <strong style="font-size: medium;">
			                	${uiLabelMap.OrderOptions}:
			                </strong>
		                </div>
		            </#if>
		        </h5>
		        
		        <#--送货方式(顺丰,申通)-->
		        <select class="form-control" id="selectShipping" onchange="chooseShipping()">
		        	<#if !carrierShipmentMethodList?? || carrierShipmentMethodList?size == 0>
		        		<option value="Default" name="shipping_method">${uiLabelMap.DefaultShipmentMethod}</option>
		        	</#if>
		        	<#list carrierShipmentMethodList as carrierShipmentMethod>
					    <#assign shippingMethod = carrierShipmentMethod.shipmentMethodTypeId + "@" + carrierShipmentMethod.partyId>
					    <option value="${shippingMethod}" name="shipping_method" <#if shippingMethod == chosenShippingMethod?default("N@A")>selected="selected"</#if>>
					    	<#if shoppingCart.getShippingContactMechId()??>
					            <#assign shippingEst = shippingEstWpr.getShippingEstimate(carrierShipmentMethod)?default(-1)>
					        </#if>
					    	<#if carrierShipmentMethod.partyId != "_NA_">&nbsp;</#if>${carrierShipmentMethod.description!}
					        <#if shippingEst?has_content> - <#if (shippingEst > -1)><@ofbizCurrency amount=shippingEst isoCode=shoppingCart.getCurrency()/><#else>${uiLabelMap.OrderCalculatedOffline}</#if></#if>
					    </option>
		        	</#list>
				</select>
				<#if !carrierShipmentMethodList?? || carrierShipmentMethodList?size == 0>
	        		<input type="hidden" class="css-checkbox" name="shipping_method" value="Default"/>
	        	</#if>
				<#if carrierShipmentMethodList[0]??>
					<#assign defaultShippingMethod = carrierShipmentMethodList[0].shipmentMethodTypeId + "@" + carrierShipmentMethodList[0].partyId>
				<#else>
					<#assign defaultShippingMethod = "Default">
				</#if>
				
				<input id="shipping_method22" type="hidden" name="shipping_method" value="${defaultShippingMethod}"/>
				<#--送货方式(顺丰,申通) end-->
		  	</div>
		  	<#--选择送货方式 end-->
		  	
		  	<#--是否一起送货,目前让它隐藏,默认一起送-->
		  	<input type="hidden" name="may_split" value="false"/>
		  	<#--
            <div class="row">
          		<div class="col-md-12">
              		<input type="radio" <#if shoppingCart.getMaySplit()?default("N") == "N">checked="checked"</#if> name="may_split" value="false"/>
              		${uiLabelMap.OrderPleaseWaitUntilBeforeShipping}.
              		<div class="space20"></div>
            	</div>
            	<div class="col-md-12">
              		<input <#if shoppingCart.getMaySplit()?default("N") == "Y">checked="checked"</#if> type="radio" name="may_split" value="true"/>
              		${uiLabelMap.OrderPleaseShipItemsBecomeAvailable}.
              		<div class="space20"></div>
            	</div>
        	</div>
        	-->
		  	<#--是否一起送货 end-->
		  	<#else/>
                <input type="hidden" name="shipping_method" value="NO_SHIPPING@_NA_"/>
                <input type="hidden" name="may_split" value="false"/>
                <input type="hidden" name="is_gift" value="false"/>
            </#if>
		  	
		  	<#--电子邮件-->
		  	<div class="col-md-8" style="display: none;">
		  		<h5>
		  			<strong style="font-size: medium;">
		  				${uiLabelMap.PartyEmailAddresses}:
		  			</strong>
		  		</h5>
		  		<div class="form-control">
			  		${uiLabelMap.OrderEmailSentToFollowingAddresses}:
			        <#list emailList as email>
			            ${email.infoString!}<#if email_has_next>,</#if>
			        </#list>
		        </div>
		  	</div>
		  	<#--电子邮件 end-->
		  	
		  	<div class="col-md-12" style="display: none;">  
		        <#--备注(特别说明)-->    	
	            <h5>
	            	<strong style="font-size: medium;">
	            		${uiLabelMap.OrderSpecialInstructions}:
	            	</strong>
	            </h5>
	            <!--特别说明-->
	            <textarea style="margin-bottom:20px;" cols="30" rows="3" class="form-control" wrap="hard" name="shipping_instructions">${shoppingCart.getShippingInstructions()!}</textarea>
	            <#--备注(特别说明) end-->
	            
	            <#--是否是礼品(此处默认不是礼品,让它隐藏)-->
	            <input type="hidden" name="is_gift" value="false"/>
	            <#--
		            <#if shipping == true>
		                <#if productStore.showCheckoutGiftOptions! != "N" && giftEnable! != "N">
						 	
						      <div>
						        <h5>${uiLabelMap.OrderIsThisGift}</h5>
						        <input type="radio" <#if shoppingCart.getIsGift()?default("Y") == "Y">checked="checked"</#if> name="is_gift" value="true"><span>${uiLabelMap.CommonYes}</span>
						        <input type="radio" <#if shoppingCart.getIsGift()?default("N") == "N">checked="checked"</#if> name="is_gift" value="false"><span>${uiLabelMap.CommonNo}</span>
						      </div>
						    
						    
						      <div class="margin-top-20">&nbsp;</div>
						      <h5>${uiLabelMap.OrderGiftMessage}<h5>
						      <textarea class="form-control" cols="30" rows="3" wrap="hard" name="gift_message">${shoppingCart.getGiftMessage()!}</textarea>
						   
						<#else/>
						      <input type="hidden" name="is_gift" value="false"/>
		                </#if>
		            </#if>
	            -->
	            <#--是否是礼品 end-->
            </div>
		  	
		  	<#-- 如何支付-->
		    <div class="col-md-12">
		    	<h5>
	            	<strong style="font-size: medium;">
	            		${uiLabelMap.OrderHowShallYouPay}:
	            	</strong>
	            </h5>
				<select class="form-control" onchange="choosePayment()" id="selectPayment">
					<option value="EXT_ALIPAY">
						${uiLabelMap.DefaultPayment}
					</option>
					<#if productStorePaymentMethodTypeIdMap.EXT_OFFLINE??>
						<option value="EXT_OFFLINE" name="checkOutPaymentId" <#if "EXT_OFFLINE" == checkOutPaymentId>selected="selected"</#if>>
							${uiLabelMap.OrderMoneyOrder}
						</option>
	                </#if>
	                <#if productStorePaymentMethodTypeIdMap.EXT_COD??>
						<option value="EXT_COD" name="checkOutPaymentId" <#if "EXT_COD" == checkOutPaymentId>selected="selected"</#if>>
							${uiLabelMap.OrderCOD}
						</option>
	                </#if>
	                <#if productStorePaymentMethodTypeIdMap.EXT_WORLDPAY??>
						<option value="EXT_WORLDPAY" name="checkOutPaymentId" <#if "EXT_WORLDPAY" == checkOutPaymentId>selected="selected"</#if>>
							${uiLabelMap.AccountingPayWithWorldPay}
						</option>
	                </#if>
	                <#if productStorePaymentMethodTypeIdMap.EXT_PAYPAL??>
						<option value="EXT_PAYPAL" name="checkOutPaymentId" <#if "EXT_PAYPAL" == checkOutPaymentId>selected="selected"</#if>>
							${uiLabelMap.AccountingPayWithPayPal}
						</option>
	                </#if>
	                <#-- 20160905cailigaoalipay19 -->
	                <#if productStorePaymentMethodTypeIdMap.EXT_ALIPAY??>
						<option value="EXT_ALIPAY" name="checkOutPaymentId" <#if "EXT_ALIPAY" == checkOutPaymentId>selected="selected"</#if>>
							${uiLabelMap.Alipay}
						</option>
	                </#if>
	                <#if productStorePaymentMethodTypeIdMap.EXT_UNIONPAY??>
						<option value="EXT_UNIONPAY" name="checkOutPaymentId" <#if "EXT_UNIONPAY" == checkOutPaymentId>selected="selected"</#if>>
							${uiLabelMap.Unionpay}
						</option>
	                </#if>
				</select>
				<input type="hidden" id="checkOutPaymentId22" name="checkOutPaymentId" value="EXT_ALIPAY" />
				
				<#--下面是金融账号(银行卡)-->	  	
                <#-- financial accounts -->
                <#list finAccounts as finAccount>
                <div class="col-md-3">
                    <input type="radio" name="checkOutPaymentId" value="FIN_ACCOUNT|${finAccount.finAccountId}" />
                    <span>${uiLabelMap.AccountingFinAccount} #${finAccount.finAccountId}</span>
                </div>
                </#list>
			    <div class="clearfix space10"></div>  
                <#if !paymentMethodList?has_content>
                    <#if (!finAccounts?has_content)>
                    
                    <div class="col-md-3">
                    	<#--
                         <b>${uiLabelMap.AccountingNoPaymentMethods}</b>
                         -->
                    </div>
                    </#if>
                <#else>
	                <#list paymentMethodList as paymentMethod>
	                <div class="col-md-3">    
	                    <#if paymentMethod.paymentMethodTypeId == "CREDIT_CARD">
	                    	
	                    	<#if productStorePaymentMethodTypeIdMap.CREDIT_CARD??>
	                        <#assign creditCard = paymentMethod.getRelatedOne("CreditCard", false)>
	                        
	                          	<input type="radio" name="checkOutPaymentId" value="${paymentMethod.paymentMethodId}" <#if shoppingCart.isPaymentSelected(paymentMethod.paymentMethodId)>checked="checked"</#if>/>
	                        
	                          	<span>CC:&nbsp;${Static["org.ofbiz.party.contact.ContactHelper"].formatCreditCard(creditCard)}</span>
	                          	<a href="javascript:submitForm(document.checkoutInfoForm, 'EC', '${paymentMethod.paymentMethodId}');" class="buttontext">${uiLabelMap.CommonUpdate}</a>
	                          	<#if paymentMethod.description?has_content><br /><span>(${paymentMethod.description})</span></#if>
	                          	&nbsp;${uiLabelMap.OrderCardSecurityCode}&nbsp;<input type="text" size="5" maxlength="10" name="securityCode_${paymentMethod.paymentMethodId}" value=""/>
	                        
	                        </#if>
	                        
	                    <#elseif paymentMethod.paymentMethodTypeId == "EFT_ACCOUNT">
	                    
	                    	<#if productStorePaymentMethodTypeIdMap.EFT_ACCOUNT??>
	                        <#assign eftAccount = paymentMethod.getRelatedOne("EftAccount", false)>
	                          	<input type="radio" name="checkOutPaymentId" value="${paymentMethod.paymentMethodId}" <#if shoppingCart.isPaymentSelected(paymentMethod.paymentMethodId)>checked="checked"</#if>/>
	                          	<span>${uiLabelMap.AccountingEFTAccount}:&nbsp;${eftAccount.bankName!}: ${eftAccount.accountNumber!}</span>
	                          	<a href="javascript:submitForm(document.checkoutInfoForm, 'EE', '${paymentMethod.paymentMethodId}');" class="buttontext">${uiLabelMap.CommonUpdate}</a>
	                          	<#if paymentMethod.description?has_content><br /><span>(${paymentMethod.description})</span></#if>
	                        </#if>
	                        
	                    <#elseif paymentMethod.paymentMethodTypeId == "GIFT_CARD">
	                    
	                        <#if productStorePaymentMethodTypeIdMap.GIFT_CARD??>
		                        <#assign giftCard = paymentMethod.getRelatedOne("GiftCard", false)>
		
		                        <#if giftCard?has_content && giftCard.cardNumber?has_content>
		                        	<#assign giftCardNumber = "">
		                        	<#assign pcardNumber = giftCard.cardNumber>
		                        	<#if pcardNumber?has_content>
			                          	<#assign psize = pcardNumber?length - 4>
			                          	<#if 0 < psize>
				                            <#list 0 .. psize-1 as foo>
				                                <#assign giftCardNumber = giftCardNumber + "*">
				                            </#list>
				                            <#assign giftCardNumber = giftCardNumber + pcardNumber[psize .. psize + 3]>
		                          	    <#else>
		                            		<#assign giftCardNumber = pcardNumber>
		                          		</#if>
		                        	</#if>
		                        </#if>
	
		                        <input type="radio" name="checkOutPaymentId" value="${paymentMethod.paymentMethodId}" <#if shoppingCart.isPaymentSelected(paymentMethod.paymentMethodId)>checked="checked"</#if>/>
		                        <span>${uiLabelMap.AccountingGift}:&nbsp;${giftCardNumber}</span>
		                        <a href="javascript:submitForm(document.checkoutInfoForm, 'EG', '${paymentMethod.paymentMethodId}');" class="buttontext">[${uiLabelMap.CommonUpdate}]</a>
		                        <#if paymentMethod.description?has_content><br /><span>(${paymentMethod.description})</span></#if>
	                        </#if>
	                        
	                    </#if>
	                </div>
	                </#list>
                </#if>
				<div class="clearfix space10"></div>
                <#-- special billing account functionality to allow use w/ a payment method -->
                <#if productStorePaymentMethodTypeIdMap.EXT_BILLACT??>
                  	<#if billingAccountList?has_content>
                    	<tr><td colspan="2"><hr /></td></tr>
                    	<tr>
                      		<td width="1%">
                        		<select name="billingAccountId">
                          			<option value=""></option>
                            		<#list billingAccountList as billingAccount>
                              		<#assign availableAmount = billingAccount.accountBalance?double>
                              		<#assign accountLimit = billingAccount.accountLimit?double>
                              		<option value="${billingAccount.billingAccountId}" <#if billingAccount.billingAccountId == selectedBillingAccountId?default("")>selected="selected"</#if>>${billingAccount.description?default("")} [${billingAccount.billingAccountId}] Available: <@ofbizCurrency amount=availableAmount isoCode=billingAccount.accountCurrencyUomId/> Limit: <@ofbizCurrency amount=accountLimit isoCode=billingAccount.accountCurrencyUomId/></option>
                            		</#list>
                        		</select>
                      		</td>
                      		<td width="50%">
                        		<span>${uiLabelMap.FormFieldTitle_billingAccountId}</span>
                      		</td>
                    	</tr>
                    	<tr>
                      		<td width="1%" align="right">
                        		<input type="text" size="5" name="billingAccountAmount" value=""/>
                      		</td>
                      		<td width="50%">
                        		${uiLabelMap.OrderBillUpTo}
                      		</td>
                    	</tr>
                  	</#if>
                </#if>
                <#-- end of special billing account functionality -->

                <div class="clearfix space10"></div>
                <#if productStorePaymentMethodTypeIdMap.GIFT_CARD??>
                  	<tr><td colspan="2"><hr /></td></tr>
                  	<tr>
                    	<td width="1%">
                      		<input type="checkbox" name="addGiftCard" value="Y"/>
                    	</td>
                    	<td width="50%">
                      		<span>${uiLabelMap.AccountingUseGiftCardNotOnFile}</span>
                    	</td>
                  	</tr>
                  	<tr>
                    	<td width="1%">
                      		<div>${uiLabelMap.AccountingNumber}</div>
                    	</td>
                    	<td width="50%">
                      		<input type="text" size="15" name="giftCardNumber" value="${(requestParameters.giftCardNumber)!}" onFocus="document.checkoutInfoForm.addGiftCard.checked=true;"/>
                    	</td>
                  	</tr>
                  	<#if shoppingCart.isPinRequiredForGC(delegator)>
                  	<tr>
                    	<td width="1%">
                      		<div>${uiLabelMap.AccountingPIN}</div>
                    	</td>
                    	<td width="50%">
                      		<input type="text" size="10" name="giftCardPin" value="${(requestParameters.giftCardPin)!}" onFocus="document.checkoutInfoForm.addGiftCard.checked=true;"/>
                    	</td>
                  	</tr>
                  	</#if>
                  	<tr>
                    	<td width="1%">
                      		<div>${uiLabelMap.AccountingAmount}</div>
                    	</td>
                    	<td width="50%">
                      		<input type="text" size="6" name="giftCardAmount" value="${(requestParameters.giftCardAmount)!}" onFocus="document.checkoutInfoForm.addGiftCard.checked=true;"/>
                    	</td>
                  	</tr>
                </#if>
		    </div>
		    <#-- 如何支付 end-->
		</form>
		
		<div class="col-md-12">
			<div class="cart-btn">
				<a style="margin-right: 10px;" class="" href="javascript:submitForm(document.checkoutInfoForm, 'CS', '');">${uiLabelMap.OrderBacktoShoppingCart}</a>
				<a class="" href="javascript:submitForm(document.checkoutInfoForm, 'DN', '');">${uiLabelMap.OrderContinueToFinalOrderReview}</a>
			</div>
		</div>
		</div>
		<div class="space20"></div>
	</div>
</div>