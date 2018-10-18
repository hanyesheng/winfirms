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
<#assign NoCol = CommunicationEventAndRoleNoread?size/>
<#assign PriLetterNoCol = CommunicationEventAndRolePriLetterNoread?size/>
<#assign ApplyNoCol = CommunicationEventAndRoleApplyNoread?size/>
<#list RoleTypeAndParty as RoleTypeAndParty>
	<#if RoleTypeAndParty.roleTypeId = "BUSINESSMAN">
		<#assign IsBusinessman = 1>
	</#if>
	<#if RoleTypeAndParty.roleTypeId = "INCUBATOR">
		<#assign IsIncubator = 1>
	</#if>
	<#if RoleTypeAndParty.roleTypeId = "INVESTORS">
		<#assign IsInvestors = 1>
	</#if>
	<#if RoleTypeAndParty.roleTypeId = "COMPANY">
		<#assign IsCompany = 1>
	</#if>
	<#if RoleTypeAndParty.roleTypeId = "TEACHER">
		<#assign IsTeacher = 1>
	</#if>
</#list>
<!-- main sidebar -->
    <aside id="sidebar_main">
        <div class="sidebar_main_header">
            <div class="sidebar_logo">
		        <a href="#" class="sSidebar_hide sidebar_logo_large">
		            <img class="logo_regular" src="/images/winfirms/logo.png" alt="" height="15" width="71"/>
		            <img class="logo_light" src="/images/winfirms/logo.png" alt="" height="15" width="71"/>
		        </a>
		        <a href="#" class="sSidebar_show sidebar_logo_small">
		            <img class="logo_regular" src="/images/winfirms/logo.png" alt="" height="32" width="32"/>
		            <img class="logo_light" src="/images/winfirms/logo.png" alt="" height="32" width="32"/>
		        </a>
		    </div>
		    <div class="sidebar_actions">
		        <span>${nowTimestamp?datetime?string.short}</span>
		    </div>
        </div>
        
        <div class="menu_section">
            <ul>
            	<li title="${(productStore.storeName)!}">
                    <a href="/control/main">
                        <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
                        <span class="menu_title">${(productStore.storeName)!}</span>
                    </a>
                </li>
            	<li class="act_section <#if !menuCol?? || menuCol = "1">current_section</#if>" title="${uiLabelMap.BasicInformation}">
                    <a href="#">
                        <span class="menu_icon"><i class="material-icons">&#xE87C;</i></span>
                        <span class="menu_title">${uiLabelMap.BasicInformation}</span>
                    </a>
                    <ul style="display: block;">
                        <li <#if !menuCol?? || menuCol = "1">class="act_item"</#if>><a href="<@ofbizUrl>viewprofile</@ofbizUrl>">${uiLabelMap.PersonalInformation}</a></li>
                        <li <#if menuCol?? && menuCol = "2">class="act_item"</#if>><a href="<@ofbizUrl>filemanager</@ofbizUrl>">${uiLabelMap.FileManager}</a></li>
                        <li <#if menuCol?? && menuCol = "3">class="act_item"</#if>><a href="<@ofbizUrl>viewcontactmech</@ofbizUrl>">${uiLabelMap.ContactInformation}</a></li>
                        <li <#if menuCol?? && menuCol = "orderhistory">class="act_item"</#if>><a href="<@ofbizUrl>orderhistory</@ofbizUrl>">${uiLabelMap.EcommerceOrderHistory}</a></li>
                    </ul>
                </li>
                <li class="act_section" title="${uiLabelMap.MyCollection}">
                    <a href="#">
                        <span class="menu_icon"><i class="material-icons">grade</i></span>
                        <span class="menu_title">${uiLabelMap.MyCollection}</span>
                    </a>
                    <ul style="display: block;">
                        <li <#if menuCol?? && menuCol = "4">class="act_item"</#if>><a href="<@ofbizUrl>editCollection</@ofbizUrl>">${uiLabelMap.MyCollection}</a></li>
                        <li <#if menuCol?? && menuCol = "5">class="act_item"</#if>><a href="<@ofbizUrl>editFollowing</@ofbizUrl>">${uiLabelMap.MyFollowing}</a></li>
                    </ul>
                </li>
                <#if IsBusinessman??>
                <li class="act_section" title="${uiLabelMap.BusinessMgr}">
                    <a href="#">
                        <span class="menu_icon"><i class="material-icons">extension</i></span>
                        <span class="menu_title">${uiLabelMap.BusinessMgr}</span>
                    </a>
                    <ul style="display: block;">
                        <li <#if menuCol?? && menuCol = "6">class="act_item"</#if>><a href="<@ofbizUrl>projectscreated</@ofbizUrl>">${uiLabelMap.MyProjectCreate}</a></li>
                        <li <#if menuCol?? && menuCol = "7">class="act_item"</#if>><a href="<@ofbizUrl>projectsin</@ofbizUrl>">${uiLabelMap.MyProjectJoin}</a></li>
                    	<li <#if menuCol?? && menuCol = "activityin">class="act_item"</#if>><a href="<@ofbizUrl>activityin</@ofbizUrl>">${uiLabelMap.MyActivityJoin}</a></li>
                    	<li <#if menuCol?? && menuCol = "coursein">class="act_item"</#if>><a href="<@ofbizUrl>coursein</@ofbizUrl>">${uiLabelMap.MyCourseJoin}</a></li>
                    </ul>    
                </li>
                </#if>
                <#if IsInvestors??>
                <li class="act_section" title="${uiLabelMap.InvestorsMgr}">
                    <a href="#">
                        <span class="menu_icon"><i class="material-icons">local_atm</i></span>
                        <span class="menu_title">${uiLabelMap.InvestorsMgr}</span>
                    </a>
                    <ul style="display: block;">
                        <!--<li <#if menuCol?? && menuCol = "InvestorsIntro">class="act_item"</#if>><a href="<@ofbizUrl>investorsIntro</@ofbizUrl>">${uiLabelMap.RoleManager}</a></li>-->
                        <li <#if menuCol?? && menuCol = "ProjectsInvest">class="act_item"</#if>><a href="<@ofbizUrl>projectsInvest</@ofbizUrl>">${uiLabelMap.MyProjectInvest}</a></li>
                    </ul>
                </li>
                </#if>
                <#if IsTeacher??>
                <li class="act_section" title="${uiLabelMap.TeacherMgr}">
                    <a href="#">
                        <span class="menu_icon"><i class="material-icons">chrome_reader_mode</i></span>
                        <span class="menu_title">${uiLabelMap.TeacherMgr}</span>
                    </a>
                    <ul style="display: block;">
                        <!--<li <#if menuCol?? && menuCol = "InvestorsIntro">class="act_item"</#if>><a href="<@ofbizUrl>investorsIntro</@ofbizUrl>">${uiLabelMap.RoleManager}</a></li>-->
                        <li <#if menuCol?? && menuCol = "courseCreated">class="act_item"</#if>><a href="<@ofbizUrl>courseCreated</@ofbizUrl>">${uiLabelMap.MyCourseCreate}</a></li>
                    </ul>
                </li>
                </#if>
                <#if IsIncubator??>
                <li class="act_section" title="${uiLabelMap.IncubatorMgr}">
                    <a href="#">
                        <span class="menu_icon"><i class="material-icons">extension</i></span>
                        <span class="menu_title">${uiLabelMap.IncubatorMgr}</span>
                    </a>
                    <ul style="display: block;">
                        <li <#if menuCol?? && menuCol = "6">class="act_item"</#if>><a href="<@ofbizUrl>projectscreated</@ofbizUrl>">${uiLabelMap.MyProjectCreate}</a></li>
                        <li <#if menuCol?? && menuCol = "7">class="act_item"</#if>><a href="<@ofbizUrl>projectsin</@ofbizUrl>">${uiLabelMap.MyProjectJoin}</a></li>
                    </ul>
                </li>
                </#if>
                <#if IsCompany??>
                <li class="act_section" title="${uiLabelMap.CompanyMgr}">
                    <a href="#">
                        <span class="menu_icon"><i class="material-icons">extension</i></span>
                        <span class="menu_title">${uiLabelMap.CompanyMgr}</span>
                    </a>
                    <ul style="display: block;">
                        <li <#if menuCol?? && menuCol = "6">class="act_item"</#if>><a href="<@ofbizUrl>projectscreated</@ofbizUrl>">${uiLabelMap.MyProjectCreate}</a></li>
                        <li <#if menuCol?? && menuCol = "7">class="act_item"</#if>><a href="<@ofbizUrl>projectsin</@ofbizUrl>">${uiLabelMap.MyProjectJoin}</a></li>
                    </ul>
                </li>
                </#if>
                <li class="act_section" title="${uiLabelMap.MyMessage}">
                    <a href="#">
                        <span class="menu_icon"><i class="material-icons">comment</i></span>
                        <span class="menu_title">${uiLabelMap.MyMessage}</span>
                    </a>
                    <ul style="display: block;">
                        <li <#if menuCol?? && menuCol = "11">class="act_item"</#if>><a style="position: relative;" href="<@ofbizUrl>messagePriLetterListReceive</@ofbizUrl>">${uiLabelMap.MyMessagePriLetter}<#if PriLetterNoCol = 0><#else><span class="colCommunicationEventsLeftbar uk-badge">${PriLetterNoCol}</span></#if></a></li>
                        <li <#if menuCol?? && menuCol = "9">class="act_item"</#if>><a style="position: relative;" href="<@ofbizUrl>messageDissListReceive</@ofbizUrl>">${uiLabelMap.MyMessageDiscuss}<#if NoCol = 0><#else><span class="colCommunicationEventsLeftbar uk-badge">${NoCol}</span></#if></a></li>
                        <li <#if menuCol?? && menuCol = "10">class="act_item"</#if>><a style="position: relative;" href="<@ofbizUrl>messageApplyListSend</@ofbizUrl>">${uiLabelMap.MyMessageApply}<#if ApplyNoCol = 0><#else><span class="colCommunicationEventsLeftbar uk-badge">${ApplyNoCol}</span></#if></a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </aside><!-- main sidebar end -->
<div id="page_content"><div id="page_content_inner">
    