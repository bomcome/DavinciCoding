package com.dc.util;

import java.util.UUID;

//
/*fsd*/
//alt + shift + j : 문서화 주석

public class CommonUtils {

	// 파일의 이름을 난수화 시킬 메서드
	/**
	 * @Author	:	Administrator
	 * @Date	:	2019. 4. 9.
	 * @Method Name	:	getRandomString
	 * @return	:	String
	 */
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
}
