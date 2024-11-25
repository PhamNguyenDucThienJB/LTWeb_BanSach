package vn.hcmuaf.edu.fit.service;

import vn.hcmuaf.edu.fit.dto.DBConnection;
import vn.hcmuaf.edu.fit.model.Customer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerService {
    public static List<Customer> getListCustomer(){
        List<Customer> listC = new ArrayList<Customer>();
        Statement statement = DBConnection.getInstall().get();
        if(statement !=null){
            try{
                ResultSet rs = statement.executeQuery("SELECT MAKH, TENKH, MATAIKHOAN, DIACHI, SDT, taikhoan.role from khachhang, taikhoan where taikhoan.id = khachhang.mataikhoan");
                while(rs.next()){
                    listC.add(new Customer(rs.getString(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getInt(6)
                    ));
                }
            }
            catch (SQLException e){
                e.printStackTrace();
            }
        }
        else{
            System.out.println("Không có khách hàng");
        }
        return listC;

    }
    public static String getIdAccByMakh(String makh){
        for(Customer c: getListCustomer()){
            if(c.getMAKH().equals(makh)){
                return c.getMATAIKHOAN();
            }
        }
        return null;
    }
    public static Customer getCusByIdAcc(String idAcc){
        for(Customer c: getListCustomer()){
            if(c.getMATAIKHOAN().equals(idAcc)){
                return c;
            }
        }
        return null;
    }
}
