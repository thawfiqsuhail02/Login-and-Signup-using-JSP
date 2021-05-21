<html>
    <head>
        <title>User validation</title>
    </head>
    <body>
        <%@ page import="java.sql.*" %>
        <%
            String name=request.getParameter("newname");
            String pd=request.getParameter("newpwd");
            try{
                    Connection con = null;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/login?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root", "");
                    try {
                        java.sql.Statement stmt=con.createStatement(); 
                        ResultSet rs=stmt.executeQuery("select * from users");  
                        int a=stmt.executeUpdate("insert into users values('"+name+"','"+pd+"')");
                        if(a==1){
                            out.println("Account Created!!");
                        }else{
                            out.println("Please try again.....");
                        }
                    } 
                    catch (Exception e) {
				        // TODO: handle exception
			        }
                    finally {
                        con.close();
                    }
            }catch(Exception e){
                // TODO: handle exception
            }
        %>
    </body>
</html>