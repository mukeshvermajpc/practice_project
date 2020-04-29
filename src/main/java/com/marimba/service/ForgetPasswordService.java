package com.marimba.service;
import com.marimba.dao.ForgetPasswordDao;
public class ForgetPasswordService {
    ForgetPasswordDao dao=new ForgetPasswordDao();
	public boolean emailStatus(String email)
    {
    	boolean present=dao.checkEmailId(email);
    	return present;
    }
	public int updatePassword(String emailId,String password)
	{
		int status=dao.updatePassword(emailId, password);
		return status;
	}
}
