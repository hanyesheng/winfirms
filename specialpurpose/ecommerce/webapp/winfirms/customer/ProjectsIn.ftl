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

<div class="md-card" style="margin-top: 15px;">
	<div class="md-card-toolbar">
    	<h3 class="md-card-toolbar-heading-text">${uiLabelMap.MyProjectJoin}</h3>
   	</div>
   	<div class="md-card-content uk-overflow-container">
    <table class="uk-table uk-table-bordered uk-table-hover">
      <thead>
          <tr>
            <th>${uiLabelMap.ProjectName}</th>
            <th>${uiLabelMap.ProjectDescription}</th>
            <th>${uiLabelMap.CommonRole}</th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
    	<#assign ProCol = 0>
        <#list ProductAndRole as ProductAndRole>
	      	<#list Product as Product>
	      		<#if ProductAndRole.productId = Product.productId>
	          	<tr>
		            <td valign="center">
		            	<#if Product.largeImageUrl?has_content><img alt="Large Image" src="<@ofbizContentUrl>${Product.largeImageUrl!}</@ofbizContentUrl>" width="100px"/></#if>
		              <a href="<@ofbizUrl>product?product_id=${Product.productId}</@ofbizUrl>" target="_blank">${Product.productId} -
		              ${Product.productName?default("No Name")}</a>
		            </td>
		            <td valign="center">
		              ${Product.description!}
		            </td>
		            <td>
		            	<#if ProductAndRole.roleTypeId = "_NA_"><span class="uk-badge"><i class="material-icons md-color-light-green-50">people</i>&nbsp;${uiLabelMap.Teammates}[${uiLabelMap.CommonNormal}]</span></#if>
                		<#if ProductAndRole.roleTypeId = "BUSINESSMAN"><span class="uk-badge uk-badge-primary"><i class="material-icons md-color-light-green-50">person</i>&nbsp;${uiLabelMap.Teammates}[${uiLabelMap.CommonManager}]</span></#if>
                	</td>
		            <td>
		            	<#if ProductAndRole.roleTypeId = "BUSINESSMAN">
		            		<a href="<@ofbizUrl>projectInfo?productId=${Product.productId}</@ofbizUrl>" class="button btn-border color3 btn-xs btn-radius" style="display: inline-table;">
		            			<i class="fa fa-edit"></i>&nbsp;${uiLabelMap.CommonEdit}
		            		</a>
		            	</#if>
		            </td>
		            <td valign="center">
		               <form method="post" action="<@ofbizUrl>removeProductFromParty</@ofbizUrl>" name="UpdateProductRole_${ProCol}">
		               	<input name="fromDate" value="${ProductAndRole.fromDate}" type="hidden">
		               	<input name="roleTypeId" value="_NA_" type="hidden">
		               	<input name="productId" value="${ProductAndRole.productId}" type="hidden">
		               	<input name="partyId" value="${ProductAndRole.partyId}" type="hidden">
		               </form>
		               <a class="button btn-border color3 btn-xs btn-radius" href="javascript:document.UpdateProductRole_${ProCol}.submit()"><i class="fa fa-edit"></i>${uiLabelMap.CommonQuit}</a>
		            </td>
	          	</tr>
	          	<#assign ProCol = ProCol + 1>
	          	</#if>
	      	</#list>
	    </#list>
      </tbody>
    </table>
	</div>
</div>
