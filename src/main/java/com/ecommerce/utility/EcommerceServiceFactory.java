package com.ecommerce.utility;

import com.ecommerce.service.AdminService;
import com.ecommerce.service.AdminServiceInterface;
import com.ecommerce.service.BuyerService;
import com.ecommerce.service.BuyerServiceInterface;
import com.ecommerce.service.GlobalService;
import com.ecommerce.service.GlobalServiceInterface;
import com.ecommerce.service.RetailerService;
import com.ecommerce.service.RetailerServiceInterface;

public class EcommerceServiceFactory {

    public static GlobalServiceInterface createGlobalService(String serviceType) {
        if ("global".equals(serviceType)) {
            return new GlobalService();
        }
        return null;
    }
    
    public static AdminServiceInterface createAdminService(String serviceType) {
        if ("admin".equals(serviceType)) {
            return new AdminService();
        }
        return null;
    }
    
    public static BuyerServiceInterface createBuyerService(String serviceType) {
        if ("buyer".equals(serviceType)) {
            return new BuyerService();
        }
        return null;
    }
    
    public static RetailerServiceInterface createRetailerService(String serviceType) {
        if ("retailer".equals(serviceType)) {
            return new RetailerService();
        }
        return null;
    }
}
