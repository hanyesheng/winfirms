
This is a hot-deploy component directory.
All components in this tree will be loaded after the OFBiz components, including those in:
framework
themes
applications
specialpurpose

The hot-deploy Auto-Loading feature loads all components in the order they are found (i.e. alphabetic or creation date).

If you need a specific loading order of these components then you need to disable the Auto-Loading feature 
by creating a component-load.xml file in the hot-deploy directory and use the load-component tag to load 
your components in the order you want (just use the component-load.xml file in the application folder as a template).


//实体数量
//<set field="productSize" value="${util:size(Products)}" type="Integer"/>
gradle "ofbiz --load-data readers=seed-initial"
gradle "ofbiz --load-data readers=seed-alipay"
gradle "ofbiz --load-data readers=theme"
gradle "ofbiz --load-data readers=EXT_ALIPAY"
gradle "ofbiz --load-data readers=webmgr"