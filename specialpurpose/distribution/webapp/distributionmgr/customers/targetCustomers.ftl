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
<div class="screenlet md-card">
	<div class="screenlet-body md-card-content uk-overflow-container">
		<div class="md-list-content uk-input-group">
			<form method="post" style="display: inline-block;" action="<@ofbizUrl>createPartyRelationship</@ofbizUrl>" id="AddOtherPartyRelationship" class="basic-form" name="AddOtherPartyRelationship">
				<label for="partyIdTo">${uiLabelMap.PartyId}</label>
				<input name="partyIdTo" value="" type="text">
				<input name="roleTypeIdTo" value="CUSTOMER" type="hidden">
				<input name="roleTypeIdFrom" value="SALES_REP" type="hidden">
				<input name="partyIdFrom" value="${partyId}" type="hidden">
				<input name="statusId" value="PARTYREL_CREATED" type="hidden">
				<input name="fromDate" value="${nowTimestamp}" type="hidden">
			</form>
			<span class="uk-input-group-addon" style="display: inline-block;">
				<a class="md-btn" href="javascript:document.getElementById('AddOtherPartyRelationship').submit();"><i class="material-icons">note_add</i>${uiLabelMap.CommonAdd}</a>
			</span>
		</div>
		<table cellspacing="0" class="basic-table hover-bar uk-table uk-table-hover">
  			<thead>
  				<tr style="color: white;">
  					<td width="150px">${uiLabelMap.PartyId}</td>
  					<td>${uiLabelMap.CommonName}</td>
  					<td>${uiLabelMap.CommonContacts}</td>
  					<td></td>
  				</tr>
  			</thead>
  			<tbody>
  				<#list PartyRelationship as PartyRelationship>
  					<tr>
  						<td>${PartyRelationship.partyIdTo}</td>
  						<td>
  							<#assign partyName = "">
  							<#list Person as Person>
  								<#if Person.partyId = PartyRelationship.partyIdTo>
  									<#assign partyName = Person.nickname!>
  								</#if>
  							</#list>
  							${partyName!}
  						</td>
  						<td>
  							<#assign contactNumber = "">
  							<#assign contactEmail = "">
  							<#list PartyContactDetailByPurpose as PartyContactDetailByPurpose>
  								<#if PartyContactDetailByPurpose.partyId = PartyRelationship.partyIdTo>
  									<#assign contactNumber = PartyContactDetailByPurpose.contactNumber!>
  								</#if>
  							</#list>
  							<#list PartyEmailContactDetailByPurpose as PartyEmailContactDetailByPurpose>
  								<#if PartyEmailContactDetailByPurpose.partyId = PartyRelationship.partyIdTo>
  									<#assign contactNumber = PartyEmailContactDetailByPurpose.infoString!>
  								</#if>
  							</#list>
  							<#if contactNumber?has_content><div><span class="uk-badge uk-badge-primary">${contactNumber!}</span></div></#if>
  							<#if contactEmail?has_content><div><span class="uk-badge uk-badge-primary">${contactEmail!}</span></div></#if>
  						</td>
  						<td>
  							<form method="post" id="deletePartyRelationship_${PartyRelationship_index}" action="<@ofbizUrl>deletePartyRelationship</@ofbizUrl>" name="ListPartyRelationships">
								<input name="roleTypeIdTo" value="${PartyRelationship.roleTypeIdTo!}" type="hidden">
								<input name="fromDate" value="${PartyRelationship.fromDate!}" type="hidden">
								<input name="partyIdFrom" value="${PartyRelationship.partyIdFrom!}" type="hidden">
								<input name="partyIdTo" value="${PartyRelationship.partyIdTo!}" type="hidden">
								<input name="roleTypeIdFrom" value="${PartyRelationship.roleTypeIdFrom!}" type="hidden">
							</form>
							<a style="float: right;" class="button btn-border color3 btn-xs btn-radius" href="javascript:document.getElementById('deletePartyRelationship_${PartyRelationship_index}').submit();"><i class="fa fa-trash"></i>${uiLabelMap.CommonDelete}</a>
  						</td>
  					</tr>
  				</#list>
  			</tbody>
		</table>
	</div>
</div>