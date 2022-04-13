package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.json.simple.JSONObject;

import Dao.AccountUtil;
import Dao.InstructorUtil;
import Dao.LectureUtil;
import Dao.UserUtil;
import Model.Content;

/**
 * Servlet implementation class ShowContentToUpdate
 */
@WebServlet("/ShowContentToUpdate")
public class ShowContentToUpdate extends HttpServlet {
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
    public ShowContentToUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int lc_id = Integer.parseInt(request.getParameter("lc_id"));
		int chapter_id = Integer.parseInt(request.getParameter("chapter_id"));
		String name = request.getParameter("name");
		Content ct = null;
		try {
			ct = lecUtil.getContentsbyContendId(lc_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String nameContent = ct.getName();
		String desription = "chua co database";
		String url = ct.getLink();
		JSONObject json = new JSONObject();
		String show = "									<div class=\"box-inner\">\r\n"
				+ "									\r\n"
				+ "										<div class=\"edit_chapter\">\r\n"
				+ "											<div class=\"form-group\" style=\"margin-left: 10px;\">\r\n"
				+ "												<label style=\"font-size:14px;\">Chapter Title</label>\r\n"
				+ "												<input type=\"text\" name=\"username\" value=\""+name+"\" placeholder=\""+name+"\" required>\r\n"
				+ "											</div>\r\n"
				+ "											\r\n"
				+ "											<div class=\"button-box text-center\"  style=\"margin-top: 40px;\">\r\n"
				+ "												<button id=\"s1\" style=\"margin-left: 40px; background: pink; \" type=\"button\" class=\"theme-btn btn-style-two\"><span class=\"txt\">Save</span></button>																\r\n"
				+ "											</div>\r\n"
				+ "										</div>\r\n"
				+ "										\r\n"
				+ "										<div class=\"edit_content\" style=\"display:block;\">\r\n"
				+ "											<!-- Content -->\r\n"
				+ "											<div class=\"form-group\" id=\"c1\" style=\"margin-left:10px;\">\r\n"
				+ "												<label style=\"font-size:14px;\">Content Title</label>\r\n"
				+ "												<input type=\"text\" name=\"username\" value=\""+nameContent+"\" placeholder=\""+nameContent+"\" required>\r\n"
				+ "\r\n"
				+ "												<label style=\"font-size:14px; margin-top:20px;\">Content Description</label>\r\n"
				+ "												<span class=\"support\"><strong>Markdown supported:</strong>  *Italic*  l  **Bold**   l   - List Item   l   --- Horizontal Rule</span>\r\n"
				+ "												<textarea class=\"\" name=\"message\" placeholder=\""+desription+"\">"+desription+"</textarea>\r\n"
				+ "\r\n"
				+ "												<label style=\"font-size:14px; margin-top:20px;\">Url</label>\r\n"
				+ "												<input type=\"text\" name=\"username\" value=\""+url+"\" placeholder=\""+url+"\">\r\n"
				+ "\r\n"
				+ "												<label style=\"font-size:14px; margin-top:20px;\">Duration</label>\r\n"
				+ "												\r\n"
				+ "												<div style=\"margin: 0 0 10px 40px;\">\r\n"
				+ "													<label style=\"margin-right: 24px; font-size:14px;\">Minute</label>\r\n"
				+ "													<div style=\" width: 80px; display:inline;\">\r\n"
				+ "														<input style=\"width: 80px; display:inline;\" onclick=\"var result = document.getElementById('quantity1'); var qty = result.value; if( !isNaN(qty) &amp; qty > 1 ) result.value--;return false;\" type='button' value='-' />\r\n"
				+ "														<input style=\"width: 80px; display:inline; background: white;\" id='quantity1' min='0' name='quantity' type='text' value='0' />\r\n"
				+ "														<input style=\"width: 80px; display:inline;\" onclick=\"var result = document.getElementById('quantity1'); var qty = result.value; if( !isNaN(qty)) result.value++;return false;\" type='button' value='+' />\r\n"
				+ "													</div>\r\n"
				+ "												</div>\r\n"
				+ "												\r\n"
				+ "												<div style=\"margin-left: 40px;\">\r\n"
				+ "													<label style=\"margin-right: 20px; font-size:14px;\">Second</label>\r\n"
				+ "													<div style=\" width: 80px; display:inline;\">\r\n"
				+ "														<input style=\"width: 80px; display:inline;\" onclick=\"var result = document.getElementById('quantity2'); var qty = result.value; if( !isNaN(qty) &amp; qty > 1 ) result.value--;return false;\" type='button' value='-' />\r\n"
				+ "														<input style=\"width: 80px; display:inline; background: white;\" id='quantity2' min='1' max='59' name='quantity' type='text' value='1' />\r\n"
				+ "														<input style=\"width: 80px; display:inline;\" onclick=\"var result = document.getElementById('quantity2'); var qty = result.value; if( !isNaN(qty)) result.value++;return false;\" type='button' value='+' />\r\n"
				+ "													</div>\r\n"
				+ "												</div>\r\n"
				+ "												\r\n"
				+ "												<div class=\"button-box text-center\"  style=\"margin-top: 40px;\">\r\n"
				+ "													<button id=\"s1\" style=\"margin-left: 40px; background: pink; \" type=\"button\" class=\"theme-btn btn-style-two\"><span class=\"txt\">Save</span></button>																\r\n"
				+ "												</div>\r\n"
				+ "											</div>\r\n"
				+ "										</div>\r\n"
				+ "										\r\n"
				+ "									</div>";
		PrintWriter out = response.getWriter();
		out.print(show);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
