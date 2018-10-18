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

<#-- NOTE: this template is used for the orderstatus screen in ecommerce AND for order notification emails through the OrderNoticeEmail.ftl file -->
<#-- the "urlPrefix" value will be prepended to URLs by the ofbizUrl transform if/when there is no "request" object in the context -->
<#if baseEcommerceSecureUrl??><#assign urlPrefix = baseEcommerceSecureUrl/></#if>
<#if (orderHeader.externalId)?? && (orderHeader.externalId)?has_content >
  <#assign externalOrder = "(" + orderHeader.externalId + ")"/>
</#if>

<div id="orderHeader">
<div class="md-card">
	<div class="md-card-toolbar">
	<h3 class="md-card-toolbar-heading-text">
    <#if maySelectItems?default("N") == "Y" && returnLink?default("N") == "Y" && (orderHeader.statusId)! == "ORDER_COMPLETED" && roleTypeId! == "PLACING_CUSTOMER">
    </#if>
    ${uiLabelMap.OrderOrder}
    <#if orderHeader?has_content>
      ${uiLabelMap.CommonNbr}<a href="<@ofbizUrl fullPath="true">orderstatus?orderId=${orderHeader.orderId}</@ofbizUrl>" class="lightbuttontext">${orderHeader.orderId}</a>
    </#if>
    ${uiLabelMap.CommonInformation}
    <#if (orderHeader.orderId)??>
      ${externalOrder!} [ <a href="<@ofbizUrl fullPath="true">order.pdf?orderId=${(orderHeader.orderId)!}</@ofbizUrl>" target="_BLANK" class="lightbuttontext">PDF</a> ]
    </#if>
  </h3>
  </div>
  <div class="md-card-content">
  <#-- placing customer information -->
  <table class="uk-table">
    <#if localOrderReadHelper?? && orderHeader?has_content>
      <#assign displayParty = localOrderReadHelper.getPlacingParty()!/>
      <#if displayParty?has_content>
        <#assign displayPartyNameResult = dispatcher.runSync("getPartyNameForDate", Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("partyId", displayParty.partyId, "compareDate", orderHeader.orderDate, "userLogin", userLogin))/>
      </#if>
      <tr>
        <td>${uiLabelMap.PartyName}</td>
        <td>${(displayPartyNameResult.fullName)?default("[Name Not Found]")}</td>
      </tr>
    </#if>
    <#-- order status information -->
    <tr>
      <td>${uiLabelMap.CommonStatus}</td>
      <td>
      <#if orderHeader?has_content>
        ${localOrderReadHelper.getStatusString(locale)}
      <#else>
        ${uiLabelMap.OrderNotYetOrdered}
      </#if>
      </td>
    </tr>
    <#-- ordered date -->
    <#if orderHeader?has_content>
      <tr>
        <td>${uiLabelMap.CommonDate}</td>
        <td>${orderHeader.orderDate.toString()}</td>
      </tr>
    </#if>
    <#if distributorId??>
      <tr>
        <td>${uiLabelMap.OrderDistributor}</td>
        <td>${distributorId}</td>
      </tr>
    </#if>
  </table>
	</div>
</div>
<div class="md-card">
  <#if paymentMethods?has_content || paymentMethodType?has_content || billingAccount?has_content>
    <#-- order payment info -->
    <div class="md-card-toolbar">
			<h3 class="md-card-toolbar-heading-text">${uiLabelMap.AccountingPaymentInformation}</h3>
	  </div>
  	<div class="md-card-content">
    <#-- offline payment address infomation :: change this to use Company's address -->
    <table class="uk-table">
      <#if !paymentMethod?has_content && paymentMethodType?has_content>
          <#if paymentMethodType.paymentMethodTypeId == "EXT_OFFLINE">
            ${uiLabelMap.AccountingOfflinePayment}
            <#if orderHeader?has_content && paymentAddress?has_content>
              ${uiLabelMap.OrderSendPaymentTo}:
              <#if paymentAddress.toName?has_content>${paymentAddress.toName}</#if>
              <#if paymentAddress.attnName?has_content>${uiLabelMap.PartyAddrAttnName}: ${paymentAddress.attnName}</#if>
              ${paymentAddress.address1}
              <#if paymentAddress.address2?has_content>${paymentAddress.address2}</#if>
              <#assign paymentStateGeo = (delegator.findOne("Geo", {"geoId", paymentAddress.stateProvinceGeoId!}, false))! />
              ${paymentAddress.city}<#if paymentStateGeo?has_content>, ${paymentStateGeo.geoName!}</#if> ${paymentAddress.postalCode!}
              <#assign paymentCountryGeo = (delegator.findOne("Geo", {"geoId", paymentAddress.countryGeoId!}, false))! />
              <#if paymentCountryGeo?has_content>${paymentCountryGeo.geoName!}</#if>
              ${uiLabelMap.EcommerceBeSureToIncludeYourOrderNb}
            </#if>
          <#else>
            <#assign outputted = true>
            <tr>
            <td>${uiLabelMap.AccountingPaymentInformation}</td>
            <td>${uiLabelMap.AccountingPaymentVia}</td><td> ${paymentMethodType.get("description",locale)}</td>
          	</tr>
          </#if>
      </#if>
      <#if paymentMethods?has_content>
        <#list paymentMethods as paymentMethod>
          <#if "CREDIT_CARD" == paymentMethod.paymentMethodTypeId>
            <#assign creditCard = paymentMethod.getRelatedOne("CreditCard", false)>
            <#assign formattedCardNumber = Static["org.ofbiz.party.contact.ContactHelper"].formatCreditCard(creditCard)>
          <#elseif "GIFT_CARD" == paymentMethod.paymentMethodTypeId>
            <#assign giftCard = paymentMethod.getRelatedOne("GiftCard", false)>
          <#elseif "EFT_ACCOUNT" == paymentMethod.paymentMethodTypeId>
            <#assign eftAccount = paymentMethod.getRelatedOne("EftAccount", false)>
          </#if>
          <#-- credit card info -->
          <#if "CREDIT_CARD" == paymentMethod.paymentMethodTypeId && creditCard?has_content>
            <#if outputted?default(false)>
            </#if>
            <#assign pmBillingAddress = creditCard.getRelatedOne("PostalAddress", false)!>
            <li>
              <ul>
                <li> ${uiLabelMap.AccountingCreditCard}
                  <#if creditCard.companyNameOnCard?has_content>${creditCard.companyNameOnCard}</#if>
                  <#if creditCard.titleOnCard?has_content>${creditCard.titleOnCard}</#if>
                  ${creditCard.firstNameOnCard}
                  <#if creditCard.middleNameOnCard?has_content>${creditCard.middleNameOnCard}</#if>
                  ${creditCard.lastNameOnCard}
                  <#if creditCard.suffixOnCard?has_content>${creditCard.suffixOnCard}</#if>
                </li>
                <li>${formattedCardNumber}</li>
              </ul>
            </li>
            <#-- Gift Card info -->
          <#elseif "GIFT_CARD" == paymentMethod.paymentMethodTypeId && giftCard?has_content>
            <#if outputted?default(false)>
            </#if>
            <#if giftCard?has_content && giftCard.cardNumber?has_content>
              <#assign pmBillingAddress = giftCard.getRelatedOne("PostalAddress", false)!>
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
            <li>
              ${uiLabelMap.AccountingGiftCard}
              ${giftCardNumber}
            </li>
            <#-- EFT account info -->
          <#elseif "EFT_ACCOUNT" == paymentMethod.paymentMethodTypeId && eftAccount?has_content>
            <#if outputted?default(false)>
            </#if>
            <#assign pmBillingAddress = eftAccount.getRelatedOne("PostalAddress", false)!>
            <li>
              <ul>
                <li>
                  ${uiLabelMap.AccountingEFTAccount}
                  ${eftAccount.nameOnAccount!}
                </li>
                <li>
                  <#if eftAccount.companyNameOnAccount?has_content>${eftAccount.companyNameOnAccount}</#if>
                </li>
                <li>
                  ${uiLabelMap.AccountingBank}: ${eftAccount.bankName}, ${eftAccount.routingNumber}
                </li>
                <li>
                  ${uiLabelMap.AccountingAccount} #: ${eftAccount.accountNumber}
                </li>
              </ul>
            </li>
          </#if>
          <#if pmBillingAddress?has_content>
            <li>
              <ul>
                <li>
                  <#if pmBillingAddress.toName?has_content>${uiLabelMap.CommonTo}: ${pmBillingAddress.toName}</#if>
                </li>
                <li>
                  <#if pmBillingAddress.attnName?has_content>${uiLabelMap.CommonAttn}: ${pmBillingAddress.attnName}</#if>
                </li>
                <li>
                  ${pmBillingAddress.address1}
                </li>
                <li>
                  <#if pmBillingAddress.address2?has_content>${pmBillingAddress.address2}</#if>
                </li>
                <li>
                <#assign pmBillingStateGeo = (delegator.findOne("Geo", {"geoId", pmBillingAddress.stateProvinceGeoId!}, false))! />
                ${pmBillingAddress.city}<#if pmBillingStateGeo?has_content>, ${ pmBillingStateGeo.geoName!}</#if> ${pmBillingAddress.postalCode!}
                <#assign pmBillingCountryGeo = (delegator.findOne("Geo", {"geoId", pmBillingAddress.countryGeoId!}, false))! />
                <#if pmBillingCountryGeo?has_content>${pmBillingCountryGeo.geoName!}</#if>
                </li>
              </ul>
            </li>
          </#if>
          <#assign outputted = true>
        </#list>
      </#if>
      <#-- billing account info -->
      <#if billingAccount?has_content>
        <#if outputted?default(false)>
        </#if>
        <#assign outputted = true>
        <li>
          ${uiLabelMap.AccountingBillingAccount}
          #${billingAccount.billingAccountId!} - ${billingAccount.description!}
        </li>
      </#if>
      <#if (customerPoNumberSet?has_content)>
        <li>
          ${uiLabelMap.OrderPurchaseOrderNumber}
          <#list customerPoNumberSet as customerPoNumber>
            ${customerPoNumber!}
          </#list>
        </li>
      </#if>
    </table>
    </div>
  </#if>
</div>

</div>
