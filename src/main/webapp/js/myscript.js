

// Add to cart
function add_to_cart(pid,pname,price){
	
    	let cart = localStorage.getItem('cart');
	    if(cart == null)
	     {
	    	
	    	let products = [];
	    	let product = {productId:pid,productName:pname,pQty:1,pPrice:price};
	    	
	    	products.push(product);
	    	localStorage.setItem("cart",JSON.stringify(products));
	    	
	    	//console.log("product is added for first time ");
	    	showToast("Item is added to cart");
	    	 	
	     }else{
	    	 
	    	 //cart is already present
	    	 let pCart = JSON.parse(cart);
	    	 
	    	 let oldProduct = pCart.find((item) => item.productId == pid) 
	    	 console.log(oldProduct);
	    	 
	    	 if(oldProduct)
	    	   {
	    		 
	    		 //we have to increase the qty
	    		oldProduct.pQty = oldProduct.pQty+1;
	    		pCart.map((item) =>{
	    			if(item.productId == oldProduct.productId)
	    			  {
	    				  item.pQty = oldProduct.pQty;
	    			  }
	    		})
	    		
	    		 localStorage.setItem("cart",JSON.stringify(pCart));
	    		//console.log("product is qty is increased ");
	    		
	    		showToast(oldProduct.productName+" product  qty is increased. Quantiy is :"+oldProduct.pQty); 
	    	  
	    	   }else{
	    		   
	    		   //we have to add product
	    		    let product = {productId:pid,productName:pname,pQty:1,pPrice:price};
		    		 pCart.push(product);
		    		 localStorage.setItem("cart",JSON.stringify(pCart));
		    		 
		    		 showToast("product is Added to cart");
	    	   }
	    	 
	     }
	    
	    updateCart();
	     
	  
}

//**********************************************************************************


// Update Cart

//****************************************************************************

   function updateCart(){
	
	  let cartString = localStorage.getItem("cart");
	  let cart  = JSON.parse(cartString);
	  
	  if(cart == null || cart.length == 0)
	   {
		  console.log("Cart is empty !!");
		  $(".cart-items").html(" ( 0 ) ");
		  $(".cart-body").html("<h3> Cart does not have any items </h3> ");
		 
		  $(".checkout-btn").attr('disabled',true);
	   }else {
		   
		   //there is something in cart
		   
		   console.log(cart);
		   $(".cart-items").html(`( ${cart.length})`);
		   let table = `
		     
		     <table class='table'> 
		     <thead class='thread-light' >
		        <tr>
		          <th> Item Name </th>
		          <th> Price      </th>
		          <th> Qty        </th>
		          <th> Total Price  </th>
		          <th> Action </th>
		     
		        </tr>
		     </thead>
		   
		   
		   
		   `;
		   
		   let totalPrice = 0;
		   cart.map((item) =>{
			 
			   table += `
			   
			      <tr>
			        <td> ${item.productName} </td>
			        <td> ${item.pPrice} </td>
			        <td> ${item.pQty} </td>
			        <td> ${item.pQty*item.pPrice} </td>
			        <td> <button onClick='deleteItemFromCart(${item.productId})' class="btn btn-danger btn-sm"> Remove </button>  </td>
			      </tr>
	   
			   `
				 totalPrice += item.pPrice * item.pQty;
				   
			   
		   })
		   
		   table = table+`
		   
		     <tr> <td colspan='5' class="text-right font-weight-bold m-9"> Total Price : ${totalPrice} </td> </tr>
		   </table>`;
		   $(".cart-body").html(table);
		   $(".checkout-btn").attr('disabled',false);
	   }
	
}
   
   //Remove item from Product
   function deleteItemFromCart(pid)
    {
	  let cart =  JSON.parse(localStorage.getItem('cart'));
	  let newCart  = cart.filter((item) => item.productId != pid);
	   
	   localStorage.setItem('cart',JSON.stringify(newCart));
	   
	   updateCart();
	   
	   showToast("Item is removed from cart!!");
    }
   
   
   /////////////////////////////////////
   
   $(document).ready(function(){
	   updateCart();
   })

   
   //Toast message
    
   function showToast(content){
	   
	   $('#toast').addClass('display');
	   $('#toast').html(content);
	   setTimeout(() => {
		   $('#toast').removeClass('display');
	}, 2000);
	   
   }
   
   
   
   ////////////// checkout /////////////////
  function goToCheckout(){
	    window.location = "checkout.jsp";
   }


   
   
   
   
   
   
   
   //////////////////////////////////////////