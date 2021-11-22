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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
                margin-bottom: 10px;
                margin-top: 5px;
            }

            #head-link {
                height: 50px;
                line-height: 30px;
                border: 1px solid #CDCDCD;
                background-color: #F5F5F5;
                margin-bottom: 10px;
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
            .checkout:hover{
                color: #fff;
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
                        <li class='last' style="float: right;"><a href="login.jsp"><span>Logout</span></a></li>
                        <li class='last' style="float: right;"><a href="update_user.jsp?username=<%=username %>"><span><%= username %></span></a></li>			
                    </ul>
                </div>
            </div>
            <div id="content">


                <div class="shopping-cart">

                    <div class="column-labels">
                        <label class="product-image">Image</label> <label
                            class="product-details">Product</label> <label
                            class="product-price">Price</label> <label
                            class="product-quantity">Quantity</label><label
                            class="product-line-price">Total Price</label>
                    </div>
                    <%
                        BookItemDAOImpl bookDAO = new BookItemDAOImpl();
                        ElectronicsDAOImpl electDAO = new ElectronicsDAOImpl();  
                        ClothesDAOImpl clothesDAO = new ClothesDAOImpl();  
                        ShoesDAOImpl shoesDAO = new ShoesDAOImpl();
                        
                        NumberFormat nf = NumberFormat.getInstance();
                        nf.setMinimumIntegerDigits(0);
                        double total = 0;
                        ArrayList<Cart> cart=null;
                        if(session.getAttribute("cart")!=null){
                        cart = (ArrayList<Cart>) session.getAttribute("cart");}
                    %>
                    <%
                        if (cart != null) {
                            for (Cart c : cart) {
                                if(c.getMa_the_loai()==1){
                                    c.setPrice(bookDAO.getBook(c.getBookItem().getId()).getPrice());
                                    total += (c.getQuantity() * c.getPrice());

                    %>
                    <div class="product">
                        <div class="product-image">
                            <img
                                src="sanpham/<%=bookDAO.getBook(c.getBookItem().getId()).getImg()%>">
                        </div>
                        <div class="product-details">
                            <div class="product-title">
                                <%=bookDAO.getBook(c.getBookItem().getId()).getTitle()%>
                            </div>
                            <p class="product-description"></p>
                        </div>
                        <div class="product-price"><%=nf.format(bookDAO.getBook(c.getBookItem().getId()).getPrice())%>
                            VND
                        </div>
                        <div class="product-quantity cart_quantity_button">
                            <a class="cart_quantity_up" href="GioHangServlet?command=deleteCart&ma_san_pham=<%=c.getBookItem().getId()%>&ma_the_loai=<%=c.getMa_the_loai()%>"> - </a>
                            <input class="cart_quantity_input" type="number" value="<%=c.getQuantity()%>" disabled="disabled">
                            <a class="cart_quantity_up" href="GioHangServlet?command=addCart&ma_san_pham=<%=c.getBookItem().getId()%>&ma_the_loai=<%=c.getMa_the_loai()%>"> + </a>
                        </div>
                        <div class="product-line-price" style="text-align: right"><%=nf.format(bookDAO.getBook(c.getBookItem().getId()).getPrice()* c.getQuantity())%>
                            VND
                            <a href="GioHangServlet?command=removeCart&ma_san_pham=<%=c.getBookItem().getId()%>&ma_the_loai=<%=c.getMa_the_loai()%>"><img style="margin-left: 10px"src="images/delete.png"></a>
                        </div>
                    </div>                    
                    <%          }
                                if(c.getMa_the_loai()==2){
                                    c.setPrice(electDAO.getElect(c.getElectItem().getId()).getPrice());
                                    total += (c.getQuantity() *c.getPrice() );
                    %>         
                    <div class="product">
                        <div class="product-image">
                            <img
                                src="sanpham/<%=electDAO.getElect(c.getElectItem().getId()).getImg()%>">
                        </div>
                        <div class="product-details">
                            <div class="product-title">
                                <%=electDAO.getElect(c.getElectItem().getId()).getName()%>
                            </div>
                            <p class="product-description"></p>
                        </div>
                        <div class="product-price"><%=nf.format(electDAO.getElect(c.getElectItem().getId()).getPrice())%>
                            VND
                        </div>
                        <div class="product-quantity cart_quantity_button">
                            <a class="cart_quantity_up" href="GioHangServlet?command=deleteCart&ma_san_pham=<%=c.getElectItem().getId()%>&ma_the_loai=<%=c.getMa_the_loai()%>"> - </a>
                            <input class="cart_quantity_input" type="number" value="<%=c.getQuantity()%>" disabled="disabled">
                            <a class="cart_quantity_up" href="GioHangServlet?command=addCart&ma_san_pham=<%=c.getElectItem().getId()%>&ma_the_loai=<%=c.getMa_the_loai()%>"> + </a>
                        </div>
                        <div class="product-line-price" style="text-align: right"><%=nf.format(electDAO.getElect(c.getElectItem().getId()).getPrice()* c.getQuantity())%>
                            VND
                            <a href="GioHangServlet?command=removeCart&ma_san_pham=<%=c.getElectItem().getId()%>&ma_the_loai=<%=c.getMa_the_loai()%>"><img style="margin-left: 10px"src="images/delete.png"></a>
                        </div>
                    </div>                      
                    <%          }
                                if(c.getMa_the_loai()==3){
                                    c.setPrice(clothesDAO.getClothes(c.getClothesItem().getId()).getPrice());
                                    total += (c.getQuantity() * c.getPrice() );
                    %>
                    <div class="product">
                        <div class="product-image">
                            <img
                                src="sanpham/<%=clothesDAO.getClothes(c.getClothesItem().getId()).getImg()%>">
                        </div>
                        <div class="product-details">
                            <div class="product-title">
                                <%=clothesDAO.getClothes(c.getClothesItem().getId()).getName()%>
                            </div>
                            <p class="product-description"></p>
                        </div>
                        <div class="product-price"><%=nf.format(clothesDAO.getClothes(c.getClothesItem().getId()).getPrice())%>
                            VND
                        </div>
                        <div class="product-quantity cart_quantity_button">
                            <a class="cart_quantity_up" href="GioHangServlet?command=deleteCart&ma_san_pham=<%=c.getClothesItem().getId()%>&ma_the_loai=<%=c.getMa_the_loai()%>"> - </a>
                            <input class="cart_quantity_input" type="number" value="<%=c.getQuantity()%>" disabled="disabled">
                            <a class="cart_quantity_up" href="GioHangServlet?command=addCart&ma_san_pham=<%=c.getClothesItem().getId()%>&ma_the_loai=<%=c.getMa_the_loai()%>"> + </a>
                        </div>
                        <div class="product-line-price" style="text-align: right"><%=nf.format(clothesDAO.getClothes(c.getClothesItem().getId()).getPrice()* c.getQuantity())%>
                            VND
                            <a href="GioHangServlet?command=removeCart&ma_san_pham=<%=c.getClothesItem().getId()%>&ma_the_loai=<%=c.getMa_the_loai()%>"><img style="margin-left: 10px"src="images/delete.png"></a>
                        </div>
                    </div>                         
                    <%          }
                                if(c.getMa_the_loai()==4){
                                    c.setPrice(shoesDAO.getShoes(c.getShoesItem().getId()).getPrice());
                                    total += (c.getQuantity() *c.getPrice() );                                        
                    %>
                    <div class="product">
                        <div class="product-image">
                            <img
                                src="sanpham/<%=shoesDAO.getShoes(c.getShoesItem().getId()).getImg()%>">
                        </div>
                        <div class="product-details">
                            <div class="product-title">
                                <%=shoesDAO.getShoes(c.getShoesItem().getId()).getName()%>
                            </div>
                            <p class="product-description"></p>
                        </div>
                        <div class="product-price"><%=nf.format(shoesDAO.getShoes(c.getShoesItem().getId()).getPrice())%>
                            VND
                        </div>
                        <div class="product-quantity cart_quantity_button">
                            <a class="cart_quantity_up" href="GioHangServlet?command=deleteCart&ma_san_pham=<%=c.getShoesItem().getId()%>&ma_the_loai=<%=c.getMa_the_loai()%>"> - </a>
                            <input class="cart_quantity_input" type="number" value="<%=c.getQuantity()%>" disabled="disabled">
                            <a class="cart_quantity_up" href="GioHangServlet?command=addCart&ma_san_pham=<%=c.getShoesItem().getId()%>&ma_the_loai=<%=c.getMa_the_loai()%>"> + </a>
                        </div>
                        <div class="product-line-price" style="text-align: right"><%=nf.format(shoesDAO.getShoes(c.getShoesItem().getId()).getPrice()* c.getQuantity())%>
                            VND
                            <a href="GioHangServlet?command=removeCart&ma_san_pham=<%=c.getShoesItem().getId()%>&ma_the_loai=<%=c.getMa_the_loai()%>"><img style="margin-left: 10px"src="images/delete.png"></a>
                        </div>
                    </div>     
                    <%
                                }
                            }
                        }
                    %>
                    <form action="ConfirmServlet?username=<%=username%>" method="post">
                        <div class="d-flex col-12 mt-5 mb-5">
                            <div class="col-6">
                                <div class="d-flex align-items-center mb-5">
                                    <h4 class="m-0">Shipment</h4>
                                    <select class="ms-5 form-select" id="shipment" name="shipment">
                                        <option selected>Choose a carrier </option>
                                        <option value="Giao hang tiet kiem">Giao hang tiet kiem</option>
                                        <option value="Tiki ship">Tiki ship</option>
                                        <option value="Ahamove">Ahamove</option>
                                    </select>
                                </div>
                                <div class="d-flex align-items-start">
                                    <h4 class="mt-2 me-2">Payment</h4>
                                    <div class="ms-5" style="width: 100%">
                                        <ul class="nav nav-pills mb-3" id="pills-tab">
                                            <li class="nav-item">
                                                <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">COD</button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Credit card</button>
                                            </li>

                                        </ul>
                                        <div class="tab-content" id="pills-tabContent">
                                            <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                                                <div class="d-flex align-items-center">
                                                    <label for="basic-url" class="form-label me-4 col-4">Name</label>
                                                    <div class="input-group mb-3">
                                                        <input type="text" class="form-control" name="Name">
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center">
                                                    <label for="basic-url" class="form-label me-4 col-4">Phone number</label>
                                                    <div class="input-group mb-3">
                                                        <input type="text" class="form-control" name="PhoneNumber">
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center">
                                                    <label for="basic-url" class="form-label me-4 col-4">Address</label>
                                                    <div class="input-group mb-3">
                                                        <input type="text" class="form-control" name="Address">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                                                <div class="d-flex align-items-center">
                                                    <label for="basic-url" class="form-label me-4 col-4">Name</label>
                                                    <div class="input-group mb-3">
                                                        <input type="text" class="form-control" name="Name2">
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center">
                                                    <label for="basic-url" class="form-label me-4 col-4">Phone number</label>
                                                    <div class="input-group mb-3">
                                                        <input type="text" class="form-control" name="PhoneNumber2">
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center">
                                                    <label for="basic-url" class="form-label me-4 col-4">Address</label>
                                                    <div class="input-group mb-3">
                                                        <input type="text" class="form-control" name="Address2">
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center">
                                                    <label for="basic-url" class="form-label me-4 col-4">Card Number</label>
                                                    <div class="input-group mb-3">
                                                        <input type="text" class="form-control" name="CardNumber">
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center">
                                                    <label for="basic-url" class="form-label me-4 col-4">Exp date</label>
                                                    <div class="input-group mb-3">
                                                        <input type="text" class="form-control" name="ExpDate">
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center">
                                                    <label for="basic-url" class="form-label me-4 col-4">Card Code</label>
                                                    <div class="input-group mb-3">
                                                        <input type="text" class="form-control" name="CardCode">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-6" style="margin-top: 45px;">
                                <div class="totals">
                                    <div class="totals-item d-flex justify-content-center">
                                        <label>Total bill</label>
                                        <div class="totals-value" id="cart-subtotal"><%=nf.format(total)%>
                                            VND
                                        </div>
                                    </div>
                                </div>
                                <a class="checkout" href="history.jsp" style="text-decoration: none;">History</a>
                                <button type="submit" class="checkout" onclick="checkout()">Check Out</button>
                            </div>
                        </div>
                    </form>                    
                </div>

            </div>
            <div id="footer"><jsp:include page="footer.jsp"></jsp:include></div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script>
            function checkout() {
                alert("Đặt hàng thành công! Nhấn OK để trở về trang chủ.");
            }
        </script>
    </body>
</html>