package servlet;

import java.io.IOException;

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
import entity.PhoneNumber;

public class PopulateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PopulateServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IDAOContactRemote dao = null;
		IDAOContactGroupRemote daoGroup = null;
		try {
			Context context = new InitialContext();
			dao = (IDAOContactRemote) context.lookup("DAOContactBean");
			daoGroup = (IDAOContactGroupRemote) context.lookup("DAOContactGroupBean");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		Contact c = new Contact();
		c.setEmail("email@free.fr");
		c.setFirstname("Moi");
		c.setLastname("toi");
		
		Address a = new Address();
		a.setCity("Paris");
		a.setCountry("France");
		a.setStreet("4 place jussieu");
		a.setZip("75005");
		c.setAddress(a);
		
		ContactGroup cg = new ContactGroup();
		cg.setGroupName("ami");
		daoGroup.createContactGroup(cg);
		cg.getContacts().add(c);
		c.getBooks().add(cg);
		
		PhoneNumber pn = new PhoneNumber();
		pn.setPhoneKind("cellphone");
		pn.setPhoneNumber("0612547854");
		pn.setContact(c);
		c.getPhones().add(pn);
		
		dao.createContact(c);
		
		response.sendRedirect("Menu.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IDAOContactRemote dao = null;
		IDAOContactGroupRemote daoGroup = null;
		try {
			Context context = new InitialContext();
			dao = (IDAOContactRemote) context.lookup("DAOContactBean");
			daoGroup = (IDAOContactGroupRemote) context.lookup("DAOContactGroupBean");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		Contact c = new Contact();
		c.setEmail("email@free.fr");
		c.setFirstname("Moi");
		c.setLastname("toi");
		
		Address a = new Address();
		a.setCity("Paris");
		a.setCountry("France");
		a.setStreet("4 place jussieu");
		a.setZip("75005");
		c.setAddress(a);
		
		ContactGroup cg = new ContactGroup();
		cg.setGroupName("ami");
		daoGroup.createContactGroup(cg);
		cg.getContacts().add(c);
		c.getBooks().add(cg);
		
		PhoneNumber pn = new PhoneNumber();
		pn.setPhoneKind("cellphone");
		pn.setPhoneNumber("0612547854");
		pn.setContact(c);
		c.getPhones().add(pn);
		
		dao.createContact(c);
		
		Contact c2 = new Contact();
		c2.setEmail("email@email.com");
		c2.setFirstname("firstname");
		c2.setLastname("lastname");
		
		Address a2 = new Address();
		a2.setCity("Lille");
		a2.setCountry("France");
		a2.setStreet("une rue dans la ville");
		a2.setZip("50000");
		c2.setAddress(a2);
		
		cg.getContacts().add(c2);
		c2.getBooks().add(cg);
		ContactGroup cg2 = new ContactGroup();
		cg2.setGroupName("famille");
		daoGroup.createContactGroup(cg2);
		cg2.getContacts().add(c2);
		c2.getBooks().add(cg2);
			
		PhoneNumber pn2 = new PhoneNumber();
		pn2.setPhoneKind("homephone");
		pn2.setPhoneNumber("0132456789");
		pn2.setContact(c2);
		c2.getPhones().add(pn2);
		dao.createContact(c2);
		
		response.sendRedirect("Menu.jsp");
	}
}
