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

<#if party??>
<#assign personLogoUrl = "/images/winfirms/headdefault.png"!/>
<#list PartyContent?sort_by('fromDate') as PartyContent>
	<#if PartyContent.partyId = partyId>
		<#assign personContentId = PartyContent.contentId!/>
		<#if personContentId?has_content>
			<#assign personLogoUrl = "/content/control/stream?contentId=${personContentId}"!/>
		</#if>
	</#if>
</#list>
<div class="md-card">
	<div class="double-space-bottom">
		<h3 class="heading">${uiLabelMap.PersonalInformation}<span></span></h3>
		<div class="space-top">
			<table class="table table-bordered">
				<thead>
					<tr>
						<td width="20%">${uiLabelMap.PersonLogo}</td>
						<td colspan="3">${uiLabelMap.PartyPersonalInformation}<a style="float: right;" class="button btn-border color3 btn-xs btn-radius" href="<@ofbizUrl>editperson</@ofbizUrl>"><i class="fa fa-edit"></i>${uiLabelMap.CommonUpdate}</a></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td rowspan="0">
						    <label class="label quote-info" style="padding-top: 10%;cursor: pointer;">
						      <img class="img-responsive rounded"  id="avatar" src="${personLogoUrl}" alt="avatar">
						      <input type="file" class="sr-only" id="input" name="image" accept="image/*">
						    </label>
							<div class="modal fade logo" id="modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
					      		<div class="modal-dialog" role="document">
							        <div class="modal-content">
							          <div class="modal-header">
							        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">${uiLabelMap.Close}</span></button>
							        	<h4 class="modal-title">${uiLabelMap.EcommerceUploadNewFile}</h4>
							      	  </div>
							          <div class="modal-body">
							            <div class="img-container">
							              <img id="image" src="${personLogoUrl}">
							            </div>
							          </div>
							          <div class="modal-footer">
							            <button type="button" class="btn btn-default" data-dismiss="modal">${uiLabelMap.CommonClose}</button>
							            <button type="button" class="btn btn-primary" id="crop">${uiLabelMap.CommonUpload}</button>
							          </div>
							        </div>
						      	</div>
						    </div>
						</td>
						<td  width="10%">${uiLabelMap.FormFieldTitle_nickname}</td>
						<td colspan="2">${person.nickname!}</td>
					</tr>
					<tr>
						<td>${uiLabelMap.PartyRole}</td>
						<td colspan="2">
							<#if (RoleTypeAndParty?size > 0)>
								<#list RoleTypeAndParty as RoleTypeAndParty>
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
									<#else>
									<span class="unverified">${uiLabelMap.Unverified}</span>
									</#if>
								</#list>
							<#else>
								<span class="unverified">${uiLabelMap.Unverified}</span>
							</#if>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<span><a href="<@ofbizUrl>verify</@ofbizUrl>" class="color3" target="_blank">${uiLabelMap.Gotoverify}>></a></span>
							<a style="float: right;" class="button btn-border color3 btn-xs btn-radius" href="<@ofbizUrl>editpartyrole</@ofbizUrl>"><i class="fa fa-edit"></i>${uiLabelMap.RoleManager}</a>
						</td>
					</tr>
					<#assign hasParentCol = "0">
						<#list PartyRelationship as PartyRelationship>
							<#if PartyRelationship.partyIdTo??>
								<#list PartyGroup as PartyGroup>
									<#if PartyRelationship.partyIdTo = PartyGroup.partyId>
										<tr>
											<td><#if hasParentCol = "0">${uiLabelMap.Course}</#if></td>
											<td width="30%"><span class="label label-info">${PartyGroup.groupName!}</span></td>
											<form method="post" id="deletePartyRelationship_${hasParentCol}" action="<@ofbizUrl>deletePartyRelationship</@ofbizUrl>" name="ListPartyRelationships">
												<input name="roleTypeIdTo" value="INCUBATOR" type="hidden">
												<input name="fromDate" value="${PartyRelationship.fromDate!}" type="hidden">
												<input name="partyIdFrom" value="${PartyRelationship.partyIdFrom!}" type="hidden">
												<input name="partyIdTo" value="${PartyRelationship.partyIdTo!}" type="hidden">
												<input name="roleTypeIdFrom" value="${PartyRelationship.roleTypeIdFrom!}" type="hidden">
											</form>
											<td width="10%">
												<a style="float: right;" class="button btn-border color3 btn-xs btn-radius" href="javascript:document.getElementById('deletePartyRelationship_${hasParentCol}').submit();"><i class="fa fa-trash"></i>${uiLabelMap.CommonDelete}</a>
											</td>
										</tr>
										<#assign hasParentCol = hasParentCol + 1>
									</#if>
								</#list>
							</#if>
						</#list>
					<tr>
						<td>${uiLabelMap.AddCommonParent}</td>
						<td width="30%">
							<form method="post" action="<@ofbizUrl>createPartyRelationship</@ofbizUrl>" id="AddOtherPartyRelationship" class="basic-form" name="AddOtherPartyRelationship">
								<select name="partyIdTo" class="form-control">
								<option value="">---</option>
								<#list PartyRole as PartyRole>
									<#list PartyGroup as PartyGroup>
										<#if PartyGroup.partyId = PartyRole.partyId>
											<option value="${PartyGroup.partyId}">${PartyGroup.groupName}</option>
										</#if>
									</#list>
								</#list>
								</select>
								<input name="partyIdFrom" value="${party.partyId}" type="hidden">
								<input name="roleTypeIdTo" value="INCUBATOR" type="hidden">
								<input name="partyRelationshipTypeId" value="CHILD" type="hidden">
								<input name="statusId" value="PARTYREL_CREATED" type="hidden">
								<input name="fromDate" value="${nowTimestamp}" type="hidden">
							</form>
						</td>
						<td width="10%"><a style="float: right;" class="button btn-border color3 btn-xs btn-radius" href="javascript:document.getElementById('AddOtherPartyRelationship').submit();"><i class="fa fa-edit"></i>${uiLabelMap.AddCommonParent}</a></td>
					</tr>
					<tr>
						<td>${uiLabelMap.PartyGender}</td>
						<td colspan="2">
							<#if person.gender??>
								<#if person.gender == "M" >${uiLabelMap.CommonMale}</#if>
			                	<#if person.gender == "F" >${uiLabelMap.CommonFemale}</#if>
		                	<#else>
		                		----
							</#if>
						</td>
					</tr>
					<tr>
						<td>${uiLabelMap.FormFieldTitle_birthDate}</td>
						<td colspan="2"><#if person.birthDate??>${person.birthDate!}<#else>----</#if></td>
					</tr>
					<tr>
						<td>${uiLabelMap.BriefIntroduction}</td>
						<td colspan="2"><#if person.comments??>${person.comments!}<#else>${uiLabelMap.NoPartyComments}</#if></td>
					</tr>
					<tr>
						<td colspan="4">
							<div class="row"><div class="col-md-12">
							<div class="progress" style="display: none; margin-bottom: 1rem;">
						      <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
						    </div>
						    <div class="alert" role="alert" style="display: none;"></div>
							</div></div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="double-space-bottom">
		<h3 class="heading">${uiLabelMap.AttachFile}<span></span></h3>
		<#list PartyRelationship as PartyRelationship>
			<table class="table table-bordered">
			<thead>
				<tr>
					<#list PartyGroup as PartyGroup>
						<#if PartyRelationship.partyIdTo = PartyGroup.partyId>
						<td colspan="2" style="text-align: center;"><span class="label label-info">${PartyGroup.groupName!}</span></td>
						</#if>
					</#list>
				</tr>
			</thead>
			<tbody>
			<#list PartyContentDownload as PartyContentDownload>
				<#if PartyContentDownload.partyId = PartyRelationship.partyIdTo>
				<tr>
					<td>${PartyContentDownload.contentName}</td>
					<td>
						<a href="ViewBinaryDataResource?externalLoginKey=${requestAttributes.externalLoginKey!}&contentId=${PartyContentDownload.contentId}">
							${uiLabelMap.CommonDownload}
						</a>
					</td>
				</tr>
				</#if>
			</#list>
			<tr><td colspan="2" style="text-align: center;"><span class="label label-success">${uiLabelMap.CommonUpload}</span></td></tr>
			<#list PartyContentUpload as PartyContentUpload>
				<#if PartyContentUpload.partyId = PartyRelationship.partyIdTo>
				<tr>
					<td>${PartyContentUpload.contentName}</td>
					<td>
						<form name="removePartyContent_${PartyContentUpload_index}" style="display: inline-block;" method="post" action="<@ofbizUrl>removePartyContent</@ofbizUrl>">
		                  <input name="contentId" value="${PartyContentUpload.contentId}" type="hidden">
		                  <input name="partyId" value="${PartyContentUpload.partyId}" type="hidden">
		                  <input name="partyContentTypeId" value="${PartyContentUpload.partyContentTypeId}" type="hidden">
		                  <input name="fromDate" value="${PartyContentUpload.fromDate}" type="hidden">
		                  <a href="javascript:document.removePartyContent_${PartyContentUpload_index}.submit()">${uiLabelMap.CommonDelete}</a>
		                </form>
						<a href="ViewBinaryDataResource?externalLoginKey=${requestAttributes.externalLoginKey!}&contentId=${PartyContentUpload.contentId}">
							${uiLabelMap.CommonDownload}
						</a>
					</td>
				</tr>
				</#if>
			</#list>
			<tr>
				<form id="uploadParentPartyContent" method="post" enctype="multipart/form-data" action="<@ofbizUrl>uploadParentPartyContent</@ofbizUrl>">
		        <input type="hidden" name="dataCategoryId" value="PERSONAL"/>
		        <input type="hidden" name="statusId" value="CTNT_PUBLISHED"/>
		        <input name="contentTypeId" value="DOCUMENT" type="hidden">
		        <input type="hidden" name="partyId" value="${PartyRelationship.partyIdTo}" id="contentPartyId"/>
		        <input type="hidden" name="partyContentTypeId" value="VNDSHPINF"/>
		        <input type="hidden" name="isPublic" value="Y"/>
		        <input type="hidden" name="roleTypeId" value="_NA_"/>
				<td><input type="file" name="uploadedFile" class="required valid" size="25"/></td>
		        <td><input type="submit"  value="${uiLabelMap.CommonUpload}"/></td>
				</form>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><div style="padding: 5px;margin-bottom: 0px;" class="alert alert-warning" role="alert">${uiLabelMap.UploadParentContentWarning}</div></td>
			</tr>
			</tbody>
			</table>
		</#list>
	</div>
</div>
<form id="uploadPartyLogo" method="post" enctype="multipart/form-data">
<input type="hidden" name="dataCategoryId" value="PERSONAL"/>
<input type="hidden" name="contentTypeId" value="DOCUMENT"/>
<input type="hidden" name="statusId" value="CTNT_PUBLISHED"/>
<input type="hidden" name="partyId" value="${partyId}" id="contentPartyId"/>
<input type="hidden" name="partyContentTypeId" value="LGOIMGURL"/>
<input type="hidden" name="isPublic" value="Y"/>
</form>
<script>
    window.addEventListener('DOMContentLoaded', function () {
      var avatar = document.getElementById('avatar');
      var toplogo = document.getElementById('toplogo');
      var image = document.getElementById('image');
      var input = document.getElementById('input');
      var $progress = $('.progress');
      var $progressBar = $('.progress-bar');
      var $alert = $('.alert');
      var $modal = $('#modal');
      var cropper;
		
      $('[data-toggle="tooltip"]').tooltip();

      input.addEventListener('change', function (e) {
        var files = e.target.files;
        var done = function (url) {
          input.value = '';
          image.src = url;
          $alert.hide();
          $modal.modal('show');
        };
        var reader;
        var file;
        var url;

        if (files && files.length > 0) {
          file = files[0];

          if (URL) {
            done(URL.createObjectURL(file));
          } else if (FileReader) {
            reader = new FileReader();
            reader.onload = function (e) {
              done(reader.result);
            };
            reader.readAsDataURL(file);
          }
        }
      });

      $modal.on('shown.bs.modal', function () {
        cropper = new Cropper(image, {
          aspectRatio: 1,
          viewMode: 3,
        });
      }).on('hidden.bs.modal', function () {
        cropper.destroy();
        cropper = null;
      });

      document.getElementById('crop').addEventListener('click', function () {
        var initialAvatarURL;
        var canvas;

        $modal.modal('hide');

        if (cropper) {
          canvas = cropper.getCroppedCanvas({
            width: 160,
            height: 160,
          });

          initialAvatarURL = avatar.src;
          initialAvatarURL = toplogo.src;
          avatar.src = canvas.toDataURL();
          toplogo.src = canvas.toDataURL();
          $progress.show();
          $alert.removeClass('alert-success alert-warning');
          canvas.toBlob(function (blob) {
          	var form = document.getElementById("uploadPartyLogo");
            var formData = new FormData(form);

            formData.append('uploadedFile',blob);

            $.ajax('<@ofbizUrl>uploadPartyLogo</@ofbizUrl>', {
              method: 'POST',
              data: formData,
              processData: false,
              contentType: false,

              xhr: function () {
                var xhr = new XMLHttpRequest();

                xhr.upload.onprogress = function (e) {
                  var percent = '0';
                  var percentage = '0%';

                  if (e.lengthComputable) {
                    percent = Math.round((e.loaded / e.total) * 100);
                    percentage = percent + '%';
                    $progressBar.width(percentage).attr('aria-valuenow', percent).text(percentage);
                  }
                };

                return xhr;
              },

              success: function () {
                $alert.show().addClass('alert-success').text('${StringUtil.wrapString(uiLabelMap.UploadSuccess)}');
              },

              error: function () {
                avatar.src = initialAvatarURL;
                $alert.show().addClass('alert-warning').text('${StringUtil.wrapString(uiLabelMap.UploadError)}');
              },

              complete: function () {
                $progress.hide();
              },
            });
          });
        }
      });
    });
  </script>
<#else>
    <h3>${uiLabelMap.PartyNoPartyForCurrentUserName}: ${userLogin.userLoginId}</h3>
</#if>
