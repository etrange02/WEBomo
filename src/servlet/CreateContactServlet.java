package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import session.IDAOContactGroupRemote;
import session.IDAOContactRemote;
import entity.Address;
import entity.Contact;
import entity.ContactGroup;
import entity.Entreprise;
import entity.PhoneNumber;

/**
 * Servlet implementation class CreateContactServlet
 */
public class CreateContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	/*@EJB(name="DAOContactBean")
	private IDAOContactLocal dao;*/
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateContactServlet() {
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
		Contact c = null;
		
		IDAOContactRemote dao = null;
		IDAOContactGroupRemote daoGroup = null;
		try {
			Context context = new InitialContext();
			dao = (IDAOContactRemote) context.lookup("DAOContactBean");
			daoGroup = (IDAOContactGroupRemote) context.lookup("DAOContactGroupBean");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		if (request.getParameter("entreprise") != null) {
			Entreprise e = new Entreprise();// entreprise;
			try {
				e.setNumSiret(Integer.parseInt(request.getParameter("numSiret")));
			} catch (NumberFormatException nfe) {
				response.sendRedirect("CreateContact.jsp");
				return;
			}
			c = e;
		} else {
			c = new Contact();//contact;
		}
		
		c.setFirstname(request.getParameter("firstname"));
		c.setLastname(request.getParameter("lastname"));
		c.setEmail(request.getParameter("email"));
		
		Address a = new Address();
		a.setCity(request.getParameter("city"));
		a.setCountry(request.getParameter("country"));
		a.setStreet(request.getParameter("street"));
		a.setZip(request.getParameter("zip"));
		c.setAddress(a);
		
		List<ContactGroup> contactGroups = new ArrayList<ContactGroup>();
		/*String[] groups = request.getParameterValues("group[]");*/
		List<String> groups = new ArrayList<String>();
		if (request.getParameter("ami") != null)
			groups.add("ami");
		if (request.getParameter("collegue") != null)
			groups.add("collegue");
		if (request.getParameter("famille") != null)
			groups.add("famille");
		
		for (int i = 0; i<groups.size(); ++i) {
			ContactGroup cg = daoGroup.searchContactGroup(groups.get(i));
			if (cg == null) {
				cg = new ContactGroup();
				cg.setGroupName(groups.get(i));
			}
			contactGroups.add(cg);
		}
		c.setBooks(contactGroups);
			
		List<PhoneNumber> pns = new ArrayList<PhoneNumber>();
		if (request.getParameter("homephone") != null && !request.getParameter("homephone").isEmpty()) {
			PhoneNumber pn = new PhoneNumber();	
			pn.setPhoneNumber(request.getParameter("homephone"));
			pn.setPhoneKind("homephone");
			pn.setContact(c);
			pns.add(pn);
			System.out.println(pn.getPhoneKind() + "-" + pn.getPhoneNumber());
		}
		if (request.getParameter("officephone") != null && !request.getParameter("officephone").isEmpty()) {
			PhoneNumber pn = new PhoneNumber();
			pn.setPhoneNumber(request.getParameter("officephone"));
			pn.setPhoneKind("officephone");
			pn.setContact(c);
			pns.add(pn);
			System.out.println(pn.getPhoneKind() + "-" + pn.getPhoneNumber());
		}
		if (request.getParameter("cellphone") != null && !request.getParameter("cellphone").isEmpty()) {
			PhoneNumber pn = new PhoneNumber();
			pn.setPhoneNumber(request.getParameter("cellphone"));
			pn.setPhoneKind("cellphone");
			pn.setContact(c);
			pns.add(pn);
			System.out.println(pn.getPhoneKind() + "-" + pn.getPhoneNumber());
		}
		c.setPhones(pns);
		
		dao.createContact(c);
		response.sendRedirect("CreateContact.jsp");
	}

}
