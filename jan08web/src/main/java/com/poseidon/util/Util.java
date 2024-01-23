package com.poseidon.util;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

public class Util {
	// String 값이 들어오면 int 타입인지 확인해보는 메소드
	// 127 -> true
	// 1A2A5 ->false

	public static int str2Int(String str) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < str.length(); i++) {
			if (Character.isDigit(str.charAt(i))) {
				sb.append(str.charAt(i));
			}
		}
		int number = 0;
		if (sb.length() > 0) {
			number = Integer.parseInt(sb.toString());
		}
		System.out.println("변환된 숫자" + number);
		return number;
	}

	public static int str2Int2(String str) {
		String numberOnly = str.replaceAll("[^0-9]", "");
		return Integer.parseInt(numberOnly);
	}

	public static boolean intCheck(String str) {
		try {
			int no = Integer.parseInt(str);
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	// String 값이 들어오면 int 타입인지 확인해보는 메소드
	// 127 -> true
	// 1A2A5 ->false
	public static boolean intCheck2(String str) {
		boolean result = false;
		for (int i = 0; i < str.length(); i++) {
			if (!Character.isDigit(str.charAt(i))) {
				result = false;
				break;
			}

		}
		return result;
	}

	// IP얻어오기
	public static String getIP(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");
		if (ip == null) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	// HTML 태그를 특수기호로 변경하기 < &lt > &gt
	public static String removeTag(String str) {
		str = str.replaceAll("<", "&lt");
		str = str.replaceAll(">", "&gt");
		return str;
	}

	public static String addBR(String str) {
		return str.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
	}

	// 하트로 바꾸는 메소드
//	public static String heart(String str){
//		
//		char ch[] = str.toCharArray();
//		ch[5] = '☆';
//		
//		str = String.valueOf(ch);
//		
//		
//		
//		
//		return str;
//		
//	}

	public static String ipMasking(String ip) {
	      if(ip.indexOf('.') != -1) { //ip가 아닐 때를 대비
	         StringBuffer sb = new StringBuffer();//멀티스레드 환경에서도 동기화 지원
	         sb.append(ip.substring(0, ip.indexOf('.')+1));
	         sb.append("♡");
	         sb.append(ip.substring(ip.indexOf('.', ip.indexOf('.')+1)));
	         return sb.toString();
	      } else {
	         return ip;
	      }
	   }
}
