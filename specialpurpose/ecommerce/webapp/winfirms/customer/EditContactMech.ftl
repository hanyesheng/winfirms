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
<div class="md-card">
<#if canNotView>
	<div class="md-card-toolbar">
    <h3 class="md-card-toolbar-heading-text">${uiLabelMap.PartyContactInfoNotBelongToYou}.</h3>
		<a href="<@ofbizUrl>viewcontactmech</@ofbizUrl>" class="button">${uiLabelMap.CommonBack}</a>
	</div>
<#else>
  <#if !contactMech??>
  <!-- 新建联系信息 -->
    <#if !requestParameters.preContactMechTypeId?? && !preContactMechTypeId??>
    <div class="md-card-toolbar">
    <h3 class="md-card-toolbar-heading-text">${uiLabelMap.PartyCreateNewContactInfo}</h3>
    </div>
    <form method="post" action='<@ofbizUrl>editcontactmechnosave</@ofbizUrl>' name="createcontactmechform">
      <div class="md-card-content">
        <table class="uk-table">
          <tr>
            <td>${uiLabelMap.PartySelectContactType}:</td>
            <td>
              <select name="preContactMechTypeId" class='form-control'>
                <#list contactMechTypes as contactMechType>
                  <option value='${contactMechType.contactMechTypeId}'>
                    ${contactMechType.get("description",locale)}
                  </option>
                </#list>
              </select>
            </td>
            <td>
            	<div style="text-align: center;padding: 10px;">
	          		<a href="javascript:document.createcontactmechform.submit()" class="button btn-small btn-center btn-radius">${uiLabelMap.CommonCreate}</a>
	          	</div>
	          </td>
            <td>
            	<div style="text-align: center;padding: 10px;">
            		<a href="<@ofbizUrl>viewcontactmech</@ofbizUrl>" class="button btn-small btn-center btn-radius">${uiLabelMap.CommonGoBack}</a>
	          	</div>
	          </td>
          </tr>
        </table>
      </div>
    </form>
    </#if>
  </#if>

  <#if contactMechTypeId??>
    <#if !contactMech??>
    <div class="md-card-toolbar">
    <h3 class="md-card-toolbar-heading-text">${uiLabelMap.PartyCreateNewContactInfo}</h3>
    </div>
    <div class="md-card-content">
    <table class="uk-table">
    <form method="post" action='<@ofbizUrl>${reqName}</@ofbizUrl>' name="editcontactmechform" id="editcontactmechform">
    <div>
      <input type='hidden' name='contactMechTypeId' value='${contactMechTypeId}'/>
      <#if contactMechPurposeType??>
        <div>(${uiLabelMap.PartyNewContactHavePurpose} "${contactMechPurposeType.get("description",locale)!}")</div>
      </#if>
      <#if cmNewPurposeTypeId?has_content>
        <input type='hidden' name='contactMechPurposeTypeId' value='${cmNewPurposeTypeId}'/>
      </#if>
      <#if preContactMechTypeId?has_content>
        <input type='hidden' name='preContactMechTypeId' value='${preContactMechTypeId}'/>
      </#if>
      <#if paymentMethodId?has_content>
        <input type='hidden' name='paymentMethodId' value='${paymentMethodId}'/>
      </#if>
    <#else>
      <div class="md-card-toolbar">
    <h3 class="md-card-toolbar-heading-text">${uiLabelMap.PartyEditContactInfo}</h3>
    </div>
    <div class="md-card-content">
    <table class="uk-table">
      <tr>
        <td align="right" valign="top">${uiLabelMap.PartyContactPurposes}</td>
        <td>
          <table class="uk-table">
            <#list partyContactMechPurposes! as partyContactMechPurpose>
              <#assign contactMechPurposeType = partyContactMechPurpose.getRelatedOne("ContactMechPurposeType", true) />
              <tr>
                <td>
                  <#if contactMechPurposeType??>
                  ${contactMechPurposeType.get("description",locale)}
                  <#else>
                  ${uiLabelMap.PartyPurposeTypeNotFound}: "${partyContactMechPurpose.contactMechPurposeTypeId}"
                  </#if>
                  (${uiLabelMap.CommonSince}:${partyContactMechPurpose.fromDate.toString()})
                  <#if partyContactMechPurpose.thruDate??>(${uiLabelMap.CommonExpires}
                    :${partyContactMechPurpose.thruDate.toString()})</#if>
                </td>
                <td>
                  <form name="deletePartyContactMechPurpose_${partyContactMechPurpose.contactMechPurposeTypeId}"
                        method="post" action="<@ofbizUrl>deletePartyContactMechPurpose</@ofbizUrl>">
                    <div style="text-align: center;padding: 10px;">
                      <input type="hidden" name="contactMechId" value="${contactMechId}"/>
                      <input type="hidden" name="contactMechPurposeTypeId"
                             value="${partyContactMechPurpose.contactMechPurposeTypeId}"/>
                      <input type="hidden" name="fromDate" value="${partyContactMechPurpose.fromDate}"/>
                      <input type="hidden" name="useValues" value="true"/>
                      <a href='javascript:document.deletePartyContactMechPurpose_${partyContactMechPurpose.contactMechPurposeTypeId}.submit()'
                         class='button btn-small btn-center btn-radius'>&nbsp;${uiLabelMap.CommonDelete}&nbsp;</a>
                    </div>
                  </form>
                </td>
              </tr>
            </#list>
            <#if purposeTypes?has_content>
              <tr>
                <td>
                  <form method="post" action='<@ofbizUrl>createPartyContactMechPurpose</@ofbizUrl>'
                        name='newpurposeform'>
                    <div>
                      <input type="hidden" name="contactMechId" value="${contactMechId}"/>
                      <input type="hidden" name="useValues" value="true"/>
                      <select name='contactMechPurposeTypeId' class='form-control'>
                        <option></option>
                        <#list purposeTypes as contactMechPurposeType>
                          <option value='${contactMechPurposeType.contactMechPurposeTypeId}'>
                            ${contactMechPurposeType.get("description",locale)}
                          </option>
                        </#list>
                      </select>
                    </div>
                  </form>
                </td>
                <td>
                	<div style="text-align: center;padding: 10px;">
                  <a href='javascript:document.newpurposeform.submit()' class='button btn-small btn-center btn-radius'>${uiLabelMap.PartyAddPurpose}</a>
                  </div>
                </td>
              </tr>
            </#if>
          </table>
        </td>
      </tr>
    <form method="post" action='<@ofbizUrl>${reqName}</@ofbizUrl>' name="editcontactmechform" id="editcontactmechform">
      <input type="hidden" name="contactMechId" value='${contactMechId}'/>
      <input type="hidden" name="contactMechTypeId" value='${contactMechTypeId}'/>
    </#if>

    <#if contactMechTypeId = "POSTAL_ADDRESS">
      <tr>
        <td align="right" valign="top">${uiLabelMap.PartyToName}</td>
        <td>
          <input type="text" class='form-control' size="30" maxlength="60" name="toName"
              value="${postalAddressData.toName!}"/>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">${uiLabelMap.PartyAttentionName}</td>
        <td>
          <input type="text" class='form-control' size="30" maxlength="60" name="attnName"
              value="${postalAddressData.attnName!}"/>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">${uiLabelMap.PartyAddressLine1}</td>
        <td>
          <input type="text" class='form-control' size="30" maxlength="30" name="address1"
              value="${postalAddressData.address1!}"/>*
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">${uiLabelMap.PartyAddressLine2}</td>
        <td>
          <input type="text" class='form-control' size="30" maxlength="30" name="address2"
              value="${postalAddressData.address2!}"/>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">${uiLabelMap.PartyCity}</td>
        <td>
          <input type="text" class='form-control' size="30" maxlength="30" name="city" value="${postalAddressData.city!}"/>*
        </td>
      </tr>
      <tr>
        <td align="right" valign="top"> ${uiLabelMap.PartyState}
        <td>
          <select name="stateProvinceGeoId" id="editcontactmechform_stateProvinceGeoId" class='form-control' style="width: 60%;">
          </select>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">${uiLabelMap.PartyZipCode}</td>
        <td>
          <input type="text" class='form-control' size="12" maxlength="10" name="postalCode"
                 value="${postalAddressData.postalCode!}"/>*
        </td>
      </tr>
      <tr>
        <td align="right" valign="top">${uiLabelMap.CommonCountry}</td>
        <td>
          <select name="countryGeoId" id="editcontactmechform_countryGeoId" class='form-control' style="width: 60%;">
            ${screens.render("component://common/widget/CommonScreens.xml#countries")}
            <#if (postalAddress??) && (postalAddress.countryGeoId??)>
              <#assign defaultCountryGeoId = postalAddress.countryGeoId>
            <#else>
              <#assign defaultCountryGeoId = Static["org.apache.ofbiz.entity.util.EntityUtilProperties"]
                  .getPropertyValue("general", "country.geo.id.default", delegator)>
            </#if>
            <option selected="selected" value="${defaultCountryGeoId}">
              <#assign countryGeo = delegator.findOne("Geo",Static["org.apache.ofbiz.base.util.UtilMisc"]
                  .toMap("geoId",defaultCountryGeoId), false)>
              ${countryGeo.get("geoName",locale)}
            </option>
          </select>
        </td>
      </tr>
    <#elseif contactMechTypeId = "TELECOM_NUMBER">
      <tr>
        <td align="right" valign="top">${uiLabelMap.PartyPhoneNumber}</td>
        <td>
          <input type="text" class='form-control' style="width: 10%;" name="countryCode"
              value="86"/>&nbsp;-&nbsp;
          <input type="hidden" class='form-control' size="4" maxlength="10" name="areaCode"
              value="${telecomNumberData.areaCode!}"/>
          <input type="text" class='form-control' style="width: 40%;" name="contactNumber"
              value="${telecomNumberData.contactNumber!}"/>
          <input type="hidden" class='form-control' size="6" maxlength="10"
              name="extension" value="${partyContactMechData.extension!}"/>
        </td>
      </tr>
      <tr>
        <td align="right" valign="top"></td>
        <td>[${uiLabelMap.CommonCountryCode}] [${uiLabelMap.PartyContactNumber}]
        </td>
      </tr>
    <#elseif contactMechTypeId = "EMAIL_ADDRESS">
      <tr>
        <td align="right" valign="top">${uiLabelMap.PartyEmailAddress}</td>
        <td>
          <input type="text" class='form-control' size="60" maxlength="255" name="emailAddress"
              value="<#if tryEntity>${contactMech.infoString!}<#else>${requestParameters.emailAddress!}</#if>"/>*
        </td>
      </tr>
    <#else>
      <tr>
        <td align="right" valign="top">${contactMechType.get("description",locale)!}</td>
        <td>
          <input type="text" class='form-control' size="60" maxlength="255" name="infoString"
              value="${contactMechData.infoString!}"/>*
        </td>
      </tr>
    </#if>
    <tr>
      <td align="right" valign="top">${uiLabelMap.PartyAllowSolicitation}?</td>
      <td>
        <select name="allowSolicitation" class='form-control' style="width: 60%;">
          <#if (((partyContactMechData.allowSolicitation)!"") == "Y")>
            <option value="Y">${uiLabelMap.CommonY}</option></#if>
          <#if (((partyContactMechData.allowSolicitation)!"") == "N")>
            <option value="N">${uiLabelMap.CommonN}</option></#if>
          <option></option>
          <option value="Y">${uiLabelMap.CommonY}</option>
          <option value="N">${uiLabelMap.CommonN}</option>
        </select>
      </td>
    </tr>
    <tr>
	    <td colspan="2">
					<div style="text-align: center;padding: 10px;">
			  	<a href="javascript:document.editcontactmechform.submit()" class="md-btn md-btn-primary">${uiLabelMap.CommonCreate}</a>
					<a href="<@ofbizUrl>viewcontactmech</@ofbizUrl>" class="md-btn md-btn-primary">${uiLabelMap.CommonGoBack}</a>
			  	</div>
		  </td>
	  </tr>
  </form>
  </table>
  </div>
  <#else>
  </#if>
</#if>
</div>