package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Wishlist;
import com.util.UserUtil;

public class WishlistDao {

	public static void addWishlist(Wishlist w)
	{
		try {
			Connection conn=UserUtil.createConnection();
			String sql="insert into wishlist (uid,pid) values(?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1,w.getUid());
			pst.setInt(2,w.getPid());
			pst.executeUpdate();
		} catch (Exception e) {
              e.printStackTrace();
		}
	}
	
	public static void removeWishlist(Wishlist w)
	{
		try {
			Connection conn=UserUtil.createConnection();
			String sql="delete from wishlist where uid=? and pid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1,w.getUid());
			pst.setInt(2,w.getPid());
			pst.executeUpdate();
		} catch (Exception e) {
              e.printStackTrace();
		}
	}
	
	public static List<Wishlist> getWishlistByUser(int uid)
	{
		List<Wishlist> list=new ArrayList<Wishlist>();
		try {
			Connection conn=UserUtil.createConnection();
            String sql="Select * from wishlist where uid=?";
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setInt(1, uid);
            ResultSet rs=pst.executeQuery();
            while(rs.next())
            {
            	Wishlist w=new Wishlist();
            	w.setWid(rs.getInt("wid"));
             	w.setUid(rs.getInt("uid"));
             	w.setPid(rs.getInt("pid"));
             	list.add(w);
            }
		} catch (Exception e) {
              e.printStackTrace();
		}
		return list;
	}
	public static boolean checkWishlist(int pid,int uid)
	{
		boolean flag=false;
		try {
			Connection conn=UserUtil.createConnection();
			String sql="Select * from wishlist where pid=? and uid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.setInt(2, uid);
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
}
