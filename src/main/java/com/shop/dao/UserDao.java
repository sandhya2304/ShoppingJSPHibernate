package com.shop.dao;

import java.util.List;

import org.hibernate.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.shop.entities.Product;
import com.shop.entities.User;

public class UserDao
{
	
	private SessionFactory sessionFactory;
	
	public UserDao(SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}
	
	
	public User getUserByEmailAndPassword(String email,String password)
	{
		User user = null;
				
		try
		{		
			String query = " from User where userEmail =: e and userPassword =: p";
			Session session = this.sessionFactory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("e",email);
			q.setParameter("p",password);
			
			user = (User) q.uniqueResult();		
			session.close();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
		return user;
	}
	
	
	public List<User> getAllUsers()
	{
		 List<User> users = null;
		
		try
		{		
			Session session = this.sessionFactory.openSession();
		    Query query  = session.createQuery("from User");
		    users= query.list();	   
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		 return users;
		
	}
	
	
	
	
	

}
