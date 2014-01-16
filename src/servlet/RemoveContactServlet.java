package servlet;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import session.DAOContact;
import entity.*;


/**
 * Servlet implementation class RemoveContactServlet
 */
public class RemoveContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB(name="DAOContact")
	private IDAOContactLocal dao;
       
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
		dao.removeContact(id);
		response.sendRedirect("Menu.jsp");
	}

}
