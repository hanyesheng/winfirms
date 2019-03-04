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
<div class="page_header">
	<div class="page_header_parallax" style="background: url(/images/defaultCatgoryBg.jpg) no-repeat fixed center;background-size: cover;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h3>${uiLabelMap.ProductProductNotFound}${productId}</h3>
				</div>
			</div>
		</div>
	</div>
	<div class="bcrumb-wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="bcrumbs">
						<li><a href="<@ofbizUrl>main</@ofbizUrl>"><i class="fa fa-home"></i>  ${uiLabelMap.CommonMain}</a></li>
						<li>${uiLabelMap.ProductProductNotFound}${productId}</li>
					</ul>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix space40"></div>
<div class="text-center space40">
	<h4>${uiLabelMap.ProductProductNotFound}[${productId}]</h4>
	<div class="space30"></div>
	<a href="<@ofbizUrl>main</@ofbizUrl>" style="display: inline-block;" class="button btn-small btn-center btn-radius space20">${uiLabelMap.CommonMain}</a>
	<a href="<@ofbizUrl>viewprofile</@ofbizUrl>" style="display: inline-block;" class="button btn-small btn-center btn-radius space20">${uiLabelMap.PartyProfile}</a>
</div>
