package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import session.IDAOContactGroupRemote;
import session.IDAOContactRemote;
import entity.Contact;
import entity.ContactGroup;


/**
 * Servlet implementation class SearchContactServlet
 */
public class SearchContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/*@EJB(name="DAOContactBean")
	private IDAOContactRemote dao;*/
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchContactServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Contact> lc = new ArrayList<Contact>();
		
		IDAOContactRemote dao = null;
		IDAOContactGroupRemote daoGroup = null;
		try {
		Context context = new InitialContext();
		dao = (IDAOContactRemote) context.lookup("DAOContactBean");
		daoGroup = (IDAOContactGroupRemote) context.lookup("DAOContactGroupBean");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		if (request.getParameter("criteria").isEmpty()) {
			
			lc = dao.GetAllContacts();
		} else {
			List<Contact> lc1 = dao.searchContactByName(request.getParameter("criteria"));		
			List<Contact> lc2 = dao.searchContactByPhone(request.getParameter("criteria"));
			ContactGroup cg = daoGroup.searchContactGroup(request.getParameter("criteria"));
			
			if (lc1 != null)
				lc.addAll(lc1);
			if (lc2 != null)
				lc.addAll(lc2);
			if (cg != null)
				lc.addAll(cg.getContacts());
		}
		
		RequestDispatcher jsp = request.getRequestDispatcher("/SearchContact.jsp");
		request.setAttribute("listeContact", lc);
		jsp.forward(request, response);
	}

}
