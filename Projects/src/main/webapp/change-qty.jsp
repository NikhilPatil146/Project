<%@page import="com.bean.cart"%>
<%@page import="com.dao.CartDao"%>
<%
 int cid=Integer.parseInt(request.getParameter("cid"));
 int product_qty=Integer.parseInt(request.getParameter("product_qty"));
 cart c=CartDao.getCart(cid);
 c.setProduct_qty(product_qty);
 c.setTotal_price(c.getPrdoct_price()*product_qty);
 CartDao.updateCart(c);
 response.sendRedirect("cart.jsp");
%>
