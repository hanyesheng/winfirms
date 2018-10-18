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

<script language="JavaScript" type="text/javascript">

    var clicked = 0;
    function processOrder() {
        if (clicked == 0) {
            clicked++;
            //window.location.replace("<@ofbizUrl>processorder</@ofbizUrl>");
            document.${parameters.formNameValue}.processButton.value="${StringUtil.wrapString(uiLabelMap.OrderSubmittingOrder)}";
            document.${parameters.formNameValue}.processButton.disabled=true;
            document.${parameters.formNameValue}.submit();
        } else {
            showErrorAlert("${uiLabelMap.CommonErrorMessage2}","${uiLabelMap.YoureOrderIsBeingProcessed}");
        }
    }

</script>

<!-- Page Header -->
<div class="page_header space20 project">
	<div class="page_header_parallax4" style="background: url(/images/defaultCatgoryBg.jpg) no-repeat fixed center;background-size: cover;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h3>${uiLabelMap.EcommerceOrderConfirmation}</h3>
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
						<li>${uiLabelMap.EcommerceOrderConfirmation}</li>
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

<h3>${uiLabelMap.OrderFinalCheckoutReview}</h3>
<#if !isDemoStore?? && isDemoStore><p>${uiLabelMap.OrderDemoFrontNote}.</p></#if>

<#if cart?? && 0 < cart.size()>
  ${screens.render("component://ecommerce/widget/winfirms/OrderScreens.xml#orderheader")}
  <br />
  ${screens.render("component://ecommerce/widget/winfirms/OrderScreens.xml#orderitems")}
  <table border="0" cellpadding="1" width="100%">
   <tr>
      <td colspan="4">
        &nbsp;
      </td>
      <td align="right">
        <form type="post" action="<@ofbizUrl>processorder</@ofbizUrl>" name="${parameters.formNameValue}">
          <#if (requestParameters.checkoutpage)?has_content>
            <input type="hidden" name="checkoutpage" value="${requestParameters.checkoutpage}" />
          </#if>
          <#if (requestAttributes.issuerId)?has_content>
            <input type="hidden" name="issuerId" value="${requestAttributes.issuerId}" />
          </#if>
          <input type="button" name="processButton" value="${uiLabelMap.OrderSubmitOrder}" onclick="processOrder();" class="button btn-small" />
        </form>
        <#-- doesn't work with Safari, seems to work with IE, Mozilla <a href="#" onclick="processOrder();" class="buttontextbig">[${uiLabelMap.OrderSubmitOrder}]&nbsp;</a> -->
      </td>
    </tr>
  </table>
<#else>
  <h3>${uiLabelMap.OrderErrorShoppingCartEmpty}.</h3>
</#if>

</div>
</div>
</div>