package com.marimba.service;
import com.marimba.bean.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringJoiner;

import com.marimba.dao.AdminHomeDao;

public class AdminHomeService {
	AdminHomeDao dao = new AdminHomeDao();

	public int getUserCount() {
		int count = dao.getUserCount();
		return count;
	}

	public List<User> getUsers() {
		List<User> list = new ArrayList<>();
		list = dao.getAllUser();
		return list;
	}

	public List<User> getFilledEffortService(String date) {
		List<User> list = dao.getUserWhoFilledEffort(date);
		return list;
	}

	public int getFilledEffortCountService(String date) {
		int count = dao.getUserWhoFilledEffortCount(date);
		return count;
	}

	public List<User> getNotFilledEffortService(String date) {
		List<User> list = dao.getUserWhoNotFilledEffort(date);
		return list;
	}

	public int getNotFilledEffortCountService(String date) {
		int count = dao.getUserWhoNotFilledEffortCount(date);
		return count;
	}
	public List<Usertask>getAllTaskService()
	{
		return dao.getAllUserTask();
	}
	public String getMonthUserService()
	{
		StringJoiner weeklyData = new StringJoiner(",", "[", "]");
		Map<Integer,Integer>map=dao.getMonthUser();
		for(int i=1;i<=12;i++)
		{
			if(map.containsKey(i))
				weeklyData.add(map.get(i).toString());
			else
				weeklyData.add("0");
		}
		return weeklyData.toString();
	}
}
