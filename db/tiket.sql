-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Jul 2020 pada 19.32
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tiket`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kereta`
--

CREATE TABLE `kereta` (
  `id_ka` varchar(10) NOT NULL,
  `namka` varchar(20) NOT NULL,
  `stasiun` varchar(50) NOT NULL,
  `harga` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kereta`
--

INSERT INTO `kereta` (`id_ka`, `namka`, `stasiun`, `harga`) VALUES
('3', 'MALABAR', 'MALANG MADIUN YOGYAKARTA PURWOKERTO BANDUNG', 100000),
('4', 'ARGO BROMO', 'SURABAYA SEMARANG CIREBON JAKARTA', 100000),
('1', 'ARGO LAWU', 'MALANG MADIUN YOGYAKARTA PURWOKERTO CIREBON JAKART', 100000),
('2', 'ARGO DWIPANGGA', 'MALANG MADIUN YOGYAKARTA PURWOKERTO CIREBON JAKART', 100000),
('5', 'SERAYU', 'PURWOKERTO CIREBON JAKARTA', 100000),
('6', 'SEMBRANI', 'JAKARTA CIREBON SEMARANG SURABAYA', 100000),
('7', 'SENJA UTAMA SOLO', 'SURAKARTA YOGYAKARTA PURWOKERTO CIREBON JAKARTA', 100000),
('8', 'ARGO PARAHYANGAN', 'BANDUNG JAKARTA', 100000),
('9', 'JOGLOSEMARKERTO', 'PURWOKERTO YOGYAKARTA SURAKARTA SEMARANG', 100000),
('10', 'ARGO JATI', 'JAKARTA CIREBON', 100000),
('11', 'SENJA UTAMA YOGYA', 'YOGYAKARTA PURWOKERTO', 500000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `stat`
--

CREATE TABLE `stat` (
  `id_stat` int(11) NOT NULL,
  `namstat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `stat`
--

INSERT INTO `stat` (`id_stat`, `namstat`) VALUES
(2, 'SERANG'),
(3, 'BOGOR'),
(4, 'BANDUNG'),
(5, 'CIREBON'),
(6, 'SEMARANG'),
(7, 'TEGAL'),
(8, 'PURWOKERTO'),
(9, 'YOGYAKARTA'),
(10, 'SURAKARTA'),
(11, 'MADIUN'),
(12, 'BLITAR'),
(13, 'SURABAYA'),
(14, 'MALANG'),
(15, 'JEMBER'),
(17, 'BANYUWANGI'),
(18, 'JAKARTA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `usr_id` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`usr_id`, `email`, `password`) VALUES
(1, 'admin@ceguk.com', 'qwert1234'),
(2, 'vguhv', 'HVJHVKVKGV');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `stat`
--
ALTER TABLE `stat`
  ADD PRIMARY KEY (`id_stat`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`usr_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `stat`
--
ALTER TABLE `stat`
  MODIFY `id_stat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `usr_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
