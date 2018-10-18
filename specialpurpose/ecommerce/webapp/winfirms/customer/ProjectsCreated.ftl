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
<#assign nowTimestamp = Static["org.apache.ofbiz.base.util.UtilDateTime"].nowTimestamp()>
<div class="md-card">
	<div class="md-card-toolbar">
    	<h3 class="md-card-toolbar-heading-text">${uiLabelMap.MyProjectCreate}</h3>
   	</div>
   	<div class="md-card-content uk-overflow-container">
	    <table class="uk-table uk-table-bordered uk-table-hover">
	      	<thead>
		          <tr>
		            <th>${uiLabelMap.ProjectName}</th>
		            <th>${uiLabelMap.ProjectDescription}</th>
		            <th colspan="2"> </th>
		          </tr>
	        </thead>
	        <tbody>
	    	<#assign CreatedCol = 0>
	      	<#list Product as Product>
	      		<#assign IfShow = "0">
	            <#list ProductCategoryMember as ProductCategoryMember>
			  		<#assign categoryid = ProductCategoryMember.productCategoryId>
			  		<#if ProductCategoryMember.productId = Product.productId>
			  			<#assign fromDate = ProductCategoryMember.fromDate>
			  			<#assign IfShow = "1">
			  		</#if>
	            </#list>
	          	<tr>
	            <td valign="center">
	            	<#if Product.largeImageUrl?has_content><img alt="Large Image" src="<@ofbizContentUrl>${Product.largeImageUrl!}</@ofbizContentUrl>" width="100px"/></#if>
	              <a href="<@ofbizUrl>product?product_id=${Product.productId}</@ofbizUrl>" target="_blank">${Product.productId} -
	              ${Product.productName?default("No Name")}</a>
	            </td>
	            <td valign="center">
	              ${Product.description!}
	            </td>
	            <td valign="center">
	              <a href="<@ofbizUrl>projectInfo?productId=${Product.productId}</@ofbizUrl>" target="_blank" class="button btn-border color3 btn-xs btn-radius" style="display: inline-table;"><i class="fa fa-edit"></i>&nbsp;${uiLabelMap.CommonEdit}</a>
	            </td>
	          </tr>
	          <#assign CreatedCol = CreatedCol + 1>
	      	</#list>
	      </tbody>
	    </table>
	</div>
</div>
