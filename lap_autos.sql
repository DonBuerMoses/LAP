-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 21. Feb 2023 um 23:07
-- Server-Version: 10.4.27-MariaDB
-- PHP-Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `lap_autos`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `marken`
--

CREATE TABLE `marken` (
  `idMARKEN` int(11) NOT NULL,
  `MARKENBez` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `marken`
--

INSERT INTO `marken` (`idMARKEN`, `MARKENBez`) VALUES
(1, 'Mercedes'),
(2, 'Audi'),
(3, 'VW'),
(5, 'Peugeot');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `modelle`
--

CREATE TABLE `modelle` (
  `idModelle` int(11) NOT NULL,
  `MODELLEBez` varchar(20) NOT NULL,
  `MODELLELeistung` int(11) NOT NULL,
  `MODELLETueren` int(11) NOT NULL,
  `MARKEN_idMARKEN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `modelle`
--

INSERT INTO `modelle` (`idModelle`, `MODELLEBez`, `MODELLELeistung`, `MODELLETueren`, `MARKEN_idMARKEN`) VALUES
(1, 'e208', 120, 5, 5),
(2, '3008 PLUG-IN Hybrid', 105, 5, 5),
(3, 'Polo', 95, 4, 3),
(4, 'T-Cross', 130, 5, 3),
(5, 'A6', 280, 5, 2),
(6, 'GLE SUV', 450, 5, 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `marken`
--
ALTER TABLE `marken`
  ADD PRIMARY KEY (`idMARKEN`);

--
-- Indizes für die Tabelle `modelle`
--
ALTER TABLE `modelle`
  ADD PRIMARY KEY (`idModelle`),
  ADD KEY `idMarke` (`MARKEN_idMARKEN`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `marken`
--
ALTER TABLE `marken`
  MODIFY `idMARKEN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `modelle`
--
ALTER TABLE `modelle`
  MODIFY `idModelle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `modelle`
--
ALTER TABLE `modelle`
  ADD CONSTRAINT `modelle_ibfk_1` FOREIGN KEY (`MARKEN_idMARKEN`) REFERENCES `marken` (`idMARKEN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
