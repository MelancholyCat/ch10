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
        <%-----------------�ⲿ����Ȼ���� ���ǣ�ȷ�ǿ���ִ�е�-------------%>
        <table border=2>
        <tr> <th>��¼</th></tr>
        <FORM action="loginServlet" Method="post">
                <tr><td>��¼����:<Input type=text name="logname"></td></tr>
                <tr><td>��������:<Input type=password name="password"></td></tr>
        </table>
                <Input type=submit name="g" value="�ύ">
        </FORM>
        <%-------------------------------------------------------------------%>
    </div >
    <div align="center" >
        ��¼������Ϣ:<jsp:getProperty name="loginBean" property="backNews"/>
        <br>��¼����:<jsp:getProperty name="loginBean" property="logname"/>
        </div>
</font>
</BODY></HTML>


