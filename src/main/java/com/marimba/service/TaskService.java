package com.marimba.service;
import com.marimba.bean.*;
import java.util.List;

import com.marimba.dao.TaskDao;

public class TaskService {
    public List<Task>getTasks(int userId)
    {
    	TaskDao dao=new TaskDao();
    	List<Task>list=dao.getTasks(userId);
    	return list;
    }
}
