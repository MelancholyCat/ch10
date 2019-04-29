<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="java.sql.*" %>
<HTML><HEAD><%@ include file="head.txt" %></HEAD>
<BODY background=image/back.jpg><font size=2>
<div align="center">
<%   try {  Class.forName("com.mysql.jdbc.Driver");
      }
      catch(Exception e){} 
      String uri="jdbc:mysql://127.0.0.1:3306/mobileshop?"+
                             "user=root&password = &characterEncoding=gb2312&useSSL=false";
      Connection con; 
      Statement sql;
      ResultSet rs;
      try {
        con=DriverManager.getConnection(uri);
        sql=con.createStatement();
        //读取mobileClassify表，获得分类：
        rs=sql.executeQuery("SELECT * FROM mobileclassify  ");
        out.print("<form action='queryServlet' method ='post'>") ;
        out.print("<select name='fenleiNumber'>") ;
        while(rs.next()){
           int id = rs.getInt(1);
           String mobileCategory = rs.getString(2);
           out.print("<option value ="+id+">"+mobileCategory+"</option>");
        }  
        out.print("</select>");
        out.print("<input type ='submit' value ='提交'>");  
        out.print("</form>");
        con.close();
     }
     catch(SQLException e){ 
        out.print(e);
     }
%>
</div></font>
</BODY></HTML>
