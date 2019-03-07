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
<!-- statistics (small charts) -->
<div class="uk-grid uk-grid-width-large-1-4 uk-grid-width-medium-1-2 uk-grid-medium uk-sortable sortable-handler hierarchical_show" data-uk-sortable data-uk-grid-margin>
    <div>
        <div class="md-card">
            <div class="md-card-content">
                <span class="uk-text-muted uk-text-small">${uiLabelMap.ProductStoreRoleSize}</span>
                <h2 class="uk-margin-remove"><span class="countUpMe">${ProductStoreRoles?size}</span></h2>
            </div>
        </div>
    </div>
    <div>
        <div class="md-card">
            <div class="md-card-content">
                <span class="uk-text-muted uk-text-small">${uiLabelMap.ProductSize}</span>
                <h2 class="uk-margin-remove"><span class="countUpMe">${Products?size}</span></h2>
            </div>
        </div>
    </div>
    <div>
        <div class="md-card">
            <div class="md-card-content">
                <span class="uk-text-muted uk-text-small">${uiLabelMap.LoginVisitSize}</span>
                <h2 class="uk-margin-remove"><span class="countUpMe">${LoginVisits?size}</span></h2>
            </div>
        </div>
    </div>
    <div>
        <div class="md-card">
            <div class="md-card-content">
                <span class="uk-text-muted uk-text-small">${uiLabelMap.VisitSizeAweek}</span>
                <h2 class="uk-margin-remove" id="peity_live_text">${LoginVisitsAWeek?size}</h2>
            </div>
        </div>
    </div>
</div>

<!-- tasks -->
<div class="uk-grid" data-uk-grid-margin data-uk-grid-match="{target:'.md-card-content'}">
    <div class="uk-width-medium-1-2">
        <div class="md-card">
            <div class="md-card-content">
                <div class="uk-overflow-container">
                    <table class="uk-table uk-table-bordered uk-table-hover">
                        <thead>
                            <tr>
                                <th></th>
                                <th style="color: white;">${uiLabelMap.PartyUserLogin}</th>
                                <th style="color: white;">${uiLabelMap.PartyClientIP}</th>
                                <th style="color: white;">${uiLabelMap.CommonFromDate}</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<#list Visitors as visitObj>
                            <tr class="uk-table-middle">
                            	<#assign personLogoUrl = "/images/winfirms/user.png">
								<#list partyContentList?sort_by('fromDate') as partyContentList>
									<#if partyContentList.partyId = visitObj.partyId>
										<#assign personContentId = partyContentList.contentId!/>
										<#if personContentId?has_content>
											<#assign personLogoUrl = "/content/control/stream?contentId=${personContentId}"!/>
										</#if>
									</#if>
								</#list>
								<#assign PersonName = visitObj.partyId>
								<#list Person as Person>
									<#if Person.partyId = visitObj.partyId>
										<#assign PersonName = Person.nickname!/>
									</#if>
								</#list>
                            	<td>
			                        <img class="md-user-image md-list-addon-avatar" src="${personLogoUrl!}" alt="">
                            	</td>
                                <td><a href="#">${visitObj.userLoginId!}-[${PersonName!}]</a></td>
                                <td><span class="uk-badge">${visitObj.clientIpAddress!}</span></td>
                                <td>${visitObj.fromDate?substring(0,16)!}</td>
                            </tr>
                            </#list>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>