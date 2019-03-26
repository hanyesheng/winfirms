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
<div class="container space30">
<div class="tab-content project-tab-content">
	<div class="tab-pane active">
		<div class="row space30">
			<div class="col-md-10 col-md-offset-1">
				<table class="table table-bordered vertical-center vertical-center">
			      <thead>
			          <tr>
			            <th>${uiLabelMap.ActivityName}</th>
			            <th>${uiLabelMap.ActivityDescription}</th>
			            <th>${uiLabelMap.ProjectCreatedDate}</th>
			          </tr>
			        </thead>
			        <tbody>
			        <#list ProductAndRole as ProductAndRole>
				      <#list Product as Product>
				      	<#if ProductAndRole.productId = Product.productId>
				          <tr>
				            <td valign="center">
				            	<img alt="Large Image" src="<@ofbizContentUrl>${Product.largeImageUrl!}</@ofbizContentUrl>" width="100px"/>
				              <a href="/store/products/p_${Product.productId}" target="_blank">
				              ${Product.productName?default("No Name")}</a>
				            </td>
				            <td valign="center">
				              ${Product.description!}
				            </td>
				            <td valign="center">
				              ${(product.releaseDate?substring(0,10))!}
				            </td>
				          </tr>
			          	</#if>
				      </#list>
			      	</#list>
			      </tbody>
			    </table>
			</div>
		</div>
	</div>
</div>
</div>