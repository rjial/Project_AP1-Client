/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     01/12/2021 10:22:58                          */
/*==============================================================*/


alter table METODE_PEMBAYARAN 
   drop foreign key FK_METODE_P_METODE_PELANGGA;

drop table if exists METODE_PEMBAYARAN;


alter table MINUMAN 
   drop foreign key FK_MINUMAN_INHERITAN_MENU;

drop table if exists MINUMAN;

drop table if exists PELANGGAN;

drop table if exists PEMBAYARAN;


alter table RIWAYAT_PESANAN 
   drop foreign key FK_RIWAYAT__TRANSAKSI_KASIR;

drop table if exists RIWAYAT_PESANAN;


alter table TERIMA 
   drop foreign key FK_TERIMA_INHERITAN_RIWAYAT_;

drop table if exists TERIMA;


alter table TOLAK 
   drop foreign key FK_TOLAK_INHERITAN_RIWAYAT_;

drop table if exists TOLAK;


alter table TRANSAKSI 
   drop foreign key FK_TRANSAKS_PESANAN_MENU;

alter table TRANSAKSI 
   drop foreign key FK_TRANSAKS_PEMBELIAN_PELANGGA;

alter table TRANSAKSI 
   drop foreign key FK_TRANSAKS_PEMBAYARA_PEMBAYAR;

alter table TRANSAKSI 
   drop foreign key FK_TRANSAKS_PEMESANAN_RIWAYAT_;

drop table if exists TRANSAKSI;

/*==============================================================*/
/* Table: KASIR                                                 */
/*==============================================================*/
create table KASIR
(
   LD_KASIR             varchar(30) not null  comment '',
   NAMA                 varchar(30) not null  comment '',
   ALAMAT               text not null  comment '',
   JK                   varchar(30) not null  comment '',
   NO_TELP              varchar(15) not null  comment '',
   USERNAME             varchar(30)  comment '',
   PASSWORD             varchar(30)  comment '',
   primary key (LD_KASIR)
);

/*==============================================================*/
/* Table: MAKANAN                                               */
/*==============================================================*/
create table MAKANAN
(
   ID_MENU              varchar(50) not null  comment '',
   NAMA_MAKANAN         varchar(50)  comment '',
   primary key (ID_MENU)
);

/*==============================================================*/
/* Table: MENU                                                  */
/*==============================================================*/
create table MENU
(
   GAMBAR_MENU          longblob  comment '',
   ID_MENU              varchar(50) not null  comment '',
   STOCK                int  comment '',
   HARGA                varchar(20)  comment '',
   primary key (ID_MENU)
);

/*==============================================================*/
/* Table: METODE_PEMBAYARAN                                     */
/*==============================================================*/
create table METODE_PEMBAYARAN
(
   WALET                varchar(50) not null  comment '',
   NON_TUNAI            varchar(50) not null  comment '',
   ID_METODE_PEMBAYARAN int not null  comment '',
   NO_ANTRIAN           int  comment '',
   primary key (ID_METODE_PEMBAYARAN)
);

/*==============================================================*/
/* Table: MINUMAN                                               */
/*==============================================================*/
create table MINUMAN
(
   ID_MENU              varchar(50) not null  comment '',
   NAMA_MINUMAN         varchar(50)  comment '',
   primary key (ID_MENU)
);

/*==============================================================*/
/* Table: PELANGGAN                                             */
/*==============================================================*/
create table PELANGGAN
(
   NO_ANTRIAN           int not null  comment '',
   ID_PELANGGAN         int not null  comment '',
   primary key (NO_ANTRIAN)
);

/*==============================================================*/
/* Table: PEMBAYARAN                                            */
/*==============================================================*/
create table PEMBAYARAN
(
   ID_PEMBAYARAN        int not null  comment '',
   NAMA                 varchar(30) not null  comment '',
   primary key (ID_PEMBAYARAN)
);

/*==============================================================*/
/* Table: RIWAYAT_PESANAN                                       */
/*==============================================================*/
create table RIWAYAT_PESANAN
(
   ID_PESANAN           int not null  comment '',
   LD_KASIR             varchar(30)  comment '',
   ID_BAYAR             int not null  comment '',
   STATUS               varchar(50) not null  comment '',
   primary key (ID_PESANAN)
);

/*==============================================================*/
/* Table: TERIMA                                                */
/*==============================================================*/
create table TERIMA
(
   ID_PESANAN           int not null  comment '',
   LD_KASIR             varchar(30)  comment '',
   ID_BAYAR             int not null  comment '',
   STATUS               varchar(50) not null  comment '',
   primary key (ID_PESANAN)
);

/*==============================================================*/
/* Table: TOLAK                                                 */
/*==============================================================*/
create table TOLAK
(
   ID_PESANAN           int not null  comment '',
   LD_KASIR             varchar(30)  comment '',
   ID_BAYAR             int not null  comment '',
   STATUS               varchar(50) not null  comment '',
   primary key (ID_PESANAN)
);

/*==============================================================*/
/* Table: TRANSAKSI                                             */
/*==============================================================*/
create table TRANSAKSI
(
   ID_TRANSAKSI         int not null  comment '',
   ID_PEMBAYARAN        int  comment '',
   ID_MENU              varchar(50)  comment '',
   ID_PESANAN           int  comment '',
   NO_ANTRIAN           int  comment '',
   JUMLAH_PESANAN       int not null  comment '',
   primary key (ID_TRANSAKSI)
);

alter table MAKANAN add constraint FK_MAKANAN_INHERITAN_MENU foreign key (ID_MENU)
      references MENU (ID_MENU) on delete restrict on update restrict;

alter table METODE_PEMBAYARAN add constraint FK_METODE_P_METODE_PELANGGA foreign key (NO_ANTRIAN)
      references PELANGGAN (NO_ANTRIAN) on delete restrict on update restrict;

alter table MINUMAN add constraint FK_MINUMAN_INHERITAN_MENU foreign key (ID_MENU)
      references MENU (ID_MENU) on delete restrict on update restrict;

alter table RIWAYAT_PESANAN add constraint FK_RIWAYAT__TRANSAKSI_KASIR foreign key (LD_KASIR)
      references KASIR (LD_KASIR) on delete restrict on update restrict;

alter table TERIMA add constraint FK_TERIMA_INHERITAN_RIWAYAT_ foreign key (ID_PESANAN)
      references RIWAYAT_PESANAN (ID_PESANAN) on delete restrict on update restrict;

alter table TOLAK add constraint FK_TOLAK_INHERITAN_RIWAYAT_ foreign key (ID_PESANAN)
      references RIWAYAT_PESANAN (ID_PESANAN) on delete restrict on update restrict;

alter table TRANSAKSI add constraint FK_TRANSAKS_PEMBAYARA_PEMBAYAR foreign key (ID_PEMBAYARAN)
      references PEMBAYARAN (ID_PEMBAYARAN) on delete restrict on update restrict;

alter table TRANSAKSI add constraint FK_TRANSAKS_PEMBELIAN_PELANGGA foreign key (NO_ANTRIAN)
      references PELANGGAN (NO_ANTRIAN) on delete restrict on update restrict;

alter table TRANSAKSI add constraint FK_TRANSAKS_PEMESANAN_RIWAYAT_ foreign key (ID_PESANAN)
      references RIWAYAT_PESANAN (ID_PESANAN) on delete restrict on update restrict;

alter table TRANSAKSI add constraint FK_TRANSAKS_PESANAN_MENU foreign key (ID_MENU)
      references MENU (ID_MENU) on delete restrict on update restrict;

