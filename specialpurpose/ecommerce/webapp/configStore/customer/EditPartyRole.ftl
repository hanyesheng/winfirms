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
	<div class="double-space-bottom editperson">
		<h3 class="heading">${uiLabelMap.RoleManager}<span style="display: inline-block"><a href='<@ofbizUrl>viewprofile</@ofbizUrl>' class="color3 fa fa-reply-all">${uiLabelMap.CommonGoBack}</a></span></h3>			
	  	<table width="90%"  class="table table-bordered">
	      	<thead>
		      	<tr>
		          <td width="70%">${uiLabelMap.PartyRole}</td>
		          <td colspan="2">
		          </td>
		        </tr>
	        </thead>
	        <tbody>
	      	<#list RoleTypeAndParty as RoleTypeAndParty>
				<tr>
		          	<td>
		          		<#if RoleTypeAndParty.roleTypeId = "BUSINESSMAN">
						<span class="businessman">${RoleTypeAndParty.description}</span>
						<#elseif RoleTypeAndParty.roleTypeId = "SUBSCRIBER">
						<span class="subscriber">${RoleTypeAndParty.description}</span>
						<#elseif RoleTypeAndParty.roleTypeId = "INVESTORS">
						<span class="investors">${RoleTypeAndParty.description}</span>
						<#elseif RoleTypeAndParty.roleTypeId = "COMPANY">
						<span class="company">${RoleTypeAndParty.description}</span>
						<#elseif RoleTypeAndParty.roleTypeId = "INCUBATOR">
						<span class="incubator">${RoleTypeAndParty.description}</span>
						</#if>
		          </td>
	          		<#assign RoleProductIdCol = 0>
					<#list ProductAndRoleFrom as ProductAndRoleFrom>
						<#if (ProductAndRoleFrom.partyId = RoleTypeAndParty.partyId) && (RoleTypeAndParty.roleTypeId =ProductAndRoleFrom.roleTypeId)>
	      					<td><a href="/store/products/p_${ProductAndRoleFrom.productId!}" target="_blank" class="button btn-border color3 btn-xs btn-radius" style="display: inline-table;"><i class="fa fa-edit"></i>&nbsp;${uiLabelMap.SeeRoleResume}</a></td>
		      				<#if RoleTypeAndParty.roleTypeId = "BUSINESSMAN">
								<td><a href="<@ofbizUrl>addRoleShowSecCk?productId=${ProductAndRoleFrom.productId!}</@ofbizUrl>" target="_blank" class="button btn-border color3 btn-xs btn-radius" style="display: inline-table;"><i class="fa fa-edit"></i>&nbsp;${uiLabelMap.CommonEdit}${uiLabelMap.Resume}</a></td>
							<#elseif RoleTypeAndParty.roleTypeId = "SUBSCRIBER">
		      					<td><a href="<@ofbizUrl>addRoleShowSecSub?productId=${ProductAndRoleFrom.productId!}</@ofbizUrl>" target="_blank" class="button btn-border color3 btn-xs btn-radius" style="display: inline-table;"><i class="fa fa-edit"></i>&nbsp;${uiLabelMap.CommonEdit}${uiLabelMap.Resume}</a></td>
		          			</#if>
	          				<#assign RoleProductIdCol = RoleProductIdCol + 1>
	      					<#if (RoleProductIdCol > 0)><#break></#if>
						</#if>
					</#list>
		       	</tr>
			</#list>
			</tbody>
     	</table>
	</div>
</div>