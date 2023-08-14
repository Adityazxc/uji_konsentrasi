-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Agu 2023 pada 03.42
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
  `nip` int(11) DEFAULT NULL,
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
  `nama_pegawai` varchar(100) DEFAULT NULL,
  `departemen` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `gelombang_otak`
--

INSERT INTO `gelombang_otak` (`id_gelombang`, `nip`, `rA`, `rB`, `rG`, `stdA`, `stdB`, `stdG`, `absA`, `absB`, `absG`, `tingkat_konsentrasi`, `tanggal`, `nama_pegawai`, `departemen`) VALUES
(1, 123, 0.0425062, 0.0271026, 0.0161145, 0.0568385, 0.0395507, 0.0292761, 0.0425062, 0.0271026, 0.0161145, 'Konsentrasi Rendah', '2023-08-10 19:44:04', 'jul', 'information_technology'),
(2, 1234, 0.0613207, 0.0219038, 0.0172067, 0.0596386, 0.0385206, 0.0234698, 0.0613207, 0.0219038, 0.0172067, 'Konsentrasi Tinggi', '2023-08-10 19:44:23', 'enjul', 'information_technology'),
(3, 1234, 0.0613207, 0.0219038, 0.0172067, 0.0596386, 0.0385206, 0.0234698, 0.0613207, 0.0219038, 0.0172067, 'Konsentrasi Tinggi', '2023-08-10 19:44:39', 'enjul', 'information_technology'),
(4, 1234, 0.0613207, 0.0219038, 0.0172067, 0.0596386, 0.0385206, 0.0234698, 0.0613207, 0.0219038, 0.0172067, 'Konsentrasi Tinggi', '2023-08-10 19:44:44', 'enjul', 'information_technology'),
(5, 456, 0.0818572, 0.0950276, 0.0449112, 0.0650357, 0.0563559, 0.0378672, 0.0818572, 0.0950276, 0.0449112, 'Konsentrasi Tinggi', '2023-08-10 19:45:58', 'aaaa', 'information_technology'),
(6, 456, 0.0818572, 0.0950276, 0.0449112, 0.0650357, 0.0563559, 0.0378672, 0.0818572, 0.0950276, 0.0449112, 'Konsentrasi Tinggi', '2023-08-10 19:46:02', 'aaaa', 'information_technology'),
(7, 10119182, 0.0370418, 0.124241, 0.0331913, 0.0464236, 0.0671498, 0.0247047, 0.0370418, 0.124241, 0.0331913, 'Konsentrasi Rendah', '2023-08-10 20:25:42', 'hey jule', 'information_technology'),
(8, 10119182, 0.0370418, 0.124241, 0.0331913, 0.0464236, 0.0671498, 0.0247047, 0.0370418, 0.124241, 0.0331913, 'Konsentrasi Rendah', '2023-08-10 20:28:15', 'hey jule', 'information_technology'),
(9, 10119182, 0.0370418, 0.124241, 0.0331913, 0.0464236, 0.0671498, 0.0247047, 0.0370418, 0.124241, 0.0331913, 'Konsentrasi Rendah', '2023-08-10 20:30:04', 'hey jule', 'information_technology'),
(10, 10119182, 0.0370418, 0.124241, 0.0331913, 0.0464236, 0.0671498, 0.0247047, 0.0370418, 0.124241, 0.0331913, 'Konsentrasi Rendah', '2023-08-10 20:30:58', 'hey jule', 'information_technology'),
(11, 10119182, 0.0370418, 0.124241, 0.0331913, 0.0464236, 0.0671498, 0.0247047, 0.0370418, 0.124241, 0.0331913, 'Konsentrasi Rendah', '2023-08-10 20:33:17', 'hey jule', 'information_technology'),
(12, 10119182, 0.0370418, 0.124241, 0.0331913, 0.0464236, 0.0671498, 0.0247047, 0.0370418, 0.124241, 0.0331913, 'Konsentrasi Rendah', '2023-08-10 20:33:54', 'hey jule', 'information_technology'),
(13, 10119182, 0.0370418, 0.124241, 0.0331913, 0.0464236, 0.0671498, 0.0247047, 0.0370418, 0.124241, 0.0331913, 'Konsentrasi Rendah', '2023-08-10 20:47:47', 'hey jule', 'information_technology'),
(14, 10119182, 0.0370418, 0.124241, 0.0331913, 0.0464236, 0.0671498, 0.0247047, 0.0370418, 0.124241, 0.0331913, 'Konsentrasi Rendah', '2023-08-10 20:52:20', 'hey jule', 'information_technology'),
(15, 10119182, 0.0370418, 0.124241, 0.0331913, 0.0464236, 0.0671498, 0.0247047, 0.0370418, 0.124241, 0.0331913, 'Konsentrasi Rendah', '2023-08-10 20:54:19', 'hey jule', 'information_technology'),
(16, 10119182, 0.0370418, 0.124241, 0.0331913, 0.0464236, 0.0671498, 0.0247047, 0.0370418, 0.124241, 0.0331913, 'Konsentrasi Rendah', '2023-08-10 20:54:26', 'hey jule', 'information_technology'),
(17, 10119182, 0.0370418, 0.124241, 0.0331913, 0.0464236, 0.0671498, 0.0247047, 0.0370418, 0.124241, 0.0331913, 'Konsentrasi Rendah', '2023-08-10 20:57:56', 'hey jule', 'information_technology'),
(18, 10119182, 0.0370418, 0.124241, 0.0331913, 0.0464236, 0.0671498, 0.0247047, 0.0370418, 0.124241, 0.0331913, 'Konsentrasi Rendah', '2023-08-10 21:00:21', 'hey jule', 'information_technology'),
(19, 10119182, 0.0370418, 0.124241, 0.0331913, 0.0464236, 0.0671498, 0.0247047, 0.0370418, 0.124241, 0.0331913, 'Konsentrasi Rendah', '2023-08-10 21:01:36', 'hey jule', 'information_technology'),
(20, 10119182, 0.0370418, 0.124241, 0.0331913, 0.0464236, 0.0671498, 0.0247047, 0.0370418, 0.124241, 0.0331913, 'Konsentrasi Rendah', '2023-08-10 21:06:14', 'hey jule', 'information_technology'),
(21, 10119182, 0.0370418, 0.124241, 0.0331913, 0.0464236, 0.0671498, 0.0247047, 0.0370418, 0.124241, 0.0331913, 'Konsentrasi Rendah', '2023-08-10 21:11:02', 'hey jule', 'information_technology'),
(22, 10119182, 0.0370418, 0.124241, 0.0331913, 0.0464236, 0.0671498, 0.0247047, 0.0370418, 0.124241, 0.0331913, 'Konsentrasi Rendah', '2023-08-10 23:22:45', 'hey jule', 'information_technology'),
(23, 10119182, 0.0370418, 0.124241, 0.0331913, 0.0464236, 0.0671498, 0.0247047, 0.0370418, 0.124241, 0.0331913, 'Konsentrasi Rendah', '2023-08-10 23:24:24', 'hey jule', 'information_technology'),
(24, 10119182, 0.0370418, 0.124241, 0.0331913, 0.0464236, 0.0671498, 0.0247047, 0.0370418, 0.124241, 0.0331913, 'Konsentrasi Rendah', '2023-08-10 23:26:06', 'hey jule', 'information_technology'),
(25, 10119182, 0.0370418, 0.124241, 0.0331913, 0.0464236, 0.0671498, 0.0247047, 0.0370418, 0.124241, 0.0331913, 'Konsentrasi Rendah', '2023-08-10 23:26:19', 'hey jule', 'information_technology'),
(26, 10119182, 0.0370418, 0.124241, 0.0331913, 0.0464236, 0.0671498, 0.0247047, 0.0370418, 0.124241, 0.0331913, 'Konsentrasi Rendah', '2023-08-10 23:32:28', 'hey jule', 'information_technology'),
(27, 1019293, 0.0613207, 0.0219038, 0.0172067, 0.0596386, 0.0385206, 0.0234698, 0.0613207, 0.0219038, 0.0172067, 'Konsentrasi Tinggi', '2023-08-11 01:37:49', 'Adit', 'information_technology'),
(28, 1019293, 0.0613207, 0.0219038, 0.0172067, 0.0596386, 0.0385206, 0.0234698, 0.0613207, 0.0219038, 0.0172067, 'Konsentrasi Tinggi', '2023-08-11 01:39:55', 'Adit', 'information_technology'),
(29, 1, 0.0613207, 0.0219038, 0.0172067, 0.0596386, 0.0385206, 0.0234698, 0.0613207, 0.0219038, 0.0172067, 'Konsentrasi Tinggi', '2023-08-11 01:40:02', 'w', 'information_technology'),
(30, 1, 0.0613207, 0.0219038, 0.0172067, 0.0596386, 0.0385206, 0.0234698, 0.0613207, 0.0219038, 0.0172067, 'Konsentrasi Tinggi', '2023-08-11 02:04:57', 'w', 'information_technology'),
(31, 1, 0.0613207, 0.0219038, 0.0172067, 0.0596386, 0.0385206, 0.0234698, 0.0613207, 0.0219038, 0.0172067, 'Konsentrasi Tinggi', '2023-08-11 02:05:44', 'w', 'information_technology'),
(32, 1, 0.0613207, 0.0219038, 0.0172067, 0.0596386, 0.0385206, 0.0234698, 0.0613207, 0.0219038, 0.0172067, 'Konsentrasi Tinggi', '2023-08-11 02:05:55', 'w', 'information_technology'),
(33, 1, 0.0613207, 0.0219038, 0.0172067, 0.0596386, 0.0385206, 0.0234698, 0.0613207, 0.0219038, 0.0172067, 'Konsentrasi Tinggi', '2023-08-11 02:06:02', 'w', 'information_technology'),
(34, 1, 0.0613207, 0.0219038, 0.0172067, 0.0596386, 0.0385206, 0.0234698, 0.0613207, 0.0219038, 0.0172067, 'Konsentrasi Tinggi', '2023-08-11 02:06:16', 'w', 'information_technology'),
(35, 1, 0.0613207, 0.0219038, 0.0172067, 0.0596386, 0.0385206, 0.0234698, 0.0613207, 0.0219038, 0.0172067, 'Konsentrasi Tinggi', '2023-08-11 02:09:26', 'w', 'information_technology'),
(36, 1, 0.0613207, 0.0219038, 0.0172067, 0.0596386, 0.0385206, 0.0234698, 0.0613207, 0.0219038, 0.0172067, 'Konsentrasi Tinggi', '2023-08-11 02:09:59', 'w', 'information_technology');

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
('admin', 'Aditya Firmansyah', 'admin');

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
  MODIFY `id_gelombang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
