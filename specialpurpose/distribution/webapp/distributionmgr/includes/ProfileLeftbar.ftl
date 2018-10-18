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
            	<li title="${uiLabelMap.BasicInformation}" class="act_section <#if !menuCol?? || menuCol = "1">current_section</#if>">
                    <a href="<@ofbizUrl>main</@ofbizUrl>">
                        <span class="menu_icon"><i class="material-icons">&#xE87C;</i></span>
                        <span class="menu_title">${uiLabelMap.BasicInformation}</span>
                    </a>
                </li>
                <li title="${uiLabelMap.MyPromoCode}" class="act_section <#if !menuCol?? || menuCol = "2">current_section</#if>">
                    <a href="<@ofbizUrl>myPromoCode</@ofbizUrl>">
                        <span class="menu_icon"><i class="material-icons">card_giftcard</i></span>
                        <span class="menu_title">${uiLabelMap.MyPromoCode}</span>
                    </a>
                </li>
                <li title="${uiLabelMap.TargetCustomers}" class="act_section <#if !menuCol?? || menuCol = "3">current_section</#if>">
                    <a href="<@ofbizUrl>targetCustomers</@ofbizUrl>">
                        <span class="menu_icon"><i class="material-icons">location_searching</i></span>
                        <span class="menu_title">${uiLabelMap.TargetCustomers}</span>
                    </a>
                </li>
            </ul>
        </div>
    </aside><!-- main sidebar end -->
<div id="page_content"><div id="page_content_inner">
    