/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project_ap1.kasir.client;

import java.io.InputStream;

/**
 *
 * @author rjial
 */
public class Menu {
    private String id_menu;
    private String nama_menu;
    private int stok;
    private int harga;
    private InputStream gambarmenu;
    // nek 0 iku makanan
    // nek 1 iku minuman
    private int tipe_menu;
    private int jumlah_pesan;
    
    
    public Menu(String id_menu, String nama_menu, int stok, int harga, InputStream gambarmenu, int tipe_menu, int jumlah_pesan) {
        this.id_menu = id_menu;
        this.nama_menu = nama_menu;
        this.stok = stok;
        this.harga = harga;
        this.gambarmenu = gambarmenu;
        this.tipe_menu = tipe_menu;
        this.jumlah_pesan = jumlah_pesan;
    }
    
    public String getIdMenu() {
        return this.id_menu;
    }
    public String getNamaMenu() {
        return this.nama_menu;
    }
    public int getStok() {
        return this.stok;
    }
    public int getHarga() {
        return this.harga;
    }
    public InputStream getGambarMenu() {
        return this.gambarmenu;
    }
    public int getTipe() {
        return this.tipe_menu;
    }
    public int getJmlhPesan() {
        return this.jumlah_pesan;
    }
    public void setJmlhPesan(int jmlhPsn) {
        this.jumlah_pesan = jmlhPsn;
    }
    
}
