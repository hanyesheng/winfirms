package org.apache.ofbiz.accounting.thirdparty.alipay.sign;

import java.io.UnsupportedEncodingException;
import java.security.SignatureException;

import org.apache.commons.codec.digest.DigestUtils;

/** 
* 鍔熻兘锛氭敮浠樺疂MD5绛惧悕澶勭悊鏍稿績鏂囦欢锛屼笉闇�瑕佷慨鏀�
* 鐗堟湰锛�3.3
* 淇敼鏃ユ湡锛�2012-08-17
* 璇存槑锛�
* 浠ヤ笅浠ｇ爜鍙槸涓轰簡鏂逛究鍟嗘埛娴嬭瘯鑰屾彁渚涚殑鏍蜂緥浠ｇ爜锛屽晢鎴峰彲浠ユ牴鎹嚜宸辩綉绔欑殑闇�瑕侊紝鎸夌収鎶�鏈枃妗ｇ紪鍐�,骞堕潪涓�瀹氳浣跨敤璇ヤ唬鐮併��
* 璇ヤ唬鐮佷粎渚涘涔犲拰鐮旂┒鏀粯瀹濇帴鍙ｄ娇鐢紝鍙槸鎻愪緵涓�涓�
* */

public class MD5 {

    /**
     * 绛惧悕瀛楃涓�
     * @param text 闇�瑕佺鍚嶇殑瀛楃涓�
     * @param key 瀵嗛挜
     * @param input_charset 缂栫爜鏍煎紡
     * @return 绛惧悕缁撴灉
     */
    public static String sign(String text, String key, String input_charset) {
    	text = text + key;
    	return DigestUtils.md5Hex(getContentBytes(text, input_charset));
    }
    
    /**
     * 绛惧悕瀛楃涓�
     * @param text 闇�瑕佺鍚嶇殑瀛楃涓�
     * @param sign 绛惧悕缁撴灉
     * @param key 瀵嗛挜
     * @param input_charset 缂栫爜鏍煎紡
     * @return 绛惧悕缁撴灉
     */
    public static boolean verify(String text, String sign, String key, String input_charset) {
    	text = text + key;
    	String mysign = DigestUtils.md5Hex(getContentBytes(text, input_charset));
    	if(mysign.equals(sign)) {
    		return true;
    	}
    	else {
    		return false;
    	}
    }

    /**
     * @param content
     * @param charset
     * @return
     * @throws SignatureException
     * @throws UnsupportedEncodingException 
     */
    private static byte[] getContentBytes(String content, String charset) {
        if (charset == null || "".equals(charset)) {
            return content.getBytes();
        }
        try {
            return content.getBytes(charset);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("MD5绛惧悕杩囩▼涓嚭鐜伴敊璇�,鎸囧畾鐨勭紪鐮侀泦涓嶅,鎮ㄧ洰鍓嶆寚瀹氱殑缂栫爜闆嗘槸:" + charset);
        }
    }

}