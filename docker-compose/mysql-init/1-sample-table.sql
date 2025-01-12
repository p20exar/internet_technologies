-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Εξυπηρετητής: 127.0.0.1
-- Χρόνος δημιουργίας: 10 Ιαν 2025 στις 21:27:53
-- Έκδοση διακομιστή: 10.4.32-MariaDB
-- Έκδοση PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `trello`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('To_Do','Pending','In_Progress','Completed') DEFAULT 'Pending',
  `list_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `assigned_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `created_at`, `status`, `list_id`, `created_by`, `user_id`, `assigned_to`) VALUES
(1, 'Go to the S/M', '2024-12-29 09:26:25', 'To_Do', 2, 1, 0, NULL),
(4, 'Go to the Cinema', '2024-12-11 20:32:20', '', 1, 1, 0, NULL),
(6, 'Take a Vacation', '2024-12-11 20:33:19', '', 1, 1, 0, NULL),
(7, 'Finish my math homework', '2024-12-29 09:26:14', 'To_Do', 2, 1, 0, NULL),
(9, 'Do the Cooking', '2024-12-28 21:22:55', 'In_Progress', 3, 1, 0, NULL),
(11, 'Do my Homework2', '2024-12-29 09:24:56', 'Completed', 4, 1, 0, NULL),
(17, 'Read a Book', '2024-12-12 09:15:53', '', 1, 1, 0, NULL),
(20, 'test', '2024-12-13 08:54:03', '', NULL, 1, 0, 1),
(26, 'eat lunch', '2024-12-29 09:35:56', 'To_Do', 14, 2, 0, 2),
(27, 'Vacuum the interior', '2024-12-29 17:43:19', 'To_Do', 15, 2, 0, 1),
(28, 'meet a friend', '2024-12-13 20:40:00', 'Completed', 4, 1, 0, 1),
(29, 'feed the cat', '2024-12-14 18:23:19', 'Completed', 4, 1, 0, 1),
(30, 'Finish my work project', '2024-12-14 18:28:44', 'Pending', 16, 1, 0, 1),
(31, 'make an appointment at the dentist', '2024-12-14 19:34:11', 'Pending', 16, 1, 0, 1),
(32, 'listening to the radio', '2024-12-29 17:48:42', 'In_Progress', 3, 1, 0, 1),
(33, 'Call a friend', '2024-12-29 09:26:03', 'To_Do', 2, 1, 0, 1),
(34, 'Wash the exterior using car shampoo', '2024-12-29 17:44:35', 'To_Do', 15, 2, 0, 2);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `task_lists`
--

CREATE TABLE `task_lists` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `task_lists`
--

INSERT INTO `task_lists` (`id`, `title`, `user_id`, `created_at`) VALUES
(1, 'Bucket List', 1, '2024-12-05 23:15:48'),
(2, 'TO DO TASK LIST', 1, '2024-12-05 23:16:30'),
(3, 'In Progress', 1, '2024-12-12 10:06:55'),
(4, 'Completed Tasks', 1, '2024-12-12 10:08:58'),
(14, 'chores', 2, '2024-12-13 10:08:57'),
(15, 'wash the car', 2, '2024-12-13 10:50:55'),
(16, 'Pending', 1, '2024-12-14 19:34:30');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `push_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `push_key`) VALUES
(1, 'Agni', 'Exar', 'testie', 'none@yahoo.com', '$2y$10$r5d34mJMOwSD4OxaL5X.gOM9dvutVDCUHp6ma09cAh9o55CufKpDS', '123123'),
(2, 'Dafni', 'Apekso', 'dada', 'dada@gmail.com', '$2y$10$PW.z8hSehQ4sxacfIVziw.5aY60f2dNIfSzBWvTHntr4yUpjjrwLO', '');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_id` (`list_id`),
  ADD KEY `current_timestamp()` (`created_by`),
  ADD KEY `assigned_to` (`assigned_to`);

--
-- Ευρετήρια για πίνακα `task_lists`
--
ALTER TABLE `task_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Ευρετήρια για πίνακα `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `push_key` (`push_key`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT για πίνακα `task_lists`
--
ALTER TABLE `task_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT για πίνακα `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`list_id`) REFERENCES `task_lists` (`id`),
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tasks_ibfk_3` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Περιορισμοί για πίνακα `task_lists`
--
ALTER TABLE `task_lists`
  ADD CONSTRAINT `task_lists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
