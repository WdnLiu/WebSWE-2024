package controllers;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import managers.ManageTweets;
import models.Tweet;
import models.User;

/**
 * Servlet implementation class AddTweetFromUser
 */
@WebServlet("/AddPhoto")
public class AddPhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPhoto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = null;
		System.out.print("AddTweet: ");
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("login");
		
		ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
		List<FileItem> file;
		try {
			file = sf.parseRequest(request);
			String projectPath = getServletContext().getRealPath("/");
			
			System.out.println("ProjectPath: " + projectPath);
			for (FileItem f : file) {
				f.write(new File(projectPath + "/imgs/" + user.getUser() +f.getName()));
				path = "imgs/" + user.getUser() + f.getName();
			}
			
			System.out.println("Archivo Subido: " + path);
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		ManageTweets mt = new ManageTweets();
		Tweet t = mt.getUserLastTweet(user.getId());
		mt.addImagePath(path, t.getId());
		System.out.println("Path ajustado a TID: " + t.getId() + " " + path + ", Usuario ID:" + user.getId());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}