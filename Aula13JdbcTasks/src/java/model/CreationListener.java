/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/ServletListener.java to edit this template
 */
package model;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.*;

/**
 * Web application lifecycle listener.
 *
 * @author rlarg
 */
public class CreationListener implements ServletContextListener {
    
    public static Exception exception;
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try{
            Class.forName("org.sqlite.JDBC");
            String url = "jdbc:sqlite:tasks.db";
            Connection con = DriverManager.getConnection(url);
            Statement stmt = con.createStatement();
            //stmt.execute("drop table users");
            stmt.execute("create table if not exists users("
                    + "username varchar primary key,"
                    + "password_hash integer not null,"
                    + "name varchar not null"
                    + ")");
            stmt.execute("insert or ignore into users values("
                    + "'admin', 20761617, 'Administrador')");
            stmt.close();
            con.close();
        }catch(Exception ex){
            exception = ex;
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
