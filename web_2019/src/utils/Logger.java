package utils;

public class Logger {

	/** formatta e stampa in console la stringa
	 * 
	 * @param msg @see {@link String#format(String, Object...)}
	 * @param params gli objects
	 * @return la stringa formattata, stampata in console
	 */
	
	public static String log(String msg, Object... params) {
		String callerClassName = new Exception().getStackTrace()[1].getClassName();
		Object[] obj2 = new Object[params.length+1];
		obj2[0] = callerClassName;
		for (int i = 1; i < obj2.length; i++) {
			//System.out.println("parametro "+i+": "+obj2[i]);
			obj2[i] = params[i-1];
		}
		String formattedStr = String.format("\n%s: \n\t"+msg+"\n\n", obj2);
		System.out.print(formattedStr);
		return formattedStr;
	}

}