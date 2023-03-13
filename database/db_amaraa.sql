-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Mar 2023 pada 06.33
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_amaraa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `qty` double NOT NULL,
  `total_harga` double NOT NULL,
  `keterangan` text NOT NULL,
  `total_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `id_transaksi`, `id_paket`, `qty`, `total_harga`, `keterangan`, `total_bayar`) VALUES
(16, 36, 20, 20, 44000, '', 500000),
(17, 37, 20, 50, 110000, '', 200000),
(18, 39, 21, 15, 21000, '', 25000),
(19, 40, 20, 10, 22000, '', 0),
(20, 41, 20, 10, 22000, '', 50000),
(21, 42, 20, 4, 25200, '', 0),
(22, 44, 20, 4, 25200, '', 0),
(23, 45, 20, 4, 25200, '', 0),
(24, 46, 20, 4, 25200, '', 0),
(25, 47, 20, 4, 28820, '', 0),
(26, 48, 21, 5, 75350, '', 0),
(27, 49, 21, 5, 75350, '', 0),
(28, 50, 20, 5, 35750, '', 0),
(29, 51, 20, 3, 21890, '', 0),
(30, 52, 20, 3, 21890, '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlet`
--

CREATE TABLE `outlet` (
  `id_outlet` int(11) NOT NULL,
  `nama_outlet` varchar(228) CHARACTER SET utf8mb4 DEFAULT NULL,
  `alamat_outlet` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `telp_outlet` varchar(15) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `outlet`
--

INSERT INTO `outlet` (`id_outlet`, `nama_outlet`, `alamat_outlet`, `telp_outlet`) VALUES
(9, 'Outlet Merah', 'Yogyakarta, Indonesia', '08555555555'),
(10, 'Outlet Putih', 'Bantul, Yogyakarta, Indonesia', '081222222222'),
(11, 'Outlet Biru', 'Bantul, Daerah Istimewa Yogyakarta', '081223446312'),
(12, 'Outlet Abu-abu', 'Bantul, Yogyakarta', '0826377453886');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket_cuci`
--

CREATE TABLE `paket_cuci` (
  `id_paket` int(11) NOT NULL,
  `jenis_paket` enum('kiloan','selimut','bedcover','kaos','lain') NOT NULL,
  `nama_paket` varchar(228) NOT NULL,
  `harga` int(11) NOT NULL,
  `outlet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `paket_cuci`
--

INSERT INTO `paket_cuci` (`id_paket`, `jenis_paket`, `nama_paket`, `harga`, `outlet_id`) VALUES
(20, 'kiloan', 'Paket Wangi Tahan Lama', 7000, 9),
(21, 'kaos', 'Paket Cepat Kering', 14000, 9),
(22, 'selimut', 'Paket Harum', 12000, 9),
(23, 'kiloan', 'Paket Kering Wangi', 7000, 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(228) NOT NULL,
  `alamat_pelanggan` text NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `telp_pelanggan` varchar(15) NOT NULL,
  `no_ktp` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat_pelanggan`, `jenis_kelamin`, `telp_pelanggan`, `no_ktp`) VALUES
(23, 'dinda', 'batujajar', 'P', '08942517827', '432612176298'),
(24, 'amara', 'cimahi', 'P', '0885612461', '321546567818'),
(25, 'nur', 'bandung', 'P', '07823672575', '263537257'),
(26, 'mueh', 'cangkorah', 'P', '098987876', '64534268'),
(27, 'niko', 'batujajar', 'L', '082368232', '3472673821'),
(28, 'mahesa', 'cimahi', 'L', '093579439', '54723547');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `outlet_id` int(11) DEFAULT NULL,
  `kode_invoice` varchar(228) CHARACTER SET utf8mb4 DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `tgl` datetime DEFAULT NULL,
  `batas_waktu` datetime DEFAULT NULL,
  `tgl_pembayaran` datetime DEFAULT NULL,
  `biaya_tambahan` int(11) DEFAULT NULL,
  `diskon` double DEFAULT NULL,
  `pajak` int(11) DEFAULT NULL,
  `status` enum('baru','proses','selesai','diambil') CHARACTER SET utf8mb4 DEFAULT NULL,
  `status_bayar` enum('dibayar','belum') CHARACTER SET utf8mb4 DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `outlet_id`, `kode_invoice`, `id_pelanggan`, `tgl`, `batas_waktu`, `tgl_pembayaran`, `biaya_tambahan`, `diskon`, `pajak`, `status`, `status_bayar`, `id_user`) VALUES
(36, 9, 'CLN202009033737', 23, '2020-09-03 04:37:43', '2020-09-10 12:00:00', '2020-09-03 04:40:03', 0, 0, 0, 'baru', 'dibayar', 1),
(37, 9, 'CLN202009035702', 23, '2020-09-03 05:03:37', '2020-09-10 12:00:00', '2020-09-03 05:08:28', 0, 0, 0, 'baru', 'dibayar', 1),
(39, 10, 'CLN202009034317', 24, '2020-09-03 05:19:12', '2020-09-10 12:00:00', '2020-09-03 05:21:41', 0, 0, 0, 'baru', 'dibayar', NULL),
(40, 9, 'CLN202009040521', 24, '2020-09-04 03:21:09', '2020-09-11 12:00:00', NULL, 0, 0, 0, 'baru', 'belum', 1),
(41, 9, 'CLN202009040528', 25, '2020-09-04 03:28:21', '2020-09-11 12:00:00', '2020-09-04 03:29:00', 0, 0, 0, 'selesai', 'dibayar', 1),
(42, 9, 'CLN202302235242', 23, '2023-02-23 07:43:14', '2023-03-02 12:00:00', NULL, 1000, 10, 10, 'baru', 'belum', 1),
(43, 9, 'CLN202302235242', 23, '2023-02-23 07:47:02', '2023-03-02 12:00:00', NULL, 1000, 10, 10, 'baru', 'belum', 1),
(44, 9, 'CLN202302235948', 23, '2023-02-23 07:49:45', '2023-03-02 12:00:00', NULL, 1000, 10, 10, 'baru', 'belum', 1),
(45, 9, 'CLN202302231750', 23, '2023-02-23 07:50:52', '2023-03-02 12:00:00', NULL, 1000, 10, 10, 'baru', 'belum', 1),
(46, 9, 'CLN202302235953', 24, '2023-02-23 07:54:09', '2023-03-02 12:00:00', NULL, 1000, 10, 10, 'baru', 'belum', 1),
(47, 9, 'CLN202302233555', 23, '2023-02-23 07:55:48', '2023-03-02 12:00:00', NULL, 1000, 10, 10, 'baru', 'belum', 1),
(48, 9, 'CLN202302233704', 24, '2023-02-23 08:04:51', '2023-03-02 12:00:00', NULL, 2000, 5, 10, 'baru', 'belum', 1),
(49, 9, 'CLN202302234605', 24, '2023-02-23 08:05:49', '2023-03-02 12:00:00', NULL, 2000, 5, 10, 'baru', 'belum', 1),
(50, 9, 'CLN202303015640', 24, '2023-03-01 01:41:18', '2023-03-08 12:00:00', NULL, 1000, 10, 10, 'baru', 'belum', 1),
(51, 9, 'CLN202303013155', 25, '2023-03-01 01:55:48', '2023-03-08 12:00:00', NULL, 1000, 10, 10, 'baru', 'belum', 1),
(52, 9, 'CLN202303015655', 25, '2023-03-01 01:56:51', '2023-03-08 12:00:00', NULL, 1000, 10, 10, 'baru', 'belum', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(228) CHARACTER SET utf8mb4 DEFAULT NULL,
  `username` varchar(228) CHARACTER SET utf8mb4 DEFAULT NULL,
  `password` varchar(228) CHARACTER SET utf8mb4 DEFAULT NULL,
  `outlet_id` int(11) DEFAULT NULL,
  `role` enum('admin','kasir','owner') CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password`, `outlet_id`, `role`) VALUES
(1, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 9, 'admin'),
(3, 'owner', 'owner', '72122ce96bfec66e2396d2e25225d70a', 10, 'owner'),
(8, 'dinda', 'kasir', 'c7911af3adbd12a035b289556d96470a', 12, 'kasir');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_paket` (`id_paket`);

--
-- Indeks untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`id_outlet`);

--
-- Indeks untuk tabel `paket_cuci`
--
ALTER TABLE `paket_cuci`
  ADD PRIMARY KEY (`id_paket`),
  ADD KEY `outlet_id` (`outlet_id`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `outlet_id` (`outlet_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `outlet_id` (`outlet_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `outlet`
--
ALTER TABLE `outlet`
  MODIFY `id_outlet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `paket_cuci`
--
ALTER TABLE `paket_cuci`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_3` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_ibfk_4` FOREIGN KEY (`id_paket`) REFERENCES `paket_cuci` (`id_paket`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `paket_cuci`
--
ALTER TABLE `paket_cuci`
  ADD CONSTRAINT `paket_cuci_ibfk_1` FOREIGN KEY (`outlet_id`) REFERENCES `outlet` (`id_outlet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paket_cuci_ibfk_2` FOREIGN KEY (`outlet_id`) REFERENCES `outlet` (`id_outlet`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_5` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_6` FOREIGN KEY (`outlet_id`) REFERENCES `outlet` (`id_outlet`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`outlet_id`) REFERENCES `outlet` (`id_outlet`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
