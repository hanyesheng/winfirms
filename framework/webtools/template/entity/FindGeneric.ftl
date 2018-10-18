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
        <form method="post" action="<@ofbizUrl>FindGeneric?entityName=${entityName}</@ofbizUrl>">
          <input type="hidden" name="find" value="true"/>
          <input type="hidden" name="searchOptions_collapsed" value="true"/>
          <table class="basic-table uk-table" cellspacing="0">
            <tr class="header-row-2">
              <td>${uiLabelMap.WebtoolsFieldName}</td>
              <td>${uiLabelMap.WebtoolsPk}</td>
              <td>${uiLabelMap.WebtoolsFieldType}</td>
              <td>&nbsp;</td>
            </tr>
            <#list fieldList as field>
                <tr>
                    <td>${field.name}</td>
                    <td><#if field.isPk == 'Y'>*</#if></td>
                    <td>${field.javaType},&nbsp;${field.sqlType}</td>
                    <td><input type="text" name="${field.name}" value="${field.param}" size="40"/></td>
                </tr>
            </#list>
                <tr>
                    <td colspan="3"><h3>${uiLabelMap.WebtoolsToFindAll} ${entityName}, ${uiLabelMap.WebtoolsLeaveAllEntriesBlank}</h3></td>
                    <td><input type="submit" value="${uiLabelMap.CommonFind}"/></td>
                </tr>
            </table>
        </form>
