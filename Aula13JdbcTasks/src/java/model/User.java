/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.sql.*;

/**
 *
 * @author rlarg
 */
public class User {
    private String username;
    private String name;
    private long passwordHash;
    
    public static ArrayList<User> getAllUsers() throws Exception{
        ArrayList<User> list = new ArrayList<>();
        Class.forName("org.sqlite.JDBC");
        String url = "jdbc:sqlite:tasks.db";
        Connection con = DriverManager.getConnection(url);
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from users");
        while(rs.next()){
            list.add(
                    new User(
                            rs.getString("username"),
                            rs.getString("name"),
                            rs.getLong("password_hash"))
            );
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }

    public User(String username, String name, long passwordHash) {
        this.username = username;
        this.name = name;
        this.passwordHash = passwordHash;
    }

    public long getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(long passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
