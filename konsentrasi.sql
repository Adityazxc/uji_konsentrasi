-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Agu 2023 pada 17.50
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `konsentrasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `gelombang_otak`
--

CREATE TABLE `gelombang_otak` (
  `id_gelombang` int(11) NOT NULL,
  `nip` varchar(12) DEFAULT NULL,
  `rA` float DEFAULT NULL,
  `rB` float DEFAULT NULL,
  `rG` float DEFAULT NULL,
  `stdA` float DEFAULT NULL,
  `stdB` float DEFAULT NULL,
  `stdG` float DEFAULT NULL,
  `absA` float DEFAULT NULL,
  `absB` float DEFAULT NULL,
  `absG` float DEFAULT NULL,
  `tingkat_konsentrasi` varchar(20) DEFAULT NULL,
  `tanggal` datetime DEFAULT current_timestamp(),
  `nama_pegawai` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `gelombang_otak`
--

INSERT INTO `gelombang_otak` (`id_gelombang`, `nip`, `rA`, `rB`, `rG`, `stdA`, `stdB`, `stdG`, `absA`, `absB`, `absG`, `tingkat_konsentrasi`, `tanggal`, `nama_pegawai`) VALUES
(1, 'BDO05I05A227', 0.697, 0.458, 0.366, 0.951, 0.816, 0.528, 0.697, 0.458, 0.366, 'Konsentrasi Rendah', '2023-08-23 22:36:21', 'ANWAR JAELANI'),
(2, 'BDO05I05A227', 0.476, 0.431, 0.329, 0.747, 0.732, 0.405, 0.476, 0.431, 0.329, 'Konsentrasi Tinggi', '2023-08-23 22:36:46', 'ANWAR JAELANI'),
(3, 'BDO12F05M687', 0.639, 1.153, 0.447, 0.864, 1.191, 0.573, 0.639, 1.153, 0.447, 'Konsentrasi Tinggi', '2023-08-23 22:37:51', 'M ERIK SUSANTO'),
(4, 'BDO12F05M687', 0.919, 0.934, 0.523, 1.092, 1.095, 0.563, 0.919, 0.934, 0.523, 'Konsentrasi Rendah', '2023-08-23 22:38:13', 'M ERIK SUSANTO'),
(5, 'BDO14K05S124', 0.848, 0.993, 0.486, 1.116, 1.04, 0.48, 0.848, 0.993, 0.486, 'Konsentrasi Tinggi', '2023-08-23 22:39:08', 'SETIAWAN A.S'),
(6, 'BDO14K05S124', 1.245, 0.749, 0.597, 1.204, 0.902, 0.443, 1.245, 0.749, 0.597, 'Konsentrasi Rendah', '2023-08-23 22:39:49', 'SETIAWAN A.S'),
(7, 'BDO15K05H753', 1.145, 0.559, 0.233, 1.132, 0.794, 0.369, 1.145, 0.559, 0.233, 'Konsentrasi Rendah', '2023-08-23 22:40:15', 'HERLAN SUHERLAN'),
(8, 'BDO15K05H753', 1.196, 1.042, 0.41, 1.034, 1.074, 0.457, 1.196, 1.042, 0.41, 'Konsentrasi Rendah', '2023-08-23 22:40:50', 'HERLAN SUHERLAN'),
(9, 'BDO14D05Z100', 1.516, 2.259, 0.512, 1.193, 1.231, 0.411, 1.516, 2.259, 0.512, 'Konsentrasi Tinggi', '2023-08-23 22:41:21', 'ZAINAL ABIDIN'),
(10, 'BDO14D05Z100', 1.844, 1.559, 0.569, 1.213, 1.036, 0.482, 1.844, 1.559, 0.569, 'Konsentrasi Rendah', '2023-08-23 22:41:40', 'ZAINAL ABIDIN'),
(11, 'BDO14D05Z100', 1.844, 1.559, 0.569, 1.213, 1.036, 0.482, 1.844, 1.559, 0.569, 'Konsentrasi Rendah', '2023-08-23 22:42:00', 'ZAINAL ABIDIN'),


-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `nip` varchar(8) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`nip`, `nama_pegawai`, `password`) VALUES
('admin', 'Aditya Firmansyah', 'admin'),
('BDO13K05', 'Aditya Firmansyah', '21232f297a57a5a743894a0e4a801fc3');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `gelombang_otak`
--
ALTER TABLE `gelombang_otak`
  ADD PRIMARY KEY (`id_gelombang`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`nip`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `gelombang_otak`
--
ALTER TABLE `gelombang_otak`
  MODIFY `id_gelombang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
