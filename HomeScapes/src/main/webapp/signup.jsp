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
						
								<h1>Sign Up</h1>
							 
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
		<div class="untree_co-section">
      <div class="container">

        <div class="block">
          <div class="row justify-content-center">


            <div class="col-md-8 col-lg-8 pb-4">


              <form name="frm" method="post" action="UserController">
              <div class="row">
                <select name="usertype" style="padding: 10px">
                  <option>---Select User Type---</option>
                  <option value="buyer">Buyer</option>
                  <option value="seller">Seller</option>
                  </select>
          
              </div>
                <div class="row">
                  <div class="col-6">
                    <div class="form-group">
                      <label class="text-black" for="fname">First name</label>
                      <input  name="fname" type="text" class="form-control" id="fname">
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="form-group">
                      <label class="text-black" for="lname">Last name</label>
                      <input name="lname" type="text" class="form-control" id="lname">
                    </div>
                  </div>
                </div>
                 <div class="row">
                 <div class="col-6">
                <div class="form-group">
                  <label class="text-black" for="email">Email address</label>
                  <input name="email" type="email" class="form-control" id="email">
                </div>
                </div>
                 <div class="col-6">
                <div class="form-group">
                  <label class="text-black" for="mobile">mobile</label>
                  <input name="mobile" type="text" class="form-control" id="email">
                </div>
                </div>
                </div>
                <div >
                  <label class="text-black" for="address">Address</label>
                  <textarea name="address" rows="6" style="width: 100%" ></textarea>
                </div>
                <div class="form-group">
                  <label class="text-black" for="password">Password</label>
                  <input name="password" type="password" class="form-control" id="email">
                </div>
                <div class="form-group">
                  <label class="text-black" for="password">Confirm Password</label>
                  <input name="cpassword" type="password" class="form-control" id="email">
                </div>
                <div style="padding-top: 20px">
                 <div style="padding-left: 350px ">
                <input  type="submit" name="action" value="Sign Up" class="btn btn-primary-hover-outline">
                 </div>
                 </div>
              </form>

            </div>

          </div>

        </div>

      </div>


    </div>
  </div>
 </body>

</html>
