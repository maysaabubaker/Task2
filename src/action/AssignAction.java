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

import form.AssignForm;
import model.*;

public class AssignAction extends Action {
	public ActionForward execute(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
		    throws IOException, ServletException {
		if(form != null) {
        AssignForm assignForm=(AssignForm)form;
	HttpSession session=request.getSession();
	int lid=(Integer)session.getAttribute("pid");
	int aid=assignForm.getAid();
	String title=assignForm.getTitle();
	String summary=assignForm.getSummary();
	Connection con=DatabaseConnection.getConnection();
System.out.println(lid);
System.out.println(aid);
System.out.println(title);
System.out.println(summary);


	try {
		PreparedStatement ps=con.prepareStatement("insert into tasks(title,summary,aid,status,lid) values(?,?,?,'to do',?)");
		ps.setString(1,title);
		ps.setString(2, summary);
		ps.setInt(3, aid);
		ps.setInt(4, lid);

		ps.executeUpdate();		
		 return mapping.findForward("success");



	} catch (Exception e) {
		e.printStackTrace();
	}
	



	
}
		return mapping.findForward("failure");}}
