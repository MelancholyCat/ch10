package servlets;

import beans.data.DataByPage;
import com.sun.rowset.CachedRowSetImpl;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class searchByCondition extends HttpServlet {

    CachedRowSetImpl rowSet = null;
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        }catch (Exception e){ }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("gb2312");
        String searchMess = req.getParameter("searchMess");
        String radioMess = req.getParameter("radio");
        if (searchMess==null||searchMess.length()==0){
            fail(req,resp,"没有查询信息，无法查询");
            return;
        }
        String condition = "";
        if (radioMess.equals("mobile_version")){
            condition =
                    "SELECT * FROM mobileForm where mobile_vesion LIKE '%"+searchMess+"%'";
        }else if (radioMess.equals("mobile_name")){
            condition =
                    "SELECT * FROM mobileForm where mobile_name LIKE '%"+searchMess+"%'";
        }else if (radioMess.equals("mobile_price")){
            double max=0,min=0;
            String regex = "[^0123456789.]";
            String [] priceMess = searchMess.split(regex);
            if (priceMess.length==1){
                max = min = Double.parseDouble(priceMess[0]);
            }else if (priceMess.length==2){
                min = Double.parseDouble(priceMess[0]);
                max = Double.parseDouble(priceMess[1]);
                if (max<min){
                    double t = max;
                    max = min;
                    min = t;
                }
            }else {
                fail(req,resp,"输入的价格格式有错误");
                return;
            }
            condition =
                    "SELECT * FROM mobileForm where mobile_price <= "+max+" AND mobile_price>= "+min;
        }
        HttpSession session = req.getSession(true);
        Connection con = null;
        DataByPage dataBean = null;
        try {
            dataBean = (DataByPage)session.getAttribute("dataBean");
            if (dataBean == null){
                dataBean = new DataByPage();
                session.setAttribute("dataBean",dataBean);
            }
        }catch (Exception e){
            dataBean = new DataByPage();
            session.setAttribute("dataBean",dataBean);
        }
        String uri="jdbc:mysql://127.0.0.1:3306/mobileshop?"+
                "user=root&password = &characterEncoding=gb2312";
        try {
            con = DriverManager.getConnection(uri);
            Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = sql.executeQuery(condition);
            rowSet = new CachedRowSetImpl();  //创建行集对象
            rowSet.populate(rs);
            dataBean.setRowSet(rowSet);
            con.close();
        }catch (SQLException exq){
            System.out.println(exq.toString());
        }
        resp.sendRedirect("byPageShow.jsp");//重定向到byPageShow.jsp
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
    public void fail(HttpServletRequest req, HttpServletResponse resp,String backNews){
        resp.setContentType("text/html;charset=GB2312");
        try {
            PrintWriter out=resp.getWriter();
            out.println("<html><body>");
            out.println("<h2>"+backNews+"</2>") ;
            out.println("返回：");
            out.println("<a href =searchMobile.jsp>查询手机</a>");
            out.println("</body></html>");
        }
        catch(IOException exp){}
    }

}
