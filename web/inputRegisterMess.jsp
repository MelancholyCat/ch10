<%--
  Created by IntelliJ IDEA.
  User: Atlantis
  Date: 2019-04-28
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" %>
<jsp:useBean id="userBean" class="beans.data.Register" scope="request"/>
<HTML> <BODY>
<HEAD><%@ include file="head.txt" %></HEAD>
<title>注册页面</title>
<Font size=2>
    <div align="center">
        <FORM action="registerServlet" method="post" name=form>
            <table>
                用户名由字母、数字、下划线构成，*注释的项必须填写。
                <tr><td>*用户名称:</td><td><Input type=text name="logname" ></td>
                    <td>*用户密码:</td><td><Input type=password name="password">
                    </td></tr>
                <tr><td>*重复密码:</td><td>
                    <Input type=password name="again_password"></td>
                    <td>联系电话:</td><td><Input type=text name="phone"></td></tr>
                <tr><td>邮寄地址:</td><td><Input type=text name="address"></td>
                    <td>真实姓名:</td><td><Input type=text name="realname"></td>
                    <td><Input type=submit name="g" value="提交"></td> </tr>
            </table>
        </Form>
    </div >
    <div align="center">
        <p> 注册反馈：
            <jsp:getProperty name="userBean"  property="backNews" /></p>
        <table border=3>
            <tr><td>会员名称:</td>
                <td><jsp:getProperty name="userBean" property="logname"/></td>
            </tr>
            <tr><td>姓名:</td>
                <td><jsp:getProperty name="userBean" property="realname"/></td>
            </tr>
            <tr><td>地址:</td>
                <td><jsp:getProperty name="userBean" property="address"/></td>
            </tr>
            <tr><td>电话:</td>
                <td><jsp:getProperty name="userBean" property="phone"/></td>
            </tr>
        </table></div>
</Font></BODY></HTML>