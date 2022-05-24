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
    
    public static void insert(User user) throws Exception{
        Class.forName("org.sqlite.JDBC");
        String url = "jdbc:sqlite:tasks.db";
        Connection con = DriverManager.getConnection(url);
        PreparedStatement stmt = con.prepareStatement(
                "INSERT INTO users(username, name, password_hash)"
                        + "VALUES(?,?,?)"
        );
        stmt.setString(1, user.getUsername());
        stmt.setString(2, user.getName());
        stmt.setLong(3, user.getPasswordHash());
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    public static void delete(String username) throws Exception{
        Class.forName("org.sqlite.JDBC");
        String url = "jdbc:sqlite:tasks.db";
        Connection con = DriverManager.getConnection(url);
        PreparedStatement stmt = con.prepareStatement(
                "DELETE FROM users WHERE username=?"
        );
        stmt.setString(1, username);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    public static void changePassword(String username, String newPassword) throws Exception{
        Class.forName("org.sqlite.JDBC");
        String url = "jdbc:sqlite:tasks.db";
        Connection con = DriverManager.getConnection(url);
        PreparedStatement stmt = con.prepareStatement(
            "UPDATE users set password_hash=? WHERE username=?"
        );
        stmt.setLong(1, (username+newPassword).hashCode());
        stmt.setString(2, username);
        stmt.execute();
        stmt.close();con.close();
    }
    
    public static User getUser(String username, String password) throws Exception{
        User user = null;
        Class.forName("org.sqlite.JDBC");
        String url = "jdbc:sqlite:tasks.db";
        Connection con = DriverManager.getConnection(url);
        PreparedStatement stmt = con.prepareStatement
        ("select * from users where username=? and password_hash=?");
        stmt.setString(1, username);
        stmt.setLong(2, (username+password).hashCode());
        ResultSet rs = stmt.executeQuery();
        if(rs.next()){
            user = new User(
                            rs.getString("username"),
                            rs.getString("name"),
                            rs.getLong("password_hash")
            );
        }
        rs.close(); stmt.close(); con.close();
        return user;
    }
    
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
