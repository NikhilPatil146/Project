<%@page import="com.dao.CartDao"%>
<%@page import="com.bean.cart"%>
<%@page import="com.dao.WishlistDao"%>
<%@page import="com.bean.Wishlist"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Products</title>
    <link rel="stylesheet" href="css/styles1.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }

        h1 {
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
            color: #333;
        }

        .gallery-container {
            width: 100%;
            overflow-x: auto;
            white-space: nowrap;
            padding: 20px 10px;
            scrollbar-width: none; /* Hide scrollbar for Firefox */
            justify-content: center;
        }

        .gallery-container::-webkit-scrollbar {
            display: none; /* Hide scrollbar for Chrome, Safari */
        }

        .gallery {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            padding-bottom: 10px;
        }

        .product {
            text-align: center;
            background: white;
            padding: 15px;
            border-radius: 12px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
            min-width: 250px;
            position: relative;
        }

        .product:hover {
            transform: scale(1.08);
        }

        .product img {
            width: 250px;
            height: 180px;
            object-fit: cover;
            border-radius: 12px;
            transition: opacity 0.3s ease-in-out;
        }

        .product:hover img {
            opacity: 0.8;
        }

       .product h3 {
    font-size: 22px; /* Increased size */
    font-weight: bold;
    color: #111; /* Darker */
    margin-bottom: 8px;
}

       .product span,p {
    display: block; /* Each on a new line */
    font-size: 16px; /* Slightly smaller */
    font-weight: bold;
    color: #444; /* Slightly dark but lighter than the name */
    margin-bottom: 4px;
}

        /* Button Styling */
        .details-btn {
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #ff5733;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            opacity: 0;
            transition: opacity 0.3s ease-in-out;
        }

        .product:hover .details-btn {
            opacity: 1;
        }
    </style>
</head>

<body>

    <div class="container">
        <h1 style="padding-top: 25px">My Cart</h1>
        
        <div class="gallery-container">
            <div class="gallery">
                <%
                    int net_price=0;
                    List<cart> list =CartDao.getCartByUser(u.getUid());
                     if(list.size()>0)
                     {
                    for (cart c:list)
                    {
                    	net_price=net_price+c.getPrdoct_price();
                    	product p=ProductDao.getProduct(c.getPid());
                %>
                <div class="product">
                    <img src="product_img/<%=p.getProduct_img()%>" alt="<%=p.getProduct_name()%>">
                    <h3><%=p.getProduct_name()%></h3>
                    <span>Price : <%=p.getProduct_price()%></span>
                    <form name="change_qty" method="post" action="change-qty.jsp">
                    <input type="hidden" name="cid" value="<%=c.getCid() %>">
                   <p> Qty : <input type="number" min="1" max="10" name="product_qty" value="<%=c.getProduct_qty()%>" onchange="this.form.submit();"> </p>
                    </form> 
                    <span>Total Price  :<%=c.getTotal_price()  %></span>
                    
                </div>
                <%
                    }
                     }
                     else
                     {
                    	 %>
                    	 <h1>No Products In Cart</h1>
                    	 <% 
                     }
                %>
            </div>
        </div>
    </div>
   <div style="text-align: center; padding: 20px;">
    <h2 style="font-size: 28px; font-weight: bold; color: #333;">Net Price: <%=net_price %></h2>
    <form >
     <input type="hidden" id="amout" value="<%=net_price%>">
    </form>
    	<button style="text-align: center; padding: 20px;" id="payButton" onclick="CreateOrderID()" class="site-btn btn-full">Proceed to checkout</button>
</div>

    
    <!-- Start Footer Section -->
    <footer class="footer-section">
        <div class="container relative">
            <div class="row">
                <div class="col-lg-8">
                    <div class="subscription-form">
                        <h3 class="d-flex align-items-center">
                            <span class="me-1"><img src="images/envelope-outline.svg" alt="Image" class="img-fluid"></span>
                            <span>Subscribe to Newsletter</span>
                        </h3>

                        <form action="#" class="row g-3">
                            <div class="col-auto">
                                <input type="text" class="form-control" placeholder="Enter your name">
                            </div>
                            <div class="col-auto">
                                <input type="email" class="form-control" placeholder="Enter your email">
                            </div>
                            <div class="col-auto">
                                <button class="btn btn-primary">
                                    <span class="fa fa-paper-plane"></span>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="row g-5 mb-5">
                <div class="col-lg-4">
                    <div class="mb-4 footer-logo-wrap"><a href="#" class="footer-logo">Furni<span>.</span></a></div>
                    <p class="mb-4">Donec facilisis quam ut purus rutrum lobortis...</p>

                    <ul class="list-unstyled custom-social">
                        <li><a href="#"><span class="fa fa-brands fa-facebook-f"></span></a></li>
                        <li><a href="#"><span class="fa fa-brands fa-twitter"></span></a></li>
                        <li><a href="#"><span class="fa fa-brands fa-instagram"></span></a></li>
                        <li><a href="#"><span class="fa fa-brands fa-linkedin"></span></a></li>
                    </ul>
                </div>

                <div class="col-lg-8">
                    <div class="row links-wrap">
                        <div class="col-6 col-sm-6 col-md-3">
                            <ul class="list-unstyled">
                                <li><a href="#">About us</a></li>
                                <li><a href="#">Services</a></li>
                                <li><a href="#">Blog</a></li>
                                <li><a href="#">Contact us</a></li>
                            </ul>
                        </div>

                        <div class="col-6 col-sm-6 col-md-3">
                            <ul class="list-unstyled">
                                <li><a href="#">Support</a></li>
                                <li><a href="#">Knowledge base</a></li>
                                <li><a href="#">Live chat</a></li>
                            </ul>
                        </div>

                        <div class="col-6 col-sm-6 col-md-3">
                            <ul class="list-unstyled">
                                <li><a href="#">Jobs</a></li>
                                <li><a href="#">Our team</a></li>
                                <li><a href="#">Leadership</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                            </ul>
                        </div>

                        <div class="col-6 col-sm-6 col-md-3">
                            <ul class="list-unstyled">
                                <li><a href="#">Nordic Chair</a></li>
                                <li><a href="#">Kruzo Aero</a></li>
                                <li><a href="#">Ergonomic Chair</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="border-top copyright">
                <div class="row pt-4">
                    <div class="col-lg-6 text-center text-lg-start">
                        <p>&copy; <script>document.write(new Date().getFullYear());</script>. All Rights Reserved.</p>
                    </div>

                    <div class="col-lg-6 text-center text-lg-end">
                        <ul class="list-unstyled d-inline-flex ms-auto">
                            <li class="me-4"><a href="#">Terms &amp; Conditions</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- End Footer Section -->

  <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/tiny-slider.js"></script>
    <script src="js/custom.js"></script>
    
    <script type="text/javascript">
	var xhttp=new XMLHttpRequest();
	var RazorpayOrderId;
	function CreateOrderID()
	{
		xhttp.open("GET","http://localhost:8080/Project/OrderCreation?amount=<%=net_price%>",false);
		xhttp.send();
		RazorpayOrderId=xhttp.responseText;
		OpenCheckOut();
	}
</script>
	<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
	<script type="text/javascript">
	
	
	function OpenCheckOut()
	{
		
		var amount=document.getElementById("amout").value;
		var new_amount=parseInt(amount)*100;
		var options={
				"key":"rzp_test_L9ejHjoXv1yD6u",
				"amount":new_amount,
				"currency":"INR",
				"name":"Tops",
				"description":"Test",
				"callback_url":"http://localhost:8080/Projects/index.jsp?uid=<%=u.getUid()%>",
				"prefill" : {
					"name" : "Jigar Thakkar",
					"email" : "jigar.thakkar.tops@gmail.com",
					"contact" : "9377614772"
				},
				"notes" : {
					"address" : "Ahmedabad"
				},
				"theme" : {
					"color" : "#3399cc"
				}

			};
			var rzp1 = new Razorpay(options);
			rzp1.on('payment.failed', function(response) {
				alert(response.error.code);
				alert(response.error.description);
				alert(response.error.source);
				alert(response.error.step);
				alert(response.error.reason);
				alert(response.error.metadata.order_id);
				alert(response.error.metadata.payment_id);
			});
			rzp1.open();
			e.preventDefault();
		}
	</script>
    
</body>
</html>
