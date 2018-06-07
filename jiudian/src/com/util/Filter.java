package com.util;
/**
 * 
 * HTML���Ź�����
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
			if( ch == '<' ) { // �� < ת���� &lt;
				buf.append( "&lt;" );
			}
			else if( ch == '>' ) {// �� > ת���� &gt;
				buf.append( "&gt;" );
			}
			else if(ch=='&'){ // ��  & ת���� &amp;
				buf.append("&amp;");
			}
			else {
				buf.append( ch );
			}
		}
			return buf.toString();
	}
	
}
