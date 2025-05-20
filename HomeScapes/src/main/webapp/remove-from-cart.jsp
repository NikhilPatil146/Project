<%@page import="com.bean.cart"%>
<%@page import="com.dao.CartDao"%>
<%@page import="java.util.List"%>
<%

 int pid=Integer.parseInt(request.getParameter("pid"));
 int uid=Integer.parseInt(request.getParameter("uid"));
 
 cart c=new cart();
 c.setPid(pid);
 c.setUid(uid);
 CartDao.removeFromCart(c);
 List<cart> list=CartDao.getCartByUser(uid);
 session.setAttribute("cart_count",list.size());
 response.sendRedirect("cart.jsp");
%>