package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.User.Post;

public class PostDao {
	private Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean AddNotes(String title, String content, int uid) {
		try {
			String query = "insert into post(title, content, uid) values(?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setInt(3, uid);
			int i = ps.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public List<Post> getData(int id) {
		List<Post> list = new ArrayList<>();
		Post po = null;
		try {
			String query = "select * from post where uid=? order by id DESC";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				po = new Post();
				po.setId(rs.getInt(1));
				po.setTitle(rs.getString(2));
				po.setContent(rs.getString(3));
				po.setPdate(rs.getTimestamp(4));
				list.add(po);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	public Post getDatabyId(int noteId) {
		Post p = null;
		try {
			String query = "select * from post where id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, noteId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				p = new Post();
				p.setId(rs.getInt(1));
				p.setTitle(rs.getString(2));
				p.setContent(rs.getString(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return p;

	}

	public boolean PostUpdate(int noteid, String title, String content) {
		boolean f = false;
		try {
			String query = "update post set title=?,content=? where id=?";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, title);
			ps.setString(2, content);
			ps.setInt(3, noteid);
			int i = ps.executeUpdate();

			if(i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}
	
	public boolean deleteNotes(int note_id) {
		boolean f = false;
		try {
			String query = "delete from post where id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, note_id);
			int i = ps.executeUpdate();
			
			if(i==1) {
				f = true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
