package web_2019;

public class Logger {

	public static void log(String msg, Object... params) {
		String callerClassName = new Exception().getStackTrace()[1].getClassName();
		Object[] obj2 = new Object[params.length+1];
		obj2[0] = callerClassName;
		for (int i = 1; i < obj2.length; i++) {
			//System.out.println("parametro "+i+": "+obj2[i]);
			obj2[i] = params[i-1];
		}
		System.out.print(String.format("\n%s: \n\t"+msg+"\n\n", obj2));
	}

}