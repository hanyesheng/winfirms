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
<#list PartyRelationship as PartyRelationship>
	<#if PartyRelationship.partyIdFrom = CompanyPartyId>
		<#list PartyGroup as PartyGroup>
			<#if PartyGroup.partyId = PartyRelationship.partyIdTo>
				<#assign ParentName = PartyGroup.groupName!>
				<#assign ParentCss = PartyGroup.comments!>
			</#if>
		</#list>
	</#if>
</#list>
<#assign personLogoUrl = "/images/winfirms/user.png">
<#list partyContentList?sort_by('fromDate') as personContent>
	<#if personContent.partyId = CompanyPartyId >
		<#assign personContentId = personContent.contentId! />
	</#if>
	<#if personContentId?has_content>
		<#assign personLogoUrl = "/content/control/stream?contentId=${personContentId}"! />
	</#if>
</#list>
<#assign productBackImage = product.largeImageUrl! />
<div class="parallax-bg1 padding30" style="background-image: url(/images/winfirms/projhead.jpg) !important;">
	<div class="container">
		<div class="col-md-8 col-md-offset-2 text-center">
			<h3 class="uppercase white">${productContentWrapper.get("PRODUCT_NAME", "html")!}</h3>
		</div>
		<div class="col-md-10 col-md-offset-1 text-center space20">
			<div class="dm-wrap"><span style="width:100%;background-color: white;"></span></div>
		</div>
		<div class="col-md-8 col-md-offset-2 text-center white space40">
			<#if InvestorsRole?has_content>
			<span>${uiLabelMap.ProjectField}:</span>
			<#if FieldAboutFeature?has_content><#list FieldAboutFeature as FieldAboutFeature><span class="label label-info">${FieldAboutFeature.description}</span></#list><#else>----</#if>&nbsp;&nbsp;&nbsp;|&nbsp;
			<span>${uiLabelMap.FinancingStage}:</span>
			<#if FinancingStageFeature?has_content><#list FinancingStageFeature as FinancingStageFeature><span class="label label-warning">${FinancingStageFeature.description}</span></#list><#else>----</#if>&nbsp;&nbsp;&nbsp;|&nbsp;
			<span>${uiLabelMap.CommonParent}:</span>
			<#if ParentName??><span class="label label-primary" style="margin-top: 4px;">${ParentName!}</span><#else>----</#if>&nbsp;&nbsp;&nbsp;|&nbsp;
			<span><#if sessionAttributes.userLogin?has_content && sessionAttributes.userLogin.userLoginId != "anonymous">
	            <#if ShoppingListId?has_content>
		            <#list ShoppingListItem as ShoppingListItem>
		            	<#if ShoppingListItem.shoppingListId = ShoppingListId>
		            		<#assign shoppingListItemSeqId = ShoppingListItem.shoppingListItemSeqId>
		            	</#if>
		            </#list>
		            <#if shoppingListItemSeqId??>
		            	<form style="display: inline-block;" method="post" action="<@ofbizUrl>removeFromShoppingListProduct</@ofbizUrl>" name='removeform_shoppingListItem'>
			              <input type="hidden" name="shoppingListId" value="${ShoppingListId}" />
			              <input type="hidden" name="shoppingListItemSeqId" value="${shoppingListItemSeqId}" />
			            </form>
	            		<i class="fa fa-heart" style="color: red;"></i>&nbsp;&nbsp;<a href="javascript:document.removeform_shoppingListItem.submit();">${uiLabelMap.CommonFollowed}</a>
	            	<#else>
			        <form style="display: inline-block;" name="addToShoppingList" method="post" action="<@ofbizUrl>addItemToShoppingList</@ofbizUrl>">
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
		            	<a href="javascript:addShoplistSubmit();" class="buttontext white"><i class="fa fa-heart-o"></i>&nbsp;&nbsp;${uiLabelMap.CommonFollow}</a>
			        </form>
			        </#if>
		        <#else>
		        <form style="display: inline-block;" name="updateList" method="post" action="<@ofbizUrl>createEmptyShoppingList</@ofbizUrl>">
		          <input type="hidden" name="partyId" value="${userLogin.partyId}">
		          <input type="hidden" name="shoppingListTypeId" value="FOLLOW">
	              <input type="hidden" name="listName" value="FOLLOW">
	              <input type="hidden" name="isActive" value="Y">
	      			<a href="javascript:document.updateList.submit();" class="buttontext white">${uiLabelMap.CreateList}</a>
		        </form>
		        </#if>
	      	<#else>
		        ${uiLabelMap.OrderYouMust}
		        <a href="<@ofbizUrl>checkLogin</@ofbizUrl>" class="buttontext">${uiLabelMap.CommonBeLogged}</a>
		        ${uiLabelMap.AddItemsToShoppingList}.
	      	</#if></span>&nbsp;&nbsp;&nbsp;|&nbsp;
	      	<span><a data-toggle="modal" data-target=".colcommunicationEvents"  href="#" class="buttontext white"><i class="fa fa-comment-o"></i>&nbsp;&nbsp;${uiLabelMap.PrivateLetter}</a></span>
	      		<!-- 点击回复弹出的小框 -->
				<div class="modal fade colcommunicationEvents">
				  <div class="modal-dialog">
				    <div class="modal-content">
				    <form method="post" action="<@ofbizUrl secure="true">createDisscussProjCommunicationEvent</@ofbizUrl>" name="CreateTopicEvent" class="border" onsubmit="return checkIP1();">
				      	<div class="modal-header">
				        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">${uiLabelMap.Close}</span></button>
				        	<h4 class="modal-title">${uiLabelMap.PrivateLetter}${productContentWrapper.get("PRODUCT_NAME", "html")!}</h4>
				      	</div>
				      	<div class="modal-body">
				        <#if sessionAttributes.userLogin?has_content && sessionAttributes.userLogin.userLoginId != "anonymous">
						<!--回复提交的表单-->
							<input name="action" type="hidden"/>
							  	<input name="my" type="hidden"/>
							  	<input name="messageId" type="hidden"/>
							  	<input name="communicationEventTypeId" value="PRIVATE_LETTER" type="hidden"/>
							  	<input name="statusId" value="COM_COMPLETE" type="hidden"/>
							  	<input name="partyIdFrom" value="${userLogin.partyId}" type="hidden"/>
							  	<input name="partyIdTo" value="${CompanyPartyId!}" type="hidden"/>
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
							  	<input name="note" type="hidden" value=""/>
							<!-- Field 2 -->
							<div class="input-email form-group">
								<textarea required="required" id="url1" name="content" class="textarea-message form-control" placeholder="${uiLabelMap.CommonContent}" rows="4" ></textarea>
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
	      	</#if>
		</div>
	</div>
</div>
<#if InvestorsRole?has_content>
<div class="project product-tab">
	<div class="container">
	<ul class="nav nav-tabs">
		<li class="col-md-3 <#if !parameters.detailId??>active</#if>"  ><a href="/products/p_${productId}"><i class="fa fa-fire"></i>${uiLabelMap.CompanyIntro}</a></li>
		<li class="col-md-3 <#if parameters.detailId?? && parameters.detailId = "childproject">active</#if>" ><a href="/products/p_${productId}?detailId=childproject"><i class="fa fa-pencil"></i>${uiLabelMap.CompanyProject}</a></li>
		<li class="col-md-3 <#if parameters.detailId?? && parameters.detailId = "plan">active</#if>" ><a href="/products/p_${productId}?detailId=plan"><i class="fa fa-calendar"></i>${uiLabelMap.FinancingPlan}</a></li>
		<li class="col-md-3 <#if parameters.detailId?? && parameters.detailId = "dynamic">active</#if>" ><a href="/products/p_${productId}?detailId=dynamic"><i class="fa fa-calendar"></i>${uiLabelMap.CompanyDynamic}</a></li>
	</ul>
	</div>
</div>
<#else>
	<div class="commparent noread" style="height: 600px;padding-top: 50px;">
		${uiLabelMap.YouMustBeInvestor}${uiLabelMap.OnlyCan}${uiLabelMap.Readmore}.
		<br>
		<#if userLogin?has_content && userLogin.userLoginId != "anonymous">
		<a href="<@ofbizUrl>verify</@ofbizUrl>" class="buttontext">${uiLabelMap.Gotoverify}</a>
		<#else>
		<a href="<@ofbizUrl>checkLogin</@ofbizUrl>" class="buttontext">${uiLabelMap.CommonLogin}</a>
		</#if>
   </div>
</#if>
