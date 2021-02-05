package com.shop;




public class Helper
{
	
	public static String getTenWords(String desc)
	{
		String str[] = desc.split(" ");
		
		if(str.length > 10)
		{
			
			String res = " ";
			for(int i=0;i<10;i++)
			{
				res = res + str[i]+" ";
			}
			
			return (res + "...");
		}else{
			
			
			
			return (desc+"...");
		}
		
		
	}

}
