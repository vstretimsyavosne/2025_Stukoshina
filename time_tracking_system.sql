-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 10 2025 г., 14:25
-- Версия сервера: 10.4.28-MariaDB
-- Версия PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `time_tracking_system`
--

-- --------------------------------------------------------

--
-- Структура таблицы `time_records`
--

CREATE TABLE `time_records` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` time DEFAULT NULL,
  `is_late` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `time_records`
--

INSERT INTO `time_records` (`id`, `user_id`, `date`, `time_in`, `time_out`, `is_late`) VALUES
(1, 2, '2025-05-10', '12:48:54', '12:48:56', 1),
(2, 2, '2025-04-01', '09:15:00', '18:00:00', 0),
(3, 2, '2025-04-02', '09:20:00', '17:45:00', 0),
(4, 2, '2025-04-03', '09:10:00', '18:10:00', 0),
(5, 2, '2025-04-04', '09:05:00', '17:50:00', 0),
(6, 2, '2025-04-05', '09:00:00', '14:00:00', 0),
(7, 2, '2025-04-08', '09:25:00', '18:05:00', 0),
(8, 2, '2025-04-09', '09:18:00', '17:55:00', 0),
(9, 2, '2025-04-10', '09:22:00', '18:20:00', 0),
(10, 2, '2025-04-07', '09:45:00', '18:15:00', 1),
(11, 2, '2025-04-11', '10:05:00', '19:00:00', 1),
(12, 2, '2025-04-12', '09:00:00', '14:00:00', 0),
(13, 2, '2025-04-15', '09:20:00', '18:00:00', 0),
(14, 2, '2025-04-16', '09:15:00', '17:45:00', 0),
(15, 2, '2025-04-17', '09:10:00', '18:10:00', 0),
(16, 2, '2025-04-18', '09:05:00', '17:50:00', 0),
(17, 2, '2025-04-19', '09:00:00', '14:00:00', 0),
(18, 2, '2025-04-22', '09:25:00', '18:05:00', 0),
(19, 2, '2025-04-23', '09:18:00', '17:55:00', 0),
(20, 2, '2025-04-24', '09:22:00', '18:20:00', 0),
(21, 2, '2025-04-25', '09:15:00', '17:45:00', 0),
(22, 2, '2025-04-26', '09:00:00', '14:00:00', 0),
(23, 2, '2025-04-29', '09:20:00', '18:00:00', 0),
(24, 2, '2025-04-30', '09:15:00', '17:45:00', 0),
(25, 1, '2025-05-10', '13:25:08', '13:25:09', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`, `is_admin`, `created_at`) VALUES
(1, 'admin', '$2y$10$K3St.J7fPTSInuj8F0lCz.azyJYQKZYaFfHAqoMoF9dM22vnMtZTq', 'Администратор', 1, '2025-05-10 10:46:48'),
(2, 'stukoshina', '$2y$10$eIInkoMMpuzge7UoqQ/h/e4tugy2zAnUiHl0QCaS8A5ERjrYoPxWe', 'Стукошина Валерия Юрьевна', 0, '2025-05-10 10:48:26');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `time_records`
--
ALTER TABLE `time_records`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_date` (`user_id`,`date`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `time_records`
--
ALTER TABLE `time_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `time_records`
--
ALTER TABLE `time_records`
  ADD CONSTRAINT `time_records_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
