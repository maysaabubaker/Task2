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

import form.ARForm;
import model.DatabaseConnection;

public class RejectAction extends Action {
	public ActionForward execute(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
		    throws IOException, ServletException {
		if(form != null) {
			ARForm arForm=(ARForm)form;
			int tid=arForm.getTid();
			HttpSession session=request.getSession();
			int level=(Integer)session.getAttribute("level");


			Connection con=DatabaseConnection.getConnection();
			try {
				PreparedStatement ps=con.prepareStatement("delete from tasks where tid=?");
				ps.setInt(1,tid);
				ps.executeUpdate();
			}
			 catch (Exception e) {
					e.printStackTrace();
				}
		 if(level==1)
			 return mapping.findForward("mhome");
		 else if(level==2)
			 return mapping.findForward("lhome");

		}

		
		 return mapping.findForward("failure");
	}
}
