package com.ecommerce.utility;

import com.ecommerce.dao.AdminDAO;
import com.ecommerce.dao.AdminDAOInterface;
import com.ecommerce.dao.BuyerDAO;
import com.ecommerce.dao.BuyerDAOInterface;
import com.ecommerce.dao.GlobalDAO;
import com.ecommerce.dao.GlobalDAOInterface;
import com.ecommerce.dao.RetailerDAO;
import com.ecommerce.dao.RetailerDAOInterface;

public class EcommerceDAOFactory {

    public static GlobalDAOInterface createGlobalDAO(String daoType) {
        if ("global".equals(daoType)) {
            return new GlobalDAO();
        }
        return null;
    }
    
    public static AdminDAOInterface createAdminDAO(String daoType) {
        if ("admin".equals(daoType)) {
            return new AdminDAO();
        }
        return null;
    }
    
    public static BuyerDAOInterface createBuyerDAO(String daoType) {
        if ("buyer".equals(daoType)) {
            return new BuyerDAO();
        }
        return null;
    }
    
    public static RetailerDAOInterface createRetailerDAO(String daoType) {
        if ("retailer".equals(daoType)) {
            return new RetailerDAO();
        }
        return null;
    }
}
