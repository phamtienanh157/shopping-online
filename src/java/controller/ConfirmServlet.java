package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;
import model.Order;
import model.User;
import dao.BookItemDAO;
import dao.OrderDAOImpl;
import dao.BookItemDAOImpl;
import dao.ElectronicsDAOImpl;
import dao.ClothesDAOImpl;
import dao.ShoesDAOImpl;
import dao.UserDAO;
import dao.UserDAOImpl;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet implementation class ConfirmServlet
 */
public class ConfirmServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDAOImpl userDAO = new UserDAOImpl();
    private OrderDAOImpl historyDAO = new OrderDAOImpl();
    private BookItemDAOImpl bookDAO = new BookItemDAOImpl();
    private ElectronicsDAOImpl electDAO = new ElectronicsDAOImpl();
    private ClothesDAOImpl clothesDAO = new ClothesDAOImpl();
    private ShoesDAOImpl shoesDAO = new ShoesDAOImpl();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        User u = userDAO.getUser(username);

        String shipment = request.getParameter("shipment");
        String Name = request.getParameter("Name");
        String PhoneNumber = request.getParameter("PhoneNumber");
        String Address = request.getParameter("Address");
        String Name2 = request.getParameter("Name2");
        String PhoneNumber2 = request.getParameter("PhoneNumber2");
        String Address2 = request.getParameter("Address2");
        
        if(Name.length()<Name2.length()){
            Name = Name2;
            PhoneNumber = PhoneNumber2;
            Address = Address2;
        }
        //lấy time lưu csdl
        Calendar calendar = Calendar.getInstance();
        java.sql.Timestamp tdate = new java.sql.Timestamp(calendar.getTime().getTime());

        ArrayList<Cart> cart = (ArrayList<Cart>) request.getSession().getAttribute("cart");

        if (cart != null) {
            for (Cart c : cart) {
                if (c.getMa_the_loai() == 1) {
                    Order h = new Order(0, u.getUser_id(), c.getBookItem().getId(), c.getBookItem().getTypeId(), tdate, Name, PhoneNumber, Address, c.getQuantity(), (c.getQuantity() * c.getPrice()), shipment);
                    historyDAO.addOrder(h);
                    historyDAO.addShipment(h);
                }
                if (c.getMa_the_loai() == 2) {
                    Order h = new Order(0, u.getUser_id(), c.getElectItem().getId(), c.getElectItem().getTypeId(), tdate, Name, PhoneNumber, Address, c.getQuantity(), (c.getQuantity() * c.getPrice()), shipment);
                    historyDAO.addOrder(h);
                    historyDAO.addShipment(h);
                }
                if (c.getMa_the_loai() == 3) {
                    Order h = new Order(0, u.getUser_id(), c.getClothesItem().getId(), c.getClothesItem().getTypeId(), tdate, Name, PhoneNumber, Address, c.getQuantity(), (c.getQuantity() * c.getPrice()), shipment);
                    historyDAO.addOrder(h);
                    historyDAO.addShipment(h);
                }
                if (c.getMa_the_loai() == 4) {
                    Order h = new Order(0, u.getUser_id(), c.getShoesItem().getId(), c.getShoesItem().getTypeId(), tdate, Name, PhoneNumber, Address, c.getQuantity(), (c.getQuantity() * c.getPrice()), shipment);
                    historyDAO.addOrder(h);
                    historyDAO.addShipment(h);
                }

            }
        }
        cart.clear();
        request.getSession().setAttribute("cart", cart);
        response.sendRedirect("/index.jsp");
    }
}
