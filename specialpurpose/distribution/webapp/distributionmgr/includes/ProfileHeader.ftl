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

<#if userLoginContentId?has_content>
	<#assign userLoginLogoUrl = "/content/control/stream?contentId=${userLoginContentId}"! />
<#else>	
	<#assign userLoginLogoUrl = "/images/winfirms/headdefault.png">
</#if>
<!-- main header -->
<header id="header_main">
    <div class="header_main_content">
        <nav class="uk-navbar">            
            <!-- main sidebar switch -->
            <a href="#" id="sidebar_main_toggle" class="sSwitch sSwitch_left">
                <span class="sSwitchIcon"></span>
            </a>
            <div id="menu_top_dropdown" class="uk-float-left uk-hidden-small">
                <div class="uk-button-dropdown">
                    <a href="#" class="top_menu_toggle">${uiLabelMap.DistribuTionApplication}</a>
                </div>
            </div>
            <!--购物车数量-->
        	<div class="uk-navbar-flip">
                <ul class="uk-navbar-nav user_actions">
                    <li><a href="#" id="full_screen_toggle" class="user_action_icon uk-visible-large"><i class="material-icons md-24 md-light">&#xE5D0;</i></a></li>
                    <li data-uk-dropdown="{mode:'click',pos:'bottom-right'}">
                        <a href="#" class="user_action_image"><img class="md-user-image" src="${userLoginLogoUrl!}" alt=""/></a>
                        <div class="uk-dropdown uk-dropdown-small">
                            <ul class="uk-nav js-uk-prevent">
                            	<#if userLogin??>
                            		<#list Person as Person><#assign userloginNickname = Person.nickname!></#list>
							      	<li><a href="#">${uiLabelMap.CommonWelcome}&nbsp;${userloginNickname!}</a></li>									
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
