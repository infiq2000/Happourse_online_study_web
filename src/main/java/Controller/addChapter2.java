package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import Dao.AccountUtil;
import Dao.InstructorUtil;
import Dao.LectureUtil;
import Dao.UserUtil;
import Model.Chapter;
import Model.Content;

/**
 * Servlet implementation class addChapter2
 */
@WebServlet("/addChapter2")
public class addChapter2 extends HttpServlet {
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
    public addChapter2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int course_id = Integer.parseInt(request.getParameter("course_id"));
		String name = request.getParameter("name");
		int chapter_id = -1;
		try {
			chapter_id = courseUtil.getIndexOfChapter();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			courseUtil.addChapter(chapter_id, course_id, name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("chapter_id gen: "+chapter_id);
		HttpSession session = request.getSession(true);
		List<Chapter> list_chapter = new ArrayList<Chapter>();
		try {
			list_chapter = lecUtil.getChapterOfCourse(course_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("list_chapter", list_chapter);
		session.setAttribute("chapter_id",chapter_id);
		String html = "									<div class=\"form-group\" style=\"width:680px; margin-top:0px;\">\r\n"
				+ "										<!-- Accordion Box -->\r\n"
				+ "											<label class=\"chapter-s\">- Chapter</label>";
		//List<Chapter> chapter_list = (List<Chapter>)request.getAttribute("list_chapter");
		List<Chapter> chapter_list = null;
		try {
			chapter_list = lecUtil.getChapterOfCourse(course_id);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String html2 = "<!-- Tab -->\r\n"
				+ "											<div class=\"tab\" id=\"prod-curriculum\">\r\n"
				+ "												<div class=\"content\">\r\n"
				+ "													<!-- Accordion Box -->\r\n"
				+ "													<ul class=\"accordion-box\">";
		html += html2;
		int chapter_number = 0;
		Chapter ch1 = null;
		if (chapter_list.size()!=0){
			chapter_number = chapter_list.size();
			ch1 = chapter_list.get(0);
		}
		int flag = -1;
		if (chapter_number < 2){
			flag = 0;
		}
		if (ch1 != null) {
			List<Content> list_of_content1 = null;
	    	try {
				 list_of_content1 = lecUtil.getContents(ch1.getChap_id());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String nameChapter = ch1.getName();
			String html3 = "															<li class=\"accordion block\">\r\n"
					+ "																<div class=\"acc-btn active\"><div class=\"icon-outer\"><span class=\"icon icon-plus flaticon-down-arrow\"></span></div>"+ch1.getName()+"</div>\r\n"
					+ "																<div class=\"acc-content current\">";
			html += html3;
			for(Content ct: list_of_content1) {
				String html4 = "																		<div class=\"content\">\r\n"
						+ "																			<div class=\"clearfix\">\r\n"
						+ "																				<div class=\"pull-left\">\r\n"
						+ "																					<p onclick = \"showContent('"+ct.getLc_id()+"','"+ct.getChap_id()+"','"+nameChapter+"')\" class=\"lightbox-image play-icon\"><span class=\"fa fa-play\"></span>"+ct.getName()+"</p>\r\n"
						+ "																				</div>\r\n"
						+ "																				<div class=\"pull-right\">\r\n"
						+ "																					<div class=\"minutes\">35 Minutes</div>\r\n"
						+ "																				</div>\r\n"
						+ "																			</div>\r\n"
						+ "																		</div>";
				html += html4;
			}
			String html5 = "																</div>\r\n"
					+ "															</li>	";
			html += html5;
		}
		else {
			String html6 = "<p> no chapter</p>" ;
			html += html6;
		}
		if (flag != 0) {
			 for(int i=1; i<chapter_number;i++) {
				 List<Content> list_of_content2 = null;
			    	try {
						list_of_content2 = lecUtil.getContents(chapter_list.get(i).getChap_id());
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					String nameChapter = chapter_list.get(i).getName();
					String html7 = "<li class=\"accordion block\">\r\n"
							+ "																		<div class=\"acc-btn\"><div class=\"icon-outer\"><span class=\"icon icon-plus flaticon-down-arrow\"></span></div>"+chapter_list.get(i).getName()+"</div>\r\n"
							+ "																		<div class=\"acc-content current\">";
					html += html7;
					for(Content ct : list_of_content2) {
						String html8 = "																				<div class=\"content\">\r\n"
								+ "																					<div class=\"clearfix\">\r\n"
								+ "																						<div class=\"pull-left\">\r\n"
								+ "																							<p onclick = \"showContent('"+ct.getLc_id()+"', '"+ct.getChap_id()+"','"+nameChapter+"')\" class=\"lightbox-image play-icon\"><span class=\"fa fa-play\"></span>"+ct.getName()+"</p>\r\n"
								+ "																						</div>\r\n"
								+ "																						<div class=\"pull-right\">\r\n"
								+ "																							<div class=\"minutes\">35 Minutes</div>\r\n"
								+ "																						</div>\r\n"
								+ "																					</div>\r\n"
								+ "																				</div>";
						html += html8;
					}
					String html9 = "																		</div>\r\n"
							+ "																	</li>";
					html += html9;	
			 }
		}
		String html10 = "													</ul>				\r\n"
				+ "											</div>\r\n"
				+ "										</div> <!--ss  -->\r\n"
				+ "									</div>";
		html += html10;
		PrintWriter out = response.getWriter();
		out.print(html);
	}

}
