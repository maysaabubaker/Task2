package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

public class ProfileAction extends Action {
	public ActionForward execute(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
		    throws IOException, ServletException {
		String fname="",lname="",address="",email="",phonenumber="",level="";
		Connection con=DatabaseConnection.getConnection();
		PrintWriter out= response.getWriter();
		HttpSession session=request.getSession();
		int pid=(Integer)session.getAttribute("pid");
		out.println(pid);

		try {
			PreparedStatement ps=con.prepareStatement("select fname,lname,address"
			+ ",email,phonenumber,level_type from person,levels where id=?"
			+" and person.level=levels.level_num ");
			ps.setInt(1,pid);
			ResultSet result=ps.executeQuery();
			while(result.next())
			{
			 fname=result.getString(1);
			 lname=result.getString(2);
			 address=result.getString(3);
			 email=result.getString(4);
			 phonenumber=result.getString(5);
			 level=result.getString(6);
			}
			Person person=new Person(fname,lname,address,email,phonenumber,level);

			request.setAttribute("person", person);
		}
		 catch (Exception e) {
				e.printStackTrace();
			}
			
		return mapping.findForward("success");		
	
	
	}
	
	}
	

