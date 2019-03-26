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

<script type="text/javascript">
//<![CDATA[
    <!-- function to add extra info for Timestamp format -->
    function TimestampSubmit(obj) {
       reservStartStr = jQuery(obj).find("input[name='reservStartStr']");
       val1 = reservStartStr.val();
       reservStart = jQuery(obj).find("input[name='reservStart']");
       if (reservStartStr.val().length == 10) {
           reservStart.val(reservStartStr.val() + " 00:00:00.000000000");
       } else {
           reservStart.val(reservStartStr.val());
       }
       jQuery(obj).submit();
    }
    
    function callDocumentByPaginate(info) {
        var str = info.split('~');
        var checkUrl = '<@ofbizUrl>showShoppingListAjaxFired</@ofbizUrl>';
        if(checkUrl.search("http"))
            var ajaxUrl = '<@ofbizUrl>showShoppingListAjaxFired</@ofbizUrl>';
        else
            var ajaxUrl = '<@ofbizUrl>showShoppingListAjaxFiredSecure</@ofbizUrl>';
        //jQuerry Ajax Request
        jQuery.ajax({
            url: ajaxUrl,
            type: 'POST',
            data: {"shoppingListId" : str[0], "VIEW_SIZE" : str[1], "VIEW_INDEX" : str[2]},
            error: function(msg) {
                alert("An error occurred loading content! : " + msg);
            },
            success: function(msg) {
                jQuery('#div3').html(msg);
            }
        });
     }
//]]>
</script>
<#macro paginationControls>
  <#assign viewIndexMax = Static["java.lang.Math"].ceil((listSize)?double / viewSize?double)>
  <#if (viewIndexMax?int > 0)>
    <div class="product-prevnext">
        <#-- Start Page Select Drop-Down -->
        <select name="pageSelect" onchange="callDocumentByPaginate(this[this.selectedIndex].value);" class="form-control">
            <option value="#">${uiLabelMap.CommonPage} ${viewIndex?int} ${uiLabelMap.CommonOf} ${viewIndexMax}</option>
            <#if (viewIndex?int > 1)>
                <#list 0..viewIndexMax as curViewNum>
                     <option value="${shoppingListId!}~${viewSize}~${curViewNum?int + 1}">${uiLabelMap.CommonGotoPage} ${curViewNum + 1}</option>
                </#list>
            </#if>
        </select>
        <#-- End Page Select Drop-Down -->
        
        <#if (viewIndex?int > 1)>
            <a href="javascript: void(0);" onclick="callDocumentByPaginate('${shoppingListId!}~${viewSize}~${viewIndex?int - 1}');" class="buttontext">${uiLabelMap.CommonPrevious}</a> |
        </#if>
        <#if ((listSize?int - viewSize?int) > 0)>
            <span>${lowIndex} - ${highIndex} ${uiLabelMap.CommonOf} ${listSize}</span>
        </#if>
        <#if highIndex?int < listSize?int>
         | <a href="javascript: void(0);" onclick="callDocumentByPaginate('${shoppingListId!}~${viewSize}~${viewIndex?int + 1}');" class="buttontext">${uiLabelMap.CommonNext}</a>
        </#if>
    </div>
</#if>
</#macro>
<div class="md-card uk-margin-medium-bottom">
    <div class="md-card-content">
        <div class="uk-grid" data-uk-grid-margin>
            <div class="uk-width-medium-1-1">
                <div class="uk-vertical-align">
                    <div class="uk-vertical-align-middle">
                        <ul id="contact_list_filter" class="uk-subnav uk-subnav-pill uk-margin-remove">
                            <li class="uk-active" data-uk-filter=""><a href="#">${uiLabelMap.CommonAll}</a></li>
                            <li data-uk-filter="PROJECT"><a href="#">${uiLabelMap.CommonProject}</a></li>
                            <li data-uk-filter="COURSE"><a href="#">${uiLabelMap.Course}</a></li>
                            <li data-uk-filter="ACTIVITY"><a href="#">${uiLabelMap.CommonActivity}</a></li>
                            <li data-uk-filter="SERVICE"><a href="#">${uiLabelMap.CommonServie}</a></li>
                            <li data-uk-filter="POLICY"><a href="#">${uiLabelMap.CommonPolicy}</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="uk-grid-width-small-1-2 uk-grid-width-medium-1-3 uk-grid-width-large-1-4 uk-grid-width-xlarge-1-5 hierarchical_show" id="contact_list">
<#if shoppingList?has_content>
    <#if canView>
	    <#if shoppingListItemDatas?has_content>
	        <#-- Pagination -->
	          <#list shoppingListItemDatas[lowIndex-1..highIndex-1] as shoppingListItemData>
	            <#assign shoppingListItem = shoppingListItemData.shoppingListItem/>
	            <#assign product = shoppingListItemData.product/>
	            <#assign productContentWrapper = Static["org.apache.ofbiz.product.product.ProductContentWrapper"].makeProductContentWrapper(product, request)/>
	            <div data-uk-filter="${product.productTypeId}">
	            <form method="post" action="<@ofbizUrl>removeFromCollection</@ofbizUrl>" name='removeform_${shoppingListItem.shoppingListItemSeqId}'>
	              <input type="hidden" name="shoppingListId" value="${shoppingListItem.shoppingListId}" />
	              <input type="hidden" name="shoppingListItemSeqId" value="${shoppingListItem.shoppingListItemSeqId}" />
	            </form>
	            <div class="md-card">
                    <div class="md-card-content small-padding">
                        <img src="<@ofbizContentUrl>${product.largeImageUrl!}</@ofbizContentUrl>" alt="" class="blog_list_teaser_image">
                        <div class="blog_list_teaser">
                            <h2 class="blog_list_teaser_title uk-text-truncate"><a href="<@ofbizUrl>product?product_id=${shoppingListItem.productId}</@ofbizUrl>">${productContentWrapper.get("PRODUCT_NAME", "html")?default("No Name")}</a></h2>
                            <p>${productContentWrapper.get("DESCRIPTION", "html")!}</p>
                            <span class="uk-text-muted uk-text-small">${product.productTypeId}</span>
                        </div>
                        <div class="blog_list_footer">
                            <a href="javascript:document.removeform_${shoppingListItem.shoppingListItemSeqId}.submit();" class="md-btn md-btn-small md-btn-flat md-btn-flat-primary uk-float-right">${uiLabelMap.CommonRemove}</a>
                        </div>
                    </div>
                </div></div>
	          </#list>
	    <#else>
	        <h3>${uiLabelMap.EcommerceShoppingListEmpty}.</h3>
	    </#if>
    <#else>
        <#-- shoppingList was found, but belongs to a different party -->
        <h2>${uiLabelMap.EcommerceShoppingListError} ${uiLabelMap.CommonId} ${shoppingList.shoppingListId}) ${uiLabelMap.EcommerceListDoesNotBelong}.</h2>
    </#if>
</#if>
</div>
