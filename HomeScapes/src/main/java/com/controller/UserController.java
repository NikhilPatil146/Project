package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import com.bean.User;
import com.bean.Wishlist;
import com.bean.cart;
import com.dao.CartDao;
import com.dao.UserDao;
import com.dao.WishlistDao;
import com.service.Services;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          String action=request.getParameter("action");
          if(action.equalsIgnoreCase("sign up"))
        {
        	  boolean flag=UserDao.checkEmail(request.getParameter("email"));
        	  if(flag==false) {
        		  if(request.getParameter("password").equals(request.getParameter("cpassword"))) 
        		  {
        	      User u=new User();
        	      u.setFname(request.getParameter("fname"));
        	      u.setLname(request.getParameter("lname"));
        	      u.setEmail(request.getParameter("email"));
        	      u.setMobile(request.getParameter("mobile"));
        	      u.setAddress(request.getParameter("address"));
        	      u.setPassword(request.getParameter("password"));
        	      u.setUsertype(request.getParameter("usertype"));
        	      UserDao.signupUser(u);
        	      response.sendRedirect("login.jsp");
                  }
        		  else
        		  {
        			  request.setAttribute("msg","Password & Confirm Password Does not Matched");
                  	  request.getRequestDispatcher("signup.jsp").forward(request, response);
                 
        		  }
        	  }
        	   else {
        			  request.setAttribute("msg","Email Alredy Registered");
        	          request.getRequestDispatcher("signup.jsp").forward(request, response);
        	        
        		  }
        	  }
          else  if(action.equalsIgnoreCase("login"))  
          {
        	  User u=UserDao.loginUser(request.getParameter("email"));
        	  if(u!=null)
        	  {
        		  if(u.getPassword().equals(request.getParameter("password")))
        		{
        			 HttpSession session=request.getSession();
        			 session.setAttribute("u", u);
        			 if(u.getUsertype().equals("buyer"))
        			 {
        				 List<Wishlist> list =WishlistDao.getWishlistByUser(u.getUid());
        				 session.setAttribute("wishlist_count",list.size());

        				 List<cart> list1 =CartDao.getCartByUser(u.getUid());
        				 session.setAttribute("cart_count",list1.size());
        			 request.getRequestDispatcher("index.jsp").forward(request, response);
        		}
        			 else
        			 {
        				 request.getRequestDispatcher("seller-index.jsp").forward(request, response); 
        			 }
        		}
        		  else
        		  {
        			  request.setAttribute("msg","Incorrect Password");
        			  request.getRequestDispatcher("login.jsp").forward(request, response);
        		  }
        	  }
          }
          else if(action.equalsIgnoreCase("change password"))
          {
        	  HttpSession session=request.getSession();
        	  User u=(User)session.getAttribute("u");
        	  if(u.getPassword().equals(request.getParameter("old_password")))
        	  {
        		  if(request.getParameter("new_password").equals(request.getParameter("cnew_password")))
        		  {
        			    UserDao.changePassword(u.getEmail(), request.getParameter("new_password"));
        			    session.removeAttribute("u");
        			    session.invalidate();
        			    request.setAttribute("msg", "Password Changed Successfully");
        			    request.getRequestDispatcher("login.jsp").forward(request, response);
        		  }
        		  else
        		  {
        			  request.setAttribute("msg","New Password & Confirm Password Does Not Match");
        			  if(u.getUsertype().equals("buyer"))
        			  {
        			  request.getRequestDispatcher("change-password.jsp").forward(request, response);
        			  }
        			  else
        			  {
        				  request.getRequestDispatcher("seller-change-password.jsp").forward(request, response); 
        			  }
        		  }
        	  }
        	  else
        	  {
        		  request.setAttribute("msg","Old Password Does Not Matched");
        		  if(u.getUsertype().equals("buyer"))
    			  {
    			  request.getRequestDispatcher("change-password.jsp").forward(request, response);
    			  }
    			  else
    			  {
    				  request.getRequestDispatcher("seller-change-password.jsp").forward(request, response); 
    			  }
        	  }
          }
          else if(action.equalsIgnoreCase("send otp"))
          {
        	  boolean flag=UserDao.checkEmail(request.getParameter("email"));
        	  if(flag==true)
        	  {
        		  Random t = new Random();
  		    	int minRange = 1000, maxRange= 9999;
  	        	int otp = t.nextInt(maxRange - minRange) + minRange;
  	        	Services.sendMail(request.getParameter("email"), otp);  
  	        	HttpSession session=request.getSession();
  	        	session.setAttribute("email",request.getParameter("email"));
  	        	session.setAttribute("otp",otp);
  	        	request.getRequestDispatcher("otp.jsp").forward(request, response);
        	  }
        	  else
        	  {
        		  request.setAttribute("msg", "Email Not Registered");
        		  request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
        	  }
          }
          else if(action.equalsIgnoreCase("verify otp"))
          {
        	  int otp1=Integer.parseInt(request.getParameter("otp"));
        	  HttpSession session=request.getSession();
        	  int otp2=Integer.parseInt(session.getAttribute("otp").toString());
        	  if(otp1==otp2)
        	  { 
        		  session.removeAttribute("otp");
        		  request.setAttribute("msg","Set New Password");
        		  request.getRequestDispatcher("new-password.jsp").forward(request, response);
        	  }
        	  else
        	  {
        		  request.setAttribute("msg","	Invalid OTP");
        		  request.getRequestDispatcher("otp.jsp").forward(request, response);
        	  
        	  }
          }
          else if(action.equalsIgnoreCase("update password"))
          {
        	 HttpSession session=request.getSession();
        	 if(request.getParameter("new_password").equals(request.getParameter("cnew_password")))
        	 {
        		 UserDao.changePassword(session.getAttribute("email").toString(), request.getParameter("new_password")); 
        		 session.removeAttribute("email");
        		 request.setAttribute("msg","Password Updated Successfully");
        		 request.getRequestDispatcher("login.jsp");
        	 }
        	 else
        	 {
        		 request.setAttribute("msg", "New Password & Confirm Password Does Not Matched");
       		     request.getRequestDispatcher("new-password.jsp").forward(request, response);
       	 
        	 }
          }
	}

}
