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
<#list ProductContentVideoIntro?sort_by('fromDate') as ProductContentVideoIntro>
	<#assign drDataResourceId = ProductContentVideoIntro.drDataResourceId! />
	<#assign mimeTypeId = ProductContentVideoIntro.mimeTypeId! />
</#list>
<#list PersonList as PersonList>
	<#assign partyId = PersonList.partyId! />
	<#assign partyComments = PersonList.comments! />
	<#if PersonList.nickname??>
		<#assign partyName = PersonList.nickname />
	<#else>
		<#assign partyName = product.createdByUserLogin />
	</#if>
</#list>
<#list ProductContentVideoPlaying as ProductContentVideoPlaying>
	<#if parameters.videoId?? && ProductContentVideoPlaying.drDataResourceId = parameters.videoId>
		<#assign isPlaying = "Y">
		<#assign namePlaying = ProductContentVideoPlaying.description!>
	</#if>
</#list>
<#assign productLargeImageUrl = productContentWrapper.get("LARGE_IMAGE_URL", "url")! />
<div class="parallax-bg1 padding30" style="background-image: url(/images/winfirms/p_header.jpg) !important;">
	<div class="container">
		<div class="col-md-8 col-md-offset-2 text-center white">
			<h3 class="uppercase white">${productContentWrapper.get("PRODUCT_NAME", "html")!}</h3>
			<#if isPlaying?? && isPlaying = "Y"><p class="uppercase white">${uiLabelMap.VideoPlaying}&nbsp;&nbsp;:&nbsp;&nbsp;${namePlaying!}</p></#if>
			<div class="col-md-10 col-md-offset-1 text-center space20">
				<div class="dm-wrap"><span style="width:100%;background-color: white;height: 2px;"></span></div>
			</div>
		</div>
		<#if isPlaying?? && isPlaying = "Y">
			<div class="col-md-10 col-md-offset-1 white space40">
				<video id="video-playing" class="video-js" controls preload="none"  style="border-radius: 5px;min-width: 200px;height: 100%;width: 100%;"
					  poster="<@ofbizContentUrl>${productLargeImageUrl!}</@ofbizContentUrl>" data-setup="{}">
			        <source src="/images/uploads/1528529229818/${parameters.videoId}.mp4" type="video/mp4">
			    </video>
			    <script type="text/javascript">
					var myPlayer = videojs('video-playing');
					videojs("video-playing").ready(function(){
						var myPlayer = this;
						myPlayer.play();
					});
				</script>
			</div>
		<#else>
			<div class="col-md-8 col-md-offset-2 white table-responsive space40">
				<table class="table table-bordered vertical-center text-center">
					<tbody>
						<tr>
							<#if mimeTypeId?? && mimeTypeId?contains("video")>
								<td rowspan="5" width="50%">
									<video id="my-video" class="video-js" controls preload="none"  style="border-radius: 5px;min-width: 200px;height: 100%;width: 100%;"
										  poster="<@ofbizContentUrl>${productLargeImageUrl!}</@ofbizContentUrl>" data-setup="{}">
								        <source src="/images/uploads/1528529229818/${drDataResourceId}.mp4" type="video/mp4">
								    </video>
								</td>
							</#if>
							<td style="white-space: nowrap;">${uiLabelMap.CourseTeacher}</td>
							<td style="white-space: nowrap;"><#if partyName??>${partyName!}</#if></td>
							<td style="white-space: nowrap;">${uiLabelMap.ProjectCreatedDate}</td>
							<td style="white-space: nowrap;">${(product.releaseDate?substring(0,10))!}</td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">${uiLabelMap.TeacherInfo}</td>
							<td colspan="3"><#if partyComments??>${partyComments!}</#if></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">${uiLabelMap.CourseInfo}</td>
							<td colspan="3">${product.description!}</td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">${uiLabelMap.CommonTag}</td>
							<td colspan="3">
								<#list ProductTag as ProductTag>
									<span class="label label-info">${ProductTag.keyword!}</span>
								</#list>
							</td>
						</tr>
						<tr>
							<td colspan="4" id="collection">
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
								            	<a href="javascript:addShoplistSubmit();" class="buttontext white"><i class="fa fa-heart-o"></i>&nbsp;&nbsp;${uiLabelMap.collecte}</a>
								          	</fieldset>
								        </form>
								        </#if>
							        <#else>
							        <form name="updateList" method="post" action="<@ofbizUrl>createEmptyShoppingList</@ofbizUrl>">
							          <input type="hidden" name="partyId" value="${userLogin.partyId}">
							          <input type="hidden" name="shoppingListTypeId" value="COLLECTE">
						              <input type="hidden" name="listName" value="COLLECTE">
						              <input type="hidden" name="isActive" value="Y">
				              			<a href="javascript:document.updateList.submit();" class="buttontext white">${uiLabelMap.CreateList}</a>
							        </form>
							        </#if>
						      	<#else>
							        ${uiLabelMap.OrderYouMust}
							        <a href="<@ofbizUrl>checkLogin</@ofbizUrl>" class="buttontext">${uiLabelMap.CommonBeLogged}</a>
							        ${uiLabelMap.AddItemsToShoppingList}.
						      	</#if>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</#if>
	</div>
</div>
<div class="project product-tab">
<div class="container">
	<ul class="nav nav-tabs">
		<li class="<#if !parameters.detailId??>active</#if> col-md-3" ><a href="/store/products/p_${productId}"><i class="fa fa-fire"></i>${uiLabelMap.CourseList}</a></li>
		<li class="col-md-3 <#if parameters.detailId?? && parameters.detailId = "description">active</#if>" ><a href="/store/products/p_${productId}?detailId=description"><i class="fa fa-pencil"></i>${uiLabelMap.CourseInfo}</a></li>
		<li class="col-md-3 <#if parameters.detailId?? && parameters.detailId = "discuss">active</#if>" ><a href="/store/products/p_${productId}?detailId=discuss"><i class="fa fa-pencil"></i>${uiLabelMap.CourseDiscuss}</a></li>
		<li class="col-md-3 <#if parameters.detailId?? && parameters.detailId = "download">active</#if>" ><a href="/store/products/p_${productId}?detailId=download"><i class="fa fa-download"></i>${uiLabelMap.FileDownload}</a></li>
	</ul>
</div>
</div>
