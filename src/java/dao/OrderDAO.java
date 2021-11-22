package dao;

import java.util.List;

import model.Order;

public interface OrderDAO {
	
    public void addOrder(Order h);
    public void addShipment(Order h);
    public List<Order> getList(int user_id);

}
