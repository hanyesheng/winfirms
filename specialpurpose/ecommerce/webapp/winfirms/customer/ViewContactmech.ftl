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

<#if party??>
<div class="md-card">
	<div class="md-card-toolbar">
    <h3 class="md-card-toolbar-heading-text">
        ${uiLabelMap.PartyContactInformation}
    </h3>
	</div>
	<div class="md-card-content uk-overflow-container">
	  <#if partyContactMechValueMaps?has_content>
	    <table class="uk-table uk-table-hover">
	    	<thead>
		      <tr valign="bottom">
		        <th>${uiLabelMap.PartyContactType}</th>
		        <th>${uiLabelMap.CommonInformation}</th>
		        <th>${uiLabelMap.PartySolicitingOk}?</th>
		        <th colspan="2" style="text-align: center;"><a style="display: inline-table;" href="<@ofbizUrl>editcontactmech</@ofbizUrl>" class="button btn-border color3 btn-xs btn-radius"><i class="fa fa-edit"></i>${uiLabelMap.CommonCreateNew}</a></th>
		      </tr>
		    </thead>
	      <#list partyContactMechValueMaps as partyContactMechValueMap>
	        <#assign contactMech = partyContactMechValueMap.contactMech! />
	        <#assign contactMechType = partyContactMechValueMap.contactMechType! />
	        <#assign partyContactMech = partyContactMechValueMap.partyContactMech! />
	          <tr>
	            <td align="left" valign="top">
	              ${contactMechType.get("description",locale)}
	            </td>
	            <td valign="top">
	              <#list partyContactMechValueMap.partyContactMechPurposes! as partyContactMechPurpose>
	                <#assign contactMechPurposeType = partyContactMechPurpose.getRelatedOne("ContactMechPurposeType", true) />
	                <div>
	                  <#if contactMechPurposeType??>
	                    ${contactMechPurposeType.get("description",locale)}
	                    <#if contactMechPurposeType.contactMechPurposeTypeId == "SHIPPING_LOCATION" && (profiledefs.defaultShipAddr)?default("") == contactMech.contactMechId>
	                      <span class="buttontextdisabled">${uiLabelMap.EcommerceIsDefault}</span>
	                    <#elseif contactMechPurposeType.contactMechPurposeTypeId == "SHIPPING_LOCATION">
	                      <form name="defaultShippingAddressForm" method="post" action="<@ofbizUrl>setprofiledefault/viewprofile</@ofbizUrl>">
	                        <input type="hidden" name="productStoreId" value="${productStoreId}" />
	                        <input type="hidden" name="defaultShipAddr" value="${contactMech.contactMechId}" />
	                        <input type="hidden" name="partyId" value="${party.partyId}" />
	                        <input type="submit" value="${uiLabelMap.EcommerceSetDefault}" class="button" />
	                      </form>
	                    </#if>
	                  <#else>
	                    ${uiLabelMap.PartyPurposeTypeNotFound}: "${partyContactMechPurpose.contactMechPurposeTypeId}"
	                  </#if>
	                  <#if partyContactMechPurpose.thruDate??>(${uiLabelMap.CommonExpire}:${partyContactMechPurpose.thruDate.toString()})</#if>
	                </div>
	              </#list>
	              <#if contactMech.contactMechTypeId! = "POSTAL_ADDRESS">
	                <#assign postalAddress = partyContactMechValueMap.postalAddress! />
	                <div>
	                  <#if postalAddress??>
	                    <#if postalAddress.toName?has_content>${uiLabelMap.CommonTo}: ${postalAddress.toName}<br /></#if>
	                    <#if postalAddress.attnName?has_content>${uiLabelMap.PartyAddrAttnName}: ${postalAddress.attnName}<br /></#if>
	                    ${postalAddress.address1}<br />
	                    <#if postalAddress.address2?has_content>${postalAddress.address2}<br /></#if>
	                    ${postalAddress.city}<#if partyContactMechValueMap.stateProvinceGeoName?has_content>,&nbsp;${partyContactMechValueMap.stateProvinceGeoName}</#if>&nbsp;${postalAddress.postalCode!}
	                    <#if partyContactMechValueMap.countryGeoName?has_content><br />${partyContactMechValueMap.countryGeoName}</#if>
	                    <#if (!postalAddress.countryGeoId?has_content || postalAddress.countryGeoId! = "USA")>
	                      <#assign addr1 = postalAddress.address1! />
	                      <#if (addr1.indexOf(" ") > 0)>
	                        <#assign addressNum = addr1.substring(0, addr1.indexOf(" ")) />
	                        <#assign addressOther = addr1.substring(addr1.indexOf(" ")+1) />
	                        <a target="_blank" href="${uiLabelMap.CommonLookupWhitepagesAddressLink}" class="linktext">(${uiLabelMap.CommonLookupWhitepages})</a>
	                      </#if>
	                    </#if>
	                  <#else>
	                    ${uiLabelMap.PartyPostalInformationNotFound}.
	                  </#if>
	                  </div>
	              <#elseif contactMech.contactMechTypeId! = "TELECOM_NUMBER">
	                <#assign telecomNumber = partyContactMechValueMap.telecomNumber!>
	                <div>
	                <#if telecomNumber??>
	                  ${telecomNumber.countryCode!}
	                  <#if telecomNumber.areaCode?has_content>${telecomNumber.areaCode}-</#if>${telecomNumber.contactNumber!}
	                  <#if partyContactMech.extension?has_content>ext&nbsp;${partyContactMech.extension}</#if>
	                <#else>
	                  ${uiLabelMap.PartyPhoneNumberInfoNotFound}.
	                </#if>
	                </div>
	              <#elseif contactMech.contactMechTypeId! = "EMAIL_ADDRESS">
	                  ${contactMech.infoString}
	                  <a href="mailto:${contactMech.infoString}" class="linktext">(${uiLabelMap.PartySendEmail})</a>
	              <#else>
	                ${contactMech.infoString!}
	              </#if>
	              <div>(${uiLabelMap.CommonUpdated}:&nbsp;${partyContactMech.fromDate.toString()})</div>
	              <#if partyContactMech.thruDate??><div>${uiLabelMap.CommonDelete}:&nbsp;${partyContactMech.thruDate.toString()}</div></#if>
	            </td>
	            <td align="center" valign="top"><div>(${partyContactMech.allowSolicitation!})</div></td>
	            <td align="center" valign="top">
	            	<div style="text-align: center;padding: 10px;">
	              		<a href="<@ofbizUrl>editcontactmech?contactMechId=${contactMech.contactMechId}</@ofbizUrl>" class="button btn-small btn-center btn-radius">${uiLabelMap.CommonUpdate}</a>
	              	</div>
	            </td>
	            <td align="center" valign="top">
	            	<div style="text-align: center;padding: 10px;">
	              	<form name= "deleteContactMech_${contactMech.contactMechId}" method= "post" action= "<@ofbizUrl>deleteContactMech</@ofbizUrl>">
	                <div>
	                <input type= "hidden" name= "contactMechId" value= "${contactMech.contactMechId}"/>
	                <a href='javascript:document.deleteContactMech_${contactMech.contactMechId}.submit()' class='button btn-small btn-center btn-radius'>${uiLabelMap.CommonExpire}</a>
	              	</div>
	              	</form>
	              	</div>
	            </td>
	          </tr>
	      </#list>
	    </table>
	  <#else>
	    <label>${uiLabelMap.PartyNoContactInformation}.</label><br />
	  </#if>
	  </div>
</div>
<#else>
    <h3>${uiLabelMap.PartyNoPartyForCurrentUserName}: ${userLogin.userLoginId}</h3>
</#if>
