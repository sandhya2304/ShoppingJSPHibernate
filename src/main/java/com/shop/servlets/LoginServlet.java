package com.shop.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.FactoryProvider;
import com.shop.dao.UserDao;
import com.shop.entities.User;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	PrintWriter out=null;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	 {
		
		out = response.getWriter();
		
		
		try
		{
					
			String email = request.getParameter("email");
		    String password = request.getParameter("password"); 
		  		    
			
			//valiidations
			if(email.isEmpty()){
				out.println("email must specify!!!");
				return;
			}
		
			//Authentication
			UserDao userDao = new UserDao(FactoryProvider.getSessionFactory());
			User user = userDao.getUserByEmailAndPassword(email, password);
			
			HttpSession mysession = request.getSession();
			
			
			//System.out.println( user);
			if(user == null)
			{

				mysession.setAttribute("msg","invalid details");
				response.sendRedirect("login.jsp");
				return;
			}else{
				out.print("<h1> Welcome "+user.getUserName() +" </h1>");
				mysession.setAttribute("current-user",user);
			
				if(user.getUserType().equals("admin"))
				{
					response.sendRedirect("admin.jsp");
				}else if(user.getUserType().equals("normal"))
				{
					response.sendRedirect("normaluser.jsp");
				}else{
					out.print("we are not identified user type");
				}
				
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		
	}

}
