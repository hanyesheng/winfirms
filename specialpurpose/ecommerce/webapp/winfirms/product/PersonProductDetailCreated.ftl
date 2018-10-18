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
<#list PersonList as PersonList>
	<#assign partyId = PersonList.partyId! />
</#list>
<div class="container space30 project-comm">
<div class="tab-content">
<div class="tab-pane active">
	<table class="table table-bordered">
      <thead>
          <tr>
            <th>${uiLabelMap.ProjectName}</th>
            <th>${uiLabelMap.ProjectDescription}</th>
          </tr>
        </thead>
        <tbody>
      <#list Product as Product>
          <tr>
            <td valign="center">
            	<img alt="Large Image" src="<@ofbizContentUrl>${Product.largeImageUrl!}</@ofbizContentUrl>" width="100px"/>
              <a href="<@ofbizUrl>product?product_id=${Product.productId}</@ofbizUrl>" target="_blank">${Product.productId} -
              ${Product.productName?default("No Name")}</a>
            </td>
            <td valign="center">
              ${Product.description!}
            </td>
          </tr>
      </#list>
      </tbody>
    </table>
</div>
</div>
</div>