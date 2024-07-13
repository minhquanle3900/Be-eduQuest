-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 13, 2023 lúc 07:08 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tno_test`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `permission` int(1) DEFAULT 1,
  `last_login` datetime NOT NULL,
  `gender_id` int(1) NOT NULL DEFAULT 1,
  `avatar` varchar(255) DEFAULT 'avatar-default.jpg',
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `email`, `password`, `name`, `permission`, `last_login`, `gender_id`, `avatar`, `birthday`) VALUES
(1, 'admin', 'admin@ikun.org', 'e10adc3949ba59abbe56e057f20f883e', 'ADMIN', 1, '2023-04-13 23:16:10', 1, 'avatar-default.jpg', '1997-01-01'),
(2, 'admin3', 'thao11@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thị Thùy', 1, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '1997-01-01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chats`
--

CREATE TABLE `chats` (
  `ID` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `name` varchar(50) NOT NULL,
  `time_sent` datetime NOT NULL,
  `chat_content` text NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chats`
--

INSERT INTO `chats` (`ID`, `username`, `name`, `time_sent`, `chat_content`, `class_id`) VALUES
(9, 'hocsinh1', 'Nguyễn Thị Bích Thùy ', '2023-04-02 22:58:19', 'Các bạn vào làm bài thi nhé', 2),
(10, 'hocsinh2', 'Trần Huyền Tân', '2023-04-02 23:03:58', 'bạn ơi mình không vào được', 2),
(11, 'hocsinh2', 'Trần Huyền Tân', '2023-04-02 23:04:08', 'mật khẩu đề thi là gì thế nhỉ', 2),
(12, 'hocsinh1', 'Nguyễn Thị Bích Thùy ', '2023-04-02 23:45:18', 'để mình hỏi lại cô nha', 2),
(13, 'hocsinh1', 'Nguyễn Thị Bích Thùy ', '2023-04-11 13:26:17', 'hhhhh', 2),
(14, 'hocsinh1', 'Nguyễn Thị Bích Thùy ', '2023-04-13 23:41:20', 'alo các bạn', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classes`
--

CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL,
  `grade_id` int(10) NOT NULL,
  `class_name` varchar(50) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `classes`
--

INSERT INTO `classes` (`class_id`, `grade_id`, `class_name`, `teacher_id`) VALUES
(1, 10, '10A1', 1),
(2, 11, '11A1', 2),
(3, 11, '11A2', 4),
(4, 10, '10A2', 5),
(5, 12, '12A1', 7),
(6, 12, '12A2', 6),
(7, 12, '12A5', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `genders`
--

CREATE TABLE `genders` (
  `gender_id` int(1) NOT NULL,
  `gender_detail` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `genders`
--

INSERT INTO `genders` (`gender_id`, `gender_detail`) VALUES
(1, 'Chưa Xác Định'),
(2, 'Nam'),
(3, 'Nữ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `detail` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `grades`
--

INSERT INTO `grades` (`grade_id`, `detail`) VALUES
(10, 'Khối 10'),
(11, 'Khối 11'),
(12, 'Khối 12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `levels`
--

CREATE TABLE `levels` (
  `level_id` int(11) NOT NULL,
  `level_detail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `levels`
--

INSERT INTO `levels` (`level_id`, `level_detail`) VALUES
(1, 'Dễ'),
(2, 'Trung Bình'),
(3, 'Khó');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `name` varchar(50) NOT NULL,
  `notification_title` text NOT NULL,
  `notification_content` text NOT NULL,
  `time_sent` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`notification_id`, `username`, `name`, `notification_title`, `notification_content`, `time_sent`) VALUES
(32, 'giaovien1', 'Nguyễn Thị Bích Thùy', 'Làm bài thi thử', 'Lớp nhớ vào làm bài thi lúc 20h ngày 3/4/2023 nhé ', '2023-04-02 22:35:27'),
(33, 'giaovien2', 'Lê Đức Hải', 'Tham gia Hội thảo', 'Lớp tham gia hội thảo đầy đủ và có mặt đúng giờ để nghe thầy cô chia sẻ về vài vấn đề thi học kỳ', '2023-04-02 22:37:16'),
(34, 'giaovien4', 'Khổng Minh Tâm', 'Thu tiền học phí', 'Cả lớp nhanh chóng nộp tiền học phí hạn vào ngày 10/4/2023. Trân trọng', '2023-04-02 22:42:02'),
(35, 'admin', 'ADMIN', 'Họp giáo viên', 'tất cả giáo viên họp gấp chiều ngày 4/4/2023', '2023-04-02 23:34:00'),
(36, 'admin', 'ADMIN', 'Tham gia Thi ', 'Thi hết họ kỳ 2', '2023-04-11 11:40:21'),
(37, 'admin', 'ADMIN', 'Thông báo khẩn cấp', 'thông  báo tới toàn bộ sinh viên', '2023-04-11 13:17:50'),
(38, 'admin', 'ADMIN', 'Nộp học bạ', 'Nộp học bạ đối với học sinh khối 10', '2023-04-13 21:51:19'),
(39, 'admin', 'ADMIN', 'Thông báo nộp học bạ ', 'Học sinh khối 10 nộp học bạ trước 1/5', '2023-04-13 23:15:11'),
(40, 'giaovien2', 'Lê Đức Hải', 'Thông báo thi thử khối 11', 'thi thử ', '2023-04-13 23:18:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `permission` int(11) NOT NULL,
  `permission_detail` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`permission`, `permission_detail`) VALUES
(1, 'Admin'),
(2, 'Giáo Viên'),
(3, 'Học Sinh'),
(4, 'Trưởng bộ môn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `practice`
--

CREATE TABLE `practice` (
  `practice_code` int(11) NOT NULL,
  `grade_id` int(1) NOT NULL,
  `subject_id` int(1) NOT NULL,
  `level_id` int(1) NOT NULL,
  `time_to_do` int(11) NOT NULL DEFAULT 30,
  `total_questions` int(11) NOT NULL DEFAULT 30,
  `student_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `practice`
--

INSERT INTO `practice` (`practice_code`, `grade_id`, `subject_id`, `level_id`, `time_to_do`, `total_questions`, `student_id`) VALUES
(52964, 11, 8, 1, 30, 30, 11),
(269233, 11, 8, 1, 30, 30, 11),
(301006, 10, 10, 2, 30, 30, 12),
(345672, 11, 10, 1, 30, 30, 11),
(359250, 11, 9, 1, 30, 30, 11),
(499038, 10, 0, 1, 30, 30, 11),
(561100, 10, 10, 1, 30, 30, 11),
(565924, 10, 10, 1, 30, 30, 11),
(570056, 10, 7, 1, 30, 30, 11),
(613374, 10, 10, 1, 30, 30, 11),
(699653, 10, 7, 1, 30, 30, 11),
(768767, 10, 7, 1, 30, 30, 16),
(853636, 10, 7, 1, 30, 30, 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `practice_scores`
--
 
CREATE TABLE `practice_scores` (
  `student_id` int(11) NOT NULL,
  `practice_code` int(11) NOT NULL,
  `score_number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `score_detail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `completion_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `practice_scores`
--

INSERT INTO `practice_scores` (`student_id`, `practice_code`, `score_number`, `score_detail`, `completion_time`) VALUES
(11, 52964, '8.67', '26/30', '2023-04-06 21:31:28'),
(11, 269233, '4.67', '14/30', '2023-04-03 01:10:59'),
(11, 359250, '7.67', '23/30', '2023-04-02 23:44:31'),
(11, 565924, '0', '0/30', '2023-04-13 23:40:57'),
(11, 570056, '5', '15/30', '2023-04-03 21:57:25'),
(11, 613374, '9.33', '28/30', '2023-04-02 23:01:18'),
(11, 699653, '1.67', '5/30', '2023-04-11 13:26:05'),
(11, 853636, '5.67', '17/30', '2023-04-03 21:58:44'),
(12, 301006, '7', '21/30', '2023-04-02 23:05:52'),
(16, 768767, '8', '24/30', '2023-04-03 22:23:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `questions`
--

CREATE TABLE `questions` (
  `grade_id` int(10) NOT NULL,
  `unit` int(2) NOT NULL,
  `level_id` int(11) DEFAULT NULL,
  `question_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `answer_a` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `answer_b` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `answer_c` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `answer_d` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `correct_answer` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `question_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL DEFAULT 1,
  `teacher_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `suggest` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `questions`
--

INSERT INTO `questions` (`grade_id`, `unit`, `level_id`, `question_content`, `answer_a`, `answer_b`, `answer_c`, `answer_d`, `correct_answer`, `question_id`, `subject_id`, `teacher_id`, `status_id`, `suggest`) VALUES
(10, 1, 1, 'Thành phần hoá học của chất nhiễm sắc trong nhân tế bào là:', 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ADN và prôtêin.', 1319, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Thuật ngữ nào dưới đây bao gồm các thuật ngữ còn lại ?', 'Đường đơn', 'đường đôi', 'Đường đa', 'Cabonhidrat', 'Cacbonhidrat', 1320, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Thế giới sinh vật được phân loại thành các nhóm theo trình tự lớn dần là:  ', 'A. giới - ngành - lớp - bộ - họ - chi - loài.\n', 'B. loài - bộ - họ - chi - lớp - ngành - giới.\n', 'C. loài - chi- họ -  bộ -  lớp - ngành - giới.\n', 'D. loài -  chi - bộ - họ - lớp - ngành - giới.\n', 'A. giới - ngành - lớp - bộ - họ - chi - loài.\n', 1321, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Thành phần hoá học của chất nhiễm sắc trong nhân tế bào là:', 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ADN và prôtêin.', 1322, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Các nguyên tố vi lư­ợng thư­ờng cần một lượng rất nhỏ đối với thực vật vì:', ' phần lớn chúng đã có trong các hợp chất của thực vật.', ' chức năng chính của chúng là hoạt hoá các emzym.', 'chúng đóng vai trò thứ yếu đối với thực vật.', 'chúng chỉ cần cho thực vật ở một vài giai đoạn sinh tr­ưởng nhất định.', 'chức năng chính của chúng là hoạt hoá các emzym.', 1323, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Năng lượng tích luỹ trong các liên kết hoá học của các chất hữu cơ trong tế bào được gọi là', 'Hoá năng', ' Nhiệt năng', 'Điện năng\n', 'Động năng ', 'Hoá năng', 1324, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Thành phần nào sau đây không có ở cấu tạo của tế bào vi khuẩn ?', 'Màng sinh chất ', '. Mạng lưới nội chất', 'Prôtêin và lipit', 'Vỏ nhày', '. Mạng lưới nội chất', 1325, 10, 1, 4, 'Thành phần màng sinh chất\r\n không có ở cấu tạo của tế bào vi khuẩn'),
(10, 1, 1, ' Giữa các nuclêôtit trên 2 mạch của phân tử ADN có :', 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ADN và prôtêin.', 1326, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Thành phần hoá học của chất nhiễm sắc trong nhân tế bào là:', 'ARN và gluxit', 'G liên kết với X bằng 2 liên kết hiđrô.', 'Prôtêin và lipit', 'Các liên kết hidrô theo nguyên tắc bổ sung.', 'Các liên kết hidrô theo nguyên tắc bổ sung.', 1327, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, ' Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Hai lớp photphorit và không có prôtêin', 'Một lớp photphorit và không có prôtêin', 'Một lớp photphorit và các phân tử prôtêin', 'Cả A, B, C đều đúng', 'Hai lớp photphorit và không có prôtêin', 1328, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, ' Ngành thực vật có thể giao tử chiếm ưu thế so với thể bào tử là ngành', ' Phân giải prôtêin ', 'Phân giải lipit thành axit béo và glixêin', 'Prôtêin và lipit', 'Rêu', 'Rêu', 1329, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Thành phần hoá học của chất nhiễm sắc trong nhân tế bào là:', 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ADN và prôtêin.', 1330, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Thành phần hoá học của chất nhiễm sắc trong nhân tế bào là:', 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ADN và prôtêin.', 1331, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Thành phần hoá học của chất nhiễm sắc trong nhân tế bào là:', 'Enzim Prôtêaza có tác dụng xúc tác quá trình nào sau đây ?', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ADN và prôtêin.', 1332, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Thành phần hoá học của chất nhiễm sắc trong nhân tế bào là:', 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ADN và prôtêin.', 1333, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Giới nguyên sinh bao gồm', 'vi sinh vật, động vật nguyên sinh.', 'vi sinh vật, tảo, nấm, động vật nguyên sinh .', ' tảo, nấm, động vật nguyên sinh.', 'tảo, nấm nhày, động vật nguyên sinh.', 'tảo, nấm nhày, động vật nguyên sinh.', 1334, 10, 1, 4, 'tảo, nấm nhày, động vật nguyên sinh.là đáp án đúng'),
(10, 1, 1, 'Thành phần hoá học của chất nhiễm sắc trong nhân tế bào là:', 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ADN và prôtêin.', 1335, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Thành phần hoá học của chất nhiễm sắc trong nhân tế bào là:', 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ADN và prôtêin.', 1336, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Thành phần hoá học của chất nhiễm sắc trong nhân tế bào là:', 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ADN và prôtêin.', 1337, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Thành phần hoá học của chất nhiễm sắc trong nhân tế bào là:', '', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ADN và prôtêin.', 1338, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Thành phần hoá học của chất nhiễm sắc trong nhân tế bào là:', 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ADN và prôtêin.', 1339, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Thành phần hoá học của chất nhiễm sắc trong nhân tế bào là:', 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ADN và prôtêin.', 1340, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Thành phần hoá học của chất nhiễm sắc trong nhân tế bào là:', 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ADN và prôtêin.', 1341, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Thành phần hoá học của chất nhiễm sắc trong nhân tế bào là:', 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ADN và prôtêin.', 1342, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Thành phần hoá học của chất nhiễm sắc trong nhân tế bào là:', 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ADN và prôtêin.', 1343, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Thành phần hoá học của chất nhiễm sắc trong nhân tế bào là:', 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ADN và prôtêin.', 1344, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1345, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1346, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, ' Chất nhiễm sắc khi co xoắn lại sẽ hình hành cấu trúc nào sau đây ?', 'Một lớp photphorit và các phân tử prôtêin', 'Phân tửADN', 'Nhiễm sắc thể', 'Hai lớp photphorit và không có prôtêin', 'Nhiễm sắc thể', 1347, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Trong tự nhiên, prôtêin có cấu trúc mấy bậc khác nhau ?', '1', '2', '3', '4', '4', 1348, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1349, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1350, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1351, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nước có đặc tính nào  sau đây ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1352, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1353, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1354, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1355, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1356, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Loại liên kết hoá học giữa axit béo và glixêrol trong phân tử Triglixêric', 'Liên kết hidrô', ' Liên kết este', 'Liên kết peptit', 'Hai lớp photphorit và không có prôtêin', ' Liên kết este', 1357, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Vùng nhân', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1358, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Chức năng di truyền ở vi khuẩn được thực hiện bởi :', 'Màng sinh chất ', 'Vùng nhân', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Vùng nhân', 1359, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1360, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1361, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1362, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1363, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1364, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1365, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1366, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1367, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1368, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1369, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1370, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Nội dung nào sau đây đúng khi nói về thành phần hoá học chính của màng sinh chất ?', 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 1371, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Sản phẩm chủ yếu được tạo ra từ hoạt động của ti thể là chất nào sau đây ?', 'Pôlisaccarit', 'năng lượng dự trữ ', 'axit nuclêic', 'Các chất dự trữ', 'năng lượng dự trữ ', 1372, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1373, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1374, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Các cấp tổ chức của thế giới sống đều là những hệ mở vì:', 'có khả năng thích nghi với môi trường.', 'thường xuyên trao đổi chất với môi trường.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'có khả năng sinh sản để duy trì nòi giống.', 'thường xuyên trao đổi chất với môi trường.', 1375, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'thường xuyên trao đổi chất với môi trường.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'có khả năng sinh sản để duy trì nòi giống.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1376, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1377, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1378, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Đặc điểm cơ bản nhất để phân biệt ngành động vật có xương sống với động vật không xương sống là', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'cơ thể đối xứng 2 bên và có bộ xương ngoài. ', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'có bộ xương trong và cột sống.', 'có bộ xương trong và cột sống.', 1379, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Ngoài bazơ nitric có trong phân tử còn lại của phân tử ATP là :', '3 phân tử đường ribô và 1 nhóm phôtphat', '1 phân tử đường ribô và 3 nhóm phôtphat', '3 phân tử đường đêôxiribô và 1 nhóm phôtpha', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', '3 phân tử đường đêôxiribô và 1 nhóm phôtpha', 1380, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1381, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1382, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1383, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1384, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1385, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1386, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1387, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1388, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Đặc điểm của phân tử prôtêin bậc 1 là :', 'Chuỗi pôlipeptit ở dạng không xoắn cuộn.', 'Chuỗi pôlipeptit ở dạng cuộn tạo dạng hình cầu.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'Chuỗi pôlipeptit ở dạng không xoắn cuộn.', 1389, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1390, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1391, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1392, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Giới khởi sinh gồm:', 'virut và vi khuẩn lam.', 'nấm và vi khuẩn.', ' vi khuẩn và vi khuẩn lam.', 'tảo và vi khuẩn lam.', ' vi khuẩn và vi khuẩn lam.', 1393, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1394, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1395, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1396, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Người ta chia làm 2 loại vi khuẩn, vi khuẩn gram âm và vi khuẩn gram dương dựa vào yếu tố sau đây ?', 'Cấu trúc của plasmit.', 'Cấu trúc và thành phần hoá học của thành tế bào. ', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'Số lượng nhiễm sắc thể trong nhân hay vùng nhân.', 'Cấu trúc và thành phần hoá học của thành tế bào. ', 1397, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1398, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1399, 10, 1, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Khi tìm kiếm sự sống ở các hành tinh khác trong vũ trụ, các nhà khoa học trước hết tìm kiếm xem ở đó có nước hay không vì', 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 1400, 10, 1, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '2', '11', 'Dễ', 1401, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '3', '12', 'Dễ', 1402, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '4', '13', 'Dễ', 1403, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '5', '14', 'Dễ', 1404, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '6', '15', 'Dễ', 1405, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '7', '16', 'Dễ', 1406, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '8', '17', 'Dễ', 1407, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '9', '18', 'Dễ', 1408, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '10', '19', 'Dễ', 1409, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '11', '20', 'Dễ', 1410, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '12', '21', 'Dễ', 1411, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '13', '22', 'Dễ', 1412, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '14', '23', 'Dễ', 1413, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '15', '24', 'Dễ', 1414, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '16', '25', 'Dễ', 1415, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '17', '26', 'Dễ', 1416, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '18', '27', 'Dễ', 1417, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '19', '28', 'Dễ', 1418, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '20', '29', 'Dễ', 1419, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '21', '30', 'Dễ', 1420, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '22', '31', 'Dễ', 1421, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '23', '32', 'Dễ', 1422, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '24', '33', 'Dễ', 1423, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '25', '34', 'Dễ', 1424, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '26', '35', 'Dễ', 1425, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Hóa 11', 'Dễ', '5', '27', '36', 'Dễ', 1426, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '28', '37', 'trung bình', 1427, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '29', '38', 'trung bình', 1428, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '30', '39', 'trung bình', 1429, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '31', '40', 'trung bình', 1430, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '32', '41', 'trung bình', 1431, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '33', '42', 'trung bình', 1432, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '34', '43', 'trung bình', 1433, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '35', '44', 'trung bình', 1434, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '36', '45', 'trung bình', 1435, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '37', '46', 'trung bình', 1436, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '38', '47', 'trung bình', 1437, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '39', '48', 'trung bình', 1438, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '40', '49', 'trung bình', 1439, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '41', '50', 'trung bình', 1440, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '42', '51', 'trung bình', 1441, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '43', '52', 'trung bình', 1442, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '44', '53', 'trung bình', 1443, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '45', '54', 'trung bình', 1444, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '46', '55', 'trung bình', 1445, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '47', '56', 'trung bình', 1446, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '48', '57', 'trung bình', 1447, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '49', '58', 'trung bình', 1448, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '50', '59', 'trung bình', 1449, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '51', '60', 'trung bình', 1450, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '52', '61', 'trung bình', 1451, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '53', '62', 'trung bình', 1452, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Hóa 11', 'trung bình', '5', '54', '63', 'trung bình', 1453, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '55', '64', 'khó', 1454, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '56', '65', 'khó', 1455, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '57', '66', 'khó', 1456, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '58', '67', 'khó', 1457, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '59', '68', 'khó', 1458, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '60', '69', 'khó', 1459, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '61', '70', 'khó', 1460, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '62', '71', 'khó', 1461, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '63', '72', 'khó', 1462, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '64', '73', 'khó', 1463, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '65', '74', 'khó', 1464, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '66', '75', 'khó', 1465, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '67', '76', 'khó', 1466, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '68', '77', 'khó', 1467, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '69', '78', 'khó', 1468, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '70', '79', 'khó', 1469, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '71', '80', 'khó', 1470, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '72', '81', 'khó', 1471, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '73', '82', 'khó', 1472, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '74', '83', 'khó', 1473, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '75', '84', 'khó', 1474, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '76', '85', 'khó', 1475, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '77', '86', 'khó', 1476, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '78', '87', 'khó', 1477, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '79', '88', 'khó', 1478, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '80', '89', 'khó', 1479, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '81', '90', 'khó', 1480, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '82', '91', 'khó', 1481, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Hóa 11', 'khó', '5', '83', '92', 'khó', 1482, 9, 4, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '2', '11', 'Dễ', 1483, 1, 2, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '3', '12', 'Dễ', 1484, 1, 2, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '4', '13', 'Dễ', 1485, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '5', '14', 'Dễ', 1486, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '6', '15', 'Dễ', 1487, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '7', '16', 'Dễ', 1488, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '8', '17', 'Dễ', 1489, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '9', '18', 'Dễ', 1490, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '10', '19', 'Dễ', 1491, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '11', '20', 'Dễ', 1492, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '12', '21', 'Dễ', 1493, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '13', '22', 'Dễ', 1494, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '14', '23', 'Dễ', 1495, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '15', '24', 'Dễ', 1496, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '16', '25', 'Dễ', 1497, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '17', '26', 'Dễ', 1498, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '18', '27', 'Dễ', 1499, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '19', '28', 'Dễ', 1500, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '20', '29', 'Dễ', 1501, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '21', '30', 'Dễ', 1502, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '22', '31', 'Dễ', 1503, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '23', '32', 'Dễ', 1504, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '24', '33', 'Dễ', 1505, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '25', '34', 'Dễ', 1506, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '26', '35', 'Dễ', 1507, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Toán 11', 'Dễ', '5', '27', '36', 'Dễ', 1508, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '28', '37', 'trung bình', 1509, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '29', '38', 'trung bình', 1510, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '30', '39', 'trung bình', 1511, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '31', '40', 'trung bình', 1512, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '32', '41', 'trung bình', 1513, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '33', '42', 'trung bình', 1514, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '34', '43', 'trung bình', 1515, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '35', '44', 'trung bình', 1516, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '36', '45', 'trung bình', 1517, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '37', '46', 'trung bình', 1518, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '38', '47', 'trung bình', 1519, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '39', '48', 'trung bình', 1520, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '40', '49', 'trung bình', 1521, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '41', '50', 'trung bình', 1522, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '42', '51', 'trung bình', 1523, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '43', '52', 'trung bình', 1524, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '44', '53', 'trung bình', 1525, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '45', '54', 'trung bình', 1526, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '46', '55', 'trung bình', 1527, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '47', '56', 'trung bình', 1528, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '48', '57', 'trung bình', 1529, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '49', '58', 'trung bình', 1530, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '50', '59', 'trung bình', 1531, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '51', '60', 'trung bình', 1532, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '52', '61', 'trung bình', 1533, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '53', '62', 'trung bình', 1534, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Toán 11', 'trung bình', '5', '54', '63', 'trung bình', 1535, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '55', '64', 'khó', 1536, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '56', '65', 'khó', 1537, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '57', '66', 'khó', 1538, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '58', '67', 'khó', 1539, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '59', '68', 'khó', 1540, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '60', '69', 'khó', 1541, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '61', '70', 'khó', 1542, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '62', '71', 'khó', 1543, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '63', '72', 'khó', 1544, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '64', '73', 'khó', 1545, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '65', '74', 'khó', 1546, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '66', '75', 'khó', 1547, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '67', '76', 'khó', 1548, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '68', '77', 'khó', 1549, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '69', '78', 'khó', 1550, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '70', '79', 'khó', 1551, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '71', '80', 'khó', 1552, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '72', '81', 'khó', 1553, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '73', '82', 'khó', 1554, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '74', '83', 'khó', 1555, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '75', '84', 'khó', 1556, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '76', '85', 'khó', 1557, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '77', '86', 'khó', 1558, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '78', '87', 'khó', 1559, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '79', '88', 'khó', 1560, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '80', '89', 'khó', 1561, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '81', '90', 'khó', 1562, 1, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '82', '91', 'khó', 1563, 1, 2, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Toán 11', 'khó', '5', '83', '92', 'khó', 1564, 1, 2, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '2', '11', 'Dễ', 1565, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '3', '12', 'Dễ', 1566, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '4', '13', 'Dễ', 1567, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '5', '14', 'Dễ', 1568, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '6', '15', 'Dễ', 1569, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '7', '16', 'Dễ', 1570, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '8', '17', 'Dễ', 1571, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '9', '18', 'Dễ', 1572, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '10', '19', 'Dễ', 1573, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '11', '20', 'Dễ', 1574, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '12', '21', 'Dễ', 1575, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '13', '22', 'Dễ', 1576, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '14', '23', 'Dễ', 1577, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '15', '24', 'Dễ', 1578, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '16', '25', 'Dễ', 1579, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '17', '26', 'Dễ', 1580, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '18', '27', 'Dễ', 1581, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '19', '28', 'Dễ', 1582, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '20', '29', 'Dễ', 1583, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '21', '30', 'Dễ', 1584, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '22', '31', 'Dễ', 1585, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '23', '32', 'Dễ', 1586, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '24', '33', 'Dễ', 1587, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '25', '34', 'Dễ', 1588, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '26', '35', 'Dễ', 1589, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Anh 11', 'Dễ', '5', '27', '36', 'Dễ', 1590, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '28', '37', 'trung bình', 1591, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '29', '38', 'trung bình', 1592, 8, 5, 3, 'Nội dung gợi ý ');
INSERT INTO `questions` (`grade_id`, `unit`, `level_id`, `question_content`, `answer_a`, `answer_b`, `answer_c`, `answer_d`, `correct_answer`, `question_id`, `subject_id`, `teacher_id`, `status_id`, `suggest`) VALUES
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '30', '39', 'trung bình', 1593, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '31', '40', 'trung bình', 1594, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '32', '41', 'trung bình', 1595, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '33', '42', 'trung bình', 1596, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '34', '43', 'trung bình', 1597, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '35', '44', 'trung bình', 1598, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '36', '45', 'trung bình', 1599, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '37', '46', 'trung bình', 1600, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '38', '47', 'trung bình', 1601, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '39', '48', 'trung bình', 1602, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '40', '49', 'trung bình', 1603, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '41', '50', 'trung bình', 1604, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '42', '51', 'trung bình', 1605, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '43', '52', 'trung bình', 1606, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '44', '53', 'trung bình', 1607, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '45', '54', 'trung bình', 1608, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '46', '55', 'trung bình', 1609, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '47', '56', 'trung bình', 1610, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '48', '57', 'trung bình', 1611, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '49', '58', 'trung bình', 1612, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '50', '59', 'trung bình', 1613, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '51', '60', 'trung bình', 1614, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '52', '61', 'trung bình', 1615, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '53', '62', 'trung bình', 1616, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Anh 11', 'trung bình', '5', '54', '63', 'trung bình', 1617, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 11', 'khó', '5', '55', '64', 'khó', 1618, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 12', 'khó', '5', '56', '65', 'khó', 1619, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 13', 'khó', '5', '57', '66', 'khó', 1620, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 14', 'khó', '5', '58', '67', 'khó', 1621, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 15', 'khó', '5', '59', '68', 'khó', 1622, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 16', 'khó', '5', '60', '69', 'khó', 1623, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 17', 'khó', '5', '61', '70', 'khó', 1624, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 18', 'khó', '5', '62', '71', 'khó', 1625, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 19', 'khó', '5', '63', '72', 'khó', 1626, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 20', 'khó', '5', '64', '73', 'khó', 1627, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 21', 'khó', '5', '65', '74', 'khó', 1628, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 22', 'khó', '5', '66', '75', 'khó', 1629, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 23', 'khó', '5', '67', '76', 'khó', 1630, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 24', 'khó', '5', '68', '77', 'khó', 1631, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 25', 'khó', '5', '69', '78', 'khó', 1632, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 26', 'khó', '5', '70', '79', 'khó', 1633, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 27', 'khó', '5', '71', '80', 'khó', 1634, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 28', 'khó', '5', '72', '81', 'khó', 1635, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 29', 'khó', '5', '73', '82', 'khó', 1636, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 30', 'khó', '5', '74', '83', 'khó', 1637, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 31', 'khó', '5', '75', '84', 'khó', 1638, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 32', 'khó', '5', '76', '85', 'khó', 1639, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 33', 'khó', '5', '77', '86', 'khó', 1640, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 34', 'khó', '5', '78', '87', 'khó', 1641, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 35', 'khó', '5', '79', '88', 'khó', 1642, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 36', 'khó', '5', '80', '89', 'khó', 1643, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 37', 'khó', '5', '81', '90', 'khó', 1644, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 38', 'khó', '5', '82', '91', 'khó', 1645, 8, 5, 3, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Anh 39', 'khó', '5', '83', '92', 'khó', 1646, 8, 5, 3, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '2', '11', 'Dễ', 1647, 5, 6, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '3', '12', 'Dễ', 1648, 5, 6, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '4', '13', 'Dễ', 1649, 5, 6, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '5', '14', 'Dễ', 1650, 5, 6, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '6', '15', 'Dễ', 1651, 5, 6, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '7', '16', 'Dễ', 1652, 5, 6, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '8', '17', 'Dễ', 1653, 5, 6, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '9', '18', 'Dễ', 1654, 5, 6, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '10', '19', 'Dễ', 1655, 5, 6, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '11', '20', 'Dễ', 1656, 5, 6, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '12', '21', 'Dễ', 1657, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '13', '22', 'Dễ', 1658, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '14', '23', 'Dễ', 1659, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '15', '24', 'Dễ', 1660, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '16', '25', 'Dễ', 1661, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '17', '26', 'Dễ', 1662, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '18', '27', 'Dễ', 1663, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '19', '28', 'Dễ', 1664, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '20', '29', 'Dễ', 1665, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '21', '30', 'Dễ', 1666, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '22', '31', 'Dễ', 1667, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '23', '32', 'Dễ', 1668, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '24', '33', 'Dễ', 1669, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '25', '34', 'Dễ', 1670, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '26', '35', 'Dễ', 1671, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 1, 'Câu hỏi Dễ Vật lý 12', 'Dễ', '5', '27', '36', 'Dễ', 1672, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '28', '37', 'trung bình', 1673, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '29', '38', 'trung bình', 1674, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '30', '39', 'trung bình', 1675, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '31', '40', 'trung bình', 1676, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '32', '41', 'trung bình', 1677, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '33', '42', 'trung bình', 1678, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '34', '43', 'trung bình', 1679, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '35', '44', 'trung bình', 1680, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '36', '45', 'trung bình', 1681, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '37', '46', 'trung bình', 1682, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '38', '47', 'trung bình', 1683, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '39', '48', 'trung bình', 1684, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '40', '49', 'trung bình', 1685, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '41', '50', 'trung bình', 1686, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '42', '51', 'trung bình', 1687, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '43', '52', 'trung bình', 1688, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '44', '53', 'trung bình', 1689, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '45', '54', 'trung bình', 1690, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '46', '55', 'trung bình', 1691, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '47', '56', 'trung bình', 1692, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '48', '57', 'trung bình', 1693, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '49', '58', 'trung bình', 1694, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '50', '59', 'trung bình', 1695, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '51', '60', 'trung bình', 1696, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '52', '61', 'trung bình', 1697, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '53', '62', 'trung bình', 1698, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 2, 'Câu hỏi TB Vật lý 12', 'trung bình', '5', '54', '63', 'trung bình', 1699, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '55', '64', 'khó', 1700, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '56', '65', 'khó', 1701, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '57', '66', 'khó', 1702, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '58', '67', 'khó', 1703, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '59', '68', 'khó', 1704, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '60', '69', 'khó', 1705, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '61', '70', 'khó', 1706, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '62', '71', 'khó', 1707, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '63', '72', 'khó', 1708, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '64', '73', 'khó', 1709, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '65', '74', 'khó', 1710, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '66', '75', 'khó', 1711, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '67', '76', 'khó', 1712, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '68', '77', 'khó', 1713, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '69', '78', 'khó', 1714, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '70', '79', 'khó', 1715, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '71', '80', 'khó', 1716, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '72', '81', 'khó', 1717, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '73', '82', 'khó', 1718, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '74', '83', 'khó', 1719, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '75', '84', 'khó', 1720, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '76', '85', 'khó', 1721, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '77', '86', 'khó', 1722, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '78', '87', 'khó', 1723, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '79', '88', 'khó', 1724, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '80', '89', 'khó', 1725, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '81', '90', 'khó', 1726, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '82', '91', 'khó', 1727, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 3, 'Câu hỏi Khó Vật lý 12', 'khó', '5', '83', '92', 'khó', 1728, 5, 6, 3, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1729, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1730, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1731, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1732, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1733, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1734, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1735, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1736, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1737, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1738, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1739, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1740, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1741, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1742, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1743, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1744, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1745, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1746, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1747, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1748, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1749, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1750, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1751, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1752, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1753, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1754, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1755, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1756, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1757, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1758, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1759, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1760, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1761, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1762, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1763, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1764, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1765, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1766, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1767, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1768, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1769, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1770, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1771, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1772, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1773, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1774, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1775, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1776, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1777, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1778, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1779, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1780, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1781, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1782, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1783, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1784, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1785, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1786, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1787, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1788, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1789, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1790, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1791, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1792, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1793, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1794, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1795, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1796, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1797, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1798, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1799, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1800, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1801, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1802, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1803, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1804, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1805, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1806, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1807, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1808, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1809, 7, 3, 4, 'Nội dung gợi ý '),
(12, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1810, 7, 3, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1811, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1812, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1813, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1814, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1815, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1816, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1817, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1818, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1819, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1820, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1821, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1822, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1823, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1824, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1825, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1826, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1827, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1828, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1829, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1830, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1831, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1832, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1833, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1834, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1835, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 1, 'Hệ thống các quy tắc xử sự chung do nhà nước ban hành và được đảm bảo thực hiện bằng quyền lực nhà nước là khái niệm của', 'Pháp luật', 'Quy chế', 'Quy định', 'Pháp lệnh', 'Pháp luật', 1836, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1837, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1838, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1839, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1840, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1841, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1842, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1843, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1844, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1845, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1846, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1847, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1848, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1849, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1850, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1851, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1852, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1853, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1854, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1855, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1856, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1857, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1858, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1859, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1860, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1861, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1862, 7, 5, 4, 'Nội dung gợi ý ');
INSERT INTO `questions` (`grade_id`, `unit`, `level_id`, `question_content`, `answer_a`, `answer_b`, `answer_c`, `answer_d`, `correct_answer`, `question_id`, `subject_id`, `teacher_id`, `status_id`, `suggest`) VALUES
(10, 1, 2, 'Đặc trưng nào là đặc điểm phân biệt quy phạm pháp luật với quy phạm đạo đức?', 'Tính quy phạm phổ biến', 'Tính quyền lực, bắt buộc chung', 'Tính xác định chặt chẽ về mặt hình thức.', 'Tính giáo dục, thuyết phục.', 'Tính quyền lực, bắt buộc chung', 1863, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1864, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1865, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1866, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1867, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1868, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1869, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1870, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1871, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1872, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1873, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1874, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1875, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1876, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1877, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1878, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1879, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1880, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1881, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1882, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1883, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1884, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1885, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1886, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1887, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1888, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1889, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1890, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1891, 7, 5, 4, 'Nội dung gợi ý '),
(10, 1, 3, 'Cá nhân, tổ chức thực hiện đầy đủ những nghĩa vụ, chủ động làm những gì mà pháp luật quy định phải làm là hình thức', 'Sử dụng pháp luật.', 'Thi hành pháp luật.', 'Tuân thủ pháp luật', 'Áp dụng pháp luật.', 'Thi hành pháp luật.', 1892, 7, 5, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '2', '11', 'Dễ', 1893, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '3', '12', 'Dễ', 1894, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '4', '13', 'Dễ', 1895, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '5', '14', 'Dễ', 1896, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '6', '15', 'Dễ', 1897, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '7', '16', 'Dễ', 1898, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '8', '17', 'Dễ', 1899, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '9', '18', 'Dễ', 1900, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '10', '19', 'Dễ', 1901, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '11', '20', 'Dễ', 1902, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '12', '21', 'Dễ', 1903, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '13', '22', 'Dễ', 1904, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '14', '23', 'Dễ', 1905, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '15', '24', 'Dễ', 1906, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '16', '25', 'Dễ', 1907, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '17', '26', 'Dễ', 1908, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '18', '27', 'Dễ', 1909, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '19', '28', 'Dễ', 1910, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '20', '29', 'Dễ', 1911, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '21', '30', 'Dễ', 1912, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '22', '31', 'Dễ', 1913, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '23', '32', 'Dễ', 1914, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '24', '33', 'Dễ', 1915, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '25', '34', 'Dễ', 1916, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '26', '35', 'Dễ', 1917, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 1, 'Câu hỏi Dễ Lịch sử 11', 'Dễ', '5', '27', '36', 'Dễ', 1918, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '28', '37', 'trung bình', 1919, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '29', '38', 'trung bình', 1920, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '30', '39', 'trung bình', 1921, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '31', '40', 'trung bình', 1922, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '32', '41', 'trung bình', 1923, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '33', '42', 'trung bình', 1924, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '34', '43', 'trung bình', 1925, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '35', '44', 'trung bình', 1926, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '36', '45', 'trung bình', 1927, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '37', '46', 'trung bình', 1928, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '38', '47', 'trung bình', 1929, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '39', '48', 'trung bình', 1930, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '40', '49', 'trung bình', 1931, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '41', '50', 'trung bình', 1932, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '42', '51', 'trung bình', 1933, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '43', '52', 'trung bình', 1934, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '44', '53', 'trung bình', 1935, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '45', '54', 'trung bình', 1936, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '46', '55', 'trung bình', 1937, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '47', '56', 'trung bình', 1938, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '48', '57', 'trung bình', 1939, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '49', '58', 'trung bình', 1940, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '50', '59', 'trung bình', 1941, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '51', '60', 'trung bình', 1942, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '52', '61', 'trung bình', 1943, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '53', '62', 'trung bình', 1944, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 2, 'Câu hỏi TB Lịch sử 11', 'trung bình', '5', '54', '63', 'trung bình', 1945, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '55', '64', 'khó', 1946, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '56', '65', 'khó', 1947, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '57', '66', 'khó', 1948, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '58', '67', 'khó', 1949, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '59', '68', 'khó', 1950, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '60', '69', 'khó', 1951, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '61', '70', 'khó', 1952, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '62', '71', 'khó', 1953, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '63', '72', 'khó', 1954, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '64', '73', 'khó', 1955, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '65', '74', 'khó', 1956, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '66', '75', 'khó', 1957, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '67', '76', 'khó', 1958, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '68', '77', 'khó', 1959, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '69', '78', 'khó', 1960, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '70', '79', 'khó', 1961, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '71', '80', 'khó', 1962, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '72', '81', 'khó', 1963, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '73', '82', 'khó', 1964, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '74', '83', 'khó', 1965, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '75', '84', 'khó', 1966, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '76', '85', 'khó', 1967, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '77', '86', 'khó', 1968, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '78', '87', 'khó', 1969, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '79', '88', 'khó', 1970, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '80', '89', 'khó', 1971, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '81', '90', 'khó', 1972, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '82', '91', 'khó', 1973, 3, 2, 4, 'Nội dung gợi ý '),
(11, 1, 3, 'Câu hỏi Khó Lịch sử 11', 'khó', '5', '83', '92', 'khó', 1974, 3, 2, 4, 'Nội dung gợi ý '),
(10, 5, 1, 'Công nghệ vi sinh vật là', 'lĩnh vực nghiên cứu, ứng dụng vi sinh vật trong sản xuất, chế biến các sản phẩm phục vụ đời sống con người', ' lĩnh vực nghiên cứu, ứng dụng vi sinh vật trong sản xuất, chế biến các sản phẩm xử lí ô nhiễm môi trường.', 'lĩnh vực nghiên cứu, ứng dụng vi sinh vật trong sản xuất, chế biến các sản phẩm thuốc chữa bệnh cho người và động vật.', 'lĩnh vực nghiên cứu, ứng dụng vi sinh vật trong sản xuất, chế biến các loại đồ ăn, thức uống giàu giá trị dinh dưỡng.', 'lĩnh vực nghiên cứu, ứng dụng vi sinh vật trong sản xuất, chế biến các sản phẩm phục vụ đời sống con người', 1975, 10, 2, 3, 'Công nghệ vi sinh vật là lĩnh vực nghiên cứu, ứng dụng vi sinh vật trong sản xuất, chế biến các sản phẩm phục vụ đời sống con người. '),
(10, 5, 1, 'Cho các đặc điểm sau:\n\n(1) Có kích thước hiển vi.\n\n(2) Tốc độ trao đổi chất với môi trường nhanh.\n\n(3) Sinh trưởng và sinh sản nhanh.\n\n(4) Hình thức dinh dưỡng đa dạng.\n\nTrong số các đặc điểm trên, số đặc điểm là cơ sở khoa học của công nghệ vi sinh vật là', '1', '2', '3', '4', '1', 1976, 10, 2, 3, 'Cơ sở khoa học của việc ứng dụng công nghệ vi sinh vật là dựa trên các đặc điểm của vi sinh vật như: có kích thước hiển vi, tốc độ trao đổi chất với môi trường nhanh, sinh trưởng và sinh sản nhanh, có hình thức dinh dưỡng đa dạng.'),
(10, 5, 1, 'Cơ sở khoa học của việc sử dụng vi sinh vật để sản xuất phân bón sinh học là', 'một số vi sinh vật có khả năng sinh trưởng nhanh giúp tăng sinh khối cho cây trồng.', 'một số vi sinh vật có khả năng tiết chất độc diệt sâu, côn trùng gây hại cho cây trồng.', 'một số vi sinh vật có khả năng tiết hoặc chuyển hóa các chất có lợi cho cây trồng.', 'một số vi sinh vật có khả năng tiết enzyme giúp tăng tốc độ sinh sản cho cây trồng.', 'một số vi sinh vật có khả năng tiết hoặc chuyển hóa các chất có lợi cho cây trồng.', 1977, 10, 2, 3, 'Cơ sở khoa học của việc sử dụng vi sinh vật để sản xuất phân bón sinh học là một số vi sinh vật có khả năng tiết hoặc chuyển hóa các chất có lợi cho cây trồng như cố định đạm, phân giải cất hữu cơ và vô cơ khó hấp thụ thành các chất vô cơ mà cây có thể hấp thụ được.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quest_of_practice`
--

CREATE TABLE `quest_of_practice` (
  `practice_code` int(11) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `quest_of_practice`
--

INSERT INTO `quest_of_practice` (`practice_code`, `question_id`) VALUES
(52964, 1567),
(52964, 1568),
(52964, 1569),
(52964, 1571),
(52964, 1574),
(52964, 1575),
(52964, 1577),
(52964, 1578),
(52964, 1579),
(52964, 1580),
(52964, 1581),
(52964, 1582),
(52964, 1583),
(52964, 1585),
(52964, 1586),
(52964, 1587),
(52964, 1588),
(52964, 1589),
(52964, 1592),
(52964, 1596),
(52964, 1605),
(52964, 1613),
(52964, 1615),
(52964, 1617),
(52964, 1618),
(52964, 1622),
(52964, 1629),
(52964, 1634),
(52964, 1637),
(52964, 1645),
(269233, 1565),
(269233, 1567),
(269233, 1568),
(269233, 1569),
(269233, 1570),
(269233, 1571),
(269233, 1573),
(269233, 1575),
(269233, 1577),
(269233, 1579),
(269233, 1580),
(269233, 1583),
(269233, 1584),
(269233, 1585),
(269233, 1586),
(269233, 1588),
(269233, 1589),
(269233, 1590),
(269233, 1593),
(269233, 1594),
(269233, 1598),
(269233, 1600),
(269233, 1613),
(269233, 1614),
(269233, 1621),
(269233, 1629),
(269233, 1633),
(269233, 1634),
(269233, 1641),
(269233, 1646),
(301006, 1319),
(301006, 1330),
(301006, 1331),
(301006, 1332),
(301006, 1334),
(301006, 1340),
(301006, 1347),
(301006, 1350),
(301006, 1351),
(301006, 1352),
(301006, 1353),
(301006, 1354),
(301006, 1355),
(301006, 1356),
(301006, 1357),
(301006, 1359),
(301006, 1360),
(301006, 1361),
(301006, 1363),
(301006, 1364),
(301006, 1366),
(301006, 1367),
(301006, 1368),
(301006, 1369),
(301006, 1374),
(301006, 1376),
(301006, 1382),
(301006, 1392),
(301006, 1398),
(301006, 1399),
(359250, 1401),
(359250, 1403),
(359250, 1405),
(359250, 1406),
(359250, 1407),
(359250, 1409),
(359250, 1411),
(359250, 1413),
(359250, 1414),
(359250, 1415),
(359250, 1416),
(359250, 1417),
(359250, 1418),
(359250, 1419),
(359250, 1420),
(359250, 1421),
(359250, 1423),
(359250, 1426),
(359250, 1434),
(359250, 1436),
(359250, 1440),
(359250, 1442),
(359250, 1445),
(359250, 1450),
(359250, 1455),
(359250, 1463),
(359250, 1467),
(359250, 1472),
(359250, 1476),
(359250, 1481),
(561100, 1319),
(561100, 1320),
(561100, 1322),
(561100, 1323),
(561100, 1324),
(561100, 1327),
(561100, 1328),
(561100, 1329),
(561100, 1330),
(561100, 1333),
(561100, 1334),
(561100, 1337),
(561100, 1339),
(561100, 1340),
(561100, 1343),
(561100, 1344),
(561100, 1345),
(561100, 1346),
(561100, 1350),
(561100, 1360),
(561100, 1361),
(561100, 1370),
(561100, 1373),
(561100, 1377),
(561100, 1383),
(561100, 1392),
(561100, 1396),
(561100, 1399),
(561100, 1975),
(561100, 1976),
(565924, 1319),
(565924, 1323),
(565924, 1324),
(565924, 1325),
(565924, 1326),
(565924, 1327),
(565924, 1328),
(565924, 1331),
(565924, 1334),
(565924, 1335),
(565924, 1336),
(565924, 1337),
(565924, 1338),
(565924, 1340),
(565924, 1341),
(565924, 1342),
(565924, 1343),
(565924, 1347),
(565924, 1349),
(565924, 1350),
(565924, 1351),
(565924, 1352),
(565924, 1359),
(565924, 1375),
(565924, 1384),
(565924, 1385),
(565924, 1393),
(565924, 1397),
(565924, 1398),
(565924, 1976),
(570056, 1812),
(570056, 1813),
(570056, 1814),
(570056, 1816),
(570056, 1817),
(570056, 1818),
(570056, 1820),
(570056, 1825),
(570056, 1826),
(570056, 1827),
(570056, 1828),
(570056, 1829),
(570056, 1830),
(570056, 1831),
(570056, 1832),
(570056, 1833),
(570056, 1834),
(570056, 1836),
(570056, 1839),
(570056, 1848),
(570056, 1854),
(570056, 1857),
(570056, 1859),
(570056, 1861),
(570056, 1865),
(570056, 1867),
(570056, 1880),
(570056, 1881),
(570056, 1884),
(570056, 1885),
(613374, 1319),
(613374, 1320),
(613374, 1322),
(613374, 1323),
(613374, 1324),
(613374, 1327),
(613374, 1328),
(613374, 1329),
(613374, 1330),
(613374, 1331),
(613374, 1332),
(613374, 1333),
(613374, 1336),
(613374, 1339),
(613374, 1340),
(613374, 1341),
(613374, 1342),
(613374, 1344),
(613374, 1350),
(613374, 1352),
(613374, 1353),
(613374, 1355),
(613374, 1367),
(613374, 1369),
(613374, 1372),
(613374, 1373),
(613374, 1375),
(613374, 1379),
(613374, 1396),
(613374, 1397),
(699653, 1811),
(699653, 1812),
(699653, 1814),
(699653, 1815),
(699653, 1816),
(699653, 1818),
(699653, 1819),
(699653, 1820),
(699653, 1821),
(699653, 1823),
(699653, 1824),
(699653, 1825),
(699653, 1827),
(699653, 1831),
(699653, 1833),
(699653, 1834),
(699653, 1835),
(699653, 1836),
(699653, 1842),
(699653, 1847),
(699653, 1850),
(699653, 1853),
(699653, 1857),
(699653, 1860),
(699653, 1864),
(699653, 1870),
(699653, 1875),
(699653, 1881),
(699653, 1882),
(699653, 1883),
(768767, 1811),
(768767, 1813),
(768767, 1815),
(768767, 1816),
(768767, 1817),
(768767, 1818),
(768767, 1819),
(768767, 1820),
(768767, 1822),
(768767, 1824),
(768767, 1826),
(768767, 1827),
(768767, 1828),
(768767, 1829),
(768767, 1830),
(768767, 1832),
(768767, 1835),
(768767, 1836),
(768767, 1844),
(768767, 1845),
(768767, 1851),
(768767, 1855),
(768767, 1861),
(768767, 1862),
(768767, 1868),
(768767, 1870),
(768767, 1874),
(768767, 1876),
(768767, 1888),
(768767, 1892),
(853636, 1811),
(853636, 1812),
(853636, 1813),
(853636, 1815),
(853636, 1816),
(853636, 1818),
(853636, 1819),
(853636, 1820),
(853636, 1822),
(853636, 1823),
(853636, 1824),
(853636, 1825),
(853636, 1828),
(853636, 1830),
(853636, 1831),
(853636, 1833),
(853636, 1835),
(853636, 1836),
(853636, 1838),
(853636, 1840),
(853636, 1848),
(853636, 1856),
(853636, 1857),
(853636, 1858),
(853636, 1865),
(853636, 1866),
(853636, 1876),
(853636, 1882),
(853636, 1887),
(853636, 1889);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quest_of_test`
--

CREATE TABLE `quest_of_test` (
  `test_code` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `timest` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `quest_of_test`
--

INSERT INTO `quest_of_test` (`test_code`, `question_id`, `timest`) VALUES
(197966, 1565, '2023-04-04 16:39:00'),
(197966, 1566, '2023-04-04 16:39:00'),
(197966, 1567, '2023-04-04 16:39:00'),
(197966, 1568, '2023-04-04 16:39:00'),
(197966, 1569, '2023-04-04 16:39:00'),
(197966, 1570, '2023-04-04 16:39:00'),
(197966, 1571, '2023-04-04 16:39:00'),
(197966, 1572, '2023-04-04 16:39:00'),
(197966, 1573, '2023-04-04 16:39:00'),
(197966, 1574, '2023-04-04 16:39:00'),
(197966, 1576, '2023-04-04 16:39:00'),
(197966, 1577, '2023-04-04 16:39:00'),
(197966, 1578, '2023-04-04 16:39:00'),
(197966, 1579, '2023-04-04 16:39:00'),
(197966, 1580, '2023-04-04 16:39:00'),
(197966, 1581, '2023-04-04 16:39:00'),
(197966, 1582, '2023-04-04 16:39:00'),
(197966, 1583, '2023-04-04 16:39:00'),
(197966, 1584, '2023-04-04 16:39:00'),
(197966, 1585, '2023-04-04 16:39:00'),
(197966, 1586, '2023-04-04 16:39:00'),
(197966, 1587, '2023-04-04 16:39:00'),
(197966, 1589, '2023-04-04 16:39:00'),
(197966, 1590, '2023-04-04 16:39:00'),
(197966, 1593, '2023-04-04 16:39:00'),
(197966, 1597, '2023-04-04 16:39:00'),
(197966, 1600, '2023-04-04 16:39:00'),
(197966, 1603, '2023-04-04 16:39:00'),
(197966, 1604, '2023-04-04 16:39:00'),
(197966, 1608, '2023-04-04 16:39:00'),
(197966, 1611, '2023-04-04 16:39:00'),
(197966, 1613, '2023-04-04 16:39:00'),
(197966, 1623, '2023-04-04 16:39:00'),
(197966, 1627, '2023-04-04 16:39:00'),
(197966, 1631, '2023-04-04 16:39:00'),
(197966, 1632, '2023-04-04 16:39:00'),
(197966, 1640, '2023-04-04 16:39:00'),
(197966, 1644, '2023-04-04 16:39:00'),
(197966, 1645, '2023-04-04 16:39:00'),
(197966, 1646, '2023-04-04 16:39:00'),
(204521, 1736, '2023-04-03 14:47:38'),
(204521, 1738, '2023-04-03 14:47:38'),
(204521, 1739, '2023-04-03 14:47:38'),
(204521, 1741, '2023-04-03 14:47:38'),
(204521, 1742, '2023-04-03 14:47:38'),
(204521, 1744, '2023-04-03 14:47:38'),
(204521, 1752, '2023-04-03 14:47:38'),
(204521, 1753, '2023-04-03 14:47:38'),
(204521, 1755, '2023-04-03 14:47:38'),
(204521, 1758, '2023-04-03 14:47:38'),
(204521, 1761, '2023-04-03 14:47:38'),
(204521, 1763, '2023-04-03 14:47:38'),
(204521, 1767, '2023-04-03 14:47:38'),
(204521, 1768, '2023-04-03 14:47:38'),
(204521, 1774, '2023-04-03 14:47:38'),
(204521, 1775, '2023-04-03 14:47:38'),
(204521, 1782, '2023-04-03 14:47:38'),
(204521, 1783, '2023-04-03 14:47:38'),
(204521, 1784, '2023-04-03 14:47:38'),
(204521, 1786, '2023-04-03 14:47:38'),
(204521, 1788, '2023-04-03 14:47:38'),
(204521, 1789, '2023-04-03 14:47:38'),
(204521, 1790, '2023-04-03 14:47:38'),
(204521, 1791, '2023-04-03 14:47:38'),
(204521, 1792, '2023-04-03 14:47:38'),
(204521, 1794, '2023-04-03 14:47:38'),
(204521, 1795, '2023-04-03 14:47:38'),
(204521, 1796, '2023-04-03 14:47:38'),
(204521, 1798, '2023-04-03 14:47:38'),
(204521, 1799, '2023-04-03 14:47:38'),
(204521, 1800, '2023-04-03 14:47:38'),
(204521, 1802, '2023-04-03 14:47:38'),
(204521, 1803, '2023-04-03 14:47:38'),
(204521, 1804, '2023-04-03 14:47:38'),
(204521, 1805, '2023-04-03 14:47:38'),
(204521, 1806, '2023-04-03 14:47:38'),
(204521, 1807, '2023-04-03 14:47:38'),
(204521, 1808, '2023-04-03 14:47:38'),
(204521, 1809, '2023-04-03 14:47:38'),
(204521, 1810, '2023-04-03 14:47:38'),
(263414, 1320, '2023-04-13 16:25:32'),
(263414, 1323, '2023-04-13 16:25:32'),
(263414, 1324, '2023-04-13 16:25:32'),
(263414, 1325, '2023-04-13 16:25:32'),
(263414, 1332, '2023-04-13 16:25:32'),
(263414, 1335, '2023-04-13 16:25:32'),
(263414, 1336, '2023-04-13 16:25:32'),
(263414, 1341, '2023-04-13 16:25:32'),
(263414, 1342, '2023-04-13 16:25:32'),
(263414, 1344, '2023-04-13 16:25:32'),
(263414, 1345, '2023-04-13 16:25:32'),
(263414, 1346, '2023-04-13 16:25:32'),
(263414, 1347, '2023-04-13 16:25:32'),
(263414, 1349, '2023-04-13 16:25:32'),
(263414, 1350, '2023-04-13 16:25:32'),
(263414, 1351, '2023-04-13 16:25:32'),
(263414, 1354, '2023-04-13 16:25:32'),
(263414, 1355, '2023-04-13 16:25:32'),
(263414, 1356, '2023-04-13 16:25:32'),
(263414, 1357, '2023-04-13 16:25:32'),
(263414, 1358, '2023-04-13 16:25:32'),
(263414, 1360, '2023-04-13 16:25:32'),
(263414, 1361, '2023-04-13 16:25:32'),
(263414, 1364, '2023-04-13 16:25:32'),
(263414, 1365, '2023-04-13 16:25:32'),
(263414, 1366, '2023-04-13 16:25:32'),
(263414, 1367, '2023-04-13 16:25:32'),
(263414, 1369, '2023-04-13 16:25:32'),
(263414, 1370, '2023-04-13 16:25:32'),
(263414, 1371, '2023-04-13 16:25:32'),
(263414, 1376, '2023-04-13 16:25:32'),
(263414, 1377, '2023-04-13 16:25:32'),
(263414, 1378, '2023-04-13 16:25:32'),
(263414, 1379, '2023-04-13 16:25:32'),
(263414, 1380, '2023-04-13 16:25:32'),
(263414, 1381, '2023-04-13 16:25:32'),
(263414, 1382, '2023-04-13 16:25:32'),
(263414, 1383, '2023-04-13 16:25:32'),
(263414, 1384, '2023-04-13 16:25:32'),
(263414, 1385, '2023-04-13 16:25:32'),
(263414, 1386, '2023-04-13 16:25:32'),
(263414, 1389, '2023-04-13 16:25:32'),
(263414, 1390, '2023-04-13 16:25:32'),
(263414, 1391, '2023-04-13 16:25:32'),
(263414, 1392, '2023-04-13 16:25:32'),
(263414, 1394, '2023-04-13 16:25:32'),
(263414, 1395, '2023-04-13 16:25:32'),
(263414, 1396, '2023-04-13 16:25:32'),
(263414, 1398, '2023-04-13 16:25:32'),
(263414, 1400, '2023-04-13 16:25:32'),
(354471, 1896, '2023-04-11 08:00:38'),
(354471, 1898, '2023-04-11 08:00:38'),
(354471, 1901, '2023-04-11 08:00:38'),
(354471, 1904, '2023-04-11 08:00:38'),
(354471, 1907, '2023-04-11 08:00:38'),
(354471, 1914, '2023-04-11 08:00:38'),
(354471, 1917, '2023-04-11 08:00:38'),
(354471, 1918, '2023-04-11 08:00:38'),
(354471, 1919, '2023-04-11 08:00:38'),
(354471, 1920, '2023-04-11 08:00:38'),
(354471, 1921, '2023-04-11 08:00:38'),
(354471, 1923, '2023-04-11 08:00:38'),
(354471, 1924, '2023-04-11 08:00:38'),
(354471, 1925, '2023-04-11 08:00:38'),
(354471, 1926, '2023-04-11 08:00:38'),
(354471, 1927, '2023-04-11 08:00:38'),
(354471, 1928, '2023-04-11 08:00:38'),
(354471, 1929, '2023-04-11 08:00:38'),
(354471, 1930, '2023-04-11 08:00:38'),
(354471, 1931, '2023-04-11 08:00:38'),
(354471, 1932, '2023-04-11 08:00:38'),
(354471, 1933, '2023-04-11 08:00:38'),
(354471, 1934, '2023-04-11 08:00:38'),
(354471, 1935, '2023-04-11 08:00:38'),
(354471, 1936, '2023-04-11 08:00:38'),
(354471, 1937, '2023-04-11 08:00:38'),
(354471, 1938, '2023-04-11 08:00:38'),
(354471, 1939, '2023-04-11 08:00:38'),
(354471, 1940, '2023-04-11 08:00:38'),
(354471, 1941, '2023-04-11 08:00:38'),
(354471, 1944, '2023-04-11 08:00:38'),
(354471, 1945, '2023-04-11 08:00:38'),
(354471, 1947, '2023-04-11 08:00:38'),
(354471, 1951, '2023-04-11 08:00:38'),
(354471, 1958, '2023-04-11 08:00:38'),
(354471, 1961, '2023-04-11 08:00:38'),
(354471, 1962, '2023-04-11 08:00:38'),
(354471, 1972, '2023-04-11 08:00:38'),
(354471, 1973, '2023-04-11 08:00:38'),
(354471, 1974, '2023-04-11 08:00:38'),
(424315, 1566, '2023-04-02 18:03:51'),
(424315, 1567, '2023-04-02 18:03:50'),
(424315, 1573, '2023-04-02 18:03:50'),
(424315, 1574, '2023-04-02 18:03:50'),
(424315, 1575, '2023-04-02 18:03:51'),
(424315, 1582, '2023-04-02 18:03:51'),
(424315, 1583, '2023-04-02 18:03:50'),
(424315, 1587, '2023-04-02 18:03:51'),
(424315, 1592, '2023-04-02 18:03:51'),
(424315, 1593, '2023-04-02 18:03:51'),
(424315, 1594, '2023-04-02 18:03:51'),
(424315, 1596, '2023-04-02 18:03:51'),
(424315, 1600, '2023-04-02 18:03:51'),
(424315, 1601, '2023-04-02 18:03:51'),
(424315, 1608, '2023-04-02 18:03:51'),
(424315, 1617, '2023-04-02 18:03:51'),
(424315, 1619, '2023-04-02 18:03:51'),
(424315, 1620, '2023-04-02 18:03:51'),
(424315, 1621, '2023-04-02 18:03:51'),
(424315, 1622, '2023-04-02 18:03:51'),
(424315, 1623, '2023-04-02 18:03:51'),
(424315, 1624, '2023-04-02 18:03:51'),
(424315, 1625, '2023-04-02 18:03:51'),
(424315, 1627, '2023-04-02 18:03:51'),
(424315, 1628, '2023-04-02 18:03:51'),
(424315, 1629, '2023-04-02 18:03:51'),
(424315, 1630, '2023-04-02 18:03:51'),
(424315, 1631, '2023-04-02 18:03:51'),
(424315, 1632, '2023-04-02 18:03:51'),
(424315, 1633, '2023-04-02 18:03:51'),
(424315, 1634, '2023-04-02 18:03:51'),
(424315, 1636, '2023-04-02 18:03:51'),
(424315, 1637, '2023-04-02 18:03:51'),
(424315, 1638, '2023-04-02 18:03:51'),
(424315, 1640, '2023-04-02 18:03:51'),
(424315, 1641, '2023-04-02 18:03:51'),
(424315, 1642, '2023-04-02 18:03:51'),
(424315, 1643, '2023-04-02 18:03:51'),
(424315, 1645, '2023-04-02 18:03:51'),
(424315, 1646, '2023-04-02 18:03:51'),
(433331, 1319, '2023-04-04 17:27:55'),
(433331, 1320, '2023-04-04 17:27:55'),
(433331, 1321, '2023-04-04 17:27:55'),
(433331, 1322, '2023-04-04 17:27:55'),
(433331, 1323, '2023-04-04 17:27:55'),
(433331, 1324, '2023-04-04 17:27:55'),
(433331, 1325, '2023-04-04 17:27:55'),
(433331, 1326, '2023-04-04 17:27:55'),
(433331, 1328, '2023-04-04 17:27:55'),
(433331, 1329, '2023-04-04 17:27:55'),
(433331, 1330, '2023-04-04 17:27:55'),
(433331, 1331, '2023-04-04 17:27:55'),
(433331, 1332, '2023-04-04 17:27:55'),
(433331, 1333, '2023-04-04 17:27:55'),
(433331, 1334, '2023-04-04 17:27:55'),
(433331, 1335, '2023-04-04 17:27:55'),
(433331, 1336, '2023-04-04 17:27:55'),
(433331, 1337, '2023-04-04 17:27:55'),
(433331, 1338, '2023-04-04 17:27:55'),
(433331, 1339, '2023-04-04 17:27:55'),
(433331, 1341, '2023-04-04 17:27:55'),
(433331, 1342, '2023-04-04 17:27:55'),
(433331, 1343, '2023-04-04 17:27:55'),
(433331, 1344, '2023-04-04 17:27:55'),
(433331, 1345, '2023-04-04 17:27:55'),
(433331, 1346, '2023-04-04 17:27:55'),
(433331, 1349, '2023-04-04 17:27:55'),
(433331, 1350, '2023-04-04 17:27:55'),
(433331, 1352, '2023-04-04 17:27:55'),
(433331, 1354, '2023-04-04 17:27:55'),
(433331, 1356, '2023-04-04 17:27:55'),
(433331, 1360, '2023-04-04 17:27:55'),
(433331, 1379, '2023-04-04 17:27:55'),
(433331, 1383, '2023-04-04 17:27:55'),
(433331, 1385, '2023-04-04 17:27:55'),
(433331, 1389, '2023-04-04 17:27:55'),
(433331, 1395, '2023-04-04 17:27:55'),
(433331, 1396, '2023-04-04 17:27:55'),
(433331, 1397, '2023-04-04 17:27:55'),
(433331, 1399, '2023-04-04 17:27:55'),
(435636, 1401, '2023-04-02 15:53:36'),
(435636, 1402, '2023-04-02 15:53:36'),
(435636, 1403, '2023-04-02 15:53:36'),
(435636, 1404, '2023-04-02 15:53:36'),
(435636, 1405, '2023-04-02 15:53:36'),
(435636, 1406, '2023-04-02 15:53:36'),
(435636, 1407, '2023-04-02 15:53:36'),
(435636, 1408, '2023-04-02 15:53:36'),
(435636, 1409, '2023-04-02 15:53:36'),
(435636, 1410, '2023-04-02 15:53:36'),
(435636, 1411, '2023-04-02 15:53:36'),
(435636, 1412, '2023-04-02 15:53:36'),
(435636, 1414, '2023-04-02 15:53:36'),
(435636, 1415, '2023-04-02 15:53:36'),
(435636, 1416, '2023-04-02 15:53:36'),
(435636, 1417, '2023-04-02 15:53:36'),
(435636, 1419, '2023-04-02 15:53:36'),
(435636, 1420, '2023-04-02 15:53:36'),
(435636, 1421, '2023-04-02 15:53:36'),
(435636, 1422, '2023-04-02 15:53:36'),
(435636, 1423, '2023-04-02 15:53:36'),
(435636, 1424, '2023-04-02 15:53:36'),
(435636, 1425, '2023-04-02 15:53:36'),
(435636, 1426, '2023-04-02 15:53:36'),
(435636, 1427, '2023-04-02 15:53:36'),
(435636, 1429, '2023-04-02 15:53:36'),
(435636, 1435, '2023-04-02 15:53:36'),
(435636, 1438, '2023-04-02 15:53:36'),
(435636, 1440, '2023-04-02 15:53:36'),
(435636, 1442, '2023-04-02 15:53:36'),
(435636, 1445, '2023-04-02 15:53:36'),
(435636, 1451, '2023-04-02 15:53:36'),
(435636, 1455, '2023-04-02 15:53:36'),
(435636, 1457, '2023-04-02 15:53:36'),
(435636, 1459, '2023-04-02 15:53:36'),
(435636, 1463, '2023-04-02 15:53:36'),
(435636, 1472, '2023-04-02 15:53:36'),
(435636, 1475, '2023-04-02 15:53:36'),
(435636, 1477, '2023-04-02 15:53:36'),
(435636, 1478, '2023-04-02 15:53:36'),
(456655, 1320, '2023-04-13 16:37:53'),
(456655, 1321, '2023-04-13 16:37:53'),
(456655, 1322, '2023-04-13 16:37:53'),
(456655, 1325, '2023-04-13 16:37:53'),
(456655, 1326, '2023-04-13 16:37:53'),
(456655, 1327, '2023-04-13 16:37:53'),
(456655, 1328, '2023-04-13 16:37:53'),
(456655, 1330, '2023-04-13 16:37:53'),
(456655, 1331, '2023-04-13 16:37:53'),
(456655, 1333, '2023-04-13 16:37:53'),
(456655, 1334, '2023-04-13 16:37:53'),
(456655, 1336, '2023-04-13 16:37:53'),
(456655, 1337, '2023-04-13 16:37:53'),
(456655, 1338, '2023-04-13 16:37:53'),
(456655, 1339, '2023-04-13 16:37:53'),
(456655, 1340, '2023-04-13 16:37:53'),
(456655, 1341, '2023-04-13 16:37:53'),
(456655, 1342, '2023-04-13 16:37:53'),
(456655, 1343, '2023-04-13 16:37:53'),
(456655, 1344, '2023-04-13 16:37:53'),
(456655, 1345, '2023-04-13 16:37:53'),
(456655, 1348, '2023-04-13 16:37:53'),
(456655, 1349, '2023-04-13 16:37:53'),
(456655, 1350, '2023-04-13 16:37:53'),
(456655, 1351, '2023-04-13 16:37:53'),
(456655, 1353, '2023-04-13 16:37:53'),
(456655, 1355, '2023-04-13 16:37:53'),
(456655, 1356, '2023-04-13 16:37:53'),
(456655, 1359, '2023-04-13 16:37:53'),
(456655, 1361, '2023-04-13 16:37:53'),
(456655, 1363, '2023-04-13 16:37:53'),
(456655, 1367, '2023-04-13 16:37:53'),
(456655, 1368, '2023-04-13 16:37:53'),
(456655, 1369, '2023-04-13 16:37:53'),
(456655, 1371, '2023-04-13 16:37:53'),
(456655, 1372, '2023-04-13 16:37:53'),
(456655, 1374, '2023-04-13 16:37:53'),
(456655, 1377, '2023-04-13 16:37:53'),
(456655, 1381, '2023-04-13 16:37:53'),
(456655, 1383, '2023-04-13 16:37:53'),
(456655, 1385, '2023-04-13 16:37:53'),
(456655, 1386, '2023-04-13 16:37:53'),
(456655, 1390, '2023-04-13 16:37:53'),
(456655, 1391, '2023-04-13 16:37:54'),
(456655, 1392, '2023-04-13 16:37:53'),
(456655, 1393, '2023-04-13 16:37:53'),
(456655, 1396, '2023-04-13 16:37:53'),
(456655, 1397, '2023-04-13 16:37:53'),
(456655, 1399, '2023-04-13 16:37:53'),
(456655, 1400, '2023-04-13 16:37:54'),
(547514, 1483, '2023-04-02 15:50:14'),
(547514, 1484, '2023-04-02 15:50:14'),
(547514, 1485, '2023-04-02 15:50:14'),
(547514, 1486, '2023-04-02 15:50:14'),
(547514, 1487, '2023-04-02 15:50:14'),
(547514, 1488, '2023-04-02 15:50:14'),
(547514, 1489, '2023-04-02 15:50:14'),
(547514, 1491, '2023-04-02 15:50:14'),
(547514, 1492, '2023-04-02 15:50:14'),
(547514, 1493, '2023-04-02 15:50:14'),
(547514, 1494, '2023-04-02 15:50:14'),
(547514, 1495, '2023-04-02 15:50:14'),
(547514, 1496, '2023-04-02 15:50:14'),
(547514, 1497, '2023-04-02 15:50:14'),
(547514, 1498, '2023-04-02 15:50:14'),
(547514, 1499, '2023-04-02 15:50:14'),
(547514, 1500, '2023-04-02 15:50:14'),
(547514, 1501, '2023-04-02 15:50:14'),
(547514, 1502, '2023-04-02 15:50:14'),
(547514, 1504, '2023-04-02 15:50:14'),
(547514, 1505, '2023-04-02 15:50:14'),
(547514, 1506, '2023-04-02 15:50:14'),
(547514, 1507, '2023-04-02 15:50:14'),
(547514, 1508, '2023-04-02 15:50:14'),
(547514, 1511, '2023-04-02 15:50:14'),
(547514, 1513, '2023-04-02 15:50:14'),
(547514, 1515, '2023-04-02 15:50:14'),
(547514, 1521, '2023-04-02 15:50:14'),
(547514, 1522, '2023-04-02 15:50:14'),
(547514, 1523, '2023-04-02 15:50:14'),
(547514, 1532, '2023-04-02 15:50:14'),
(547514, 1533, '2023-04-02 15:50:14'),
(547514, 1541, '2023-04-02 15:50:14'),
(547514, 1544, '2023-04-02 15:50:14'),
(547514, 1545, '2023-04-02 15:50:14'),
(547514, 1547, '2023-04-02 15:50:14'),
(547514, 1550, '2023-04-02 15:50:14'),
(547514, 1554, '2023-04-02 15:50:14'),
(547514, 1560, '2023-04-02 15:50:14'),
(547514, 1563, '2023-04-02 15:50:14'),
(700530, 1485, '2023-04-11 06:21:02'),
(700530, 1486, '2023-04-11 06:21:02'),
(700530, 1487, '2023-04-11 06:21:02'),
(700530, 1488, '2023-04-11 06:21:02'),
(700530, 1489, '2023-04-11 06:21:02'),
(700530, 1490, '2023-04-11 06:21:02'),
(700530, 1491, '2023-04-11 06:21:02'),
(700530, 1492, '2023-04-11 06:21:02'),
(700530, 1493, '2023-04-11 06:21:02'),
(700530, 1494, '2023-04-11 06:21:02'),
(700530, 1495, '2023-04-11 06:21:02'),
(700530, 1496, '2023-04-11 06:21:02'),
(700530, 1497, '2023-04-11 06:21:02'),
(700530, 1498, '2023-04-11 06:21:02'),
(700530, 1499, '2023-04-11 06:21:02'),
(700530, 1500, '2023-04-11 06:21:02'),
(700530, 1501, '2023-04-11 06:21:02'),
(700530, 1502, '2023-04-11 06:21:02'),
(700530, 1503, '2023-04-11 06:21:02'),
(700530, 1504, '2023-04-11 06:21:02'),
(700530, 1505, '2023-04-11 06:21:02'),
(700530, 1506, '2023-04-11 06:21:02'),
(700530, 1507, '2023-04-11 06:21:02'),
(700530, 1508, '2023-04-11 06:21:02'),
(700530, 1514, '2023-04-11 06:21:02'),
(700530, 1522, '2023-04-11 06:21:02'),
(700530, 1525, '2023-04-11 06:21:02'),
(700530, 1528, '2023-04-11 06:21:02'),
(700530, 1529, '2023-04-11 06:21:02'),
(700530, 1530, '2023-04-11 06:21:02'),
(700530, 1534, '2023-04-11 06:21:02'),
(700530, 1535, '2023-04-11 06:21:02'),
(700530, 1536, '2023-04-11 06:21:02'),
(700530, 1537, '2023-04-11 06:21:02'),
(700530, 1543, '2023-04-11 06:21:02'),
(700530, 1544, '2023-04-11 06:21:02'),
(700530, 1545, '2023-04-11 06:21:02'),
(700530, 1549, '2023-04-11 06:21:02'),
(700530, 1550, '2023-04-11 06:21:02'),
(700530, 1559, '2023-04-11 06:21:02'),
(727440, 1491, '2023-04-11 04:43:31'),
(727440, 1494, '2023-04-11 04:43:31'),
(727440, 1495, '2023-04-11 04:43:31'),
(727440, 1496, '2023-04-11 04:43:31'),
(727440, 1499, '2023-04-11 04:43:31'),
(727440, 1501, '2023-04-11 04:43:31'),
(727440, 1502, '2023-04-11 04:43:31'),
(727440, 1507, '2023-04-11 04:43:31'),
(727440, 1509, '2023-04-11 04:43:31'),
(727440, 1510, '2023-04-11 04:43:31'),
(727440, 1511, '2023-04-11 04:43:31'),
(727440, 1512, '2023-04-11 04:43:31'),
(727440, 1513, '2023-04-11 04:43:31'),
(727440, 1514, '2023-04-11 04:43:31'),
(727440, 1515, '2023-04-11 04:43:31'),
(727440, 1517, '2023-04-11 04:43:31'),
(727440, 1518, '2023-04-11 04:43:31'),
(727440, 1519, '2023-04-11 04:43:31'),
(727440, 1520, '2023-04-11 04:43:31'),
(727440, 1521, '2023-04-11 04:43:31'),
(727440, 1522, '2023-04-11 04:43:31'),
(727440, 1523, '2023-04-11 04:43:31'),
(727440, 1524, '2023-04-11 04:43:31'),
(727440, 1525, '2023-04-11 04:43:31'),
(727440, 1526, '2023-04-11 04:43:31'),
(727440, 1527, '2023-04-11 04:43:31'),
(727440, 1528, '2023-04-11 04:43:31'),
(727440, 1529, '2023-04-11 04:43:31'),
(727440, 1532, '2023-04-11 04:43:31'),
(727440, 1533, '2023-04-11 04:43:31'),
(727440, 1534, '2023-04-11 04:43:31'),
(727440, 1535, '2023-04-11 04:43:31'),
(727440, 1536, '2023-04-11 04:43:31'),
(727440, 1538, '2023-04-11 04:43:31'),
(727440, 1541, '2023-04-11 04:43:31'),
(727440, 1545, '2023-04-11 04:43:31'),
(727440, 1552, '2023-04-11 04:43:31'),
(727440, 1555, '2023-04-11 04:43:31'),
(727440, 1561, '2023-04-11 04:43:31'),
(727440, 1562, '2023-04-11 04:43:31'),
(788901, 1566, '2023-04-02 18:03:11'),
(788901, 1585, '2023-04-02 18:03:11'),
(788901, 1611, '2023-04-02 18:03:11'),
(788901, 1616, '2023-04-02 18:03:11'),
(788901, 1622, '2023-04-02 18:03:11'),
(788901, 1625, '2023-04-02 18:03:11'),
(788901, 1630, '2023-04-02 18:03:11'),
(788901, 1631, '2023-04-02 18:03:11'),
(788901, 1633, '2023-04-02 18:03:11'),
(788901, 1643, '2023-04-02 18:03:11'),
(815048, 1811, '2023-04-03 14:52:21'),
(815048, 1813, '2023-04-03 14:52:21'),
(815048, 1816, '2023-04-03 14:52:21'),
(815048, 1818, '2023-04-03 14:52:21'),
(815048, 1820, '2023-04-03 14:52:21'),
(815048, 1827, '2023-04-03 14:52:21'),
(815048, 1829, '2023-04-03 14:52:22'),
(815048, 1833, '2023-04-03 14:52:21'),
(815048, 1837, '2023-04-03 14:52:22'),
(815048, 1838, '2023-04-03 14:52:22'),
(815048, 1839, '2023-04-03 14:52:22'),
(815048, 1840, '2023-04-03 14:52:22'),
(815048, 1841, '2023-04-03 14:52:22'),
(815048, 1842, '2023-04-03 14:52:22'),
(815048, 1843, '2023-04-03 14:52:22'),
(815048, 1845, '2023-04-03 14:52:22'),
(815048, 1847, '2023-04-03 14:52:22'),
(815048, 1848, '2023-04-03 14:52:22'),
(815048, 1849, '2023-04-03 14:52:22'),
(815048, 1850, '2023-04-03 14:52:22'),
(815048, 1852, '2023-04-03 14:52:22'),
(815048, 1853, '2023-04-03 14:52:22'),
(815048, 1854, '2023-04-03 14:52:22'),
(815048, 1855, '2023-04-03 14:52:22'),
(815048, 1856, '2023-04-03 14:52:22'),
(815048, 1857, '2023-04-03 14:52:22'),
(815048, 1858, '2023-04-03 14:52:22'),
(815048, 1859, '2023-04-03 14:52:22'),
(815048, 1860, '2023-04-03 14:52:22'),
(815048, 1861, '2023-04-03 14:52:22'),
(815048, 1862, '2023-04-03 14:52:22'),
(815048, 1863, '2023-04-03 14:52:22'),
(815048, 1868, '2023-04-03 14:52:22'),
(815048, 1878, '2023-04-03 14:52:22'),
(815048, 1881, '2023-04-03 14:52:22'),
(815048, 1882, '2023-04-03 14:52:22'),
(815048, 1883, '2023-04-03 14:52:22'),
(815048, 1884, '2023-04-03 14:52:22'),
(815048, 1890, '2023-04-03 14:52:22'),
(815048, 1891, '2023-04-03 14:52:22'),
(927619, 1323, '2023-04-02 15:55:31'),
(927619, 1324, '2023-04-02 15:55:31'),
(927619, 1329, '2023-04-02 15:55:31'),
(927619, 1330, '2023-04-02 15:55:31'),
(927619, 1331, '2023-04-02 15:55:31'),
(927619, 1332, '2023-04-02 15:55:31'),
(927619, 1335, '2023-04-02 15:55:31'),
(927619, 1343, '2023-04-02 15:55:31'),
(927619, 1345, '2023-04-02 15:55:31'),
(927619, 1346, '2023-04-02 15:55:31'),
(927619, 1350, '2023-04-02 15:55:31'),
(927619, 1354, '2023-04-02 15:55:31'),
(927619, 1356, '2023-04-02 15:55:31'),
(927619, 1359, '2023-04-02 15:55:31'),
(927619, 1369, '2023-04-02 15:55:31'),
(927619, 1370, '2023-04-02 15:55:31'),
(927619, 1372, '2023-04-02 15:55:31'),
(927619, 1373, '2023-04-02 15:55:31'),
(927619, 1374, '2023-04-02 15:55:31'),
(927619, 1375, '2023-04-02 15:55:31'),
(927619, 1377, '2023-04-02 15:55:31'),
(927619, 1378, '2023-04-02 15:55:31'),
(927619, 1380, '2023-04-02 15:55:31'),
(927619, 1381, '2023-04-02 15:55:31'),
(927619, 1382, '2023-04-02 15:55:31'),
(927619, 1383, '2023-04-02 15:55:31'),
(927619, 1384, '2023-04-02 15:55:31'),
(927619, 1385, '2023-04-02 15:55:31'),
(927619, 1386, '2023-04-02 15:55:31'),
(927619, 1387, '2023-04-02 15:55:31'),
(927619, 1390, '2023-04-02 15:55:31'),
(927619, 1391, '2023-04-02 15:55:31'),
(927619, 1392, '2023-04-02 15:55:31'),
(927619, 1393, '2023-04-02 15:55:31'),
(927619, 1394, '2023-04-02 15:55:31'),
(927619, 1395, '2023-04-02 15:55:31'),
(927619, 1396, '2023-04-02 15:55:31'),
(927619, 1397, '2023-04-02 15:55:31'),
(927619, 1398, '2023-04-02 15:55:31'),
(927619, 1399, '2023-04-02 15:55:31'),
(945075, 1647, '2023-04-02 18:08:02'),
(945075, 1650, '2023-04-02 18:08:02'),
(945075, 1653, '2023-04-02 18:08:02'),
(945075, 1654, '2023-04-02 18:08:02'),
(945075, 1659, '2023-04-02 18:08:02'),
(945075, 1662, '2023-04-02 18:08:02'),
(945075, 1666, '2023-04-02 18:08:02'),
(945075, 1668, '2023-04-02 18:08:02'),
(945075, 1674, '2023-04-02 18:08:02'),
(945075, 1680, '2023-04-02 18:08:02'),
(945075, 1681, '2023-04-02 18:08:02'),
(945075, 1684, '2023-04-02 18:08:02'),
(945075, 1688, '2023-04-02 18:08:02'),
(945075, 1691, '2023-04-02 18:08:02'),
(945075, 1697, '2023-04-02 18:08:02'),
(945075, 1699, '2023-04-02 18:08:02'),
(945075, 1701, '2023-04-02 18:08:02'),
(945075, 1702, '2023-04-02 18:08:02'),
(945075, 1703, '2023-04-02 18:08:02'),
(945075, 1704, '2023-04-02 18:08:02'),
(945075, 1705, '2023-04-02 18:08:02'),
(945075, 1707, '2023-04-02 18:08:02'),
(945075, 1710, '2023-04-02 18:08:02'),
(945075, 1711, '2023-04-02 18:08:02'),
(945075, 1712, '2023-04-02 18:08:02'),
(945075, 1713, '2023-04-02 18:08:02'),
(945075, 1714, '2023-04-02 18:08:02'),
(945075, 1715, '2023-04-02 18:08:02'),
(945075, 1716, '2023-04-02 18:08:02'),
(945075, 1717, '2023-04-02 18:08:02'),
(945075, 1719, '2023-04-02 18:08:02'),
(945075, 1720, '2023-04-02 18:08:02'),
(945075, 1721, '2023-04-02 18:08:02'),
(945075, 1722, '2023-04-02 18:08:02'),
(945075, 1723, '2023-04-02 18:08:02'),
(945075, 1724, '2023-04-02 18:08:02'),
(945075, 1725, '2023-04-02 18:08:02'),
(945075, 1726, '2023-04-02 18:08:02'),
(945075, 1727, '2023-04-02 18:08:02'),
(945075, 1728, '2023-04-02 18:08:02'),
(981590, 1321, '2023-04-12 16:52:00'),
(981590, 1324, '2023-04-12 16:52:00'),
(981590, 1327, '2023-04-12 16:52:00'),
(981590, 1331, '2023-04-12 16:52:00'),
(981590, 1334, '2023-04-12 16:52:00'),
(981590, 1335, '2023-04-12 16:52:00'),
(981590, 1339, '2023-04-12 16:52:00'),
(981590, 1342, '2023-04-12 16:52:00'),
(981590, 1343, '2023-04-12 16:52:00'),
(981590, 1344, '2023-04-12 16:52:00'),
(981590, 1346, '2023-04-12 16:52:00'),
(981590, 1351, '2023-04-12 16:52:00'),
(981590, 1353, '2023-04-12 16:52:00'),
(981590, 1354, '2023-04-12 16:52:00'),
(981590, 1357, '2023-04-12 16:52:00'),
(981590, 1359, '2023-04-12 16:52:00'),
(981590, 1361, '2023-04-12 16:52:00'),
(981590, 1362, '2023-04-12 16:52:00'),
(981590, 1363, '2023-04-12 16:52:00'),
(981590, 1364, '2023-04-12 16:52:00'),
(981590, 1365, '2023-04-12 16:52:00'),
(981590, 1366, '2023-04-12 16:52:00'),
(981590, 1367, '2023-04-12 16:52:00'),
(981590, 1370, '2023-04-12 16:52:00'),
(981590, 1371, '2023-04-12 16:52:00'),
(981590, 1374, '2023-04-12 16:52:00'),
(981590, 1375, '2023-04-12 16:52:00'),
(981590, 1376, '2023-04-12 16:52:00'),
(981590, 1377, '2023-04-12 16:52:00'),
(981590, 1379, '2023-04-12 16:52:00'),
(981590, 1383, '2023-04-12 16:52:00'),
(981590, 1384, '2023-04-12 16:52:00'),
(981590, 1385, '2023-04-12 16:52:00'),
(981590, 1386, '2023-04-12 16:52:00'),
(981590, 1388, '2023-04-12 16:52:00'),
(981590, 1390, '2023-04-12 16:52:00'),
(981590, 1392, '2023-04-12 16:52:00'),
(981590, 1395, '2023-04-12 16:52:00'),
(981590, 1399, '2023-04-12 16:52:00'),
(981590, 1400, '2023-04-12 16:52:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `scores`
--

CREATE TABLE `scores` (
  `student_id` int(11) NOT NULL,
  `test_code` int(11) NOT NULL,
  `score_number` varchar(10) DEFAULT NULL,
  `score_detail` varchar(50) NOT NULL,
  `completion_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `scores`
--

INSERT INTO `scores` (`student_id`, `test_code`, `score_number`, `score_detail`, `completion_time`) VALUES
(11, 424315, '3', '12/40', '2023-04-03 01:11:40'),
(11, 435636, '1.5', '6/40', '2023-04-02 23:40:21'),
(11, 456655, '0', '0/50', '2023-04-14 00:00:00'),
(11, 547514, '7.5', '30/40', '2023-04-03 00:56:09'),
(11, 700530, '3', '12/40', '2023-04-11 13:25:01'),
(11, 727440, '0', '0/40', '2023-04-13 23:58:49'),
(11, 788901, '10', '10/10', '2023-04-03 01:09:16'),
(11, 815048, '6.5', '26/40', '2023-04-03 21:56:14'),
(11, 927619, '9.25', '37/40', '2023-04-02 22:57:55'),
(11, 945075, '5.5', '22/40', '2023-04-03 01:10:10'),
(11, 981590, '0.5', '2/40', '2023-04-13 23:39:53'),
(12, 424315, '4', '16/40', '2023-04-03 01:12:28'),
(12, 435636, '8.75', '35/40', '2023-04-02 23:03:24'),
(12, 945075, '5.25', '21/40', '2023-04-03 01:13:20'),
(14, 435636, '5.25', '21/40', '2023-04-03 00:59:06'),
(14, 788901, '9', '9/10', '2023-04-03 01:14:20'),
(14, 927619, '5.5', '22/40', '2023-04-03 00:57:50'),
(16, 815048, '6.5', '26/40', '2023-04-03 22:19:59'),
(16, 927619, '7.25', '29/40', '2023-04-03 22:21:53'),
(22, 547514, '5.25', '21/40', '2023-04-03 01:17:02'),
(22, 945075, '6.5', '26/40', '2023-04-03 01:15:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `statuses`
--

CREATE TABLE `statuses` (
  `status_id` int(1) NOT NULL,
  `detail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `statuses`
--

INSERT INTO `statuses` (`status_id`, `detail`) VALUES
(1, 'Đóng'),
(2, 'Mở'),
(3, 'Chờ duyệt'),
(4, 'Đã duyệt'),
(5, 'Không duyệt');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `permission` int(1) DEFAULT 3,
  `class_id` int(11) NOT NULL,
  `last_login` datetime NOT NULL,
  `gender_id` int(1) NOT NULL DEFAULT 1,
  `avatar` varchar(255) DEFAULT 'avatar-default.jpg',
  `birthday` date NOT NULL,
  `doing_exam` int(11) DEFAULT NULL,
  `starting_time` datetime DEFAULT NULL,
  `time_remaining` varchar(11) DEFAULT NULL,
  `doing_practice` int(11) DEFAULT NULL,
  `practice_time_remaining` varchar(11) DEFAULT NULL,
  `practice_starting_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `students`
--

INSERT INTO `students` (`student_id`, `username`, `email`, `password`, `name`, `permission`, `class_id`, `last_login`, `gender_id`, `avatar`, `birthday`, `doing_exam`, `starting_time`, `time_remaining`, `doing_practice`, `practice_time_remaining`, `practice_starting_time`) VALUES
(1, 'hocsinh21', 'hocsinh21@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Thị Lan Hương ', 3, 1, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-08', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'hocsinh22', 'hocsinh22@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Đặng Thu Thảo', 3, 1, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-09', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'hocsinh23', 'hocsinh23@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Vũ Thị Thảo', 3, 1, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-10', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'hocsinh24', 'hocsinh24@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Bùi Thị Kim Cúc', 3, 1, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-11', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'hocsinh25', 'hocsinh25@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Hùng Vỹ', 3, 1, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2000-02-12', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'hocsinh26', 'hocsinh26@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thị Bình', 3, 1, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-13', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'hocsinh27', 'hocsinh27@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Trần Trung Quân', 3, 1, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2000-02-14', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'hocsinh28', 'hocsinh28@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Kim Trà My', 3, 1, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-15', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'hocsinh29', 'hocsinh29@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Đồng Phương Nam', 3, 1, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2000-02-16', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'hocsinh30', 'hocsinh30@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Đỗ Thanh Thúy', 3, 1, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-17', NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'hocsinh1', 'hocsinh1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thị Bích Thùy ', 3, 2, '2023-04-14 00:07:51', 3, 'avatar-default.jpg', '2000-02-08', NULL, NULL, NULL, 561100, '27:44', '2023-04-14 00:00:13'),
(12, 'hocsinh2', 'hocsinh2@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Huyền Tân', 3, 2, '2023-04-03 01:13:27', 3, 'avatar-default.jpg', '2000-02-09', NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'hocsinh3', 'hocsinh3@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Thị Vân', 3, 2, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-10', NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'hocsinh4', 'hocsinh4@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Ngô Thị Trang', 3, 2, '2023-04-13 22:27:46', 3, 'avatar-default.jpg', '2000-02-11', NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'hocsinh5', 'hocsinh5@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Linh Trang', 3, 2, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2000-02-12', NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'hocsinh6', 'hocsinh6@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Mai Tiến Dũng', 3, 2, '2023-04-13 22:28:46', 3, 'avatar-default.jpg', '2000-02-13', NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'hocsinh7', 'hocsinh7@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Tiến Dũng', 3, 2, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2000-02-14', NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'hocsinh8', 'hocsinh8@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Cao Thị Hiền', 3, 2, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-15', NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'hocsinh9', 'hocsinh9@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Văn Quyền', 3, 2, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2000-02-16', NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'hocsinh10', 'hocsinh10@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Bá Quyền', 3, 2, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-17', NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'hocsinh11', 'hocsinh11@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Đường Tuấn Hải', 3, 5, '2023-04-13 22:28:21', 3, 'avatar-default.jpg', '2000-02-08', NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'hocsinh12', 'hocsinh12@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Minh Thiện', 3, 5, '2023-04-03 01:17:07', 3, 'avatar-default.jpg', '2000-02-09', NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'hocsinh13', 'hocsinh13@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thu Hà', 3, 5, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-10', NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'hocsinh14', 'hocsinh14@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Thị Hạnh', 3, 5, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-11', NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'hocsinh15', 'hocsinh15@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Tiến Thiện', 3, 5, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2000-02-12', NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'hocsinh16', 'hocsinh16@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Mai Tiến Thành', 3, 5, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-13', NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'hocsinh17', 'hocsinh17@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hoàng Hải Nam', 3, 5, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2000-02-14', NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'hocsinh18', 'hocsinh18@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Cao Thị Hiền', 3, 5, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-15', NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'hocsinh19', 'hocsinh19@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Văn Quyền', 3, 5, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2000-02-16', NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'hocsinh20', 'hocsinh20@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Bá Quyền', 3, 5, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-17', NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'hocsinh111', 'hocsinh111@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thị Bích Thùy', 3, 5, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-08', NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'hocsinh112', 'hocsinh112@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Minh Thiện', 3, 5, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-09', NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'hocsinh113', 'hocsinh113@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thu Hà', 3, 5, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-10', NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'hocsinh114', 'hocsinh114@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Thị Hạnh', 3, 5, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-11', NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'hocsinh115', 'hocsinh115@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Tiến Thiện', 3, 5, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2000-02-12', NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'hocsinh116', 'hocsinh116@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Mai Tiến Thành', 3, 5, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-13', NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'hocsinh117', 'hocsinh117@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hoàng Hải Nam', 3, 5, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2000-02-14', NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'hocsinh118', 'hocsinh118@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Cao Thị Hiền', 3, 5, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-15', NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'hocsinh119', 'hocsinh119@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Văn Quyền', 3, 5, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2000-02-16', NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'hocsinh120', 'hocsinh120@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Bá Quyền', 3, 5, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-17', NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'hocsinh1111', 'hocsinh1111@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thị Bích Thùy', 3, 6, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-08', NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'hocsinh1112', 'hocsinh1112@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Minh Thiện', 3, 6, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-09', NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'hocsinh1113', 'hocsinh1113@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thu Hà', 3, 6, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-10', NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'hocsinh1114', 'hocsinh1114@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Thị Hạnh', 3, 6, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-11', NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'hocsinh1115', 'hocsinh1115@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Tiến Thiện', 3, 6, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2000-02-12', NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'hocsinh1116', 'hocsinh1116@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Mai Tiến Thành', 3, 6, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-13', NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'hocsinh1117', 'hocsinh1117@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hoàng Hải Nam', 3, 6, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2000-02-14', NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'hocsinh1118', 'hocsinh1118@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Cao Thị Hiền', 3, 6, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-15', NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'hocsinh1119', 'hocsinh1119@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Văn Quyền', 3, 6, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2000-02-16', NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'hocsinh1120', 'hocsinh1120@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Bá Quyền', 3, 6, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-17', NULL, NULL, NULL, NULL, NULL, NULL),
(51, 'hocsinh1000', 'hocsinh1000@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thị Bích Thùy', 3, 4, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-08', NULL, NULL, NULL, NULL, NULL, NULL),
(52, 'hocsinh1001', 'hocsinh1001@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Minh Thiện', 3, 4, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-09', NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'hocsinh1002', 'hocsinh1002@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thu Hà', 3, 4, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-10', NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'hocsinh1003', 'hocsinh1003@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Thị Hạnh', 3, 4, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-11', NULL, NULL, NULL, NULL, NULL, NULL),
(55, 'hocsinh1004', 'hocsinh1004@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Tiến Thiện', 3, 4, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2000-02-12', NULL, NULL, NULL, NULL, NULL, NULL),
(56, 'hocsinh1005', 'hocsinh1005@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Mai Tiến Thành', 3, 4, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-13', NULL, NULL, NULL, NULL, NULL, NULL),
(57, 'hocsinh1006', 'hocsinh1006@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hoàng Hải Nam', 3, 4, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2000-02-14', NULL, NULL, NULL, NULL, NULL, NULL),
(58, 'hocsinh1007', 'hocsinh1007@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Cao Thị Hiền', 3, 4, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-15', NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'hocsinh1008', 'hocsinh1008@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Văn Quyền', 3, 4, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2000-02-16', NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'hocsinh1009', 'hocsinh1009@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Bá Quyền', 3, 4, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-17', NULL, NULL, NULL, NULL, NULL, NULL),
(61, 'hocsinh2000', 'hocsinh2000@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thị Bích Thùy', 3, 4, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-08', NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'hocsinh2001', 'hocsinh2005@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thị Bích Thùy', 3, 4, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-08', NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'hocsinh2002', 'hocsinh2001@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Minh Thiện', 3, 4, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-09', NULL, NULL, NULL, NULL, NULL, NULL),
(64, 'hocsinh2003', 'hocsinh2002@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thu Hà', 3, 4, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-10', NULL, NULL, NULL, NULL, NULL, NULL),
(65, 'hocsinh2004', 'hocsinh2003@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Thị Hạnh', 3, 4, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-11', NULL, NULL, NULL, NULL, NULL, NULL),
(66, 'hocsinh2005', 'hocsinh2004@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Tiến Thiện', 3, 4, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2000-02-12', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student_notifications`
--

CREATE TABLE `student_notifications` (
  `ID` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `student_notifications`
--

INSERT INTO `student_notifications` (`ID`, `notification_id`, `class_id`) VALUES
(24, 32, 1),
(25, 33, 2),
(26, 34, 3),
(27, 36, 1),
(28, 36, 2),
(29, 36, 3),
(30, 36, 4),
(31, 36, 5),
(32, 36, 6),
(33, 37, 4),
(34, 38, 4),
(35, 38, 1),
(36, 39, 4),
(37, 39, 1),
(38, 40, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student_practice_detail`
--

CREATE TABLE `student_practice_detail` (
  `ID` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `practice_code` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_a` text DEFAULT NULL,
  `answer_b` text DEFAULT NULL,
  `answer_c` text DEFAULT NULL,
  `answer_d` text DEFAULT NULL,
  `student_answer` text DEFAULT NULL,
  `timest` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `student_practice_detail`
--

INSERT INTO `student_practice_detail` (`ID`, `student_id`, `practice_code`, `question_id`, `answer_a`, `answer_b`, `answer_c`, `answer_d`, `student_answer`, `timest`) VALUES
(1306500146, 11, 52964, 1567, 'Dễ', '5', '4', '13', '4', '2023-04-06 14:27:05'),
(91111095, 11, 52964, 1568, 'Dễ', '5', '5', '14', 'Dễ', '2023-04-06 14:26:28'),
(839252692, 11, 52964, 1569, 'Dễ', '5', '6', '15', 'Dễ', '2023-04-06 14:26:38'),
(1014970069, 11, 52964, 1571, 'Dễ', '5', '8', '17', 'Dễ', '2023-04-06 14:26:47'),
(399211824, 11, 52964, 1574, 'Dễ', '5', '11', '20', 'Dễ', '2023-04-06 14:26:42'),
(574274402, 11, 52964, 1575, 'Dễ', '5', '12', '21', 'Dễ', '2023-04-06 14:26:36'),
(997572450, 11, 52964, 1577, 'Dễ', '5', '14', '23', 'Dễ', '2023-04-06 14:26:47'),
(1201254756, 11, 52964, 1578, 'Dễ', '5', '15', '24', 'Dễ', '2023-04-06 14:26:58'),
(586346916, 11, 52964, 1579, 'Dễ', '5', '16', '25', 'Dễ', '2023-04-06 14:26:35'),
(183398729, 11, 52964, 1580, 'Dễ', '5', '17', '26', 'Dễ', '2023-04-06 14:26:44'),
(1512485002, 11, 52964, 1581, 'Dễ', '5', '18', '27', 'Dễ', '2023-04-06 14:27:00'),
(973449654, 11, 52964, 1582, 'Dễ', '5', '19', '28', 'Dễ', '2023-04-06 14:26:48'),
(1243614526, 11, 52964, 1583, 'Dễ', '5', '20', '29', 'Dễ', '2023-04-06 14:26:54'),
(44508358, 11, 52964, 1585, 'Dễ', '5', '22', '31', '5', '2023-04-06 14:26:26'),
(339964362, 11, 52964, 1586, 'Dễ', '5', '23', '32', 'Dễ', '2023-04-06 14:26:34'),
(1210878873, 11, 52964, 1587, 'Dễ', '5', '24', '33', 'Dễ', '2023-04-06 14:26:55'),
(326281171, 11, 52964, 1588, 'Dễ', '5', '25', '34', 'Dễ', '2023-04-06 14:26:32'),
(96635783, 11, 52964, 1589, 'Dễ', '5', '26', '35', 'Dễ', '2023-04-06 14:26:29'),
(388007977, 11, 52964, 1592, 'trung bình', '5', '29', '38', 'trung bình', '2023-04-06 14:26:33'),
(1372775137, 11, 52964, 1596, 'trung bình', '5', '33', '42', 'trung bình', '2023-04-06 14:27:05'),
(1191065632, 11, 52964, 1605, 'trung bình', '5', '42', '51', 'trung bình', '2023-04-06 14:26:52'),
(1475676060, 11, 52964, 1613, 'trung bình', '5', '50', '59', '5', '2023-04-06 14:27:01'),
(596212514, 11, 52964, 1615, 'trung bình', '5', '52', '61', 'trung bình', '2023-04-06 14:26:37'),
(1587719446, 11, 52964, 1617, 'trung bình', '5', '54', '63', '63', '2023-04-06 14:27:09'),
(798862635, 11, 52964, 1618, 'khó', '5', '55', '64', 'khó', '2023-04-06 14:26:39'),
(332777079, 11, 52964, 1622, 'khó', '5', '59', '68', 'khó', '2023-04-06 14:26:31'),
(120590982, 11, 52964, 1629, 'khó', '5', '66', '75', 'khó', '2023-04-06 14:26:30'),
(1129310340, 11, 52964, 1634, 'khó', '5', '71', '80', 'khó', '2023-04-06 14:26:52'),
(1182335373, 11, 52964, 1637, 'khó', '5', '74', '83', 'khó', '2023-04-06 14:26:51'),
(53324155, 11, 52964, 1645, 'khó', '5', '82', '91', 'khó', '2023-04-06 14:26:27'),
(1063532039, 11, 269233, 1565, 'Dễ', '5', '2', '11', NULL, '2023-04-02 18:10:29'),
(608224429, 11, 269233, 1567, 'Dễ', '5', '4', '13', 'Dễ', '2023-04-02 18:10:41'),
(736911458, 11, 269233, 1568, 'Dễ', '5', '5', '14', NULL, '2023-04-02 18:10:29'),
(1110553091, 11, 269233, 1569, 'Dễ', '5', '6', '15', 'Dễ', '2023-04-02 18:10:47'),
(429287976, 11, 269233, 1570, 'Dễ', '5', '7', '16', NULL, '2023-04-02 18:10:29'),
(1434047144, 11, 269233, 1571, 'Dễ', '5', '8', '17', NULL, '2023-04-02 18:10:29'),
(38596842, 11, 269233, 1573, 'Dễ', '5', '10', '19', '5', '2023-04-02 18:10:35'),
(1670341877, 11, 269233, 1575, 'Dễ', '5', '12', '21', 'Dễ', '2023-04-02 18:10:56'),
(587102180, 11, 269233, 1577, 'Dễ', '5', '14', '23', 'Dễ', '2023-04-02 18:10:40'),
(873534925, 11, 269233, 1579, 'Dễ', '5', '16', '25', '5', '2023-04-02 18:10:45'),
(738359781, 11, 269233, 1580, 'Dễ', '5', '17', '26', NULL, '2023-04-02 18:10:29'),
(1515997086, 11, 269233, 1583, 'Dễ', '5', '20', '29', NULL, '2023-04-02 18:10:29'),
(1366317089, 11, 269233, 1584, 'Dễ', '5', '21', '30', 'Dễ', '2023-04-02 18:10:52'),
(1121028678, 11, 269233, 1585, 'Dễ', '5', '22', '31', 'Dễ', '2023-04-02 18:10:48'),
(881448862, 11, 269233, 1586, 'Dễ', '5', '23', '32', 'Dễ', '2023-04-02 18:10:43'),
(589046892, 11, 269233, 1588, 'Dễ', '5', '25', '34', '5', '2023-04-02 18:10:42'),
(1016658925, 11, 269233, 1589, 'Dễ', '5', '26', '35', NULL, '2023-04-02 18:10:29'),
(1512024643, 11, 269233, 1590, 'Dễ', '5', '27', '36', 'Dễ', '2023-04-02 18:10:54'),
(1672708816, 11, 269233, 1593, 'trung bình', '5', '30', '39', 'trung bình', '2023-04-02 18:10:55'),
(177184795, 11, 269233, 1594, 'trung bình', '5', '31', '40', 'trung bình', '2023-04-02 18:10:33'),
(471109783, 11, 269233, 1598, 'trung bình', '5', '35', '44', 'trung bình', '2023-04-02 18:10:39'),
(1489330873, 11, 269233, 1600, 'trung bình', '5', '37', '46', NULL, '2023-04-02 18:10:29'),
(673712633, 11, 269233, 1613, 'trung bình', '5', '50', '59', NULL, '2023-04-02 18:10:29'),
(1627124369, 11, 269233, 1614, 'trung bình', '5', '51', '60', NULL, '2023-04-02 18:10:29'),
(1659855244, 11, 269233, 1621, 'khó', '5', '58', '67', NULL, '2023-04-02 18:10:29'),
(1156435111, 11, 269233, 1629, 'khó', '5', '66', '75', 'khó', '2023-04-02 18:10:51'),
(179101762, 11, 269233, 1633, 'khó', '5', '70', '79', 'khó', '2023-04-02 18:10:37'),
(1615772826, 11, 269233, 1634, 'khó', '5', '71', '80', NULL, '2023-04-02 18:10:29'),
(329252858, 11, 269233, 1641, 'khó', '5', '78', '87', NULL, '2023-04-02 18:10:29'),
(328501321, 11, 269233, 1646, 'khó', '5', '83', '92', 'khó', '2023-04-02 18:10:37'),
(426306815, 11, 359250, 1401, 'Dễ', '5', '2', '11', '5', '2023-04-02 16:43:08'),
(778144163, 11, 359250, 1403, 'Dễ', '5', '4', '13', 'Dễ', '2023-04-02 16:43:19'),
(1488615359, 11, 359250, 1405, 'Dễ', '5', '6', '15', 'Dễ', '2023-04-02 16:43:39'),
(450832220, 11, 359250, 1406, 'Dễ', '5', '7', '16', 'Dễ', '2023-04-02 16:43:10'),
(877962366, 11, 359250, 1407, 'Dễ', '5', '8', '17', 'Dễ', '2023-04-02 16:43:27'),
(399737246, 11, 359250, 1409, 'Dễ', '5', '10', '19', '10', '2023-04-02 16:43:09'),
(1023446049, 11, 359250, 1411, 'Dễ', '5', '12', '21', 'Dễ', '2023-04-02 16:43:25'),
(86346718, 11, 359250, 1413, 'Dễ', '5', '14', '23', 'Dễ', '2023-04-02 16:42:48'),
(152047791, 11, 359250, 1414, 'Dễ', '5', '15', '24', '5', '2023-04-02 16:43:14'),
(155272775, 11, 359250, 1415, 'Dễ', '5', '16', '25', 'Dễ', '2023-04-02 16:43:05'),
(93147939, 11, 359250, 1416, 'Dễ', '5', '17', '26', 'Dễ', '2023-04-02 16:42:49'),
(1026520410, 11, 359250, 1417, 'Dễ', '5', '18', '27', 'Dễ', '2023-04-02 16:43:24'),
(1189638879, 11, 359250, 1418, 'Dễ', '5', '19', '28', 'Dễ', '2023-04-02 16:43:30'),
(251646430, 11, 359250, 1419, 'Dễ', '5', '20', '29', '20', '2023-04-02 16:43:07'),
(1440138661, 11, 359250, 1420, 'Dễ', '5', '21', '30', 'Dễ', '2023-04-02 16:43:35'),
(537730100, 11, 359250, 1421, 'Dễ', '5', '22', '31', '22', '2023-04-02 16:43:16'),
(620710644, 11, 359250, 1423, 'Dễ', '5', '24', '33', '24', '2023-04-02 16:43:16'),
(694935753, 11, 359250, 1426, 'Dễ', '5', '27', '36', 'Dễ', '2023-04-02 16:43:23'),
(111329566, 11, 359250, 1434, 'trung bình', '5', '35', '44', 'trung bình', '2023-04-02 16:42:50'),
(1585604026, 11, 359250, 1436, 'trung bình', '5', '37', '46', 'trung bình', '2023-04-02 16:43:39'),
(1479671951, 11, 359250, 1440, 'trung bình', '5', '41', '50', 'trung bình', '2023-04-02 16:43:40'),
(1152517619, 11, 359250, 1442, 'trung bình', '5', '43', '52', 'trung bình', '2023-04-02 16:43:30'),
(636329232, 11, 359250, 1445, 'trung bình', '5', '46', '55', 'trung bình', '2023-04-02 16:43:17'),
(1095779641, 11, 359250, 1450, 'trung bình', '5', '51', '60', 'trung bình', '2023-04-02 16:43:31'),
(1220799300, 11, 359250, 1455, 'khó', '5', '56', '65', 'khó', '2023-04-02 16:43:35'),
(363291274, 11, 359250, 1463, 'khó', '5', '64', '73', '64', '2023-04-02 16:43:12'),
(736308151, 11, 359250, 1467, 'khó', '5', '68', '77', 'khó', '2023-04-02 16:43:20'),
(196842061, 11, 359250, 1472, 'khó', '5', '73', '82', 'khó', '2023-04-02 16:43:04'),
(302274522, 11, 359250, 1476, 'khó', '5', '77', '86', 'khó', '2023-04-02 16:43:07'),
(1449431809, 11, 359250, 1481, 'khó', '5', '82', '91', 'khó', '2023-04-02 16:43:34'),
(898364979, 11, 561100, 1319, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 17:00:12'),
(459921102, 11, 561100, 1320, 'Đường đơn', 'đường đôi', 'Đường đa', 'Cabonhidrat', NULL, '2023-04-13 17:00:12'),
(708315622, 11, 561100, 1322, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 17:00:12'),
(1190055096, 11, 561100, 1323, ' phần lớn chúng đã có trong các hợp chất của thực vật.', ' chức năng chính của chúng là hoạt hoá các emzym.', 'chúng đóng vai trò thứ yếu đối với thực vật.', 'chúng chỉ cần cho thực vật ở một vài giai đoạn sinh tr­ưởng nhất định.', NULL, '2023-04-13 17:00:12'),
(1078300285, 11, 561100, 1324, 'Hoá năng', ' Nhiệt năng', 'Điện năng\n', 'Động năng ', NULL, '2023-04-13 17:00:12'),
(223521434, 11, 561100, 1327, 'ARN và gluxit', 'G liên kết với X bằng 2 liên kết hiđrô.', 'Prôtêin và lipit', 'Các liên kết hidrô theo nguyên tắc bổ sung.', NULL, '2023-04-13 17:00:12'),
(1531601629, 11, 561100, 1328, 'Hai lớp photphorit và không có prôtêin', 'Một lớp photphorit và không có prôtêin', 'Một lớp photphorit và các phân tử prôtêin', 'Cả A, B, C đều đúng', NULL, '2023-04-13 17:00:12'),
(1270921826, 11, 561100, 1329, ' Phân giải prôtêin ', 'Phân giải lipit thành axit béo và glixêin', 'Prôtêin và lipit', 'Rêu', NULL, '2023-04-13 17:00:12'),
(636363236, 11, 561100, 1330, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 17:00:13'),
(136222404, 11, 561100, 1333, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 17:00:13'),
(555023528, 11, 561100, 1334, 'vi sinh vật, động vật nguyên sinh.', 'vi sinh vật, tảo, nấm, động vật nguyên sinh .', ' tảo, nấm, động vật nguyên sinh.', 'tảo, nấm nhày, động vật nguyên sinh.', NULL, '2023-04-13 17:00:12'),
(132553475, 11, 561100, 1337, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 17:00:12'),
(678102272, 11, 561100, 1339, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 17:00:12'),
(981543233, 11, 561100, 1340, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 17:00:12'),
(994253756, 11, 561100, 1343, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 17:00:12'),
(18237158, 11, 561100, 1344, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 17:00:12'),
(1640106149, 11, 561100, 1345, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 17:00:12'),
(529531993, 11, 561100, 1346, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 17:00:12'),
(272594594, 11, 561100, 1350, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 17:00:12'),
(770398498, 11, 561100, 1360, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 17:00:12'),
(876398662, 11, 561100, 1361, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 17:00:12'),
(363563866, 11, 561100, 1370, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 17:00:12'),
(1585558535, 11, 561100, 1373, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 17:00:12'),
(438872076, 11, 561100, 1377, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 17:00:12'),
(1180389752, 11, 561100, 1383, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 17:00:12'),
(1021029909, 11, 561100, 1392, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 17:00:12'),
(1489659921, 11, 561100, 1396, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 17:00:12'),
(130127219, 11, 561100, 1399, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 17:00:12'),
(369694012, 11, 561100, 1975, 'lĩnh vực nghiên cứu, ứng dụng vi sinh vật trong sản xuất, chế biến các sản phẩm phục vụ đời sống con người', ' lĩnh vực nghiên cứu, ứng dụng vi sinh vật trong sản xuất, chế biến các sản phẩm xử lí ô nhiễm môi trường.', 'lĩnh vực nghiên cứu, ứng dụng vi sinh vật trong sản xuất, chế biến các sản phẩm thuốc chữa bệnh cho người và động vật.', 'lĩnh vực nghiên cứu, ứng dụng vi sinh vật trong sản xuất, chế biến các loại đồ ăn, thức uống giàu giá trị dinh dưỡng.', NULL, '2023-04-13 17:00:12'),
(1552884917, 11, 561100, 1976, '1', '2', '3', '4', NULL, '2023-04-13 17:00:12'),
(852900505, 11, 565924, 1319, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:40:25'),
(547456853, 11, 565924, 1323, ' phần lớn chúng đã có trong các hợp chất của thực vật.', ' chức năng chính của chúng là hoạt hoá các emzym.', 'chúng đóng vai trò thứ yếu đối với thực vật.', 'chúng chỉ cần cho thực vật ở một vài giai đoạn sinh tr­ưởng nhất định.', NULL, '2023-04-13 16:40:25'),
(1293073009, 11, 565924, 1324, 'Hoá năng', ' Nhiệt năng', 'Điện năng\n', 'Động năng ', NULL, '2023-04-13 16:40:25'),
(1406974136, 11, 565924, 1325, 'Màng sinh chất ', '. Mạng lưới nội chất', 'Prôtêin và lipit', 'Vỏ nhày', NULL, '2023-04-13 16:40:25'),
(1134434505, 11, 565924, 1326, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:40:25'),
(1230052192, 11, 565924, 1327, 'ARN và gluxit', 'G liên kết với X bằng 2 liên kết hiđrô.', 'Prôtêin và lipit', 'Các liên kết hidrô theo nguyên tắc bổ sung.', NULL, '2023-04-13 16:40:25'),
(555441673, 11, 565924, 1328, 'Hai lớp photphorit và không có prôtêin', 'Một lớp photphorit và không có prôtêin', 'Một lớp photphorit và các phân tử prôtêin', 'Cả A, B, C đều đúng', NULL, '2023-04-13 16:40:25'),
(1520231359, 11, 565924, 1331, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:40:25'),
(1625270116, 11, 565924, 1334, 'vi sinh vật, động vật nguyên sinh.', 'vi sinh vật, tảo, nấm, động vật nguyên sinh .', ' tảo, nấm, động vật nguyên sinh.', 'tảo, nấm nhày, động vật nguyên sinh.', NULL, '2023-04-13 16:40:25'),
(936665070, 11, 565924, 1335, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:40:25'),
(282024192, 11, 565924, 1336, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:40:25'),
(1352014226, 11, 565924, 1337, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:40:25'),
(1639366690, 11, 565924, 1338, '', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ADN và prôtêin', '2023-04-13 16:40:55'),
(1478663267, 11, 565924, 1340, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:40:25'),
(30077487, 11, 565924, 1341, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ARN và gluxit', '2023-04-13 16:40:44'),
(1269593088, 11, 565924, 1342, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:40:25'),
(908562660, 11, 565924, 1343, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:40:25'),
(54932978, 11, 565924, 1347, 'Một lớp photphorit và các phân tử prôtêin', 'Phân tửADN', 'Nhiễm sắc thể', 'Hai lớp photphorit và không có prôtêin', 'Một lớp photphorit và các phân tử prôtêin', '2023-04-13 16:40:45'),
(1076086267, 11, 565924, 1349, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:40:25'),
(1587528419, 11, 565924, 1350, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:40:25'),
(1080922412, 11, 565924, 1351, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:40:25'),
(806573082, 11, 565924, 1352, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Một lớp photphorit và các phân tử prôtêin', '2023-04-13 16:40:52'),
(971383431, 11, 565924, 1359, 'Màng sinh chất ', 'Vùng nhân', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:40:25'),
(795730226, 11, 565924, 1375, 'có khả năng thích nghi với môi trường.', 'thường xuyên trao đổi chất với môi trường.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'có khả năng sinh sản để duy trì nòi giống.', 'có khả năng thích nghi với môi trường.', '2023-04-13 16:40:52'),
(417255569, 11, 565924, 1384, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:40:25'),
(521144122, 11, 565924, 1385, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:40:25'),
(1629630547, 11, 565924, 1393, 'virut và vi khuẩn lam.', 'nấm và vi khuẩn.', ' vi khuẩn và vi khuẩn lam.', 'tảo và vi khuẩn lam.', NULL, '2023-04-13 16:40:25'),
(1034581984, 11, 565924, 1397, 'Cấu trúc của plasmit.', 'Cấu trúc và thành phần hoá học của thành tế bào. ', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'Số lượng nhiễm sắc thể trong nhân hay vùng nhân.', NULL, '2023-04-13 16:40:25'),
(170869162, 11, 565924, 1398, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', 'nước được cấu tạo từ các nguyên tố đa lượng.', '2023-04-13 16:40:45'),
(546992898, 11, 565924, 1976, '1', '2', '3', '4', NULL, '2023-04-13 16:40:25'),
(1252614096, 11, 570056, 1812, 'Dễ', '5', '3', '12', NULL, '2023-04-03 14:56:33'),
(996047142, 11, 570056, 1813, 'Dễ', '5', '4', '13', '5', '2023-04-03 14:56:55'),
(822426933, 11, 570056, 1814, 'Dễ', '5', '5', '14', '5', '2023-04-03 14:57:06'),
(1021205251, 11, 570056, 1816, 'Dễ', '5', '7', '16', 'Dễ', '2023-04-03 14:56:57'),
(751447942, 11, 570056, 1817, 'Dễ', '5', '8', '17', '17', '2023-04-03 14:56:48'),
(99520146, 11, 570056, 1818, 'Dễ', '5', '9', '18', '5', '2023-04-03 14:56:37'),
(1084908937, 11, 570056, 1820, 'Dễ', '5', '11', '20', 'Dễ', '2023-04-03 14:56:56'),
(696806065, 11, 570056, 1825, 'Dễ', '5', '16', '25', '25', '2023-04-03 14:56:48'),
(139752530, 11, 570056, 1826, 'Dễ', '5', '17', '26', '26', '2023-04-03 14:57:18'),
(1397831067, 11, 570056, 1827, 'Dễ', '5', '18', '27', '18', '2023-04-03 14:56:59'),
(796635343, 11, 570056, 1828, 'Dễ', '5', '19', '28', 'Dễ', '2023-04-03 14:56:49'),
(410574936, 11, 570056, 1829, 'Dễ', '5', '20', '29', '20', '2023-04-03 14:56:44'),
(140826475, 11, 570056, 1830, 'Dễ', '5', '21', '30', 'Dễ', '2023-04-03 14:56:39'),
(239823807, 11, 570056, 1831, 'Dễ', '5', '22', '31', 'Dễ', '2023-04-03 14:56:41'),
(228866022, 11, 570056, 1832, 'Dễ', '5', '23', '32', 'Dễ', '2023-04-03 14:57:12'),
(994678145, 11, 570056, 1833, 'Dễ', '5', '24', '33', 'Dễ', '2023-04-03 14:57:02'),
(227597820, 11, 570056, 1834, 'Dễ', '5', '25', '34', '25', '2023-04-03 14:57:11'),
(138567859, 11, 570056, 1836, 'Dễ', '5', '27', '36', '5', '2023-04-03 14:56:36'),
(1003833544, 11, 570056, 1839, 'trung bình', '5', '30', '39', '5', '2023-04-03 14:56:54'),
(572037199, 11, 570056, 1848, 'trung bình', '5', '39', '48', 'trung bình', '2023-04-03 14:56:46'),
(1662163752, 11, 570056, 1854, 'trung bình', '5', '45', '54', 'trung bình', '2023-04-03 14:57:21'),
(276477698, 11, 570056, 1857, 'trung bình', '5', '48', '57', '48', '2023-04-03 14:57:08'),
(415177119, 11, 570056, 1859, 'trung bình', '5', '50', '59', 'trung bình', '2023-04-03 14:56:43'),
(238806497, 11, 570056, 1861, 'trung bình', '5', '52', '61', 'trung bình', '2023-04-03 14:56:40'),
(1447262017, 11, 570056, 1865, 'khó', '5', '56', '65', '56', '2023-04-03 14:56:58'),
(848906491, 11, 570056, 1867, 'khó', '5', '58', '67', 'khó', '2023-04-03 14:56:51'),
(830959579, 11, 570056, 1880, 'khó', '5', '71', '80', 'khó', '2023-04-03 14:56:52'),
(595207137, 11, 570056, 1881, 'khó', '5', '72', '81', 'khó', '2023-04-03 14:57:14'),
(961526396, 11, 570056, 1884, 'khó', '5', '75', '84', '75', '2023-04-03 14:57:03'),
(424656151, 11, 570056, 1885, 'khó', '5', '76', '85', 'khó', '2023-04-03 14:57:16'),
(1292853175, 11, 613374, 1319, 'Dễ', '5', '2', '11', 'Dễ', '2023-04-02 16:00:57'),
(549463570, 11, 613374, 1320, 'Dễ', '5', '3', '12', 'Dễ', '2023-04-02 16:00:21'),
(1459780300, 11, 613374, 1322, 'Dễ', '5', '5', '14', 'Dễ', '2023-04-02 16:01:03'),
(779771547, 11, 613374, 1323, 'Dễ', '5', '6', '15', 'Dễ', '2023-04-02 16:00:38'),
(1534033275, 11, 613374, 1324, 'Dễ', '5', '7', '16', 'Dễ', '2023-04-02 16:01:01'),
(893251005, 11, 613374, 1327, 'Dễ', '5', '10', '19', 'Dễ', '2023-04-02 16:00:41'),
(1630145013, 11, 613374, 1328, 'Dễ', '5', '11', '20', 'Dễ', '2023-04-02 16:01:06'),
(274309275, 11, 613374, 1329, 'Dễ', '5', '12', '21', 'Dễ', '2023-04-02 16:00:24'),
(200361033, 11, 613374, 1330, 'Dễ', '5', '13', '22', 'Dễ', '2023-04-02 16:00:21'),
(1176871729, 11, 613374, 1331, 'Dễ', '5', '14', '23', '23', '2023-04-02 16:00:48'),
(770297807, 11, 613374, 1332, 'Dễ', '5', '15', '24', 'Dễ', '2023-04-02 16:00:37'),
(1558403583, 11, 613374, 1333, 'Dễ', '5', '16', '25', 'Dễ', '2023-04-02 16:01:09'),
(790771843, 11, 613374, 1336, 'Dễ', '5', '19', '28', 'Dễ', '2023-04-02 16:00:39'),
(1226602070, 11, 613374, 1339, 'Dễ', '5', '22', '31', 'Dễ', '2023-04-02 16:00:50'),
(1281593465, 11, 613374, 1340, 'Dễ', '5', '23', '32', 'Dễ', '2023-04-02 16:00:52'),
(714198023, 11, 613374, 1341, 'Dễ', '5', '24', '33', 'Dễ', '2023-04-02 16:00:35'),
(1468852108, 11, 613374, 1342, 'Dễ', '5', '25', '34', 'Dễ', '2023-04-02 16:01:13'),
(808622263, 11, 613374, 1344, 'Dễ', '5', '27', '36', 'Dễ', '2023-04-02 16:00:43'),
(515294281, 11, 613374, 1350, 'trung bình', '5', '33', '42', 'trung bình', '2023-04-02 16:00:27'),
(1028691138, 11, 613374, 1352, 'trung bình', '5', '35', '44', 'trung bình', '2023-04-02 16:00:45'),
(711566489, 11, 613374, 1353, 'trung bình', '5', '36', '45', 'trung bình', '2023-04-02 16:00:34'),
(1304443623, 11, 613374, 1355, 'trung bình', '5', '38', '47', 'trung bình', '2023-04-02 16:00:55'),
(1546405492, 11, 613374, 1367, 'trung bình', '5', '50', '59', 'trung bình', '2023-04-02 16:00:59'),
(905317514, 11, 613374, 1369, 'trung bình', '5', '52', '61', 'trung bình', '2023-04-02 16:00:42'),
(625741978, 11, 613374, 1372, 'khó', '5', '55', '64', 'khó', '2023-04-02 16:00:33'),
(1193104947, 11, 613374, 1373, 'khó', '5', '56', '65', 'khó', '2023-04-02 16:00:51'),
(1575686361, 11, 613374, 1375, 'khó', '5', '58', '67', 'khó', '2023-04-02 16:01:06'),
(347974899, 11, 613374, 1379, 'khó', '5', '62', '71', 'khó', '2023-04-02 16:00:18'),
(569704342, 11, 613374, 1396, 'khó', '5', '79', '88', 'khó', '2023-04-02 16:00:31'),
(948631001, 11, 613374, 1397, 'khó', '5', '80', '89', '89', '2023-04-02 16:00:46'),
(519694193, 11, 699653, 1811, 'Dễ', '5', '2', '11', NULL, '2023-04-11 06:25:38'),
(860711164, 11, 699653, 1812, 'Dễ', '5', '3', '12', NULL, '2023-04-11 06:25:38'),
(303118023, 11, 699653, 1814, 'Dễ', '5', '5', '14', NULL, '2023-04-11 06:25:38'),
(799423982, 11, 699653, 1815, 'Dễ', '5', '6', '15', NULL, '2023-04-11 06:25:38'),
(176669823, 11, 699653, 1816, 'Dễ', '5', '7', '16', NULL, '2023-04-11 06:25:38'),
(59526395, 11, 699653, 1818, 'Dễ', '5', '9', '18', NULL, '2023-04-11 06:25:38'),
(216577879, 11, 699653, 1819, 'Dễ', '5', '10', '19', 'Dễ', '2023-04-11 06:25:43'),
(477448227, 11, 699653, 1820, 'Dễ', '5', '11', '20', 'Dễ', '2023-04-11 06:25:46'),
(1393934311, 11, 699653, 1821, 'Dễ', '5', '12', '21', NULL, '2023-04-11 06:25:38'),
(1438705140, 11, 699653, 1823, 'Dễ', '5', '14', '23', NULL, '2023-04-11 06:25:38'),
(1073317761, 11, 699653, 1824, 'Dễ', '5', '15', '24', NULL, '2023-04-11 06:25:38'),
(1614623769, 11, 699653, 1825, 'Dễ', '5', '16', '25', NULL, '2023-04-11 06:25:38'),
(1500235332, 11, 699653, 1827, 'Dễ', '5', '18', '27', NULL, '2023-04-11 06:25:38'),
(631781706, 11, 699653, 1831, 'Dễ', '5', '22', '31', NULL, '2023-04-11 06:25:38'),
(732087257, 11, 699653, 1833, 'Dễ', '5', '24', '33', NULL, '2023-04-11 06:25:38'),
(78811506, 11, 699653, 1834, 'Dễ', '5', '25', '34', '25', '2023-04-11 06:25:41'),
(507447323, 11, 699653, 1835, 'Dễ', '5', '26', '35', NULL, '2023-04-11 06:25:38'),
(259727934, 11, 699653, 1836, 'Dễ', '5', '27', '36', 'Dễ', '2023-04-11 06:25:44'),
(784900038, 11, 699653, 1842, 'trung bình', '5', '33', '42', NULL, '2023-04-11 06:25:38'),
(736441115, 11, 699653, 1847, 'trung bình', '5', '38', '47', NULL, '2023-04-11 06:25:38'),
(203157167, 11, 699653, 1850, 'trung bình', '5', '41', '50', NULL, '2023-04-11 06:25:38'),
(1644463742, 11, 699653, 1853, 'trung bình', '5', '44', '53', NULL, '2023-04-11 06:25:38'),
(1579606209, 11, 699653, 1857, 'trung bình', '5', '48', '57', NULL, '2023-04-11 06:25:38'),
(883702618, 11, 699653, 1860, 'trung bình', '5', '51', '60', NULL, '2023-04-11 06:25:38'),
(106713194, 11, 699653, 1864, 'khó', '5', '55', '64', 'khó', '2023-04-11 06:25:42'),
(454947830, 11, 699653, 1870, 'khó', '5', '61', '70', 'khó', '2023-04-11 06:25:45'),
(261134788, 11, 699653, 1875, 'khó', '5', '66', '75', NULL, '2023-04-11 06:25:38'),
(1333610623, 11, 699653, 1881, 'khó', '5', '72', '81', NULL, '2023-04-11 06:25:38'),
(680896400, 11, 699653, 1882, 'khó', '5', '73', '82', NULL, '2023-04-11 06:25:38'),
(1355979255, 11, 699653, 1883, 'khó', '5', '74', '83', NULL, '2023-04-11 06:25:38'),
(1256016955, 11, 853636, 1811, 'Dễ', '5', '2', '11', 'Dễ', '2023-04-03 14:57:59'),
(1583641635, 11, 853636, 1812, 'Dễ', '5', '3', '12', '5', '2023-04-03 14:58:08'),
(1441254539, 11, 853636, 1813, 'Dễ', '5', '4', '13', '4', '2023-04-03 14:58:36'),
(1546458791, 11, 853636, 1815, 'Dễ', '5', '6', '15', '6', '2023-04-03 14:58:39'),
(1549214359, 11, 853636, 1816, 'Dễ', '5', '7', '16', '5', '2023-04-03 14:58:07'),
(1380992380, 11, 853636, 1818, 'Dễ', '5', '9', '18', 'Dễ', '2023-04-03 14:58:26'),
(1493319636, 11, 853636, 1819, 'Dễ', '5', '10', '19', 'Dễ', '2023-04-03 14:58:34'),
(19927995, 11, 853636, 1820, 'Dễ', '5', '11', '20', '11', '2023-04-03 14:57:49'),
(422260834, 11, 853636, 1822, 'Dễ', '5', '13', '22', 'Dễ', '2023-04-03 14:57:53'),
(238871439, 11, 853636, 1823, 'Dễ', '5', '14', '23', '14', '2023-04-03 14:58:15'),
(1386401800, 11, 853636, 1824, 'Dễ', '5', '15', '24', 'Dễ', '2023-04-03 14:58:02'),
(441067172, 11, 853636, 1825, 'Dễ', '5', '16', '25', 'Dễ', '2023-04-03 14:57:53'),
(1572414196, 11, 853636, 1828, 'Dễ', '5', '19', '28', '19', '2023-04-03 14:58:06'),
(1399094258, 11, 853636, 1830, 'Dễ', '5', '21', '30', 'Dễ', '2023-04-03 14:58:02'),
(26764479, 11, 853636, 1831, 'Dễ', '5', '22', '31', 'Dễ', '2023-04-03 14:57:51'),
(1489101668, 11, 853636, 1833, 'Dễ', '5', '24', '33', '24', '2023-04-03 14:58:04'),
(1050792881, 11, 853636, 1835, 'Dễ', '5', '26', '35', 'Dễ', '2023-04-03 14:57:59'),
(774668234, 11, 853636, 1836, 'Dễ', '5', '27', '36', '27', '2023-04-03 14:58:31'),
(318659606, 11, 853636, 1838, 'trung bình', '5', '29', '38', 'trung bình', '2023-04-03 14:58:15'),
(691385227, 11, 853636, 1840, 'trung bình', '5', '31', '40', '40', '2023-04-03 14:58:17'),
(831732860, 11, 853636, 1848, 'trung bình', '5', '39', '48', 'trung bình', '2023-04-03 14:57:56'),
(1037920848, 11, 853636, 1856, 'trung bình', '5', '47', '56', '5', '2023-04-03 14:58:00'),
(706977979, 11, 853636, 1857, 'trung bình', '5', '48', '57', 'trung bình', '2023-04-03 14:57:54'),
(945530662, 11, 853636, 1858, 'trung bình', '5', '49', '58', 'trung bình', '2023-04-03 14:58:12'),
(687778572, 11, 853636, 1865, 'khó', '5', '56', '65', '65', '2023-04-03 14:58:22'),
(1495391197, 11, 853636, 1866, 'khó', '5', '57', '66', 'khó', '2023-04-03 14:58:41'),
(867707804, 11, 853636, 1876, 'khó', '5', '67', '76', 'khó', '2023-04-03 14:58:12'),
(102415112, 11, 853636, 1882, 'khó', '5', '73', '82', 'khó', '2023-04-03 14:57:52'),
(974365378, 11, 853636, 1887, 'khó', '5', '78', '87', 'khó', '2023-04-03 14:58:29'),
(152566790, 11, 853636, 1889, 'khó', '5', '80', '89', '80', '2023-04-03 14:58:20'),
(702506483, 12, 301006, 1319, 'Dễ', '5', '2', '11', 'Dễ', '2023-04-02 16:05:20'),
(1152695734, 12, 301006, 1330, 'Dễ', '5', '13', '22', 'Dễ', '2023-04-02 16:05:28'),
(1174410980, 12, 301006, 1331, 'Dễ', '5', '14', '23', 'Dễ', '2023-04-02 16:05:29'),
(1451041252, 12, 301006, 1332, 'Dễ', '5', '15', '24', '15', '2023-04-02 16:05:36'),
(891188127, 12, 301006, 1334, 'Dễ', '5', '17', '26', 'Dễ', '2023-04-02 16:05:23'),
(1604199206, 12, 301006, 1340, 'Dễ', '5', '23', '32', 'Dễ', '2023-04-02 16:05:49'),
(535559397, 12, 301006, 1347, 'trung bình', '5', '30', '39', 'trung bình', '2023-04-02 16:05:13'),
(1674076460, 12, 301006, 1350, 'trung bình', '5', '33', '42', '42', '2023-04-02 16:05:46'),
(25574454, 12, 301006, 1351, 'trung bình', '5', '34', '43', 'trung bình', '2023-04-02 16:05:02'),
(1167606062, 12, 301006, 1352, 'trung bình', '5', '35', '44', '44', '2023-04-02 16:05:27'),
(563615294, 12, 301006, 1353, 'trung bình', '5', '36', '45', 'trung bình', '2023-04-02 16:05:16'),
(746133562, 12, 301006, 1354, 'trung bình', '5', '37', '46', 'trung bình', '2023-04-02 16:05:24'),
(615806585, 12, 301006, 1355, 'trung bình', '5', '38', '47', 'trung bình', '2023-04-02 16:05:15'),
(214478603, 12, 301006, 1356, 'trung bình', '5', '39', '48', 'trung bình', '2023-04-02 16:05:03'),
(707475104, 12, 301006, 1357, 'trung bình', '5', '40', '49', 'trung bình', '2023-04-02 16:05:20'),
(738282623, 12, 301006, 1359, 'trung bình', '5', '42', '51', 'trung bình', '2023-04-02 16:05:21'),
(212156128, 12, 301006, 1360, 'trung bình', '5', '43', '52', 'trung bình', '2023-04-02 16:04:59'),
(243389618, 12, 301006, 1361, 'trung bình', '5', '44', '53', 'trung bình', '2023-04-02 16:05:08'),
(1197973882, 12, 301006, 1363, 'trung bình', '5', '46', '55', '46', '2023-04-02 16:05:31'),
(680794904, 12, 301006, 1364, 'trung bình', '5', '47', '56', 'trung bình', '2023-04-02 16:05:18'),
(230900627, 12, 301006, 1366, 'trung bình', '5', '49', '58', 'trung bình', '2023-04-02 16:05:05'),
(386745849, 12, 301006, 1367, 'trung bình', '5', '50', '59', 'trung bình', '2023-04-02 16:05:12'),
(326522953, 12, 301006, 1368, 'trung bình', '5', '51', '60', '5', '2023-04-02 16:05:11'),
(1243601092, 12, 301006, 1369, 'trung bình', '5', '52', '61', '61', '2023-04-02 16:05:43'),
(1454131767, 12, 301006, 1374, 'khó', '5', '57', '66', 'khó', '2023-04-02 16:05:40'),
(1253509843, 12, 301006, 1376, 'khó', '5', '59', '68', '68', '2023-04-02 16:05:34'),
(1626356588, 12, 301006, 1382, 'khó', '5', '65', '74', 'khó', '2023-04-02 16:05:47'),
(955448103, 12, 301006, 1392, 'khó', '5', '75', '84', 'khó', '2023-04-02 16:05:25'),
(235368291, 12, 301006, 1398, 'khó', '5', '81', '90', '5', '2023-04-02 16:05:07'),
(1412348667, 12, 301006, 1399, 'khó', '5', '82', '91', '91', '2023-04-02 16:05:41'),
(265946130, 16, 768767, 1811, 'Dễ', '5', '2', '11', 'Dễ', '2023-04-03 15:22:58'),
(1275084929, 16, 768767, 1813, 'Dễ', '5', '4', '13', 'Dễ', '2023-04-03 15:23:24'),
(875107655, 16, 768767, 1815, 'Dễ', '5', '6', '15', 'Dễ', '2023-04-03 15:23:21'),
(702684635, 16, 768767, 1816, 'Dễ', '5', '7', '16', 'Dễ', '2023-04-03 15:23:17'),
(58907657, 16, 768767, 1817, 'Dễ', '5', '8', '17', 'Dễ', '2023-04-03 15:22:53'),
(1027402089, 16, 768767, 1818, 'Dễ', '5', '9', '18', 'Dễ', '2023-04-03 15:23:23'),
(463508773, 16, 768767, 1819, 'Dễ', '5', '10', '19', 'Dễ', '2023-04-03 15:23:06'),
(535101567, 16, 768767, 1820, 'Dễ', '5', '11', '20', '5', '2023-04-03 15:23:10'),
(504182652, 16, 768767, 1822, 'Dễ', '5', '13', '22', '22', '2023-04-03 15:23:13'),
(515417858, 16, 768767, 1824, 'Dễ', '5', '15', '24', '5', '2023-04-03 15:23:11'),
(418273467, 16, 768767, 1826, 'Dễ', '5', '17', '26', 'Dễ', '2023-04-03 15:23:01'),
(67961535, 16, 768767, 1827, 'Dễ', '5', '18', '27', 'Dễ', '2023-04-03 15:22:54'),
(82861365, 16, 768767, 1828, 'Dễ', '5', '19', '28', 'Dễ', '2023-04-03 15:22:57'),
(1025426981, 16, 768767, 1829, 'Dễ', '5', '20', '29', 'Dễ', '2023-04-03 15:23:33'),
(613134470, 16, 768767, 1830, 'Dễ', '5', '21', '30', 'Dễ', '2023-04-03 15:23:16'),
(544397513, 16, 768767, 1832, 'Dễ', '5', '23', '32', 'Dễ', '2023-04-03 15:23:15'),
(175136974, 16, 768767, 1835, 'Dễ', '5', '26', '35', 'Dễ', '2023-04-03 15:22:56'),
(789317102, 16, 768767, 1836, 'Dễ', '5', '27', '36', '27', '2023-04-03 15:23:35'),
(1311757932, 16, 768767, 1844, 'trung bình', '5', '35', '44', 'trung bình', '2023-04-03 15:23:28'),
(1651044588, 16, 768767, 1845, 'trung bình', '5', '36', '45', '45', '2023-04-03 15:23:46'),
(1319293032, 16, 768767, 1851, 'trung bình', '5', '42', '51', 'trung bình', '2023-04-03 15:23:29'),
(1387590784, 16, 768767, 1855, 'trung bình', '5', '46', '55', 'trung bình', '2023-04-03 15:23:42'),
(448873325, 16, 768767, 1861, 'trung bình', '5', '52', '61', 'trung bình', '2023-04-03 15:23:00'),
(1416698046, 16, 768767, 1862, 'trung bình', '5', '53', '62', 'trung bình', '2023-04-03 15:23:43'),
(481864465, 16, 768767, 1868, 'khó', '5', '59', '68', 'khó', '2023-04-03 15:23:07'),
(178851444, 16, 768767, 1870, 'khó', '5', '61', '70', 'khó', '2023-04-03 15:22:59'),
(1024466885, 16, 768767, 1874, 'khó', '5', '65', '74', 'khó', '2023-04-03 15:23:32'),
(1560767711, 16, 768767, 1876, 'khó', '5', '67', '76', '76', '2023-04-03 15:23:46'),
(1399255105, 16, 768767, 1888, 'khó', '5', '79', '88', 'khó', '2023-04-03 15:23:40'),
(932307863, 16, 768767, 1892, 'khó', '5', '83', '92', 'khó', '2023-04-03 15:23:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student_test_detail`
--

CREATE TABLE `student_test_detail` (
  `ID` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `test_code` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_a` text DEFAULT NULL,
  `answer_b` text DEFAULT NULL,
  `answer_c` text DEFAULT NULL,
  `answer_d` text DEFAULT NULL,
  `student_answer` text DEFAULT NULL,
  `timest` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `student_test_detail`
--

INSERT INTO `student_test_detail` (`ID`, `student_id`, `test_code`, `question_id`, `answer_a`, `answer_b`, `answer_c`, `answer_d`, `student_answer`, `timest`) VALUES
(1065947036, 11, 424315, 1566, 'Dễ', '5', '3', '12', '12', '2023-04-02 18:11:34'),
(431448879, 11, 424315, 1567, 'Dễ', '5', '4', '13', 'Dễ', '2023-04-02 18:11:24'),
(682684369, 11, 424315, 1573, 'Dễ', '5', '10', '19', 'Dễ', '2023-04-02 18:11:30'),
(1647022988, 11, 424315, 1574, 'Dễ', '5', '11', '20', NULL, '2023-04-02 18:11:16'),
(1234352366, 11, 424315, 1575, 'Dễ', '5', '12', '21', NULL, '2023-04-02 18:11:16'),
(71853732, 11, 424315, 1582, 'Dễ', '5', '19', '28', 'Dễ', '2023-04-02 18:11:20'),
(1015384069, 11, 424315, 1583, 'Dễ', '5', '20', '29', NULL, '2023-04-02 18:11:16'),
(138508731, 11, 424315, 1587, 'Dễ', '5', '24', '33', NULL, '2023-04-02 18:11:16'),
(629577441, 11, 424315, 1592, 'trung bình', '5', '29', '38', NULL, '2023-04-02 18:11:16'),
(471358325, 11, 424315, 1593, 'trung bình', '5', '30', '39', NULL, '2023-04-02 18:11:16'),
(964581797, 11, 424315, 1594, 'trung bình', '5', '31', '40', NULL, '2023-04-02 18:11:16'),
(490582522, 11, 424315, 1596, 'trung bình', '5', '33', '42', 'trung bình', '2023-04-02 18:11:26'),
(836664335, 11, 424315, 1600, 'trung bình', '5', '37', '46', 'trung bình', '2023-04-02 18:11:32'),
(1310567813, 11, 424315, 1601, 'trung bình', '5', '38', '47', NULL, '2023-04-02 18:11:16'),
(193805732, 11, 424315, 1608, 'trung bình', '5', '45', '54', 'trung bình', '2023-04-02 18:11:23'),
(770273975, 11, 424315, 1617, 'trung bình', '5', '54', '63', NULL, '2023-04-02 18:11:16'),
(1135595455, 11, 424315, 1619, 'khó', '5', '56', '65', NULL, '2023-04-02 18:11:16'),
(733033483, 11, 424315, 1620, 'khó', '5', '57', '66', NULL, '2023-04-02 18:11:16'),
(632299644, 11, 424315, 1621, 'khó', '5', '58', '67', NULL, '2023-04-02 18:11:16'),
(687348595, 11, 424315, 1622, 'khó', '5', '59', '68', NULL, '2023-04-02 18:11:16'),
(832559230, 11, 424315, 1623, 'khó', '5', '60', '69', NULL, '2023-04-02 18:11:16'),
(173750043, 11, 424315, 1624, 'khó', '5', '61', '70', NULL, '2023-04-02 18:11:16'),
(1179130650, 11, 424315, 1625, 'khó', '5', '62', '71', 'khó', '2023-04-02 18:11:38'),
(162887334, 11, 424315, 1627, 'khó', '5', '64', '73', 'khó', '2023-04-02 18:11:22'),
(568919399, 11, 424315, 1628, 'khó', '5', '65', '74', 'khó', '2023-04-02 18:11:27'),
(458611307, 11, 424315, 1629, 'khó', '5', '66', '75', 'khó', '2023-04-02 18:11:25'),
(826331880, 11, 424315, 1630, 'khó', '5', '67', '76', 'khó', '2023-04-02 18:11:31'),
(1286139973, 11, 424315, 1631, 'khó', '5', '68', '77', NULL, '2023-04-02 18:11:16'),
(562833104, 11, 424315, 1632, 'khó', '5', '69', '78', NULL, '2023-04-02 18:11:16'),
(101745341, 11, 424315, 1633, 'khó', '5', '70', '79', 'khó', '2023-04-02 18:11:20'),
(16082596, 11, 424315, 1634, 'khó', '5', '71', '80', '71', '2023-04-02 18:11:19'),
(1221972480, 11, 424315, 1636, 'khó', '5', '73', '82', NULL, '2023-04-02 18:11:16'),
(1329149628, 11, 424315, 1637, 'khó', '5', '74', '83', NULL, '2023-04-02 18:11:16'),
(599415136, 11, 424315, 1638, 'khó', '5', '75', '84', NULL, '2023-04-02 18:11:16'),
(1327075297, 11, 424315, 1640, 'khó', '5', '77', '86', NULL, '2023-04-02 18:11:16'),
(1122237215, 11, 424315, 1641, 'khó', '5', '78', '87', '78', '2023-04-02 18:11:35'),
(210855114, 11, 424315, 1642, 'khó', '5', '79', '88', NULL, '2023-04-02 18:11:16'),
(951521636, 11, 424315, 1643, 'khó', '5', '80', '89', NULL, '2023-04-02 18:11:16'),
(1524742863, 11, 424315, 1645, 'khó', '5', '82', '91', NULL, '2023-04-02 18:11:16'),
(1293133157, 11, 424315, 1646, 'khó', '5', '83', '92', NULL, '2023-04-02 18:11:16'),
(728995413, 11, 435636, 1401, 'Dễ', '5', '2', '11', '11', '2023-04-02 16:39:52'),
(404909850, 11, 435636, 1402, 'Dễ', '5', '3', '12', '5', '2023-04-02 16:39:49'),
(1961300, 11, 435636, 1403, 'Dễ', '5', '4', '13', 'Dễ', '2023-04-02 16:38:24'),
(177940874, 11, 435636, 1404, 'Dễ', '5', '5', '14', 'Dễ', '2023-04-02 16:39:38'),
(132734403, 11, 435636, 1405, 'Dễ', '5', '6', '15', 'Dễ', '2023-04-02 16:38:25'),
(1449994000, 11, 435636, 1406, 'Dễ', '5', '7', '16', NULL, '2023-04-02 16:38:18'),
(1006930759, 11, 435636, 1407, 'Dễ', '5', '8', '17', NULL, '2023-04-02 16:38:18'),
(555675396, 11, 435636, 1408, 'Dễ', '5', '9', '18', '9', '2023-04-02 16:39:45'),
(37517371, 11, 435636, 1409, 'Dễ', '5', '10', '19', 'Dễ', '2023-04-02 16:38:24'),
(1614622387, 11, 435636, 1410, 'Dễ', '5', '11', '20', '11', '2023-04-02 16:40:14'),
(1501921963, 11, 435636, 1411, 'Dễ', '5', '12', '21', 'Dễ', '2023-04-02 16:40:15'),
(1319071413, 11, 435636, 1412, 'Dễ', '5', '13', '22', NULL, '2023-04-02 16:38:18'),
(385607234, 11, 435636, 1414, 'Dễ', '5', '15', '24', '5', '2023-04-02 16:39:48'),
(1043404229, 11, 435636, 1415, 'Dễ', '5', '16', '25', NULL, '2023-04-02 16:38:18'),
(292948687, 11, 435636, 1416, 'Dễ', '5', '17', '26', '5', '2023-04-02 16:39:48'),
(1200388936, 11, 435636, 1417, 'Dễ', '5', '18', '27', NULL, '2023-04-02 16:38:18'),
(1055412519, 11, 435636, 1419, 'Dễ', '5', '20', '29', NULL, '2023-04-02 16:38:18'),
(1450101335, 11, 435636, 1420, 'Dễ', '5', '21', '30', NULL, '2023-04-02 16:38:18'),
(883422980, 11, 435636, 1421, 'Dễ', '5', '22', '31', '5', '2023-04-02 16:39:51'),
(710570420, 11, 435636, 1422, 'Dễ', '5', '23', '32', '32', '2023-04-02 16:40:04'),
(678649480, 11, 435636, 1423, 'Dễ', '5', '24', '33', '24', '2023-04-02 16:40:04'),
(1370639960, 11, 435636, 1424, 'Dễ', '5', '25', '34', NULL, '2023-04-02 16:38:18'),
(241623036, 11, 435636, 1425, 'Dễ', '5', '26', '35', '35', '2023-04-02 16:39:56'),
(1479463061, 11, 435636, 1426, 'Dễ', '5', '27', '36', '27', '2023-04-02 16:40:16'),
(152709010, 11, 435636, 1427, 'trung bình', '5', '28', '37', '5', '2023-04-02 16:39:57'),
(187768941, 11, 435636, 1429, 'trung bình', '5', '30', '39', '5', '2023-04-02 16:39:42'),
(1333462137, 11, 435636, 1435, 'trung bình', '5', '36', '45', NULL, '2023-04-02 16:38:18'),
(1436910873, 11, 435636, 1438, 'trung bình', '5', '39', '48', NULL, '2023-04-02 16:38:18'),
(1443839413, 11, 435636, 1440, 'trung bình', '5', '41', '50', NULL, '2023-04-02 16:38:18'),
(224234244, 11, 435636, 1442, 'trung bình', '5', '43', '52', '43', '2023-04-02 16:40:00'),
(166206522, 11, 435636, 1445, 'trung bình', '5', '46', '55', '5', '2023-04-02 16:39:40'),
(1055954470, 11, 435636, 1451, 'trung bình', '5', '52', '61', NULL, '2023-04-02 16:38:18'),
(922579529, 11, 435636, 1455, 'khó', '5', '56', '65', NULL, '2023-04-02 16:38:18'),
(1451637213, 11, 435636, 1457, 'khó', '5', '58', '67', '67', '2023-04-02 16:40:12'),
(499889776, 11, 435636, 1459, 'khó', '5', '60', '69', 'khó', '2023-04-02 16:40:08'),
(560867972, 11, 435636, 1463, 'khó', '5', '64', '73', '64', '2023-04-02 16:39:45'),
(1172008388, 11, 435636, 1472, 'khó', '5', '73', '82', NULL, '2023-04-02 16:38:18'),
(794591520, 11, 435636, 1475, 'khó', '5', '76', '85', '76', '2023-04-02 16:39:52'),
(557371936, 11, 435636, 1477, 'khó', '5', '78', '87', '87', '2023-04-02 16:39:44'),
(1332134852, 11, 435636, 1478, 'khó', '5', '79', '88', NULL, '2023-04-02 16:38:18'),
(1047916684, 11, 456655, 1320, 'Đường đơn', 'đường đôi', 'Đường đa', 'Cabonhidrat', NULL, '2023-04-13 16:59:05'),
(129433503, 11, 456655, 1321, 'A. giới - ngành - lớp - bộ - họ - chi - loài.\n', 'B. loài - bộ - họ - chi - lớp - ngành - giới.\n', 'C. loài - chi- họ -  bộ -  lớp - ngành - giới.\n', 'D. loài -  chi - bộ - họ - lớp - ngành - giới.\n', NULL, '2023-04-13 16:59:05'),
(1596006310, 11, 456655, 1322, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:59:05'),
(709802519, 11, 456655, 1325, 'Màng sinh chất ', '. Mạng lưới nội chất', 'Prôtêin và lipit', 'Vỏ nhày', NULL, '2023-04-13 16:59:05'),
(1067965948, 11, 456655, 1326, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:59:05'),
(1126038424, 11, 456655, 1327, 'ARN và gluxit', 'G liên kết với X bằng 2 liên kết hiđrô.', 'Prôtêin và lipit', 'Các liên kết hidrô theo nguyên tắc bổ sung.', NULL, '2023-04-13 16:59:05'),
(1592648575, 11, 456655, 1328, 'Hai lớp photphorit và không có prôtêin', 'Một lớp photphorit và không có prôtêin', 'Một lớp photphorit và các phân tử prôtêin', 'Cả A, B, C đều đúng', NULL, '2023-04-13 16:59:05'),
(45408835, 11, 456655, 1330, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ARN và gluxit', '2023-04-13 16:59:25'),
(62970711, 11, 456655, 1331, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:59:05'),
(1611807629, 11, 456655, 1333, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:59:05'),
(1670304943, 11, 456655, 1334, 'vi sinh vật, động vật nguyên sinh.', 'vi sinh vật, tảo, nấm, động vật nguyên sinh .', ' tảo, nấm, động vật nguyên sinh.', 'tảo, nấm nhày, động vật nguyên sinh.', NULL, '2023-04-13 16:59:05'),
(272386249, 11, 456655, 1336, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:59:05'),
(796673914, 11, 456655, 1337, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:59:05'),
(957318127, 11, 456655, 1338, '', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:59:05'),
(253418027, 11, 456655, 1339, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:59:05'),
(1179582654, 11, 456655, 1340, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:59:05'),
(51786899, 11, 456655, 1341, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:59:05'),
(718545299, 11, 456655, 1342, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:59:05'),
(301569271, 11, 456655, 1343, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:59:05'),
(1546717730, 11, 456655, 1344, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:59:05'),
(90505986, 11, 456655, 1345, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:59:05'),
(339975418, 11, 456655, 1348, '1', '2', '3', '4', NULL, '2023-04-13 16:59:05'),
(882292418, 11, 456655, 1349, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:59:05'),
(315986466, 11, 456655, 1350, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:59:05'),
(1649035583, 11, 456655, 1351, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:59:05'),
(1670098330, 11, 456655, 1353, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:59:05'),
(1463968613, 11, 456655, 1355, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:59:05'),
(1514872385, 11, 456655, 1356, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:59:05'),
(1159449300, 11, 456655, 1359, 'Màng sinh chất ', 'Vùng nhân', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:59:05'),
(1406373943, 11, 456655, 1361, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:59:05'),
(424537851, 11, 456655, 1363, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:59:05'),
(1175221565, 11, 456655, 1367, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:59:05'),
(1553391059, 11, 456655, 1368, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:59:05'),
(223580444, 11, 456655, 1369, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:59:05'),
(951882001, 11, 456655, 1371, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:59:05'),
(1637691465, 11, 456655, 1372, 'Pôlisaccarit', 'năng lượng dự trữ ', 'axit nuclêic', 'Các chất dự trữ', NULL, '2023-04-13 16:59:05'),
(345992074, 11, 456655, 1374, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:59:05'),
(1519155848, 11, 456655, 1377, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:59:05'),
(294392619, 11, 456655, 1381, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:59:05'),
(1375371720, 11, 456655, 1383, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:59:05'),
(599844801, 11, 456655, 1385, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:59:05'),
(726402605, 11, 456655, 1386, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:59:05'),
(574403783, 11, 456655, 1390, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:59:05'),
(136990924, 11, 456655, 1391, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:59:05'),
(952447074, 11, 456655, 1392, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:59:05'),
(186202271, 11, 456655, 1393, 'virut và vi khuẩn lam.', 'nấm và vi khuẩn.', ' vi khuẩn và vi khuẩn lam.', 'tảo và vi khuẩn lam.', NULL, '2023-04-13 16:59:05'),
(1160260017, 11, 456655, 1396, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:59:05'),
(13520007, 11, 456655, 1397, 'Cấu trúc của plasmit.', 'Cấu trúc và thành phần hoá học của thành tế bào. ', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'Số lượng nhiễm sắc thể trong nhân hay vùng nhân.', 'Số lượng nhiễm sắc thể trong nhân hay vùng nhân.', '2023-04-13 16:59:23'),
(1065486994, 11, 456655, 1399, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:59:05'),
(225550537, 11, 456655, 1400, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:59:05'),
(348712706, 11, 547514, 1483, 'Dễ', '5', '2', '11', 'Dễ', '2023-04-02 17:55:04'),
(567055323, 11, 547514, 1484, 'Dễ', '5', '3', '12', '12', '2023-04-02 17:55:39'),
(1547819948, 11, 547514, 1485, 'Dễ', '5', '4', '13', '5', '2023-04-02 17:55:31'),
(866813878, 11, 547514, 1486, 'Dễ', '5', '5', '14', '5', '2023-04-02 17:55:15'),
(1436827188, 11, 547514, 1487, 'Dễ', '5', '6', '15', 'Dễ', '2023-04-02 17:55:24'),
(1023230139, 11, 547514, 1488, 'Dễ', '5', '7', '16', 'Dễ', '2023-04-02 17:55:21'),
(1217007504, 11, 547514, 1489, 'Dễ', '5', '8', '17', 'Dễ', '2023-04-02 17:55:59'),
(1490001176, 11, 547514, 1491, 'Dễ', '5', '10', '19', 'Dễ', '2023-04-02 17:55:28'),
(723766746, 11, 547514, 1492, 'Dễ', '5', '11', '20', 'Dễ', '2023-04-02 17:55:12'),
(997129555, 11, 547514, 1493, 'Dễ', '5', '12', '21', 'Dễ', '2023-04-02 17:55:19'),
(84266243, 11, 547514, 1494, 'Dễ', '5', '13', '22', 'Dễ', '2023-04-02 17:54:58'),
(354823309, 11, 547514, 1495, 'Dễ', '5', '14', '23', 'Dễ', '2023-04-02 17:55:05'),
(1425966932, 11, 547514, 1496, 'Dễ', '5', '15', '24', 'Dễ', '2023-04-02 17:55:26'),
(1086060751, 11, 547514, 1497, 'Dễ', '5', '16', '25', 'Dễ', '2023-04-02 17:55:22'),
(554674208, 11, 547514, 1498, 'Dễ', '5', '17', '26', '26', '2023-04-02 17:55:41'),
(857851667, 11, 547514, 1499, 'Dễ', '5', '18', '27', 'Dễ', '2023-04-02 17:55:18'),
(160848414, 11, 547514, 1500, 'Dễ', '5', '19', '28', '19', '2023-04-02 17:55:01'),
(1462201839, 11, 547514, 1501, 'Dễ', '5', '20', '29', 'Dễ', '2023-04-02 17:55:29'),
(729542621, 11, 547514, 1502, 'Dễ', '5', '21', '30', 'Dễ', '2023-04-02 17:55:13'),
(854866748, 11, 547514, 1504, 'Dễ', '5', '23', '32', '5', '2023-04-02 17:55:54'),
(793132132, 11, 547514, 1505, 'Dễ', '5', '24', '33', 'Dễ', '2023-04-02 17:55:13'),
(1106140364, 11, 547514, 1506, 'Dễ', '5', '25', '34', 'Dễ', '2023-04-02 17:55:23'),
(513813993, 11, 547514, 1507, 'Dễ', '5', '26', '35', 'Dễ', '2023-04-02 17:55:07'),
(1264506784, 11, 547514, 1508, 'Dễ', '5', '27', '36', 'Dễ', '2023-04-02 17:55:26'),
(588519732, 11, 547514, 1511, 'trung bình', '5', '30', '39', 'trung bình', '2023-04-02 17:55:09'),
(15232778, 11, 547514, 1513, 'trung bình', '5', '32', '41', '5', '2023-04-02 17:54:57'),
(123818338, 11, 547514, 1515, 'trung bình', '5', '34', '43', '34', '2023-04-02 17:55:44'),
(1651203796, 11, 547514, 1521, 'trung bình', '5', '40', '49', 'trung bình', '2023-04-02 17:55:30'),
(294652824, 11, 547514, 1522, 'trung bình', '5', '41', '50', 'trung bình', '2023-04-02 17:55:00'),
(508793668, 11, 547514, 1523, 'trung bình', '5', '42', '51', 'trung bình', '2023-04-02 17:55:07'),
(648733425, 11, 547514, 1532, 'trung bình', '5', '51', '60', 'trung bình', '2023-04-02 17:55:37'),
(473799008, 11, 547514, 1533, 'trung bình', '5', '52', '61', 'trung bình', '2023-04-02 17:55:05'),
(897462821, 11, 547514, 1541, 'khó', '5', '60', '69', 'khó', '2023-04-02 17:55:16'),
(982582149, 11, 547514, 1544, 'khó', '5', '63', '72', '63', '2023-04-02 17:55:20'),
(312344773, 11, 547514, 1545, 'khó', '5', '64', '73', 'khó', '2023-04-02 17:55:02'),
(941982099, 11, 547514, 1547, 'khó', '5', '66', '75', 'khó', '2023-04-02 17:56:04'),
(680992176, 11, 547514, 1550, 'khó', '5', '69', '78', '5', '2023-04-02 17:55:36'),
(643498284, 11, 547514, 1554, 'khó', '5', '73', '82', 'khó', '2023-04-02 17:55:09'),
(4428837, 11, 547514, 1560, 'khó', '5', '79', '88', 'khó', '2023-04-02 17:54:56'),
(902411924, 11, 547514, 1563, 'khó', '5', '82', '91', 'khó', '2023-04-02 17:56:01'),
(1292663770, 11, 700530, 1485, 'Dễ', '5', '4', '13', NULL, '2023-04-11 06:24:30'),
(1225702604, 11, 700530, 1486, 'Dễ', '5', '5', '14', NULL, '2023-04-11 06:24:30'),
(1569464294, 11, 700530, 1487, 'Dễ', '5', '6', '15', 'Dễ', '2023-04-11 06:24:58'),
(739792665, 11, 700530, 1488, 'Dễ', '5', '7', '16', '16', '2023-04-11 06:24:47'),
(1225734184, 11, 700530, 1489, 'Dễ', '5', '8', '17', NULL, '2023-04-11 06:24:30'),
(1293550410, 11, 700530, 1490, 'Dễ', '5', '9', '18', NULL, '2023-04-11 06:24:30'),
(1095972582, 11, 700530, 1491, 'Dễ', '5', '10', '19', NULL, '2023-04-11 06:24:30'),
(652818982, 11, 700530, 1492, 'Dễ', '5', '11', '20', NULL, '2023-04-11 06:24:30'),
(30139610, 11, 700530, 1493, 'Dễ', '5', '12', '21', 'Dễ', '2023-04-11 06:24:34'),
(562184726, 11, 700530, 1494, 'Dễ', '5', '13', '22', NULL, '2023-04-11 06:24:30'),
(813821727, 11, 700530, 1495, 'Dễ', '5', '14', '23', NULL, '2023-04-11 06:24:30'),
(929507557, 11, 700530, 1496, 'Dễ', '5', '15', '24', 'Dễ', '2023-04-11 06:24:53'),
(713977593, 11, 700530, 1497, 'Dễ', '5', '16', '25', '25', '2023-04-11 06:24:49'),
(1205937043, 11, 700530, 1498, 'Dễ', '5', '17', '26', NULL, '2023-04-11 06:24:30'),
(222716320, 11, 700530, 1499, 'Dễ', '5', '18', '27', 'Dễ', '2023-04-11 06:24:37'),
(1469893365, 11, 700530, 1500, 'Dễ', '5', '19', '28', 'Dễ', '2023-04-11 06:24:59'),
(591552009, 11, 700530, 1501, 'Dễ', '5', '20', '29', NULL, '2023-04-11 06:24:30'),
(1446234694, 11, 700530, 1502, 'Dễ', '5', '21', '30', NULL, '2023-04-11 06:24:30'),
(1381721264, 11, 700530, 1503, 'Dễ', '5', '22', '31', NULL, '2023-04-11 06:24:30'),
(1339959669, 11, 700530, 1504, 'Dễ', '5', '23', '32', NULL, '2023-04-11 06:24:30'),
(1168136960, 11, 700530, 1505, 'Dễ', '5', '24', '33', '33', '2023-04-11 06:24:51'),
(895654258, 11, 700530, 1506, 'Dễ', '5', '25', '34', 'Dễ', '2023-04-11 06:24:54'),
(780642855, 11, 700530, 1507, 'Dễ', '5', '26', '35', 'Dễ', '2023-04-11 06:24:56'),
(323079284, 11, 700530, 1508, 'Dễ', '5', '27', '36', NULL, '2023-04-11 06:24:30'),
(285411363, 11, 700530, 1514, 'trung bình', '5', '33', '42', NULL, '2023-04-11 06:24:30'),
(566428882, 11, 700530, 1522, 'trung bình', '5', '41', '50', 'trung bình', '2023-04-11 06:24:39'),
(774668941, 11, 700530, 1525, 'trung bình', '5', '44', '53', 'trung bình', '2023-04-11 06:24:56'),
(600841018, 11, 700530, 1528, 'trung bình', '5', '47', '56', NULL, '2023-04-11 06:24:30'),
(70535038, 11, 700530, 1529, 'trung bình', '5', '48', '57', 'trung bình', '2023-04-11 06:24:46'),
(1267598453, 11, 700530, 1530, 'trung bình', '5', '49', '58', NULL, '2023-04-11 06:24:30'),
(577951025, 11, 700530, 1534, 'trung bình', '5', '53', '62', NULL, '2023-04-11 06:24:30'),
(375463239, 11, 700530, 1535, 'trung bình', '5', '54', '63', NULL, '2023-04-11 06:24:30'),
(517426258, 11, 700530, 1536, 'khó', '5', '55', '64', NULL, '2023-04-11 06:24:30'),
(1211263394, 11, 700530, 1537, 'khó', '5', '56', '65', NULL, '2023-04-11 06:24:30'),
(329102587, 11, 700530, 1543, 'khó', '5', '62', '71', NULL, '2023-04-11 06:24:30'),
(746050971, 11, 700530, 1544, 'khó', '5', '63', '72', NULL, '2023-04-11 06:24:30'),
(210941255, 11, 700530, 1545, 'khó', '5', '64', '73', 'khó', '2023-04-11 06:24:37'),
(57279942, 11, 700530, 1549, 'khó', '5', '68', '77', 'khó', '2023-04-11 06:24:36'),
(294991635, 11, 700530, 1550, 'khó', '5', '69', '78', NULL, '2023-04-11 06:24:30'),
(1180166937, 11, 700530, 1559, 'khó', '5', '78', '87', '5', '2023-04-11 06:24:50'),
(339137369, 11, 727440, 1491, 'Dễ', '5', '10', '19', NULL, '2023-04-13 16:58:32'),
(1144957893, 11, 727440, 1494, 'Dễ', '5', '13', '22', NULL, '2023-04-13 16:58:32'),
(1493215829, 11, 727440, 1495, 'Dễ', '5', '14', '23', NULL, '2023-04-13 16:58:32'),
(375048752, 11, 727440, 1496, 'Dễ', '5', '15', '24', NULL, '2023-04-13 16:58:32'),
(1527855073, 11, 727440, 1499, 'Dễ', '5', '18', '27', NULL, '2023-04-13 16:58:32'),
(835363092, 11, 727440, 1501, 'Dễ', '5', '20', '29', NULL, '2023-04-13 16:58:32'),
(612240229, 11, 727440, 1502, 'Dễ', '5', '21', '30', NULL, '2023-04-13 16:58:32'),
(1222815475, 11, 727440, 1507, 'Dễ', '5', '26', '35', NULL, '2023-04-13 16:58:32'),
(1096588059, 11, 727440, 1509, 'trung bình', '5', '28', '37', NULL, '2023-04-13 16:58:32'),
(514815033, 11, 727440, 1510, 'trung bình', '5', '29', '38', NULL, '2023-04-13 16:58:32'),
(1482896931, 11, 727440, 1511, 'trung bình', '5', '30', '39', NULL, '2023-04-13 16:58:32'),
(1623434857, 11, 727440, 1512, 'trung bình', '5', '31', '40', NULL, '2023-04-13 16:58:32'),
(1200246090, 11, 727440, 1513, 'trung bình', '5', '32', '41', NULL, '2023-04-13 16:58:32'),
(1167689128, 11, 727440, 1514, 'trung bình', '5', '33', '42', NULL, '2023-04-13 16:58:32'),
(1078511174, 11, 727440, 1515, 'trung bình', '5', '34', '43', NULL, '2023-04-13 16:58:32'),
(1573184438, 11, 727440, 1517, 'trung bình', '5', '36', '45', NULL, '2023-04-13 16:58:32'),
(1504387299, 11, 727440, 1518, 'trung bình', '5', '37', '46', NULL, '2023-04-13 16:58:32'),
(119921619, 11, 727440, 1519, 'trung bình', '5', '38', '47', NULL, '2023-04-13 16:58:32'),
(738749655, 11, 727440, 1520, 'trung bình', '5', '39', '48', NULL, '2023-04-13 16:58:32'),
(1535082754, 11, 727440, 1521, 'trung bình', '5', '40', '49', NULL, '2023-04-13 16:58:32'),
(1556040043, 11, 727440, 1522, 'trung bình', '5', '41', '50', NULL, '2023-04-13 16:58:32'),
(1056126903, 11, 727440, 1523, 'trung bình', '5', '42', '51', NULL, '2023-04-13 16:58:32'),
(623029117, 11, 727440, 1524, 'trung bình', '5', '43', '52', NULL, '2023-04-13 16:58:32'),
(758376629, 11, 727440, 1525, 'trung bình', '5', '44', '53', NULL, '2023-04-13 16:58:32'),
(967256793, 11, 727440, 1526, 'trung bình', '5', '45', '54', NULL, '2023-04-13 16:58:32'),
(671929818, 11, 727440, 1527, 'trung bình', '5', '46', '55', NULL, '2023-04-13 16:58:32'),
(628581351, 11, 727440, 1528, 'trung bình', '5', '47', '56', NULL, '2023-04-13 16:58:32'),
(221513706, 11, 727440, 1529, 'trung bình', '5', '48', '57', NULL, '2023-04-13 16:58:32'),
(1286688458, 11, 727440, 1532, 'trung bình', '5', '51', '60', NULL, '2023-04-13 16:58:32'),
(1453217415, 11, 727440, 1533, 'trung bình', '5', '52', '61', NULL, '2023-04-13 16:58:32'),
(441691205, 11, 727440, 1534, 'trung bình', '5', '53', '62', NULL, '2023-04-13 16:58:32'),
(1504975934, 11, 727440, 1535, 'trung bình', '5', '54', '63', NULL, '2023-04-13 16:58:32'),
(62371735, 11, 727440, 1536, 'khó', '5', '55', '64', NULL, '2023-04-13 16:58:32'),
(1612956629, 11, 727440, 1538, 'khó', '5', '57', '66', NULL, '2023-04-13 16:58:32'),
(22353715, 11, 727440, 1541, 'khó', '5', '60', '69', NULL, '2023-04-13 16:58:32'),
(133218718, 11, 727440, 1545, 'khó', '5', '64', '73', NULL, '2023-04-13 16:58:32'),
(1338057616, 11, 727440, 1552, 'khó', '5', '71', '80', NULL, '2023-04-13 16:58:32'),
(54281320, 11, 727440, 1555, 'khó', '5', '74', '83', NULL, '2023-04-13 16:58:32'),
(606268643, 11, 727440, 1561, 'khó', '5', '80', '89', NULL, '2023-04-13 16:58:32'),
(1260494536, 11, 727440, 1562, 'khó', '5', '81', '90', NULL, '2023-04-13 16:58:32'),
(1241199863, 11, 788901, 1566, 'Dễ', '5', '3', '12', 'Dễ', '2023-04-02 18:09:04'),
(325788090, 11, 788901, 1585, 'Dễ', '5', '22', '31', 'Dễ', '2023-04-02 18:09:01'),
(1412368934, 11, 788901, 1611, 'trung bình', '5', '48', '57', 'trung bình', '2023-04-02 18:09:07'),
(1492661826, 11, 788901, 1616, 'trung bình', '5', '53', '62', 'trung bình', '2023-04-02 18:09:08'),
(874716940, 11, 788901, 1622, 'khó', '5', '59', '68', 'khó', '2023-04-02 18:08:58'),
(1200008742, 11, 788901, 1625, 'khó', '5', '62', '71', 'khó', '2023-04-02 18:09:05'),
(1376808333, 11, 788901, 1630, 'khó', '5', '67', '76', 'khó', '2023-04-02 18:09:11'),
(749241833, 11, 788901, 1631, 'khó', '5', '68', '77', 'khó', '2023-04-02 18:08:57'),
(902601309, 11, 788901, 1633, 'khó', '5', '70', '79', 'khó', '2023-04-02 18:08:59'),
(543403549, 11, 788901, 1643, 'khó', '5', '80', '89', 'khó', '2023-04-02 18:09:02'),
(1024405440, 11, 815048, 1811, 'Dễ', '5', '2', '11', '2', '2023-04-03 14:55:40'),
(356339961, 11, 815048, 1813, 'Dễ', '5', '4', '13', 'Dễ', '2023-04-03 14:55:09'),
(1551778408, 11, 815048, 1816, 'Dễ', '5', '7', '16', 'Dễ', '2023-04-03 14:55:52'),
(797642324, 11, 815048, 1818, 'Dễ', '5', '9', '18', 'Dễ', '2023-04-03 14:55:23'),
(509181595, 11, 815048, 1820, 'Dễ', '5', '11', '20', 'Dễ', '2023-04-03 14:55:11'),
(907910705, 11, 815048, 1827, 'Dễ', '5', '18', '27', 'Dễ', '2023-04-03 14:55:26'),
(889266613, 11, 815048, 1829, 'Dễ', '5', '20', '29', '5', '2023-04-03 14:55:27'),
(275816866, 11, 815048, 1833, 'Dễ', '5', '24', '33', 'Dễ', '2023-04-03 14:55:06'),
(472405102, 11, 815048, 1837, 'trung bình', '5', '28', '37', '5', '2023-04-03 14:55:55'),
(1186319464, 11, 815048, 1838, 'trung bình', '5', '29', '38', 'trung bình', '2023-04-03 14:55:43'),
(1338529325, 11, 815048, 1839, 'trung bình', '5', '30', '39', '30', '2023-04-03 14:55:45'),
(802912325, 11, 815048, 1840, 'trung bình', '5', '31', '40', 'trung bình', '2023-04-03 14:55:21'),
(1213037651, 11, 815048, 1841, 'trung bình', '5', '32', '41', 'trung bình', '2023-04-03 14:55:42'),
(706226341, 11, 815048, 1842, 'trung bình', '5', '33', '42', 'trung bình', '2023-04-03 14:55:16'),
(1433914934, 11, 815048, 1843, 'trung bình', '5', '34', '43', '5', '2023-04-03 14:55:44'),
(1518636220, 11, 815048, 1845, 'trung bình', '5', '36', '45', '36', '2023-04-03 14:55:47'),
(1225974677, 11, 815048, 1847, 'trung bình', '5', '38', '47', NULL, '2023-04-03 14:54:59'),
(1054977703, 11, 815048, 1848, 'trung bình', '5', '39', '48', '5', '2023-04-03 14:55:39'),
(442766713, 11, 815048, 1849, 'trung bình', '5', '40', '49', 'trung bình', '2023-04-03 14:55:57'),
(153821718, 11, 815048, 1850, 'trung bình', '5', '41', '50', 'trung bình', '2023-04-03 14:55:04'),
(939903319, 11, 815048, 1852, 'trung bình', '5', '43', '52', 'trung bình', '2023-04-03 14:55:36'),
(711290926, 11, 815048, 1853, 'trung bình', '5', '44', '53', 'trung bình', '2023-04-03 14:55:16'),
(1580110748, 11, 815048, 1854, 'trung bình', '5', '45', '54', 'trung bình', '2023-04-03 14:55:51'),
(933628164, 11, 815048, 1855, 'trung bình', '5', '46', '55', 'trung bình', '2023-04-03 14:55:37'),
(1482367206, 11, 815048, 1856, 'trung bình', '5', '47', '56', '47', '2023-04-03 14:56:10'),
(885308258, 11, 815048, 1857, 'trung bình', '5', '48', '57', '5', '2023-04-03 14:55:24'),
(1221735200, 11, 815048, 1858, 'trung bình', '5', '49', '58', NULL, '2023-04-03 14:54:59'),
(323231587, 11, 815048, 1859, 'trung bình', '5', '50', '59', 'trung bình', '2023-04-03 14:55:08'),
(560087343, 11, 815048, 1860, 'trung bình', '5', '51', '60', 'trung bình', '2023-04-03 14:55:12'),
(450322072, 11, 815048, 1861, 'trung bình', '5', '52', '61', '5', '2023-04-03 14:55:54'),
(594452667, 11, 815048, 1862, 'trung bình', '5', '53', '62', 'trung bình', '2023-04-03 14:55:13'),
(73174519, 11, 815048, 1863, 'trung bình', '5', '54', '63', '5', '2023-04-03 14:55:03'),
(664439311, 11, 815048, 1868, 'khó', '5', '59', '68', 'khó', '2023-04-03 14:55:14'),
(270187152, 11, 815048, 1878, 'khó', '5', '69', '78', 'khó', '2023-04-03 14:55:06'),
(395143824, 11, 815048, 1881, 'khó', '5', '72', '81', 'khó', '2023-04-03 14:56:00'),
(12668159, 11, 815048, 1882, 'khó', '5', '73', '82', '73', '2023-04-03 14:55:02'),
(1522624623, 11, 815048, 1883, 'khó', '5', '74', '83', 'khó', '2023-04-03 14:55:50'),
(543739488, 11, 815048, 1884, 'khó', '5', '75', '84', 'khó', '2023-04-03 14:55:10'),
(740704427, 11, 815048, 1890, 'khó', '5', '81', '90', 'khó', '2023-04-03 14:55:20'),
(716468839, 11, 815048, 1891, 'khó', '5', '82', '91', 'khó', '2023-04-03 14:55:20'),
(396797223, 11, 927619, 1323, 'Dễ', '5', '6', '15', 'Dễ', '2023-04-02 15:57:13'),
(970771177, 11, 927619, 1324, 'Dễ', '5', '7', '16', 'Dễ', '2023-04-02 15:57:29'),
(785400622, 11, 927619, 1329, 'Dễ', '5', '12', '21', 'Dễ', '2023-04-02 15:57:06'),
(1122426512, 11, 927619, 1330, 'Dễ', '5', '13', '22', 'Dễ', '2023-04-02 15:57:34'),
(1365170135, 11, 927619, 1331, 'Dễ', '5', '14', '23', 'Dễ', '2023-04-02 15:57:42'),
(823145080, 11, 927619, 1332, 'Dễ', '5', '15', '24', 'Dễ', '2023-04-02 15:57:18'),
(728287797, 11, 927619, 1335, 'Dễ', '5', '18', '27', 'Dễ', '2023-04-02 15:56:58'),
(971932744, 11, 927619, 1343, 'Dễ', '5', '26', '35', 'Dễ', '2023-04-02 15:57:30'),
(837916935, 11, 927619, 1345, 'trung bình', '5', '28', '37', 'trung bình', '2023-04-02 15:57:26'),
(1121446264, 11, 927619, 1346, 'trung bình', '5', '29', '38', 'trung bình', '2023-04-02 15:57:33'),
(82737172, 11, 927619, 1350, 'trung bình', '5', '33', '42', 'trung bình', '2023-04-02 15:56:38'),
(795797403, 11, 927619, 1354, 'trung bình', '5', '37', '46', 'trung bình', '2023-04-02 15:57:05'),
(769599677, 11, 927619, 1356, 'trung bình', '5', '39', '48', 'trung bình', '2023-04-02 15:57:01'),
(1011373814, 11, 927619, 1359, 'trung bình', '5', '42', '51', 'trung bình', '2023-04-02 15:57:31'),
(1652298242, 11, 927619, 1369, 'trung bình', '5', '52', '61', 'trung bình', '2023-04-02 15:57:49'),
(1533026264, 11, 927619, 1370, 'trung bình', '5', '53', '62', 'trung bình', '2023-04-02 15:57:45'),
(830186265, 11, 927619, 1372, 'khó', '5', '55', '64', '64', '2023-04-02 15:57:16'),
(780420044, 11, 927619, 1373, 'khó', '5', '56', '65', 'khó', '2023-04-02 15:57:02'),
(1626737317, 11, 927619, 1374, 'khó', '5', '57', '66', 'khó', '2023-04-02 15:57:50'),
(839072833, 11, 927619, 1375, 'khó', '5', '58', '67', 'khó', '2023-04-02 15:57:23'),
(158320684, 11, 927619, 1377, 'khó', '5', '60', '69', 'khó', '2023-04-02 15:56:43'),
(351312372, 11, 927619, 1378, 'khó', '5', '61', '70', '61', '2023-04-02 15:56:46'),
(1380328472, 11, 927619, 1380, 'khó', '5', '63', '72', 'khó', '2023-04-02 15:57:46'),
(448307931, 11, 927619, 1381, 'khó', '5', '64', '73', 'khó', '2023-04-02 15:56:53'),
(1146930785, 11, 927619, 1382, 'khó', '5', '65', '74', 'khó', '2023-04-02 15:57:36'),
(1671736541, 11, 927619, 1383, 'khó', '5', '66', '75', 'khó', '2023-04-02 15:57:52'),
(1178698096, 11, 927619, 1384, 'khó', '5', '67', '76', 'khó', '2023-04-02 15:57:40'),
(528764866, 11, 927619, 1385, 'khó', '5', '68', '77', 'khó', '2023-04-02 15:57:11'),
(216009330, 11, 927619, 1386, 'khó', '5', '69', '78', 'khó', '2023-04-02 15:56:42'),
(342583124, 11, 927619, 1387, 'khó', '5', '70', '79', 'khó', '2023-04-02 15:56:44'),
(584820499, 11, 927619, 1390, 'khó', '5', '73', '82', 'khó', '2023-04-02 15:56:57'),
(1557435107, 11, 927619, 1391, 'khó', '5', '74', '83', 'khó', '2023-04-02 15:57:47'),
(619890199, 11, 927619, 1392, 'khó', '5', '75', '84', 'khó', '2023-04-02 15:56:57'),
(34842358, 11, 927619, 1393, 'khó', '5', '76', '85', 'khó', '2023-04-02 15:56:37'),
(410623048, 11, 927619, 1394, 'khó', '5', '77', '86', '5', '2023-04-02 15:56:54'),
(567219357, 11, 927619, 1395, 'khó', '5', '78', '87', 'khó', '2023-04-02 15:57:09'),
(815137474, 11, 927619, 1396, 'khó', '5', '79', '88', 'khó', '2023-04-02 15:57:20'),
(909421921, 11, 927619, 1397, 'khó', '5', '80', '89', 'khó', '2023-04-02 15:57:22'),
(1172783901, 11, 927619, 1398, 'khó', '5', '81', '90', 'khó', '2023-04-02 15:57:38'),
(1661169001, 11, 927619, 1399, 'khó', '5', '82', '91', 'khó', '2023-04-02 15:57:49'),
(925285309, 11, 945075, 1647, 'Dễ', '5', '2', '11', 'Dễ', '2023-04-02 18:09:47'),
(1606213816, 11, 945075, 1650, 'Dễ', '5', '5', '14', 'Dễ', '2023-04-02 18:10:00'),
(955382852, 11, 945075, 1653, 'Dễ', '5', '8', '17', NULL, '2023-04-02 18:09:32'),
(1384945592, 11, 945075, 1654, 'Dễ', '5', '9', '18', 'Dễ', '2023-04-02 18:09:55'),
(807036940, 11, 945075, 1659, 'Dễ', '5', '14', '23', NULL, '2023-04-02 18:09:32'),
(463103530, 11, 945075, 1662, 'Dễ', '5', '17', '26', NULL, '2023-04-02 18:09:32'),
(1344286570, 11, 945075, 1666, 'Dễ', '5', '21', '30', 'Dễ', '2023-04-02 18:09:53'),
(1099456382, 11, 945075, 1668, 'Dễ', '5', '23', '32', 'Dễ', '2023-04-02 18:09:50'),
(1391345653, 11, 945075, 1674, 'trung bình', '5', '29', '38', NULL, '2023-04-02 18:09:32'),
(291040301, 11, 945075, 1680, 'trung bình', '5', '35', '44', NULL, '2023-04-02 18:09:32'),
(377415765, 11, 945075, 1681, 'trung bình', '5', '36', '45', 'trung bình', '2023-04-02 18:09:42'),
(1279469491, 11, 945075, 1684, 'trung bình', '5', '39', '48', NULL, '2023-04-02 18:09:32'),
(723446965, 11, 945075, 1688, 'trung bình', '5', '43', '52', NULL, '2023-04-02 18:09:32'),
(1172696994, 11, 945075, 1691, 'trung bình', '5', '46', '55', NULL, '2023-04-02 18:09:32'),
(1638104124, 11, 945075, 1697, 'trung bình', '5', '52', '61', 'trung bình', '2023-04-02 18:09:59'),
(1632176102, 11, 945075, 1699, 'trung bình', '5', '54', '63', 'trung bình', '2023-04-02 18:09:59'),
(1428638315, 11, 945075, 1701, 'khó', '5', '56', '65', 'khó', '2023-04-02 18:09:57'),
(115001772, 11, 945075, 1702, 'khó', '5', '57', '66', 'khó', '2023-04-02 18:09:38'),
(1336564235, 11, 945075, 1703, 'khó', '5', '58', '67', 'khó', '2023-04-02 18:09:53'),
(12782081, 11, 945075, 1704, 'khó', '5', '59', '68', NULL, '2023-04-02 18:09:32'),
(1469265742, 11, 945075, 1705, 'khó', '5', '60', '69', 'khó', '2023-04-02 18:10:06'),
(1111778223, 11, 945075, 1707, 'khó', '5', '62', '71', NULL, '2023-04-02 18:09:32'),
(258964881, 11, 945075, 1710, 'khó', '5', '65', '74', NULL, '2023-04-02 18:09:32'),
(160267445, 11, 945075, 1711, 'khó', '5', '66', '75', 'khó', '2023-04-02 18:09:40'),
(695379988, 11, 945075, 1712, 'khó', '5', '67', '76', 'khó', '2023-04-02 18:09:44'),
(858826632, 11, 945075, 1713, 'khó', '5', '68', '77', 'khó', '2023-04-02 18:09:48'),
(1386920057, 11, 945075, 1714, 'khó', '5', '69', '78', NULL, '2023-04-02 18:09:32'),
(1385022171, 11, 945075, 1715, 'khó', '5', '70', '79', 'khó', '2023-04-02 18:09:55'),
(14333123, 11, 945075, 1716, 'khó', '5', '71', '80', '80', '2023-04-02 18:09:36'),
(485206666, 11, 945075, 1717, 'khó', '5', '72', '81', NULL, '2023-04-02 18:09:32'),
(123197219, 11, 945075, 1719, 'khó', '5', '74', '83', 'khó', '2023-04-02 18:09:39'),
(1022459410, 11, 945075, 1720, 'khó', '5', '75', '84', NULL, '2023-04-02 18:09:32'),
(399428261, 11, 945075, 1721, 'khó', '5', '76', '85', 'khó', '2023-04-02 18:09:43'),
(1454601670, 11, 945075, 1722, 'khó', '5', '77', '86', NULL, '2023-04-02 18:09:32'),
(548160956, 11, 945075, 1723, 'khó', '5', '78', '87', NULL, '2023-04-02 18:09:32'),
(17341574, 11, 945075, 1724, 'khó', '5', '79', '88', '5', '2023-04-02 18:09:37'),
(184539208, 11, 945075, 1725, 'khó', '5', '80', '89', 'khó', '2023-04-02 18:09:40'),
(1433980353, 11, 945075, 1726, 'khó', '5', '81', '90', 'khó', '2023-04-02 18:09:56'),
(555451106, 11, 945075, 1727, 'khó', '5', '82', '91', 'khó', '2023-04-02 18:09:44'),
(1064992401, 11, 945075, 1728, 'khó', '5', '83', '92', 'khó', '2023-04-02 18:09:51'),
(365090300, 11, 981590, 1321, 'A. giới - ngành - lớp - bộ - họ - chi - loài.\n', 'B. loài - bộ - họ - chi - lớp - ngành - giới.\n', 'C. loài - chi- họ -  bộ -  lớp - ngành - giới.\n', 'D. loài -  chi - bộ - họ - lớp - ngành - giới.\n', 'A. giới - ngành - lớp - bộ - họ - chi - loài.', '2023-04-13 16:39:40'),
(930444386, 11, 981590, 1324, 'Hoá năng', ' Nhiệt năng', 'Điện năng\n', 'Động năng ', 'Hoá năng', '2023-04-13 16:39:47'),
(356810248, 11, 981590, 1327, 'ARN và gluxit', 'G liên kết với X bằng 2 liên kết hiđrô.', 'Prôtêin và lipit', 'Các liên kết hidrô theo nguyên tắc bổ sung.', NULL, '2023-04-13 16:39:19'),
(1637111777, 11, 981590, 1331, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:39:19'),
(168843563, 11, 981590, 1334, 'vi sinh vật, động vật nguyên sinh.', 'vi sinh vật, tảo, nấm, động vật nguyên sinh .', ' tảo, nấm, động vật nguyên sinh.', 'tảo, nấm nhày, động vật nguyên sinh.', NULL, '2023-04-13 16:39:19'),
(831142839, 11, 981590, 1335, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:39:19'),
(6083225, 11, 981590, 1339, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ARN và gluxit', '2023-04-13 16:39:35'),
(358828205, 11, 981590, 1342, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', 'ARN và gluxit', '2023-04-13 16:39:40'),
(1184621964, 11, 981590, 1343, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:39:19'),
(1092844352, 11, 981590, 1344, 'ARN và gluxit', 'ADN và prôtêin', 'Prôtêin và lipit', 'ADN và ARN ', NULL, '2023-04-13 16:39:19'),
(239432998, 11, 981590, 1346, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:39:19'),
(53219619, 11, 981590, 1351, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', '2023-04-13 16:39:37'),
(1660636807, 11, 981590, 1353, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:39:19'),
(1454963026, 11, 981590, 1354, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:39:19'),
(635319106, 11, 981590, 1357, 'Liên kết hidrô', ' Liên kết este', 'Liên kết peptit', 'Hai lớp photphorit và không có prôtêin', 'Liên kết hidrô', '2023-04-13 16:39:43'),
(692667424, 11, 981590, 1359, 'Màng sinh chất ', 'Vùng nhân', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Màng sinh chất', '2023-04-13 16:39:45'),
(1055922325, 11, 981590, 1361, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:39:19'),
(188309703, 11, 981590, 1362, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:39:19'),
(1641349378, 11, 981590, 1363, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:39:19'),
(753401841, 11, 981590, 1364, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Một lớp photphorit và các phân tử prôtêin', '2023-04-13 16:39:44'),
(912967721, 11, 981590, 1365, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Một lớp photphorit và các phân tử prôtêin', '2023-04-13 16:39:47'),
(1442769813, 11, 981590, 1366, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:39:19'),
(278912918, 11, 981590, 1367, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:39:19'),
(1504662381, 11, 981590, 1370, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', NULL, '2023-04-13 16:39:19'),
(511771113, 11, 981590, 1371, 'Một lớp photphorit và các phân tử prôtêin', 'Hai lớp photphorit và các phân tử prôtêin', 'Một lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', 'Hai lớp photphorit và không có prôtêin', '2023-04-13 16:39:42'),
(1311993612, 11, 981590, 1374, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:39:19'),
(68410903, 11, 981590, 1375, 'có khả năng thích nghi với môi trường.', 'thường xuyên trao đổi chất với môi trường.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'có khả năng sinh sản để duy trì nòi giống.', 'có khả năng thích nghi với môi trường.', '2023-04-13 16:39:38'),
(1181476514, 11, 981590, 1376, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'thường xuyên trao đổi chất với môi trường.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'có khả năng sinh sản để duy trì nòi giống.', NULL, '2023-04-13 16:39:19'),
(1603417647, 11, 981590, 1377, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:39:19'),
(935000089, 11, 981590, 1379, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'cơ thể đối xứng 2 bên và có bộ xương ngoài. ', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'có bộ xương trong và cột sống.', 'nước được cấu tạo từ các nguyên tố đa lượng.', '2023-04-13 16:39:48'),
(1119000949, 11, 981590, 1383, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:39:19'),
(1354871998, 11, 981590, 1384, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:39:19'),
(966211834, 11, 981590, 1385, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:39:19'),
(868198666, 11, 981590, 1386, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:39:19'),
(1328483465, 11, 981590, 1388, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:39:19'),
(979845118, 11, 981590, 1390, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:39:19'),
(1475101165, 11, 981590, 1392, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:39:19'),
(195031046, 11, 981590, 1395, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:39:19'),
(947057092, 11, 981590, 1399, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:39:19');
INSERT INTO `student_test_detail` (`ID`, `student_id`, `test_code`, `question_id`, `answer_a`, `answer_b`, `answer_c`, `answer_d`, `student_answer`, `timest`) VALUES
(396841852, 11, 981590, 1400, 'nước được cấu tạo từ các nguyên tố đa lượng.', 'nước chiếm thành phần chủ yếu trong mọi tế bào và cơ thể sống, giúp tế bào tiến hành chuyển hoá vật chất và duy trì sự sống.', 'nước là dung môi hoà tan nhiều chất cần thiết cho các hoạt động sống của tế bào', 'nước là môi trường của các phản ứng sinh hoá trong tế bào.', NULL, '2023-04-13 16:39:19'),
(1269288237, 12, 424315, 1566, 'Dễ', '5', '3', '12', 'Dễ', '2023-04-02 18:12:26'),
(299117913, 12, 424315, 1567, 'Dễ', '5', '4', '13', NULL, '2023-04-02 18:12:07'),
(791194064, 12, 424315, 1573, 'Dễ', '5', '10', '19', 'Dễ', '2023-04-02 18:12:23'),
(336787886, 12, 424315, 1574, 'Dễ', '5', '11', '20', 'Dễ', '2023-04-02 18:12:16'),
(1308004697, 12, 424315, 1575, 'Dễ', '5', '12', '21', NULL, '2023-04-02 18:12:07'),
(58200689, 12, 424315, 1582, 'Dễ', '5', '19', '28', NULL, '2023-04-02 18:12:07'),
(6996634, 12, 424315, 1583, 'Dễ', '5', '20', '29', 'Dễ', '2023-04-02 18:12:10'),
(1663967050, 12, 424315, 1587, 'Dễ', '5', '24', '33', NULL, '2023-04-02 18:12:07'),
(684640551, 12, 424315, 1592, 'trung bình', '5', '29', '38', 'trung bình', '2023-04-02 18:12:18'),
(259291871, 12, 424315, 1593, 'trung bình', '5', '30', '39', NULL, '2023-04-02 18:12:07'),
(1415998006, 12, 424315, 1594, 'trung bình', '5', '31', '40', NULL, '2023-04-02 18:12:07'),
(1157365377, 12, 424315, 1596, 'trung bình', '5', '33', '42', NULL, '2023-04-02 18:12:07'),
(778830141, 12, 424315, 1600, 'trung bình', '5', '37', '46', 'trung bình', '2023-04-02 18:12:21'),
(310855347, 12, 424315, 1601, 'trung bình', '5', '38', '47', NULL, '2023-04-02 18:12:07'),
(943139646, 12, 424315, 1608, 'trung bình', '5', '45', '54', 'trung bình', '2023-04-02 18:12:24'),
(393517506, 12, 424315, 1617, 'trung bình', '5', '54', '63', NULL, '2023-04-02 18:12:07'),
(337255040, 12, 424315, 1619, 'khó', '5', '56', '65', 'khó', '2023-04-02 18:12:15'),
(56779745, 12, 424315, 1620, 'khó', '5', '57', '66', 'khó', '2023-04-02 18:12:11'),
(907838461, 12, 424315, 1621, 'khó', '5', '58', '67', NULL, '2023-04-02 18:12:07'),
(87468020, 12, 424315, 1622, 'khó', '5', '59', '68', NULL, '2023-04-02 18:12:07'),
(377113137, 12, 424315, 1623, 'khó', '5', '60', '69', NULL, '2023-04-02 18:12:07'),
(1435689070, 12, 424315, 1624, 'khó', '5', '61', '70', NULL, '2023-04-02 18:12:07'),
(538633835, 12, 424315, 1625, 'khó', '5', '62', '71', NULL, '2023-04-02 18:12:07'),
(1481328475, 12, 424315, 1627, 'khó', '5', '64', '73', NULL, '2023-04-02 18:12:07'),
(701997290, 12, 424315, 1628, 'khó', '5', '65', '74', 'khó', '2023-04-02 18:12:19'),
(1543269089, 12, 424315, 1629, 'khó', '5', '66', '75', NULL, '2023-04-02 18:12:07'),
(1318498794, 12, 424315, 1630, 'khó', '5', '67', '76', NULL, '2023-04-02 18:12:07'),
(161341691, 12, 424315, 1631, 'khó', '5', '68', '77', 'khó', '2023-04-02 18:12:12'),
(687506108, 12, 424315, 1632, 'khó', '5', '69', '78', 'khó', '2023-04-02 18:12:19'),
(276763507, 12, 424315, 1633, 'khó', '5', '70', '79', NULL, '2023-04-02 18:12:07'),
(523788681, 12, 424315, 1634, 'khó', '5', '71', '80', NULL, '2023-04-02 18:12:07'),
(1634757687, 12, 424315, 1636, 'khó', '5', '73', '82', NULL, '2023-04-02 18:12:07'),
(990498015, 12, 424315, 1637, 'khó', '5', '74', '83', 'khó', '2023-04-02 18:12:24'),
(18034718, 12, 424315, 1638, 'khó', '5', '75', '84', 'khó', '2023-04-02 18:12:11'),
(1333835558, 12, 424315, 1640, 'khó', '5', '77', '86', NULL, '2023-04-02 18:12:07'),
(111885952, 12, 424315, 1641, 'khó', '5', '78', '87', 'khó', '2023-04-02 18:12:13'),
(896995096, 12, 424315, 1642, 'khó', '5', '79', '88', NULL, '2023-04-02 18:12:07'),
(331988232, 12, 424315, 1643, 'khó', '5', '80', '89', 'khó', '2023-04-02 18:12:17'),
(1187948162, 12, 424315, 1645, 'khó', '5', '82', '91', NULL, '2023-04-02 18:12:07'),
(1219118192, 12, 424315, 1646, 'khó', '5', '83', '92', NULL, '2023-04-02 18:12:07'),
(1660058909, 12, 435636, 1401, 'Dễ', '5', '2', '11', '2', '2023-04-02 16:03:22'),
(926165799, 12, 435636, 1402, 'Dễ', '5', '3', '12', 'Dễ', '2023-04-02 16:02:45'),
(437601060, 12, 435636, 1403, 'Dễ', '5', '4', '13', 'Dễ', '2023-04-02 16:02:31'),
(102898546, 12, 435636, 1404, 'Dễ', '5', '5', '14', 'Dễ', '2023-04-02 16:02:10'),
(1101193174, 12, 435636, 1405, 'Dễ', '5', '6', '15', 'Dễ', '2023-04-02 16:02:49'),
(1269880642, 12, 435636, 1406, 'Dễ', '5', '7', '16', 'Dễ', '2023-04-02 16:02:53'),
(1559666668, 12, 435636, 1407, 'Dễ', '5', '8', '17', 'Dễ', '2023-04-02 16:03:03'),
(227901649, 12, 435636, 1408, 'Dễ', '5', '9', '18', 'Dễ', '2023-04-02 16:02:38'),
(1342595401, 12, 435636, 1409, 'Dễ', '5', '10', '19', 'Dễ', '2023-04-02 16:02:53'),
(1069261757, 12, 435636, 1410, 'Dễ', '5', '11', '20', 'Dễ', '2023-04-02 16:02:24'),
(1563641518, 12, 435636, 1411, 'Dễ', '5', '12', '21', 'Dễ', '2023-04-02 16:03:03'),
(351330707, 12, 435636, 1412, 'Dễ', '5', '13', '22', 'Dễ', '2023-04-02 16:02:15'),
(118565449, 12, 435636, 1414, 'Dễ', '5', '15', '24', 'Dễ', '2023-04-02 16:02:13'),
(254447751, 12, 435636, 1415, 'Dễ', '5', '16', '25', 'Dễ', '2023-04-02 16:02:28'),
(271521500, 12, 435636, 1416, 'Dễ', '5', '17', '26', 'Dễ', '2023-04-02 16:02:14'),
(1434377820, 12, 435636, 1417, 'Dễ', '5', '18', '27', 'Dễ', '2023-04-02 16:02:57'),
(96066397, 12, 435636, 1419, 'Dễ', '5', '20', '29', 'Dễ', '2023-04-02 16:02:08'),
(883300396, 12, 435636, 1420, 'Dễ', '5', '21', '30', '5', '2023-04-02 16:02:21'),
(623470122, 12, 435636, 1421, 'Dễ', '5', '22', '31', 'Dễ', '2023-04-02 16:02:17'),
(846452698, 12, 435636, 1422, 'Dễ', '5', '23', '32', 'Dễ', '2023-04-02 16:02:43'),
(862611430, 12, 435636, 1423, 'Dễ', '5', '24', '33', 'Dễ', '2023-04-02 16:02:20'),
(526359391, 12, 435636, 1424, 'Dễ', '5', '25', '34', 'Dễ', '2023-04-02 16:02:32'),
(717856043, 12, 435636, 1425, 'Dễ', '5', '26', '35', 'Dễ', '2023-04-02 16:02:19'),
(285129872, 12, 435636, 1426, 'Dễ', '5', '27', '36', 'Dễ', '2023-04-02 16:02:14'),
(535822522, 12, 435636, 1427, 'trung bình', '5', '28', '37', 'trung bình', '2023-04-02 16:02:35'),
(114737946, 12, 435636, 1429, 'trung bình', '5', '30', '39', 'trung bình', '2023-04-02 16:02:10'),
(1628294492, 12, 435636, 1435, 'trung bình', '5', '36', '45', '36', '2023-04-02 16:03:22'),
(1219794323, 12, 435636, 1438, 'trung bình', '5', '39', '48', 'trung bình', '2023-04-02 16:02:55'),
(247274940, 12, 435636, 1440, 'trung bình', '5', '41', '50', 'trung bình', '2023-04-02 16:02:28'),
(995970530, 12, 435636, 1442, 'trung bình', '5', '43', '52', 'trung bình', '2023-04-02 16:02:25'),
(202718165, 12, 435636, 1445, 'trung bình', '5', '46', '55', 'trung bình', '2023-04-02 16:02:39'),
(988356322, 12, 435636, 1451, 'trung bình', '5', '52', '61', '5', '2023-04-02 16:02:46'),
(389760652, 12, 435636, 1455, 'khó', '5', '56', '65', 'khó', '2023-04-02 16:02:32'),
(1395387697, 12, 435636, 1457, 'khó', '5', '58', '67', 'khó', '2023-04-02 16:02:58'),
(1671031927, 12, 435636, 1459, 'khó', '5', '60', '69', '60', '2023-04-02 16:03:21'),
(602488357, 12, 435636, 1463, 'khó', '5', '64', '73', 'khó', '2023-04-02 16:02:18'),
(910164120, 12, 435636, 1472, 'khó', '5', '73', '82', 'khó', '2023-04-02 16:02:22'),
(116701703, 12, 435636, 1475, 'khó', '5', '76', '85', 'khó', '2023-04-02 16:02:12'),
(1075419807, 12, 435636, 1477, 'khó', '5', '78', '87', 'khó', '2023-04-02 16:02:50'),
(1368064763, 12, 435636, 1478, 'khó', '5', '79', '88', 'khó', '2023-04-02 16:02:59'),
(564826213, 12, 945075, 1647, 'Dễ', '5', '2', '11', NULL, '2023-04-02 18:12:42'),
(1391852039, 12, 945075, 1650, 'Dễ', '5', '5', '14', NULL, '2023-04-02 18:12:42'),
(233121956, 12, 945075, 1653, 'Dễ', '5', '8', '17', 'Dễ', '2023-04-02 18:12:48'),
(1025524189, 12, 945075, 1654, 'Dễ', '5', '9', '18', 'Dễ', '2023-04-02 18:12:54'),
(487832280, 12, 945075, 1659, 'Dễ', '5', '14', '23', NULL, '2023-04-02 18:12:42'),
(1380136850, 12, 945075, 1662, 'Dễ', '5', '17', '26', 'Dễ', '2023-04-02 18:13:17'),
(1399709405, 12, 945075, 1666, 'Dễ', '5', '21', '30', NULL, '2023-04-02 18:12:42'),
(1093786406, 12, 945075, 1668, 'Dễ', '5', '23', '32', 'Dễ', '2023-04-02 18:13:03'),
(281134850, 12, 945075, 1674, 'trung bình', '5', '29', '38', 'trung bình', '2023-04-02 18:12:45'),
(290225164, 12, 945075, 1680, 'trung bình', '5', '35', '44', 'trung bình', '2023-04-02 18:12:45'),
(226828193, 12, 945075, 1681, 'trung bình', '5', '36', '45', 'trung bình', '2023-04-02 18:12:47'),
(876933780, 12, 945075, 1684, 'trung bình', '5', '39', '48', 'trung bình', '2023-04-02 18:13:07'),
(1332168736, 12, 945075, 1688, 'trung bình', '5', '43', '52', 'trung bình', '2023-04-02 18:13:01'),
(568184593, 12, 945075, 1691, 'trung bình', '5', '46', '55', NULL, '2023-04-02 18:12:42'),
(789832469, 12, 945075, 1697, 'trung bình', '5', '52', '61', NULL, '2023-04-02 18:12:42'),
(1295739597, 12, 945075, 1699, 'trung bình', '5', '54', '63', 'trung bình', '2023-04-02 18:13:01'),
(1025643165, 12, 945075, 1701, 'khó', '5', '56', '65', NULL, '2023-04-02 18:12:42'),
(847981939, 12, 945075, 1702, 'khó', '5', '57', '66', NULL, '2023-04-02 18:12:42'),
(668746206, 12, 945075, 1703, 'khó', '5', '58', '67', 'khó', '2023-04-02 18:12:51'),
(616274068, 12, 945075, 1704, 'khó', '5', '59', '68', NULL, '2023-04-02 18:12:42'),
(682785089, 12, 945075, 1705, 'khó', '5', '60', '69', 'khó', '2023-04-02 18:12:53'),
(1474924281, 12, 945075, 1707, 'khó', '5', '62', '71', NULL, '2023-04-02 18:12:42'),
(675256868, 12, 945075, 1710, 'khó', '5', '65', '74', 'khó', '2023-04-02 18:13:09'),
(1067033614, 12, 945075, 1711, 'khó', '5', '66', '75', NULL, '2023-04-02 18:12:42'),
(536793496, 12, 945075, 1712, 'khó', '5', '67', '76', NULL, '2023-04-02 18:12:42'),
(551079028, 12, 945075, 1713, 'khó', '5', '68', '77', 'khó', '2023-04-02 18:13:11'),
(534489151, 12, 945075, 1714, 'khó', '5', '69', '78', NULL, '2023-04-02 18:12:42'),
(1403327520, 12, 945075, 1715, 'khó', '5', '70', '79', NULL, '2023-04-02 18:12:42'),
(651072008, 12, 945075, 1716, 'khó', '5', '71', '80', 'khó', '2023-04-02 18:12:51'),
(1131151289, 12, 945075, 1717, 'khó', '5', '72', '81', NULL, '2023-04-02 18:12:42'),
(466298782, 12, 945075, 1719, 'khó', '5', '74', '83', 'khó', '2023-04-02 18:13:12'),
(816988584, 12, 945075, 1720, 'khó', '5', '75', '84', NULL, '2023-04-02 18:12:42'),
(1531398098, 12, 945075, 1721, 'khó', '5', '76', '85', NULL, '2023-04-02 18:12:42'),
(455458184, 12, 945075, 1722, 'khó', '5', '77', '86', NULL, '2023-04-02 18:12:42'),
(1375814696, 12, 945075, 1723, 'khó', '5', '78', '87', 'khó', '2023-04-02 18:13:17'),
(562145532, 12, 945075, 1724, 'khó', '5', '79', '88', NULL, '2023-04-02 18:12:42'),
(1544981187, 12, 945075, 1725, 'khó', '5', '80', '89', 'khó', '2023-04-02 18:12:59'),
(782271172, 12, 945075, 1726, 'khó', '5', '81', '90', 'khó', '2023-04-02 18:13:08'),
(1671900496, 12, 945075, 1727, 'khó', '5', '82', '91', 'khó', '2023-04-02 18:12:58'),
(967801841, 12, 945075, 1728, 'khó', '5', '83', '92', 'khó', '2023-04-02 18:12:55'),
(570873815, 14, 435636, 1401, 'Dễ', '5', '2', '11', NULL, '2023-04-02 17:58:27'),
(363808988, 14, 435636, 1402, 'Dễ', '5', '3', '12', 'Dễ', '2023-04-02 17:58:35'),
(1617080378, 14, 435636, 1403, 'Dễ', '5', '4', '13', 'Dễ', '2023-04-02 17:58:48'),
(199506908, 14, 435636, 1404, 'Dễ', '5', '5', '14', 'Dễ', '2023-04-02 17:58:33'),
(236888415, 14, 435636, 1405, 'Dễ', '5', '6', '15', NULL, '2023-04-02 17:58:27'),
(646517599, 14, 435636, 1406, 'Dễ', '5', '7', '16', 'Dễ', '2023-04-02 17:58:39'),
(1007198815, 14, 435636, 1407, 'Dễ', '5', '8', '17', NULL, '2023-04-02 17:58:27'),
(1004426024, 14, 435636, 1408, 'Dễ', '5', '9', '18', 'Dễ', '2023-04-02 17:58:43'),
(426677902, 14, 435636, 1409, 'Dễ', '5', '10', '19', 'Dễ', '2023-04-02 17:58:34'),
(925475236, 14, 435636, 1410, 'Dễ', '5', '11', '20', NULL, '2023-04-02 17:58:27'),
(1110968688, 14, 435636, 1411, 'Dễ', '5', '12', '21', 'Dễ', '2023-04-02 17:59:00'),
(1339467277, 14, 435636, 1412, 'Dễ', '5', '13', '22', 'Dễ', '2023-04-02 17:58:46'),
(1308921825, 14, 435636, 1414, 'Dễ', '5', '15', '24', 'Dễ', '2023-04-02 17:59:03'),
(1584883155, 14, 435636, 1415, 'Dễ', '5', '16', '25', NULL, '2023-04-02 17:58:27'),
(510726070, 14, 435636, 1416, 'Dễ', '5', '17', '26', NULL, '2023-04-02 17:58:27'),
(782039133, 14, 435636, 1417, 'Dễ', '5', '18', '27', 'Dễ', '2023-04-02 17:58:40'),
(1162321059, 14, 435636, 1419, 'Dễ', '5', '20', '29', 'Dễ', '2023-04-02 17:58:45'),
(1552707167, 14, 435636, 1420, 'Dễ', '5', '21', '30', NULL, '2023-04-02 17:58:27'),
(1629472662, 14, 435636, 1421, 'Dễ', '5', '22', '31', 'Dễ', '2023-04-02 17:58:52'),
(518859903, 14, 435636, 1422, 'Dễ', '5', '23', '32', 'Dễ', '2023-04-02 17:58:37'),
(1014913502, 14, 435636, 1423, 'Dễ', '5', '24', '33', '33', '2023-04-02 17:58:59'),
(852720660, 14, 435636, 1424, 'Dễ', '5', '25', '34', 'Dễ', '2023-04-02 17:58:42'),
(280814632, 14, 435636, 1425, 'Dễ', '5', '26', '35', NULL, '2023-04-02 17:58:27'),
(1648304076, 14, 435636, 1426, 'Dễ', '5', '27', '36', 'Dễ', '2023-04-02 17:58:52'),
(767665130, 14, 435636, 1427, 'trung bình', '5', '28', '37', NULL, '2023-04-02 17:58:27'),
(1616031244, 14, 435636, 1429, 'trung bình', '5', '30', '39', 'trung bình', '2023-04-02 17:58:49'),
(541776798, 14, 435636, 1435, 'trung bình', '5', '36', '45', 'trung bình', '2023-04-02 17:58:37'),
(1252140411, 14, 435636, 1438, 'trung bình', '5', '39', '48', NULL, '2023-04-02 17:58:27'),
(45951961, 14, 435636, 1440, 'trung bình', '5', '41', '50', 'trung bình', '2023-04-02 17:58:32'),
(842481205, 14, 435636, 1442, 'trung bình', '5', '43', '52', NULL, '2023-04-02 17:58:27'),
(1558157631, 14, 435636, 1445, 'trung bình', '5', '46', '55', '46', '2023-04-02 17:58:56'),
(931843461, 14, 435636, 1451, 'trung bình', '5', '52', '61', NULL, '2023-04-02 17:58:27'),
(852256070, 14, 435636, 1455, 'khó', '5', '56', '65', 'khó', '2023-04-02 17:58:41'),
(22221880, 14, 435636, 1457, 'khó', '5', '58', '67', 'khó', '2023-04-02 17:58:31'),
(942169893, 14, 435636, 1459, 'khó', '5', '60', '69', NULL, '2023-04-02 17:58:27'),
(1388924593, 14, 435636, 1463, 'khó', '5', '64', '73', NULL, '2023-04-02 17:58:27'),
(542811230, 14, 435636, 1472, 'khó', '5', '73', '82', NULL, '2023-04-02 17:58:27'),
(1557953489, 14, 435636, 1475, 'khó', '5', '76', '85', '85', '2023-04-02 17:58:57'),
(1164008091, 14, 435636, 1477, 'khó', '5', '78', '87', NULL, '2023-04-02 17:58:27'),
(731989058, 14, 435636, 1478, 'khó', '5', '79', '88', 'khó', '2023-04-02 17:58:38'),
(1636596196, 14, 788901, 1566, 'Dễ', '5', '3', '12', 'Dễ', '2023-04-02 18:14:06'),
(149385285, 14, 788901, 1585, 'Dễ', '5', '22', '31', 'Dễ', '2023-04-02 18:14:08'),
(282852963, 14, 788901, 1611, 'trung bình', '5', '48', '57', '57', '2023-04-02 18:14:00'),
(1460499911, 14, 788901, 1616, 'trung bình', '5', '53', '62', 'trung bình', '2023-04-02 18:14:05'),
(577815272, 14, 788901, 1622, 'khó', '5', '59', '68', 'khó', '2023-04-02 18:14:04'),
(1431497449, 14, 788901, 1625, 'khó', '5', '62', '71', 'khó', '2023-04-02 18:14:17'),
(514272192, 14, 788901, 1630, 'khó', '5', '67', '76', 'khó', '2023-04-02 18:14:01'),
(1426821073, 14, 788901, 1631, 'khó', '5', '68', '77', 'khó', '2023-04-02 18:14:03'),
(94390485, 14, 788901, 1633, 'khó', '5', '70', '79', 'khó', '2023-04-02 18:14:09'),
(666668634, 14, 788901, 1643, 'khó', '5', '80', '89', 'khó', '2023-04-02 18:14:02'),
(1463351212, 14, 927619, 1323, 'Dễ', '5', '6', '15', '15', '2023-04-02 17:57:31'),
(596216387, 14, 927619, 1324, 'Dễ', '5', '7', '16', 'Dễ', '2023-04-02 17:57:08'),
(113610447, 14, 927619, 1329, 'Dễ', '5', '12', '21', 'Dễ', '2023-04-02 17:56:45'),
(1418298432, 14, 927619, 1330, 'Dễ', '5', '13', '22', '13', '2023-04-02 17:57:34'),
(1220144344, 14, 927619, 1331, 'Dễ', '5', '14', '23', '23', '2023-04-02 17:57:41'),
(1110980033, 14, 927619, 1332, 'Dễ', '5', '15', '24', 'Dễ', '2023-04-02 17:57:14'),
(1419860941, 14, 927619, 1335, 'Dễ', '5', '18', '27', 'Dễ', '2023-04-02 17:57:22'),
(1182986203, 14, 927619, 1343, 'Dễ', '5', '26', '35', 'Dễ', '2023-04-02 17:57:15'),
(764039886, 14, 927619, 1345, 'trung bình', '5', '28', '37', 'trung bình', '2023-04-02 17:57:03'),
(193198841, 14, 927619, 1346, 'trung bình', '5', '29', '38', 'trung bình', '2023-04-02 17:56:45'),
(1124356231, 14, 927619, 1350, 'trung bình', '5', '33', '42', '33', '2023-04-02 17:57:16'),
(1567826756, 14, 927619, 1354, 'trung bình', '5', '37', '46', '37', '2023-04-02 17:57:25'),
(688440776, 14, 927619, 1356, 'trung bình', '5', '39', '48', 'trung bình', '2023-04-02 17:57:05'),
(586527453, 14, 927619, 1359, 'trung bình', '5', '42', '51', '5', '2023-04-02 17:57:08'),
(1322731192, 14, 927619, 1369, 'trung bình', '5', '52', '61', '61', '2023-04-02 17:57:37'),
(1276465918, 14, 927619, 1370, 'trung bình', '5', '53', '62', '62', '2023-04-02 17:57:39'),
(423720405, 14, 927619, 1372, 'khó', '5', '55', '64', '55', '2023-04-02 17:56:57'),
(1086997725, 14, 927619, 1373, 'khó', '5', '56', '65', '5', '2023-04-02 17:57:13'),
(282456152, 14, 927619, 1374, 'khó', '5', '57', '66', 'khó', '2023-04-02 17:56:49'),
(14897072, 14, 927619, 1375, 'khó', '5', '58', '67', 'khó', '2023-04-02 17:56:44'),
(1422158395, 14, 927619, 1377, 'khó', '5', '60', '69', 'khó', '2023-04-02 17:57:33'),
(205738114, 14, 927619, 1378, 'khó', '5', '61', '70', '5', '2023-04-02 17:56:48'),
(532877930, 14, 927619, 1380, 'khó', '5', '63', '72', '72', '2023-04-02 17:56:52'),
(1005748712, 14, 927619, 1381, 'khó', '5', '64', '73', 'khó', '2023-04-02 17:57:02'),
(1382701980, 14, 927619, 1382, 'khó', '5', '65', '74', 'khó', '2023-04-02 17:57:21'),
(1319328621, 14, 927619, 1383, 'khó', '5', '66', '75', '5', '2023-04-02 17:57:19'),
(360756723, 14, 927619, 1384, 'khó', '5', '67', '76', 'khó', '2023-04-02 17:56:59'),
(1611277914, 14, 927619, 1385, 'khó', '5', '68', '77', '68', '2023-04-02 17:57:26'),
(1378722472, 14, 927619, 1386, 'khó', '5', '69', '78', 'khó', '2023-04-02 17:57:20'),
(267611561, 14, 927619, 1387, 'khó', '5', '70', '79', '5', '2023-04-02 17:56:50'),
(1066724491, 14, 927619, 1390, 'khó', '5', '73', '82', 'khó', '2023-04-02 17:57:12'),
(249307572, 14, 927619, 1391, 'khó', '5', '74', '83', 'khó', '2023-04-02 17:56:47'),
(655606153, 14, 927619, 1392, 'khó', '5', '75', '84', 'khó', '2023-04-02 17:57:05'),
(1458015002, 14, 927619, 1393, 'khó', '5', '76', '85', '85', '2023-04-02 17:57:30'),
(484570042, 14, 927619, 1394, 'khó', '5', '77', '86', 'khó', '2023-04-02 17:56:54'),
(1489315469, 14, 927619, 1395, 'khó', '5', '78', '87', '78', '2023-04-02 17:57:23'),
(1502435473, 14, 927619, 1396, 'khó', '5', '79', '88', 'khó', '2023-04-02 17:57:45'),
(578702432, 14, 927619, 1397, 'khó', '5', '80', '89', 'khó', '2023-04-02 17:56:55'),
(929407196, 14, 927619, 1398, 'khó', '5', '81', '90', 'khó', '2023-04-02 17:57:01'),
(1236971042, 14, 927619, 1399, 'khó', '5', '82', '91', '5', '2023-04-02 17:57:17'),
(330787310, 16, 815048, 1811, 'Dễ', '5', '2', '11', 'Dễ', '2023-04-03 15:19:02'),
(902162415, 16, 815048, 1813, 'Dễ', '5', '4', '13', '5', '2023-04-03 15:19:22'),
(673891894, 16, 815048, 1816, 'Dễ', '5', '7', '16', 'Dễ', '2023-04-03 15:19:19'),
(1548785242, 16, 815048, 1818, 'Dễ', '5', '9', '18', 'Dễ', '2023-04-03 15:19:53'),
(1503511304, 16, 815048, 1820, 'Dễ', '5', '11', '20', 'Dễ', '2023-04-03 15:19:51'),
(1050196863, 16, 815048, 1827, 'Dễ', '5', '18', '27', 'Dễ', '2023-04-03 15:19:32'),
(1313885187, 16, 815048, 1829, 'Dễ', '5', '20', '29', '20', '2023-04-03 15:19:46'),
(44670526, 16, 815048, 1833, 'Dễ', '5', '24', '33', 'Dễ', '2023-04-03 15:18:54'),
(988536174, 16, 815048, 1837, 'trung bình', '5', '28', '37', '28', '2023-04-03 15:19:23'),
(407568670, 16, 815048, 1838, 'trung bình', '5', '29', '38', 'trung bình', '2023-04-03 15:19:08'),
(472768958, 16, 815048, 1839, 'trung bình', '5', '30', '39', 'trung bình', '2023-04-03 15:19:05'),
(790634620, 16, 815048, 1840, 'trung bình', '5', '31', '40', '31', '2023-04-03 15:19:12'),
(272890399, 16, 815048, 1841, 'trung bình', '5', '32', '41', 'trung bình', '2023-04-03 15:19:00'),
(1120036789, 16, 815048, 1842, 'trung bình', '5', '33', '42', '5', '2023-04-03 15:19:43'),
(1032965143, 16, 815048, 1843, 'trung bình', '5', '34', '43', '5', '2023-04-03 15:19:31'),
(1581856333, 16, 815048, 1845, 'trung bình', '5', '36', '45', 'trung bình', '2023-04-03 15:19:53'),
(613724726, 16, 815048, 1847, 'trung bình', '5', '38', '47', 'trung bình', '2023-04-03 15:19:06'),
(1408544143, 16, 815048, 1848, 'trung bình', '5', '39', '48', 'trung bình', '2023-04-03 15:19:50'),
(233894772, 16, 815048, 1849, 'trung bình', '5', '40', '49', '40', '2023-04-03 15:19:01'),
(159768153, 16, 815048, 1850, 'trung bình', '5', '41', '50', 'trung bình', '2023-04-03 15:18:59'),
(121523006, 16, 815048, 1852, 'trung bình', '5', '43', '52', 'trung bình', '2023-04-03 15:18:56'),
(1538685502, 16, 815048, 1853, 'trung bình', '5', '44', '53', '5', '2023-04-03 15:19:55'),
(1083160361, 16, 815048, 1854, 'trung bình', '5', '45', '54', '5', '2023-04-03 15:19:41'),
(806118389, 16, 815048, 1855, 'trung bình', '5', '46', '55', 'trung bình', '2023-04-03 15:19:21'),
(77522724, 16, 815048, 1856, 'trung bình', '5', '47', '56', 'trung bình', '2023-04-03 15:18:57'),
(1522148682, 16, 815048, 1857, 'trung bình', '5', '48', '57', '48', '2023-04-03 15:19:54'),
(389950280, 16, 815048, 1858, 'trung bình', '5', '49', '58', '5', '2023-04-03 15:19:09'),
(136616303, 16, 815048, 1859, 'trung bình', '5', '50', '59', '50', '2023-04-03 15:18:58'),
(781537120, 16, 815048, 1860, 'trung bình', '5', '51', '60', 'trung bình', '2023-04-03 15:19:12'),
(1408101702, 16, 815048, 1861, 'trung bình', '5', '52', '61', 'trung bình', '2023-04-03 15:19:47'),
(326367121, 16, 815048, 1862, 'trung bình', '5', '53', '62', 'trung bình', '2023-04-03 15:19:03'),
(989266428, 16, 815048, 1863, 'trung bình', '5', '54', '63', 'trung bình', '2023-04-03 15:19:28'),
(673214493, 16, 815048, 1868, 'khó', '5', '59', '68', 'khó', '2023-04-03 15:19:14'),
(1392735248, 16, 815048, 1878, 'khó', '5', '69', '78', 'khó', '2023-04-03 15:19:46'),
(963915155, 16, 815048, 1881, 'khó', '5', '72', '81', '72', '2023-04-03 15:19:24'),
(991161775, 16, 815048, 1882, 'khó', '5', '73', '82', 'khó', '2023-04-03 15:19:27'),
(482536051, 16, 815048, 1883, 'khó', '5', '74', '83', '5', '2023-04-03 15:19:04'),
(1048901664, 16, 815048, 1884, 'khó', '5', '75', '84', 'khó', '2023-04-03 15:19:29'),
(1453524652, 16, 815048, 1890, 'khó', '5', '81', '90', 'khó', '2023-04-03 15:19:50'),
(1070869922, 16, 815048, 1891, 'khó', '5', '82', '91', 'khó', '2023-04-03 15:19:42'),
(272009353, 16, 927619, 1323, 'Dễ', '5', '6', '15', '5', '2023-04-03 15:20:49'),
(1437125377, 16, 927619, 1324, 'Dễ', '5', '7', '16', 'Dễ', '2023-04-03 15:21:50'),
(1038886867, 16, 927619, 1329, 'Dễ', '5', '12', '21', 'Dễ', '2023-04-03 15:21:28'),
(155037180, 16, 927619, 1330, 'Dễ', '5', '13', '22', 'Dễ', '2023-04-03 15:20:47'),
(447260532, 16, 927619, 1331, 'Dễ', '5', '14', '23', '5', '2023-04-03 15:20:51'),
(1659800413, 16, 927619, 1332, 'Dễ', '5', '15', '24', 'Dễ', '2023-04-03 15:21:46'),
(1195718981, 16, 927619, 1335, 'Dễ', '5', '18', '27', '27', '2023-04-03 15:21:33'),
(891627032, 16, 927619, 1343, 'Dễ', '5', '26', '35', 'Dễ', '2023-04-03 15:21:01'),
(1169347299, 16, 927619, 1345, 'trung bình', '5', '28', '37', 'trung bình', '2023-04-03 15:21:31'),
(1375986348, 16, 927619, 1346, 'trung bình', '5', '29', '38', 'trung bình', '2023-04-03 15:21:35'),
(1515475595, 16, 927619, 1350, 'trung bình', '5', '33', '42', '5', '2023-04-03 15:21:41'),
(384179705, 16, 927619, 1354, 'trung bình', '5', '37', '46', 'trung bình', '2023-04-03 15:20:48'),
(816211349, 16, 927619, 1356, 'trung bình', '5', '39', '48', 'trung bình', '2023-04-03 15:20:59'),
(1642217540, 16, 927619, 1359, 'trung bình', '5', '42', '51', 'trung bình', '2023-04-03 15:21:44'),
(958252946, 16, 927619, 1369, 'trung bình', '5', '52', '61', 'trung bình', '2023-04-03 15:21:27'),
(694316769, 16, 927619, 1370, 'trung bình', '5', '53', '62', 'trung bình', '2023-04-03 15:20:57'),
(835107481, 16, 927619, 1372, 'khó', '5', '55', '64', '64', '2023-04-03 15:21:06'),
(1109790048, 16, 927619, 1373, 'khó', '5', '56', '65', '65', '2023-04-03 15:21:30'),
(51427266, 16, 927619, 1374, 'khó', '5', '57', '66', 'khó', '2023-04-03 15:20:45'),
(823131215, 16, 927619, 1375, 'khó', '5', '58', '67', 'khó', '2023-04-03 15:21:09'),
(730593343, 16, 927619, 1377, 'khó', '5', '60', '69', 'khó', '2023-04-03 15:21:00'),
(1640612313, 16, 927619, 1378, 'khó', '5', '61', '70', 'khó', '2023-04-03 15:21:45'),
(120896531, 16, 927619, 1380, 'khó', '5', '63', '72', 'khó', '2023-04-03 15:20:46'),
(898157621, 16, 927619, 1381, 'khó', '5', '64', '73', 'khó', '2023-04-03 15:21:03'),
(431604012, 16, 927619, 1382, 'khó', '5', '65', '74', '74', '2023-04-03 15:20:52'),
(590669951, 16, 927619, 1383, 'khó', '5', '66', '75', '75', '2023-04-03 15:20:57'),
(1412035023, 16, 927619, 1384, 'khó', '5', '67', '76', 'khó', '2023-04-03 15:21:37'),
(1245913564, 16, 927619, 1385, 'khó', '5', '68', '77', '68', '2023-04-03 15:21:39'),
(549632687, 16, 927619, 1386, 'khó', '5', '69', '78', 'khó', '2023-04-03 15:21:18'),
(845677533, 16, 927619, 1387, 'khó', '5', '70', '79', 'khó', '2023-04-03 15:21:02'),
(1648244875, 16, 927619, 1390, 'khó', '5', '73', '82', 'khó', '2023-04-03 15:21:47'),
(664825766, 16, 927619, 1391, 'khó', '5', '74', '83', '83', '2023-04-03 15:20:56'),
(1635192423, 16, 927619, 1392, 'khó', '5', '75', '84', 'khó', '2023-04-03 15:21:42'),
(454761563, 16, 927619, 1393, 'khó', '5', '76', '85', 'khó', '2023-04-03 15:20:53'),
(1302948895, 16, 927619, 1394, 'khó', '5', '77', '86', 'khó', '2023-04-03 15:21:38'),
(1189475089, 16, 927619, 1395, 'khó', '5', '78', '87', 'khó', '2023-04-03 15:21:31'),
(464757863, 16, 927619, 1396, 'khó', '5', '79', '88', 'khó', '2023-04-03 15:20:55'),
(945212674, 16, 927619, 1397, 'khó', '5', '80', '89', '80', '2023-04-03 15:21:26'),
(428160568, 16, 927619, 1398, 'khó', '5', '81', '90', 'khó', '2023-04-03 15:21:21'),
(1603407918, 16, 927619, 1399, 'khó', '5', '82', '91', 'khó', '2023-04-03 15:21:41'),
(591112996, 22, 547514, 1483, 'Dễ', '5', '2', '11', 'Dễ', '2023-04-02 18:16:29'),
(1469182716, 22, 547514, 1484, 'Dễ', '5', '3', '12', '3', '2023-04-02 18:16:45'),
(247997104, 22, 547514, 1485, 'Dễ', '5', '4', '13', NULL, '2023-04-02 18:16:19'),
(1081109429, 22, 547514, 1486, 'Dễ', '5', '5', '14', 'Dễ', '2023-04-02 18:16:32'),
(360672704, 22, 547514, 1487, 'Dễ', '5', '6', '15', 'Dễ', '2023-04-02 18:16:53'),
(976569492, 22, 547514, 1488, 'Dễ', '5', '7', '16', 'Dễ', '2023-04-02 18:16:32'),
(1234705980, 22, 547514, 1489, 'Dễ', '5', '8', '17', '5', '2023-04-02 18:16:49'),
(268601948, 22, 547514, 1491, 'Dễ', '5', '10', '19', 'Dễ', '2023-04-02 18:16:52'),
(1109755941, 22, 547514, 1492, 'Dễ', '5', '11', '20', 'Dễ', '2023-04-02 18:16:36'),
(1119756324, 22, 547514, 1493, 'Dễ', '5', '12', '21', 'Dễ', '2023-04-02 18:16:35'),
(1256977392, 22, 547514, 1494, 'Dễ', '5', '13', '22', NULL, '2023-04-02 18:16:19'),
(411909076, 22, 547514, 1495, 'Dễ', '5', '14', '23', NULL, '2023-04-02 18:16:19'),
(74674651, 22, 547514, 1496, 'Dễ', '5', '15', '24', 'Dễ', '2023-04-02 18:16:23'),
(1547463691, 22, 547514, 1497, 'Dễ', '5', '16', '25', NULL, '2023-04-02 18:16:19'),
(854478726, 22, 547514, 1498, 'Dễ', '5', '17', '26', 'Dễ', '2023-04-02 18:16:51'),
(436856668, 22, 547514, 1499, 'Dễ', '5', '18', '27', NULL, '2023-04-02 18:16:19'),
(1429932101, 22, 547514, 1500, 'Dễ', '5', '19', '28', NULL, '2023-04-02 18:16:19'),
(1466528255, 22, 547514, 1501, 'Dễ', '5', '20', '29', NULL, '2023-04-02 18:16:19'),
(4167493, 22, 547514, 1502, 'Dễ', '5', '21', '30', 'Dễ', '2023-04-02 18:16:26'),
(921523978, 22, 547514, 1504, 'Dễ', '5', '23', '32', NULL, '2023-04-02 18:16:19'),
(1280594941, 22, 547514, 1505, 'Dễ', '5', '24', '33', 'Dễ', '2023-04-02 18:16:38'),
(497364262, 22, 547514, 1506, 'Dễ', '5', '25', '34', 'Dễ', '2023-04-02 18:16:27'),
(1100550253, 22, 547514, 1507, 'Dễ', '5', '26', '35', NULL, '2023-04-02 18:16:19'),
(16848005, 22, 547514, 1508, 'Dễ', '5', '27', '36', 'Dễ', '2023-04-02 18:16:25'),
(1306093460, 22, 547514, 1511, 'trung bình', '5', '30', '39', 'trung bình', '2023-04-02 18:16:37'),
(1118639487, 22, 547514, 1513, 'trung bình', '5', '32', '41', 'trung bình', '2023-04-02 18:16:35'),
(1350452898, 22, 547514, 1515, 'trung bình', '5', '34', '43', 'trung bình', '2023-04-02 18:16:39'),
(1099205401, 22, 547514, 1521, 'trung bình', '5', '40', '49', NULL, '2023-04-02 18:16:19'),
(464661557, 22, 547514, 1522, 'trung bình', '5', '41', '50', 'trung bình', '2023-04-02 18:16:28'),
(762416417, 22, 547514, 1523, 'trung bình', '5', '42', '51', 'trung bình', '2023-04-02 18:16:30'),
(755680859, 22, 547514, 1532, 'trung bình', '5', '51', '60', 'trung bình', '2023-04-02 18:16:31'),
(1466142820, 22, 547514, 1533, 'trung bình', '5', '52', '61', '52', '2023-04-02 18:16:46'),
(1666351839, 22, 547514, 1541, 'khó', '5', '60', '69', 'khó', '2023-04-02 18:16:42'),
(1530463583, 22, 547514, 1544, 'khó', '5', '63', '72', '5', '2023-04-02 18:16:44'),
(1549047309, 22, 547514, 1545, 'khó', '5', '64', '73', '64', '2023-04-02 18:16:41'),
(633720336, 22, 547514, 1547, 'khó', '5', '66', '75', NULL, '2023-04-02 18:16:19'),
(1602072368, 22, 547514, 1550, 'khó', '5', '69', '78', '5', '2023-04-02 18:16:40'),
(660606068, 22, 547514, 1554, 'khó', '5', '73', '82', '73', '2023-04-02 18:16:57'),
(213191874, 22, 547514, 1560, 'khó', '5', '79', '88', 'khó', '2023-04-02 18:16:24'),
(1651483671, 22, 547514, 1563, 'khó', '5', '82', '91', '82', '2023-04-02 18:16:43'),
(67379237, 22, 945075, 1647, 'Dễ', '5', '2', '11', 'Dễ', '2023-04-02 18:14:54'),
(68996425, 22, 945075, 1650, 'Dễ', '5', '5', '14', 'Dễ', '2023-04-02 18:15:34'),
(578214867, 22, 945075, 1653, 'Dễ', '5', '8', '17', '5', '2023-04-02 18:15:05'),
(943763711, 22, 945075, 1654, 'Dễ', '5', '9', '18', 'Dễ', '2023-04-02 18:15:23'),
(1317305539, 22, 945075, 1659, 'Dễ', '5', '14', '23', NULL, '2023-04-02 18:14:51'),
(115056773, 22, 945075, 1662, 'Dễ', '5', '17', '26', '17', '2023-04-02 18:15:28'),
(614135846, 22, 945075, 1666, 'Dễ', '5', '21', '30', 'Dễ', '2023-04-02 18:15:05'),
(565860725, 22, 945075, 1668, 'Dễ', '5', '23', '32', 'Dễ', '2023-04-02 18:15:03'),
(211847770, 22, 945075, 1674, 'trung bình', '5', '29', '38', 'trung bình', '2023-04-02 18:15:29'),
(353949260, 22, 945075, 1680, 'trung bình', '5', '35', '44', '35', '2023-04-02 18:15:00'),
(843949952, 22, 945075, 1681, 'trung bình', '5', '36', '45', 'trung bình', '2023-04-02 18:15:08'),
(113771566, 22, 945075, 1684, 'trung bình', '5', '39', '48', 'trung bình', '2023-04-02 18:15:31'),
(1642887653, 22, 945075, 1688, 'trung bình', '5', '43', '52', '52', '2023-04-02 18:15:45'),
(381060433, 22, 945075, 1691, 'trung bình', '5', '46', '55', 'trung bình', '2023-04-02 18:15:01'),
(1327623421, 22, 945075, 1697, 'trung bình', '5', '52', '61', '61', '2023-04-02 18:15:44'),
(1327391856, 22, 945075, 1699, 'trung bình', '5', '54', '63', '63', '2023-04-02 18:15:43'),
(632816985, 22, 945075, 1701, 'khó', '5', '56', '65', '5', '2023-04-02 18:15:38'),
(282954249, 22, 945075, 1702, 'khó', '5', '57', '66', '5', '2023-04-02 18:15:00'),
(1256148540, 22, 945075, 1703, 'khó', '5', '58', '67', 'khó', '2023-04-02 18:15:21'),
(1089897411, 22, 945075, 1704, 'khó', '5', '59', '68', 'khó', '2023-04-02 18:15:10'),
(15958568, 22, 945075, 1705, 'khó', '5', '60', '69', 'khó', '2023-04-02 18:14:55'),
(859019005, 22, 945075, 1707, 'khó', '5', '62', '71', 'khó', '2023-04-02 18:15:06'),
(1618999009, 22, 945075, 1710, 'khó', '5', '65', '74', 'khó', '2023-04-02 18:15:19'),
(217014592, 22, 945075, 1711, 'khó', '5', '66', '75', 'khó', '2023-04-02 18:14:56'),
(1239396717, 22, 945075, 1712, 'khó', '5', '67', '76', 'khó', '2023-04-02 18:15:11'),
(1188499580, 22, 945075, 1713, 'khó', '5', '68', '77', 'khó', '2023-04-02 18:15:09'),
(885065138, 22, 945075, 1714, 'khó', '5', '69', '78', 'khó', '2023-04-02 18:15:07'),
(726369292, 22, 945075, 1715, 'khó', '5', '70', '79', 'khó', '2023-04-02 18:15:37'),
(1032463336, 22, 945075, 1716, 'khó', '5', '71', '80', NULL, '2023-04-02 18:14:51'),
(414072306, 22, 945075, 1717, 'khó', '5', '72', '81', 'khó', '2023-04-02 18:15:25'),
(31059581, 22, 945075, 1719, 'khó', '5', '74', '83', '5', '2023-04-02 18:15:34'),
(1502422715, 22, 945075, 1720, 'khó', '5', '75', '84', 'khó', '2023-04-02 18:15:41'),
(1306856602, 22, 945075, 1721, 'khó', '5', '76', '85', 'khó', '2023-04-02 18:15:16'),
(1196293046, 22, 945075, 1722, 'khó', '5', '77', '86', 'khó', '2023-04-02 18:15:12'),
(454218517, 22, 945075, 1723, 'khó', '5', '78', '87', 'khó', '2023-04-02 18:15:03'),
(1313098978, 22, 945075, 1724, 'khó', '5', '79', '88', 'khó', '2023-04-02 18:15:15'),
(396703949, 22, 945075, 1725, 'khó', '5', '80', '89', '80', '2023-04-02 18:15:26'),
(1544547791, 22, 945075, 1726, 'khó', '5', '81', '90', '90', '2023-04-02 18:15:47'),
(252113554, 22, 945075, 1727, 'khó', '5', '82', '91', 'khó', '2023-04-02 18:14:58'),
(1531806964, 22, 945075, 1728, 'khó', '5', '83', '92', '83', '2023-04-02 18:15:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_detail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_detail`) VALUES
(1, 'Toán'),
(2, 'Ngữ Văn'),
(3, 'Lịch sử'),
(4, 'Địa Lý'),
(5, 'Vật Lý'),
(6, 'Công nghệ'),
(7, 'GDCD'),
(8, 'Anh'),
(9, 'Hóa học'),
(10, 'Sinh học');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subject_head`
--

CREATE TABLE `subject_head` (
  `subject_head_id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender_id` int(1) NOT NULL DEFAULT 1,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `permission` int(1) NOT NULL DEFAULT 4,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'avatar-default.jpg',
  `birthday` date NOT NULL,
  `last_login` datetime NOT NULL,
  `subject_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `subject_head`
--

INSERT INTO `subject_head` (`subject_head_id`, `name`, `username`, `password`, `gender_id`, `email`, `permission`, `avatar`, `birthday`, `last_login`, `subject_id`) VALUES
(1, 'Nguyễn Thị Bình', 'truong1', 'e10adc3949ba59abbe56e057f20f883e', 3, 'sh3@gmail.com', 4, 'avatar-default.jpg', '2000-04-04', '2023-04-13 00:17:54', 1),
(2, 'Mai Ngọc Minh', 'truong2', 'e10adc3949ba59abbe56e057f20f883e', 3, 'sh4@gmail.com', 4, 'avatar-default.jpg', '1999-01-20', '2023-04-11 14:57:07', 9),
(3, 'Hoàng Đình Hiếu', 'truong3', 'e10adc3949ba59abbe56e057f20f883e', 3, 'sh5@gmail.com', 4, 'avatar-default.jpg', '1999-01-21', '2023-04-13 23:58:08', 10),
(4, 'Trần Trọng Quý', 'truong4', 'e10adc3949ba59abbe56e057f20f883e', 2, 'sh6@gmail.com', 4, 'avatar-default.jpg', '1999-01-22', '2023-04-04 23:39:27', 8),
(5, 'Nguyễn Thị Bích Thùy', 'truong5', 'e10adc3949ba59abbe56e057f20f883e', 3, 'sh7@gmail.com', 4, 'avatar-default.jpg', '1999-01-23', '2023-04-05 00:53:27', 5),
(6, 'Nguyễn Lan Anh', 'truong6', 'e10adc3949ba59abbe56e057f20f883e', 3, 'lananh@gmail.com', 4, 'avatar-default.jpg', '1997-01-22', '2023-04-03 21:43:43', 3),
(7, 'Hoàng Bảo Quyên', 'truong7', 'e10adc3949ba59abbe56e057f20f883e', 3, 'quyen123@gmail.com', 4, 'avatar-default.jpg', '1997-05-05', '2023-04-03 21:54:27', 7),
(8, 'Vũ Minh Nhiên', 'truong8', 'e10adc3949ba59abbe56e057f20f883e', 2, 'nhien@gmail.com', 4, 'avatar-default.jpg', '1997-02-05', '0000-00-00 00:00:00', 6),
(9, 'Nguyễn Thị Bích Thùy', 'truong10', 'e10adc3949ba59abbe56e057f20f883e', 3, 'thuyabc6620@gmail.com', 4, 'avatar-default.jpg', '1997-06-04', '2023-04-12 21:47:33', 3),
(10, 'Nguyễn Thùy', 'truong12', 'e10adc3949ba59abbe56e057f20f883e', 3, 'thuyabc@gmail.com', 4, 'avatar-default.jpg', '2000-06-06', '0000-00-00 00:00:00', 7),
(11, 'Nguyễn Thùy Bích ', 'thuy123', 'e10adc3949ba59abbe56e057f20f883e', 3, 'thuyabc611620@gmail.com', 4, 'avatar-default.jpg', '1997-01-01', '0000-00-00 00:00:00', 10),
(12, 'Thùy', 'truong99', 'e10adc3949ba59abbe56e057f20f883e', 3, 'thuy123@gmail.com', 4, 'avatar-default.jpg', '1997-01-01', '0000-00-00 00:00:00', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `permission` int(1) DEFAULT 2,
  `last_login` datetime NOT NULL,
  `gender_id` int(1) NOT NULL DEFAULT 1,
  `avatar` varchar(255) DEFAULT 'avatar-default.jpg',
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `username`, `email`, `password`, `name`, `permission`, `last_login`, `gender_id`, `avatar`, `birthday`) VALUES
(1, 'giaovien1', 'giaovien1@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', 'Nguyễn Thị Bích Thùy', 2, '2023-04-05 01:37:32', 3, 'avatar-default.jpg', '2000-12-22'),
(2, 'giaovien2', 'giaovien2@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Đức Hải', 2, '2023-04-13 23:18:58', 2, 'avatar-default.jpg', '1999-01-20'),
(3, 'giaovien3', 'giaovien3@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hoàng Ngọc Mai', 2, '2023-04-13 23:56:32', 3, 'avatar-default.jpg', '1999-01-20'),
(4, 'giaovien4', 'giaovien4@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Khổng Minh Tâm', 2, '2023-04-11 12:52:16', 2, 'avatar-default.jpg', '1999-01-20'),
(5, 'giaovien5', 'giaovien5@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Bích Thùy', 2, '2023-04-11 13:22:54', 3, 'avatar-default.jpg', '1999-01-20'),
(6, 'giaovien6', 'giaovien6@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Vũ Thị Hà', 2, '2023-04-11 14:52:51', 3, 'avatar-default.jpg', '1999-01-20'),
(7, 'giaovien7', 'giaovien7@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Hùng Vỹ', 2, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '1997-01-01'),
(8, 'thuy1234', 'thuyabc61620@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Thùy123', 2, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '1997-01-01'),
(9, 'hocsinh2000', 'hocsinh2000@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thị Bích Thùy', 2, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2000-02-08'),
(10, 'giaovien55', 'thao@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Vũ Thị Thảo', 2, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '1997-01-01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `teacher_notifications`
--

CREATE TABLE `teacher_notifications` (
  `ID` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `teacher_notifications`
--

INSERT INTO `teacher_notifications` (`ID`, `notification_id`, `teacher_id`) VALUES
(14, 35, 1),
(15, 35, 2),
(16, 35, 3),
(17, 35, 4),
(18, 35, 5),
(19, 35, 6),
(20, 35, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tests`
--

CREATE TABLE `tests` (
  `test_code` int(11) NOT NULL,
  `test_name` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `grade_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `total_questions` int(11) NOT NULL,
  `time_to_do` int(11) NOT NULL,
  `note` text NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `timest` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tests`
--

INSERT INTO `tests` (`test_code`, `test_name`, `password`, `subject_id`, `grade_id`, `level_id`, `total_questions`, `time_to_do`, `note`, `status_id`, `timest`) VALUES
(197966, 'Đề thi Anh 11', 'e10adc3949ba59abbe56e057f20f883e', 8, 11, 1, 40, 50, '', 1, '2023-04-04 16:39:00'),
(204521, 'Đề thi GDCD khối 12', 'e10adc3949ba59abbe56e057f20f883e', 7, 12, 3, 40, 50, 'đề mức độ khó', 2, '2023-04-03 14:52:53'),
(263414, 'test', 'e10adc3949ba59abbe56e057f20f883e', 10, 10, 1, 50, 50, '', 1, '2023-04-13 16:25:32'),
(354471, 'Đề thi lịch sử 11', 'e10adc3949ba59abbe56e057f20f883e', 3, 11, 2, 40, 50, '', 1, '2023-04-11 08:00:38'),
(424315, 'Đề  thi thử môn Anh 11', 'e10adc3949ba59abbe56e057f20f883e', 8, 11, 3, 40, 50, 'đề khó', 2, '2023-04-02 18:03:58'),
(433331, 'Đề thi Sinh 10', 'e10adc3949ba59abbe56e057f20f883e', 10, 10, 1, 40, 50, '', 1, '2023-04-04 17:27:55'),
(435636, 'Đề thi thử môn Hóa khối 11', 'e10adc3949ba59abbe56e057f20f883e', 9, 11, 1, 40, 50, 'Đề mức độ dễ', 2, '2023-04-02 15:53:41'),
(456655, 'Thi thử Sinh 10 (đề sinh thủ công)', 'e10adc3949ba59abbe56e057f20f883e', 10, 10, 1, 50, 50, '', 2, '2023-04-13 16:37:59'),
(547514, 'Đề thi thử Toán khối 11', 'e10adc3949ba59abbe56e057f20f883e', 1, 11, 1, 40, 50, 'đề ở mức độ dễ', 2, '2023-04-02 15:50:36'),
(700530, 'Toán khối 11', 'e10adc3949ba59abbe56e057f20f883e', 1, 11, 1, 40, 50, '', 2, '2023-04-11 06:21:10'),
(727440, 'Thi thử Toán 11', 'e10adc3949ba59abbe56e057f20f883e', 1, 11, 2, 40, 50, '', 2, '2023-04-11 04:44:24'),
(788901, 'Kiểm tra Anh 11', 'e10adc3949ba59abbe56e057f20f883e', 8, 11, 3, 10, 15, 'đề khó', 2, '2023-04-02 18:03:16'),
(815048, 'Đề thi thử GDCD 10', 'e10adc3949ba59abbe56e057f20f883e', 7, 10, 2, 40, 50, '', 2, '2023-04-03 14:52:55'),
(825843, 'Đề thi Sinh 10 ', 'e10adc3949ba59abbe56e057f20f883e', 10, 10, 1, 0, 50, '', 1, '2023-04-13 16:37:03'),
(927619, 'Đề thi khảo sát Môn Sinh lớp 10', 'e10adc3949ba59abbe56e057f20f883e', 10, 10, 3, 40, 50, 'Đề thi ở mức khó', 2, '2023-04-02 15:55:52'),
(945075, 'Đề thi khảo sát Vật lý 12', 'e10adc3949ba59abbe56e057f20f883e', 5, 12, 3, 40, 50, 'đề khó', 2, '2023-04-02 18:08:06'),
(981590, 'Test đề thủ công', 'e10adc3949ba59abbe56e057f20f883e', 10, 10, 1, 40, 50, '', 2, '2023-04-13 16:38:09');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `n4` (`permission`),
  ADD KEY `admins_gender_id` (`gender_id`);

--
-- Chỉ mục cho bảng `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `class_id` (`class_id`);

--
-- Chỉ mục cho bảng `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`),
  ADD UNIQUE KEY `class_name` (`class_name`),
  ADD KEY `n7` (`teacher_id`),
  ADD KEY `k4` (`grade_id`);

--
-- Chỉ mục cho bảng `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`gender_id`);

--
-- Chỉ mục cho bảng `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`);

--
-- Chỉ mục cho bảng `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`level_id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permission`);

--
-- Chỉ mục cho bảng `practice`
--
ALTER TABLE `practice`
  ADD PRIMARY KEY (`practice_code`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Chỉ mục cho bảng `practice_scores`
--
ALTER TABLE `practice_scores`
  ADD PRIMARY KEY (`student_id`,`practice_code`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `practice_code` (`practice_code`);

--
-- Chỉ mục cho bảng `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `k9` (`grade_id`),
  ADD KEY `unit` (`unit`),
  ADD KEY `subjects_key` (`subject_id`),
  ADD KEY `level_id` (`level_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Chỉ mục cho bảng `quest_of_practice`
--
ALTER TABLE `quest_of_practice`
  ADD PRIMARY KEY (`practice_code`,`question_id`) USING BTREE,
  ADD KEY `question_id` (`question_id`),
  ADD KEY `practice_code` (`practice_code`) USING BTREE;

--
-- Chỉ mục cho bảng `quest_of_test`
--
ALTER TABLE `quest_of_test`
  ADD PRIMARY KEY (`test_code`,`question_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `test_code` (`test_code`);

--
-- Chỉ mục cho bảng `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`student_id`,`test_code`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `test_code` (`test_code`);

--
-- Chỉ mục cho bảng `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Chỉ mục cho bảng `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `n9` (`class_id`),
  ADD KEY `n11` (`permission`),
  ADD KEY `students_gender_id` (`gender_id`);

--
-- Chỉ mục cho bảng `student_notifications`
--
ALTER TABLE `student_notifications`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `notification_id` (`notification_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Chỉ mục cho bảng `student_practice_detail`
--
ALTER TABLE `student_practice_detail`
  ADD PRIMARY KEY (`student_id`,`practice_code`,`question_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `practice_id` (`practice_code`);

--
-- Chỉ mục cho bảng `student_test_detail`
--
ALTER TABLE `student_test_detail`
  ADD PRIMARY KEY (`student_id`,`test_code`,`question_id`),
  ADD KEY `fk4` (`test_code`),
  ADD KEY `fk6` (`question_id`);

--
-- Chỉ mục cho bảng `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Chỉ mục cho bảng `subject_head`
--
ALTER TABLE `subject_head`
  ADD PRIMARY KEY (`subject_head_id`),
  ADD UNIQUE KEY `username` (`username`) USING BTREE,
  ADD UNIQUE KEY `email` (`email`) USING BTREE;

--
-- Chỉ mục cho bảng `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `n2` (`permission`),
  ADD KEY `teachers_gender_id` (`gender_id`);

--
-- Chỉ mục cho bảng `teacher_notifications`
--
ALTER TABLE `teacher_notifications`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `notification_id` (`notification_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Chỉ mục cho bảng `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`test_code`),
  ADD KEY `fk1` (`subject_id`),
  ADD KEY `fk2` (`status_id`),
  ADD KEY `grade_id` (`grade_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `chats`
--
ALTER TABLE `chats`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `genders`
--
ALTER TABLE `genders`
  MODIFY `gender_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `levels`
--
ALTER TABLE `levels`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permission` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `practice`
--
ALTER TABLE `practice`
  MODIFY `practice_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=975641;

--
-- AUTO_INCREMENT cho bảng `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1978;

--
-- AUTO_INCREMENT cho bảng `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT cho bảng `student_notifications`
--
ALTER TABLE `student_notifications`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `subject_head`
--
ALTER TABLE `subject_head`
  MODIFY `subject_head_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `teacher_notifications`
--
ALTER TABLE `teacher_notifications`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `tests`
--
ALTER TABLE `tests`
  MODIFY `test_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=981591;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`gender_id`),
  ADD CONSTRAINT `n4` FOREIGN KEY (`permission`) REFERENCES `permissions` (`permission`);

--
-- Các ràng buộc cho bảng `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chat_classes_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`);

--
-- Các ràng buộc cho bảng `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`),
  ADD CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`);

--
-- Các ràng buộc cho bảng `practice_scores`
--
ALTER TABLE `practice_scores`
  ADD CONSTRAINT `pracetice_scores_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `pracetice_scores_ibfk_2` FOREIGN KEY (`practice_code`) REFERENCES `practice` (`practice_code`);

--
-- Các ràng buộc cho bảng `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `k9` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`),
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `levels` (`level_id`),
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`status_id`),
  ADD CONSTRAINT `subjects_key` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);

--
-- Các ràng buộc cho bảng `quest_of_practice`
--
ALTER TABLE `quest_of_practice`
  ADD CONSTRAINT `quest_of_pratice_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`);

--
-- Các ràng buộc cho bảng `quest_of_test`
--
ALTER TABLE `quest_of_test`
  ADD CONSTRAINT `quest_of_test_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  ADD CONSTRAINT `quest_of_test_ibfk_2` FOREIGN KEY (`test_code`) REFERENCES `tests` (`test_code`);

--
-- Các ràng buộc cho bảng `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`test_code`) REFERENCES `tests` (`test_code`);

--
-- Các ràng buộc cho bảng `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `n11` FOREIGN KEY (`permission`) REFERENCES `permissions` (`permission`),
  ADD CONSTRAINT `n9` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  ADD CONSTRAINT `students_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`gender_id`);

--
-- Các ràng buộc cho bảng `student_notifications`
--
ALTER TABLE `student_notifications`
  ADD CONSTRAINT `student_notifications_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`),
  ADD CONSTRAINT `student_notifications_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`);

--
-- Các ràng buộc cho bảng `student_practice_detail`
--
ALTER TABLE `student_practice_detail`
  ADD CONSTRAINT `practice_fk4` FOREIGN KEY (`practice_code`) REFERENCES `practice` (`practice_code`),
  ADD CONSTRAINT `practice_fk6` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  ADD CONSTRAINT `practice_fk9` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Các ràng buộc cho bảng `student_test_detail`
--
ALTER TABLE `student_test_detail`
  ADD CONSTRAINT `fk4` FOREIGN KEY (`test_code`) REFERENCES `tests` (`test_code`),
  ADD CONSTRAINT `fk6` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  ADD CONSTRAINT `fk9` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Các ràng buộc cho bảng `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `n2` FOREIGN KEY (`permission`) REFERENCES `permissions` (`permission`),
  ADD CONSTRAINT `teachers_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`gender_id`);

--
-- Các ràng buộc cho bảng `teacher_notifications`
--
ALTER TABLE `teacher_notifications`
  ADD CONSTRAINT `teacher_notifications_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`),
  ADD CONSTRAINT `teacher_notifications_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Các ràng buộc cho bảng `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `fk2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`status_id`),
  ADD CONSTRAINT `tests_ibfk_1` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
