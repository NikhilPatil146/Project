<%@page import="com.bean.product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!doctype html>
<html lang="en">
<head>
</head>

	<body>
   <%
    product p=(product)request.getAttribute("p");
   %>
		<!-- Start Hero Section -->
			<div class="hero">
				<div class="container">
					<div class="row justify-content-between">
						<div class="col-lg-12">
							<div class="intro-excerpt">
						
								<h1>Update Product</h1>
							 
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


              <form name="frm" method="post" action="ProductController" enctype="multipart/form-data">
              <input type="hidden" name="uid" value="<%=u.getUid()%>">
              <input type="hidden" name="pid" value="<%=p.getPid()%>">
              
              
              <div class="row">
                <select name="product_category" style="padding: 10px">
                <option>---Select Product Category---</option>
                <%
                 if(p.getProduct_category().equals("Sofa"))
                 {
                %>
                 <option value="Sofa" selected="selected">Sofa	</option>
                  <option value="Beds">Beds</option>
                  <option value="Seating">Seating</option>
                <% 
                 }
                else if(p.getProduct_category().equals("Beds"))
                {
                %>
            <option value="Sofa" >Sofa	</option>
                  <option value="Beds" selected="selected">Beds</option>
                  <option value="Seating">Seating</option>
                <%
                }
                else
                {
                %>
                  <option value="Sofa" >Sofa</option>
                  <option value="Beds">Beds</option>
                  <option value="Seating" selected="selected">Seating</option>
                <%
                 }
                %>
                 
                  </select>
          
              </div>
                <div class="row">
                  <div class="col-12">
                    <div class="form-group">
                      <label class="text-black" for="fname">Your Product Name</label>
                      <input  name="product_name" type="text" value="<%=p.getProduct_name() %>" class="form-control" id="fname">
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="form-group">
                      <label class="text-black" for="lname">Your Product price</label>
                      <input name="product_price" type="text"  value="<%=p.getProduct_price() %>" class="form-control" id="lname">
                    </div>
                  </div>
                </div>
                  <div class="col-12">
                  <label class="text-black" for="address">Product Detail</label>
                  <textarea name="product_desc" rows="6"  style="width: 100%" ><%=p.getProduct_desc() %></textarea>
                </div>
                <div><img src="product_img/<%=p.getProduct_img() %>" style="width: 200px;height: 200px"> </div>
                 <div class="row">
                 <div class="col-6">
                <div class="form-group">
                  <input name="product_img" type="file" >
                </div>
                </div>
                </div>
              
              
                <div style="padding-top: 20px">
                 <div style="padding-left: 350px ">
                <input  type="submit" name="action" value="Update Product" class="btn btn-primary-hover-outline">
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
