package com.util;
/**
 * 
 * HTML符号过滤类
 *
 */
public final class Filter {

	public Filter(){
		
	}
	
	/**
	 * @param input
	 * @return
	 */
	public static String escapeHTMLTags( String input ) {

		if( input == null || input.length() == 0 ) {
			return input;
		}
		StringBuffer buf = new StringBuffer();
		char ch = ' ';
		for( int i=0; i<input.length(); i++ ) {
			ch = input.charAt(i);
			if( ch == '<' ) { // 把 < 转换成 &lt;
				buf.append( "&lt;" );
			}
			else if( ch == '>' ) {// 把 > 转换成 &gt;
				buf.append( "&gt;" );
			}
			else if(ch=='&'){ // 把  & 转换成 &amp;
				buf.append("&amp;");
			}
			else {
				buf.append( ch );
			}
		}
			return buf.toString();
	}
	
}
