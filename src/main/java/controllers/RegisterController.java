package controllers;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import managers.UserManager;
import models.User;

/**
 * Servlet implementation class FormController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	   System.out.print("RegisterController: ");
	   
	   User user = new User();
	   UserManager manager = new UserManager();
	   String view = "ViewRegisterForm.jsp";
		
	   try {
		   
		   BeanUtils.populate(user, request.getParameterMap());
		   
		   if (manager.isRegisterComplete(user) && manager.checkUserNotRepeat(user)) {
			   manager.addUser(user);
			   manager.finalize();
			   System.out.println(" user ok, forwarding to ViewLoginForm");
			   HttpSession session = request.getSession();
			   session.setAttribute("login",user);
			   view = "ViewLoginDone.jsp";
		   } 
		   else {
			   System.out.println(" forwarding to ViewRegisterForm");
			   request.setAttribute("user",user);
			  
		   }
		   RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		   dispatcher.forward(request, response);
	   
	   } catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
	   }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
