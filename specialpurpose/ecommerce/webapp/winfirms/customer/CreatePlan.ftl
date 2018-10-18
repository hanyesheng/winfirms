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
<#if productId??>
	<div class="uk-width-medium-8-10 uk-container-center reset-print">
		<div class="uk-grid uk-grid-collapse" data-uk-grid-margin>
			<div class="uk-width-large-3-10 hidden-print uk-visible-large">
    		<div class="md-list-outside-wrapper">
        	<ul class="md-list md-list-outside notes_list" id="notes_list">
            <#list ProductContentTypeParent as ProductContentTypeParent>
            <li class="heading_list">${ProductContentTypeParent.description}</li>
	            <#list ProductContentType as ProductContentType>
	            	<#if ProductContentType.parentTypeId?? && ProductContentType.parentTypeId = ProductContentTypeParent.productContentTypeId>
		            <#assign contentId = null!/>
		            <#assign fromDate = null!/>
		            <#assign dataResourceId = null!/>
		            <#list ProductContent as ProductContent>
		            	<#if ProductContent.productContentTypeId = ProductContentType.productContentTypeId>
		            		<#assign contentId = ProductContent.contentId! />
		            		<#assign fromDate = ProductContent.fromDate! />
		            		<#assign dataResourceId = ProductContent.dataResourceId! />
	            		</#if>
	            	</#list>
	            	<#assign textData = null! />
	            	<#if dataResourceId?has_content>
	            		<#list dataText as dataText>
							<#if dataText.dataResourceId = dataResourceId>
								<#assign textData = dataText.textData! />
							</#if>
						</#list>
					</#if>
		            <li class="plan-list">
		                <a href="#" class="md-list-content note_link" data-type="${ProductContentType.productContentTypeId!}" data-note="${StringUtil.wrapString(textData!)}">
		                    <span class="md-list-heading uk-text-truncate">${ProductContentType.description}</span>
		                </a>
		            </li>
	            	</#if>
	            </#list>
            </#list>
        	</ul>
    		</div>
			</div>
			<div class="uk-width-large-7-10">
	    		<div class="md-card md-card-single">
	    			<form method="post" action="<@ofbizUrl>updateProjectPlan</@ofbizUrl>" id="updateProjectPlan" class="basic-form" onsubmit="javascript:submitFormDisableSubmits(this)" name="updateProjectPlan">
					  <input type="hidden" name="productId" value="${productId}" id="EditProductContentSimpleText_productId">
					  <input type="hidden" name="productContentTypeId" id="productContentTypeId" value="">
					</form>
	        		<div class="md-card-toolbar hidden-print">
	        			<div class="md-card-toolbar-actions" style="padding-top: 0px;">
                            <div class="md-card-dropdown" data-uk-dropdown="{pos:'bottom-right'}">
                                <i class="md-icon material-icons">&#xE5D4;</i>
                                <div class="uk-dropdown uk-dropdown-small" style="box-shadow: 0 3px 6px rgba(0,0,0,.16),0 3px 6px rgba(0,0,0,.23);">
                                    <ul class="uk-nav">
                                        <li style="float: none;"><a href="javascript:document.updateProjectPlan.submit();" style="display: block;">${uiLabelMap.CommonCreate}</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
		                <input name="" id="note_title" class="md-card-toolbar-input" type="text" value="" placeholder="${uiLabelMap.BusinessPlan}" />
		            </div>
		            <div class="md-card-content wrapper-full">
		                <textarea disabled="disabled" name="text" id="wysiwyg_ckeditor" class="md-input" style="min-width: 100%;"></textarea>
		            </div>
				</div>
			</div>
		</div>
	</div>
<script>
	$(function() {
	altair_notes.copy_list_sidebar(), altair_notes.init()
	});
	var $note_add_btn = $("#note_add"),
		$card_note = $(".md-card-single"),
		notes_list_class = ".notes_list",
		$notes_list = $("#notes_list");
	altair_notes = {
		init: function() {
			altair_notes.add_new_note(), altair_notes.open_note()
		},
		add_new_note: function() {
			if($note_add_btn) {
				var t = function() {
					$card_note.find("#note_title,#wysiwyg_ckeditor").val(""), $notes_list.find("li").removeClass("md-list-item-active"), $card_note.find("#note_title").focus()
				};
				$note_add_btn.on("click", function(e) {
					e.preventDefault(), altair_md.card_show_hide($card_note, void 0, t, void 0)
				})
			}
		},
		open_note: function() {
			var t = function(t) {
				$card_note.find("#note_title").val(t.children(".md-list-heading").text()), 
				$card_note.find("#wysiwyg_ckeditor").val(t.attr("data-note")),
				$card_note.find("#productContentTypeId").val(t.attr("data-type"))
			};
			$(notes_list_class).find("a").on("click", function(e) {
				e.preventDefault();
				var i = $(this);
				altair_md.card_show_hide($card_note, void 0, t, i), $(this).closest("li").siblings("li").removeClass("md-list-item-active").end().addClass("md-list-item-active")
			})
//			$("#updateProjectPlan").attr("action","/control/updateProjectPlan?contentId=");
		},
		copy_list_sidebar: function() {
			$sidebar_secondary_toggle.addClass("uk-hidden-large");
			var t = $notes_list.clone();
			t.attr("id", "notes_list_sidebar"), $sidebar_secondary.find(".sidebar_secondary_wrapper").html(t)
		}
	};
</script>
</#if>
