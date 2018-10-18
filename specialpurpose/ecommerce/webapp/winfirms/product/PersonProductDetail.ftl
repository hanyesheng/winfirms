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
<script type="text/javascript">
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
</script>
<#list PersonList as PersonList>
	<#assign partyId = PersonList.partyId! />
	<#assign partyComments = PersonList.comments! />
	<#if PersonList.nickname??>
		<#assign partyName = PersonList.nickname />
	<#else>
		<#assign partyName = product.createdByUserLogin />
	</#if>
</#list>
<#list ProductFeatureAndAppl as ProductFeatureAndAppl>
	<#if ProductFeatureAndAppl.description??>
		<#assign ProductFeatureAndAppl = ProductFeatureAndAppl.description />
	<#else>
		<#assign ProductFeatureAndAppl = "---" />
	</#if>
</#list>
<#assign personLogoUrl = "/images/winfirms/headdefault.png">
<#list partyContentList?sort_by('fromDate') as personContent>
	<#if personContent.partyId = partyId >
		<#assign personContentId = personContent.contentId! />
	</#if>
	<#if personContentId?has_content>
		<#assign personLogoUrl = "/content/control/stream?contentId=${personContentId}"! />
	</#if>
</#list>
<#assign productBackImage = product.largeImageUrl! />
<#list ProductContentAndInfo as ProductContentAndInfo>
	<#if ProductContentAndInfo.productId = product.productId>
		<#assign rrcruitCol = 1>
	</#if>
</#list>

<div class="parallax-bg1 padding30 space30" style="background-image: url(/images/winfirms/p_header.jpg) !important;">
	<div class="container">
		<ul class="comment-lis col-md-6 col-md-offset-3 text-centert padding30">
			<li>
				<a class="pull-left" href="javascript: void(0);" style="padding-top: 28px;"><img class="comment-avatar" src="${personLogoUrl}" alt="" height="50" width="50"></a>
				<div class="comment-meta text-center" style="margin-left: 0;margin-bottom: 20px;">
					<a href="javascript: void(0);" style="color: #fff;font-size: 18px;">
						${productContentWrapper.get("PRODUCT_NAME", "html")!}
					</a>
					<#if (RoleTypeAndParty?size > 0)>
						<#list RoleTypeAndParty as RoleTypeAndParty>
							<#if RoleTypeAndParty.roleTypeId = "BUSINESSMAN">
							<span class="businessman">${RoleTypeAndParty.description}</span>
							<#elseif RoleTypeAndParty.roleTypeId = "SUBSCRIBER">
							<span class="subscriber">${RoleTypeAndParty.description}</span>
							<#elseif RoleTypeAndParty.roleTypeId = "INVESTORS">
							<span class="investors">${RoleTypeAndParty.description}</span>
							<#elseif RoleTypeAndParty.roleTypeId = "COMPANY">
							<span class="company">${RoleTypeAndParty.description}</span>
							<#elseif RoleTypeAndParty.roleTypeId = "INCUBATOR">
							<span class="incubator">${RoleTypeAndParty.description}</span>
							</#if>
						</#list>
					<#else>
						<span class="unverified">${uiLabelMap.Unverified}</span>
					</#if>
				</div>
				<p style="padding-left: 100px;color: #EAEAEA;">
					${uiLabelMap.BriefIntroduction}&nbsp;: &nbsp;&nbsp;<#if partyComments?has_content>${partyComments!}<#else>${uiLabelMap.NoPartyComments}</#if>
				</p>
			</li>
		</ul>
	</div>
</div>
<div class="container">
	<ul class="nav nav-tabs">
		<li class="<#if !parameters.detailId??>active</#if> col-md-3" ><a href="/products/p_${productId}"><i class="fa fa-fire"></i>${uiLabelMap.Persondetail}</a></li>
		<li class="<#if parameters.detailId?? && parameters.detailId = "discuss">active</#if> col-md-3" ><a href="/products/p_${productId}?detailId=comm"><i class="fa fa-check"></i>${uiLabelMap.PersonComm}</a></li>
		<li class="<#if parameters.detailId?? && parameters.detailId = "created">active</#if> col-md-3" ><a href="/products/p_${productId}?detailId=created"><i class="fa fa-calendar"></i>${uiLabelMap.ProjectCreate}</a></li>
		<li class="<#if parameters.detailId?? && parameters.detailId = "joined">active</#if> col-md-3" ><a href="/products/p_${productId}?detailId=joined"><i class="fa fa-calendar"></i>${uiLabelMap.ProjectJoin}</a></li>
	</ul>
</div>
