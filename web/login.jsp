<%--
  Created by IntelliJ IDEA.
  User: Atlantis
  Date: 2019-04-28
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" %>
<jsp:useBean id="loginBean" class="beans.data.Login" scope="session"/>
<HTML><HEAD><%@ include file="head.txt" %></HEAD>
<BODY background=image/back.jpg>
<font size=2>
    <div align="center">
        <%-----------------这部分虽然报错 但是！确是可以执行的-------------%>
        <table border=2>
        <tr> <th>登录</th></tr>
        <FORM action="loginServlet" Method="post">
                <tr><td>登录名称:<Input type=text name="logname"></td></tr>
                <tr><td>输入密码:<Input type=password name="password"></td></tr>
        </table>
                <Input type=submit name="g" value="提交">
        </FORM>
        <%-------------------------------------------------------------------%>
    </div >
    <div align="center" >
        登录反馈信息:<jsp:getProperty name="loginBean" property="backNews"/>
        <br>登录名称:<jsp:getProperty name="loginBean" property="logname"/>
        </div>
</font>
</BODY></HTML>


