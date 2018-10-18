package org.apache.ofbiz.accounting.thirdparty.alipay.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.httpclient.methods.multipart.FilePartSource;
import org.apache.commons.httpclient.methods.multipart.PartSource;

import org.apache.ofbiz.accounting.thirdparty.alipay.config.AlipayConfig;

/* *
 *绫诲悕锛欰lipayFunction
 *鍔熻兘锛氭敮浠樺疂鎺ュ彛鍏敤鍑芥暟绫�
 *璇︾粏锛氳绫绘槸璇锋眰銆侀�氱煡杩斿洖涓や釜鏂囦欢鎵�璋冪敤鐨勫叕鐢ㄥ嚱鏁版牳蹇冨鐞嗘枃浠讹紝涓嶉渶瑕佷慨鏀�
 *鐗堟湰锛�3.3
 *鏃ユ湡锛�2012-08-14
 *璇存槑锛�
 *浠ヤ笅浠ｇ爜鍙槸涓轰簡鏂逛究鍟嗘埛娴嬭瘯鑰屾彁渚涚殑鏍蜂緥浠ｇ爜锛屽晢鎴峰彲浠ユ牴鎹嚜宸辩綉绔欑殑闇�瑕侊紝鎸夌収鎶�鏈枃妗ｇ紪鍐�,骞堕潪涓�瀹氳浣跨敤璇ヤ唬鐮併��
 *璇ヤ唬鐮佷粎渚涘涔犲拰鐮旂┒鏀粯瀹濇帴鍙ｄ娇鐢紝鍙槸鎻愪緵涓�涓弬鑰冦��
 */

public class AlipayCore {

    /** 
     * 闄ゅ幓鏁扮粍涓殑绌哄�煎拰绛惧悕鍙傛暟
     * @param sArray 绛惧悕鍙傛暟缁�
     * @return 鍘绘帀绌哄�间笌绛惧悕鍙傛暟鍚庣殑鏂扮鍚嶅弬鏁扮粍
     */
    public static Map<String, String> paraFilter(Map<String, String> sArray) {

        Map<String, String> result = new HashMap<String, String>();

        if (sArray == null || sArray.size() <= 0) {
            return result;
        }

        for (String key : sArray.keySet()) {
            String value = sArray.get(key);
            if (value == null || value.equals("") || key.equalsIgnoreCase("sign")
                || key.equalsIgnoreCase("sign_type")) {
                continue;
            }
            result.put(key, value);
        }

        return result;
    }

    /** 
     * 鎶婃暟缁勬墍鏈夊厓绱犳帓搴忥紝骞舵寜鐓р�滃弬鏁�=鍙傛暟鍊尖�濈殑妯″紡鐢ㄢ��&鈥濆瓧绗︽嫾鎺ユ垚瀛楃涓�
     * @param params 闇�瑕佹帓搴忓苟鍙備笌瀛楃鎷兼帴鐨勫弬鏁扮粍
     * @return 鎷兼帴鍚庡瓧绗︿覆
     */
    public static String createLinkString(Map<String, String> params) {

        List<String> keys = new ArrayList<String>(params.keySet());
        Collections.sort(keys);

        String prestr = "";

        for (int i = 0; i < keys.size(); i++) {
            String key = keys.get(i);
            String value = params.get(key);

            if (i == keys.size() - 1) {//鎷兼帴鏃讹紝涓嶅寘鎷渶鍚庝竴涓�&瀛楃
                prestr = prestr + key + "=" + value;
            } else {
                prestr = prestr + key + "=" + value + "&";
            }
        }

        return prestr;
    }

    /** 
     * 鍐欐棩蹇楋紝鏂逛究娴嬭瘯锛堢湅缃戠珯闇�姹傦紝涔熷彲浠ユ敼鎴愭妸璁板綍瀛樺叆鏁版嵁搴擄級
     * @param sWord 瑕佸啓鍏ユ棩蹇楅噷鐨勬枃鏈唴瀹�
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(AlipayConfig.log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /** 
     * 鐢熸垚鏂囦欢鎽樿
     * @param strFilePath 鏂囦欢璺緞
     * @param file_digest_type 鎽樿绠楁硶
     * @return 鏂囦欢鎽樿缁撴灉
     */
    public static String getAbstract(String strFilePath, String file_digest_type) throws IOException {
        PartSource file = new FilePartSource(new File(strFilePath));
    	if(file_digest_type.equals("MD5")){
    		return DigestUtils.md5Hex(file.createInputStream());
    	}
    	else if(file_digest_type.equals("SHA")) {
    		return DigestUtils.sha256Hex(file.createInputStream());
    	}
    	else {
    		return "";
    	}
    }
}
