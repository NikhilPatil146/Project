<%@page import="com.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<%
 User u=null;
if(session!=null)
{
	if(session.getAttribute("u")!=null)
	{
		u=(User)session.getAttribute("u");
	}
}
%>


<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Untree.co">
  <link rel="shortcut icon" href="favicon.png">

  <meta name="description" content="" />
  <meta name="keywords" content="bootstrap, bootstrap4" />

		<!-- Bootstrap CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
		<link href="css/tiny-slider.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<title>Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites by Untree.co </title>
</head>

<body>
  <%
   if(u!=null && u.getUsertype().equals("buyer"))
   {
  %>
   <header>
	  <!-- Start Header/Navigation -->
		<nav class="custom-navbar navbar navbar-expand-md navbar-dark bg-dark" aria-label="Furni navigation bar">
			<div class="container">
				<a class="navbar-brand" href="index.jsp">Furni<span>.</span></a>

				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarsFurni">
					<ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
						<li class="nav-item ">
							<a class="nav-link" href="index.jsp?cat=<%="all"%>">Home</a>
						</li>
						<li><a class="nav-link" href="index.jsp?cat=<%="Sofa"%>">Sofa</a></li>
						<li><a class="nav-link" href="index.jsp?cat=<%="Beds"%>">Beds</a></li>
						<li><a class="nav-link" href="index.jsp?cat=<%="Seating"%>">Seating</a></li>
						<li><a class="nav-link" href="blog.jsp">About</a></li>
						<li><a class="nav-link" href="contact.jsp">Contact us</a></li>
					</ul>
                    
					<ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
						<!-- User Dropdown Menu -->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<img src="images/user.svg" alt="User">
							</a>
							<ul class="dropdown-menu" aria-labelledby="userDropdown">
							 <%
							   if(u!=null)
							   {
								   %>
								   <li><a class="dropdown-item" href="logout.jsp">Logout (<%=u.getFname() %>)</a></li>
								   <li><a class="dropdown-item" href="change-password.jsp">Change Password</a></li>
								   <li><a class="dropdown-item" href="wishlist.jsp">WishList(<%=session.getAttribute("wishlist_count") %>)</a></li>
								   <li><a class="dropdown-item" href="cart.jsp">Cart(<%=session.getAttribute("cart_count") %>)</a></li>								  
								   <li><a class="dropdown-item" href="my-order.jsp">My Order</a></li>								  
								   <%
							        }
								   else
								   {
									   %>
									   <li><a class="dropdown-item" href="signup.jsp">Sign Up</a></li>
								<li><a class="dropdown-item" href="login.jsp">Login</a></li>
							
									   <%
								   }
							 %>
								</ul>
						</li>

						<!-- Cart Icon -->
						<li class="nav-item">
							<a class="nav-link" href="cart.jsp"><img src="images/cart.svg" alt="Cart"></a>
						</li>
					</ul>
				</div>
			</div>
		</nav>

	</header>
	<%
   }
   else if(u!=null && u.getUsertype().equals("seller"))
   {
	%>
	<section>
	<!-- Start Header/Navigation -->
		<nav class="custom-navbar navbar navbar-expand-md navbar-dark bg-dark" aria-label="Furni navigation bar">
			<div class="container">
				<a class="navbar-brand" href="seller-index.jsp">Furni<span>.</span></a>

				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarsFurni">
					<ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
						<li class="nav-item active">
							<a class="nav-link" href="seller-index.jsp">Home</a>
						</li>
						<li><a class="nav-link" href="seller-add-product.jsp">Add Product</a></li>
						<li><a class="nav-link" href="seller-view-product.jsp">View Product</a></li>
						<li><a class="nav-link" href="contact.jsp">Contact us</a></li>
					</ul>
                    
					<ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
						<!-- User Dropdown Menu -->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<img src="images/user.svg" alt="User">
							</a>
							<ul class="dropdown-menu" aria-labelledby="userDropdown">
							 <%
							   if(u!=null)
							   {
								   %>
								   <li><a class="dropdown-item" href="logout.jsp">Logout (<%=u.getFname() %>)</a></li>
								   <li><a class="dropdown-item" href="change-password.jsp">Change Password</a></li>
								   <%
							        }
								   else
								   {
									   %>
									   <li><a class="dropdown-item" href="signup.jsp">Sign Up</a></li>
								<li><a class="dropdown-item" href="login.jsp">Login</a></li>
							
									   <%
								   }
							 %>
								</ul>
						</li>

						<!-- Cart Icon -->
						<li class="nav-item">
							<a class="nav-link" href="cart.jsp"><img src="images/cart.svg" alt="Cart"></a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- End Header/Navigation -->
	<%
   }
   else
   {
	%>
	<header>
	  <!-- Start Header/Navigation -->
		<nav class="custom-navbar navbar navbar-expand-md navbar-dark bg-dark" aria-label="Furni navigation bar">
			<div class="container">
				<a class="navbar-brand" href="index.jsp">Furni<span>.</span></a>

				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarsFurni">
					<ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
						<li class="nav-item ">
							<a class="nav-link" href="index.jsp?cat=<%="all"%>">Home</a>
						</li>
						<li><a class="nav-link" href="index.jsp?cat=<%="Sofa"%>">Sofa</a></li>
						<li><a class="nav-link" href="index.jsp?cat=<%="Beds"%>">Beds</a></li>
						<li><a class="nav-link" href="index.jsp?cat=<%="Seating"%>">Seating</a></li>
						<li><a class="nav-link" href="blog.jsp">About</a></li>
						<li><a class="nav-link" href="contact.jsp">Contact us</a></li>
					</ul>
                    
					<ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
						<!-- User Dropdown Menu -->
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<img src="images/user.svg" alt="User">
							</a>
							<ul class="dropdown-menu" aria-labelledby="userDropdown">
							 <%
							   if(u!=null)
							   {
								   %>
								   <li><a class="dropdown-item" href="logout.jsp">Logout (<%=u.getFname() %>)</a></li>
								   <li><a class="dropdown-item" href="change-password.jsp">Change Password</a></li>
								   <%
							        }
								   else
								   {
									   %>
									   <li><a class="dropdown-item" href="signup.jsp">Sign Up</a></li>
								<li><a class="dropdown-item" href="login.jsp">Login</a></li>
							
									   <%
								   }
							 %>
								</ul>
						</li>

						<!-- Cart Icon -->
						<li class="nav-item">
							<a class="nav-link" href="cart.jsp"><img src="images/cart.svg" alt="Cart"></a>
						</li>
					</ul>
				</div>
			</div>
		</nav>

	</header>

	
	<%
   }
  %>
	
	</section>	
		<!-- Bootstrap JS (Required for Dropdowns) -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
