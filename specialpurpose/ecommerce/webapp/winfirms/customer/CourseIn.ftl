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
	<div class="md-card-toolbar">
    	<h3 class="md-card-toolbar-heading-text">${uiLabelMap.MyCourseJoin}</h3>
   	</div>
   	<div class="md-card-content uk-overflow-container">
    <table class="uk-table uk-table-bordered uk-table-hover">
      <thead>
          <tr>
            <th>${uiLabelMap.CourseName}</th>
            <th>${uiLabelMap.CourseInfo}</th>
            <th>${uiLabelMap.CourseProjectCategory}</th>
            
          </tr>
        </thead>
        <tbody>
    	<#assign ProCol = 0>
        <#list ProductAndRole as ProductAndRole>
          	<tr>
	            <td valign="center">
	            	<a href="<@ofbizUrl>product?product_id=${ProductAndRole.productId}</@ofbizUrl>" target="_blank">${ProductAndRole.productId} -
	              	${ProductAndRole.productName?default("No Name")}</a>
	            </td>
	            <td valign="center">
	              	${ProductAndRole.description!}
	            </td>
	            <td valign="center">
	              	<a href="/products/${ProductAndRole.primaryProductCategoryId!}" target="_blank">${ProductAndRole.primaryProductCategoryId!}</a>
	            </td>
          	</tr>
	    </#list>
      </tbody>
    </table>
	</div>
</div>
