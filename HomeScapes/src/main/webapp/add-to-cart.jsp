<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.product"%>
<%@page import="com.dao.CartDao"%>
<%@page import="com.bean.cart"%>
<%@page import="java.util.List"%>
<%

 int pid=Integer.parseInt(request.getParameter("pid"));
 int uid=Integer.parseInt(request.getParameter("uid"));
 
 cart c=new cart();
 c.setPid(pid);
 c.setUid(uid);
 product p=ProductDao.getProduct(pid);
 c.setPrdoct_price(p.getProduct_price());
 c.setProduct_qty(1);
 c.setTotal_price(p.getProduct_price());
 c.setPayment_status(false);
 CartDao.addCart(c);
 List<cart> list=CartDao.getCartByUser(uid);
 session.setAttribute("cart_count",list.size());
 response.sendRedirect("cart.jsp");
%>