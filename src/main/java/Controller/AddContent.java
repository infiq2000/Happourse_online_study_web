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
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.json.simple.JSONObject;

import Dao.AccountUtil;
import Dao.CourseUtil;
import Dao.InstructorUtil;
import Dao.LectureUtil;
import Dao.UserUtil;
import Model.Chapter;
import Model.Content;

/**
 * Servlet implementation class AddContent
 */
@WebServlet("/AddContent")
public class AddContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
	Dao.CourseUtil courseUtil; 
	AccountUtil accUtil; 
    UserUtil userUtil;
    InstructorUtil insUtil;
    LectureUtil lecUtil;
    
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
    public AddContent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//    nameContent : nameContent,
//	course_id: course_id,
//	chapter_id: chapter_id,
//	desription : desription,
//	url:url
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//int course_id = Integer.parseInt(request.getParameter("course_id"));
		String nameContent = request.getParameter("nameContent");
		String desription = request.getParameter("desription");
		int chapter_id = (int)request.getSession(false).getAttribute("chapter_id");
		System.out.println("chapter_id: " + chapter_id);
		String url = request.getParameter("url");
		System.out.println("url: " +  url);
		int content = -1;
		try {
			content = courseUtil.getIndexOfContent();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			courseUtil.addContent(content,nameContent, desription,chapter_id,url);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Content ct = null;
		try {
			ct = lecUtil.getContentsbyContendId(content);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		String ip = "														<li id=\"content1\" style=\"margin: 0 0 40px 40px;\">\r\n"
				+ "															<label class=\"ct1\" style=\"margin: 0 0 20px 40px;\">- Content 1</label>\r\n"
				+ "															<div class=\"form-group\" id=\"c1\" style=\"margin-left:40px;\">\r\n"
				+ "																<label style=\"font-size:14px;\">Content Title</label>\r\n"
				+ "																<input id = \"nameContent\" type=\"text\" name=\"username\" value=\"\" placeholder=\"Content 1\" required>\r\n"
				+ "	\r\n"
				+ "																<label style=\"font-size:14px;\">Content Description</label>\r\n"
				+ "																<span class=\"support\"><strong>Markdown supported:</strong>  *Italic*  l  **Bold**   l   - List Item   l   --- Horizontal Rule</span>\r\n"
				+ "																<textarea id = \"desription\" class=\"\" name=\"message\" placeholder=\"Shortly describe this content\"></textarea>\r\n"
				+ "																<label style=\"font-size:14px;\">Url</label>\r\n"
				+ "																<input id = \"url\" type=\"text\" name=\"username\" value=\"\" placeholder=\"Url 1\">\r\n"
				+ "	\r\n"
				+ "																<label style=\"font-size:14px;\">Duration</label>\r\n"
				+ "																\r\n"
				+ "																<div style=\"margin: 0 0 20px 40px;\">\r\n"
				+ "																	<label style=\"margin-right: 24px; font-size:14px;\">Minute</label>\r\n"
				+ "																	<div style=\" width: 80px; display:inline;\">\r\n"
				+ "																		<input style=\"width: 80px; display:inline;\" onclick=\"var result = document.getElementById('quantity1'); var qty = result.value; if( !isNaN(qty) &amp; qty > 1 ) result.value--;return false;\" type='button' value='-' />\r\n"
				+ "																		<input style=\"width: 80px; display:inline; background: white;\" id='quantity1' min='0' name='quantity' type='text' value='0' />\r\n"
				+ "																		<input style=\"width: 80px; display:inline;\" onclick=\"var result = document.getElementById('quantity1'); var qty = result.value; if( !isNaN(qty)) result.value++;return false;\" type='button' value='+' />\r\n"
				+ "																	</div>\r\n"
				+ "																</div>\r\n"
				+ "																\r\n"
				+ "																<div style=\"margin-left: 40px;\">\r\n"
				+ "																	<label style=\"margin-right: 20px; font-size:14px;\">Second</label>\r\n"
				+ "																	<div style=\" width: 80px; display:inline;\">\r\n"
				+ "																		<input style=\"width: 80px; display:inline;\" onclick=\"var result = document.getElementById('quantity2'); var qty = result.value; if( !isNaN(qty) &amp; qty > 1 ) result.value--;return false;\" type='button' value='-' />\r\n"
				+ "																		<input style=\"width: 80px; display:inline; background: white;\" id='quantity2' min='1' max='59' name='quantity' type='text' value='1' />\r\n"
				+ "																		<input style=\"width: 80px; display:inline;\" onclick=\"var result = document.getElementById('quantity2'); var qty = result.value; if( !isNaN(qty)) result.value++;return false;\" type='button' value='+' />\r\n"
				+ "																	</div>\r\n"
				+ "																</div>\r\n"
				+ "																\r\n"
				+ "	\r\n"
				+ "															</div>\r\n"
				+ "														</li>	";
		String link = "<a href=\""+ct.getLink()+"\" class=\"lightbox-image intro-video-box\"><span class=\"fa fa-play\"><i class=\"ripple\"></i></span></a>";
		JSONObject json = new JSONObject();
		String check = "									<label>URL</label>\r\n"
				+ "									\r\n"
				+ "									<input type=\"text\" name=\"username\" value=\"\" placeholder=\""+ct.getLink()+"\" required>\r\n";
		String sct = "											<ul class=\"accordion-box style-two\"  style=\"margin-left: 55px;\">\r\n"										
				+ "													<li>\r\n"
				+ "														<a href=\""+"UpdateContent"+"\"> "+" "+ct.getName()+" </a>\r\n"
				+ "													</li>\r\n"
				+ "												</ul>";
		json.put("link", link);
		json.put("test", check);
		json.put("show", sct);
		json.put("ip", ip);
		out.write(json.toString());
		out.close();
		//<a href="" class="lightbox-image intro-video-box"><span class="fa fa-play"><i class="ripple"></i></span></a>
	}

}
