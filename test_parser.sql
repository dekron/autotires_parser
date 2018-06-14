-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июн 14 2018 г., 08:44
-- Версия сервера: 10.1.31-MariaDB
-- Версия PHP: 7.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test_parser`
--

-- --------------------------------------------------------

--
-- Структура таблицы `params`
--

CREATE TABLE `params` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `construction` varchar(255) NOT NULL,
  `diameter` int(11) NOT NULL,
  `load_index` int(11) NOT NULL,
  `speed_index` varchar(255) NOT NULL,
  `char_abbr` varchar(255) NOT NULL,
  `runflat` varchar(255) NOT NULL,
  `intimate` varchar(255) NOT NULL,
  `season` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `error_recognized` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `error_recognized`) VALUES
(1, 'Toyo H08 195/75R16C 107/105S TL Летние', NULL),
(2, 'Pirelli Winter SnowControl serie 3 175/70R14 84T TL Зимние (нешипованные)', NULL),
(5, 'BFGoodrich Mud-Terrain T/A KM2 235/85R16 120/116Q TL Внедорожные', NULL),
(6, 'Pirelli Scorpion Ice & Snow 265/45R21 104H TL Зимние (нешипованные)', NULL),
(7, 'Pirelli Winter SottoZero Serie II 245/45R19 102V XL Run Flat TL Зимние (нешипованные)', NULL),
(8, 'Nokian Hakkapeliitta R2 SUV/Е 245/70R16 111R XL TL Зимние (нешипованные)', NULL),
(9, 'Pirelli Winter Carving Edge 225/50R17 98T XL TL Зимние (шипованные)', NULL),
(10, 'Continental ContiCrossContact LX Sport 255/55R18 105H FR MO TL Всесезонные', NULL),
(11, 'BFGoodrich g-Force Stud 205/60R16 96Q XL TL Зимние (шипованные)', NULL),
(12, 'BFGoodrich Winter Slalom KSI 225/60R17 99S TL Зимние (нешипованные)', NULL),
(13, 'Continental ContiSportContact 5 245/45R18 96W SSR FR TL Летние', NULL),
(14, 'Continental ContiWinterContact TS 830 P 205/60R16 92H SSR * TL Зимние (нешипованные)', NULL),
(15, 'Continental ContiWinterContact TS 830 P 225/45R18 95V XL SSR FR * TL Зимние (нешипованные)', NULL),
(16, 'Hankook Winter I*Cept Evo2 W320 255/35R19 96V XL TL/TT Зимние (нешипованные)', NULL),
(17, 'Mitas Sport Force+ 120/65R17 56W TL Летние', NULL),
(18, 'Pirelli Winter SottoZero Serie II 245/45R19 102V TL Зимние (нешипованные)', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `params`
--
ALTER TABLE `params`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `params`
--
ALTER TABLE `params`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
