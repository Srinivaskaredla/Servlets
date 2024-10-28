package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.UUID;

import com.ecommerce.entity.User;
import com.ecommerce.utility.DatabaseConnection;

public class GlobalDAO implements GlobalDAOInterface {

	@Override
	public User signInDAO(User user) {
		User b = null;
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE email=? AND password=?")) {

			ps.setString(1, user.getEmail());
			ps.setString(2, user.getPassword());

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					b = new User();
					b.setUserId(rs.getInt("userId"));
					b.setName(rs.getString("name"));
					b.setEmail(rs.getString("email"));
					b.setPassword(rs.getString("password"));
					b.setAge(rs.getInt("age"));
					b.setContactNo(rs.getLong("contactNo"));
					b.setCity(rs.getString("city"));
					b.setUserType(rs.getString("userType"));
					b.setBlocked(rs.getBoolean("blocked"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public boolean isEmailOrContactExists(String email, long contactNo) {
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM user WHERE email=? OR contactNo=?")) {

			ps.setString(1, email);
			ps.setLong(2, contactNo);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return rs.getInt(1) > 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean registerUser(User user) {
		String sql = "INSERT INTO user (name, email, password, age, contactNo, city, userType) VALUES (?, ?, ?, ?, ?, ?, ?)";
		try (Connection con = DatabaseConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setInt(4, user.getAge());
			ps.setLong(5, user.getContactNo());
			ps.setString(6, user.getCity());
			ps.setString(7, user.getUserType());

			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
