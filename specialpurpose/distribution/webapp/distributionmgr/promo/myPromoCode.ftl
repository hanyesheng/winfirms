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
<div class="screenlet md-card">
	<div class="screenlet-body md-card-content uk-overflow-container">
		<table cellspacing="0" class="basic-table hover-bar uk-table uk-table-hover">
  			<thead>
  				<tr style="color: white;">
  					<td width="150px">${uiLabelMap.PromoCode}</td>
  					<td>${uiLabelMap.PartyOwner}</td>
  					<td>${uiLabelMap.CommonStatus}</td>
  				</tr>
  			</thead>
  			<tbody>
  				<#list ProductStorePromoAndAppl as ProductStorePromoAndAppl>
	  				<#list ProductPromo as ProductPromo>
	  					<#if ProductPromo.productPromoId = ProductStorePromoAndAppl.productPromoId>
		  					<#assign PromoName = ProductPromo.promoName!>
		  					<#assign PromoText = ProductPromo.promoText!>
  						</#if>
	  				</#list>
	  				<#assign hasCode = "N">
	  				<#list ProductPromoCode as ProductPromoCode>
	  					<#if ProductPromoCode.productPromoId = ProductStorePromoAndAppl.productPromoId>
	  						<#assign hasCode = "Y">
	  					</#if>
	  				</#list>
	  				<tr>
	  					<td colspan="3" style="background-color: #f1f0f0;">
	  						#${uiLabelMap.PromoActivity}#&nbsp;&nbsp;${PromoName!}[${ProductStorePromoAndAppl.productPromoId}]-${StringUtil.wrapString(PromoText!)}
	  						<button class="md-btn md-btn-small md-btn-flat md-btn-flat-primary" data-uk-modal="{target:'#promoProduct'}">${uiLabelMap.PromoProduct}</button>
	  						<#if hasCode = "N">
			  					<form style="display: inline-block;" method="post" action="<@ofbizUrl>createProductPromoCodeSet</@ofbizUrl>" id="createProductPromoCodeSet_${ProductStorePromoAndAppl.productPromoId}">
			            			<input type="hidden" name="productPromoId" value="${ProductStorePromoAndAppl.productPromoId}"/>
					                <input type="hidden" name="promoCodeLayout" value="smart"/>
					                <input type="hidden" name="codeLength" value="8"/>
					                <input type="hidden" name="userEntered" value="Y"/>
					                <input type="hidden" name="requireEmailOrParty" value="N"/>
					                <input type="hidden" name="useLimitPerCode" value="1"/>
					                <input type="hidden" name="quantity" value="10"/>
					                <a class="md-btn md-btn-small md-btn-flat md-btn-flat-primary" href="javascript:document.getElementById('createProductPromoCodeSet_${ProductStorePromoAndAppl.productPromoId}').submit()">${uiLabelMap.CreatePromoCode}</a>
				               	</form>
			  				</#if>
	  					</td>
	  				</tr>
	  				<div class="uk-modal" id="promoProduct">
		                <div class="uk-modal-dialog">
		                	<div class="uk-modal-header">
							    <h3 class="uk-modal-title">${uiLabelMap.PromoProduct} <i class="material-icons" data-uk-tooltip="{pos:'top',cls:'long-text'}" title="${uiLabelMap.CodeForPromoProduct}">&#xE8FD;</i></h3>
							</div>
							<div class="uk-modal-content">
								<ul class="md-list md-list-addon">
									<#list ProductPromoProduct as ProductPromoProduct>
										<#if ProductPromoProduct.productPromoId = ProductStorePromoAndAppl.productPromoId>
											<#list Product as Product><#if ProductPromoProduct.productId = Product.productId>
											<li style="min-height: 0px;margin-left: 0px;"><a href="/products/p_${ProductPromoProduct.productId}" target="_blank">${Product.productName!}</a>[${ProductPromoProduct.productId}]</li>
											</#if></#list>
										</#if>
									</#list> 
								</ul>
							</div>
							<div class="uk-modal-footer uk-text-right">
							    <button type="button" class="md-btn md-btn-flat uk-modal-close">${uiLabelMap.CommonClose}</button>
							</div>
		                </div>
		          </div>
	  				<#list ProductPromoCode as ProductPromoCode>
	  					<!--如果促销是规定店铺的-列出规定店铺所有推荐人的促销码-->
	  					<#if ProductPromoCode.productPromoId = ProductStorePromoAndAppl.productPromoId>
	  						<tr>
								<td>${ProductPromoCode.productPromoCodeId}</td>
								<td>
									<#assign hasCodeParty = "N">
									<#list ProductPromoCodeParty as ProductPromoCodeParty>
										<!--优惠码是否被分配给会员-->
										<#if ProductPromoCodeParty.productPromoCodeId = ProductPromoCode.productPromoCodeId>
											<#list Person as Person>
												<#if ProductPromoCodeParty.partyId = Person.partyId>
													<#if Person.nickname??>
														<#assign PromoCodePartyName = Person.nickname!>
													<#else>
														<#assign PromoCodePartyName = Person.partyId!>
													</#if>
													<#assign hasCodeParty = "Y">
												</#if>
											</#list>
											<div><span class="uk-badge uk-badge-primary">${PromoCodePartyName!}-${ProductPromoCodeParty.partyId}</span>
							            	<form style="display: inline-block;" method="post" action="<@ofbizUrl>deleteProductPromoCodeParty</@ofbizUrl>" id="deleteProductPromoCodeParty_${ProductPromoCode_index}_${ProductPromoCodeParty_index}">
									            <input type="hidden" name="productPromoCodeId" value="${ProductPromoCode.productPromoCodeId}" />
									            <input type="hidden" name="partyId" value="${ProductPromoCodeParty.partyId}" />
									            <input type="hidden" name="productPromoId" value="${ProductPromoCode.productPromoId}" />
												<a href="javascript:document.getElementById('deleteProductPromoCodeParty_${ProductPromoCode_index}_${ProductPromoCodeParty_index}').submit();" class="button btn-border color3 btn-xs btn-radius" type="submit">${uiLabelMap.CommonDelete}</a>
											</form></div>
										</#if>
									</#list>
									<#if hasCodeParty = "N">
										<form method="post" action="<@ofbizUrl>createProductPromoCodeParty</@ofbizUrl>" id="createProductPromoCodeParty_${ProductStorePromoAndAppl_index}_${ProductPromoCode_index}">
						                    <input type="hidden" name="productPromoCodeId" value="${ProductPromoCode.productPromoCodeId!}"/>
						                    <input type="hidden" name="productPromoId" value="${ProductPromoCode.productPromoId}"/>
						                    <span class="label">${uiLabelMap.GivePromoCodeToParty}:</span>
						                    <select name="partyId">
						                    	<option value=""></option>
						                    	<#list PartyRelationship as PartyRelationship>
						                    		<#assign hasParty = "">
						                    		<#list ProductPromoCodeParty as IfCodeHasParty>
						                    			<#if IfCodeHasParty.partyId = PartyRelationship.partyIdTo>
						                    				<#assign hasParty = "Y">
						                    			</#if>
						                    		</#list>
						                    		<#assign partyName = "">
						  							<#list Person as Person>
						  								<#if Person.partyId = PartyRelationship.partyIdTo>
						  									<#assign partyName = Person.nickname!>
						  								</#if>
						  							</#list>
						                    		<option <#if hasParty = "Y">disabled="disabled"</#if> value="${PartyRelationship.partyIdTo}">
						  							${partyName!}-[${PartyRelationship.partyIdTo}]</option>
						                    	</#list>
						                    </select>
						                    <a href="javascript:document.getElementById('createProductPromoCodeParty_${ProductStorePromoAndAppl_index}_${ProductPromoCode_index}').submit();">${uiLabelMap.CommonAdd}</a>
						               		<span class="uk-badge">${uiLabelMap.HasCodeUnabled}</span>
										</form>
					              	</#if>
								</td>
								<td>
									<#assign hasCodeUsed = "N">
									<#list ProductPromoUseCheck as ProductPromoUseCheck>
										<#if ProductPromoUseCheck.productPromoCodeId = ProductPromoCode.productPromoCodeId>
											<span class="uk-badge uk-badge-success">${uiLabelMap.Used}[${ProductPromoUseCheck.partyId}]</span>
											<#assign hasCodeUsed = "Y">
										</#if>
									</#list>
									<#if hasCodeUsed = "N">
										<span class="uk-badge uk-badge-warning">${uiLabelMap.Unused}</span>
									</#if>
								</td>
							</tr>
	  					</#if>
	  				</#list>
  				</#list>
  			</tbody>
		</table>
	</div>
</div>