package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.User;
import com.bean.Wishlist;
import com.bean.cart;
import com.util.UserUtil;

public class CartDao {

	public static void addCart(cart c)
	{
		try {
			Connection conn=UserUtil.createConnection();
			String sql="insert into  cart(uid,pid,product_price,product_qty,total_price,payment_status) values(?,?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1,c.getUid());
			pst.setInt(2,c.getPid());
			pst.setInt(3,c.getPrdoct_price());
			pst.setInt(4,c.getProduct_qty());
			pst.setInt(5,c.getTotal_price());
			pst.setBoolean(6,c.isPayment_status());
			pst.executeUpdate();
		} catch (Exception e) {
              e.printStackTrace();
		}
	}
	
	public static void removeFromCart(cart c)
	{
		try {
			Connection conn=UserUtil.createConnection();
			String sql="delete from cart where uid=? and pid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1,c.getUid());
			pst.setInt(2,c.getPid());
			pst.executeUpdate();
		} catch (Exception e) {
              e.printStackTrace();
		}
	}
	
	public static void updateCart(cart c)
	{
		try {
			Connection conn=UserUtil.createConnection();
			String sql="update cart set product_qty=?,total_price=? where cid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1,c.getProduct_qty());
			pst.setInt(2,c.getTotal_price());
			pst.setInt(3, c.getCid());
			pst.executeUpdate();
		} catch (Exception e) {
              e.printStackTrace();
		}
	}
	
	public static List<cart> getCartByUser(int uid)
	{
		boolean flag=false;
		List<cart> list=new ArrayList<cart>();
		try {
			Connection conn=UserUtil.createConnection();
            String sql="Select * from cart where uid=? and payment_status=?";
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setInt(1, uid);
            pst.setBoolean(2, flag);
            ResultSet rs=pst.executeQuery();
            while(rs.next())
            {
            	cart c=new cart();
            	c.setCid(rs.getInt("cid"));
             	c.setUid(rs.getInt("uid"));
             	c.setPid(rs.getInt("pid"));
             	c.setPrdoct_price(rs.getInt("product_price"));
             	c.setProduct_qty(rs.getInt("product_qty"));
             	c.setTotal_price(rs.getInt("total_price"));
             	c.setPayment_status(rs.getBoolean("payment_status"));
             	list.add(c);
            }
		} catch (Exception e) {
              e.printStackTrace();
		}
		return list;
	}
	
	public static cart getCart(int cid)
	{
        cart c=null;
		try {
			Connection conn=UserUtil.createConnection();
            String sql="Select * from cart where cid=?";
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setInt(1, cid);
            ResultSet rs=pst.executeQuery();
            while(rs.next())
            {
                c=new cart();
            	c.setCid(rs.getInt("cid"));
             	c.setUid(rs.getInt("uid"));
             	c.setPid(rs.getInt("pid"));
             	c.setPrdoct_price(rs.getInt("product_price"));
             	c.setProduct_qty(rs.getInt("product_qty"));
             	c.setTotal_price(rs.getInt("total_price"));
             	c.setPayment_status(rs.getBoolean("payment_status"));
            }
		} catch (Exception e) {
              e.printStackTrace();
		}
		return c;
	}
	
	public static boolean checkCart(int pid,int uid)
	{
		boolean flag=false;
		try {
			Connection conn=UserUtil.createConnection();
			String sql="Select * from cart where pid=? and uid=? and payment_status=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.setInt(2, uid);
			pst.setBoolean(3, false);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
				flag=true;
			}
		} catch (Exception e) {
             e.printStackTrace();
		}
		return flag;
	}
	public static void updatePaymentStatus(int uid)
	{
		boolean payment_status=true;
		try {
			Connection conn=UserUtil.createConnection();
			String sql="update cart set payment_status=? where uid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setBoolean(1, payment_status);
			pst.setInt(2, uid);
			
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static List<cart> getPaidOrder(int uid)
	{
		 boolean payment_status = true;
		 List<cart> list=new ArrayList<cart>();
		try {
			Connection conn=UserUtil.createConnection();
			String sql="select * from cart where uid=? and payment_status=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, uid);
			pst.setBoolean(2, payment_status);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				cart c=new cart();
				c.setCid(rs.getInt("cid"));
				c.setUid(rs.getInt("uid"));
				c.setPid(rs.getInt("pid"));
				c.setPrdoct_price(rs.getInt("product_price"));
				c.setProduct_qty(rs.getInt("product_qty"));
				c.setTotal_price(rs.getInt("total_price"));
				c.setPayment_status(rs.getBoolean("payment_status"));
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
