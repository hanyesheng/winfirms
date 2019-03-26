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

<#assign nowTimestamp = Static["org.apache.ofbiz.base.util.UtilDateTime"].nowTimestamp()>
<!-- FOOTER -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h4 class="space30">${uiLabelMap.EcommerceAboutUs}</h4>
					<p>${uiLabelMap.Intro1}</p>
				</div>
				<div class="col-md-6">
					<h4 class="space30">${uiLabelMap.ContactMechanism}</h4>
					<div class="col-md-6">
					<ul class="c-info" style="padding: 0px;">
						<li><i class="fa fa-map-marker"></i> ${uiLabelMap.CompanyAddress1}<br>${uiLabelMap.CompanyAddress2}</li>
						<li><i class="fa fa-phone"></i> ${uiLabelMap.PhoneNumber}</li>
					</ul>
					</div>
					<div class="col-md-6">
					<ul class="c-info" style="padding: 0px;">
						<li><i class="fa fa-envelope-o"></i> ${uiLabelMap.EMail}</li>
						<li><i class="fa fa-weibo"></i> ${uiLabelMap.Weibo}</li>
					</ul>
					</div>
					<div class="clearfix space10"></div>
				</div>
			</div>
		</div>
	</footer>

	<!-- FOOTER COPYRIGHT -->
	<div class="footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<p>&copy; ${uiLabelMap.CommonCopyright} &copy; 2015-${nowTimestamp?string("yyyy")}${(productStore.companyName)!}</p>
				</div>
				
			</div>
		</div>
	</div>
</div>

<!-- END STYLE SWITCHER 
============================================= -->


<!-- jQuery -->


<!-- cropper -->
<script src="/images/winfirms/cropper/dist/cropper.min.js"></script>
<!-- Plugins -->
<script src="/images/winfirms/js/bootstrap.min.js"></script>
<script src="/images/winfirms/js/menu.js"></script>
<script src="/images/winfirms/js/owl-carousel/owl.carousel.min.js"></script>
<script src="/images/winfirms/js/rs-plugin/js/jquery.themepunch.tools.min.js"></script>   
<script src="/images/winfirms/js/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<script src="/images/winfirms/js/jquery.easing.min.js"></script>
<script src="/images/winfirms/js/isotope/isotope.pkgd.js"></script>
<script src="/images/winfirms/js/jflickrfeed.min.js"></script>
<script src="/images/winfirms/js/tweecool.js"></script>
<script src="/images/winfirms/js/flexslider/jquery.flexslider.js"></script>
<script src="/images/winfirms/js/easypie/jquery.easypiechart.min.js"></script>

<script src="/images/winfirms/js/jquery-ui.js"></script>

<script src="/images/winfirms/js/jquery.appear.js"></script>
<script src="/images/winfirms/js/jquery.inview.js"></script>
<script src="/images/winfirms/js/jquery.countdown.min.js"></script>
<script src="/images/winfirms/js/jquery.sticky.js"></script>
<script src="/images/winfirms/js/magnific-popup/jquery.magnific-popup.min.js"></script>

<script src="/images/winfirms/js/main.js"></script>
