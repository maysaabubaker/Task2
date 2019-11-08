package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

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

public class LhomeAction extends Action {
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
			ResultSet result1=ps.executeQuery();
			while(result1.next())
			{
			int tid=result1.getInt(1);		
			String title=result1.getString(2);
			String summary=result1.getString(3);
			String status=result1.getString(4);
			Task t=new Task(tid,title,summary,status);
	        tasks.add(t);
			}
           request.setAttribute("userTasks", tasks);
			
            PreparedStatement ps2=con.prepareStatement("select fname,lname,level,id,lid"
			+ " from person where lid=?");
       	    ps2.setInt(1,pid);
		    ResultSet result2=ps2.executeQuery();
			ArrayList<Person> developers=new ArrayList<Person>();

			while(result2.next())
			{
				String name=result2.getString(1)+" "+result2.getString(2);
				int id=Integer.parseInt(result2.getString(4));
				Person p=new Person(id,name);


			developers.add(p);	
			
			}

            request.setAttribute("developers", developers);
            return mapping.findForward("success");	
            
			  

		} catch (Exception e) {
			e.printStackTrace();
		}
		

    return mapping.findForward("failure");	
	
	
	
	
	
	}
}
