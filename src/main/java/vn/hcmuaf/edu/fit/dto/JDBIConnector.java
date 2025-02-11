package vn.hcmuaf.edu.fit.dto;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import vn.hcmuaf.edu.fit.bean.User;

import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;


public class JDBIConnector {
    private static Jdbi jdbi;

   private static void makeConnect() {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setURL("jdbc:mysql://" + DBProperties.host() + ":" + DBProperties.port() + "/"
                + DBProperties.dbName());
        dataSource.setUser(DBProperties.user());
        dataSource.setPassword(DBProperties.pass());
        try {
            dataSource.setUseCompression(true);
            dataSource.setAutoReconnect(true);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            throw new RuntimeException(throwables);
        }
        jdbi = Jdbi.create(dataSource);
    }


    private JDBIConnector() {
    }

    public static Jdbi get() {
        if(jdbi==null) makeConnect();
        return jdbi;
    }

    public static void main(String[] args) {
        List<User> users = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select * from taikhoan")
                    .mapToBean(User.class).stream().collect(Collectors.toList());
        });
        System.out.println(users);
    }
}



