package main;

public class StringUtil {
	public String nullToBlank(String str)
	{	
		if(str == null || str.equals("-"))
		{
			str = "";
		}
		
		return str;
	}
	
	public String nullToZero(String str)
	{	
		if(str == null || str.equals("") || str.equals(".") || str.equals("-"))
		{
			str = "200";
		}
		
		return str;
	}
	
	public String noneToBar(Double str)
	{	
		if(str == 200)
		{
			return "-";
		}
		return Double.toString(str);
	}
}
