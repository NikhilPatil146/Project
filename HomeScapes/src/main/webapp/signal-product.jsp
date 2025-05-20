<%@page import="com.dao.CartDao"%>
<%@page import="com.dao.WishlistDao"%>
<%@page import="com.bean.Wishlist"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!doctype html>
<html lang="en">

<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

  </head>

	<body>

  <%
  product p=ProductDao.getProduct(Integer.parseInt(request.getParameter("pid")));
  %>
  <div class="name1" style="display: flex;
            justify-content: center;
            align-items: center;
            height: 50vh;">
  <div class="product-container" style="display: flex;  align-items: center;padding: 20px;
            border-radius: 10px;" >
  <div>
        <img src="product_img/<%= p.getProduct_img() %>" style="width: 200px;height: 200px" alt="Product Image" class="product-image">
  </div>
        <div class="product-details" style="flex: 2;
            padding-left: 20px;">
            <h2 class="product-title" style=" margin: 0 0 10px;
            font-size: 22px;"><%= p.getProduct_name() %></h2>
            <p class="product-price" style=" font-weight: bold;
            color: #28a745;">Price : <%= p.getProduct_price() %></p>
            <p class="product-description" style=" margin: 0 0 10px;
            font-size: 22px;"><%= p.getProduct_desc() %></p>
            <div style="display: flex; ">
            <%
            if(u!=null)
            {
            %>
            <%
            boolean flag1=CartDao.checkCart(p.getPid(),u.getUid());
            if(flag1==false)
            {
            %>
            <div style="padding-bottom: 20px;padding-right: 10px" >
            <form name="edit" method="post" action="add-to-cart.jsp?pid=<%=p.getPid()%>">
            <input type="hidden" name="pid" value="<%=p.getPid()%>">
               <input type="hidden" name="uid" value="<%=u.getUid()%>">
             <input type="submit" name="action" value="Add To Cart" class="btn btn-primary">
             </form>
            </div>
            <%
            }
            else
            {
            %>
             <div style="padding-bottom: 20px;padding-right: 10px" >
            <form name="edit" method="post" action="remove-from-cart.jsp?pid=<%=p.getPid()%>">
            <input type="hidden" name="pid" value="<%=p.getPid()%>">
               <input type="hidden" name="uid" value="<%=u.getUid()%>">
             <input type="submit" name="action" value="Remove From Cart" class="btn btn-danger">
             </form>
            </div>
            <%
            }
            %>
            <%
            boolean flag=WishlistDao.checkWishlist(p.getPid(),u.getUid());
            if(flag==false)
            {
            %>
            <div>
            <form name="delete" method="post" action="add-to-wishlist.jsp">
            <input type="hidden" name="pid" value="<%=p.getPid()%>">
            <input type="hidden" name="uid" value="<%=u.getUid()%>">
            <input type="submit" name="action" value="Add To Wishlist" class="btn btn-primary">
            </form>
            </div>
           
            <%
            }
            else
            {
            	%>
            <div>
            <form name="delete" method="post" action="remove-from-wishlist.jsp">
            <input type="hidden" name="pid" value="<%=p.getPid()%>">
            <input type="hidden" name="uid" value="<%=u.getUid()%>">
            <input type="submit" name="action" value="Remove From Wishlist" class="btn btn-danger">
            </form>
            </div>
            <%
            }
            %>
            <%
            }
            else
            {
            	%>
            	<a  href="login.jsp" ><input type="button" value="login" class="btn btn-primary"></a>
            	<%
            }
            %>
             </div>
        </div>
        </div>
    </div>

		<!-- Start Footer Section -->
		<footer class="footer-section">
			<div class="container relative">

			
				<div class="row">
					<div class="col-lg-8">
						<div class="subscription-form">
							<h3 class="d-flex align-items-center"><span class="me-1"><img src="images/envelope-outline.svg" alt="Image" class="img-fluid"></span><span>Subscribe to Newsletter</span></h3>

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
						<p class="mb-4">Donec facilisis quam ut purus rutrum lobortis. Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique. Pellentesque habitant</p>

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
						<div class="col-lg-6">
							<p class="mb-2 text-center text-lg-start">Copyright &copy;<script>document.write(new Date().getFullYear());</script>. All Rights Reserved. &mdash; Designed with love by <a href="https://untree.co">Untree.co</a> Distributed By <a hreff="https://themewagon.com">ThemeWagon</a>  <!-- License information: https://untree.co/license/ -->
            </p>
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
	</body>

</html>
