<%@page import="model.Order"%>
<%@page import="dao.OrderDAOImpl"%>
<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="dao.BookItemDAOImpl"%>
<%@page import="dao.ElectronicsDAOImpl"%>
<%@page import="dao.ClothesDAOImpl"%>
<%@page import="dao.ShoesDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="dao.UserDAOImpl"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History</title>
        <link rel="stylesheet" href="css/cart.css" />
        <link rel="stylesheet" href="css/menu.css" />
        <link rel="stylesheet" href="css/main.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <style type="text/css">
            #main {
                width: 1060px;
                padding: 0;
                margin-left: auto;
                margin-right: auto;
            }
            #head {
                height: 200px;
                background-color: #F5F5F5;
                border: 1px solid #CDCDCD;
                margin-bottom: 5px;
                margin-top: 5px;
            }
            #head-link {
                height: 50px;
                line-height: 30px;
                border: 1px solid #CDCDCD;
                background-color: #F5F5F5;
                margin-bottom: 5px;
                clear: both;
            }
            #content {
                width: 1060px;
                min-height: 430px;
                border: 1px solid #CDCDCD;
                float: left;
                margin-bottom: 5px;
                clear: both;
            }
            #footer {
                height: 50px;
                clear: both;
                border: 1px solid #CDCDCD;
                background-color: #F8F8FF;
                margin-bottom: 5px;
            }
            .product .product-price{
                margin-top: 20px !important;
            }
        </style>
    </head>
    <body>
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
        %>
        <div id="main">
            <div id="head">
                <img src="images/banner-shop.jpg" width="1057px" height="200px" />
            </div>
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
            <div id="content">


                <div class="shopping-cart">

                    <div class="column-labels">
                        <label class="product-image">Image</label> 
                        <label class="product-details">Product</label> 
                        <label class="product-price">Information</label> 
                        <label class="product-quantity">Quantity</label>
                        <label class="product-line-price">Total Price</label>
                    </div>
                    <%
                        BookItemDAOImpl bookDAO = new BookItemDAOImpl();
                        ElectronicsDAOImpl electDAO = new ElectronicsDAOImpl();  
                        ClothesDAOImpl clothesDAO = new ClothesDAOImpl();  
                        ShoesDAOImpl shoesDAO = new ShoesDAOImpl();
                        OrderDAOImpl historyDAO = new OrderDAOImpl();
                        UserDAOImpl userDAO = new UserDAOImpl();
                        User u= userDAO.getUser(username);

                        List<Order> L= historyDAO.getList(u.getUser_id());
                        NumberFormat nf = NumberFormat.getInstance();
                        nf.setMinimumIntegerDigits(0);

                    %>
                    <%
                        if (L != null) {
                            for (Order h : L) {
                                if(h.getMa_the_loai()==1){
                    %>
                    <div class="product">
                        <div class="product-image">
                            <img
                                src="sanpham/<%=bookDAO.getBook(h.getMa_san_pham()).getImg()%>">
                        </div>
                        <div class="product-details">
                            <div class="product-title">
                                <%=bookDAO.getBook(h.getMa_san_pham()).getTitle()%>
                            </div>
                            <p class="product-description"></p>
                        </div>
                        <div class="product-price">
                            <%=h.getNgay_mua()%>
                            Name: <%=h.getHo_ten()%>
                            Number: <%=h.getSdt()%>
                            Address: <%=h.getDia_chi()%>
                            Shipment: <%=h.getShipment()%>
                        </div>
                        <div class="product-quantity cart_quantity_button">
                            <%=h.getSo_luong() %>
                        </div>
                        <div class="product-line-price" style="text-align: right"><%=nf.format(h.getSo_luong()*bookDAO.getBook(h.getMa_san_pham()).getPrice())%>
                            VND	
                        </div>
                    </div>
                    <%          }
                                if(h.getMa_the_loai()==2){
                    %>
                    <div class="product">
                        <div class="product-image">
                            <img
                                src="sanpham/<%=electDAO.getElect(h.getMa_san_pham()).getImg()%>">
                        </div>
                        <div class="product-details">
                            <div class="product-title">
                                <%=electDAO.getElect(h.getMa_san_pham()).getName()%>
                            </div>
                            <p class="product-description"></p>
                        </div>
                        <div class="product-price">
                            <%=h.getNgay_mua()%>
                            Name: <%=h.getHo_ten()%>
                            Number: <%=h.getSdt()%>
                            Address: <%=h.getDia_chi()%>
                            Shipment: <%=h.getShipment()%>
                        </div>
                        <div class="product-quantity cart_quantity_button">
                            <%=h.getSo_luong() %>
                        </div>
                        <div class="product-line-price" style="text-align: right"><%=nf.format(h.getSo_luong()*electDAO.getElect(h.getMa_san_pham()).getPrice())%>
                            VND	
                        </div>
                    </div>
                    <%          }
                                if(h.getMa_the_loai()==3){
                    %>
                    <div class="product">
                        <div class="product-image">
                            <img
                                src="sanpham/<%=clothesDAO.getClothes(h.getMa_san_pham()).getImg()%>">
                        </div>
                        <div class="product-details">
                            <div class="product-title">
                                <%=clothesDAO.getClothes(h.getMa_san_pham()).getName()%>
                            </div>
                            <p class="product-description"></p>
                        </div>
                        <div class="product-price">
                            <%=h.getNgay_mua()%>
                            Name: <%=h.getHo_ten()%>
                            Number: <%=h.getSdt()%>
                            Address: <%=h.getDia_chi()%>
                            Shipment: <%=h.getShipment()%>
                        </div>
                        <div class="product-quantity cart_quantity_button">
                            <%=h.getSo_luong() %>
                        </div>
                        <div class="product-line-price" style="text-align: right"><%=nf.format(h.getSo_luong()*clothesDAO.getClothes(h.getMa_san_pham()).getPrice())%>
                            VND	
                        </div>
                    </div>
                    <%          }
                                if(h.getMa_the_loai()==4){
                    %>
                    <div class="product">
                        <div class="product-image">
                            <img
                                src="sanpham/<%=shoesDAO.getShoes(h.getMa_san_pham()).getImg()%>">
                        </div>
                        <div class="product-details">
                            <div class="product-title">
                                <%=shoesDAO.getShoes(h.getMa_san_pham()).getName()%>
                            </div>
                            <p class="product-description"></p>
                        </div>
                        <div class="product-price">
                            <%=h.getNgay_mua()%>
                            Name: <%=h.getHo_ten()%>
                            Number: <%=h.getSdt()%>
                            Address: <%=h.getDia_chi()%>
                            Shipment: <%=h.getShipment()%>>
                        </div>
                        <div class="product-quantity cart_quantity_button">
                            <%=h.getSo_luong() %>
                        </div>
                        <div class="product-line-price" style="text-align: right"><%=nf.format(h.getSo_luong()*shoesDAO.getShoes(h.getMa_san_pham()).getPrice())%>
                            VND	
                        </div>
                    </div>
                    <%
                                }   
                            }   
                        }
                    %>


                </div>

            </div>
            <div id="footer"><jsp:include page="footer.jsp"></jsp:include></div>
        </div>
    </body>
</html>