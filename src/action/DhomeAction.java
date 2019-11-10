package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import model.*;

public class DhomeAction extends Action {
	
	public ActionForward execute(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
		    throws IOException, ServletException {
	HttpSession session=request.getSession();
	int pid=(Integer)session.getAttribute("pid");
	Connection con=DatabaseConnection.getConnection();
	ArrayList<Task> tasks=new ArrayList<Task>();
	try {
		PreparedStatement ps=con.prepareStatement("select * from tasks where aid=?");
		ps.setInt(1,pid);
		ResultSet result=ps.executeQuery();
		while(result.next())
		{
		int tid=result.getInt(1);		
		String title=result.getString(2);
		String summary=result.getString(3);
		String status=result.getString(4);
		Task t=new Task(tid,title,summary,status);
        tasks.add(t);
		}
		
        request.setAttribute("userTasks", tasks);
        return mapping.findForward("success");	

       

	} catch (Exception e) {
		e.printStackTrace();
	}
	return mapping.findForward("failure");

}
}
