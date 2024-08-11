<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <jsp:include page="adminnavbar.jsp" />
    <style>
    
    p{
    color:#06D001
    }
    </style>
    
</head>
<body>

<div class="container mt-4">
    <div align="center">
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>User Name</th>
                    <th>Password</th>
                    <th>Date & Time</th>
                    <th>Validity</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    java.sql.Connection conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/cap", "root", "admin");
                    java.sql.PreparedStatement ps = conn.prepareStatement("SELECT * FROM login");
                    java.sql.ResultSet rs = ps.executeQuery();
                    
                    while (rs.next()) { %>                   
                        <tr>
                            <td><%= rs.getString("username") %></td>
                            <td><%= rs.getString("password") %></td>
                            <td><%= rs.getString("datetime") %></td>
                            <td><%= rs.getString("validity").equals("true")?"<p>Valid Login</p>":"<h7>In-Valid Login</h7>" %></td>
                            <td><a href="deletelog.jsp?datetime=<%= rs.getString("datetime") %>" class="btn btn-danger btn-sm">Delete</a></td>
                        </tr>
                    <% }
                    rs.close();
                    ps.close();
                    conn.close();
                } catch (Exception e) {
                    out.println("Exception occurred: " + e.getMessage());
                    e.printStackTrace();
                } %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>