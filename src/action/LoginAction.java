package action;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.LoginForm;
import model.DatabaseConnection;
public class LoginAction extends Action {
	public ActionForward execute(ActionMapping mapping,
	ActionForm form,
	HttpServletRequest request,
	HttpServletResponse response)
    throws IOException, ServletException {
		if(form != null) {
		LoginForm loginForm=(LoginForm)form;
			Connection con=DatabaseConnection.getConnection();
			String username=loginForm.getUsername();
			String password=loginForm.getPassword();
			System.out.println("username: "+username);
			System.out.println("password: "+password);
		try {
			PreparedStatement ps=con.prepareStatement("select count(*),level,id from person where username=? and password=?");
			ps.setString(1,username);
			ps.setString(2,password);
			ResultSet result=ps.executeQuery();
			int count=0;int level=0;int pid=0;
			while(result.next())
			{
				count=result.getInt(1);
				level=result.getInt(2);
				pid=result.getInt(3);
			

			}
			

			if(count==1)
			{
				 HttpSession session=request.getSession(true);
					session.setAttribute("username", username);
					session.setAttribute("level", level);
					session.setAttribute("pid", pid);
			if(level==1){
				System.out.println("mhome");

				return mapping.findForward("mhome");
			 }
			else if(level==2) {
				System.out.println("lhome");

				return mapping.findForward("lhome");
				
				}
			else
			{				System.out.println("dhome");

				return mapping.findForward("dhome");	
			}
			
			}
			else
			{
				return mapping.findForward("failure");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		}
		return null;}}
	

