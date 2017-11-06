-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Nov 04, 2017 alle 15:23
-- Versione del server: 10.1.26-MariaDB
-- Versione PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `impianti`
--

CREATE TABLE `impianti` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `impianti`
--

INSERT INTO `impianti` (`ID`, `Nome`, `Cliente`) VALUES
(17, 'Casa', 10),
(16, 'Palestra', 9),
(18, 'Stazione', 10);

-- --------------------------------------------------------

--
-- Struttura della tabella `modellisensori`
--

CREATE TABLE `modellisensori` (
  `Codice` varchar(5) NOT NULL,
  `Tipo` varchar(15) NOT NULL,
  `Marca` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `modellisensori`
--

INSERT INTO `modellisensori` (`Codice`, `Tipo`, `Marca`) VALUES
('P01SE', 'Pressione', 'Set Sensori Solution'),
('P02SE', 'Pressione', 'Set Sensori Solution'),
('P07FP', 'Pressione', 'Fra Petruz Sensor'),
('P13US', 'Pressione', 'Uva Soluzioni'),
('T01MA', 'Temperatura', 'Mandriota Sensori'),
('T04US', 'Temperatura', 'Uva Soluzioni'),
('U01MA', 'Umidità', 'Mandriota Sensori'),
('U01SE', 'Umidità', 'Set Sensori Solution');

-- --------------------------------------------------------

--
-- Struttura della tabella `sensori`
--

CREATE TABLE `sensori` (
  `ID` int(11) NOT NULL,
  `modello` varchar(5) NOT NULL,
  `Impianto` int(11) NOT NULL,
  `rilevazione` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `sensori`
--

INSERT INTO `sensori` (`ID`, `modello`, `Impianto`, `rilevazione`) VALUES
(36, 'P01SE', 16, 'P01SE0311201710061830ERR'),
(38, 'T01MA', 16, 'T01MA031120170381830ERR'),
(39, 'T04US', 16, 'T04US031120170311830ANM'),
(40, 'P07FP', 17, 'P07FP0311201710001832ERR'),
(41, 'T04US', 17, 'T04US031120170101832ANM'),
(42, 'U01SE', 17, 'U01SE03112017201832ERR'),
(43, 'U01MA', 17, 'U01MA03112017601832SUC');

-- --------------------------------------------------------

--
-- Struttura della tabella `tipi`
--

CREATE TABLE `tipi` (
  `Tipo` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `tipi`
--

INSERT INTO `tipi` (`Tipo`) VALUES
('Pressione'),
('Temperatura'),
('Umidità');

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(15) NOT NULL,
  `Cognome` varchar(20) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `admin` varchar(1) NOT NULL,
  `Codice` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`ID`, `Nome`, `Cognome`, `Email`, `Password`, `admin`, `Codice`) VALUES
(0, 'Andrea', 'Pastore', 'a.pastore@gmail.com', 'andrea', '2', NULL),
(1, 'Gaetano', 'Scavo', 'g.scavo@gmail.com', 'gaetano', '1', NULL),
(9, 'Francesco', 'Petruzelli', 'f.petruz@gmail.com', 'francesco', '0', 'npeseftftpatroectct'),
(10, 'Giovanni', 'Rubino', 'g.rubino@gmail.com', 'giovanni', '0', 'gviorurnninivn');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `impianti`
--
ALTER TABLE `impianti`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`),
  ADD UNIQUE KEY `Nome` (`Nome`,`Cliente`),
  ADD KEY `IDcliente_idx` (`Cliente`);

--
-- Indici per le tabelle `modellisensori`
--
ALTER TABLE `modellisensori`
  ADD PRIMARY KEY (`Codice`),
  ADD UNIQUE KEY `Codice_UNIQUE` (`Codice`),
  ADD KEY `Tipo_idx` (`Tipo`);

--
-- Indici per le tabelle `sensori`
--
ALTER TABLE `sensori`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Impianto_idx` (`Impianto`),
  ADD KEY `Modello_idx` (`modello`);

--
-- Indici per le tabelle `tipi`
--
ALTER TABLE `tipi`
  ADD PRIMARY KEY (`Tipo`),
  ADD UNIQUE KEY `Tipo_UNIQUE` (`Tipo`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`),
  ADD UNIQUE KEY `Email_UNIQUE` (`Email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `impianti`
--
ALTER TABLE `impianti`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT per la tabella `sensori`
--
ALTER TABLE `sensori`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `impianti`
--
ALTER TABLE `impianti`
  ADD CONSTRAINT `IDcliente` FOREIGN KEY (`Cliente`) REFERENCES `utenti` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limiti per la tabella `modellisensori`
--
ALTER TABLE `modellisensori`
  ADD CONSTRAINT `Tipo` FOREIGN KEY (`Tipo`) REFERENCES `tipi` (`Tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `sensori`
--
ALTER TABLE `sensori`
  ADD CONSTRAINT `Impianto` FOREIGN KEY (`Impianto`) REFERENCES `impianti` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `Modello` FOREIGN KEY (`modello`) REFERENCES `modellisensori` (`Codice`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
