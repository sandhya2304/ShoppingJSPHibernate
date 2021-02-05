package com.shop.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.shop.entities.Product;

public class ProductDao
{
	
	
	private SessionFactory sessionFactory;

	public ProductDao(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}
	
	
	public boolean saveProduct(Product product)
	{
		boolean status = false;
		try{
		
			Session session = this.sessionFactory.openSession();
			Transaction tx = session.beginTransaction();
			
			
			session.save(product);
			
			tx.commit();
			session.close();
		
			status = true; 
			
		}catch(Exception e)
		{
			e.printStackTrace();
			status = false;
		}
		return status;
	
	}
	
	
	//get All Products
	
	public List<Product> getAllProducts()
	{
		 List<Product> products = null;
		
		try
		{		
			Session session = this.sessionFactory.openSession();
		    Query query  = session.createQuery("from Product");
		   products = query.list();	   
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		 return products;
		
	}
	
	
	
	//get  Product by category
	
		public List<Product> getProductByCategoryId(int cid)
		{
			 List<Product> products = null;
			
			try
			{		
				Session session = this.sessionFactory.openSession();
			    Query query  = session.createQuery("from Product as p where p.category.categoryId =: id ");
			    query.setParameter("id",cid);
			   products = query.list();	   
				
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			
			 return products;
			
		}
		
	
	
	
	
	
	

}
