package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;
import model.book.BookItem;
import model.clothes.ClothesItem;
import model.electronics.ElectronicsItem;
import model.shoes.ShoesItem;

/**
 * Servlet implementation class GioHangServlet
 */
public class GioHangServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private List<Cart> cart = new ArrayList<Cart>();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public GioHangServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        String ma_san_pham = request.getParameter("ma_san_pham");
        String ma_the_loai = request.getParameter("ma_the_loai");
        if (command.equals("addCart")) {
            if(Integer.parseInt(ma_the_loai)==1){
                BookItem p = new BookItem(Integer.parseInt(ma_san_pham),Integer.parseInt(ma_the_loai), "", "", "", "", "", "", "", 0.0);
                addToCart(p);
            }
            if(Integer.parseInt(ma_the_loai)==2){
                ElectronicsItem p = new ElectronicsItem(Integer.parseInt(ma_san_pham),Integer.parseInt(ma_the_loai), "", "", "", "", "", 0.0);                
                addToCart(p);
            }
            if(Integer.parseInt(ma_the_loai)==3){
                ClothesItem p = new ClothesItem(Integer.parseInt(ma_san_pham),Integer.parseInt(ma_the_loai), "", "", "", "", "", "", 0.0);               
                addToCart(p);
            }
            if(Integer.parseInt(ma_the_loai)==4){
                ShoesItem p = new ShoesItem(Integer.parseInt(ma_san_pham),Integer.parseInt(ma_the_loai), "", "", 0, "", "", "", 0.0);                
                addToCart(p);
            }            

            // sau khi them vao gio hang ta se chuyen toi trang gio hang
            // can tao session de luu tru gia tri
            HttpSession session = request.getSession();

            // ta test xem gio hang co them duoc ko?
            System.out.println(cart.size());
            session.setAttribute("cart", cart);
            response.sendRedirect("/cart.jsp");
        } else {
            if (command.equals("deleteCart")) {
                if(Integer.parseInt(ma_the_loai)==1){
                    BookItem p = new BookItem(Integer.parseInt(ma_san_pham),Integer.parseInt(ma_the_loai), "", "", "", "", "", "", "", 0.0);
                    deleteFromCart(p);
                }
                if(Integer.parseInt(ma_the_loai)==2){
                    ElectronicsItem p = new ElectronicsItem(Integer.parseInt(ma_san_pham),Integer.parseInt(ma_the_loai), "", "", "", "", "", 0.0);                
                    deleteFromCart(p);
                }
                if(Integer.parseInt(ma_the_loai)==3){
                    ClothesItem p = new ClothesItem(Integer.parseInt(ma_san_pham),Integer.parseInt(ma_the_loai), "", "", "", "", "", "", 0.0);               
                    deleteFromCart(p);
                }
                if(Integer.parseInt(ma_the_loai)==4){
                    ShoesItem p = new ShoesItem(Integer.parseInt(ma_san_pham),Integer.parseInt(ma_the_loai), "", "", 0, "", "", "", 0.0);                
                    deleteFromCart(p);
                } 
                HttpSession session = request.getSession();

                // ta test xem gio hang co them duoc ko?
                System.out.println(cart.size());
                session.setAttribute("cart", cart);
                response.sendRedirect("/cart.jsp");
            } else {
                if (command.equals("removeCart")) {
                    if(Integer.parseInt(ma_the_loai)==1){
                        BookItem p = new BookItem(Integer.parseInt(ma_san_pham),Integer.parseInt(ma_the_loai), "", "", "", "", "", "", "", 0.0);
                        removeFromCart(p);
                    }
                    if(Integer.parseInt(ma_the_loai)==2){
                        ElectronicsItem p = new ElectronicsItem(Integer.parseInt(ma_san_pham),Integer.parseInt(ma_the_loai), "", "", "", "", "", 0.0);                
                        removeFromCart(p);
                    }
                    if(Integer.parseInt(ma_the_loai)==3){
                        ClothesItem p = new ClothesItem(Integer.parseInt(ma_san_pham),Integer.parseInt(ma_the_loai), "", "", "", "", "", "", 0.0);               
                        removeFromCart(p);
                    }
                    if(Integer.parseInt(ma_the_loai)==4){
                        ShoesItem p = new ShoesItem(Integer.parseInt(ma_san_pham),Integer.parseInt(ma_the_loai), "", "", 0, "", "", "", 0.0);                
                        removeFromCart(p);
                    }                     

                    HttpSession session = request.getSession();

                    //lưu vào session
                    session.setAttribute("cart", cart);
                    response.sendRedirect("/cart.jsp");
                } else {
                    if (command.equals("setCart")) {
                        if(Integer.parseInt(ma_the_loai)==1){
                            BookItem p = new BookItem(Integer.parseInt(ma_san_pham),Integer.parseInt(ma_the_loai), "", "", "", "", "", "", "", 0.0);
                            setCart(p, Integer.parseInt((String) request.getParameter("soluong")));
                        }
                        if(Integer.parseInt(ma_the_loai)==2){
                            ElectronicsItem p = new ElectronicsItem(Integer.parseInt(ma_san_pham),Integer.parseInt(ma_the_loai), "", "", "", "", "", 0.0);                
                            setCart(p, Integer.parseInt((String) request.getParameter("soluong")));
                        }
                        if(Integer.parseInt(ma_the_loai)==3){
                            ClothesItem p = new ClothesItem(Integer.parseInt(ma_san_pham),Integer.parseInt(ma_the_loai), "", "", "", "", "", "", 0.0);               
                            setCart(p, Integer.parseInt((String) request.getParameter("soluong")));
                        }
                        if(Integer.parseInt(ma_the_loai)==4){
                            ShoesItem p = new ShoesItem(Integer.parseInt(ma_san_pham),Integer.parseInt(ma_the_loai), "", "", 0, "", "", "", 0.0);                
                            setCart(p, Integer.parseInt((String) request.getParameter("soluong")));
                        }                                
                        HttpSession session = request.getSession();

                        session.setAttribute("cart", cart);
                        response.sendRedirect("/cart.jsp");
                    }
                }
            }
        }
    }

    private String removeFromCart(BookItem p) {
        for (Cart item : cart) {
            if (item.getBookItem().getId() == p.getId()) {
                cart.remove(item);
                return "cart";
            }
        }
        return "cart";
    }
    private String removeFromCart(ElectronicsItem p) {
        for (Cart item : cart) {
            if (item.getElectItem().getId() == p.getId()) {
                cart.remove(item);
                return "cart";
            }
        }
        return "cart";
    }
    private String removeFromCart(ClothesItem p) {
        for (Cart item : cart) {
            if (item.getClothesItem().getId() == p.getId()) {
                cart.remove(item);
                return "cart";
            }
        }
        return "cart";
    }
    private String removeFromCart(ShoesItem p) {
        for (Cart item : cart) {
            if (item.getShoesItem().getId() == p.getId()) {
                cart.remove(item);
                return "cart";
            }
        }
        return "cart";
    }
    
    
    private String setCart(BookItem p, int s) {
        for (Cart item : cart) {
            if (item.getBookItem().getId() == p.getId()) {
                item.setQuantity(s);
                return "cart";
            }
        }
        Cart c = new Cart(p,s);
        cart.add(c);
        return "cart";
    }
    private String setCart(ElectronicsItem p, int s) {
        for (Cart item : cart) {
            if (item.getElectItem().getId() == p.getId()) {
                item.setQuantity(s);
                return "cart";
            }
        }
        Cart c = new Cart(p,s);
        cart.add(c);
        return "cart";
    }
    private String setCart(ClothesItem p, int s) {
        for (Cart item : cart) {
            if (item.getClothesItem().getId() == p.getId()) {
                item.setQuantity(s);
                return "cart";
            }
        }
        Cart c = new Cart(p,s);
        cart.add(c);
        return "cart";
    }
    private String setCart(ShoesItem p, int s) {
        for (Cart item : cart) {
            if (item.getShoesItem().getId() == p.getId()) {
                item.setQuantity(s);
                return "cart";
            }
        }
        Cart c = new Cart(p,s);
        cart.add(c);
        return "cart";
    }
    
    
    // phuongw thuc them san pham moi vao trong gio hang
    public String addToCart(BookItem p) {
        for (Cart item : cart) {
            if (item.getBookItem().getId() == p.getId() ) {
                item.setQuantity(item.getQuantity() + 1);
                return "cart";
            }
        }
        Cart c = new Cart(p,1);
        cart.add(c);
        return "cart";
    }
    public String addToCart(ElectronicsItem p) {
        for (Cart item : cart) {
            if (item.getElectItem().getId() == p.getId() ) {
                item.setQuantity(item.getQuantity() + 1);
                return "cart";
            }
        }
        Cart c = new Cart(p,1);
        cart.add(c);
        return "cart";
    }
    public String addToCart(ClothesItem p) {
        for (Cart item : cart) {
            if (item.getClothesItem().getId() == p.getId() ) {
                item.setQuantity(item.getQuantity() + 1);
                return "cart";
            }
        }
        Cart c = new Cart(p,1);
        cart.add(c);
        return "cart";
    }    
    public String addToCart(ShoesItem p) {
        for (Cart item : cart) {
            if (item.getShoesItem().getId() == p.getId() ) {
                item.setQuantity(item.getQuantity() + 1);
                return "cart";
            }
        }
        Cart c = new Cart(p,1);
        cart.add(c);
        return "cart";
    }        
    
    
    // phuongw thuc giam bot 1 san pham khoi trong gio hang
    public String deleteFromCart(BookItem p) {
        for (Cart item : cart) {
            if (item.getBookItem().getId() == p.getId() && item.getQuantity() > 1) {
                item.setQuantity(item.getQuantity() - 1);
                return "cart";
            }
        }
        return "cart";
    }
    public String deleteFromCart(ElectronicsItem p) {
        for (Cart item : cart) {
            if (item.getElectItem().getId() == p.getId() && item.getQuantity() > 1) {
                item.setQuantity(item.getQuantity() - 1);
                return "cart";
            }
        }
        return "cart";
    }
    public String deleteFromCart(ClothesItem p) {
        for (Cart item : cart) {
            if (item.getClothesItem().getId() == p.getId() && item.getQuantity() > 1) {
                item.setQuantity(item.getQuantity() - 1);
                return "cart";
            }
        }
        return "cart";
    }
    public String deleteFromCart(ShoesItem p) {
        for (Cart item : cart) {
            if (item.getShoesItem().getId() == p.getId() && item.getQuantity() > 1) {
                item.setQuantity(item.getQuantity() - 1);
                return "cart";
            }
        }
        return "cart";
    }

}
