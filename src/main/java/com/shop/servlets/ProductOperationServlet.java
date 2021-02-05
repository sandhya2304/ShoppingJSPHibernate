package com.shop.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.shop.FactoryProvider;
import com.shop.dao.CategoryDao;
import com.shop.dao.ProductDao;
import com.shop.entities.Category;
import com.shop.entities.Product;



@MultipartConfig
public class ProductOperationServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	PrintWriter out = null;
  
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
	{
		
		response.getWriter();
		
		try
		{
		
		//add category and add product
		
		String op = request.getParameter("operation");
		 if(op.trim().equals("addCategory"))
		 {
			 
			 //add category
			 String catTitle = request.getParameter("catTitle");
			 String catDec = request.getParameter("catDesc");
			 
			 Category category = new Category();
			 category.setCategoryTitle(catTitle);
			 category.setCategoryDescription(catDec);
			 
			 //category database save
			 
			   CategoryDao categoryDao = new CategoryDao(FactoryProvider.getSessionFactory());
			   int catId = categoryDao.saveCategory(category);
			  // out.println("category saved "+catId);
			   
			   HttpSession session = request.getSession();
			   session.setAttribute("msg","Category added Suucessfully!! "+catId);
			   response.sendRedirect("admin.jsp");
			   
			   return;
			 
		 }else if(op.trim().equals("addProduct"))
		 {
			 //add product
			 
			if(op.trim().equals("addProduct")) 
			{
				String pName =  request.getParameter("pName");
				String pDesc = request.getParameter("pDesc");
				int pPrice = Integer.parseInt(request.getParameter("pPrice"));	
				int pQuality = Integer.parseInt(request.getParameter("pQuality"));	
				int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));	
				int catId = Integer.parseInt(request.getParameter("catId"));	
				Part image = request.getPart("pPic");
				
				Product p = new Product();
				p.setpName(pName);
				p.setpDesc(pDesc);
				p.setpPrice(pPrice);
				p.setpQuality(pQuality);		
				p.setpDiscount(pDiscount);
				p.setpPhoto(image.getSubmittedFileName());
				
				
				//get category by ID
				
				 CategoryDao cDao= new CategoryDao(FactoryProvider.getSessionFactory());
				 Category cat =cDao.getCategoryById(catId);
				 
				 
				 //set category in product
				 p.setCategory(cat);
				 
				 //save product
				 
				 ProductDao pDao = new ProductDao(FactoryProvider.getSessionFactory());
				 pDao.saveProduct(p);
				 
				 //pic upload
				 
				 
				 //pic path
				 
				 String path = request.getRealPath("image")+File.separator+"products"+File.separator+image.getSubmittedFileName();
				 System.out.println(path);
				 
				 try
				 {
				 
				 //uploading image
				 FileOutputStream fos = new FileOutputStream(path);
				 InputStream is = image.getInputStream();
				 
				 //reading data
				 byte[] data = new byte[is.available()];
				 is.read(data);
				 
				 fos.write(data);
				 
				 fos.close();
				 }catch(Exception e){
					 e.printStackTrace();
				 }
				 
				//session msg
				   HttpSession session = request.getSession();
				   session.setAttribute("msg","Product saved ...");
				   response.sendRedirect("admin.jsp");
				   
				   return;
						
			}
			 
		 }
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	//	 doGet(request, response);
		
	}

}
