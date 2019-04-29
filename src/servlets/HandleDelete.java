package servlets;

import beans.data.Login;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;

public class HandleDelete extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("gb2312");
        String delete= req.getParameter("delete");
        Login loginBean = null;
        HttpSession session = req.getSession(true);
        try {
            loginBean = (Login)session.getAttribute("loginBean");
            boolean b = loginBean.getLogname()==null||loginBean.getLogname().length()==0;
            if (b)
                resp.sendRedirect("login.jsp");
            LinkedList<String> car = loginBean.getCar();
            car.remove(delete);
        }catch(Exception exp){
            resp.sendRedirect("login.jsp");
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("lookShoppingCar.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
