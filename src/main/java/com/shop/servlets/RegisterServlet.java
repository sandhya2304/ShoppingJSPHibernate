package com.shop.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.shop.FactoryProvider;
import com.shop.entities.User;

public class RegisterServlet extends HttpServlet
{
	PrintWriter out=null;
	
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			     throws ServletException, IOException
	{
		
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException
	{

		out = response.getWriter();
		
		try
		{
			
			//first fetch data
			String userName=request.getParameter("user_name");
			String userEmail=request.getParameter("user_email");
			String userPassword=request.getParameter("user_password");
			String userPhone=request.getParameter("user_phone");
			String userAddress=request.getParameter("user_address");
			
			
			//valiidations
			if(userName.isEmpty()){
				out.println("name must specify!!!");
				return;
			}
			
			//creating user object to store data
			User user = new User(userName, userEmail, userPassword, userPhone, "deafult.jpg", userAddress,"normal");
			
			Session hibernateSession = FactoryProvider.getSessionFactory().openSession();
			 Transaction tx= hibernateSession.beginTransaction();
			 
			 int userId = (Integer) hibernateSession.save(user);
			 
			 tx.commit();
			hibernateSession.close();
			
//			out.println("Successfully saved :)");
//			out.println("<br/>  User id is :"+userId);
			
			HttpSession mysession = request.getSession();
			mysession.setAttribute("msg","Registration successfully "+userId);
			
			response.sendRedirect("register.jsp");
			return;
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		doGet(request, response);
	}

}
