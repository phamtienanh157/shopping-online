<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoryDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <link rel="stylesheet" href="css/category.css" />
        
    </head>
    <body>
        <%
                CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
                List<Category> list = new ArrayList<Category>();
                list = categoryDAO.getList();
                String err="";
        %>
        <div class="container">
            <nav>
                <ul class="mcd-menu">
                    <li>
                        <form accept-charset="utf-8" method="post" action="SearchServlet" name="SearchServlet" class="form-search">
                            <div style="margin-top: 10px">
                                <label for="tensp" style="font-size: 16px;">Name Product</label>
                                <br>
                                <input accept-charset="utf-8" type="text"  name="ten_san_pham" style="width:97%;padding: 6px 0 6px 6px; margin-top: 10px">
                            </div>
                            <input type="submit" value="Search" name="timKiem" style="padding: 5px 10px; margin-top: 20px">
                        </form>
                    </li>
                    <li style="color: red"><%=err%></li>
                </ul>
            </nav>
        </div>
    </body>
</html>