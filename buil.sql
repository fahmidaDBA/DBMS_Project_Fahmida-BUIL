-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2024 at 06:32 AM
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
-- Database: `buil`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `AuthorID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Biography` text DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `DeathDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`AuthorID`, `Name`, `Biography`, `BirthDate`, `DeathDate`) VALUES
(1, 'Muhammad al-Bukhari', 'Collector of Sahih al-Bukhari', '0810-07-20', '0870-09-01'),
(2, 'Muslim ibn al-Hajjaj', 'Compiler of Sahih Muslim', '0821-08-09', '0875-05-25'),
(3, 'Malik ibn Anas', 'Author of Al-Muwatta', '0711-11-20', '0795-08-17'),
(4, 'Jalal ad-Din al-Mahalli', 'Co-author of Tafsir al-Jalalayn', '1389-01-01', '1459-12-28');

-- --------------------------------------------------------

--
-- Table structure for table `bookshelf`
--

CREATE TABLE `bookshelf` (
  `BookshelfID` int(11) NOT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookshelf`
--

INSERT INTO `bookshelf` (`BookshelfID`, `Location`, `Description`, `Capacity`) VALUES
(1, 'Floor 1, Section A', 'Classical Islamic Literature', 100),
(2, 'Floor 2, Section B', 'Hadith Collections', 150),
(3, 'Floor 1, Section C', 'Islamic Jurisprudence', 120),
(4, 'Floor 3, Section D', 'Quranic Studies', 200);

-- --------------------------------------------------------

--
-- Table structure for table `borrowers`
--

CREATE TABLE `borrowers` (
  `BorrowerID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `MembershipDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowers`
--

INSERT INTO `borrowers` (`BorrowerID`, `Name`, `Email`, `PhoneNumber`, `Address`, `MembershipDate`) VALUES
(1, 'Ahmad Hossain', 'ahmad.h@example.com', '0123456789', 'Dhaka, Bangladesh', '2022-01-15'),
(2, 'Fatima Rahman', 'fatima.r@example.com', '0987654321', 'Chittagong, Bangladesh', '2021-12-20'),
(3, 'Kamal Ahmed', 'kamal.a@example.com', '0192837465', 'Khulna, Bangladesh', '2023-03-10'),
(4, 'Aisha Parvin', 'aisha.p@example.com', '0183749201', 'Rajshahi, Bangladesh', '2021-05-25');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `EventID` int(11) NOT NULL,
  `EventName` varchar(100) DEFAULT NULL,
  `EventDate` date DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`EventID`, `EventName`, `EventDate`, `Location`, `Description`) VALUES
(1, 'Book Fair', '2024-06-01', 'Dhaka University', 'Annual Islamic book fair'),
(2, 'Quran Recitation', '2024-07-15', 'Chittagong', 'Quran recitation competition'),
(3, 'Hadith Seminar', '2024-08-20', 'Khulna', 'Seminar on Hadith sciences'),
(4, 'Fiqh Workshop', '2024-09-25', 'Rajshahi', 'Workshop on Islamic jurisprudence');

-- --------------------------------------------------------

--
-- Table structure for table `fines`
--

CREATE TABLE `fines` (
  `FineID` int(11) NOT NULL,
  `BorrowerID` int(11) DEFAULT NULL,
  `ManuscriptID` int(11) DEFAULT NULL,
  `FineAmount` decimal(10,2) DEFAULT NULL,
  `FineReason` varchar(255) DEFAULT NULL,
  `FineDate` date DEFAULT NULL,
  `PaidStatus` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fines`
--

INSERT INTO `fines` (`FineID`, `BorrowerID`, `ManuscriptID`, `FineAmount`, `FineReason`, `FineDate`, `PaidStatus`) VALUES
(1, 1, 1, 50.00, 'Late Return', '2024-01-15', 'Unpaid'),
(2, 2, 2, 75.00, 'Book Damage', '2024-02-20', 'Paid'),
(3, 3, 3, 25.00, 'Late Return', '2024-03-10', 'Unpaid'),
(4, 4, 4, 100.00, 'Book Lost', '2024-04-05', 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `GenreID` int(11) NOT NULL,
  `GenreName` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `CreatedAt` date DEFAULT NULL,
  `UpdatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`GenreID`, `GenreName`, `Description`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'Islamic Jurisprudence', 'Books on Fiqh and Islamic law', '2024-01-01', '2024-01-01'),
(2, 'Hadith Collections', 'Collections of Hadith', '2024-01-01', '2024-01-01'),
(3, 'Classical Islamic Literature', 'Classical works of Islamic literature', '2024-01-01', '2024-01-01'),
(4, 'Quranic Studies', 'Books on Tafsir and Quranic studies', '2024-01-01', '2024-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `librarians`
--

CREATE TABLE `librarians` (
  `LibrarianID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `EmploymentDate` date DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `librarians`
--

INSERT INTO `librarians` (`LibrarianID`, `Name`, `Email`, `PhoneNumber`, `EmploymentDate`, `Salary`) VALUES
(1, 'Mahbub Alam', 'mahbub.a@example.com', '0172837465', '2015-06-01', 35000.00),
(2, 'Nafisa Rahman', 'nafisa.r@example.com', '0162849501', '2017-09-15', 32000.00),
(3, 'Tanvir Hossain', 'tanvir.h@example.com', '0152948672', '2019-11-20', 30000.00),
(4, 'Razia Sultana', 'razia.s@example.com', '0142857930', '2020-01-10', 28000.00);

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `LoanID` int(11) NOT NULL,
  `BorrowerID` int(11) DEFAULT NULL,
  `ManuscriptID` int(11) DEFAULT NULL,
  `LoanDate` date DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`LoanID`, `BorrowerID`, `ManuscriptID`, `LoanDate`, `ReturnDate`, `Status`) VALUES
(1, 1, 1, '2024-01-01', '2024-01-15', 'Returned'),
(2, 2, 2, '2024-01-05', '2024-01-20', 'Returned'),
(3, 3, 3, '2024-01-10', '2024-01-25', 'Overdue'),
(4, 4, 4, '2024-01-15', '2024-01-30', 'Borrowed');

-- --------------------------------------------------------

--
-- Table structure for table `manuscripts`
--

CREATE TABLE `manuscripts` (
  `ManuscriptID` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `AuthorID` int(11) DEFAULT NULL,
  `GenreID` int(11) DEFAULT NULL,
  `BookshelfID` int(11) DEFAULT NULL,
  `PublicationDate` date DEFAULT NULL,
  `Language` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manuscripts`
--

INSERT INTO `manuscripts` (`ManuscriptID`, `Title`, `AuthorID`, `GenreID`, `BookshelfID`, `PublicationDate`, `Language`) VALUES
(1, 'Sahih al-Bukhari', 1, 2, 2, '0846-01-01', 'Arabic'),
(2, 'Sahih Muslim', 2, 2, 2, '0875-01-01', 'Arabic'),
(3, 'Al-Muwatta', 3, 2, 2, '0795-01-01', 'Arabic'),
(4, 'Tafsir al-Jalalayn', 4, 4, 4, '1459-01-01', 'Arabic');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `NoticeID` int(11) NOT NULL,
  `Description` text DEFAULT NULL,
  `PublishingDate` date DEFAULT NULL,
  `Attachments` text DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`NoticeID`, `Description`, `PublishingDate`, `Attachments`, `ExpiryDate`) VALUES
(1, 'Library closed for maintenance', '2024-06-01', 'attachment1.pdf', '2024-06-05'),
(2, 'New books added', '2024-07-10', 'attachment2.pdf', '2024-07-20'),
(3, 'Holiday notice', '2024-08-15', 'attachment3.pdf', '2024-08-18'),
(4, 'Annual inventory check', '2024-09-25', 'attachment4.pdf', '2024-09-30');

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `PublisherID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `ContactNumber` varchar(20) DEFAULT NULL,
  `EstablishedYear` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`PublisherID`, `Name`, `Address`, `ContactNumber`, `EstablishedYear`) VALUES
(1, 'Darussalam', 'Riyadh, Saudi Arabia', '1234567890', '1986'),
(2, 'IIPH', 'Riyadh, Saudi Arabia', '0987654321', '1991'),
(3, 'Islamic Foundation', 'Leicester, UK', '1122334455', '1973'),
(4, 'Al-Huda Publications', 'Lahore, Pakistan', '2233445566', '1994');

-- --------------------------------------------------------

--
-- Table structure for table `readingrooms`
--

CREATE TABLE `readingrooms` (
  `RoomID` int(11) NOT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `Available` tinyint(1) DEFAULT NULL,
  `Schedule` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `readingrooms`
--

INSERT INTO `readingrooms` (`RoomID`, `Location`, `Capacity`, `Available`, `Schedule`) VALUES
(1, 'Room A', 50, 1, '09:00-17:00'),
(2, 'Room B', 30, 1, '10:00-18:00'),
(3, 'Room C', 20, 0, '11:00-19:00'),
(4, 'Room D', 40, 1, '08:00-16:00');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `ReviewID` int(11) NOT NULL,
  `ManuscriptID` int(11) DEFAULT NULL,
  `BorrowerID` int(11) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Comment` text DEFAULT NULL,
  `ReviewDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`ReviewID`, `ManuscriptID`, `BorrowerID`, `Rating`, `Comment`, `ReviewDate`) VALUES
(1, 1, 1, 5, 'Excellent collection of Hadith.', '2024-02-01'),
(2, 2, 2, 4, 'Very informative and well-written.', '2024-03-15'),
(3, 3, 3, 5, 'A must-read for students of Islamic law.', '2024-04-20'),
(4, 4, 4, 4, 'Insightful and comprehensive.', '2024-05-25');

-- --------------------------------------------------------

--
-- Table structure for table `scribes`
--

CREATE TABLE `scribes` (
  `ScribeID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Biography` text DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `DeathDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scribes`
--

INSERT INTO `scribes` (`ScribeID`, `Name`, `Biography`, `BirthDate`, `DeathDate`) VALUES
(1, 'Muhammad al-Bukhari', 'Collector of Sahih al-Bukhari', '0810-07-20', '0870-09-01'),
(2, 'Muslim ibn al-Hajjaj', 'Compiler of Sahih Muslim', '0821-08-09', '0875-05-25'),
(3, 'Malik ibn Anas', 'Author of Al-Muwatta', '0711-11-20', '0795-08-17'),
(4, 'Jalal ad-Din al-Mahalli', 'Co-author of Tafsir al-Jalalayn', '1389-01-01', '1459-12-28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`AuthorID`);

--
-- Indexes for table `bookshelf`
--
ALTER TABLE `bookshelf`
  ADD PRIMARY KEY (`BookshelfID`);

--
-- Indexes for table `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`BorrowerID`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`EventID`);

--
-- Indexes for table `fines`
--
ALTER TABLE `fines`
  ADD PRIMARY KEY (`FineID`),
  ADD KEY `BorrowerID` (`BorrowerID`),
  ADD KEY `ManuscriptID` (`ManuscriptID`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`GenreID`);

--
-- Indexes for table `librarians`
--
ALTER TABLE `librarians`
  ADD PRIMARY KEY (`LibrarianID`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`LoanID`),
  ADD KEY `BorrowerID` (`BorrowerID`),
  ADD KEY `ManuscriptID` (`ManuscriptID`);

--
-- Indexes for table `manuscripts`
--
ALTER TABLE `manuscripts`
  ADD PRIMARY KEY (`ManuscriptID`),
  ADD KEY `AuthorID` (`AuthorID`),
  ADD KEY `GenreID` (`GenreID`),
  ADD KEY `BookshelfID` (`BookshelfID`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`NoticeID`);

--
-- Indexes for table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`PublisherID`);

--
-- Indexes for table `readingrooms`
--
ALTER TABLE `readingrooms`
  ADD PRIMARY KEY (`RoomID`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`ReviewID`),
  ADD KEY `ManuscriptID` (`ManuscriptID`),
  ADD KEY `BorrowerID` (`BorrowerID`);

--
-- Indexes for table `scribes`
--
ALTER TABLE `scribes`
  ADD PRIMARY KEY (`ScribeID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fines`
--
ALTER TABLE `fines`
  ADD CONSTRAINT `fines_ibfk_1` FOREIGN KEY (`BorrowerID`) REFERENCES `borrowers` (`BorrowerID`),
  ADD CONSTRAINT `fines_ibfk_2` FOREIGN KEY (`ManuscriptID`) REFERENCES `manuscripts` (`ManuscriptID`);

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`BorrowerID`) REFERENCES `borrowers` (`BorrowerID`),
  ADD CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`ManuscriptID`) REFERENCES `manuscripts` (`ManuscriptID`);

--
-- Constraints for table `manuscripts`
--
ALTER TABLE `manuscripts`
  ADD CONSTRAINT `manuscripts_ibfk_1` FOREIGN KEY (`AuthorID`) REFERENCES `authors` (`AuthorID`),
  ADD CONSTRAINT `manuscripts_ibfk_2` FOREIGN KEY (`GenreID`) REFERENCES `genres` (`GenreID`),
  ADD CONSTRAINT `manuscripts_ibfk_3` FOREIGN KEY (`BookshelfID`) REFERENCES `bookshelf` (`BookshelfID`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`ManuscriptID`) REFERENCES `manuscripts` (`ManuscriptID`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`BorrowerID`) REFERENCES `borrowers` (`BorrowerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
