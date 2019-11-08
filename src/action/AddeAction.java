package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import model.*;

import form.AddeForm;

public class AddeAction extends Action {
	public ActionForward execute(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
		    throws IOException, ServletException {
				if(form != null) {
				AddeForm addeform=(AddeForm)form;	
					String username=addeform.getUsername();
					String password=addeform.getPassword();
					String fname=addeform.getFname();
					String lname=addeform.getLname();
					String address=addeform.getAddress();
					String email=addeform.getEmail();
					String phone=addeform.getPhone();
					int level= addeform.getLevel();
					Connection con= DatabaseConnection.getConnection();
					try 
					{
						PreparedStatement ps =con.prepareStatement("insert into person"
						+ "(username,password,fname,lname,address,email,phonenumber,level)"
						+ "values(?,?,?,?,?,?,?,?)");
						ps.setString(1, username);
						ps.setString(2, password);
						ps.setString(3, fname);
						ps.setString(4, lname);
						ps.setString(5, address);
						ps.setString(6, email);
						ps.setString(7, phone);
						ps.setInt(8, level);
						ps.executeUpdate();
						
					}
					catch(Exception ex)
					{
					ex.printStackTrace();	
					}
					return mapping.findForward("success");
				}
				return null;
				}
}
