package com.marimba.dao;
import com.marimba.bean.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import com.marimba.util.ConnectionProvider;

public class AdminHomeDao {
	private Connection con = null;
	private PreparedStatement ps;

	public List<User> getAllUser() {
		con = ConnectionProvider.getConnection();
		List<User> list = new ArrayList<>();
		try {
			ps = con.prepareStatement("select *from [marimba_tfs].[dbo].[user]");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setUserType(rs.getString(5));
				list.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getUserCount() {
		int count = 0;
		con = ConnectionProvider.getConnection();
		try {
			ps = con.prepareStatement("select count(*) from [marimba_tfs].[dbo].[user]");
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public int getUserWhoNotFilledEffortCount(String date) {
		int count = 0;
		con = ConnectionProvider.getConnection();
		String query = "select distinct COUNT(distinct usr.userid) from [marimba_tfs].[dbo].[user]usr,[marimba_tfs].[dbo].[usertask] task where usr.userid=task.userid and task.userid not in (select distinct userid from [marimba_tfs].[dbo].[usertask] where date =?)";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, date);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public List<User> getUserWhoNotFilledEffort(String date) {
		List<User> list = new ArrayList<>();
		con = ConnectionProvider.getConnection();
		String query = "select distinct usr.userid,usr.name,usr.email from [marimba_tfs].[dbo].[user]usr,[marimba_tfs].[dbo].[usertask] task where usr.userid=task.userid and task.userid not in (select distinct userid from [marimba_tfs].[dbo].[usertask] where date =?)";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, date);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getUserWhoFilledEffortCount(String date) {

		int count = 0;
		con = ConnectionProvider.getConnection();
		String query = "select COUNT(distinct usr.userid) from [marimba_tfs].[dbo].[user] as usr,[marimba_tfs].[dbo].[usertask] as task where usr.userid=task.userid and task.date=?";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, date);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public List<User> getUserWhoFilledEffort(String date) {
		List<User> list = new ArrayList<>();
		con = ConnectionProvider.getConnection();
		String query = "select distinct usr.userid,usr.name,usr.email from [marimba_tfs].[dbo].[user] as usr,[marimba_tfs].[dbo].[usertask] as task where usr.userid=task.userid and task.date=?";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, date);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Usertask> getAllUserTask() {
		List<Usertask> list = new ArrayList<>();
		con = ConnectionProvider.getConnection();
		String query = "select distinct usr.userid,usr.name,task.taskname,task.hour,task.description,task.date,usr.team from [marimba_tfs].[dbo].[user]as usr,[marimba_tfs].[dbo].[usertask]as task where usr.userid=task.userid";
		try {
			ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Usertask usertask = new Usertask();
				usertask.setId(rs.getInt(1));
				usertask.setName(rs.getString(2));
				usertask.setTaskName(rs.getString(3));
				usertask.setHour(rs.getDouble(4));
				usertask.setDescription(rs.getString(5));
				usertask.setDate(rs.getString(6));
				usertask.setTeam(rs.getString(7));
				list.add(usertask);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public Map<Integer, Integer> getMonthUser() {
		Map<Integer, Integer> map = new LinkedHashMap<>();
		con = ConnectionProvider.getConnection();
		String query = "select MONTH(date) as Month,count(distinct userid)as UserId from [marimba_tfs].[dbo].[usertask] group by MONTH(date)";
		try {
			ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				map.put(rs.getInt(1), rs.getInt(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return map;
	}

	public static void main(String args[]) {
		AdminHomeDao dao = new AdminHomeDao();
		Map<Integer, Integer> map = dao.getMonthUser();
		map.forEach((key, value) -> {
			System.out.println(key + " " + value);
		});
	}
}
