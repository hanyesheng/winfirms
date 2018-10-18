package org.apache.ofbiz.accounting.thirdparty.alipay.config;

/* *
 *绫诲悕锛欰lipayConfig
 *鍔熻兘锛氬熀纭�閰嶇疆绫�
 *璇︾粏锛氳缃笎鎴锋湁鍏充俊鎭強杩斿洖璺緞
 *鐗堟湰锛�3.3
 *鏃ユ湡锛�2012-08-10
 *璇存槑锛�
 *浠ヤ笅浠ｇ爜鍙槸涓轰簡鏂逛究鍟嗘埛娴嬭瘯鑰屾彁渚涚殑鏍蜂緥浠ｇ爜锛屽晢鎴峰彲浠ユ牴鎹嚜宸辩綉绔欑殑闇�瑕侊紝鎸夌収鎶�鏈枃妗ｇ紪鍐�,骞堕潪涓�瀹氳浣跨敤璇ヤ唬鐮併��
 *璇ヤ唬鐮佷粎渚涘涔犲拰鐮旂┒鏀粯瀹濇帴鍙ｄ娇鐢紝鍙槸鎻愪緵涓�涓弬鑰冦��
	
 *鎻愮ず锛氬浣曡幏鍙栧畨鍏ㄦ牎楠岀爜鍜屽悎浣滆韩浠借�匢D
 *1.鐢ㄦ偍鐨勭绾︽敮浠樺疂璐﹀彿鐧诲綍鏀粯瀹濈綉绔�(www.alipay.com)
 *2.鐐瑰嚮鈥滃晢瀹舵湇鍔♀��(https://b.alipay.com/order/myOrder.htm)
 *3.鐐瑰嚮鈥滄煡璇㈠悎浣滆�呰韩浠�(PID)鈥濄�佲�滄煡璇㈠畨鍏ㄦ牎楠岀爜(Key)鈥�

 *瀹夊叏鏍￠獙鐮佹煡鐪嬫椂锛岃緭鍏ユ敮浠樺瘑鐮佸悗锛岄〉闈㈠憟鐏拌壊鐨勭幇璞★紝鎬庝箞鍔烇紵
 *瑙ｅ喅鏂规硶锛�
 *1銆佹鏌ユ祻瑙堝櫒閰嶇疆锛屼笉璁╂祻瑙堝櫒鍋氬脊妗嗗睆钄借缃�
 *2銆佹洿鎹㈡祻瑙堝櫒鎴栫數鑴戯紝閲嶆柊鐧诲綍鏌ヨ銆�
 */

public class AlipayConfig {
	
	//鈫撯啌鈫撯啌鈫撯啌鈫撯啌鈫撯啌璇峰湪杩欓噷閰嶇疆鎮ㄧ殑鍩烘湰淇℃伅鈫撯啌鈫撯啌鈫撯啌鈫撯啌鈫撯啌鈫撯啌鈫撯啌鈫�
	// 鍚堜綔韬唤鑰匢D锛屼互2088寮�澶寸敱16浣嶇函鏁板瓧缁勬垚鐨勫瓧绗︿覆
	public static String partner = "2088121711685927";
	
	// 鏀舵鏀粯瀹濊处鍙凤紝涓�鑸儏鍐典笅鏀舵璐﹀彿灏辨槸绛剧害璐﹀彿
	public static String seller_email = "admin@winfirms.net";
	// 鍟嗘埛鐨勭閽�
	public static String key = "c79oscmnid64wr79a0cufsingtspb5aw";

	//鈫戔啈鈫戔啈鈫戔啈鈫戔啈鈫戔啈璇峰湪杩欓噷閰嶇疆鎮ㄧ殑鍩烘湰淇℃伅鈫戔啈鈫戔啈鈫戔啈鈫戔啈鈫戔啈鈫戔啈鈫戔啈鈫�
	

	// 璋冭瘯鐢紝鍒涘缓TXT鏃ュ織鏂囦欢澶硅矾寰�
	public static String log_path = "D:\\";

	// 瀛楃缂栫爜鏍煎紡 鐩墠鏀寔 gbk 鎴� utf-8
	public static String input_charset = "utf-8";
	
	// 绛惧悕鏂瑰紡 涓嶉渶淇敼
	public static String sign_type = "MD5";

}
