<%@page import="dao.BookItemDAOImpl"%>
<%@page import="dao.ElectronicsDAOImpl"%>
<%@page import="dao.ClothesDAOImpl"%>
<%@page import="dao.ShoesDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="java.text.NumberFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="css/detail.css" />
        <link rel="stylesheet" href="css/menu.css" />
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
            .quantity{
                padding: 5px 10px;
                margin-top: 20px;
            }
            .bottom{
                margin-bottom: 20px;
                cursor: pointer;
            }
            .add-cart{
                margin-bottom: 5px;
            }
        </style>
    </head>
    <body>

        <%
                // ham nay de lay ma san pham truyen qua tren thanh dia chj
                String ma_the_loai = "";                
                String ma_san_pham = "";
                if (request.getParameter("ma_the_loai") != null && request.getParameter("ma_san_pham") != null) {
                    ma_the_loai = request.getParameter("ma_the_loai");
                    ma_san_pham = request.getParameter("ma_san_pham");
                }
                BookItemDAOImpl bookDAO = new BookItemDAOImpl();
                ElectronicsDAOImpl electDAO = new ElectronicsDAOImpl();  
                ClothesDAOImpl clothesDAO = new ClothesDAOImpl();  
                ShoesDAOImpl shoesDAO = new ShoesDAOImpl();
                NumberFormat nf = NumberFormat.getInstance();
                nf.setMinimumFractionDigits(0);
        %>
        <div id="main">
            <div id="head">
                <img src="images/banner-shop.jpg" width="1057px" height="200px" />
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
                        <li class='last' style="float: right;"><a href="LogoutServlet"><span>Logout</span></a></li>
                        <li class='last' style="float: right;"><a href="update_user.jsp?username=<%=username %>"><span><%=username %></span></a></li>

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
                    if(Integer.parseInt(ma_the_loai)==1){
            %> 
            <div id="content">

                <div class="left-1">
                    <img
                        src="sanpham/<%=bookDAO.getBook(Integer.parseInt(ma_san_pham)).getImg()%>"
                        width="200px" height="200px" />
                </div>
                <div class="left-2">
                    <table>
                        <tr class="row1">
                            <td class="col2" colspan="2"
                                style="padding: 10px; color: blue; font-size: 15px; text-transform: uppercase; text-align: center; font-weight: bold"><%=bookDAO.getBook(Integer.parseInt(ma_san_pham)).getTitle()%></td>
                        </tr>
                        <tr class="row2">
                            <td class="col1">Số trang:</td>
                            <td class="col2"><%=bookDAO.getBook(Integer.parseInt(ma_san_pham)).getPages()%></td>
                        </tr>
                        <tr class="row2">
                            <td class="col1">Ngôn ngữ:</td>
                            <td class="col2"><%=bookDAO.getBook(Integer.parseInt(ma_san_pham)).getLanguage()%></td>
                        </tr>
                        <tr class="row2">
                            <td class="col1">Tác giả:</td>
                            <td class="col2"><%=bookDAO.getBook(Integer.parseInt(ma_san_pham)).getAuthor()%></td>
                        </tr>
                        <tr class="row2">
                            <td class="col1">Nhà xuất bản:</td>
                            <td class="col2"><%=bookDAO.getBook(Integer.parseInt(ma_san_pham)).getPublisher()%></td>
                        </tr>                        

                        <tr class="row2">
                            <td class="col1">Price:</td>
                            <td class="col2"><%=nf.format(bookDAO.getBook(Integer.parseInt(ma_san_pham)).getPrice()) %> VND</td>
                        </tr>

                    </table>
                </div>
            <%
                    }
                    if(Integer.parseInt(ma_the_loai)==2){
            %>
            <div id="content">

                <div class="left-1">
                    <img
                        src="sanpham/<%=electDAO.getElect(Integer.parseInt(ma_san_pham)).getImg()%>"
                        width="200px" height="200px" />
                </div>
                <div class="left-2">
                    <table>
                        <tr class="row1">
                            <td class="col2" colspan="2"
                                style="padding: 10px; color: blue; font-size: 15px; text-transform: uppercase; text-align: center; font-weight: bold"><%=electDAO.getElect(Integer.parseInt(ma_san_pham)).getName()%></td>
                        </tr>
                        <tr class="row2">
                            <td class="col1">Brand:</td>
                            <td class="col2"><%=electDAO.getElect(Integer.parseInt(ma_san_pham)).getBrand()%></td>
                        </tr>
                        <tr class="row2">
                            <td class="col1">Model:</td>
                            <td class="col2"><%=electDAO.getElect(Integer.parseInt(ma_san_pham)).getModel()%></td>
                        </tr>                   

                        <tr class="row2">
                            <td class="col1">Price:</td>
                            <td class="col2"><%=nf.format(electDAO.getElect(Integer.parseInt(ma_san_pham)).getPrice()) %> VND</td>
                        </tr>

                    </table>
                </div>
            <%
                    }
                    if(Integer.parseInt(ma_the_loai)==3){
            %>
            <div id="content">

                <div class="left-1">
                    <img
                        src="sanpham/<%=clothesDAO.getClothes(Integer.parseInt(ma_san_pham)).getImg()%>"
                        width="200px" height="200px" />
                </div>
                <div class="left-2">
                    <table>
                        <tr class="row1">
                            <td class="col2" colspan="2"
                                style="padding: 10px; color: blue; font-size: 15px; text-transform: uppercase; text-align: center; font-weight: bold"><%=clothesDAO.getClothes(Integer.parseInt(ma_san_pham)).getName()%></td>
                        </tr>
                        <tr class="row2">
                            <td class="col1">Brand:</td>
                            <td class="col2"><%=clothesDAO.getClothes(Integer.parseInt(ma_san_pham)).getBranch()%></td>
                        </tr>
                        <tr class="row2">
                            <td class="col1">Size:</td>
                            <td class="col2"><%=clothesDAO.getClothes(Integer.parseInt(ma_san_pham)).getSize()%></td>
                        </tr>
                        <tr class="row2">
                            <td class="col1">Color:</td>
                            <td class="col2"><%=clothesDAO.getClothes(Integer.parseInt(ma_san_pham)).getColor()%></td>
                        </tr>                     

                        <tr class="row2">
                            <td class="col1">Price:</td>
                            <td class="col2"><%=nf.format(clothesDAO.getClothes(Integer.parseInt(ma_san_pham)).getPrice()) %> VND</td>
                        </tr>

                    </table>
                </div>
            <%
                    }
                    if(Integer.parseInt(ma_the_loai)==4){
            %>
            <div id="content">

                <div class="left-1">
                    <img
                        src="sanpham/<%=shoesDAO.getShoes(Integer.parseInt(ma_san_pham)).getImg()%>"
                        width="200px" height="200px" />
                </div>
                <div class="left-2">
                    <table>
                        <tr class="row1">
                            <td class="col2" colspan="2"
                                style="padding: 10px; color: blue; font-size: 15px; text-transform: uppercase; text-align: center; font-weight: bold"><%=shoesDAO.getShoes(Integer.parseInt(ma_san_pham)).getName()%></td>
                        </tr>
                        <tr class="row2">
                            <td class="col1">Size:</td>
                            <td class="col2"><%=shoesDAO.getShoes(Integer.parseInt(ma_san_pham)).getSize()%></td>
                        </tr>
                        <tr class="row2">
                            <td class="col1">Color:</td>
                            <td class="col2"><%=shoesDAO.getShoes(Integer.parseInt(ma_san_pham)).getColor()%></td>
                        </tr>  
                        <tr class="row2">
                            <td class="col1">Material:</td>
                            <td class="col2"><%=shoesDAO.getShoes(Integer.parseInt(ma_san_pham)).getMaterial()%></td>
                        </tr>
                   

                        <tr class="row2">
                            <td class="col1">Price:</td>
                            <td class="col2"><%=nf.format(shoesDAO.getShoes(Integer.parseInt(ma_san_pham)).getPrice()) %> VND</td>
                        </tr>

                    </table>
                </div>
            <%
                    }
            %>            
                <% if(username != null) { %>
                <div
                    style="margin-left: auto; margin-right: auto; text-align: center; margin-top: 10px; padding: 10px; clear: both;">
                    <a
                        href="#"><img
                            src="images/giohang.png" /></a>
                    <form action="GioHangServlet" method="post">
                        <input type="number" min="1" value="1" name="soluong" class="quantity"/>
                        <input type="hidden" value="setCart" name="command"/>
                        <input type="hidden" value="<%=ma_san_pham %>" name="ma_san_pham"/>
                        <input type="hidden" value="<%=ma_the_loai %>" name="ma_the_loai"/>
                        <input class="btn btn-primary add-cart" type="submit" value="Add to cart">
                    </form>	
                </div>
                <%} else { %>
                <div
                    style="margin-left: auto; margin-right: auto; text-align: center; margin-top: 10px; padding: 10px; clear: both;">
                    <a
                        href="login.jsp"><img
                            src="images/giohang.png" /></a>
                </div>
                <%} %>
                <div class="left-3 bottom">
                    <article> <input type="checkbox" id="read_more"
                                     role="button"> <label for="read_more" onclick=""
                                     style="width: 770px; margin-left: 150px; margin-right: auto;"><span>View details</span> <span>Đóng</span></label> <section>
                            <%  if(Integer.parseInt(ma_the_loai)==1){%>    
                            <table>
                                <tr rowspan="2">
                                    <td class="detail-1">Information details</td>
                                    <td class="detail-5"><%=bookDAO.getBook(Integer.parseInt(ma_san_pham)).getSummary()%></td>
                                </tr>
                            </table>
                            <%  } 

                                if(Integer.parseInt(ma_the_loai)==2){%>    
                            <table>
                                <tr rowspan="2">
                                    <td class="detail-1">Information details</td>
                                    <td class="detail-5"><%=electDAO.getElect(Integer.parseInt(ma_san_pham)).getSummary()%></td>
                                </tr>
                            </table>
                            <%  }   

                                if(Integer.parseInt(ma_the_loai)==3){%>    
                            <table>
                                <tr rowspan="2">
                                    <td class="detail-1">Information details</td>
                                    <td class="detail-5"><%=clothesDAO.getClothes(Integer.parseInt(ma_san_pham)).getSummary()%></td>
                                </tr>
                            </table>
                            <%    
                                }
                                if(Integer.parseInt(ma_the_loai)==4){%>    
                            <table>
                                <tr rowspan="2">
                                    <td class="detail-1">Information details</td>
                                    <td class="detail-5"><%=shoesDAO.getShoes(Integer.parseInt(ma_san_pham)).getSummary()%></td>
                                </tr>
                            </table>
                            <%  }%>                                
                        </section> </article>
                </div>

            </div>
            <div id="footer"><jsp:include page="footer.jsp"></jsp:include></div>
        </div>
    </body>
</html>
