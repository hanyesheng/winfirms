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

<div class="container space30">
	<div class="tab-content project-tab-content">
		<div class="tab-pane active">
			<div class="row">
				<div class="col-md-12">
					<div class="panel-group" id="accordion-e1">
						<div class="panel panel-default">
						<#assign coldy = 0>
						<#list ProductContent as ProductContent>
						<#assign dataResourceId = ProductContent.dataResourceId! />
		            	<#assign textData = null! />
		            	<#if dataResourceId?has_content>
		            		<#list dataText as dataText>
								<#if dataText.dataResourceId = dataResourceId>
									<#assign textData = dataText.textData! />
								</#if>
							</#list>
						</#if>
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle" style="padding: 10px;" data-toggle="collapse" data-parent="#accordion-e1" href="#collapse${coldy}">
								${ProductContent.description}<span style="top: 11px;" class="fa fa-chevron-down"></span>
								</a>
							</h4>
						</div>
						<div id="collapse${coldy}" class="panel-collapse collapse <#if coldy = 0>in</#if>">
							<div class="panel-body">
								<div class="row">
									${StringUtil.wrapString(textData!)}
									<p> </p>
								</div>
							</div>
						</div>
						<#assign coldy = coldy + 1>
						</#list>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>