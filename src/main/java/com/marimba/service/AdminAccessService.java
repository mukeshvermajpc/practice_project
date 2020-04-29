package com.marimba.service;

import com.marimba.dao.AdminAccessDao;

public class AdminAccessService {
    public int adminAccessService(int userId,String userType)
    {
    	AdminAccessDao dao=new AdminAccessDao();
    	int status=dao.getAdminAccess(userId, userType);
    	return status;
    }
}
