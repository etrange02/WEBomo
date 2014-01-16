package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import session.*;
import entity.*;

/**
 * Servlet implementation class CreateContactServlet
 */
public class CreateContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	@EJB(name="DAOContact")
	private IDAOContactLocal dao;	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateContactServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ApplicationContext applicationContext = new ClassPathXmlApplicationContext(new String[]{"applicationContext.xml"});
		
		Contact c = null;
		
		if (request.getParameter("entreprise") != null) {
			Entreprise e = (Entreprise) context.getBean("beanEntreprise");
			try {
				e.setNumSiret(Integer.parseInt(request.getParameter("numSiret")));
			} catch (NumberFormatException nfe) {
				response.sendRedirect("CreateContact.jsp");
				return;
			}
			c = e;
		} else {
			c = (Contact) context.getBean("beanContact");
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
			//ContactGroup cg = ((DAOContactGroup) context.getBean("beanDAOContactGroup")).searchContactGroup(groups.get(i));
			ContactGroup cg = null;
			if (cg == null) {
				cg = (ContactGroup) context.getBean("beanContactGroup");
				cg.setGroupName(groups.get(i));
			}
			contactGroups.add(cg);
		}
		c.setBooks(contactGroups);
			
		if (request.getParameter("homephone") != null) {
			PhoneNumber pn = (PhoneNumber) context.getBean("beanPhoneNumber");			
			pn.setPhoneNumber(request.getParameter("homephone"));
			pn.setPhoneKind("homephone");
			c.getPhones().add(pn);
		}
		if (request.getParameter("officephone") != null) {
			PhoneNumber pn = (PhoneNumber) context.getBean("beanPhoneNumber");
			pn.setPhoneNumber(request.getParameter("officephone"));
			pn.setPhoneKind("officephone");
			c.getPhones().add(pn);
		}
		if (request.getParameter("cellphone") != null) {
			PhoneNumber pn = (PhoneNumber) context.getBean("beanPhoneNumber");
			pn.setPhoneNumber(request.getParameter("cellphone"));
			pn.setPhoneKind("cellphone");
			c.getPhones().add(pn);
		}
		
		dao.createContact(c);
		response.sendRedirect("CreateContact.jsp");
	}

}
