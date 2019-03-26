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
<div class="screenlet md-card" style="margin-top: 25px;">
  <div class="screenlet-body md-card-content uk-overflow-container">
  	<div class="uk-alert uk-alert-warning">
        ${uiLabelMap.CreatePrepareAlert}
    </div>
  	<form method="post" action="<@ofbizUrl>prepareCreateProjectFile</@ofbizUrl>" id="EditProductContentSimpleText" class="basic-form" onsubmit="javascript:submitFormDisableSubmits(this)" name="EditProductContentSimpleText">
		  <input type="hidden" name="productId" value="${productId}" id="EditProductContentSimpleText_productId">
		  <input type="hidden" name="productContentTypeId" value="DIGITAL_DOWNLOAD">
			<div style="text-align: center;margin-top: 10px;">
			<input type="submit" class="md-btn md-btn-primary" name="submitButton" value="${uiLabelMap.ProductPrepareCreate}">
			</div>
		</form>
  </div>
</div>
</#if>
