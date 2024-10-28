package com.ecommerce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ecommerce.entity.User;
import com.ecommerce.utility.DatabaseConnection;

public class AdminDAO implements AdminDAOInterface {

	@Override
	public List<User> getAllUsers() {
		List<User> users = new ArrayList<>();
		try (Connection con = DatabaseConnection.getConnection()) {
			String query = "SELECT * FROM user";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				User user = new User();
				user.setUserId(rs.getInt("userId"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setAge(rs.getInt("age"));
				user.setContactNo(rs.getLong("contactNo"));
				user.setCity(rs.getString("city"));
				user.setUserType(rs.getString("userType"));
				user.setBlocked(rs.getBoolean("blocked"));
				users.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}

	@Override
	public List<User> getAllRetailers() {
		List<User> retailers = new ArrayList<>();
		try (Connection con = DatabaseConnection.getConnection()) {
			String query = "SELECT * FROM user WHERE userType = ?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, "retailer");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				User user = new User();
				user.setUserId(rs.getInt("userId"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setAge(rs.getInt("age"));
				user.setContactNo(rs.getLong("contactNo"));
				user.setCity(rs.getString("city"));
				user.setUserType(rs.getString("userType"));
				user.setBlocked(rs.getBoolean("blocked"));
				retailers.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return retailers;
	}

	@Override
	public List<User> getAllBuyers() {
		List<User> buyers = new ArrayList<>();
		try (Connection con = DatabaseConnection.getConnection()) {
			String query = "SELECT * FROM user WHERE userType = 'buyer'";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				User user = new User();
				user.setUserId(rs.getInt("userId"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setAge(rs.getInt("age"));
				user.setContactNo(rs.getLong("contactNo"));
				user.setCity(rs.getString("city"));
				user.setUserType(rs.getString("userType"));
				user.setBlocked(rs.getBoolean("blocked"));
				buyers.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return buyers;
	}

	@Override
	public boolean updateUserStatus(String email, boolean block) {
		try (Connection con = DatabaseConnection.getConnection()) {
			String query = "UPDATE user SET blocked = ? WHERE email = ?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setBoolean(1, block);
			ps.setString(2, email);
			int rowsUpdated = ps.executeUpdate();
			return rowsUpdated > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override	
	public boolean deleteUserByEmail(String email) {
		try (Connection con = DatabaseConnection.getConnection()) {
			String query = "DELETE FROM user WHERE email = ?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			int rowsDeleted = ps.executeUpdate();
			return rowsDeleted > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
