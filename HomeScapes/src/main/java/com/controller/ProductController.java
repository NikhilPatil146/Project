package com.controller;

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.bean.product;
import com.dao.ProductDao;

@WebServlet("/ProductController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512,maxFileSize = 1024 * 1024 * 512)
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String extractfilename(Part file) {
		String cd=file.getHeader("content-disposition");
		System.out.println(cd);
		String[] items = cd.split(";");
		for(String string : items) {
			if(string.trim().startsWith("filename")) {
				return string.substring(string.indexOf("=") + 2, string.length() - 1);
			}
		}
		return "";
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action =request.getParameter("action");
		if(action.equalsIgnoreCase("add product"))
		{
		String savePath="C:\\Users\\nikhi\\java-1\\Projects\\src\\main\\webapp\\product_img";
		File fileSaveDir = new File(savePath);
		if(!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		Part file1 = request.getPart("product_img");
		String fileName = extractfilename(file1);
		file1.write(savePath + File.separator + fileName);
		String savePath2 ="C:\\Users\\nikhi\\java-1\\Projects\\src\\main\\webapp\\product_img";
		File imgSaveDir = new File(savePath2);
		if(!imgSaveDir.exists()) {
			imgSaveDir.mkdir();
		}
		  product p=new product();
		  p.setUid(Integer.parseInt(request.getParameter("uid")));
	      p.setProduct_name(request.getParameter("product_name"));
	      p.setProduct_price(Integer.parseInt(request.getParameter("product_price")));
	      p.setProduct_category(request.getParameter("product_category"));
	      p.setProduct_img(fileName);
	      p.setProduct_desc(request.getParameter("product_desc"));
	      ProductDao.addProduct(p);
	      request.setAttribute("msg","Product Added Successfully");
	      request.getRequestDispatcher("seller-add-product.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("delete"))
		{
			int pid=Integer.parseInt(request.getParameter("pid"));
			ProductDao.deleteProduct(pid);
			response.sendRedirect("seller-view-product.jsp");
		}
		else if(action.equalsIgnoreCase("edit"))
		{
			int pid=Integer.parseInt(request.getParameter("pid"));
			product p=ProductDao.getProduct(pid);
			request.setAttribute("p", p);
			request.getRequestDispatcher("seller-update-product.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("update product"))
		{
			  product p=new product();
			  p.setPid(Integer.parseInt(request.getParameter("pid")));
			  p.setUid(Integer.parseInt(request.getParameter("uid")));
		      p.setProduct_name(request.getParameter("product_name"));
		      p.setProduct_price(Integer.parseInt(request.getParameter("product_price")));
		      p.setProduct_category(request.getParameter("product_category"));
		      p.setProduct_desc(request.getParameter("product_desc"));

		      String savePath = "C:\\Users\\nikhi\\java-1\\Projects\\src\\main\\webapp\\product_img";
		      File fileSaveDir = new File(savePath);
		      if (!fileSaveDir.exists())
		      {
		    	  fileSaveDir.mkdirs(); // Ensure directory exists
		      }
		      Part file1 = request.getPart("product_img");
		      String fileName = extractfilename(file1);

		      if (!fileName.isEmpty()) { // If a new file is uploaded
		          file1.write(savePath + File.separator + fileName);
		          p.setProduct_img(fileName); // Set new image
		      } else {
		          // Retain the old image if no new image is uploaded
		          product existingProduct = ProductDao.getProduct(p.getPid());
		          p.setProduct_img(existingProduct.getProduct_img());
		      }
		      ProductDao.updateProduct(p);
		      request.setAttribute("msg","Product Update Successfully");
		      request.getRequestDispatcher("seller-view-product.jsp").forward(request, response);
		}
		

	}
	

}
 