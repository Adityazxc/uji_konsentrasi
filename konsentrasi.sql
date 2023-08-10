-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Agu 2023 pada 11.39
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
-- Struktur dari tabel `gelombangotak`
--

CREATE TABLE `gelombangotak` (
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
  `tingkatKonsentrasi` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `gelombangotak`
--

INSERT INTO `gelombangotak` (`id_gelombang`, `nip`, `rA`, `rB`, `rG`, `stdA`, `stdB`, `stdG`, `absA`, `absB`, `absG`, `tingkatKonsentrasi`) VALUES
(11, 10119182, 0.081764, 0.096015, 0.045201, 0.06558, 0.056296, 0.038119, 0.052543, 0.043369, 0.028479, 'Konsentrasi Tinggi'),
(12, 10119182, 0.036466, 0.124103, 0.032785, 0.046595, 0.067708, 0.024707, 0.02581, 0.053476, 0.015274, 'Konsentrasi Tinggi'),
(13, 10119182, 0.04231, 0.103397, 0.068093, 0.040033, 0.060831, 0.038097, 0.022591, 0.044865, 0.030454, 'Konsentrasi Tinggi'),
(14, 10119182, 0.061922, 0.021998, 0.017235, 0.059955, 0.038839, 0.023667, 0.043413, 0.016671, 0.011241, 'Konsentrasi Rendah'),
(15, 10119182, 0.042689, 0.026401, 0.016038, 0.0573, 0.0395, 0.029517, 0.039024, 0.020422, 0.015676, 'Konsentrasi Rendah'),
(16, 10119182, 0.081764, 0.096015, 0.045201, 0.06558, 0.056296, 0.038119, 0.052543, 0.043369, 0.028479, 'Konsentrasi Tinggi'),
(17, 10119182, 0.066219, 0.08647, 0.058151, 0.059604, 0.066545, 0.042037, 0.045801, 0.054037, 0.035122, 'Konsentrasi Tinggi'),
(18, 10119182, 0.053367, 0.048471, 0.029864, 0.058572, 0.056344, 0.035242, 0.042241, 0.039502, 0.024312, 'Konsentrasi Rendah'),
(19, 10119182, 0.081764, 0.096015, 0.045201, 0.06558, 0.056296, 0.038119, 0.052543, 0.043369, 0.028479, 'Konsentrasi Tinggi'),
(20, 10119182, 0.022965, 0.017765, 0.037356, 0.043306, 0.046428, 0.038011, 0.024705, 0.02095, 0.029305, 'Konsentrasi Rendah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `nip` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `departemen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`nip`, `nama`, `departemen`) VALUES
(10119182, 'Aditya Firmansyah', 'Human Capital');

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
-- Indeks untuk tabel `gelombangotak`
--
ALTER TABLE `gelombangotak`
  ADD PRIMARY KEY (`id_gelombang`),
  ADD KEY `nip` (`nip`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nip`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`nip`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `gelombangotak`
--
ALTER TABLE `gelombangotak`
  MODIFY `id_gelombang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `gelombangotak`
--
ALTER TABLE `gelombangotak`
  ADD CONSTRAINT `gelombangotak_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
