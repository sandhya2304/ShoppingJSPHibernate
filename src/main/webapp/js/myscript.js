
function add_to_cart(pid,pname,price){
	
    	let cart = localStorage.getItem('cart');
	    if(cart == null)
	     {
	    	
	    	let products = [];
	    	let product = {productId:pid,productName:pname,pQty:1,pPrice:price};
	    	
	    	products.push(product);
	    	localStorage.setItem("cart",JSON.stringify(products));
	    	
	    	console.log("product is added for first time ");
	    	 	
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
	    		console.log("product is qty is increased ");
	    		 
	    	   }else{
	    		   
	    		   //we have to add product
	    		    let product = {productId:pid,productName:pname,pQty:1,pPrice:price};
		    		 pCart.push(product);
		    		 localStorage.setItem("cart",JSON.stringify(pCart));
		    		 
		    		 console.log("product is added :) ");
	    	   }
	    	 
	     }
	
}