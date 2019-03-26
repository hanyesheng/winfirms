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
	<#assign personContentId = PartyContent.contentId!/>
	<#if personContentId?has_content>
		<#assign personLogoUrl = "/content/control/stream?contentId=${personContentId}"!/>
	</#if>
</#list>
<div class="uk-grid" data-uk-grid-margin>
    <div class="uk-width-large-7-10">
        <div class="md-card">
            <div class="user_heading">
                <div class="user_heading_avatar fileinput fileinput-new" data-provides="fileinput">
                    <div class="fileinput-new thumbnail">
                        <img src="${personLogoUrl}" id="avatar" alt="user avatar"/>
                    </div>
                    <div class="user_avatar_controls">
                        <span class="btn-file">
                            <span class="fileinput-new"><i class="material-icons">&#xE2C6;</i></span>
                            <span class="fileinput-exists"><i class="material-icons">&#xE86A;</i></span>
                            <input type="file" name="user_edit_avatar_control" id="input" accept="image/*">
                        </span>
                        <a href="#" class="btn-file fileinput-exists" data-dismiss="fileinput"><i class="material-icons">&#xE5CD;</i></a>
                    </div>
                    <div class="uk-alert" data-uk-alert="" style="display: none;"><span class="uk-alert-text"></span><a href="#" class="uk-alert-close uk-close"></a></div>
                </div>
                <div class="user_heading_content">
                    <h2 class="heading_b"><span class="uk-text-truncate" id="user_edit_uname">${person.nickname!}</span><span class="sub-heading" id="user_edit_position"><#if person.comments??>${person.comments!}<#else>${uiLabelMap.NoPartyComments}</#if></span></h2>
                </div>
            </div>
            <div class="user_content">
            	<div class="md-card modal" id="modal" style="display: none;">
                    <div class="md-card-toolbar" data-toolbar-progress="">
                        <div class="md-card-toolbar-actions">
                            <button type="button" class="md-btn md-btn-small md-btn-flat" id="modal-close">${uiLabelMap.CommonClose}&nbsp;<i class="material-icons">&#xE5CD;</i></button>
                        </div>
                        <h3 class="md-card-toolbar-heading-text">
                            ${uiLabelMap.UploadYourLogo}
                        </h3>
                    </div>
                    <div class="md-card-content">
                        <div class="img-container">
			              <img id="image" src="${personLogoUrl}">
			            </div>
                        <div class="uk-progress uk-progress-striped uk-active">
                            <div class="uk-progress-bar"></div>
                        </div>
			            <div class="blog_list_footer uk-text-center">
	                    	<div class="md-card-toolbar-actions">
	                            <button type="button" class="md-btn md-btn-flat md-btn-flat-primary" id="crop"><i class="material-icons uk-text-primary">&#xE2C6;</i>${uiLabelMap.CommonUpload}</button>
	                       </div>
	                   	</div>
                    </div>
                </div>
                <ul id="user_edit_tabs" class="uk-tab" data-uk-tab="{connect:'#user_edit_tabs_content'}">
                    <li class="uk-active"><a href="#">${uiLabelMap.BasicInformation}</a></li>
                </ul>
                <ul id="user_edit_tabs_content" class="uk-switcher uk-margin">
                    <li>
						<form id="editpersonform1" method="post" action="<@ofbizUrl>updatePerson</@ofbizUrl>" name="editpersonform">
                        <input type="hidden" name="partyId" value="${person.partyId!}"/>
                        <div class="uk-margin-top wrapper-full">
                            <div class="uk-grid" data-uk-grid-margin>
                            	<div class="uk-width-medium-1-2">
                                    <label for="nickname">${uiLabelMap.PartyNickName}</label>
                                    <input type="text" id="nickname" name="nickname" value="${personData.nickname!}" class="md-input"/>
                                </div>
                                <div class="uk-width-medium-1-2">
                                    <label for="gender">${uiLabelMap.PartyGender}</label>
                                    <select name="gender" class="md-input" id="gender">
						            <#if personData.gender?has_content >
						              <option value="${personData.gender}">
						                <#if personData.gender == "M" >${uiLabelMap.CommonMale}</#if>
						                <#if personData.gender == "F" >${uiLabelMap.CommonFemale}</#if>
						              </option>
						              <option value=""> --</option>
						            <#else>
						              <option value=""> --</option>
						            </#if>
						              <option value="M">${uiLabelMap.CommonMale}</option>
						              <option value="F">${uiLabelMap.CommonFemale}</option>
						            </select>
                                </div>
								<div class="uk-width-medium-1-2">
                                    <label for="lastName">${uiLabelMap.PartyLastName}*</label>
									<input type="text" class="md-input" id="lastName" name="lastName" value="${personData.lastName!}"/>
                                </div>
                                <div class="uk-width-medium-1-2">
                                    <label for="firstName">${uiLabelMap.PartyFirstName}*</label>
                                	<input type="text" class="md-input" id="firstName" name="firstName" value="${personData.firstName!}"/>
								</div>
                                <div class="uk-width-medium-1-2">
                                    <label for="birthDate">${uiLabelMap.PartyBirthDate}</label>
                                    <input class="md-input" type="text" id="birthDate" name="birthDate" data-uk-datepicker="{format:'YYYY-MM-DD'}" value="${(personData.birthDate.toString())!}">
                                </div>
                            </div>
                            <div class="uk-grid">
                                <div class="uk-width-1-1">
                                    <label for="comments">${uiLabelMap.CommonComment}</label>
                                    <textarea class="md-input md-input-full" name="comments" id="comments" >${personData.comments!}</textarea>
                                </div>
                            </div>
                            <a href="javascript:document.editpersonform.submit()" class="md-btn md-btn-block md-btn-flat-primary">${uiLabelMap.CommonSave}</a>
                        </div>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
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
      	var $progress = $('.uk-progress');
      	var $progressBar = $('.uk-progress-bar');
      	var $alert = $('.uk-alert');
      	var $alerttext = $('.uk-alert-text');
      	var $modal = $('#modal');
      	var cropper;
		
      	$('[data-toggle="tooltip"]').tooltip();
		
		document.getElementById('input').addEventListener('click', function () {
			$modal.hide();
			cropper.destroy();
			cropper = null;
		});
		
      	input.addEventListener('change', function (e) {
        	var files = e.target.files;
        	var done = function (url) {
          	input.value = '';
          	image.src = url;
          	$alert.hide();
          	$modal.show();
			cropper = new Cropper(image, {
	          aspectRatio: 1,
	          viewMode: 3,
	        });
	        var percent = '0';
          	var percentage = '0%';
          	$progressBar.width(percentage).text(percentage);
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
		
		document.getElementById('modal-close').addEventListener('click', function () {
			$modal.hide();
			cropper.destroy();
			cropper = null;
		});
		
      	document.getElementById('crop').addEventListener('click', function () {
        	var initialAvatarURL;
        	var canvas;


		    if (cropper) {
		      canvas = cropper.getCroppedCanvas({
		        width: 160,
		        height: 160,
		      });

          	initialAvatarURL = avatar.src;
//        	上传好的图片替换掉原来
          	initialAvatarURL = toplogo.src;
          	avatar.src = canvas.toDataURL();
          	toplogo.src = canvas.toDataURL();
     	 	$progress.show();
          	$alert.removeClass('uk-alert-success uk-alert-warning');
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
                $alert.show().addClass('uk-alert-success');
                $alerttext.text('${StringUtil.wrapString(uiLabelMap.UploadSuccess)}');
              },

              error: function () {
                avatar.src = initialAvatarURL;
                $alert.show().addClass('uk-alert-warning');
                $alerttext.text('${StringUtil.wrapString(uiLabelMap.UploadError)}');
              },

              complete: function () {
              	$modal.hide();
                cropper.destroy();
    			cropper = null;
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