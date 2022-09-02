-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 02, 2022 at 07:10 AM
-- Server version: 5.7.33
-- PHP Version: 8.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokobarang`
--

-- --------------------------------------------------------

--
-- Table structure for table `barangs`
--

CREATE TABLE `barangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `barang_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barang_price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barangs`
--

INSERT INTO `barangs` (`id`, `barang_name`, `barang_price`, `created_at`, `updated_at`) VALUES
(11, 'Sunlight Lemon Cuci Piring 250ml', 7500, '2022-08-31 03:43:12', '2022-08-31 03:43:12'),
(12, 'Chocolatos Stick 65gr', 1000, '2022-08-31 03:43:35', '2022-08-31 03:43:35'),
(13, 'Garnier Man Activa 320gr', 32000, '2022-08-31 03:44:09', '2022-08-31 03:44:09'),
(14, 'Chocolatos Stick Pineapple 65gr', 1000, '2022-08-31 06:14:09', '2022-08-31 06:14:09'),
(16, 'Cheetoz Pedes 1kg', 34000, '2022-08-31 09:25:56', '2022-08-31 09:25:56'),
(17, 'Ikan Koi 2022 Anakan', 5500, '2022-09-01 03:05:54', '2022-09-01 03:05:54');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2014_10_12_200000_add_two_factor_columns_to_users_table', 2),
(6, '2022_08_30_185804_create_barangs_table', 3),
(7, '2022_08_31_075547_create_transactions_table', 4),
(8, '2022_08_31_081738_create_transaction_items_table', 5),
(9, '2022_08_31_095927_add_field_to_transactions_table', 6),
(10, '2022_08_31_100526_add_buyer_to_transactions_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'authToken', '1f68d1a602cd255f4bbca40574e0112a312dc30128c476beef3bb40d435ff088', '[\"*\"]', NULL, NULL, '2022-08-30 07:47:21', '2022-08-30 07:47:21'),
(3, 'App\\Models\\User', 1, 'authToken', 'fa285f94e7eaf04d90769fc39755d15ade50f653293ddb36535313be8a3d8116', '[\"*\"]', '2022-08-30 13:20:30', NULL, '2022-08-30 11:46:02', '2022-08-30 13:20:30'),
(4, 'App\\Models\\User', 1, 'authToken', '8eca26bba01ce555e6810650f0f440ed2dcb243e01679c04e8944b944085a024', '[\"*\"]', '2022-08-31 09:26:33', NULL, '2022-08-30 13:24:43', '2022-08-31 09:26:33'),
(5, 'App\\Models\\User', 1, 'authToken', '4cf320a1c1796c8eb7c9373ba3d1a6a0e03e4d017e858deebd576b99856c7bc2', '[\"*\"]', '2022-08-31 09:11:28', NULL, '2022-08-31 01:46:48', '2022-08-31 09:11:28'),
(6, 'App\\Models\\User', 1, 'authToken', '89006e1a2a5a39b5015b135a504bb871db432b0c31946ab904852a8a5c2283ec', '[\"*\"]', '2022-09-01 03:28:14', NULL, '2022-08-31 03:31:54', '2022-09-01 03:28:14'),
(7, 'App\\Models\\User', 1, 'authToken', '7bf961dd85410596b1d4195bd373b163d0f947c72bc3d600e8fb2f5bb688f517', '[\"*\"]', '2022-08-31 09:22:23', NULL, '2022-08-31 09:21:15', '2022-08-31 09:22:23'),
(10, 'App\\Models\\User', 1, 'authToken', 'c7299a96b267eb3447d720063ceaa0b1ae09377363323090f83e7ea7dee9b878', '[\"*\"]', NULL, NULL, '2022-09-01 03:08:21', '2022-09-01 03:08:21'),
(11, 'App\\Models\\User', 4, 'authToken', 'c2070882306837696877518c144f28d65a87727983cb07eec67d771e0befe59a', '[\"*\"]', NULL, NULL, '2022-09-01 03:10:23', '2022-09-01 03:10:23'),
(12, 'App\\Models\\User', 4, 'authToken', 'e90138924dfb3098e1bc3561a236610d86b4adc2115cc3f6f26907f0ac32d535', '[\"*\"]', '2022-09-01 03:30:15', NULL, '2022-09-01 03:16:05', '2022-09-01 03:30:15'),
(13, 'App\\Models\\User', 4, 'authToken', '6ab489e640be7e19f78970ce57eba57bccf2ea2aea4819e51f9a98842e1209a0', '[\"*\"]', '2022-09-01 23:11:46', NULL, '2022-09-01 06:36:37', '2022-09-01 23:11:46'),
(14, 'App\\Models\\User', 4, 'authToken', 'cb5e8e2adfc72ad3415adc595341e992376425bc2f0c2f172a5495edf2ecc191', '[\"*\"]', NULL, NULL, '2022-09-01 23:11:44', '2022-09-01 23:11:44');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buyer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price` int(11) DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `users_id`, `address`, `buyer_name`, `total_price`, `phone_number`, `code`, `created_at`, `updated_at`) VALUES
(90, 1, 'Kota Surakarta', 'Fandy', 96500, '08122372732', 'TB-53138', '2022-08-31 05:50:53', '2022-08-31 05:50:53'),
(92, 1, 'Kota Cemani', 'Lolyta', 138000, '0812381232', 'TB-80764', '2022-08-31 09:16:12', '2022-08-31 09:16:12'),
(93, 1, 'Kota Cemani', 'Lolyta', 138000, '0812381232', 'TB-47907', '2022-09-01 02:57:12', '2022-09-01 02:57:12'),
(95, 4, 'Kota Magelang', 'Exca', 183500, '0812381232', 'TB-92112', '2022-09-01 07:28:47', '2022-09-01 07:28:47'),
(96, 4, 'Kota Magelang', 'Exca', 77500, '0812381232', 'TB-30130', '2022-09-01 07:39:44', '2022-09-01 07:39:44'),
(97, 4, 'Kota Magelang', 'Exca', 77500, '0812381232', 'TB-87298', '2022-09-01 23:11:45', '2022-09-01 23:11:45');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_items`
--

CREATE TABLE `transaction_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `barangs_id` bigint(20) UNSIGNED NOT NULL,
  `transactions_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price_item` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_items`
--

INSERT INTO `transaction_items` (`id`, `users_id`, `barangs_id`, `transactions_id`, `quantity`, `total_price_item`, `created_at`, `updated_at`) VALUES
(160, 1, 12, 90, 10, 10000, '2022-08-31 05:50:53', '2022-08-31 05:50:53'),
(161, 1, 13, 90, 2, 64000, '2022-08-31 05:50:53', '2022-08-31 05:50:53'),
(162, 1, 11, 90, 3, 22500, '2022-08-31 05:50:53', '2022-08-31 05:50:53'),
(165, 1, 13, 92, 4, 128000, '2022-08-31 09:16:12', '2022-08-31 09:16:12'),
(166, 1, 12, 92, 3, 3000, '2022-08-31 09:16:12', '2022-08-31 09:16:12'),
(167, 1, 14, 92, 7, 7000, '2022-08-31 09:16:12', '2022-08-31 09:16:12'),
(168, 1, 13, 93, 4, 128000, '2022-09-01 02:57:12', '2022-09-01 02:57:12'),
(169, 1, 12, 93, 3, 3000, '2022-09-01 02:57:12', '2022-09-01 02:57:12'),
(170, 1, 14, 93, 7, 7000, '2022-09-01 02:57:12', '2022-09-01 02:57:12'),
(174, 4, 13, 95, 4, 128000, '2022-09-01 07:28:47', '2022-09-01 07:28:47'),
(175, 4, 12, 95, 3, 3000, '2022-09-01 07:28:47', '2022-09-01 07:28:47'),
(176, 4, 11, 95, 7, 52500, '2022-09-01 07:28:47', '2022-09-01 07:28:47'),
(177, 4, 17, 96, 4, 22000, '2022-09-01 07:39:44', '2022-09-01 07:39:44'),
(178, 4, 14, 96, 3, 3000, '2022-09-01 07:39:44', '2022-09-01 07:39:44'),
(179, 4, 11, 96, 7, 52500, '2022-09-01 07:39:44', '2022-09-01 07:39:44'),
(180, 4, 17, 97, 4, 22000, '2022-09-01 23:11:45', '2022-09-01 23:11:45'),
(181, 4, 14, 97, 3, 3000, '2022-09-01 23:11:45', '2022-09-01 23:11:45'),
(182, 4, 11, 97, 7, 52500, '2022-09-01 23:11:45', '2022-09-01 23:11:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `phone_number`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Exca', 'exca@test.test', NULL, '08122783262', '$2y$10$ZJetuPYPEHXuNjNa4rizVuXd97quxmHIe82.wN8YmouiiRoyyyPFS', NULL, NULL, NULL, 'Kasir', NULL, '2022-08-30 07:28:01', '2022-08-30 07:28:01'),
(2, 'Fandy', 'fandy@test.test', NULL, '0812713323', '$2y$10$9Sj.ckiVHCdDuiVld32.COrjGScurV.CTCBOMkvVTNWtoBV6NLdDG', NULL, NULL, NULL, 'kasir3', NULL, '2022-08-30 07:47:21', '2022-08-30 07:47:21'),
(3, 'Lolyta Dini', 'lolyta@test.test', NULL, '0812382123', '$2y$10$7SUFYPzTjrw21pXtGtoIguPkLfrXf5SjSjS4/YcG3tAjJ4ES6VlNu', NULL, NULL, NULL, 'kasir1', NULL, '2022-08-31 09:23:42', '2022-08-31 09:23:42'),
(4, 'Gerry', 'gerry@test.test', NULL, '09218912322', '$2y$10$q2FsUMi.vk81DSlM2Bv0zut5zZE/xAGtWMGmvvPuSKs7zzIW7BLpi', NULL, NULL, NULL, 'kasir6', NULL, '2022-09-01 03:10:23', '2022-09-01 03:10:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barangs`
--
ALTER TABLE `barangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barangs`
--
ALTER TABLE `barangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `transaction_items`
--
ALTER TABLE `transaction_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
