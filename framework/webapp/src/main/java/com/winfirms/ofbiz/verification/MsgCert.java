package com.winfirms.ofbiz.verification;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.ofbiz.base.util.UtilProperties;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MsgCert {
	 static String sendStatus;
	 static final String sendUrl = "https://api.netease.im/sms/sendcode.action";
	 static final String checkUrl = "https://api.netease.im/sms/verifycode.action";
	 static final String appKey = "d77e9c4aa389083306d34a0268d1cee3";
	 static final String appSecret = "753be5edf059";
	 static final String nonce =  "1245167345";
	 static String curTime = String.valueOf((new Date()).getTime() / 1000L);
	 static String checkSum = CheckSumBuilder.getCheckSum(appSecret, nonce ,curTime);//参考 计算CheckSum的java代码

    public static String sendMsg(HttpServletRequest request, HttpServletResponse response) throws Exception{
    	String mobile = request.getParameter("mobile");
    	CloseableHttpClient httpClient = HttpClientUtil.createSSLClientDefault();
        HttpPost httpPost = new HttpPost(sendUrl);
        
        // 设置请求的header
        httpPost.addHeader("AppKey", appKey);
        httpPost.addHeader("Nonce", nonce);
        httpPost.addHeader("CurTime", curTime);
        httpPost.addHeader("CheckSum", checkSum);
        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        // 设置请求的参数
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        nvps.add(new BasicNameValuePair("mobile", mobile));
        nvps.add(new BasicNameValuePair("templateid", "3973153"));
        UrlEncodedFormEntity uefEntity;  
        try {  
            uefEntity = new UrlEncodedFormEntity(nvps, "UTF-8");  
            httpPost.setEntity(uefEntity);  
            System.out.println("executing request " + httpPost.getURI());  
            CloseableHttpResponse response1 = httpClient.execute(httpPost);  
            try {  
                HttpEntity entity = response1.getEntity();  
                
                if (entity != null) {  
                    System.out.println("--------------------------------------");  
                    System.out.println("Response content: " + EntityUtils.toString(entity, "UTF-8"));  
                    System.out.println("--------------------------------------");  
                }
                
                if(response1.getStatusLine().getStatusCode()==200){
                	sendStatus = "success";
                }else{
                	sendStatus = "erro";
                }
            } finally {  
                response1.close();  
            }  
        } catch (ClientProtocolException e) {  
            e.printStackTrace();  
        } catch (UnsupportedEncodingException e1) {  
            e1.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        } finally {
        	httpPost.releaseConnection();
        	httpClient.close();
        }
        return sendStatus;
    }
    
    public static void checkMsg(String mobile, String code,List<String> errorMessageList,Locale locale) throws Exception{
    	String errMsg = null;
    	final String resource = "SecurityextUiLabels";
    	CloseableHttpClient httpClient = HttpClientUtil.createSSLClientDefault();
        HttpPost httpPost = new HttpPost(checkUrl);
        // 设置请求的header
        httpPost.addHeader("AppKey", appKey);
        httpPost.addHeader("Nonce", nonce);
        httpPost.addHeader("CurTime", curTime);
        httpPost.addHeader("CheckSum", checkSum);
        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");


        // 设置请求的参数
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        nvps.add(new BasicNameValuePair("mobile", mobile));
        nvps.add(new BasicNameValuePair("code", code));
        UrlEncodedFormEntity uefEntity;  
        try {  
            uefEntity = new UrlEncodedFormEntity(nvps, "UTF-8");  
            httpPost.setEntity(uefEntity);  
            System.out.println("executing request " + httpPost.getURI());  
            CloseableHttpResponse response1 = httpClient.execute(httpPost);
            try {  
                HttpEntity entity = response1.getEntity();  
                String json = EntityUtils.toString(entity, "UTF-8");
                
                if (response1.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {  
                    System.out.println("--------------------------------------");  
                    System.out.println("Response content: " + json);  
                    System.out.println("--------------------------------------");
                    com.google.gson.Gson gson = new com.google.gson.Gson();
                    Response respuesta = gson.fromJson(json, Response.class);

                    String codeString = respuesta.getCode(); 
                        if(codeString.equals("200")){

                        }else if (codeString.equals("404")){
                        	errMsg = UtilProperties.getMessage(resource,"msgCert.erro_no_code", locale);
                            errorMessageList.add(errMsg);
                        }else{
                            errMsg = UtilProperties.getMessage(resource,"msgCert.erro_wrong_code", locale);
                            errorMessageList.add(errMsg);
                        }
                 }
            } finally {  
                response1.close();  
            }  
        } catch (ClientProtocolException e) {  
            e.printStackTrace();  
        } catch (UnsupportedEncodingException e1) {  
            e1.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        } finally {
        	httpPost.releaseConnection();
        	httpClient.close();
        }

    }
    
}
