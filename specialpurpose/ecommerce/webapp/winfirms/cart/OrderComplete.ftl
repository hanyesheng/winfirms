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

<#if !isDemoStore?? || isDemoStore><p>${uiLabelMap.OrderDemoFrontNote}.</p></#if>
<#if orderHeader?has_content>
  ${screens.render("component://ecommerce/widget/winfirms/OrderScreens.xml#orderheader")}
  ${screens.render("component://ecommerce/widget/winfirms/OrderScreens.xml#orderitems")}
  <a href="<@ofbizUrl>main</@ofbizUrl>" class="button btn-small btn-center">${uiLabelMap.EcommerceContinueShopping}</a>
<#else>
  <h3>${uiLabelMap.OrderSpecifiedNotFound}.</h3>
</#if>

</div>
</div>
</div>
