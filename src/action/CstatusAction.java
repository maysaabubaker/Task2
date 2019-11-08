package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.CstatusForm;
import form.LoginForm;
import model.*;

public class CstatusAction extends Action {
	public ActionForward execute(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
		    throws IOException, ServletException {
				if(form != null) {
					CstatusForm cstatusForm=(CstatusForm)form;
					String status=cstatusForm.getStatus();
					int tid=cstatusForm.getTid();
System.out.println(tid);
System.out.println(status);

					HttpSession session=request.getSession();
					int pid=(Integer)session.getAttribute("pid");
					int level=(Integer)session.getAttribute("level");
					
					Connection con=DatabaseConnection.getConnection();
					try {
						
						PreparedStatement ps=con.prepareStatement("update tasks set status=? where aid=? and tid=?");
						ps.setString(1,status);
						ps.setInt(2,pid);
						ps.setInt(3,tid);
						ps.executeUpdate();
						
					if(level==1)
						return mapping.findForward("mhome");
					else if(level==2)
						return mapping.findForward("lhome");
					else if(level==3)
						return mapping.findForward("dhome");
					else
						return mapping.findForward("failure");
				}
				catch (Exception e) {
					e.printStackTrace();
					
				}
				
				}
				return null;}}