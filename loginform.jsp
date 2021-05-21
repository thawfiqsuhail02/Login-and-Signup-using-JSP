<html>
    <head>
        <title>User validation</title>
    </head>
    <body>
        <%@ page import="java.sql.*" %>
        <%
            String name=request.getParameter("uname");
            String pd=request.getParameter("pwd");
            try{
                    Connection con = null;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/login?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root", "");
                    try {
                        java.sql.Statement stmt=con.createStatement(); 
                        ResultSet rs=stmt.executeQuery("select * from users");  
                        while(rs.next()){
                            if((name.equals(rs.getString(1))) && (pd.equals(rs.getString(2)))){
                                out.println("Login success");
                                break;
                            }else{
                                out.println("Invalid Credentials");
                            }
                        }
                    }catch (Exception e) {
                        // TODO: handle exception
                        out.println(e);
                    }finally {
                        con.close();
                    }
            }catch(Exception e){
                        // TODO: handle exception
            }
        %>
    </body>
</html>