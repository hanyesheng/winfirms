<#--
This library is part of OFBiz-AliPay Component of Langhua
 
Copyright (C) 2009  Langhua Opensource Foundation (http://langhua.org)
 
This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 3.0 of the License, or (at your option) any later version.
 
This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

For the latest version about this module, please see the
project website: http://langhua.org/opensource/ofbiz/ofbiz-alipay/
 
For more information on Apache OFBiz, please see the
project website: http://ofbiz.apache.org/

For more information on AliPay, please see its website:
https://www.alipay.com/

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-->
<div class="page_header">
	<div class="page_header_parallax" style="background: url(/images/defaultCatgoryBg.jpg) no-repeat fixed center;background-size: cover;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h3>${uiLabelMap.PayReturn}</h3>
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
						<li>${uiLabelMap.PayReturn}</li>
					</ul>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<#assign is_success = parameters.is_success/>
<div class="clearfix space40"></div>
<div class="text-center space40">
	<#if is_success = "T">
	<h4>${uiLabelMap.PaySuccess}</h4>
	<#else>
	<h4>${uiLabelMap.PayFail}</h4>
	</#if>
	<div class="space30"></div>
	<a href="<@ofbizUrl>main</@ofbizUrl>" style="display: inline-block;" class="button btn-small btn-center btn-radius space20">${uiLabelMap.CommonMain}</a>
	<a href="<@ofbizUrl>viewprofile</@ofbizUrl>" style="display: inline-block;" class="button btn-small btn-center btn-radius space20">${uiLabelMap.PartyProfile}</a>
</div>
				