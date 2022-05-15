package Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.Base64;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import Dao.AccountUtil;
import Dao.InstructorUtil;
import Dao.LectureUtil;
import Dao.UserUtil;
import net.sourceforge.tess4j.ITesseract;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;

/**
 * Servlet implementation class GetCropped
 */
@WebServlet("/GetCropped")
public class GetCropped extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="jdbc/Happourse")
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
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetCropped() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		  String base64 = request.getParameter("base64image");
		  int uid = (int)request.getSession(false).getAttribute("uid");
		  System.out.println(base64.substring(0,60)); 
		  String[] a = base64.split(",");
		  base64 = a[1]; 
		  byte[] decodedBytes = Base64.getDecoder().decode(base64); 
		  Files.write(Paths.get("C:\\Users\\Tan Dat\\git\\Happourse_online_study_web\\src\\main\\webapp\\crop\\note\\cropped.jpg"), decodedBytes);
		  
			Tesseract tesseract = new Tesseract();
			try {
				// the path of your tess data folder
				tesseract.setDatapath("C:\\Users\\Tan Dat\\Desktop\\Tess4J\\tessdata"); // tessData path
				// inside the extracted file
				String text = tesseract.doOCR(new File(
						"C:\\Users\\Tan Dat\\git\\Happourse_online_study_web\\src\\main\\webapp\\crop\\note\\cropped.jpg"));
				// path of your image file
				userUtil.insertNode(uid, text);
				System.out.print(text);
			} catch (TesseractException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

}
