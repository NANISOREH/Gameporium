package Controller.registration;

public class Utils 
{
	public Utils() {}
	
	public static boolean isValidPass (String pass, String confirmPass)
	{
		if (pass.length() >= 8 && pass.length() <= 20 && pass.equals(confirmPass))
			return true;
		
		return false;
	}
}
