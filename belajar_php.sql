-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2021 at 04:56 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `belajar_php`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(5) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `nama_buku` varchar(255) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `foto`, `nama_buku`, `deskripsi`) VALUES
(7, '5352-html5_102567.png', 'html', 'ini buku'),
(8, '5352-html5_102567.png', 'html', 'ini merukaan buku html'),
(9, 'kisspng-javascript-computer-icons-scalable-vector-graphics-list-of-javascript-enhancements-fandom-developers-5d145895da3992.0726245815616144858939.png', 'css', 'sdf');

-- --------------------------------------------------------

--
-- Table structure for table `detail_peminjaman_buku`
--

CREATE TABLE `detail_peminjaman_buku` (
  `id_peminjaman_buku` int(10) DEFAULT NULL,
  `id_buku` int(10) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `id_detail` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_peminjaman_buku`
--

INSERT INTO `detail_peminjaman_buku` (`id_peminjaman_buku`, `id_buku`, `qty`, `id_detail`) VALUES
(7, 8, 1, 1),
(8, 8, 1, 2),
(9, 8, 1, 3),
(10, 8, 1, 4),
(11, 8, 1, 5),
(12, 8, 1, 6),
(13, 8, 1, 7),
(14, 8, 1, 8),
(15, 7, 1, 9),
(16, 8, 1, 10),
(17, 8, 1, 11),
(18, 8, 6, 12),
(19, 8, 1, 13),
(20, 8, 1, 14),
(21, 8, 1, 15),
(22, 9, 1, 16),
(23, 9, 1, 17),
(24, 7, 1, 18),
(25, 8, 1, 19),
(26, 8, 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `histori`
--

CREATE TABLE `histori` (
  `id_histori` int(10) NOT NULL,
  `tanggal_pinjam` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(20) DEFAULT NULL,
  `kelompok` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `kelompok`) VALUES
(1, 'XIRPL1', 'Red Bull'),
(3, 'XIRPL2', 'Black Bull');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman_buku`
--

CREATE TABLE `peminjaman_buku` (
  `id_siswa` int(5) DEFAULT NULL,
  `tanggal_pinjam` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `id_peminjaman_buku` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peminjaman_buku`
--

INSERT INTO `peminjaman_buku` (`id_siswa`, `tanggal_pinjam`, `tanggal_kembali`, `id_peminjaman_buku`) VALUES
(3, '2021-09-17', '2021-09-22', 21),
(3, '2021-09-17', '2021-09-22', 22),
(3, '2021-09-17', '2021-09-22', 23),
(3, '2021-09-26', '2021-10-01', 24),
(3, '2021-09-26', '2021-10-01', 25),
(3, '2021-09-26', '2021-10-01', 26);

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian_buku`
--

CREATE TABLE `pengembalian_buku` (
  `id_pengembalian_buku` int(10) NOT NULL,
  `id_peminjaman_buku` int(11) DEFAULT NULL,
  `tanggal_pengembalian` date DEFAULT NULL,
  `denda` int(33) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengembalian_buku`
--

INSERT INTO `pengembalian_buku` (`id_pengembalian_buku`, `id_peminjaman_buku`, `tanggal_pengembalian`, `denda`) VALUES
(1, 0, '2021-09-17', 0),
(2, 21, '2021-09-17', 0),
(3, 22, '2021-09-17', 0),
(4, 23, '2021-09-17', 0),
(5, 24, '2021-09-26', 0),
(6, 25, '2021-09-26', 0),
(7, 26, '2021-09-26', 0);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nama_siswa` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `gender` enum('L','P') DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nama_siswa`, `tanggal_lahir`, `gender`, `alamat`, `username`, `password`, `id_kelas`) VALUES
(1, 'muhammad arya firmansyah', '2021-08-20', 'L', 'parimono', 'aryfrmnsyh', '827ccb0eea8a706c4c34a16891f84e7b', 0),
(2, 'muhammad arya ', '2021-08-20', 'L', 'jombang', 'aryafirmansyah', '827ccb0eea8a706c4c34a16891f84e7b', 0),
(3, ' arya firmansyah', '2021-08-20', 'L', 'plandi', 'aryfrmnsyh', 'e10adc3949ba59abbe56e057f20f883e', 0),
(5, ' arya firmansyah', '2004-04-20', 'L', 'Jombang', 'aryfrmnsyh', '827ccb0eea8a706c4c34a16891f84e7b', 1),
(6, 'arya', '2021-09-09', 'L', 'plio', 'aryfrmnsyh', 'e10adc3949ba59abbe56e057f20f883e', 3),
(7, ' arya firmansyah', '2021-09-17', 'L', 'asd', 'aryfrmnsyh', '81dc9bdb52d04dc20036dbd8313ed055', 1),
(8, ' arya firmansyah', '2021-09-17', 'L', 'asd', 'aryfrmnsyh', 'b3ddbc502e307665f346cbd6e52cc10d', 3),
(9, 'muhammad arya firmansyah', '2021-09-17', 'L', 'asd', 'aasd', 'a8f5f167f44f4964e6c998dee827110c', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `detail_peminjaman_buku`
--
ALTER TABLE `detail_peminjaman_buku`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `histori`
--
ALTER TABLE `histori`
  ADD PRIMARY KEY (`id_histori`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `peminjaman_buku`
--
ALTER TABLE `peminjaman_buku`
  ADD PRIMARY KEY (`id_peminjaman_buku`);

--
-- Indexes for table `pengembalian_buku`
--
ALTER TABLE `pengembalian_buku`
  ADD PRIMARY KEY (`id_pengembalian_buku`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `detail_peminjaman_buku`
--
ALTER TABLE `detail_peminjaman_buku`
  MODIFY `id_detail` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `histori`
--
ALTER TABLE `histori`
  MODIFY `id_histori` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `peminjaman_buku`
--
ALTER TABLE `peminjaman_buku`
  MODIFY `id_peminjaman_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `pengembalian_buku`
--
ALTER TABLE `pengembalian_buku`
  MODIFY `id_pengembalian_buku` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
