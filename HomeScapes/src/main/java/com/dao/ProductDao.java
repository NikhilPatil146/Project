package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.bean.product;
import com.util.UserUtil;

public class ProductDao {

	public static void addProduct(product p)
	{
		try {
			Connection conn=UserUtil.createConnection();
			String sql="insert into product(uid,product_name,product_category,product_desc,product_price,product_img) values(?,?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, p.getUid());
			pst.setString(2,p.getProduct_name());
			pst.setString(3,p.getProduct_category());
			pst.setString(4,p.getProduct_desc());
			pst.setInt(5,p.getProduct_price());
			pst.setString(6,p.getProduct_img());
			pst.executeUpdate();
		} catch (Exception e) {
	      e.printStackTrace();
		}
		
	}
	
	public static List<product> getProductsBySeller(int uid)
	{
		List<product> list=new ArrayList<product>();
		try {
			Connection conn=UserUtil.createConnection();
			String sql="select * from product where uid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, uid);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				product p=new product();
				p.setPid(rs.getInt("pid"));
				p.setUid(rs.getInt("uid"));
				p.setProduct_category(rs.getString("product_category"));
				p.setProduct_desc(rs.getString("product_desc"));
				p.setProduct_img(rs.getString("product_img"));
				p.setProduct_name(rs.getString("product_name"));
				p.setProduct_price(rs.getInt("product_price"));
				list.add(p);
			}
		} catch (Exception e) {
          e.printStackTrace();
		}
		return list;
	}
	
	public static product getProduct(int pid)
	{

		product p=null;
		try {
			Connection conn=UserUtil.createConnection();
			String sql="select * from product where pid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, pid);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
			    p=new product();
				p.setPid(rs.getInt("pid"));
				p.setUid(rs.getInt("uid"));
				p.setProduct_category(rs.getString("product_category"));
				p.setProduct_desc(rs.getString("product_desc")); 
				p.setProduct_img(rs.getString("product_img"));
				p.setProduct_name(rs.getString("product_name"));
				p.setProduct_price(rs.getInt("product_price"));
			}
		} catch (Exception e) {
          e.printStackTrace();
		}
		return p;
	}
	public static void deleteProduct(int pid)
	{
		try {
			Connection conn=UserUtil.createConnection();
			String sql="delete from product where pid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.executeUpdate();
		} catch (Exception e) {
              e.printStackTrace();
		}
	}

	public static void updateProduct(product p)
	{
		try {
			Connection conn=UserUtil.createConnection();
			String sql="update product set product_name=?, product_category=?, product_desc=?, product_price=?, product_img=? where pid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, p.getProduct_name());
	        pst.setString(2, p.getProduct_category());
	        pst.setString(3, p.getProduct_desc());
	        pst.setInt(4, p.getProduct_price());
	        pst.setString(5, p.getProduct_img());
	        pst.setInt(6, p.getPid());
			pst.executeUpdate();
		} catch (Exception e) {
	      e.printStackTrace();
		}
		
	}
	
	public static List<product> getAllProducts(String category)
	{
		List<product> list=new ArrayList<product>();
		String sql=null;
		try {
			Connection conn=UserUtil.createConnection();
			PreparedStatement pst=null;
			if(category==null)
			{
			 sql="select * from product ";
			 pst=conn.prepareStatement(sql);
			}
			else if(category.equals("all"))
			{
				sql="select * from product";
				pst=conn.prepareStatement(sql);
			}
			else
			{
				sql="select * from product where product_category=?";
				pst=conn.prepareStatement(sql);
				pst.setString(1,category );
			}
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				product p=new product();
				p.setPid(rs.getInt("pid"));
				p.setUid(rs.getInt("uid"));
				p.setProduct_category(rs.getString("product_category"));
				p.setProduct_desc(rs.getString("product_desc"));
				p.setProduct_img(rs.getString("product_img"));
				p.setProduct_name(rs.getString("product_name"));
				p.setProduct_price(rs.getInt("product_price"));
				list.add(p);
			}
		} catch (Exception e) {
          e.printStackTrace();
		}
		return list;
	}
}
