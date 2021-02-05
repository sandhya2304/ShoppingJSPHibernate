package com.shop.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.shop.entities.Category;

public class CategoryDao
{
	
	private SessionFactory sessionFactory;

	public CategoryDao(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	public int saveCategory(Category cat){
	    
		Session session = this.sessionFactory.openSession();
		Transaction tx  = session.beginTransaction();
		
		int catId = (Integer) session.save(cat);
		tx.commit();
		session.close();
			
		return catId;
	}
	
	
	public List<Category> allCategory()
	{
		Session s = this.sessionFactory.openSession();
		Query query =s.createQuery("from Category");
		List<Category> list = query.list();
		
		return list;
		
	}
	
	
	public Category getCategoryById(int catId)
	{
		
		Category cat = null;
		try
		{
			Session s = this.sessionFactory.openSession();
			
			//fetch category with hibernate session
			cat = s.get(Category.class,catId);
			s.close();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return cat;
		
	}
	
	
	
	

}
