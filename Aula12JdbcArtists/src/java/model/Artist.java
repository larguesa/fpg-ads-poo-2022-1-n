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
public class Artist {
    private int id;
    private String name;
    
    public static ArrayList<Artist> getList() throws Exception{
        ArrayList<Artist> list = new ArrayList<>();
        Class.forName("org.sqlite.JDBC");
        String url = "jdbc:sqlite:C:\\Users\\rlarg\\chinook.db";
        Connection con = DriverManager.getConnection(url);
        Statement stmt = con.createStatement();
        String query = "SELECT * FROM artists ORDER BY name";
        ResultSet rs = stmt.executeQuery(query);
        while(rs.next()){
            int id = rs.getInt("ArtistId");
            String name = rs.getString("Name");
            Artist a = new Artist(id, name);
            list.add(a);
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }

    public static int getCount() throws Exception{
        int count = 0;
        Class.forName("org.sqlite.JDBC");
        String url = "jdbc:sqlite:C:\\Users\\rlarg\\chinook.db";
        Connection con = DriverManager.getConnection(url);
        Statement stmt = con.createStatement();
        String query = "SELECT count(*) as count FROM artists";
        ResultSet rs = stmt.executeQuery(query);
        while(rs.next()){
            count = rs.getInt("count");
        }
        rs.close();
        stmt.close();
        con.close();
        return count;
    }
    
    public Artist(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
}