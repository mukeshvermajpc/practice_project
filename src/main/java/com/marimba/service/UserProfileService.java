package com.marimba.service;
import com.marimba.dao.UserProfileDao;
import com.marimba.bean.*;
public class UserProfileService {
    public User getUserProfile(int userId)
    {
    	UserProfileDao dao=new UserProfileDao();
    	User user=dao.getUser(userId);
    	return user;
    }
    public int userProfileUpdateService(User user)
    {
    	UserProfileDao dao=new UserProfileDao();
    	int status=dao.userProfileUpdate(user);
    	return status;
    }
}

