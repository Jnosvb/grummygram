-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2024 at 07:53 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grumpgramapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catatan_harian`
--

CREATE TABLE `catatan_harian` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_catatan_detail` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `catatan_harian`
--

INSERT INTO `catatan_harian` (`id`, `id_user`, `id_catatan_detail`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2024-12-22 03:22:29', '2024-12-22 03:22:29'),
(2, 3, 2, '2024-12-29 05:58:32', '2024-12-29 05:58:32'),
(3, 3, 3, '2024-12-29 08:55:07', '2024-12-29 08:55:07'),
(4, 3, 4, '2024-12-29 09:00:07', '2024-12-29 09:00:07'),
(5, 3, 5, '2024-12-29 09:03:36', '2024-12-29 09:03:36'),
(6, 3, 6, '2024-12-29 10:37:08', '2024-12-29 10:37:08'),
(7, 3, 7, '2024-12-29 10:44:55', '2024-12-29 10:44:55'),
(8, 3, 8, '2024-12-29 10:45:29', '2024-12-29 10:45:29'),
(9, 3, 9, '2024-12-29 10:47:31', '2024-12-29 10:47:31'),
(10, 3, 10, '2024-12-29 10:48:14', '2024-12-29 10:48:14'),
(11, 3, 11, '2024-12-29 10:49:02', '2024-12-29 10:49:02'),
(12, 3, 12, '2024-12-29 10:49:47', '2024-12-29 10:49:47'),
(13, 5, 13, '2024-12-29 11:05:16', '2024-12-29 11:05:16'),
(14, 5, 14, '2024-12-29 11:12:47', '2024-12-29 11:12:47'),
(15, 5, 15, '2024-12-29 11:17:08', '2024-12-29 11:17:08'),
(16, 5, 16, '2024-12-29 11:19:34', '2024-12-29 11:19:34'),
(17, 5, 17, '2024-12-29 11:21:18', '2024-12-29 11:21:18'),
(18, 5, 18, '2024-12-29 11:21:49', '2024-12-29 11:21:49'),
(19, 5, 19, '2024-12-29 11:22:18', '2024-12-29 11:22:18'),
(20, 5, 20, '2024-12-29 11:24:12', '2024-12-29 11:24:12'),
(21, 5, 21, '2024-12-29 11:27:24', '2024-12-29 11:27:24'),
(22, 5, 22, '2024-12-29 11:28:29', '2024-12-29 11:28:29'),
(23, 5, 23, '2024-12-29 11:31:12', '2024-12-29 11:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `catatan_harian_detail`
--

CREATE TABLE `catatan_harian_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(100) NOT NULL,
  `kegiatan` text NOT NULL,
  `id_mood` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `catatan_harian_detail`
--

INSERT INTO `catatan_harian_detail` (`id`, `judul`, `kegiatan`, `id_mood`, `created_at`, `updated_at`) VALUES
(1, 'Capaie', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Impedit, provident commodi. Esse nostrum ut commodi accusamus labore nobis consectetur eligendi, nemo, fuga illo sequi repellat repudiandae a laborum maiores veritatis rem optio nisi at amet explicabo? Amet culpa necessitatibus quia.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic beatae omnis minus. Adipisci, ipsum? Eveniet quos ipsa repudiandae dignissimos. Laudantium, repellendus! Vel consequatur quo voluptatibus esse sint, soluta quod molestias exercitationem itaque. Quam officia deserunt praesentium, quos perferendis laboriosam distinctio quia corrupti aut, ex modi quo voluptatibus at recusandae, temporibus autem voluptates quisquam laudantium earum. Corrupti iste ducimus rerum magnam et quos cum suscipit fugiat repellendus minus veritatis, in neque vero accusamus pariatur numquam ullam consequuntur laboriosam, expedita dolorem voluptatum magni. Fugit eligendi harum veritatis, magnam natus molestiae ea quos nemo numquam tempora? Rerum eos sed in sapiente! Minus, dicta?', 10, '2024-12-22 03:22:29', '2024-12-22 03:22:29'),
(2, 'Hari Ini Apa', 'Apakah Iya', 4, '2024-12-29 05:58:32', '2024-12-29 05:58:32'),
(3, 'apaaaa', 'apaaaaaaaaaaaa', 5, '2024-12-29 08:55:07', '2024-12-29 08:55:07'),
(4, 'conr', 'cobelok ininyaaaq', 3, '2024-12-29 09:00:07', '2024-12-29 09:00:07'),
(5, 'dropp', 'paktsiahsbxbuxknqxiwnxwxbiexniex', 12, '2024-12-29 09:03:36', '2024-12-29 09:03:36'),
(6, 'isee somthing', 'omaii apa ya yg kulihat', 4, '2024-12-29 10:37:08', '2024-12-29 10:37:08'),
(7, 'i havy', 'hshahahahahaha', 1, '2024-12-29 10:44:55', '2024-12-29 10:44:55'),
(8, 'hizbwixviax', 'hibwwbixbwixb', 10, '2024-12-29 10:45:29', '2024-12-29 10:45:29'),
(9, 'shsjsj', 'ssgshsuis', 13, '2024-12-29 10:47:31', '2024-12-29 10:47:31'),
(10, 'hihsibi', 'nv,js j, j', 13, '2024-12-29 10:48:14', '2024-12-29 10:48:14'),
(11, 'kv jg jg', 'gixig jg jg jg', 15, '2024-12-29 10:49:02', '2024-12-29 10:49:02'),
(12, 'ipbi,u', 'ibziwbxiwbizwn', 2, '2024-12-29 10:49:47', '2024-12-29 10:49:47'),
(13, 'apa dhlu', 'sbsjsjabsbsbs', 1, '2024-12-29 11:05:16', '2024-12-29 11:05:16'),
(14, 'jobs,bsqo', 'ouso,bossosqwd', 3, '2024-12-29 11:12:47', '2024-12-29 11:12:47'),
(15, 'igxiyxih', 'jfzitxig', 3, '2024-12-29 11:17:08', '2024-12-29 11:17:08'),
(16, 'igviyvis', 'jl sqh sqso, sqsq', 7, '2024-12-29 11:19:34', '2024-12-29 11:19:34'),
(17, 'jfzjgxiy', 'iyxiyxiyxiyxiyxiy', 6, '2024-12-29 11:21:18', '2024-12-29 11:21:18'),
(18, 'kydkyzkgxkg', 'oydysoyziyx', 2, '2024-12-29 11:21:49', '2024-12-29 11:21:49'),
(19, 'kgziyxig', 'oyziyxig', 7, '2024-12-29 11:22:18', '2024-12-29 11:22:18'),
(20, 'yrzyrzyrz', 'jf,hf,uf', 13, '2024-12-29 11:24:12', '2024-12-29 11:24:12'),
(21, 'ktzitxixgi ih ih', 'oycoyxoyxx yicyc', 11, '2024-12-29 11:27:24', '2024-12-29 11:27:24'),
(22, 'mgiyckgxkh', 'oyxoyxiyxiyx', 11, '2024-12-29 11:28:29', '2024-12-29 11:28:29'),
(23, 'jgg', 'kh k', 13, '2024-12-29 11:31:12', '2024-12-29 11:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_mood`
--

CREATE TABLE `kategori_mood` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kategori_mood` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori_mood`
--

INSERT INTO `kategori_mood` (`id`, `kategori_mood`, `created_at`, `updated_at`) VALUES
(1, 'Positif', NULL, NULL),
(2, 'Negatif', NULL, NULL),
(3, 'Netral', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_11_18_140951_create_user_detail_table', 1),
(7, '2024_11_18_141631_create_kategori_mood_table', 1),
(8, '2024_11_18_141707_create_catatan_detail_table', 1),
(9, '2024_11_18_141708_create_catatan_table', 1),
(10, '2024_11_18_141907_create_user_personal_data_table', 1),
(11, '2024_11_18_141908_create_rekomen_kegiatan_table', 1),
(12, '2024_12_18_164402_create_mood_table', 2),
(13, '2024_12_22_085713_add_id_kategori_mood_to_catatan_harian_table', 3),
(14, '2024_12_22_090004_remove_id_kategori_mood_from_catatan_harian_detail_table', 4),
(15, '2024_12_22_095613_remove_id_kategori_mood_from_catatan_harian_table', 5),
(16, '2024_12_22_095805_add_id__mood_to_catatan_harian_table', 6),
(17, '2024_12_22_095947_remove_id_mood_from_catatan_harian_table', 7),
(18, '2024_12_22_100040_add_id_mood_to_catatan_harian_table', 8),
(19, '2024_12_29_085731_add_judul_to_catatan_harian_detail_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `mood`
--

CREATE TABLE `mood` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_kategori_mood` bigint(20) UNSIGNED NOT NULL,
  `detail_mood` varchar(15) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mood`
--

INSERT INTO `mood` (`id`, `id_kategori_mood`, `detail_mood`, `icon`, `created_at`, `updated_at`) VALUES
(1, 1, 'Bahagia', 'bahagia.gif', '2024-12-18 16:55:43', '2024-12-18 16:55:43'),
(2, 1, 'Bersemangat', 'bersemangat.gif', '2024-12-18 16:55:43', '2024-12-18 16:55:43'),
(3, 1, 'Damai', 'damai.gif', '2024-12-18 16:55:43', '2024-12-18 16:55:43'),
(4, 1, 'Percaya Diri', 'percayadiri.gif', '2024-12-18 16:55:43', '2024-12-18 16:55:43'),
(5, 1, 'Cinta', 'love.gif', '2024-12-18 16:55:43', '2024-12-18 16:55:43'),
(6, 2, 'Sedih', 'sedih.gif', '2024-12-18 16:55:43', '2024-12-18 16:55:43'),
(7, 2, 'Marah', 'marah.gif', '2024-12-18 16:55:43', '2024-12-18 16:55:43'),
(8, 2, 'Kecewa', 'kecewa.gif', '2024-12-18 16:55:43', '2024-12-18 16:55:43'),
(9, 2, 'Cemas', 'cemas.gif', '2024-12-18 16:55:43', '2024-12-18 16:55:43'),
(10, 2, 'Frustasi', 'frustasi.gif', '2024-12-18 16:55:43', '2024-12-18 16:55:43'),
(11, 3, 'Tenang', 'tenang.gif', '2024-12-18 16:55:43', '2024-12-18 16:55:43'),
(12, 3, 'Ragu-ragu', 'raguragu.gif', '2024-12-18 16:55:43', '2024-12-18 16:55:43'),
(13, 3, 'Bosan', 'bosan.gif', '2024-12-18 16:55:43', '2024-12-18 16:55:43'),
(14, 3, 'Lelah', 'lelah.gif', '2024-12-18 16:55:43', '2024-12-18 16:55:43'),
(15, 3, 'Biasa Saja', 'biasasaja.gif', '2024-12-18 16:55:43', '2024-12-18 16:55:43');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'auth_token', '51a4b5ab0d271e08eba17acc07a80c0b22b174e55983a176b44fe208ed703c07', '[\"*\"]', '2024-12-29 02:57:08', NULL, '2024-12-22 02:19:38', '2024-12-29 02:57:08'),
(2, 'App\\Models\\User', 6, 'auth_token', '3fe8e6f4d018beff600b6c508820c7df53c15b826b3a2394af85d497788a5364', '[\"*\"]', '2024-12-24 21:57:12', NULL, '2024-12-24 21:57:11', '2024-12-24 21:57:12'),
(3, 'App\\Models\\User', 6, 'auth_token', 'e454af03e49714bce32982c1b2f881a55aa8c02ae3e53fcd808023dfe56fedc7', '[\"*\"]', '2024-12-24 22:11:18', NULL, '2024-12-24 22:11:16', '2024-12-24 22:11:18'),
(5, 'App\\Models\\User', 6, 'auth_token', '98dfef37a46444ab4a205f6bee88dc561bdf6378abfabfd9796950bd5f8e90bf', '[\"*\"]', '2024-12-24 22:29:52', NULL, '2024-12-24 22:29:41', '2024-12-24 22:29:52'),
(7, 'App\\Models\\User', 5, 'auth_token', 'f7b46ffbd675ddb49b377e4d04e4026160453364e907a194016e2b8aea9d9a8a', '[\"*\"]', '2024-12-26 08:42:27', NULL, '2024-12-26 05:54:39', '2024-12-26 08:42:27'),
(8, 'App\\Models\\User', 5, 'auth_token', '2147b95d1bd8441123c20ef234ddcf766899a5db55b810f821e88a42397521b2', '[\"*\"]', '2024-12-26 11:27:03', NULL, '2024-12-26 11:26:59', '2024-12-26 11:27:03'),
(9, 'App\\Models\\User', 5, 'auth_token', 'bde25cfc46ff73b0421e67758f4e84c24af2eaa00a46cc711dc06968de51961b', '[\"*\"]', '2024-12-26 21:53:24', NULL, '2024-12-26 21:53:22', '2024-12-26 21:53:24'),
(10, 'App\\Models\\User', 5, 'auth_token', '8f038ddb372fb618df0f19a6517ceff2f2f9f19b56b1d10b1ba28caeb8387566', '[\"*\"]', '2024-12-27 02:13:12', NULL, '2024-12-27 02:13:10', '2024-12-27 02:13:12'),
(13, 'App\\Models\\User', 5, 'auth_token', '78ebc0c4807c9eaea2466d8b4566b1c831e496957520206c1f65244766be1fe0', '[\"*\"]', NULL, NULL, '2024-12-28 13:09:27', '2024-12-28 13:09:27'),
(18, 'App\\Models\\User', 3, 'auth_token', '822eba6b0656621ea67c6f97a1acc37c98ee80aaa6e65f009e2fb36aa8a1d24f', '[\"*\"]', '2024-12-29 08:56:01', NULL, '2024-12-29 03:06:53', '2024-12-29 08:56:01'),
(23, 'App\\Models\\User', 5, 'auth_token', 'efb06c3f806454ab4d826eb9aa179614eb893fce565a3964cc63f9595fe9e927', '[\"*\"]', '2024-12-29 11:38:13', NULL, '2024-12-29 11:05:04', '2024-12-29 11:38:13');

-- --------------------------------------------------------

--
-- Table structure for table `rekomen_kegiatan`
--

CREATE TABLE `rekomen_kegiatan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_kategori_mood` bigint(20) UNSIGNED NOT NULL,
  `kegiatan` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('7cLhyEbsPTaDoYZQbhOdLOjDPadXpSSl72qTVF0Y', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWE83cGRUelhYM0xUV2k4S21zZHFpVE9iRk95TG1zTWR6RzRDRk40biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1735399759),
('KCzA1hjNx53gULFqXTZ0Qq2TEP6FdYsbG7eSmGFl', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiR1F2TXd6bFJ0SnRDTncxOUlmQzE0dW1yOEpqUHo5d21tYWdQOURGZyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI5OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvaHVnZ2luZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzM0ODU1MTYyO31zOjIwOiJjb252ZXJzYXRpb25faGlzdG9yeSI7YToyOntpOjA7YToyOntzOjQ6InJvbGUiO3M6NDoidXNlciI7czo3OiJjb250ZW50IjtzOjcxOiJiZXJpa2FuIHNheWEgc2F0dSBrZWdpYXRhbiB1bnR1ayBtb29kIHlhbmcgc2VkYW5nIGJpYXNhIHNhamEgZGloYXJpIGluaSI7fWk6MTthOjI6e3M6NDoicm9sZSI7czo5OiJhc3Npc3RhbnQiO3M6NzoiY29udGVudCI7czoxMTM4OiJUZW50dSBzYWphISBKaWthIG1vb2QgQW5kYSBzZWRhbmcgYmlhc2Egc2FqYSwgYmVyaWt1dCBhZGFsYWggYmViZXJhcGEga2VnaWF0YW4geWFuZyBiaXNhIEFuZGEgbGFrdWthbiB1bnR1ayBtZW1iYXdhIHNlZGlraXQga2ViYWhhZ2lhYW4gYXRhdSBrZWdlbWJpcmFhbiBrZSBkYWxhbSBoYXJpYW4gQW5kYToKCjEuIE1lbmdhbWJpbCBVc2lyOiBKaWthIGN1YWNhIGJhaWssIHBlcmdpIGJlcmphbGFuLWphbGFuIGRpIHRlbXBhdCB5YW5nIGluZGFoIGF0YXUgc2VrZWRhciBtZW5pa21hdGkga2V0ZW5hbmdhbiBkaSB0YW1hbiBrb3RhIGF0YXUgYWxhbSBwZW5kZWsuCgoyLiBNZW1iYWNhOiBQaWxpaCBidWt1IHlhbmcgc2F0dSBpbmkgdW50dWsgbWVuZW5hbmdrYW4gcGlraXJhbiBhdGF1IG1lbmdoaW5kYXJpIHJ1dGluaXRhcyBzZWhhcmktaGFyaS4KCjMuIE5vbnRvbiBGaWxtIGF0YXUgU2VyaWFsOiBNZW5vbnRvbiBmaWxtIGF0YXUgc2VyaWFsIGZhdm9yaXQgYmlzYSBtZW5qYWRpIGNhcmEgeWFuZyBtZW55ZW5hbmdrYW4gdW50dWsgbWVuZ2hhYmlza2FuIHdha3R1LgoKNC4gTGF0aWhhbiBZb2dhIGF0YXUgTWVkaXRhc2k6IExhdGloYW4gaW5pIGRhcGF0IG1lbWJhd2Egd2FrdHUgZGFtYWkgZGFuIHJlaGF0IHlhbmcgQW5kYSBidXR1aGthbi4KCjUuIE1lbmNvYmEgUmVrb21lbmRhc2kgTWFrYW5hbiBCYXJ1OiBKaWthIEFuZGEgc3VrYSBtZW5jb2JhIG1ha2FuYW4gYmFydSwga3VuanVuZ2kgcmVzdG9yYW4gbG9rYWwgeWFuZyBiZWx1bSBBbmRhIGt1bmp1bmdpIGF0YXUgYnVhdCBtYWthbmFuIHlhbmcgYmVsdW0gQW5kYSBjb2JhLgoKNi4gT3JnYW5pc2lyIFJ1YW5nYW46IEluaSBiaXNhIG1lbmphZGkgY2FyYSB1bnR1ayBtZW5lbmFuZ2thbiBwaWtpcmFuIGRhbiBtZW5pbmdrYXRrYW4ga2VuYWlrYW4gbW9vZC4KCjcuIE1lbnVsaXM6IE1lbnVsaXMgYXBhIHB1buKAlGJhaWsgaXR1IGNhdGF0YW4sIHB1aXNpLCBhdGF1IG5vdmVsIHBlbmRla+KAlGJpc2Egc2FuZ2F0IG1lbmdoaWJ1ciBkYW4gbWVtYmFudHUgbWVtcHJvc2VzIHBpa2lyYW4uCgpDb2JhIHBpa2lya2FuIHlhbmcgcGFsaW5nIG1lbmFyaWsgYmFnaSBBbmRhIGRhbiBiZXJpa2FuIGRpcmkgQW5kYSB3YWt0dSB1bnR1ayBtZW5pa21hdGlueWEuIjt9fX0=', 1734863537);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2,
  `is_active` int(11) NOT NULL DEFAULT 0,
  `device_id` varchar(255) NOT NULL DEFAULT '-',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `role_id`, `is_active`, `device_id`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Muhammad Ridho Adhari', 'admin', 'rdofx99@gmail.com', '$2y$12$Ozxs3twv8PWpWktkUctlTOOL/G7fXW54L4Tl7ly.lFDOZf3tWZ5Cu', 1, 1, '-', NULL, NULL, '2024-12-16 22:13:42', '2024-12-16 22:13:42'),
(2, 'Muhammad Ridho Adhari', 'jennvo', 'user1@gmail.com', '$2y$12$Ozxs3twv8PWpWktkUctlTOOL/G7fXW54L4Tl7ly.lFDOZf3tWZ5Cu', 1, 1, '-', NULL, NULL, '2024-12-17 21:27:41', '2024-12-17 21:27:41'),
(3, 'Vadel', 'Manuqi', '12221327@bsi.ac.id', '$2y$12$OKYUKwjX5W.DrroyE9QVK.01vNycv9Ic3wYgpInG4l36SrESHkA.C', 2, 1, '-', NULL, NULL, '2024-12-22 02:19:10', '2024-12-22 02:19:10'),
(4, NULL, 'AgusBos', 'agus@gmail.com', '$2y$12$QJLlthCnbot3xRaRmyT/1e8fWqXkxiFtoHD//TDtoAhntDG5Athuu', 2, 0, '-', NULL, NULL, '2024-12-24 21:33:24', '2024-12-24 21:33:24'),
(5, NULL, 'AgusNi', 'agus2020@gmail.com', '$2y$12$ad0YN7aJDlj2ByZGuEA8DuZ3LxfB4wsdJDVgekdeqtsAGLLkULQxS', 2, 1, '-', NULL, NULL, '2024-12-24 21:48:18', '2024-12-24 21:48:18'),
(6, NULL, 'Bille', 'Billelish@gmal.com', '$2y$12$NZNHEDoM7XKzfNEwFy0xpOadFNBCko7zLbyhvJCdhpADgHFYbV4oe', 2, 1, '-', NULL, NULL, '2024-12-24 21:55:52', '2024-12-24 21:55:52');

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

CREATE TABLE `user_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `tanggal_lahir` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL DEFAULT 'Laki-Laki',
  `foto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_detail`
--

INSERT INTO `user_detail` (`id`, `id_user`, `nama`, `tanggal_lahir`, `email`, `no_telp`, `alamat`, `jenis_kelamin`, `foto`, `created_at`, `updated_at`) VALUES
(1, 1, 'Muhammad Ridho Adhari', NULL, 'rdofx99@gmail.com', NULL, NULL, 'Laki-Laki', NULL, '2024-12-16 22:13:44', '2024-12-16 22:13:44'),
(2, 2, 'Muhammad Ridho Adhari', NULL, 'user1@gmail.com', '081124555353', NULL, 'Laki-Laki', NULL, '2024-12-17 21:27:41', '2024-12-17 21:27:41'),
(3, 3, 'Vadel', NULL, '12221327@bsi.ac.id', NULL, NULL, 'Laki-Laki', NULL, '2024-12-22 02:19:10', '2024-12-22 02:19:10'),
(4, 4, NULL, NULL, 'agus@gmail.com', NULL, NULL, 'Laki-Laki', NULL, '2024-12-24 21:33:24', '2024-12-24 21:33:24'),
(5, 5, NULL, NULL, 'agus2020@gmail.com', NULL, NULL, 'Laki-Laki', NULL, '2024-12-24 21:48:18', '2024-12-24 21:48:18'),
(6, 6, NULL, NULL, 'Billelish@gmal.com', NULL, NULL, 'Laki-Laki', NULL, '2024-12-24 21:55:52', '2024-12-24 21:55:52');

-- --------------------------------------------------------

--
-- Table structure for table `user_personal_data`
--

CREATE TABLE `user_personal_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `hobi` varchar(100) DEFAULT NULL,
  `sifat` varchar(100) DEFAULT NULL,
  `kegiatan_keseharian` varchar(100) DEFAULT NULL,
  `deksripsi` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_personal_data`
--

INSERT INTO `user_personal_data` (`id`, `id_user`, `hobi`, `sifat`, `kegiatan_keseharian`, `deksripsi`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, NULL, '2024-12-16 22:13:44', '2024-12-16 22:13:44'),
(2, 2, 'Mancing', 'Mancing Amarah Tetangga', NULL, NULL, '2024-12-17 21:27:41', '2024-12-17 21:27:41'),
(3, 3, NULL, NULL, NULL, NULL, '2024-12-22 02:19:10', '2024-12-22 02:19:10'),
(4, 4, NULL, NULL, NULL, NULL, '2024-12-24 21:33:24', '2024-12-24 21:33:24'),
(5, 5, NULL, NULL, NULL, NULL, '2024-12-24 21:48:18', '2024-12-24 21:48:18'),
(6, 6, NULL, NULL, NULL, NULL, '2024-12-24 21:55:52', '2024-12-24 21:55:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `catatan_harian`
--
ALTER TABLE `catatan_harian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catatan_harian_id_user_foreign` (`id_user`),
  ADD KEY `catatan_harian_id_catatan_detail_foreign` (`id_catatan_detail`);

--
-- Indexes for table `catatan_harian_detail`
--
ALTER TABLE `catatan_harian_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catatan_harian_detail_id_mood_foreign` (`id_mood`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_mood`
--
ALTER TABLE `kategori_mood`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mood`
--
ALTER TABLE `mood`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mood_id_kategori_mood_foreign` (`id_kategori_mood`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `rekomen_kegiatan`
--
ALTER TABLE `rekomen_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rekomen_kegiatan_id_kategori_mood_foreign` (`id_kategori_mood`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_detail`
--
ALTER TABLE `user_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_detail_id_user_foreign` (`id_user`);

--
-- Indexes for table `user_personal_data`
--
ALTER TABLE `user_personal_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_personal_data_id_user_foreign` (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catatan_harian`
--
ALTER TABLE `catatan_harian`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `catatan_harian_detail`
--
ALTER TABLE `catatan_harian_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori_mood`
--
ALTER TABLE `kategori_mood`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `mood`
--
ALTER TABLE `mood`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `rekomen_kegiatan`
--
ALTER TABLE `rekomen_kegiatan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_detail`
--
ALTER TABLE `user_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_personal_data`
--
ALTER TABLE `user_personal_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `catatan_harian`
--
ALTER TABLE `catatan_harian`
  ADD CONSTRAINT `catatan_harian_id_catatan_detail_foreign` FOREIGN KEY (`id_catatan_detail`) REFERENCES `catatan_harian_detail` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catatan_harian_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catatan_harian_detail`
--
ALTER TABLE `catatan_harian_detail`
  ADD CONSTRAINT `catatan_harian_detail_id_mood_foreign` FOREIGN KEY (`id_mood`) REFERENCES `mood` (`id`);

--
-- Constraints for table `mood`
--
ALTER TABLE `mood`
  ADD CONSTRAINT `mood_id_kategori_mood_foreign` FOREIGN KEY (`id_kategori_mood`) REFERENCES `kategori_mood` (`id`);

--
-- Constraints for table `rekomen_kegiatan`
--
ALTER TABLE `rekomen_kegiatan`
  ADD CONSTRAINT `rekomen_kegiatan_id_kategori_mood_foreign` FOREIGN KEY (`id_kategori_mood`) REFERENCES `kategori_mood` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_detail`
--
ALTER TABLE `user_detail`
  ADD CONSTRAINT `user_detail_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_personal_data`
--
ALTER TABLE `user_personal_data`
  ADD CONSTRAINT `user_personal_data_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
