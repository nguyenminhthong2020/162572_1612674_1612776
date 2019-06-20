-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 18, 2019 lúc 11:09 PM
-- Phiên bản máy phục vụ: 10.3.15-MariaDB
-- Phiên bản PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlbao`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Thể Thao', 0, '2019-06-18 19:23:17', '2019-06-18 19:23:17'),
(2, 'Khoa Học', 0, '2019-06-18 19:23:26', '2019-06-18 19:23:26'),
(3, 'Anime', 0, '2019-06-18 19:23:04', '2019-06-18 19:23:04'),
(4, 'Thời sự', 0, '2019-06-18 19:23:44', '2019-06-18 19:23:44'),
(5, 'Giải Trí', 0, '2019-06-18 19:23:54', '2019-06-18 19:23:54'),
(6, 'Phim', 0, '2019-06-19 04:03:55', '2019-06-19 04:03:55'),
(7, 'Bóng Đá', 1, '2019-06-18 19:25:06', '2019-06-18 19:25:06'),
(8, 'Bóng Rổ', 1, '2019-06-18 19:25:14', '2019-06-18 19:25:14'),
(9, 'Thể Thao Điện Tử', 1, '2019-06-18 19:25:53', '2019-06-18 19:25:53'),
(10, 'Quần Vợt', 1, '2019-06-18 19:26:09', '2019-06-18 19:26:09'),
(11, 'Cầu Lông', 1, '2019-06-18 19:26:39', '2019-06-18 19:26:39'),
(12, 'Công Nghệ', 2, '2019-06-18 19:27:11', '2019-06-18 19:27:11'),
(13, 'Đời Sống', 2, '2019-06-18 19:27:18', '2019-06-18 19:27:18'),
(14, 'Vũ Trụ', 2, '2019-06-18 19:27:26', '2019-06-18 19:27:26'),
(15, 'Quân Sự', 2, '2019-06-18 19:28:21', '2019-06-18 19:28:21'),
(17, 'Tin Tức Anime', 3, '2019-06-18 19:29:30', '2019-06-18 19:29:30'),
(18, 'Đề cử Anime', 3, '2019-06-18 19:29:43', '2019-06-18 19:29:43'),
(19, 'Nhân Vật Anime', 3, '2019-06-18 19:29:52', '2019-06-18 19:29:52'),
(24, 'Bóng đá trong nước', 3, '2019-05-11 17:26:40', '2019-05-11 17:26:40'),
(25, 'Tin Trong Nước', 4, '2019-06-18 19:35:56', '2019-06-18 19:35:56'),
(26, 'Tin Thế Giới', 4, '2019-06-18 19:36:08', '2019-06-18 19:36:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `name`, `content`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 'Jame Grey', 'Rất hữu ích. Tôi nhất định sẽ mua nó', 1, '2019-05-19 13:38:10', '2019-05-19 13:38:10'),
(2, 'Tony Stark', 'Việc tin tưởng vào sản phẩm của SamSung là không bao giờ sai cả.', 1, '2019-05-18 23:12:26', '2019-05-18 23:12:26'),
(3, 'Hoài Anh', 'Ôi đẹp vậy', 1, '2019-05-18 23:12:31', '2019-05-18 23:12:31'),
(4, 'Harry', 'Mình cũng vậy', 1, '2019-05-18 23:49:04', '2019-05-18 23:49:04'),
(5, 'Tịnh', 'quá tuyệt voờii', 1, '2019-05-19 01:50:16', '2019-05-19 01:50:16'),
(6, 'Tịnh', 'quá awesome', 1, '2019-05-19 01:51:12', '2019-05-19 01:51:12'),
(7, 'Tịnh', 'đẹp trai quá', 14, '2019-05-19 10:02:16', '2019-05-19 10:02:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manage_categories`
--

CREATE TABLE `manage_categories` (
  `id` int(11) NOT NULL,
  `category_manage_id` int(11) NOT NULL,
  `editor_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `manage_categories`
--

INSERT INTO `manage_categories` (`id`, `category_manage_id`, `editor_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 3, '2019-06-04 17:53:51', '2019-06-04 17:53:51'),
(2, 2, 4, 3, '2019-06-04 17:53:54', '2019-06-04 17:53:54'),
(3, 3, 4, 3, '2019-06-04 17:53:59', '2019-06-04 17:53:59'),
(4, 4, 4, 3, '2019-06-04 17:54:02', '2019-06-04 17:54:02'),
(5, 5, 4, 3, '2019-06-04 17:54:04', '2019-06-04 17:54:04'),
(6, 6, 4, 3, '2019-06-04 17:54:08', '2019-06-04 17:54:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `views` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `premium_status` tinyint(3) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `author_name` varchar(255) NOT NULL,
  `post_date` datetime DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `thumb_img` varchar(255) NOT NULL,
  `summary_content` varchar(255) NOT NULL,
  `fail_reason` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `avatar`, `content`, `views`, `status`, `premium_status`, `category_id`, `created_by`, `author_name`, `post_date`, `title`, `thumb_img`, `summary_content`, `fail_reason`, `created_at`, `updated_at`) VALUES
(1, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_1_ava.jpg?alt=media&token=ef6b3612-89c1-4416-984a-7804854d9fbd', 'Các thiết bị dưới đây được xây dựng cho một căn hộ chung cư với 2 phòng ngủ, 2 phòng vệ sinh, một phòng khách kèm phòng ăn. Vì trong tầm giá 10 triệu đồng, đa số các thiết bị đề xuất dưới đây sẽ nằm trong hệ sinh thái Xiaomi. Chúng chưa được bán chính hãng ở Việt Nam, nhưng người dùng vẫn có thể mua hàng \"xách tay\" thông qua một số kênh bán lẻ ở Hà Nội và TP.HCM.\r\nLoa Insignia hỗ trợ Google Home là một sản phẩm tới thương hiệu Mỹ. Thiết bị này sẽ giúp bạn điều khiển bằng giọng nói để bật tắt các thiết bị trong phòng, đồng thời làm loa phát nhạc và kèm với chức năng báo giờ. Insignia có thể kết nối với Google Home Mini ở những phòng khác. Cách kết nối: Sử dụng app Google Home. Giá tham khảo: 1,5 triệu đồng. \r\nĐể tiện lợi khi sử dụng, các bạn hãy kết nối các thiết bị kể trên với những phần mềm đã được viết sẵn tương thích với chúng. Sau khi đã cài đặt xong, chúng ta có thể link Broadlink, JAVIS và Xiaomi lên ứng dụng Google Home. Và sau đó chỉ cần dùng Google Home là đủ để kết nối toàn bộ thiết bị trong nhà và ra lệnh bằng giọng nói', 3000, 1, 0, 12, 3, 'Sy', '2019-05-07 00:00:00', 'Gợi ý lắp smarthome giá tầm 10 triệu ở Việt Nam', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_1_thumb.jpg?alt=media&token=49fa9ebd-7e34-478f-b3e9-5d65c3b8c5d0', 'Với 10 triệu đồng, người dùng đã có thể tự làm smarthome điều khiển bằng giọng nói, tự động tắt mở quạt, điều hòa, TV...', '<p>klsdhfbcjksdbcjksdbcd</p>\n', '2019-06-18 23:37:47', '2019-06-18 23:37:47'),
(2, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_2_ava.jpg?alt=media&token=49148606-9e9c-4114-af8f-ae65a7ed3547', '<p>Khảo s&aacute;t từ Euromonitor tiết lộ Panasonic l&agrave; thương hiệu m&aacute;y giặt số 1 Nhật Bản với thị phần dẫn đầu năm 2017. Thương hiệu uy t&iacute;n l&agrave; một trong những ti&ecirc;u ch&iacute; để phụ nữ Nhật chọn m&aacute;y giặt. Người Nhật lu&ocirc;n c&acirc;n nhắc kỹ lưỡng khả năng kinh tế, số lượng th&agrave;nh vi&ecirc;n trong gia đ&igrave;nh để chọn m&aacute;y giặt c&oacute; c&ocirc;ng năng v&agrave; gi&aacute; cả ph&ugrave; hợp. Hiện nay, thị trường c&oacute; 2 d&ograve;ng phổ biến l&agrave; m&aacute;y giặt cửa tr&ecirc;n v&agrave; cửa trước. Ưu điểm lớn nhất của m&aacute;y giặt cửa tr&ecirc;n nằm ở gi&aacute; th&agrave;nh rẻ. Trong khi đ&oacute;, m&aacute;y giặt cửa trước ra đời sau với nhiều cải tiến hiện đại n&ecirc;n gi&aacute; cao hơn. C&aacute;c thương hiệu m&aacute;y giặt uy t&iacute;n như Panasonic đều c&oacute; c&aacute;c ph&acirc;n kh&uacute;c từ phổ th&ocirc;ng đến cao cấp để kh&aacute;ch h&agrave;ng lựa chọn ph&ugrave; hợp với ng&acirc;n s&aacute;ch. L&agrave; quốc gia kh&ocirc;ng gi&agrave;u t&agrave;i nguy&ecirc;n n&ecirc;n người Nhật rất tiết kiệm. Tuy nhi&ecirc;n, điều n&agrave;y vẫn phải đảm bảo đem lại hiệu quả d&agrave;i hạn. Chiếc m&aacute;y giặt tốt sẽ trở th&agrave;nh &ldquo;trợ thủ&rdquo; đắc lực cho mỗi gia đ&igrave;nh. V&ograve;ng đời sử dụng thường k&eacute;o d&agrave;i nhiều năm n&ecirc;n người Nhật kh&ocirc;ng ngại chi cho sản phẩm hiệu suất cao. V&igrave; vậy, trong khoảng một thập ni&ecirc;n trở lại đ&acirc;y, hầu hết gia đ&igrave;nh tại Nhật Bản đều ưu &aacute;i d&ograve;ng m&aacute;y giặt cửa trước nhờ những t&iacute;nh ưu việt của sản phẩm. Cụ thể, trong khi m&aacute;y giặt cửa tr&ecirc;n c&oacute; tốc độ quay thường dưới 800 v&ograve;ng/ph&uacute;t th&igrave; chỉ số n&agrave;y ở loại cửa trước c&oacute; thể l&ecirc;n tới 1.200 v&ograve;ng/ph&uacute;t, tạo c&aacute;ch biệt ấn tượng về hiệu quả l&agrave;m sạch s&acirc;u cũng như khả năng hong kh&ocirc;. B&ecirc;n cạnh đ&oacute;, cấu tr&uacute;c quay ly t&acirc;m của m&aacute;y cửa trước khiến quần &aacute;o được đảo đều hơn, kh&ocirc;ng bị xoắn chặt, giảm hư hỏng, nhăn, r&aacute;ch. Mức độ ti&ecirc;u thụ nước lại khi&ecirc;m tốn hơn nhiều. Tối giản l&agrave; tr&agrave;o lưu mới trong thiết kế nội thất hiện đại v&agrave; trở th&agrave;nh phong c&aacute;ch được người Nhật y&ecirc;u th&iacute;ch. Điển h&igrave;nh, những chiếc m&aacute;y giặt đứng đầu thị phần của Panasonic lu&ocirc;n c&oacute; m&agrave;u sắc trang nh&atilde;, thiết kế tinh tế cho nội thất của ng&ocirc;i nh&agrave;. Những m&aacute;y giặt thời thượng, c&ocirc;ng nghệ hiện đại của Panasonic tại Việt Nam cũng c&oacute; hiệu suất hoạt động kh&ocirc;ng thua k&eacute;m g&igrave; sản phẩm thị trường nội địa. C&aacute;c b&agrave; nội trợ Việt c&oacute; thể tham khảo mẹo chọn m&aacute;y giặt của người Nhật để sắm cho gia đ&igrave;nh m&igrave;nh &ldquo;trợ thủ&rdquo; đ&aacute;ng tin cậy, gi&uacute;p quần &aacute;o cả nh&agrave; kh&ocirc;ng chỉ sạch bẩn m&agrave; c&ograve;n sạch cả vi khuẩn.</p>\r\n', 1500, 2, 1, 26, 4, 'Tuan', '2019-06-14 11:11:00', 'Thị trường Nhật Bản', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_2_thumb.jpg?alt=media&token=d32ccd0e-d504-4f43-9a34-f5546eaabb18', 'Người Nhật nổi tiếng cẩn trọng, nên việc chọn đồ gia dụng lại càng không thể qua loa. Đặc biệt, các sản phẩm liên quan đến sức khỏe như máy giặt được bà nội trợ ưu tiên đầu tư.', NULL, '2019-06-19 02:15:02', '2019-06-19 02:15:02'),
(3, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_3_ava.jpg?alt=media&token=6869373b-dd84-4fe1-8c11-b5d2890579eb', '<p>Sau Tết, nhiều mẫu TV được giảm gi&aacute; mạnh, phần lớn nằm trong ph&acirc;n kh&uacute;c cao cấp. Với mức giảm s&acirc;u, đ&acirc;y c&oacute; thể l&agrave; động th&aacute;i xả h&agrave;ng để đ&oacute;n c&aacute;c model mới của năm 2019 sau triển l&atilde;m CES. Ngo&agrave;i ra, thị trường đ&atilde; qua m&ugrave;a mua sắm Tết n&ecirc;n cần những c&uacute; h&iacute;ch lớn để giảm lượng m&aacute;y tồn kho, theo một chuy&ecirc;n gia trong lĩnh vực điện m&aacute;y. Đ&aacute;ng ch&uacute; &yacute; trong đợt giảm gi&aacute; n&agrave;y, những model cao cấp của Samsung như QA55 inch Q7F giảm 21 triệu từ 46,9 c&ograve;n 25,9 triệu đồng, QA 55 inch Q8C giảm 16 triệu từ 51,9 c&ograve;n 35,9 triệu đồng, QA 65 inch Q7F 51,9 triệu đồng c&ograve;n 35,9 triệu đồng hay QA 65 inch Q7F từ 61,9 triệu đồng c&ograve;n 43,9 triệu đồng. Việc h&agrave;ng loạt TV cao cấp giảm gi&aacute; mạnh sau Tết l&agrave; điều c&oacute; thể dự đo&aacute;n trước. Do c&oacute; gi&aacute; cao, những model n&agrave;y chứng kiến sức mua yếu, thậm ch&iacute; ngay cả trong m&ugrave;a mua sắm. Ngo&agrave;i ra, tại triển l&atilde;m thương mại điện tử CES 2019, người ta đ&atilde; chứng kiến nhiều n&acirc;ng cấp ấn tượng cho TV. Đầu ti&ecirc;n phải kể đến ch&iacute;nh l&agrave; xu hướng độ ph&acirc;n giải 8K hứa hẹn mang đến trải nghiệm h&igrave;nh ảnh tối ưu hơn so với 4K. C&ugrave;ng với đ&oacute; l&agrave; những đột ph&aacute; về thiết kế, k&iacute;ch thước m&agrave;n h&igrave;nh, c&ocirc;ng nghệ panel, TV m&agrave;n h&igrave;nh cuộn. Những thiết bị sở hữu c&ocirc;ng nghệ mới nhất n&agrave;y được dự đo&aacute;n sẽ c&oacute; mặt tại Việt Nam ngay trong năm nay. Ngo&agrave;i ph&acirc;n kh&uacute;c cao cấp, nhiều model trong tầm gi&aacute; tr&ecirc;n 10 triệu đồng cũng c&oacute; mức giảm nhẹ để k&iacute;ch cầu người mua. Cụ thể, TV Samsung UA43NU7400 v&agrave; UA49NU7100 giảm c&ograve;n 11,9 v&agrave; 13,6 triệu đồng, Sony 43 inch W660F giảm 2,5 triệu từ 12,29 c&ograve;n 9,7 triệu đồng. Theo h&atilde;ng nghi&ecirc;n cứu IHS Market, Samsung giữ ng&ocirc;i vị số 1 về thị phần TV thế giới với 29%, xếp sau l&agrave; LG 17,5%, Hisense 5,7% v&agrave; TCL 5,6%. Tại Việt Nam, theo GfK, trung b&igrave;nh thị phần 12 th&aacute;ng của năm 2018 đến 19/1/2019 của Samsung trong mảng TV đạt 41,7%, Sony 34,4% v&agrave; LG 14,3%.</p>\r\n', 6000, 2, 0, 13, 6, 'thong', '2019-06-04 11:11:00', 'Nhiều mẫu TV cao cấp giảm giá chục triệu đồng', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_3_thumb.jpg?alt=media&token=6a542c86-e7e6-4305-995d-5771cfba510b', 'Các mẫu TV màn hình 55, 65 inch thuộc phân khúc cao cấp trước đây giảm giá mạnh để dọn kho, chào đón phiên bản 2019.', NULL, '2019-06-19 02:16:39', '2019-06-19 02:16:39'),
(4, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_4_ava.jpg?alt=media&token=3f1dde61-e7fc-4210-a806-1636d067485f', 'Galaxy Buds là mẫu tai nghe không dây mới nhất của Samsung. Model này được tặng kèm khi người dùng đặt mua Galaxy S mới. Dự kiến, hãng sẽ bán ra Galaxy Buds với mức giá 4,5 triệu đồng.\r\nHộp của tai nghe Galaxy Buds được làm nhỏ gọn hơn so với mẫu Gear Icon X. Chiếc hộp này có thiết kế dạng viên thuốc, dùng chất liệu nhựa cho cho cảm giác cầm khá êm tay. Người dùng có thể dễ dàng mang theo tai nghe này khi di chuyển.\r\nTrên hộp của Galaxy Buds có một rãnh nhỏ ở phía trước, người dùng lấy tay đẩy lên để mở nắp. Không thuận tiện bằng cách bấm nút để mở nắp như Gear Icon X.\r\nTai nghe được sạc trực tiếp trên chiếc hộp này. Do có nam châm, nó sẽ hít tai nghe vào vị trí sạc khi người dùng đặt vào hộp.\r\nGiống như Gear Icon X, Galaxy Buds vẫn được trang bị cảm biến hồng ngoại, có thể nhận biết khi người dùng đeo hoặc tháo tai nghe.\r\nĐể dùng tai nghe này, người dùng cần tải ứng dụng Galaxy Wearable (miễn phí trên App Store và Google Play). Giao diện trên ứng dụng này khá đơn giản, người dùng có thể điều chỉnh mức âm lượng hay bộ chỉnh âm từ êm dịu, tăng âm bổng, xem phần trăm pin…\r\nNgười dùng có thể chạm một lần trên tai nghe để dừng bài hát, chạm hai lần để chuyển sang bài kế tiếp, ba lần để quay trở về bài trước.\r\nChiếc tai nghe này có phần đệm được làm bằng chất liệu cao su mềm, tuy nhiên khi đeo trong thời gian dài sẽ có tình trạng đau tai.\r\nTai nghe Galaxy Buds có dung lượng pin 58 mAh, trong khi hộp của thiết bị là 252 mAh. Model này có thời lượng pin khoảng 6 tiếng nghe nhạc liên tục, cao hơn 1 tiếng so với AirPods. Ngoài ra, hộp Galaxy Buds có tính năng sạc không dây chuẩn Qi, người dùng có thể sử dụng Galaxy S10 để sạc cho thiết bị này.\r\nGalaxy Buds sở hữu một thiết kế mềm mại, nhỏ gọn, âm thanh chi tiết, rõ ràng. Bên cạnh đó, với thời lượng pin tốt và giá bán thấp hơn 500.000 đồng so với AirPods, thiết bị hứa hẹn mang một làn gió mới trong thị trường tai nghe không dây.', 7000, 2, 0, 12, 3, 'Sy', '2019-05-03 00:00:00', 'Chi tiết Galaxy Buds - nhỏ gọn, giá rẻ hơn AirPods', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_4_thumb.jpg?alt=media&token=f56fcf0b-32b8-467c-aba5-0eec8076ebfc', 'Galaxy Buds là phiên bản kế nhiệm của mẫu Galaxy Gear Icon X. Thiết bị này có kiểu dáng nhỏ gọn, cải tiến về âm thanh và tích hợp công nghệ sạc không dây.', NULL, '2019-06-19 04:08:41', '2019-06-19 04:08:41'),
(5, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_5_ava.jpg?alt=media&token=9d26f0cd-f9a6-4201-b67c-c888338df3ac', '\"Mày là ai mà nói chuyện với tao như thế? Mày chỉ biết thực hiện những đường chuyền về phía sau mà lên tiếng gì\", Neymar quát vào mặt Draxler. Vụ việc này xảy ra sau khi PSG thua 2-3 trước Montpellier (1/5). Hôm ấy, Draxler chỉ trích Neymar đá rườm rà và cá nhân.\r\n\r\nCả hai suýt đánh nhau nếu Giám đốc thể thao Antero Henrique của CLB không can ngăn. Vài ngày sau, chân sút người Brazil tiếp tục tỏ thái độ không thể chấp nhận. Anh thẳng thừng tuyên bố rất khó chịu với màn trình diễn của những cầu thủ trong đội.', 6500, 1, 1, 7, 4, 'Tuan', '2019-05-10 00:00:00', 'Neymar quát đồng đội: \'Mày là ai mà nói chuyện với tao như thế?\'', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_5_thumb.jpg?alt=media&token=fddccc15-3755-4440-913d-b0c4cbe45d62', 'Tiền đạo Neymar suýt dùng nắm đấm để giải quyết mâu thuẫn với người đồng đội Julian Draxler trong phòng thay đồ.', NULL, '2019-06-19 02:23:26', '2019-06-19 02:23:26'),
(6, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_6_ava.jpg?alt=media&token=182505d9-149b-4565-84c6-bd60e0cd4259', 'Rạng sáng 9/5, 8 người khi đi thang máy tại khách sạn Gims (ở xã Xuân Thới Thượng, huyện Hóc Môn, TP.HCM) thì bị kẹt bên trong. Chủ khách sạn cùng bảo vệ tìm cách mở cửa thang máy nhưng bất thành.\r\nCảnh sát PCCC và cứu nạn, cứu hộ huyện Hóc Môn sau đó cử lực lượng đến hiện trường. Lính cứu hộ dùng kìm chuyên dụng và máy cắt thủy lực phá cửa thang máy và bơm dưỡng khí cho những nạn nhân bên trong.\r\n\r\nSau 30 phút giải cứu, 8 người được đưa ra ngoài an toàn, sức khỏe ổn định. Những vị khách này quê Hà Nội và Hải Phòng, vào Sài Gòn thuê khách sạn ở thì xảy ra vụ việc.', 4500, 1, 0, 25, 6, 'thong', '2019-05-09 00:00:00', 'Giải cứu 8 người kẹt trong thang máy ở Sài Gòn', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_6_thumb.jpg?alt=media&token=91ac9494-7bd4-41aa-a142-d38436826315', 'Nhiều người đi thang máy tại một khách sạn trên quốc lộ 22, huyện Hóc Môn (TP.HCM) đã bị kẹt bên trong hơn nửa giờ.', NULL, '2019-06-19 02:23:50', '2019-06-19 02:23:50'),
(7, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_7_ava.jpg?alt=media&token=77d9a4cf-d08e-42e1-80d5-9c1947abcd52', 'Theo Washington Post, các quan chức Bộ Tư pháp báo con tàu Wise Honest đang tiến vào lãnh hải Mỹ, với sự hỗ trợ của cảnh sát và lực lượng bảo vệ bờ biển Mỹ.\r\n\r\nĐây là lần đầu tiên Mỹ bắt giữ một tàu hàng Triều Tiên do vi phạm các lệnh trừng phạt quốc tế.\r\n\r\n\"Con tàu phá vỡ cách lệnh cấm vận này hiện đã ngưng hoạt động\", ông John Demers, thứ trưởng Bộ Tư pháp, cho biết khi thông báo về vụ bắt giữ.\r\nCon tàu thân đơn với trọng tải 17.600 tấn là một trong những tàu hàng lớn nhất của Triều Tiên, và các quan chức Mỹ cho biết nó được sử dụng để xuất khẩu than ra nước ngoài và nhập máy móc hạng nặng về Triều Tiên.\r\n\r\nNăm ngoái, truyền thông đưa tin cơ quan chức năng Indonesia đã chặn con tàu sau khi nghi ngờ nó vi phạm các biện pháp cấm vận. Phía Mỹ không cho biết có phải Indonesia giao nộp con tàu cho họ hay không.\r\n\r\nBáo cáo của Liên Hợp Quốc hồi tháng 3 cho thấy Triều Tiên có những biện pháp hết sức tinh vi để đưa con tàu hoạt động khắp thế giới, trong đó có việc làm giả hoàn toàn từ giấy đăng kiểm và các tài liệu khác. \r\n\r\nHội đồng Bảo an Liên Hợp Quốc hồi năm 2017 từng thông qua nghị quyết trong đó cấm Triều Tiên xuất khẩu than.\r\n\r\nĐộng thái này đánh dấu sự gia tăng những áp lực của chính phủ Mỹ với Bình Nhưỡng, ngay cả khi Tổng thống Donald Trump có những phát biểu tích cực về nhà lãnh đạo Triều Tiên Kim Jong Un.\r\n\r\nTháng trước, một thẩm phán liên bang ở thủ đô Washington thông qua một loạt các giấy triệu tập, nhắm tới hồ sơ tài chính của các ngân hàng Trung Quốc, thứ có thể cho thấy chính quyền Triều Tiên đã làm như thế nào để lách qua các lệnh trừng phạt với chương trình hạt nhân của họ.\r\n\r\nCác nhà điều tra đang xem xét khả năng một tập đoàn có trụ sở ở Hong Kong đã giúp chính quyền Triều Tiên thoát khỏi các lệnh trừng phạt.\r\n\r\nGiá nhiên liệu ở Triều Tiên hiện vẫn chưa tăng đột biến, chứng tỏ chính quyền Bình Nhưỡng vẫn đang đối phó được với các biện pháp trừng phạt của Mỹ.', 3600, 1, 1, 26, 4, 'Tuan', '2019-05-06 00:00:00', 'Mỹ bắt giữ tàu than cỡ lớn của Triều Tiên vì vi phạm lệnh cấm vận', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_7_thumb.jpg?alt=media&token=3df28e67-0022-485a-8991-06ff1dae841e', 'Lực lượng chức năng Mỹ bắt giữ tàu hàng được Triều Tiên sử dụng để bán than, hành động vi phạm lệnh cấm vận quốc tế đối với Bình Nhưỡng.', NULL, '2019-06-19 02:24:09', '2019-06-19 02:24:09'),
(8, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_8_ava.jpg?alt=media&token=1096881c-49d2-4141-b476-ba4a7faa416d', 'Sau cuộc lội ngược dòng không tưởng trước Barcelona của thiên tài Lionel Messi trên sân Anfield, Liverpool lọt vào trận chung kết Champions League năm thứ hai liên tiếp. Tương tự, Tottenham Hotspur cũng đã loại Ajax Amsterdam sau một trận đấu điên rồ ở sân Johan Cruijff Arena. \r\nVới kết quả này, chắc chắn Liverpool và Tottenham sẽ có trong tay những khoản thưởng rất đậm. Theo báo Mirror, tổng số tiền UEFA phân chia cho các câu lạc bộ dự Champions League mùa giải 2018/2019 tăng 54% so với mùa giải trước, lên đến 1,950 tỷ Euro (2,19 tỷ USD). \r\nUEFA cho biết mỗi CLB lọt vào vòng bảng Champions League được lĩnh 15,25 triệu Euro (17,1 triệu USD). Tiền thưởng cho mỗi trận thắng ở vòng bảng là 2,7 triệu Euro (3,03 triệu USD), mỗi trận hòa là 900.00 Euro (1,01 triệu USD). \r\n\r\nVượt qua vòng bảng, một CLB nhận 9,5 triệu Euro (10,6 triệu USD). Lọt vào tứ kết, đội bóng được thưởng thêm 10,5 triệu Euro (11,78 triệu USD). Số tiền thưởng lọt vào bán kết là 12 triệu Euro (13,47 triệu USD) còn tiền thưởng lọt vào chung kết là 15 triệu Euro (16,48 triệu USD). \r\n\r\nĐội chiến thắng trong trận chung kết Champions League nhận thêm 4 triệu Euro (4,49 triệu USD). Theo tính toán sơ bộ, Liverpool đã kiếm được tổng cộng 107 triệu Euro (120 triệu USD) nhờ lọt vào trận chung kết Champions League mùa giải 2018/2019. \r\nCon số này cao hơn hẳn mức 81 triệu Euro (90,97 triệu USD) đội bóng thành phố cảng Liverpool nhận được hồi năm ngoái. Nếu chiến thắng trong trận chung kết ở Madrid, Liverpool sẽ nhận tổng cộng 111 triệu Euro (124,6 triệu USD). \r\n\r\nKém hơn Liverpool một chút, nhưng Tottenham cũng thắng đậm về phương diện tài chính. Lọt vào chung kết, đội bóng thành London nhận 102 triệu Euro (114,5 triệu USD), vượt rất xa mức 61 triệu Euro (76,3 triệu USD) hồi năm ngoái. Nếu đánh bại Liverpool, Tottenham sẽ hưởng tổng cộng 106 triệu Euro (119 triệu USD). ', 5680, 2, 1, 7, 4, 'Tuan', '2019-05-10 00:00:00', 'Vào chung kết Champions League, Liverpool và Tottenham lĩnh thưởng đậm', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_8_thumb.jpg?alt=media&token=a1e86688-c096-4949-a2c9-e3482d3bf34c', 'Xuất sắc lọt vào đến trận chung kết Champions League mùa giải 2018/2019, hai đội bóng Anh Liverpool và Tottenham Hotspur nhận khoản tiền thưởng lên tới hơn 100 triệu USD.', NULL, '2019-06-19 02:24:38', '2019-06-19 02:24:38'),
(9, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_9_ava.JPG?alt=media&token=c4fe883c-6f99-407d-96a5-fc40ae05c1bb', 'Mai Kỳ Hân (sinh năm 1995) là mẫu lookbook nổi tiếng trong giới trẻ Sài Thành. Cô sở hữu chiều cao 1,57m cùng gương mặt tròn bầu bĩnh, gò má cao, đôi mắt to long lanh và thần thái như mẫu chuyên nghiệp. Hiện trang cá nhân của 9X có hơn 84.000 lượt theo dõi.\r\nSo với dàn mẫu ảnh phải đóng khung vào một phong cách duy nhất, Hân lại thử sức với nhiều hình ảnh khác nhau, từ sporty chic, nữ tính, sang trọng hay cá tính phá cách. Cô từng chia sẻ mình ăn mặc rất ngẫu hứng và đa dạng. Ngoài ra, khi so sánh với những cô nàng chân dài khác, 9X lại thấy chiều cao của mình đã đủ dùng.  \"Nếu được cao thêm và có duyên thì Hân sẽ thử catwalk. Còn trẻ mà, nếu có cơ hội thì cứ \'tới\' thôi. Nhưng giờ đã đủ xài rồi\", cô hài hước nói.\r\nHiện tại, Kỳ Hân đang hạnh phúc bên bạn trai Long Trần. Tháng 8/2018, cả hai rời Sài Gòn, lên Đà Lạt sinh sống, mở homestay và tiệm cà phê. 9X từng chia sẻ với Zing.vn: \"Hai đứa thích Đà Lạt lắm. Ngày trước cứ xong việc lại rủ nhau lên đây chơi. Giờ thích nên ở lại đây luôn\". ', 9000, 1, 1, 5, 6, 'thong', '2019-05-09 00:00:00', 'Dàn hot girl nấm lùn: Không gợi cảm quyến rũ cũng ngọt ngào đáng yêu', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_9_thumb.jpg?alt=media&token=80db349a-5840-460a-b588-9787164844cc', 'Những cô nàng này sở hữu cho mình phong cách riêng. Điểm chung của họ là có chiều cao khiêm tốn và được nhiều người ưu ái đặt cho biệt danh \"hot girl nấm lùn\".', NULL, '2019-06-19 02:32:26', '2019-06-19 02:32:26'),
(10, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_10_ava.jpg?alt=media&token=9370368c-1c42-40bc-a581-94106c07e5cc', 'Nguyễn Huy Phúc ghi dấu ấn trong lòng nhiều người theo dõi cuộc thi hùng biện Socrates 2019 do ĐH Luật Hà Nội tổ chức gần đây.\r\n\r\nTại đêm chung kết, nam sinh nhiều lần khiến hội trường đồng loạt vỗ tay với phong cách diễn thuyết tự tin, ngôn từ sắc sảo, tư duy mạch lạc và nhấn nhá đầy cảm xúc.\r\n\r\nKhi tranh biện về chủ đề \"Công khai danh tính thí sinh gian lận điểm thi THPT quốc gia\" hay chia sẻ quan điểm cá nhân về \"Một ngày vắng luật\", Huy Phúc đều thuyết phục được ban giám khảo và khán giả. \r\n\r\nNhờ đó, cậu vượt qua 7 ứng cử viên khác để trở thành quán quân cuộc thi năm nay.\r\n\'Cây hùng biện\' của ĐH Luật Hà Nội\r\nNhiều người khâm phục Huy Phúc ở sự ham học hỏi cùng quyết tâm khi biết năm 2018, cậu từng tham gia Socrates 2018 và dừng chân ở top 8.\r\n\r\nĐộng lực để nam sinh một lần nữa đặt bút đăng ký tham gia cuộc thi là lời hứa với một cô giáo làm cố vấn chuyên môn. Bên cạnh đó, 9X tự nhủ khi đặt ra mục tiêu nào đó, cậu muốn thực hiện được.\r\n\r\nSau một năm tích lũy kiến thức, kinh nghiệm, chuẩn bị về kỹ năng và cách tư duy, Huy Phúc tự tin thể hiện những gì bản thân đang có. Giải cao nhất là \"quả ngọt\" cho nỗ lực của 9X.\r\n\r\n\"Đến giờ, mình vẫn thấy vui, hào hứng, đồng thời cũng lo lắng về trách nhiệm khi giành danh hiệu quán quân. Bởi từ nay, hình ảnh, tiếng nói của mình phần nào có tác động đến các bạn sinh viên khác trong trường. Mình tự nhủ phải cố gắng nói đi đôi với làm\", Phúc chia sẻ với Zing.vn.\r\nKhông phải tới khi trở thành quán quân Socrates 2019 Huy Phúc mới được chú ý ở trường. Trước đó, nam sinh năm 3 khoa Pháp luật Kinh tế, ĐH Luật Hà Nội đã sở hữu bảng thành tích ấn tượng.\r\n\r\nPhúc đảm nhận vị trí chủ tịch CLB Tranh biện Veritas của ĐH Luật Hà Nội, quán quân cuộc thi Diễn án 2017 Cerca Trova Mock Trial Contest, quán quân cuộc thi Challenge Of Law 2018, quán quân cuộc thi Trí tuệ đỉnh cao The Olympus 2018, giải nhì cuộc thi Sinh viên nghiên cứu khoa học ĐH Luật Hà Nội 2018, giải ba Hội nghị sinh viên nghiên cứu khoa học về Sở Hữu trí tuệ năm 2018 của Bộ Khoa học và Công nghệ, Break Adjudicator tại Giải vô địch tranh biện Quốc gia 2018...\r\n\r\nBên cạnh đó, cậu còn làm huấn luyện viên, giám khảo cho một số cuộc thi tranh biện trong và ngoài trường đại học.\r\n\r\nNhờ thành tích cùng kinh nghiệm dày dặn tại các cuộc thi diễn thuyết, Huy Phúc được mệnh danh là \"cây hùng biện\" của ĐH Luật Hà Nội.\r\nTự tập nói trước gương, xem tổng thống Mỹ thuyết trình để học hỏi\r\nKhi được hỏi bí quyết để tự tin diễn thuyết trước đông người, Huy Phúc nói cậu không có cách gì đặc biệt.\r\n\r\nTheo quán quân Socrates 2019, người thuyết trình phải hiểu về vấn đề mình sẽ nói và phải tin tưởng bản thân thì mới đủ sức thuyết phục người đối diện. \r\nỞ nhà, Phúc thường tự đứng trước gương thuyết trình, dạy cháu học, thuyết phục chị gái cho đi chơi hay mua món đồ nào đó. Với cậu, luyện nói từ những người gần gũi và điều nhỏ nhặt nhất là cách làm đơn giản, hiệu quả.\r\n\r\nBên cạnh đó, nam sinh trường Luật thích lắng nghe câu chuyện của mọi người và cố gắng dùng lý lẽ, tình cảm nói sao cho họ cũng thích nghe mình trình bày.\r\n\r\nMôi trường rèn luyện đối với Phúc cũng rất quan trọng. Với tư cách chủ tịch CLB tranh biện của trường, cậu cùng các thành viên tạo cho nhau môi trường mà các cá nhân được nói lên điều mình nghĩ, tư duy, không sợ bị phán xét.\r\n\r\nHuy Phúc thích xem phần diễn thuyết của các chính khách như ông Barack Obama, Tổng thống Mỹ Donald Trump. Từ những người có phong cách thuyết trình khác biệt, cậu sẽ tổng hợp lại để học hỏi những cái hay của họ, đồng thời hạn chế cái không phù hợp với mình.\r\n\r\n\"Mình chỉ muốn được mọi người biết đến là Huy Phúc. Họ quan tâm Huy Phúc thực sự có gì, khả năng của Huy Phúc tới đâu, chứ không phải những thành tích mình đã đạt được. Mình cũng mong những người có tiếng nói và sức ảnh hưởng hãy dùng những điều đó để tác động lên những giá trị tích cực cho xã hội\", chàng trai 20 tuổi nói.', 4600, 2, 1, 25, 3, 'Sy', '2019-05-09 00:00:00', '9X Nghệ An học gì từ tổng thống Mỹ để trở thành quán quân hùng biện?', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_10_thumb.jpg?alt=media&token=d680ac58-08b0-4a73-83fa-3776f3ae699c', 'Nguyễn Huy Phúc (20 tuổi, quê Nghệ An) là gương mặt nổi bật tại ĐH Luật Hà Nội. Nam sinh mới đây có chiến thắng thuyết phục khi tham gia cuộc thi hùng biện \"Socrates 2019\".', NULL, '2019-06-18 23:27:32', '2019-06-18 23:27:32'),
(11, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_11_ava.jpg?alt=media&token=0615b5f0-743c-45a4-bb11-4fbb53e1c4f2', 'Tối ngày 9/5, toàn bộ các kênh truyền thông của Nhật Cường Mobile gồm fanpage Facebook và website đều không thể truy cập được. Cùng ngày, hàng chục cảnh sát của Bộ Công an xuất hiện tại nhiều cửa hàng điện thoại Nhật Cường Mobile tại Hà Nộ để khám xét.\r\n\r\nHai website chính kinh doanh thiết bị của Nhật Cường Mobile gồm nhatcuong.com.vn và dienthoaididong.com đều không thể truy cập bình thường. Tuy vậy, trang web và tài khoản mạng xã hội của Nhật Cường Software, mảng dịch vụ công nghệ của công ty vẫn hoạt động.\r\nBên cạnh đó, trang Facebook Nhật Cường Mobile với hơn 400.000 lượt theo dõi cũng tạm đóng từ tối ngày 9/5.\r\n\r\nTrong sáng 9/5, sau khi thông tin Nhật Cường Mobile bị khám xét, toàn bộ đường dây nóng của chuỗi cửa hàng này đều tạm khóa.\r\n\r\nViệc mất liên lạc với toàn bộ kênh truyền thông của Nhật Cường khiến nhiều khách hàng không khỏi lo lắng.\r\n\r\n\"Tôi thực sự rất hoang mang\", chị Hà Phương (Hà Nội) chia sẻ. Chị cho biết gia đình đã mua khá nhiều thiết bị điện tử tại hệ thống này. Chị cũng băn khoăn nếu trường hợp máy móc phát sinh hỏng hóc, việc bảo dưỡng, bảo hành sản phẩm sẽ ra sao.\r\n\r\n\"Tôi còn mua một vài gói hậu mãi ở đây nữa, nếu công ty có vấn đề gì thì khách hàng có được hoàn tiền những dịch vụ chưa sử dụng không?\", chị nêu câu hỏi.\r\n\r\nTheo nguồn tin ban đầu từ VTV, công ty Nhật Cường đang bị điều tra về hành vi có dấu hiệu buôn lậu.\r\n\r\nKênh liên lạc duy nhất còn tìm kiếm được trên Facebook là dịch vụ chuyên sửa chữa của đơn vị này.\r\nCông ty TNHH Thương mại và Dịch vụ kỹ thuật Nhật Cường được thành lập năm 2001. Năm 2017, doanh nghiệp nằm trong danh sách 50 công ty về công nghệ thông tin lớn nhất Việt Nam.\r\n\r\nNhật Cường có 9 cửa hàng phân bố khắp Hà Nội. Giấy phép kinh doanh của doanh nghiệp do Sở Kế hoạch và Đầu tư Hà Nội cấp ngày 20/6/2001.\r\n\r\nNgười đại diện pháp luật là ông Bùi Quang Huy, ngành nghề kinh doanh chính là bán buôn thiết bị và linh kiện điện tử, viễn thông.', 2300, 1, 0, 12, 3, 'Sy', '2019-05-07 00:00:00', 'Các kênh của Nhật Cường Mobile biến mất trên Internet', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_11_thumb.jpg?alt=media&token=fe4eea2c-d9a4-472e-b700-6f95f83eadf0', 'Sau khi nhiều cửa hàng bị khám xét, công ty Nhật Cường đã đóng toàn bộ trang web, mạng xã hội liên quan đến mảng kinh doanh thiết bị.', NULL, '2019-06-18 23:30:47', '2019-06-18 23:30:47'),
(12, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_12_ava.jpg?alt=media&token=408987a6-ca05-44f3-9641-a0acfd0f0bd4', 'Sau những báo cáo về lỗi xuất hiện trên một số mẫu Galaxy Fold bản thử nghiệm, Samsung đã hoãn ra mắt thiết bị này trong tháng 4. Nhiều khả năng, ngày 10/5 là thời điểm hãng công nghệ Hàn Quốc chính thức công bố kế hoạch mới cho smartphone màn hình gập đầu tiên của mình.\r\n\r\nPhát biểu trên tờ Korea Herald hôm 9/5, CEO Dong-jin Koh (hay còn gọi là DJ Koh) cho biết Samsung \"đã xem xét lỗi do các chất (xâm nhập vào thiết bị) và chúng tôi sẽ đưa ra kết luận (về việc ra mắt) vào hôm nay hoặc ngày mai\".\r\nKhi được hỏi liệu Galaxy Fold có kịp ra mắt trong tháng 5 hay không, ông Dong-jin Koh trả lời rằng: \"Chúng tôi sẽ không để quá muộn\". Nếu không kịp tung ra sản phẩm trước ngày 31/5, Samsung sẽ buộc phải hủy đơn hàng.\r\n\r\nVào ngày 7/5, Reuters dẫn nguồn tin chính thức từ Samsung cho biết chưa thể xác nhận có kịp giao Galaxy Fold cho khách hàng tại Mỹ vào ngày 31/5 hay không. Công ty gửi lời xin lỗi đến khách hàng và thông báo đơn hàng sẽ tự động hủy nếu không ra mắt đúng hẹn. Trước đó, người dùng Mỹ có thể đặt mua smartphone màn hình gập này từ ngày 15/4 với giá lên đến 1.980 USD.\r\n\r\nSamsung đã lên kế hoạch ra mắt Galaxy Fold vào ngày 26/4. Tuy nhiên, chỉ ít ngày trước khi diễn ra sự kiện, các phóng viên và reviewer đã phát hiện ra sự cố về màn hình. Lỗi trong thiết kế khiến cho bụi dễ dàng lọt vào khoảng hở giữa 2 phần màn hình, dẫn đến phồng, thậm chí là chảy mực.\r\n\r\nÔng Dong-jin Koh cho biết hãng đã hoàn thành thử nghiệm nội bộ trên những nguyên mẫu bị lỗi và đã có những thay đổi trong sản xuất để ngăn ngừa sự cố xảy ra. Galaxy Fold sẽ tiếp tục được gia tăng độ bền bản lề, giảm khoảng trống giữa giữa khung và lớp phủ bảo vệ để ngăn bụi bẩn xâm nhập.', 6700, 1, 1, 12, 3, 'Sy', '2019-05-09 00:00:00', 'Ngày mai, Samsung sẽ định đoạt \'số phận\' của Galaxy Fold', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_12_thumb.jpg?alt=media&token=226702e6-9434-4b32-939c-56046ab4c1c7', 'Samsung sẽ công bố thông tin chi tiết về tương lai của smartphone màn hình gập Galaxy Fold vào ngày 10/5.', NULL, '2019-06-18 23:31:10', '2019-06-18 23:31:10'),
(13, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_13_ava.jpg?alt=media&token=8a062f40-5e62-405b-940d-8eff8429132c', '\"Tương lai sẽ được bảo mật\", Mark Zuckerberg tuyên bố tại hội nghị F8 tuần trước. Nhưng những động thái từ phía CEO Google, ông Sundar Pichai, cho thấy thông điệp của Google tại sự kiện I/O rõ ràng hơn nhiều: bảo mật ngay từ bây giờ.\r\nVấn đề bảo mật là chủ đề chính được nhắc tới tại hội nghị của cả hai ông lớn công nghệ. Tuy nhiên, trái ngược với những bản cập nhật hơi mơ hồ của Facebook, Google cho thấy họ đã sẵn sàng xuất xưởng các sản phẩm mới của mình. Điều này thể hiện rõ hơn sự đối lập trong chiến lược của hai công ty.\r\nTất cả mọi người đều muốn được bảo mật, tuy nhiên lời hứa và những gì nhận được lại vô cùng khác nhau. Người dùng xứng đáng được cải thiện chất lượng phần mềm và phần cứng để gia tăng trải nghiệm từ những dữ liệu mà họ cung cấp, chứ không phải để nhận các tiện ích bổ sung và quảng cáo mà chẳng ai yêu cầu.\r\n\r\nTại hội nghị F8 vào tuần trước, chúng ta được nghe từ Zuckerberg rằng \"quyền riêng tư cho chúng ta tự do là chính mình\" và Facebook đã làm tốt điều đó thông qua cách thức mà nó lưu trữ thông tin.\r\n\r\nTuy nhiên, ngoài việc Messenger và Instagram Direct được mã hóa, Facebook vẫn còn đang nợ người dùng rất nhiều tính năng mà công ty này đã công bố trước đó như: Xóa lịch sử truy cập ngoài (Clear History) hay dự án truyền tải dữ liệu (Data Transfer Project).\r\n\r\nTất cả những gì mà người dùng nhận được đó là câu đùa gượng gạo của Zuckerberg: \"Tôi biết hiện tại Facebook không có đủ uy tín để nói về quyền riêng tư\".\r\nTháng 3, Facebook thừa nhận hàng triệu mật khẩu của người dùng không được mã hóa. Tháng 4, người dùng lại được phen hoang mang khi biết tin Facebook tiếp tục dính vào khủng hoảng để lộ 1,5 triệu email. Trước đó, Facebook thừa nhận vào tháng 9/2018 rằng dữ liệu của 30 triệu tài khoản bị tin tặc đánh cắp.\r\n\r\n\"Tương lai là bảo mật\" vẫn còn là một lời hứa mơ hồ còn quá khứ đầy u ám của Facebook đã khiến dư luận mất lòng tin. Trong khi đó tại hội nghị I/O của Google, CEO Pichai cùng những bản thử nghiệm mới đã cho chúng ta thấy \"Google vẫn chưa hoàn tất những công việc liên quan đến vấn đề bảo mật. Và sẽ luôn tiếp tục để bắt kịp những kì vọng của người dùng\".\r\nGoogle đã từ bỏ việc sử dụng thông tin từ Gmail để định hướng quảng cáo, cũng như thay đổi việc cho phép bất kì nhà phát triển nào truy cập vào email cá nhân của người dùng. Mặc dù vẫn còn những bê bối được dư luận chú ý, những Google đã đối mặt trực diện với vấn đề và sữa chữa.\r\n\r\nTrong khi ông chủ Facebook còn mải mê đưa ra những tuyên bố của mình trên sân khấu, Google đã có những bản cập nhật âm thầm giúp cải thiện quyền riêng tư và bảo mật. Như việc cho phép thiết bị android trở thành một \"chìa khóa vật lý\" hay tính năng tự động xóa các hoạt động của người dùng trên web và ứng dụng sau từ 3 đến 18 tháng.', 7532, 1, 1, 12, 3, 'Sy', '2019-05-01 00:00:00', 'Khi Facebook còn \'chém gió\', Google đã bắt tay vào làm', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_13_thumb.jpg?alt=media&token=d05c4c78-8c30-41c3-8155-d505ba5e3804', 'Android Q với hơn 50 tính năng bảo mật mới, khả năng xử lý dữ liệu ngay tại thiết bị hay các chế độ ẩn danh sắp ra mắt là câu trả lời của Google cho vấn đề bảo mật.', NULL, '2019-06-18 23:31:42', '2019-06-18 23:31:42'),
(14, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_14_ava.jpg?alt=media&token=09bd92f9-96b9-4704-9e9b-1cecc1f7d664', 'Sáng 9/5, hàng chục cảnh sát của Bộ Công an xuất hiện tại cửa hàng điện thoại Nhật Cường mobile ở 33 Lý Quốc Sư, Hoàn Kiếm, Hà Nội. Theo ghi nhận của Zing.vn, ngoài các xe biển trắng đỗ trước cửa hàng còn có xe của lực lượng CSCĐ (Công an Hà Nội). Sau khi khám xét, các thùng hàng được lên ôtô .\r\n\r\n12h45, khoảng 20 cảnh sát rời khỏi cửa hàng Nhật Cường Mobile ở 33 Lý Quốc Sư. Lúc này, cửa hàng đóng cửa, tắt đèn, ngừng giao dịch.\r\nTại cơ sở ở phố Giảng Võ, từ 10h, cảnh sát cũng khám ở đây. Đến gần 13h, một nhóm cảnh sát vẫn làm việc bên trong. Nhân viên cửa hàng cũng có mặt tại đây.\r\n\r\nCác nhân viên quán ăn bên cạnh cho biết từ 9h, cửa hàng đã đóng cửa, không mở như ngày thường.\r\n\r\nSau khi cảnh sát rời đi, một nữ nhân viên cho biết cửa hàng C4 Giảng Võ sẽ tiếp tục làm việc bình thường từ chiều 9/5. Các nhân viên từ chối trả lời khi phóng viên hỏi cảnh sát thu giữ những gì.\r\n\r\nTại cơ sở 214 Nguyễn Văn Cừ (Long Biên), theo người dân khoảng 12h lực lượng cảnh sát khám xét, đến 13h10 rời khỏi cửa hàng và thu giữ một số thùng hàng. Cửa hàng vẫn mở cửa sắt nhưng khóa cửa kính, bên trong còn một vài nhân viên bảo vệ.\r\n\r\nCũng trong sáng nay, cảnh sát còn khám xét nhiều cửa hàng khác trong hệ thống của Công ty TNHH Thương mại & Dịch vụ kỹ thuật Nhật Cường.\r\nCông ty TNHH Thương mại và Dịch vụ kỹ thuật Nhật Cường được thành lập năm 2001. Năm 2017, doanh nghiệp nằm trong danh sách 50 công ty về công nghệ thông tin lớn nhất Việt Nam.\r\n\r\nNhật Cường có 9 cửa hàng phân bổ khắp Hà Nội. Giấy phép kinh doanh của doanh nghiệp do Sở Kế hoạch và Đầu tư Hà Nội cấp ngày 20/6/2001.\r\n\r\nNgười đại diện pháp luật là ông Bùi Quang Huy, ngành nghề kinh doanh chính là bán buôn thiết bị và linh kiện điện tử, viễn thông.', 2600, 1, 1, 25, 3, 'thong', '2019-05-09 00:00:00', 'Bộ Công an khám xét đồng loạt hệ thống cửa hàng Nhật Cường Mobile', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_14_thumb.jpg?alt=media&token=80753992-8449-49ba-904f-6e6db42c2a16', 'Sáng nay, nhiều cửa hàng của Nhật Cường Mobile ở các phố Chùa Bộc, Xuân Thủy, Láng Hạ, Giảng Võ (Hà Nội) bất ngờ đóng cửa. Hàng chục cảnh sát xuất hiện thực hiện khám xét.', NULL, '2019-06-18 23:32:29', '2019-06-18 23:32:29'),
(15, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_15_ava.jpeg?alt=media&token=00340513-5e2f-4e57-8293-db410aec03fc', 'Trong mỗi mùa giải, các CĐV Arsenal luôn có một ngày lễ đặc biệt, đó là St. Totteringham\'s Day, ngày mà các Gooners mở tiệc, ăn mừng khi đội bóng của họ chính thức xếp trên đại kình địch Tottenham Hotspurs trên bảng xếp hạng sau khi mùa giải khép lại. \r\n\r\nThế nhưng, trong 2 mùa bóng gần nhất, bữa tiệc này đã không còn xuất hiện. Tottenham đang có những bước tiến vượt bậc để qua mặt Arsenal, trở thành thế lực mới không chỉ tại London, mà trên toàn châu Âu.\r\n2019 gần như chắc chắn sẽ là năm thứ 3 liên tiếp St. Totteringham\'s Day không thể diễn ra. Arsenal càng cay đắng hơn khi giờ đây, họ còn phải nhìn đại kình địch có cơ hội lên ngôi tại giải đấu danh giá nhất châu Âu cấp câu lạc bộ sau 90 phút kiên cường trước Ajax Amsterdam.\r\nTrong quá khứ, \"Pháo thủ\" nổi tiếng với truyền thống phát hiện và đào tạo ra nhiều cái tên tài năng của làng bóng đá thế giới. Từ thế hệ của Tony Adams tới những Jack Wilshere, Arsenal chưa bao giờ là một đội bóng thiếu đi những \"mầm non\" chất lượng. \r\n\r\nThậm chí, cả những cái tên không xuất thân từ lò đào tạo đội bóng như Thierry Henry, Patrick Vieira, Kolo Toure đều chỉ là những cầu thủ trẻ, ít tên tuổi trước khi được đội bóng phát hiện và nâng tầm để trở thành những huyền thoại vĩ đại trong lịch sử đội bóng. \r\nSau khi xây sân Emirates, do hoàn cảnh tài chính khó khăn, Arsenal buộc phải \"thắt lưng buộc bụng\" và sử dụng đội hình gồm nhiều cầu thủ trẻ. Thời điểm đó, họ bị gọi với cái tên mỉa mai là \"Những đứa trẻ nhà Wenger\".\r\n\r\nNhững đứa trẻ đó trải qua 9 năm trời ròng rã không một chức vô địch, những đứa trẻ đó có thể đưa người hâm mộ lên mây xanh với những màn trình diễn nức lòng nhưng ngay lập tức cũng có thể kéo họ xuống tận cùng của sự thất vọng. \r\n\r\nMột Arsenal không có ngôi sao, một Arsenal không có danh hiệu, một Arsenal ngây thơ và khó hiểu...\r\n\r\nThế nhưng, đội bóng này lại chẳng bao giờ thiếu đi sự ủng hộ từ phía người hâm mộ. Chính sự \"ngây thơ\" trong lối chơi, chính những cái tên trưởng thành từ lò đào tạo đội bóng đã trở thành thỏi nam châm hút người hâm mộ tới sân Emirates mỗi dịp cuối tuần. ', 7800, 1, 1, 7, 4, 'Tuan', '2019-05-09 00:00:00', 'Nhìn Tottenham thành công, Arsenal có cảm thấy xấu hổ?', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_15_thumb.jpg?alt=media&token=c2ac65bd-1d35-40ec-8e2b-170045093f6a', 'Tottenham Hotspurs, đội bóng luôn là trò cười cho các CĐV Arsenal sau mỗi mùa giải vừa có màn lật đổ ngoạn mục để lọt tới chung kết Champions League. Còn Arsenal, họ đang ở đâu?', NULL, '2019-06-18 23:32:42', '2019-06-18 23:32:42'),
(16, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_16_ava.jpg?alt=media&token=ee94d023-897c-4a45-b0d0-0d403aa17ac7', 'Trả lời Sky Sport Italy, Giám đốc điều hành của Ajax, Edwin Van der Sar khẳng định mùa giải chưa kết thúc với Ajax dù bị loại khỏi Champions League. Đội bóng Hà Lan vẫn còn 2 trận đấu tại giải VĐQG Hà Lan để quyết định chức vô địch.\r\n\r\n\"Tôi nghĩ đó sẽ là những trận cuối cùng của De Ligt trong màu áo Ajax. Tôi mong cậu ấy sẽ ngẩng cao đầu rời Ajax. De Ligt đã ở đây từ khi còn là một đứa trẻ và sẽ chơi cho một CLB lớn. Tôi nghĩ cậu ấy sẽ tới Anh hoặc Tây Ban Nha\", Van der Sar nói.\r\nTheo báo chí châu Âu, bến đỗ tiềm năng nhất của De Ligt là Barcelona. CLB Tây Ban Nha đã sớm chiêu mộ người đồng đội thân thiết của De Ligt là tiền vệ Frenkie De Jong. \r\n\r\nTuy nhiên, Liverpool cũng đang dần trở thành một trong những đội có lợi thế sở hữu De Ligt. Huyền thoại Ajax, Ronald De Boer thừa nhận với Balls.ie rằng Liverpool rất muốn có De Ligt.\r\n\r\nViệc đội trưởng ĐT Hà Lan, Virgil Van Dijk đang thi đấu cho Liverpool khiến đây trở thành bến đỗ hấp dẫn của De Ligt. Mức giá của De Ligt theo Transfermarkt đang là 63 triệu bảng.\r\n\r\nSau khi bị Tottenham loại khỏi Champions League, Ajax vẫn còn giải VĐQG Hà Lan để phấn đấu. Đội bóng của De Ligt đang đứng đầu BXH với 80 điểm, bằng điểm đội đứng nhì là PSV Eindhoven nhưng có hiệu số tốt hơn.\r\n\r\nHai trận đấu cuối cùng của Ajax là trước FC Utrecht trên sân nhà và De Graafschap trên sân khách. Ajax đã 5 năm không vô địch Hà Lan.', 5623, 1, 1, 7, 4, 'Tuan', '2019-05-10 00:00:00', 'Van der Sar tiết lộ bến đỗ mới của đội trưởng Ajax', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_16_thumb.jpg?alt=media&token=dcb20405-2977-48e5-808a-309c1caf8c50', 'Tương lai của Matthijs De Ligt đã được quyết định ngay sau khi Ajax bị Tottenham loại cay đắng khỏi bán kết UEFA Champions League.', NULL, '2019-06-18 23:33:06', '2019-06-18 23:33:06'),
(17, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_17_ava.jpg?alt=media&token=32076b3e-c6f6-4fdf-bdf5-0ca5b0daf46a', 'Avengers: Endgame là bom tấn thay đổi cục diện tương lai của vũ trụ điện ảnh Marvel. Iron Man và Black Widow hi sinh. Captain America nghỉ hưu và trao chiếc khiên biểu tượng của Đại úy Mỹ cho Falcon. Thor lưu lạc vũ trụ cùng Đội Vệ binh dải ngân hà. Số phận của hầu hết siêu anh hùng cốt cán của biệt đội Avengers đã rõ. Nhưng còn Bruce Banner/Hulk, tương lai của anh sẽ ra sao hậu trận chiến sinh tử trong Endgame?\r\n\r\nHulk là người đã mạo hiểm mạng sống của mình để búng tay, hồi sinh một nửa sinh linh vũ trụ. Sau khi du hành thời gian thành công, đội Avengers đã thu thập đủ 6 viên đá Vô cực. Họ cần một siêu anh hùng đủ khỏe để chịu đựng được sức mạnh siêu cường của 6 viên đá, khi chúng được đặt trên phiên bản Găng tay Vô cực do Tony Stark chế tạo.\r\n\r\nTrong khi Thor chìm đắm trong nỗi mặc cảm và đau buồn, Hulk đã thay anh đảm nhận nhiệm vụ nguy hiểm này. Anh búng tay thành công. Đổi lại, sức mạnh của 6 viên đá đã hủy hoại gần như toàn bộ một cánh tay của Người khổng lồ xanh.\r\nTheo tờ Cinema Blend, bộ đôi đạo diễn nhà Russo vừa xác nhận một sự thật đau lòng về vết thương của Hulk: “Anh ấy đã mất đi một cánh tay, mất đi Natasha Romanoff (Black Widow), không gì có thể cứu vãn được. Anh ấy đã tự tổn thương mình. Vết thương đó có thể sẽ kéo dài vĩnh viễn, giống như vết thương mà Thanos phải chịu đựng suốt quãng thời gian còn lại sau cú búng tay trong Infinity War”.\r\n\r\nAnh em nhà Russo nhấn mạnh rằng rất khó để có thể chữa lành vết thương cho Hulk. Nếu người hâm mộ chú ý kỹ, họ có thể thấy cánh tay của anh gầy hơn và sẫm màu hơn sau khi hoàn thành nhiệm vụ trên. Vì vậy, sức mạnh của Người khổng lồ xanh sẽ không còn được như trước.\r\n\r\nHulk là một trong những siêu anh hùng của biệt đội Avengers cũ còn đứng vững sau trận chiến cuối với Thanos. Vì vậy, người hâm mộ hi vọng anh sẽ là nhân vật chủ chốt trong Giai đoạn 4 của MCU. Nhưng nếu hành trình của Hulk tiếp tục thì có lẽ, anh vẫn sẽ phải mang thương tật đó suốt đời.\r\nTuy nhiên, đạo diễn Joe Russo cũng mở ra một tia hi vọng về tương lai của Hulk. Chia sẻ với trang ComicBook, ông cho biết khái niệm “vĩnh viễn” trong vũ trụ điện ảnh Marvel chỉ mang tính tương đối. Rất có thể, trong một thế giới phép thuật với khoa học tiên tiến nào đó, vết thương của Hulk sẽ được cải thiện. Tất nhiên, quá trình chữa trị sẽ rất phức tạp, không đơn thuần chỉ là băng bó và bôi thuốc như chúng ta vẫn thường làm. Vết thương thể xác có thể được chữa lành nhưng những tổn thất về sức mạnh và tinh thần sẽ không thể biến mất hoàn toàn.\r\n\r\n“Sẽ có ai đó giúp Hulk chữa trị vết thương. Hoặc sẽ có ai đó trao cho anh ấy một cánh tay mới. Tôi chưa có ý tưởng gì về nơi và người sẽ mang đến phép màu cho Hulk. Chúng tôi chưa cần chú ý đến chuyện sự việc sẽ đi đến đâu. Chúng tôi chỉ đang cố gắng mang đến một kết cục thỏa đáng nhất”, đạo diễn Joe Russo bổ sung thêm.\r\n\r\nÔng đang cố gắng tạo ra mối liên hệ giữa cánh tay bị thương của Hulk và sự hi sinh của Black Widow. Cả hai có cùng điểm chung, đó là đều để lại nỗi đau khó nguôi ngoai. Một bên để lại nỗi đau về thể xác. Một bên để lại nỗi đau về tinh thần. Mặc dù mối quan hệ với Bruce Banner và Natasha Romanoff chưa bao giờ được khai thác sâu trong suốt chặng đường 11 năm của Marvel nhưng rõ ràng, họ có tình cảm. Và Hulk sẽ phải đối mặt với nỗi đau mất đi một người quan trọng và với tương lai không có “Góa phụ đen”.\r\n\r\nTương lai của Hulk trong các giai đoạn tiếp theo của MCU vẫn là câu hỏi lớn chưa có lời giải.', 9120, 1, 1, 5, 4, 'Tuan', '2019-05-10 00:00:00', 'Sự thật đau lòng về vết thương của Hulk trong ‘Avengers: Endgame’', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_17_thumb.jpeg?alt=media&token=6dbaaeb4-1e53-4bf3-8d38-1d49d8d3cd50', 'Bộ đôi đạo diễn nhà Russo đã lý giải về những mất mát mà Hulk phải chịu đựng sau trận chiến cuối cùng với Thanos trong “Endgame”.', NULL, '2019-06-18 23:33:35', '2019-06-18 23:33:35'),
(18, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_18_ava.jpg?alt=media&token=4c7bf68c-4c45-469e-9037-a130f3cd1d51', 'Mê cung đang là phim truyền hình được quan tâm nhất trên sóng VTV. Sau 5 tập phát sóng phim nhận được nhiều bán tàn trên mạng xã hội nhờ nhiều tình huống hấp dẫn. Thủ phạm đằng sau nhiều án mạng liên tiếp vẫn chưa được hé lộ. Fedora, Long Nhật hay gã bác sĩ tâm lý mới là thủ phạm, hiện vẫn là thắc mắc của nhiều người.\r\nMột trong những diễn biến đáng chú ý của tập 5 vừa phát sóng tối 8/5 là Nhật (Doãn Quốc Đam) - gã giám đốc đầy bí ẩn đã có luật sư riêng. Mẹ của Nhật đã nhanh chóng thuê hẳn một vị luật sư để bảo vệ cho con trai mình. Vị luật sư này lại là Đông Hòa (Việt Anh) - anh trai của Lam Anh (Hoàng Thùy Linh) cũng là bạn thân của đội trưởng Khánh (Hồng Đăng).\r\n\r\nMặc dù đã được Đông Hòa cho biết khung hình phạt mà Nhật có thể nhận là từ chung thân đến tử hình, tuy nhiên gã sát nhân vẫn nhất quyết cho rằng mình vô tội. Thậm chí khi vị luật sư đưa cho gã bức ảnh về Fedora, Nhật hét lên rằng: \"Đừng hỏi tôi về thằng điên này nữa. Suốt ngày. Không biết\".\r\n\r\nNhật vẫn không ngừng ngoan cố cho đến khi Đông Hòa cho biết chỉ cần anh xác chứng minh Nhật bị tâm thần phân liệt thì \"chúng ta sẽ thắng vụ này\", Nhật mới bắt đầu \"dịu\" lại.\r\nBan đầu, Nhật vẫn khăng khăng cho rằng mình vô tội, nhưng cuối cùng hắn cũng đã thú nhận hành vi giết người của mình. Điều này khiến Khánh càng nghi ngờ việc Nhật nhận tội là do Đông Hòa xúi.\r\n\r\nVụ án đi đến diễn biến Long Nhật giết người chỉ vì bị tâm thần không kiểm soát, hoàn toàn không cố ý và có thể không phải chịu trách nhiệm trước pháp luật.\r\n\r\nTrong một diễn biến khác, thủ trưởng đơn vị có cuộc họp với đội hình sự. Đội trưởng Khánh cho biết, sau liên tiếp các vụ án mạng nhằm vào các cô gái xảy ra, kế hoạch tiếp theo của đội là ngay lập tức bảo vệ người còn sống sót duy nhất trong 5 cô gái cuối cùng đó chính là Đồng Ngọc Lan – con gái của Chủ tịch tập đoàn Đồng Phát, được mệnh danh là \"Vua đất\".\r\n\r\nTuy nhiên khi Khánh cùng động đội của mình đến nơi ở của cô gái trẻ này, chủ tịch Đồng Vĩnh đã bất hợp tác và không cho cả đội tiếp cận con gái của mình.\r\n\r\nĐáng nói, Ngọc Lan bị chính bố của mình giam lỏng chỉ vì sau đêm diễn của Pắc – En – Zồ có liên quan đến cái chết của một trong số 5 người bạn cùng đi xem diễn. Chủ tịch Đồng Vĩnh biết rõ con gái của mình đã rủ rê đám bạn cùng chơi ma túy đá đã dẫn đến cái chết của Hương, do vậy, ông quyết định giam lỏng bảo vệ Ngọc Lan.\r\nFedora là ai và Nhật là ai hiện là thắc mắc của nhiều khán giả truyền hình. Nhiều ý kiến cho rằng hai nhân vật này thực chất chỉ là một người, và chính là thủ phạm đằng sau nhiều vụ án mạng. Nhiều diễn biến của phim cũng chứng minh cho điều này. Tuy nhiên, với những diễn biến trong tập 4, tập 5, cũng không ít ý kiến cho rằng hai nhân vật là anh em sinh đôi, cùng do Doãn Quốc Đam thủ vai.\r\n\r\nKhán giả Hoàng Bích Phương bình luận: \"Chắc chắn Fedora và Long Nhật là 2 người, có thể cùng mẹ và khác cha. Có đoạn thoại bố mẹ Long Nhật nói chuyện với nhau, và mẹ Long Nhật có đẻ đứa con trai khác ở ngôi nhà bà ấy giấu giếm\".\r\n\"Fedora là anh trai Long Nhật. Hai tên này ngoại hình giống nhau. Nhân vật anh đổ tội cho em trai\", tài khoản có tên Lý Quỳnh Nga đồng tình.\r\n\r\nTừ lập luận này, nhiều người tiếp tục khẳng định gã bác sĩ tâm lý mới là trùm cuối, là thủ phạm thực sự đằng sau những vụ án mạng.\r\n\r\nTuy nhiên, cũng có quan điểm phản bác. Nhiều người vẫn khẳng định Long Nhật và Fedora là một người. Hắn thông minh nhưng cũng mắc bệnh tâm thần, và đã gây ra nhiều cái chết. Những tranh cãi hiện vẫn chưa có hồi kết, trong khi đạo diễn Khải Anh cho biết tập 8, hung thủ sẽ được hé lộ.', 3122, 3, 1, 5, 4, 'Tuan', '2019-05-09 00:00:00', '\'Mê cung\' ngày càng kịch tính, khán giả tranh cãi về Doãn Quốc Đam', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_18_thumb.jpg?alt=media&token=d53cba59-8945-417b-842e-9ed934046b4a', 'Nhiều khán giả cho rằng Nhật và Fedora tuy cùng do Doãn Quốc Đam thủ vai nhưng thực ra là hai người, có thể là anh em sinh đôi.', NULL, '2019-06-18 23:34:19', '2019-06-18 23:34:19'),
(19, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_19_ava.jpg?alt=media&token=12b478bf-8109-4bee-bb9d-a7007fe5201d', 'Theo AFP, ông Baker đăng lên Twitter bức ảnh một cặp đôi nắm tay con tinh tinh mặc áo vest, với lời bình luận \"em bé Hoàng gia rời bệnh viện\".\r\n\r\nNgay lập tức, nhiều người cáo buộc ông Baker có hành vi phân biệt chủng tộc vì mẹ của Hoàng tử Archie - tức Công nương Meghan - là người có một phần gốc Phi.\r\n\r\nMặc dù đã xóa dòng tweet và xin lỗi về \"những ý nghĩa có thể\" ngay sau đó, ông Baker đã nhận được cuộc gọi từ cấp trên, cho biết ông bị sa thải khỏi vị trí người dẫn chương trình trên kênh Radio 5 của đài BBC.\r\n\"Đây là sai lầm nghiêm trọng trong việc phán xét và nó đi ngược lại các giá trị mà chúng tôi hướng tới\", đài BBC cho biết trong một thông báo.\r\n\r\n\"Danny là người dẫn chương trình tuyệt vời nhưng sẽ không làm việc trong chương trình cuối tuần của chúng tôi nữa\", thông báo khẳng định.\r\n\r\nDanny Baker trở nên nổi tiếng với tư cách một nhà viết nhạc trong thời kỳ punk rock thịnh hành, ông bắt đầu sự nghiệp dẫn chương trình vào năm 1989 và cũng từng dẫn các chương trình đố vui trên truyền hình.\r\n\r\nĐây là lần thứ 2 Danny Baker bị đuổi khỏi kênh Radio 5 và là lần thứ 3 ông rời BBC, sau hai lần vào các năm 1997 và 2012.\r\n\r\nHoàng tử Harry và vợ - Công nương Meghan, công bố người con đầu lòng của họ là một bé trai vào hôm 8/5, thành viên mới nhất của Hoàng gia Anh có tên đầy đủ là Hoàng tử Archie Harrison Mountbatten-Windsor.', 10000, 3, 0, 26, 6, 'thong', '2019-05-09 00:00:00', 'Người dẫn BBC bị sa thải vì xúc phạm em bé Hoàng gia như tinh tinh', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_19_thumb.jpg?alt=media&token=2d68dc18-0b15-4109-8119-d1a63435487b', 'Danny Baker, người dẫn radio kỳ cựu của đài BBC, bị sa thải sau khi đăng dòng tweet có tính phân biệt chủng tộc với em bé mới sinh của Hoàng tử Harry và Công nương Meghan.', NULL, '2019-06-18 23:35:30', '2019-06-18 23:35:30');
INSERT INTO `posts` (`id`, `avatar`, `content`, `views`, `status`, `premium_status`, `category_id`, `created_by`, `author_name`, `post_date`, `title`, `thumb_img`, `summary_content`, `fail_reason`, `created_at`, `updated_at`) VALUES
(20, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_20_ava.jpg?alt=media&token=5979d023-0e0c-4e54-af1c-e505d8e6ac0b', 'Trong bài viết dài đăng trên mục quan điểm của New York Times, Chris Hughes cho rằng Mark Zuckerberg đang sở hữu \"quyền lực không ai kiểm soát\" và tầm ảnh hưởng \"lớn hơn rất nhiều so với bất cứ ai khác trong khu vực tư nhân hoặc trong chính phủ\".\r\n\r\nTheo ông Hughes, đã đến lúc để xé nhỏ Facebook ra.\r\n\r\n\"Mark là người tốt và nhân hậu. Nhưng tôi thấy giận dữ vì mong muốn tập trung vào tăng trưởng của anh ấy dẫn tới việc đánh đổi an ninh và văn minh để lấy những cái click\", nhà đồng sáng lập Facebook nhận định.\r\n\r\n\"Tôi thất vọng với chính bản thân mình và đội ngũ ban đầu của Facebook vì đã không nghĩ nhiều hơn tới việc thuật toán News Feed có thể thay đổi văn hóa, ảnh hưởng đến các cuộc bầu cử và trao quyền lực cho những các lãnh đạo dân tộc chủ nghĩa\", ông Hughes viết.\r\n\r\n\"Tôi lo ngại rằng Mark tập hợp xung quanh mình một đội ngũ củng cố niềm tin của anh ấy thay vì thách thức nó\".\r\nHughes là nhân vật mới nhất trong chuỗi những nhà khởi nghiệp và giám đốc điều hành các công ty công nghệ kêu gọi kiểm soát chặt chẽ hơn với Facebook và những nền tảng trực tuyến khác.\r\n\r\nHọ bày tỏ quan điểm trong khi các quốc gia trên thế giới đang chạy đua để kiểm soát tốt hơn mạng xã hội, sau chuỗi những bê bối liên quan đến bảo vệ dữ liệu cá nhân, can thiệp bầu cử và sự lan tràn của thông tin sai lệch.\r\n\r\nÔng chủ Facebook bắt đầu có tín hiệu về việc cởi mở với một số sự kiểm soát. Trong một bài viết trên mục ý kiến của tờ Washington Post hồi tháng 3, CEO mạng xã hội lớn nhất thế giới nhắc tới những lĩnh vực mà ông cho rằng nên bắt đầu siết chặt quy định từ đó.\r\n\r\nTheo quan điểm của Hughes, việc Facebook kêu gọi siết chặt quy định kiểm soát đối với chính họ là cách để né tránh bị kiện từ chính phủ trong tương lai.\r\n\r\nHughes, đã nghỉ việc tại Facebook được hơn một thập kỷ, cho biết tinh thần cạnh tranh và mong muốn thống trị của Zuckerberg dẫn tới việc tập đoàn này kiểm soát tới 80% doanh thu từ mạng xã hội trên thế giới.\r\n\r\nDoanh nhân này cho rằng Facebook hiện tại đã có \"sự độc quyền đầy quyền lực\", và tập đoàn này cần phải đảo ngược các thương vụ mua lại Instagram và WhatsApp.\r\n\r\nÔng Hughes cũng đề xuất việc chính phủ Mỹ nên tạo ra một cơ quan riêng để kiểm soát các tập đoàn công nghệ.\r\n\r\n\"Zuckerberg đã tạo ra một người khổng lồ, đè bẹp việc khởi nghiệp và hạn chế lựa chọn của người dùng. Chính phủ sẽ phải có trách nhiệm phải đảm bảo rằng chúng ta không thể mất đi sự kỳ diệu của bàn tay vô hình\", ông Hughes nhận xét.\r\n\r\nChris Hughes năm nay 35 tuổi, là bạn cùng phòng của Mark Zuckerberg tại Harvard và hiện có tài sản trị giá 430 triệu USD.', 6650, 1, 0, 12, 3, 'Sy', '2019-04-30 00:00:00', 'Đồng sáng lập FB: Đã đến lúc xé nhỏ Facebook ra', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_20_thumb.jpg?alt=media&token=54926945-e941-49f3-a5cf-6f7b89e290dd', 'Chris Hughes là người giúp Mark Zuckerberg biến Facebook từ một dự án ở trường đại học thành một đế chế thật sự, và giờ thì ông cho rằng tập đoàn này nên được chia nhỏ ra.', NULL, '2019-06-19 02:13:24', '2019-06-19 02:13:24'),
(22, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_22_ava.jpg?alt=media&token=bc78c80d-55cb-44df-ab6f-db0082cf5efd', 'Theo bài báo được công bố trên tạp chí Environmental Research Communications, nhóm tác giả đã khảo sát một khu rừng cổ thụ bên bờ sông Đen tại Bắc Carolina và tìm thấy hàng trăm cây bách hói (Bald Cypress) đại thụ có tuổi thọ từ 1.000-2.000 năm, cá biệt có cây đã sống 2.624 năm.\r\n\r\nLoài thực vật này có tên khoa học là Taxodium distichum, phát triển mạnh trong vùng đất ngập nước và là loài bản địa của vùng đông nam nước Mỹ.\r\nCác nhà khoa học thu thập mẫu trên 110 cây thuộc khu Bảo tồn thiên nhiên Bắc Carolina. Những công trình trước đó đã xác định nhóm cây này có tuổi thọ trên 1.000 năm.\r\n\r\nSau khi nghiên cứu với phương pháp xác định tuổi bằng vòng cây (dendrochronology) và định tuổi bằng đồng vị carbon (radiocarbon), nhóm tác giả rất ngạc nhiên khi tìm thấy nhiều cây có tuổi thọ vượt quá 2.000 năm. Trong đó tuổi thọ cao nhất thuộc về cây được đánh mã BLK227 với 2.624 năm.\r\n\r\n\"Thật kỳ lạ khi nhìn thấy hàng loạt cây cổ thụ sống dọc chiều dài của một con sông như vậy\", Giáo sư David Stahle, tác giả chính của nghiên cứu cho biết. \"Gỗ cây bách hói có giá trị và chúng đã được khai thác rất nhiều. Còn chưa đến 1% rừng cây bách hói nguyên thủy sống sót\".', 4500, 1, 1, 26, 4, 'Tuan', '2019-05-14 00:00:00', 'Đã tìm ra cây cổ thụ 2.624 tuổi đang sống tươi tốt ở Mỹ', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_22_thumb.jpg?alt=media&token=8e7be27f-d67a-4cf1-8613-f3b5f216abfd', 'Các nhà khoa học Mỹ vừa bất ngờ phát hiện một cây bách hói có tuổi thọ hơn 2 thiên niên kỷ. Thông tin này gây xôn xao trên các diễn đàn khoa học và sinh vật.', NULL, '2019-06-19 02:13:58', '2019-06-19 02:13:58'),
(23, 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_22_ava.jpg?alt=media&token=bc78c80d-55cb-44df-ab6f-db0082cf5efd', 'Theo bài báo được công bố trên tạp chí Environmental Research Communications, nhóm tác giả đã khảo sát một khu rừng cổ thụ bên bờ sông Đen tại Bắc Carolina và tìm thấy hàng trăm cây bách hói (Bald Cypress) đại thụ có tuổi thọ từ 1.000-2.000 năm, cá biệt có cây đã sống 2.624 năm.\r\n\r\nLoài thực vật này có tên khoa học là Taxodium distichum, phát triển mạnh trong vùng đất ngập nước và là loài bản địa của vùng đông nam nước Mỹ.\r\nCác nhà khoa học thu thập mẫu trên 110 cây thuộc khu Bảo tồn thiên nhiên Bắc Carolina. Những công trình trước đó đã xác định nhóm cây này có tuổi thọ trên 1.000 năm.\r\n\r\nSau khi nghiên cứu với phương pháp xác định tuổi bằng vòng cây (dendrochronology) và định tuổi bằng đồng vị carbon (radiocarbon), nhóm tác giả rất ngạc nhiên khi tìm thấy nhiều cây có tuổi thọ vượt quá 2.000 năm. Trong đó tuổi thọ cao nhất thuộc về cây được đánh mã BLK227 với 2.624 năm.\r\n\r\n\"Thật kỳ lạ khi nhìn thấy hàng loạt cây cổ thụ sống dọc chiều dài của một con sông như vậy\", Giáo sư David Stahle, tác giả chính của nghiên cứu cho biết. \"Gỗ cây bách hói có giá trị và chúng đã được khai thác rất nhiều. Còn chưa đến 1% rừng cây bách hói nguyên thủy sống sót\".', 4500, 3, 1, 13, 6, 'thong', '2019-05-14 00:00:00', 'Đã tìm ra cây cổ thụ 2.624 tuổi đang sống tươi tốt ở Mỹ', 'https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/p_22_thumb.jpg?alt=media&token=8e7be27f-d67a-4cf1-8613-f3b5f216abfd', 'Các nhà khoa học Mỹ vừa bất ngờ phát hiện một cây bách hói có tuổi thọ hơn 2 thiên niên kỷ. Thông tin này gây xôn xao trên các diễn đàn khoa học và sinh vật.', NULL, '2019-06-19 02:33:45', '2019-06-19 02:33:45'),
(24, 'https://firebasestorage.googleapis.com/v0/b/project-1541862659358.appspot.com/o/Zalo_ScreenShot_18_6_2019_1947798.png?alt=media&token=42b59a9a-6fa4-46db-bd59-c6498bd3ea0d', '<p>Ngọc bổ trợ</p>\r\n\r\n<p>D&ugrave; Aatrox kh&ocirc;ng được coi l&agrave; vị tướng c&oacute; khả năng t&iacute;ch cộng dồn Chinh Phục qu&aacute; nhanh v&igrave; để bổ hết 3 c&uacute; Q của hắn cũng mất kh&aacute; nhiều thời gian v&agrave; c&ocirc;ng sức rồi, nhưng v&igrave; vi&ecirc;n ngọc n&agrave;y đem lại khả năng tăng SMCK mạnh, chuyển s&aacute;t thương th&agrave;nh s&aacute;t thương chuẩn v&agrave; c&ograve;n hồi phục m&aacute;u nữa n&ecirc;n n&oacute; vẫn ph&ugrave; hợp với một vị tướng Đấu Sĩ như Aatrox. Vi&ecirc;n ngọc Huyền Thoại Kh&aacute;ng Hiệu Ứng gi&uacute;p Aatrox dễ d&agrave;ng quẩy trong giao tranh m&agrave; kh&ocirc;ng bị kẻ địch ngăn lại, c&ograve;n nếu đối thủ to&agrave;n những tướng kh&ocirc;ng c&oacute; khống chế mạnh th&igrave; c&oacute; thể đổi sang Huyền Thoại Tốc Độ Đ&aacute;nh để c&oacute; những ph&aacute;t ch&eacute;m tay mượt hơn. Nh&aacute;nh phụ Aatrox cũng lấy lu&ocirc;n 2 điểm cho khả năng hồi phục m&aacute;u, v&igrave; giờ chi&ecirc;u cuối của hắn c&ograve;n cường h&oacute;a được khản ăng hồi phục l&ecirc;n m&agrave;.</p>\r\n\r\n<p>Tăng kĩ năng:</p>\r\n\r\n<p>Tăng tối đa v&agrave;o Q &ndash; kĩ năng g&acirc;y s&aacute;t thương lẫn dọn l&iacute;nh ch&iacute;nh của Aatrox, chắc cũng kh&ocirc;ng phải b&agrave;n c&atilde;i g&igrave; về việc n&agrave;y nữa nhỉ. C&ograve;n chi&ecirc;u E th&igrave; cũng để bổ trợ cho Q, n&ecirc;n đương nhi&ecirc;n l&agrave; cần t&acirc;ng tối đa n&oacute; tiếp theo, kĩ năng n&agrave;y cũng gi&uacute;p Aatrox cơ động hơn đặc biệt l&agrave; với những pha lướt qua những bức tường mỏng. Chi&ecirc;u W lấy một điểm ở cấp độ 3, v&agrave; cũng tăng tối đa cuối c&ugrave;ng v&igrave; n&oacute; chỉ tăng nhẹ s&aacute;t thương v&agrave; giảm thời gian hồi chi&ecirc;u khi n&acirc;ng l&ecirc;n m&agrave; th&ocirc;i, c&ograve;n lượng khống chế th&igrave; vẫn vậy.</p>\r\n\r\n<p>Trang bị:</p>\r\n\r\n<p>R&igrave;u Đen sẽ l&agrave; trang bị ch&iacute;nh của Aatrox để những c&uacute; Q của hắn c&oacute; thể g&acirc;y s&aacute;t thương mạnh hơn, nhất l&agrave; trong những t&igrave;nh huống ch&iacute; mạng. Ngo&agrave;i ra lượng tốc độ di chuyển của R&igrave;u Đen cũng gi&uacute;p Aatrox d&iacute; theo kẻ địch để bổ Q chuẩn hơn nữa chứ. Vũ Điệu Tử Thần giờ đ&acirc;y đ&atilde; trở th&agrave;nh m&oacute;n đồ buộc phải c&oacute; của Aatrox để hắn ta c&ograve;n c&oacute; khả năng hồi phục m&agrave; kết hợp với hiệu ứng mới của chi&ecirc;u cuối. M&oacute;ng Vuốt Sterak đem lại kh&aacute; nhiều SMCK v&agrave; m&aacute;u, ngo&agrave;i ra n&oacute; cũng c&oacute; cho lượng gi&aacute;p cực khỏe để Aatrox lao v&agrave;o kh&ocirc;ng bị sốc s&aacute;t thương chết, rồi sau đ&oacute; c&oacute; thể hồi m&aacute;u c&ugrave;ng với hạ gục kẻ địch để c&oacute; khả năng hồi sinh từ chi&ecirc;u cuối. Chi&ecirc;u cuối Aatrox giờ hồi sinh phải phụ thuộc v&agrave;o việc hạ gục kẻ địch n&ecirc;n l&ecirc;n th&ecirc;m Gi&aacute;p Thi&ecirc;n Thần sẽ gi&uacute;p hắn ta chủ động chơi tự tin hơn. Gi&aacute;p T&acirc;m Linh c&oacute; thể l&ecirc;n ngay sau Vũ Điệu Tử Thần cũng được v&igrave; 2 trang bị n&agrave;y kết hợp với nhau kh&aacute; khỏe, nhưng nếu cảm thấy tướng ph&eacute;p của địch chưa đ&aacute;ng sợ lắm th&igrave; cũng kh&ocirc;ng cần tới trang bị n&agrave;y sớm v&agrave; để n&oacute; về cuối trận. Gi&agrave;y Ninja l&agrave; m&oacute;n đồ ph&ugrave; hợp nhất với Aatrox rồi, v&igrave; nếu lấy Huyền Thoại Kh&aacute;ng Hiệu Ứng th&igrave; bạn chẳng cần để &yacute; tới c&aacute;i Gi&agrave;y Thủy Ng&acirc;n nữa.</p>\r\n\r\n<p>Tổng Quan:</p>\r\n\r\n<p>- Khỏe trong mọi giai đoạn trận đấu, c&oacute; khả năng đ&egrave; đường tốt</p>\r\n\r\n<p>- Dọn l&iacute;nh nhanh v&agrave; kh&ocirc;ng cần quan t&acirc;m tới năng lượng như những tướng kh&aacute;c</p>\r\n\r\n<p>- C&oacute; chi&ecirc;u thức hồi phục mạnh</p>\r\n\r\n<p>- Độ cơ động cao, c&agrave;n lướt tốt khi c&oacute; chi&ecirc;u cuối</p>\r\n', 4500, 1, 1, 9, 4, 'Tuan', '2019-05-14 00:00:00', 'Quật bay kẻ địch với Quỷ Kiếm Aatrox ở Đường Trên', '', 'Aatrox Đường Trên vẫn đang được Riot “tha” không giảm sức mạnh tại bản 9.11 này, vậy nên hãy tranh thủ lúc hắn ta còn đang mạnh khủng khiếp để leo xếp hạng nào!', NULL, '2019-06-19 02:49:29', '2019-06-19 02:49:29'),
(25, 'https://firebasestorage.googleapis.com/v0/b/project-1541862659358.appspot.com/o/Zalo_ScreenShot_18_6_2019_1952388.png?alt=media&token=0a6f9b24-1d32-480e-860f-0d3e47a31037', '<p>Studio cũng đ&atilde; đăng tải key visual mới v&agrave; một đoạn teaser trailer giới thiệu movie. Video tr&ecirc;n cũng đ&atilde; giới thiệu về bộ anime mới ngoại truyện c&oacute; tựa đề Violet Evergarden Gaiden: Eien to Jidou Shuki Ningyou. Bộ anime sẽ kể một c&acirc;u chuyện kh&aacute;c v&agrave; được ra rạp tại Nhật Bản v&agrave;o ng&agrave;y 6 đến ng&agrave;y 19 th&aacute;ng 9.</p>\r\n\r\n<p>Đội ngũ sản xuất movie gồm c&oacute;:<br />\r\n<br />\r\nĐạo diễn: Taichi Ishidate<br />\r\nKịch bản: Reiko Yoshida<br />\r\nThiết kế nh&acirc;n vật v&agrave; tổng đạo diễn hoạt họa: Akiko Takase<br />\r\n&Acirc;m nhạc: Evan Call</p>\r\n\r\n<p>Cốt truyện trong movie diễn ra nhiều năm sau khi chiến tranh kết th&uacute;c v&agrave; thế giới dần trở n&ecirc;n b&igrave;nh y&ecirc;n. Một ng&agrave;y nọ, Violet Evergarden bắt gặp một l&aacute; thư đặc biệt.</p>\r\n', 0, 1, 1, 6, 4, 'Tuan', NULL, 'Violet Evergarden hé lộ movie mới nhất', 'https://firebasestorage.googleapis.com/v0/b/project-1541862659358.appspot.com/o/aaa.png?alt=media&token=d4d9875e-0da5-4c7c-b6bd-c477121190ed', 'Vào hôm thứ Sáu vừa qua, Kyoto Animation vừa thông báo về việc dự án movie anime Violet Evergarden sẽ được công chiếu tại Nhật Bản vào ngày 10 tháng 1.', NULL, '2019-06-19 04:09:16', '2019-06-19 04:09:16'),
(26, 'https://firebasestorage.googleapis.com/v0/b/project-1541862659358.appspot.com/o/abc.png?alt=media&token=df12db5e-c6b3-48fd-8500-c6fa934704cb', '<p><strong>Xin chào Police. Đây là mùa giải thứ 2 bạn thi đấu tại VCS rồi. Vậy thì bạn cảm thấy màn thể hiện của mình trong giải mùa xuân như thế nào?</strong></p>\r\n\r\n<p>Mình cảm thấy màn trình diễn của mình ở giải mùa xuân chưa thực sự tốt và phản ánh đúng thực lực của mình. Và sắp tới là giải mùa hè, đây là cơ hội tốt nhất để mình thể hiện và đưa&nbsp;<strong>FTV Esports</strong>&nbsp;vào vòng&nbsp;<strong>Playoff</strong>&nbsp;4 đội mạnh nhất.</p>\r\n\r\n<p><strong>Khi còn ở GAM, bạn đã phải thi đấu cùng một người chơi hỗ trợ không chuyên là Yin. Còn hiện tại ở FTV, bạn có tới 3 tuyển thủ hỗ trợ. Vậy thì việc luyện tập của bạn có gặp nhiều khó khăn không?</strong></p>\r\n\r\n<p>Đối với 3 hỗ trợ ở&nbsp;<strong>FTV Esports</strong>&nbsp;thì mỗi người có 1 lối chơi khác nhau, vì vậy mình cũng khá vất vả ở bước đầu gia nhập, nhưng sau 1 thời gian thì mình cũng thích nghi và tập luyện được với từng người tùy theo chiến thuật của&nbsp;<strong>HLV</strong>. Mình nghĩ đây cũng là chi tiết thú vị để đội mình biến đổi ở mùa giải này.<br />\r\n<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>FTV được coi là nơi tạo ra các xạ thủ tiềm năng tại VCS như Slayder hay Div kid. Đây có phải lý do khiến bạn quyết định thi đấu cho đội tuyển này không?</strong></p>\r\n\r\n<p>Mình nghĩ lí do đến với&nbsp;<strong>FTV</strong>&nbsp;là do cơ duyên của mình với đội, đối với mình thì cần 1 đội tuyển gắn kết và đội lại cần xạ thủ trong lúc này. Và điều mình quyết định thi đấu dưới màu áo&nbsp;<strong>FTV</strong>&nbsp;là&nbsp;<em>‘’mình sẽ chứng minh bản thân mình và đồng đội có thể đưa màu áo&nbsp;<strong>FTV</strong>&nbsp;thoát khỏi top 4 đội phía dưới ’’.</em></p>\r\n\r\n<p><strong>Vừa qua các đội tuyển tại VCS đã rất tích cực chuyển nhượng và tạo nên nhiều phi vụ bom tấn. Sau khi chốt đội hình thì bạn đánh giá cao nhất đội tuyển nào?</strong></p>\r\n\r\n<p>Theo ý kiến của mình thì là&nbsp;<strong>GAM</strong>&nbsp;đội tuyển cũ của mình khi họ đưa về được 2 ‘’ người cũ’’ là&nbsp;<strong>Levi</strong>&nbsp;và&nbsp;<strong>Zeros</strong>, đó đều là 2 người chơi có kĩ năng tốt và gần như toàn diện ở 2 vị trí ở khu vực<strong>&nbsp;Việt Nam</strong>&nbsp;mình.<br />\r\n<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Tuần đầu tiên của FTV sẽ vô cùng khốc liệt khi các bạn phải đối đầu với hai ứng viên cho chức vô địch là EVOS và FL. Bạn có tự tin vào một kết quả thuận lợi cho đội của mình?</strong></p>\r\n\r\n<p>Mình nghĩ&nbsp;<strong>EVOS</strong>&nbsp;và&nbsp;<strong>FL</strong>&nbsp;chỉ là 2 vật cản trên mục tiêu của mình và đồng đội đã đặt ra. Và mình sẽ ‘’ thể hiện’’ cho xạ thủ của 2 đội đó hiểu rằng mình là sự lựa chọn đúng đắn và tốt nhất cho&nbsp;<strong>FTV</strong>&nbsp;chứ không phải họ.</p>\r\n\r\n<p>Xin cảm ơn&nbsp;<strong>Police</strong>&nbsp;đã nhận lời phỏng vấn của&nbsp;<strong>LM360</strong>. Chúc bạn và đội tuyển&nbsp;<strong>FTV</strong>&nbsp;sẽ có được kết quả thuận lợi tại mùa giải này.</p>\r\n\r\n<p>Mình cũng cảm ơn&nbsp;<strong>LM360</strong>&nbsp;về những câu phỏng vấn vừa rồi, chúc cho giải đấu sẽ thành công tốt.</p>\r\n', 3000, 1, 0, 9, 6, 'thong', NULL, 'FTV Police: “Mình nghĩ EVOS và FL chỉ là 2 vật cản trên mục tiêu của mình và đồng đội đã đặt ra”', 'https://firebasestorage.googleapis.com/v0/b/project-1541862659358.appspot.com/o/acccc.png?alt=media&token=8bd27def-89a8-4fc5-b6e4-495b3df46a03', 'Liệu FTV có tạo nên bất ngờ trong tuần thi đấu đầu tiên?', NULL, '2019-06-19 04:03:02', '2019-06-19 04:03:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_tageds`
--

CREATE TABLE `post_tageds` (
  `id` int(11) NOT NULL,
  `tag_name` varchar(255) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `post_id` bigint(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `post_tageds`
--

INSERT INTO `post_tageds` (`id`, `tag_name`, `tag_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 'Thiết bị', 8, 1, '2019-05-01 00:00:00', '2019-05-01 00:00:00'),
(3, 'Tết', 3, 3, '2019-05-01 00:00:00', '2019-05-02 00:00:00'),
(4, 'Galaxy', 7, 4, '2019-05-01 00:00:00', '2019-05-01 00:00:00'),
(5, 'Bóng đá', 2, 5, '2019-05-01 00:00:00', '2019-05-02 00:00:00'),
(6, 'Thời sự thế giới', 6, 6, '2019-05-20 08:48:09', '2019-05-20 08:48:09'),
(7, 'Thời sự thế giới', 6, 7, '2019-05-01 00:00:00', '2019-05-02 00:00:00'),
(8, 'Ngoại hạng anh', 5, 8, '2019-05-01 00:00:00', '2019-05-01 00:00:00'),
(9, 'Nữ diễn viên', 4, 9, '2019-05-01 00:00:00', '2019-05-02 00:00:00'),
(10, 'Nghệ An', 10, 10, '2019-05-01 00:00:00', '2019-05-01 00:00:00'),
(11, 'Mobile', 6, 11, '2019-05-01 00:00:00', '2019-05-02 00:00:00'),
(12, 'SamSung', 7, 12, '2019-05-01 00:00:00', '2019-05-01 00:00:00'),
(13, 'Facebook', 6, 13, '2019-05-01 00:00:00', '2019-05-02 00:00:00'),
(14, 'Gian lận', 6, 14, '2019-05-01 00:00:00', '2019-05-01 00:00:00'),
(15, 'Arsenal', 5, 15, '2019-05-01 00:00:00', '2019-05-02 00:00:00'),
(16, 'Champions League', 2, 16, '2019-05-01 00:00:00', '2019-05-01 00:00:00'),
(17, 'Marvel', 4, 17, '2019-05-01 00:00:00', '2019-05-02 00:00:00'),
(18, 'Phim Việt Nam', 4, 18, '2019-05-01 00:00:00', '2019-05-01 00:00:00'),
(19, 'Thời sự thế giới', 6, 19, '2019-05-01 00:00:00', '2019-05-02 00:00:00'),
(20, 'Mark Zuckerberg ', 6, 20, '2019-05-01 00:00:00', '2019-05-01 00:00:00'),
(21, 'Tai nghe', 7, 4, '2019-05-01 00:00:00', '2019-05-02 00:00:00'),
(22, 'Thể thao', 2, 25, '2019-06-04 05:16:04', '2019-06-04 05:16:04'),
(23, 'Phim ảnh', 4, 25, '2019-06-04 05:16:04', '2019-06-04 05:16:04'),
(24, 'Công nghệ', 8, 2, '2019-06-04 05:56:08', '2019-06-04 05:56:08'),
(25, 'Thể thao', 9, 2, '2019-06-04 05:56:08', '2019-06-04 05:56:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'GUEST', '2019-05-09 23:12:39', '2019-05-09 23:12:45'),
(2, 'SUBSCRIBER', '2019-05-09 17:18:50', '2019-05-09 17:18:50'),
(3, 'WRITER', '2019-05-09 17:18:53', '2019-05-09 17:18:53'),
(4, 'EDITOR', '2019-05-09 17:18:55', '2019-05-09 17:18:55'),
(5, 'ADMIN', '2019-05-09 17:18:57', '2019-05-09 17:18:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Doanh nghiệp', '2019-04-01 00:00:00', '2019-05-01 00:00:00'),
(2, 'Thể thao', '2019-04-02 00:00:00', '2019-04-03 00:00:00'),
(3, 'TV', '2019-05-01 00:00:00', '2019-05-01 00:00:00'),
(4, 'Phim ảnh', '2019-05-10 16:36:07', '2019-05-10 16:36:07'),
(5, 'Bóng đá', '2019-05-01 00:00:00', '2019-05-01 00:00:00'),
(6, 'Thời sự', '2019-04-01 00:00:00', '2019-04-01 00:00:00'),
(7, 'Mobile', '2019-05-01 00:00:00', '2019-05-01 00:00:00'),
(8, 'Công nghệ', '2019-05-10 16:34:53', '2019-05-10 16:34:53'),
(9, 'Thể thao', '2019-05-01 00:00:00', '2019-05-01 00:00:00'),
(10, 'Khen thưởng', '2019-04-10 00:00:00', '2019-04-19 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `access_token` text DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `pseudonym` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `manage_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `reset_token` varchar(255) DEFAULT NULL,
  `expries_token` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `access_token`, `role_id`, `expiry_date`, `email`, `pseudonym`, `birthday`, `category_id`, `manage_by`, `created_at`, `updated_at`, `reset_token`, `expries_token`) VALUES
(1, '', 'thanhtinh', '$2b$10$0vF8IdjBhhtjfIoTvezBcu1VDescrgL3qOqx1sHG0Rc0WDG.Ryfme', 'Trùm cuối', 1, NULL, 'thanhtinhpas@gmail.com', 'trùm cuối', '1997-05-09', NULL, NULL, '2019-06-17 16:30:38', '2019-06-17 16:30:38', NULL, NULL),
(2, '', 'trieu123', '$2b$10$0vF8IdjBhhtjfIoTvezBcu1VDescrgL3qOqx1sHG0Rc0WDG.Ryfme', '^^', 2, '2019-06-12 23:38:13', 'thanhtinhpas@gmail.com', 'Dragon', '1998-05-21', NULL, NULL, '2019-06-17 16:30:12', '2019-06-17 16:30:12', NULL, NULL),
(3, 'Dinh Sy', 'writter', '$2b$10$0vF8IdjBhhtjfIoTvezBcu1VDescrgL3qOqx1sHG0Rc0WDG.Ryfme', '@@', 3, '2019-05-17 00:00:00', 'huutien@gmail.com', 'Money', '1998-05-18', NULL, NULL, '2019-06-18 16:42:51', '2019-06-18 16:42:51', NULL, NULL),
(4, 'Anh Tuan', 'editor', '$2b$10$0vF8IdjBhhtjfIoTvezBcu1VDescrgL3qOqx1sHG0Rc0WDG.Ryfme', '@@', 4, '2019-05-07 00:00:00', 'hello@gmail.com', 'Rider', '1999-05-01', NULL, NULL, '2019-06-18 02:59:35', '2019-06-18 02:59:35', NULL, NULL),
(6, 'Minh Thong', 'admin', '$2b$10$0vF8IdjBhhtjfIoTvezBcu1VDescrgL3qOqx1sHG0Rc0WDG.Ryfme', NULL, 5, NULL, 'hdbhdh', 'SMT', '06/20/2019', 0, NULL, '2019-06-18 16:42:42', '2019-06-18 16:42:42', NULL, NULL),
(7, 'thanhtinh', 'trieu', '$2b$10$0vF8IdjBhhtjfIoTvezBcu1VDescrgL3qOqx1sHG0Rc0WDG.Ryfme', NULL, 5, NULL, 'donaldtrieu@gmail.com', 'MTP', '06/06/2019', 18, NULL, '2019-06-17 16:30:22', '2019-06-17 16:30:22', NULL, NULL),
(8, 'awd', 'awd', '$2b$10$0vF8IdjBhhtjfIoTvezBcu1VDescrgL3qOqx1sHG0Rc0WDG.Ryfme', NULL, 5, '2019-06-11 12:00:00', 'awd@gmail', 'MTP', '06/25/2019', 0, NULL, '2019-06-17 16:30:25', '2019-06-17 16:30:25', NULL, NULL),
(9, NULL, 'trieunq', '$2b$10$0vF8IdjBhhtjfIoTvezBcu1VDescrgL3qOqx1sHG0Rc0WDG.Ryfme', NULL, 2, '2019-06-12 04:40:28', 'nguyenquangtrieu02071998@gmail.com', NULL, '2019-06-06', NULL, NULL, '2019-06-17 16:30:27', '2019-06-17 16:30:27', NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `parent_category_id` (`parent_id`) USING BTREE;

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `post_id` (`post_id`) USING BTREE;

--
-- Chỉ mục cho bảng `manage_categories`
--
ALTER TABLE `manage_categories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `editor_id` (`editor_id`) USING BTREE,
  ADD KEY `manage_categories_ibfk_1` (`category_manage_id`) USING BTREE;

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `category_id` (`category_id`) USING BTREE,
  ADD KEY `created_by` (`created_by`) USING BTREE;
ALTER TABLE `posts` ADD FULLTEXT KEY `title` (`title`);
ALTER TABLE `posts` ADD FULLTEXT KEY `summary_content` (`summary_content`);
ALTER TABLE `posts` ADD FULLTEXT KEY `content` (`content`);
ALTER TABLE `posts` ADD FULLTEXT KEY `FTX` (`title`,`content`,`summary_content`);

--
-- Chỉ mục cho bảng `post_tageds`
--
ALTER TABLE `post_tageds`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `tag_id` (`tag_id`) USING BTREE,
  ADD KEY `post_id` (`post_id`) USING BTREE;

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `role_id` (`role_id`) USING BTREE,
  ADD KEY `id` (`id`,`username`) USING BTREE,
  ADD KEY `category_id` (`category_id`) USING BTREE;

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `manage_categories`
--
ALTER TABLE `manage_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `post_tageds`
--
ALTER TABLE `post_tageds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Các ràng buộc cho bảng `manage_categories`
--
ALTER TABLE `manage_categories`
  ADD CONSTRAINT `manage_categories_ibfk_1` FOREIGN KEY (`category_manage_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `manage_categories_ibfk_2` FOREIGN KEY (`editor_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `post_tageds`
--
ALTER TABLE `post_tageds`
  ADD CONSTRAINT `post_tageds_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`),
  ADD CONSTRAINT `post_tageds_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
