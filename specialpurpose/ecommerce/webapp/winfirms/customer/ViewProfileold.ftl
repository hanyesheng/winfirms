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
<#assign personLogoUrl = "/images/winfirms/user.png"!/>
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
						<td>${uiLabelMap.PersonLogo}</td>
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
//        initialAvatarURL = toplogo.src;
          avatar.src = canvas.toDataURL();
//        toplogo.src = canvas.toDataURL();
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
