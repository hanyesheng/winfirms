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
    	<h3 class="md-card-toolbar-heading-text">${uiLabelMap.MyCourseCategoryCreate}</h3>
   	</div>
   	<div class="md-card-content uk-overflow-container">
	    <table class="uk-table uk-table-bordered uk-table-hover">
	      	<thead>
	          	<tr>
		            <th>${uiLabelMap.CourseCategoryId}</th>
		            <th>${uiLabelMap.CourseCategoryName}</th>
		            <th>${uiLabelMap.CourseCategoryDescription}</th>
		            <th>${uiLabelMap.CategoryOfCourse}</th>
		            <th>${uiLabelMap.ProjectCreatedDate}</th>
		            <th> </th>
	          	</tr>
	        </thead>
	        <tbody>
	      	<#list ProductCategory as ProductCategory>
	          	<tr>
	            <td valign="center">
	            	${ProductCategory.productCategoryId}
	            </td>
	            <td valign="center">
	              	${ProductCategory.categoryName}
	            </td>
	            <td valign="center">
	              	${ProductCategory.description}
	            </td>
	            <td valign="center">
	              	<#list Product as Product>
	              		<#if Product.primaryProductCategoryId?? && Product.primaryProductCategoryId = ProductCategory.productCategoryId>
	              			<span class="uk-badge uk-badge-success">${Product.productName}</span>
	              			<a href="<@ofbizUrl>courseInfo?productId=${Product.productId}</@ofbizUrl>" class="button btn-border color3 btn-xs btn-radius" style="display: inline-table;"><i class="fa fa-edit"></i>&nbsp;${uiLabelMap.CommonEdit}${uiLabelMap.Course}</a>
	              		</#if>
	              	</#list>
	            </td>
	            <td valign="center">
	              	${ProductCategory.createdStamp}
	            </td>
	            <td valign="center">
	              	<a href="<@ofbizUrl>editCourseCategory?productCategoryId=${ProductCategory.productCategoryId}</@ofbizUrl>" class="button btn-border color3 btn-xs btn-radius" style="display: inline-table;"><i class="fa fa-edit"></i>&nbsp;${uiLabelMap.CommonEdit}</a>
	            </td>
	          </tr>
	      	</#list>
	      </tbody>
	    </table>
	</div>
</div>
