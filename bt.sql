use bt2;
create table khachHang
(
    MaKH     varchar(4) primary key,
    Ten      varchar(30) not null,
    DiaChi   varchar(50),
    NgaySinh date,
    SoDT     varchar(15) UNIQUE
);
create table nhanVien
(
    MaNV       varchar(4) primary key,
    HoTen      varchar(30) not null,
    GioiTinh   bit         not null,
    DiaChi     varchar(50) not null,
    NgaySinh   date        not null,
    DienThoai  varchar(15),
    Email      text,
    NoiSinh    varchar(20) not null,
    NgayVaoLam date,
    MaNQL      varchar(4)

);
create table nhaCungCap
(
    MaNCC     varchar(5) primary key,
    TenNCC    varchar(50) not null,
    DiaChi    varchar(50) not null,
    DienThoai varchar(50) not null,
    Email     varchar(50) not null,
    Website   varchar(50)
);
create table LoaiSP
(
    MaLoaiSP  varchar(4) primary key,
    TenloaiSP varchar(30)  not null,
    Ghichu    varchar(100) not null

);
create table SanPham
(
    MaSP      varchar(4) primary key,
    MaLoaiSP  varchar(4)  not null,
    TenSp     varchar(50) not null,
    Donvitinh varchar(10) not null,
    Ghichu    varchar(100)
);
create table PhieuNhap
(
    SoPn     varchar(5) primary key,
    MaNV     varchar(4)           not null,
    MaNCC    varchar(5)           not null,
    ngaynhap date default (NOW()) not null,
    Ghichu   varchar(100)
);
create table ctphieunhap
(
    maSP    varchar(4),
    soPn    varchar(5),
    primary key (maSP, soPn),
    soluong smallint default 0          not null,
    Gianhap real check ( Gianhap >= 0 ) not null
);
create table PhieuXuat
(
    SoPX    varchar(5) primary key,
    MaNV    varchar(4) not null,
    MaKH    varchar(4) not null,
    ngayban date       not null,
    Ghichu  text
);
create table ctphieuxuat
(
    SoPX    varchar(5)                     not null,
    maSP    varchar(4)                     not null,
    primary key (maSP, SoPX),
    soluong smallint check ( soluong > 0 ) not null,
    Giaban  real check ( Giaban > 0 )      not null
);

alter table PhieuNhap
    add constraint fk_MaNCC foreign key (MaNCC) references nhaCungCap (MaNCC),
    add constraint fk_maNV foreign key (MaNV) references nhanVien (MaNV);

alter table ctphieunhap
    add constraint fk_MaSp foreign key (MaSP) references SanPham (MaSP),
    add constraint fk_soPn foreign key (soPn) references PhieuNhap (SoPn);

alter table SanPham
    add constraint fk_MaloaiSp foreign key (MaLoaiSP) references LoaiSP (MaLoaiSP);

alter table PhieuXuat
    add constraint fk_maNVpx foreign key (MaNV) references nhanVien (MaNV),
    add constraint fk_maKHpx foreign key (MaKH) references khachHang (MaKH);

alter table ctphieuxuat
    add constraint fk_soPX foreign key (SoPX) references PhieuXuat (SoPX),
    add constraint fk_maSPpx foreign key (maSP) references SanPham (MaSP);

INSERT INTO nhanVien(MaNV, HoTen, GioiTinh, DiaChi, NgaySinh, DienThoai, Email, NoiSinh, NgayVaoLam, MaNQL)
values ('1', 'nguyen duc hung', 0, 'hn', '1996-01-22', 0912888888, 'h@gmail.com', 'tn', now(), '1');
INSERT INTO nhaCungCap(MaNCC, TenNCC, DiaChi, DienThoai, Email, Website)
VALUES ('1', 'pro', 'Hn', '0912999999', 'g@gmail.com', 'pro.vn');
INSERT INTO khachHang(makh, ten, diachi, ngaysinh, sodt)
values ('1', 'nguyen van a', 'nd', '2000-01-01', 0913999999);

INSERT INTO khachHang(makh, ten, diachi, ngaysinh, sodt)
values ('2', 'nguyen van b', 'nd', '2000-01-01', 0913999222);

INSERT INTO PhieuNhap(SoPn, MaNV, MaNCC, Ghichu)
VALUES ('1', '1', '1', 'phieunhap1');

INSERT INTO PhieuNhap(SoPn, MaNV, MaNCC, Ghichu)
VALUES ('2', '1', '1', 'phieunhap2');

INSERT INTO PhieuXuat(SoPX, MaNV, MaKH, ngayban, Ghichu)
VALUES ('1', '1', '1', '2024-03-03', 'pro');

INSERT INTO PhieuXuat(SoPX, MaNV, MaKH, ngayban, Ghichu)
VALUES ('2', '1', '2', '2024-03-04', 'pro1');

UPDATE khachHang
SET SoDT = '0123456789'
WHERE MaKH = '1';

UPDATE nhanVien
SET DiaChi = 'Thai Nguyen'
WHERE MaNV = '1';
