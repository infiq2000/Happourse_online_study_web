package Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.stream.StreamSupport;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import Dao.AccountUtil;
import Dao.InstructorUtil;
import Dao.LectureUtil;
import Dao.UserUtil;

/**
 * Servlet implementation class UpdateTest2
 */
@WebServlet("/UpdateTest2")
public class UpdateTest2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final String UPLOAD_DIRECTORY = "C:\\Users\\Tan Dat\\git\\Happourse\\src\\main\\webapp\\images\\avatar";

	@Resource(name = "jdbc/Happourse")
	private DataSource dataSource;
	Dao.CourseUtil courseUtil;
	AccountUtil accUtil;
	UserUtil userUtil;
	InstructorUtil insUtil;
	LectureUtil lecUtil;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		accUtil = new AccountUtil(dataSource);
		userUtil = new UserUtil(dataSource);
		courseUtil = new Dao.CourseUtil(dataSource);
		insUtil = new InstructorUtil(dataSource);
		lecUtil = new LectureUtil(dataSource);
	}

	public UpdateTest2() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	String getAlphaNumericString(int n) {

		// chose a Character random from this String
		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789" + "abcdefghijklmnopqrstuvxyz";

		// create StringBuffer size of AlphaNumericString
		StringBuilder sb = new StringBuilder(n);

		for (int i = 0; i < n; i++) {

			// generate a random number between
			// 0 to AlphaNumericString variable length
			int index = (int) (AlphaNumericString.length() * Math.random());

			// add Character one by one in end of sb
			sb.append(AlphaNumericString.charAt(index));
		}

		return sb.toString();
	}

	public static String[] splitPath(String pathString) {
		Path path = Paths.get(pathString);
		return StreamSupport.stream(path.spliterator(), false).map(Path::toString).toArray(String[]::new);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String filename = null;
		HashMap<String, String> fields = new HashMap<String, String>();
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				String abc = getAlphaNumericString(5);
				for (FileItem item : multiparts) {
					if (!item.isFormField()) {
						String name = new File(item.getName()).getName();
						String realPath = request.getServletContext().getRealPath("/images/avatar");

						try {
							
							String[] tmp = name.split("[.]");
							item.write(new File(UPLOAD_DIRECTORY + File.separator + tmp[0] + abc + "." + tmp[1]));
							filename = "images/avatar" + "/" + tmp[0] + abc + "." + tmp[1];
							System.out.println("ten file" + filename);
						} catch (Exception ex) {
							System.out.println("ten file" + ex);
						}

					} else {
						fields.put(item.getFieldName(), item.getString());
						String name = item.getFieldName();
						String value = item.getString();
						System.out.println("name:" + name);
						System.out.println("value:" + value);
					}
				}

				// File uploaded successfully
				request.setAttribute("message", "File Uploaded Successfully");
			} catch (Exception ex) {
				System.out.println("error 1" + ex);
				request.setAttribute("message", "File Upload Failed due to " + ex);
			}

		} else {
			request.setAttribute("message", "Sorry this Servlet only handles file upload request");
		}
		int aid = (int) request.getSession(false).getAttribute("aid");
		String username = fields.get("username");
		String fullName = fields.get("fullName");
		String major = fields.get("major");
		System.out.println(fields.get("birth"));
		Date birth = Date.valueOf(fields.get("birth"));
		String phoneNumber = fields.get("phoneNumber");
		String email = fields.get("email");
		String address = fields.get("address");
		String describe = fields.get("about");
		String experiment = fields.get("experiment");
		String countryName = fields.get("country");
		int accountType = (int) request.getSession().getAttribute("account_type");
		String[] a = fullName.split(" ");
		String b = a[a.length - 1];
		HttpSession session = request.getSession(true);
		session.setAttribute("name", b);
		if (accountType == 0) {
			try {
				userUtil.updateUser(aid, username, fullName, major, birth, phoneNumber, email, address, describe,
						experiment, countryName, filename);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				insUtil.updateInstructor(aid, username, fullName, major, birth, email, address, describe, experiment,
						countryName, filename);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Profile");
		dispatcher.forward(request, response);
	}

}
