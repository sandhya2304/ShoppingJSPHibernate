package com.shop;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider
{
	
	private static SessionFactory sessionFactory;
	
	public static SessionFactory getSessionFactory() 
	{
		
		try
		{
			
			if(sessionFactory == null){
				sessionFactory = new Configuration()
						            .configure("hibernate.cfg.xml")
						              .buildSessionFactory();
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return sessionFactory;
	}
	
	

}
