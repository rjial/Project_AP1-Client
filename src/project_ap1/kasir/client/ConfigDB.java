/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project_ap1.kasir.client;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author rjial
 */
public class ConfigDB {
    public static Connection con = null;

    public static Connection ambil_koneksi() {
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            con = DriverManager.getConnection("jdbc:mysql://localhost/kasir_db", "root", "");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return con;
    }
}
