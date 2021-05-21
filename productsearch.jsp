<html>
    <head>
        <title>User validation</title>
    </head>
    <body>
        <%@ page import="java.sql.*" %>
        <%
            String name=request.getParameter("pname");
            try{
                    Connection con = null;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/login?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root", "");
                    try {
                        java.sql.Statement stmt=con.createStatement(); 
                        ResultSet rs=stmt.executeQuery("select * from product where name='"+name+"';");  
                        if(rs.next()){
                            out.println("Product Found<br>");
                            out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getInt(3));
                        }else{
                            out.println("Product not in Database");
                        }
                    }catch (Exception e) {
                        // TODO: handle exception
                        out.println(e);
                    }finally {
                        con.close();
                    }
            }catch(Exception e){
                        // TODO: handle exception
                        out.println(e);
            }
        %>
    </body>
</html>