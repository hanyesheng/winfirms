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
<#if productId??>
<div class="screenlet md-card">
  <div class="screenlet-title-bar md-card-toolbar">
    <h3>${uiLabelMap.ProjectField}&${uiLabelMap.FinancingStage}</h3>
  </div>
  <div class="screenlet-body md-card-content uk-overflow-container">
    <form method="post" action="<@ofbizUrl>updateFeatureToProductApplication</@ofbizUrl>" name="selectAllForm">
      <input type="hidden" name="_useRowSubmit" value="Y"/>
      <input type="hidden" name="_checkGlobalScope" value="Y"/>
      <input type="hidden" name="productId" value="${productId}"/>
      <table cellspacing="0" class="basic-table uk-table">
        <tr class="header-row">
          <td><b>${uiLabelMap.CommonId}</b></td>
          <td><b>${uiLabelMap.CommonDescription}</b></td>
          <td><b>${uiLabelMap.ProductType}</b></td>
          <td><b>${uiLabelMap.CommonFromDate}</b></td>
          <td></td>
        </tr>
  <#assign rowClass = "2">
  <#list productFeatureAndAppls as productFeatureAndAppl>
    <#if productFeatureAndAppl.uomId??>
        <#assign curProductFeatureUom = delegator.findOne("Uom",{"uomId",productFeatureAndAppl.uomId}, true)>
    </#if>
    <#assign curProductFeatureType = productFeatureAndAppl.getRelatedOne("ProductFeatureType", true)>
    <#assign curProductFeatureApplType = productFeatureAndAppl.getRelatedOne("ProductFeatureApplType", true)>
    <#assign curProductFeatureCategory = (productFeatureAndAppl.getRelatedOne("ProductFeatureCategory", true)!)>
        <tr id="productFeatureId_tableRow_${productFeatureAndAppl_index}" valign="middle"<#if rowClass == "1"> class="alternate-row"</#if>>
          <td>
          <input type="hidden" name="productId_o_${productFeatureAndAppl_index}" value="${(productFeatureAndAppl.productId)!}" />
          <input type="hidden" name="productFeatureId_o_${productFeatureAndAppl_index}" value="${(productFeatureAndAppl.productFeatureId)!}" />
          <input type="hidden" name="fromDate_o_${productFeatureAndAppl_index}" value="${(productFeatureAndAppl.fromDate)!}" />
          <a href="javascript:void(0)" class="buttontext">
              ${(productFeatureAndAppl.productFeatureId)!}</a></td>
          <td>${(productFeatureAndAppl.get("description",locale))!}</td>
          <td>${(curProductFeatureType.get("description",locale))?default((productFeatureAndAppl.productFeatureTypeId)!)}</td>
          <#assign hasntStarted = false>
    			<#if (productFeatureAndAppl.getTimestamp("fromDate"))?? && Static["org.apache.ofbiz.base.util.UtilDateTime"].nowTimestamp().before(productFeatureAndAppl.getTimestamp("fromDate"))> <#assign hasntStarted = true></#if>
          <td <#if hasntStarted> style='color: red;'</#if>>${(productFeatureAndAppl.fromDate)!}</td>
          <td>
            <a href="javascript:document.RemoveFeatureFromProduct_o_${productFeatureAndAppl_index}.submit()" class="buttontext">${uiLabelMap.CommonDelete}</a>
          </td>
        </tr>
			    <#-- toggle the row color -->
			    <#if rowClass == "2">
			      <#assign rowClass = "1">
			    <#else>
			      <#assign rowClass = "2">
			    </#if>
			  </#list>
			</table>
    </form>
  <#list productFeatureAndAppls as productFeatureAndAppl>
    <form name= "RemoveFeatureFromProduct_o_${productFeatureAndAppl_index}" method= "post" action= "<@ofbizUrl>removeFeatureFromProduct</@ofbizUrl>">
      <input type= "hidden" name= "productId" value= "${(productFeatureAndAppl.productId)!}"/>
      <input type= "hidden" name= "productFeatureId" value= "${(productFeatureAndAppl.productFeatureId)!}"/>
      <input type= "hidden" name= "fromDate" value= "${(productFeatureAndAppl.fromDate)!}"/>
    </form>
  </#list>
  </div>
</div>

<div class="screenlet md-card">
  <div class="screenlet-body md-card-content uk-overflow-container">
    <form method="post" action="<@ofbizUrl>applyFeatureToProduct</@ofbizUrl>" name="addFeatureById">
      <input type="text" disabled="disabled" value="${uiLabelMap.FinancingStage}"/>
      <input type="hidden" name="productId" value="${productId}"/>
      <input type="hidden" name="fromDate" value="${nowTimestamp}"/>
      <input type="hidden" name="productFeatureApplTypeId" value="STANDARD_FEATURE"/>
      <select name="productFeatureId" id="productFeatureId">
	    <#list ProductFeatureFinancing as ProductFeatureFinancing>
	      <option value="${ProductFeatureFinancing.productFeatureId!}">${ProductFeatureFinancing.description!}</option>
	    </#list>
	    </select>
      <input type="submit" value="${uiLabelMap.CommonAdd}"/>
    </form>
    <form method="post" action="<@ofbizUrl>applyFeatureToProduct</@ofbizUrl>" name="addFeatureById">
    	<input type="text" disabled="disabled" value="${uiLabelMap.ProjectField}"/>
      <input type="hidden" name="productId" value="${productId}"/>
      <input type="hidden" name="fromDate" value="${nowTimestamp}"/>
      <input type="hidden" name="productFeatureApplTypeId" value="STANDARD_FEATURE"/>
      <select name="productFeatureId" id="productFeatureId">
	    <#list ProductFeatureFieldabout as ProductFeatureFieldabout>
	      <option value="${ProductFeatureFieldabout.productFeatureId!}">${ProductFeatureFieldabout.description!}</option>
	    </#list>
	    </select>
      <input type="submit" value="${uiLabelMap.CommonAdd}"/>
    </form>
  </div>
</div>
</#if>
