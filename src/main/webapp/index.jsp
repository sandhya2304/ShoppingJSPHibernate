<%@page import="com.shop.Helper"%>
<%@page import="com.shop.entities.Product"%>
<%@page import="com.shop.dao.ProductDao"%>
<%@page import="com.shop.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.shop.dao.CategoryDao"%>
<%@page import="com.shop.FactoryProvider"%>
<html>
<head>
  <title>Shopping</title>
  
  <%@include file="./components/components_css_jss.jsp" %>
  
</head>
<body>
 <%@include file="./components/Navbar.jsp" %>
 
 <div class="container-fluid">

    <div class="row mt-4 mx-2">
    
    
    <!-- products and Category -->
    
    
    <%
    
    
    
              String cat = request.getParameter("category");
    
         
              ProductDao pDao  =   new  ProductDao(FactoryProvider.getSessionFactory());
              List<Product> productList = null;
            
               if(cat == null || cat.trim().equals("all"))
              {
            	  productList = pDao.getAllProducts();
              }else{
            	  int cid = Integer.parseInt(cat.trim());
            	  productList = pDao.getProductByCategoryId(cid);
              }
              
              CategoryDao cDao =  new CategoryDao(FactoryProvider.getSessionFactory());
              List<Category> listCat = cDao.allCategory();
            
    %>
    
    
    
       <div class="col-md-2">
             <!-- show categories -->


			<div class="list-group">
				<a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
					All Products
				</a> 
				
				
			




			<%
				for (Category c : listCat)			
				{	
					
			%>	
			
			<a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action">
				      <%= c.getCategoryTitle() %>
			</a>	

            <%
                     
				}
			%>
			
			</div>
             
       
       </div>
       
         <div class="col-md-10">
         
         <!-- product -->
             <div class="row mt-4">
             
                  <div class="col-md-12">
                  
                    <!-- card columns -->
                    
                    
                    <div class="card-columns">
                    
                        <!-- traversing products -->
                         
                         <%
                               for(Product p : productList )
                               {
                         %>
                         
                         
                         <!-- product card -->
                       <div class="card product-card">
                             
                           <div class="container text-center">
                                
                              <img src="image/products/<%= p.getpPhoto() %>" style="max-height: 200px;max-width: 100%;width: auto" 
                                   class="card-img-top m-2" alt="myimg"  />
                                
                               
                            </div>
                          
                             <div class="card-body">
                                  
                                  <h5 class="card-title"> <%= p.getpName() %>  </h5>
                                  
                                  <p class="card-text">
                                       
                                        <%= Helper.getTenWords(p.getpDesc()) %>
                                  
                                  </p>
                             
                             </div>
                             
                              <div class="card-footer text-center">
                                    
                                    <button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getPid() %>,'<%= p.getpName() %>',<%= p.getPriceAfterApplyDiscount()%>)">
                                       Add To Cart
                                    </button>
                                    <button class="btn btn-outline-success text-green">
                                        &#8377; 
                                        <%= p.getPriceAfterApplyDiscount() %> /-
                                     </button>
                                       <button class="btn btn-primary text-white">
                                       <span class="text-secondary discount-label"> <%= p.getpDiscount() %>% off  &#8377;  <%= p.getpPrice() %>/- </span> 
                                      
                                     </button>
                                     
                                
                              </div>
                             
                          
                          </div>
                    
                        <%
                               }
                         if(productList.size() == 0){
                    
                        %>
                        
                        <h3> Sorryy Product Not Avaialable :) </h3>
                        
                        <%
                        
                         }
                        %>
                    
   
                    </div>
                  
                  
                  </div>
             
             
             </div>
              
       </div>
    
    </div>
 
 </div>
 
   <%@include file="./components/common_modals.jsp" %>
 

</body>
</html>
