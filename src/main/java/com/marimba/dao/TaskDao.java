package com.marimba.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.marimba.util.ConnectionProvider;
import com.marimba.bean.*;
public class TaskDao {
	Connection con = null;
	PreparedStatement ps = null;

	public int[] addTask(List<Task> list) {
		int status[] = null;
		con = ConnectionProvider.getConnection();
		try {
			ps = con.prepareStatement("insert into [marimba_tfs].[dbo].[usertask] values(?,?,?,?,?,?)");
			for (Task tk : list) {
				int taskid = tk.getTaskId();
				String taskname = tk.getTaskName();
				double hour = tk.getHour();
				String description = tk.getDescription();
				String date = tk.getDate();
				int userid = tk.getEmployeeId();
				ps.setInt(1, taskid);
				ps.setString(2, taskname);
				ps.setDouble(3, tk.getHour());
				ps.setString(4, description);
				ps.setString(5, tk.getDate());
				ps.setInt(6, tk.getEmployeeId());
				ps.addBatch();
			}
			status = ps.executeBatch();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}

	public List<Task> getTasks(int userId) {
		List<Task> list = new ArrayList<>();
		Task task = null;
		con = ConnectionProvider.getConnection();
		try {
			ps = con.prepareStatement("select *from [marimba_tfs].[dbo].[usertask] where userid=?");
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				task = new Task();
				task.setTaskId(rs.getInt("taskid"));
				task.setTaskName(rs.getString("taskname"));
				task.setHour(rs.getDouble("hour"));
				task.setDescription(rs.getString("description"));
				task.setDate(rs.getString("date"));
				task.setEmployeeId(rs.getInt("userid"));
				list.add(task);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
}
