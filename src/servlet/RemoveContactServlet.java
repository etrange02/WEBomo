package servlet;

import java.io.IOException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import session.IDAOContactRemote;
import entity.Contact;


/**
 * Servlet implementation class RemoveContactServlet
 */
public class RemoveContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/*@EJB(name="DAOContactBean")
	private IDAOContactLocal dao;*/
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveContactServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = -1;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			id = -1;
		}
		
		IDAOContactRemote dao = null;
		try {
			Context context = new InitialContext();
			dao = (IDAOContactRemote) context.lookup("DAOContactBean");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		Contact contact = dao.searchContact(id);
		
		RequestDispatcher jsp = request.getRequestDispatcher("/RemoveContact.jsp");
		request.setAttribute("contact", contact);
		jsp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		int id = -1;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			id = -1;
		}
		
		IDAOContactRemote dao = null;
		try {
			Context context = new InitialContext();
			dao = (IDAOContactRemote) context.lookup("DAOContactBean");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		dao.removeContact(id);
		response.sendRedirect("Menu.jsp");
	}

}
