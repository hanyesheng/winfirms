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
<#if (requestAttributes.externalLoginKey)??><#assign externalKeyParam = "?externalLoginKey=" + requestAttributes.externalLoginKey!></#if>
<#if (externalLoginKey)??><#assign externalKeyParam = "?externalLoginKey=" + requestAttributes.externalLoginKey!></#if>

<#assign NoCol = CommunicationEventAndRoleNoreadall?size>
<#if userLoginContentId?has_content>
	<#assign userLoginLogoUrl = "/content/control/stream?contentId=${userLoginContentId}"! />
<#else>	
	<#assign userLoginLogoUrl = "/images/winfirms/user.png">
</#if>
<!-- main header -->
<header id="header_main">
    <div class="header_main_content">
        <nav class="uk-navbar">            
            <!-- main sidebar switch -->
            <a href="#" id="sidebar_main_toggle" class="sSwitch sSwitch_left">
                <span class="sSwitchIcon"></span>
            </a>
            <!--<div id="menu_top_dropdown" class="uk-float-left uk-hidden-small">
                <div class="uk-button-dropdown" data-uk-dropdown="{mode:'click'}">
                    <a href="#" class="top_menu_toggle"><i class="material-icons md-24">&#xE8F0;</i></a>
                    <div class="uk-dropdown uk-dropdown-width-3">
                        <div class="uk-grid uk-dropdown-grid">
                            <div class="uk-width-2-3">
                                <div class="uk-grid uk-grid-width-medium-1-3 uk-margin-bottom uk-text-center">
                                    <a href="page_mailbox.html" class="uk-margin-top">
                                        <i class="material-icons md-36 md-color-light-green-600">&#xE158;</i>
                                        <span class="uk-text-muted uk-display-block">Mailbox</span>
                                    </a>
                                    <a href="page_invoices.html" class="uk-margin-top">
                                        <i class="material-icons md-36 md-color-purple-600">&#xE53E;</i>
                                        <span class="uk-text-muted uk-display-block">Invoices</span>
                                    </a>
                                    <a href="page_chat.html" class="uk-margin-top">
                                        <i class="material-icons md-36 md-color-cyan-600">&#xE0B9;</i>
                                        <span class="uk-text-muted uk-display-block">Chat</span>
                                    </a>
                                    <a href="page_scrum_board.html" class="uk-margin-top">
                                        <i class="material-icons md-36 md-color-red-600">&#xE85C;</i>
                                        <span class="uk-text-muted uk-display-block">Scrum Board</span>
                                    </a>
                                    <a href="page_snippets.html" class="uk-margin-top">
                                        <i class="material-icons md-36 md-color-blue-600">&#xE86F;</i>
                                        <span class="uk-text-muted uk-display-block">Snippets</span>
                                    </a>
                                    <a href="page_user_profile.html" class="uk-margin-top">
                                        <i class="material-icons md-36 md-color-orange-600">&#xE87C;</i>
                                        <span class="uk-text-muted uk-display-block">User profile</span>
                                    </a>
                                </div>
                            </div>
                            <div class="uk-width-1-3">
                                <ul class="uk-nav uk-nav-dropdown uk-panel">
                                    <li class="uk-nav-header">Components</li>
                                    <li><a href="components_accordion.html">Accordions</a></li>
                                    <li><a href="components_buttons.html">Buttons</a></li>
                                    <li><a href="components_notifications.html">Notifications</a></li>
                                    <li><a href="components_sortable.html">Sortable</a></li>
                                    <li><a href="components_tabs.html">Tabs</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>-->
            <!--购物车数量-->
            <#assign shoppingCart = sessionAttributes.shoppingCart!>
        	<div class="uk-navbar-flip">
                <ul class="uk-navbar-nav user_actions">
                    <li><a href="#" id="full_screen_toggle" class="user_action_icon uk-visible-large"><i class="material-icons md-24 md-light">&#xE5D0;</i></a></li>
                    <li data-uk-dropdown="{mode:'click',pos:'bottom-right'}">
                        <a href="#" class="user_action_icon">
                        	<i class="material-icons md-24 md-light">&#xE8CC;</i>
                        	<span class="uk-badge">${shoppingCart.getTotalQuantity()}</span>
                        </a>
                        <div class="uk-dropdown uk-dropdown-xlarge">
                            <div class="md-card-content">
                            	${screens.render("component://ecommerce/widget/winfirms/BusinessScreens.xml#minicart")}
                            </div>
                        </div>
                    </li>
                    <li data-uk-dropdown="{mode:'click',pos:'bottom-right'}">
                        <a href="#" class="user_action_image"><img class="md-user-image" id="toplogo" src="${userLoginLogoUrl!}" alt=""/></a>
                        <div class="uk-dropdown uk-dropdown-small">
                            <ul class="uk-nav js-uk-prevent">
                            	<#if userLogin??>
                            		<#list Person as Person><#assign userloginNickname = Person.nickname!></#list>
							      	<li><a href="#">${uiLabelMap.CommonWelcome}&nbsp;${userloginNickname!}</a></li>									
									<li><a style="position: relative;" href="<@ofbizUrl>viewprofile</@ofbizUrl>">${uiLabelMap.FireManager}<#if NoCol = 0><#else><span class="colcommunicationEvents uk-badge">${NoCol}</span></#if></a></li>	
	      							<li><a href="<@ofbizUrl>autoLogout</@ofbizUrl>">${uiLabelMap.CommonLogout}</a></li>
						      	<#else>
							     	<li><a href="<@ofbizUrl>checkLogin</@ofbizUrl>">${uiLabelMap.CommonLogin}</a></li>
		      						<li><a href="<@ofbizUrl>newcustomer</@ofbizUrl>">${uiLabelMap.EcommerceRegister}</a></li>
							    </#if>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header><!-- main header end -->
