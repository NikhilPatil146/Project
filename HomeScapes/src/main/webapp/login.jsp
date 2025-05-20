<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!doctype html>
<html lang="en">
<head>
</head>

	<body>

		<!-- Start Hero Section -->
			<div class="hero">
				<div class="container">
					<div class="row justify-content-between">
						<div class="col-lg-12">
							<div class="intro-excerpt">
						
								<h1>Login</h1>
							 
							</div>
						</div>
						
					</div>
				</div>
			</div>
		<!-- End Hero Section -->
<b style="color:blue;">
		<%
    if(request.getAttribute("msg")!=null)
    		{
    	out.print(request.getAttribute("msg"));
    		}
%>
</b>
		<!-- Start Contact Form -->
		<div>
		<div class="untree_co-section">
      <div class="container">

        <div class="block">
          <div class="row justify-content-center">


            <div class="col-md-8 col-lg-8 pb-4">


             <form name="frm" method="post" action="UserController">
   

                 <div class="col-6">
                <div class="form-group">
                  <label class="text-black" for="email">Email address</label>
                  <input name="email" type="email" class="form-control" id="email">
                </div>
                </div>
                 <div class="col-6">
                <div class="form-group">
                  <label class="text-black" for="password">Password</label>
                  <input name="password" type="password" class="form-control" id="email">
                </div>
                </div>
               
                <div style="padding-top: 20px">
                 <div style="padding-left: 180px ">
                <input  type="submit" name="action" value="Login" class="btn btn-primary-hover-outline">
                 </div>
                 </div>
                 <a href="forgot-password.jsp" style="color: blue">Forgot Password</a>
              </form>

            </div>

          </div>

        </div>

      </div>


    </div>
  </div>
 </body>
</html>
