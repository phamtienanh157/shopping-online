<%@page import="java.util.ArrayList"%>
<%@page import="model.book.BookItem"%>
<%@page import="model.electronics.ElectronicsItem"%>
<%@page import="model.clothes.ClothesItem"%>
<%@page import="model.shoes.ShoesItem"%>
<%@page import="java.util.List"%>
<%@page import="dao.BookItemDAOImpl"%>
<%@page import="dao.ElectronicsDAOImpl"%>
<%@page import="dao.ClothesDAOImpl"%>
<%@page import="dao.ShoesDAOImpl"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/menu.css" />
        <link rel="stylesheet" href="css/product.css" />
    </head>
    <body>

        <div id="main">
            <div id="head">
                <img src="images/banner-shop.jpg" width="1100" height="230" alt="banner"/>
            </div>

            <%
                    String username = null;
                            Cookie[] cookies = request.getCookies();
                            if(cookies !=null)
                            {
                            for(Cookie cookie : cookies)
                            {
                                if(cookie.getName().equals("username")) 
                                    username = cookie.getValue();
                            }
                            }
				
                    if (username != null) {
            %>
            <div id="head-link">
                <div id='menungang'>
                    <ul>
                        <li class='last'><a href="index.jsp"><span>Home</span></a></li>
                        <li class='last'><a href="cart.jsp"><span>Cart</span></a></li>
                        <li class='last'><a href="search_page.jsp"><span>Search</span></a></li>
                        <li class='last'><a href="history.jsp"><span>History</span></a></li>
                        <li class='last' style="float: right;"><a href="LogoutServlet"><span>Logout</span></a></li>
                        <li class='last' style="float: right;"><a href="update_user.jsp?username=<%=username %>"><span><%=username%></span></a></li>
                    </ul>
                </div>
            </div>
            <%
                    } else {
            %>
            <div id="head-link">
                <div id='menungang'>
                    <ul>
                        <li class='last'><a href="index.jsp"><span>Home</span></a></li>
                        <li class='last'><a href="search_page.jsp"><span>Search</span></a></li>
                        <li class='last' style="float: right;"><a href="register.jsp"><span>Register</span></a></li>
                        <li class='last' style="float: right;"><a href="login.jsp"><span>Login</span></a></li>
                    </ul>
                </div>
            </div>
            <%
                    }
            %>
            <div id="content">
                <div id="left"><jsp:include page="search_menu.jsp"></jsp:include></div>
                    <div id="right">
                    <%
				
                        BookItemDAOImpl bookDAO = new BookItemDAOImpl();
                        ElectronicsDAOImpl electDAO = new ElectronicsDAOImpl();  
                        ClothesDAOImpl clothesDAO = new ClothesDAOImpl();  
                        ShoesDAOImpl shoesDAO = new ShoesDAOImpl();
                        
                        List<BookItem> listBook = new ArrayList<BookItem>();
                        List<ElectronicsItem> listElect = new ArrayList<ElectronicsItem>();
                        List<ClothesItem> listClothes = new ArrayList<ClothesItem>();
                        List<ShoesItem> listShoes = new ArrayList<ShoesItem>();
                        
                        listBook = bookDAO.findAll();
                        listElect = electDAO.findAll();
                        listClothes = clothesDAO.findAll();
                        listShoes = shoesDAO.findAll();
                        String ten_san_pham = "";
                        if (request.getParameter("ten_san_pham")!= null) {
                            ten_san_pham = request.getParameter("ten_san_pham");
                        }
                                NumberFormat nf = NumberFormat.getInstance();
                                nf.setMinimumFractionDigits(0);
                    %>
                    <% String err = "";
                    if (request.getAttribute("err") != null) {
                            err = (String) request.getAttribute("err");%>
                    <h3><%=err %></h3>
                    <% } %>

                    <div id="site-wrapper" style="float: left">
                        <ul class="products homepage">

                            <%
                                if (ten_san_pham != null) {
                                    for (BookItem p :listBook) {
                                        if(p.getTitle().toLowerCase().indexOf(ten_san_pham.toLowerCase())!=-1){
                            %>

                            <li class="preorder"><span class="tagimg"> </span> 
                                <a href="detail.jsp?ma_the_loai=<%=p.getTypeId()%>&ma_san_pham=<%=p.getId()%>"> 
                                    <img src="sanpham/<%=p.getImg()%>" width=" 250px" height="250px" />
                                    <h3><%=p.getTitle()%></h3>
                                    <h4>
                                        Price:
                                        <%=nf.format(p.getPrice())%>
                                        VND
                                    </h4> 
                                    <p class="info">
                                        <span>Author: <%=p.getAuthor()%>
                                        </span> <span>Price: <%=nf.format(p.getPrice())%> VND
                                        </span> <span>Summary: <%=p.getSummary()%>
                                    </p>
                                </a></li>

                            <%
                                        }
                                    }   
                                    for (ElectronicsItem p :listElect) {
                                        if(p.getName().toLowerCase().indexOf(ten_san_pham.toLowerCase())!=-1){
                            %>

                            <li class="preorder"><span class="tagimg"> </span> 
                                <a href="detail.jsp?ma_the_loai=<%=p.getTypeId()%>&ma_san_pham=<%=p.getId()%>"> 
                                    <img src="sanpham/<%=p.getImg()%>" width=" 250px" height="250px" />
                                    <h3><%=p.getName()%></h3>
                                    <h4>
                                        Price:
                                        <%=nf.format(p.getPrice())%>
                                        VND
                                    </h4> 
                                    <p class="info">
                                        <span>Brand: <%=p.getBrand()%>
                                        </span> <span>Price: <%=nf.format(p.getPrice())%> VND
                                        </span> <span>Summary: <%=p.getSummary()%>
                                    </p>
                                </a></li>

                            <%
                                        } 
                                    }
                                    for (ClothesItem p :listClothes) {
                                        if(p.getName().toLowerCase().indexOf(ten_san_pham.toLowerCase())!=-1){
                            %>

                            <li class="preorder"><span class="tagimg"> </span>
                                <a href="detail.jsp?ma_the_loai=<%=p.getTypeId()%>&ma_san_pham=<%=p.getId()%>"> 
                                    <img src="sanpham/<%=p.getImg()%>" width=" 250px" height="250px" />
                                    <h3><%=p.getName()%></h3>
                                    <h4>
                                        Price:
                                        <%=nf.format(p.getPrice())%>
                                        VND
                                    </h4> 
                                    <p class="info">
                                        <span>Brand: <%=p.getBranch()%>
                                        </span> <span>Price: <%=nf.format(p.getPrice())%> VND
                                        </span> <span>Summary: <%=p.getSummary()%>
                                    </p>
                                </a></li>

                            <%  
                                        }
                                    } 
                                    for (ShoesItem p :listShoes) {
                                        if(p.getName().toLowerCase().indexOf(ten_san_pham.toLowerCase())!=-1){
                            %>
                                                      
                            <li class="preorder"><span class="tagimg"> </span> 
                                <a href="detail.jsp?ma_the_loai=<%=p.getTypeId()%>&ma_san_pham=<%=p.getId()%>"> 
                                    <img src="sanpham/<%=p.getImg()%>" width=" 250px" height="250px" />
                                    <h3><%=p.getName()%></h3>
                                    <h4>
                                        Price:
                                        <%=nf.format(p.getPrice())%>
                                        VND
                                    </h4>
                                    <p class="info">
                                        <span>Size: <%=p.getSize()%>
                                        </span> <span>Price: <%=nf.format(p.getPrice())%> VND
                                        </span> <span>Summary: <%=p.getSummary()%>
                                    </p>
                                </a></li>

                            <%
                                        }  
                                    }

                                } else {%>
                            <h3> Enter search information </h3>
                            <%}
                            %>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="footer"><jsp:include page="footer.jsp"></jsp:include></div>
        </div>

    </body>
</html>