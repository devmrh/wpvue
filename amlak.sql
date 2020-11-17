-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 17, 2020 at 07:15 AM
-- Server version: 10.5.6-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amlak`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `province_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `province_id`, `name`) VALUES
(1, 1, 'آبش احمد'),
(2, 1, 'آذرشهر'),
(3, 1, 'آقکند'),
(4, 1, 'اسکو'),
(5, 1, 'اهر'),
(6, 1, 'اچاچی'),
(7, 1, 'ایلخچی'),
(8, 1, 'باسمنج'),
(9, 1, 'بخشایش'),
(10, 1, 'بستان آباد'),
(11, 1, 'بناب'),
(12, 1, 'بناب مرند'),
(13, 1, 'تبریز'),
(14, 1, 'ترک'),
(15, 1, 'ترکمانچای'),
(16, 1, 'تسوج'),
(17, 1, 'تیمورلو'),
(18, 1, 'تیکمه داش'),
(19, 1, 'جلفا'),
(20, 1, 'جوان قلعه'),
(21, 1, 'خاروانا'),
(22, 1, 'خامنه'),
(23, 1, 'خداجو(خراجو)'),
(24, 1, 'خسروشاه'),
(25, 1, 'خمارلو'),
(26, 1, 'خواجه'),
(27, 1, 'دوزدوزان'),
(28, 1, 'زرنق'),
(29, 1, 'زنوز'),
(30, 1, 'سراب'),
(31, 1, 'سردرود'),
(32, 1, 'سهند'),
(33, 1, 'سیس'),
(34, 1, 'سیه رود'),
(35, 1, 'شبستر'),
(36, 1, 'شربیان'),
(37, 1, 'شرفخانه'),
(38, 1, 'شندآباد'),
(39, 1, 'صوفیان'),
(40, 1, 'عجب شیر'),
(41, 1, 'قره آغاج'),
(42, 1, 'لیلان'),
(43, 1, 'مبارک شهر'),
(44, 1, 'مراغه'),
(45, 1, 'مرند'),
(46, 1, 'ملکان'),
(47, 1, 'ممقان'),
(48, 1, 'مهربان'),
(49, 1, 'میانه'),
(50, 1, 'نظرکهریزی'),
(51, 1, 'هادیشهر'),
(52, 1, 'هریس'),
(53, 1, 'هشترود'),
(54, 1, 'هوراند'),
(55, 1, 'وایقان'),
(56, 1, 'ورزقان'),
(57, 1, 'کشکسرای'),
(58, 1, 'کلوانق'),
(59, 1, 'کلیبر'),
(60, 1, 'کوزه کنان'),
(61, 1, 'گوگان'),
(62, 1, 'یامچی'),
(63, 2, 'آواجیق'),
(64, 2, 'ارومیه'),
(65, 2, 'اشنویه'),
(66, 2, 'ایواوغلی'),
(67, 2, 'باروق'),
(68, 2, 'بازرگان'),
(69, 2, 'بوکان'),
(70, 2, 'تازه شهر'),
(71, 2, 'تکاب'),
(72, 2, 'خلیفان'),
(73, 2, 'خوی'),
(74, 2, 'دیزج دیز'),
(75, 2, 'ربط'),
(76, 2, 'زرآباد'),
(77, 2, 'سردشت'),
(78, 2, 'سرو'),
(79, 2, 'سلماس'),
(80, 2, 'سیلوانه'),
(81, 2, 'سیمینه'),
(82, 2, 'سیه چشمه'),
(83, 2, 'شاهین دژ'),
(84, 2, 'شوط'),
(85, 2, 'فیرورق'),
(86, 2, 'قره ضیاءالدین'),
(87, 2, 'قطور'),
(88, 2, 'قوشچی'),
(89, 2, 'ماکو'),
(90, 2, 'محمدیار'),
(91, 2, 'مرگنلر'),
(92, 2, 'مهاباد'),
(93, 2, 'میاندوآب'),
(94, 2, 'میرآباد'),
(95, 2, 'نازک علیا'),
(96, 2, 'نالوس'),
(97, 2, 'نقده'),
(98, 2, 'نوشین'),
(99, 2, 'پلدشت'),
(100, 2, 'پیرانشهر'),
(101, 2, 'چهاربرج'),
(102, 2, 'کشاورز'),
(103, 2, 'گردکشانه'),
(104, 2, 'گوگ تپه'),
(105, 3, 'آبی بیگلو'),
(106, 3, 'اردبیل'),
(107, 3, 'اسلام اباد'),
(108, 3, 'اصلاندوز'),
(109, 3, 'بیله سوار'),
(110, 3, 'تازه کند'),
(111, 3, 'تازه کندانگوت'),
(112, 3, 'جعفرآباد'),
(113, 3, 'خلخال'),
(114, 3, 'رضی'),
(115, 3, 'سرعین'),
(116, 3, 'عنبران'),
(117, 3, 'فخراباد'),
(118, 3, 'قصابه'),
(119, 3, 'لاهرود'),
(120, 3, 'مرادلو'),
(121, 3, 'مشگین شهر'),
(122, 3, 'نمین'),
(123, 3, 'هشتجین'),
(124, 3, 'هیر'),
(125, 3, 'پارس آباد'),
(126, 3, 'کلور'),
(127, 3, 'کوراییم'),
(128, 3, 'گرمی'),
(129, 3, 'گیوی'),
(130, 4, 'آران وبیدگل'),
(131, 4, 'ابریشم'),
(132, 4, 'ابوزیدآباد'),
(133, 4, 'اردستان'),
(134, 4, 'اصغرآباد'),
(135, 4, 'اصفهان'),
(136, 4, 'افوس'),
(137, 4, 'انارک'),
(138, 4, 'اژیه'),
(139, 4, 'ایمانشهر'),
(140, 4, 'بادرود'),
(141, 4, 'باغ بهادران'),
(142, 4, 'باغشاد'),
(143, 4, 'بافران'),
(144, 4, 'برزک'),
(145, 4, 'برف انبار'),
(146, 4, 'بهاران شهر'),
(147, 4, 'بهارستان'),
(148, 4, 'بویین ومیاندشت'),
(149, 4, 'تودشک'),
(150, 4, 'تیران'),
(151, 4, 'جندق'),
(152, 4, 'جوزدان'),
(153, 4, 'جوشقان قالی'),
(154, 4, 'حبیب آباد'),
(155, 4, 'حنا'),
(156, 4, 'خالدآباد'),
(157, 4, 'خمینی شهر'),
(158, 4, 'خوانسار'),
(159, 4, 'خورزوق'),
(160, 4, 'داران'),
(161, 4, 'دامنه'),
(162, 4, 'درچه'),
(163, 4, 'دستگرد'),
(164, 4, 'دهاقان'),
(165, 4, 'دهق'),
(166, 4, 'دیزیچه'),
(167, 4, 'رزوه'),
(168, 4, 'زازران'),
(169, 4, 'زاینده رود'),
(170, 4, 'زرین شهر'),
(171, 4, 'زواره'),
(172, 4, 'زیار'),
(173, 4, 'زیباشهر'),
(174, 4, 'سجزی'),
(175, 4, 'سده لنجان'),
(176, 4, 'سفیدشهر'),
(177, 4, 'سمیرم'),
(178, 4, 'سین'),
(179, 4, 'شاهین شهر'),
(180, 4, 'شاپورآباد'),
(181, 4, 'شهرضا'),
(182, 4, 'طالخونچه'),
(183, 4, 'طرق رود'),
(184, 4, 'عسگران'),
(185, 4, 'علویجه'),
(186, 4, 'فرخی'),
(187, 4, 'فریدونشهر'),
(188, 4, 'فلاورجان'),
(189, 4, 'فولادشهر'),
(190, 4, 'قمصر'),
(191, 4, 'قهجاورستان'),
(192, 4, 'قهدریجان'),
(193, 4, 'لای بید'),
(194, 4, 'مبارکه'),
(195, 4, 'مجلسی'),
(196, 4, 'مشکات'),
(197, 4, 'منظریه'),
(198, 4, 'میمه'),
(199, 4, 'نایین'),
(200, 4, 'نجف آباد'),
(201, 4, 'نطنز'),
(202, 4, 'نوش آباد'),
(203, 4, 'نیاسر'),
(204, 4, 'نیک آباد'),
(205, 4, 'هرند'),
(206, 4, 'ورزنه'),
(207, 4, 'ورنامخواست'),
(208, 4, 'وزوان'),
(209, 4, 'ونک'),
(210, 4, 'پیربکران'),
(211, 4, 'چادگان'),
(212, 4, 'چرمهین'),
(213, 4, 'چمگردان'),
(214, 4, 'کاشان'),
(215, 4, 'کامو و چوگان'),
(216, 4, 'کرکوند'),
(217, 4, 'کلیشادوسودرجان'),
(218, 4, 'کمشچه'),
(219, 4, 'کمه'),
(220, 4, 'کهریزسنگ'),
(221, 4, 'کوشک'),
(222, 4, 'کوهپایه'),
(223, 4, 'گرگاب'),
(224, 4, 'گزبرخوار'),
(225, 4, 'گلدشت'),
(226, 4, 'گلشن'),
(227, 4, 'گلشهر'),
(228, 4, 'گلپایگان'),
(229, 4, 'گوگد'),
(230, 5, 'آسارا'),
(231, 5, 'اشتهارد'),
(232, 5, 'تنکمان'),
(233, 5, 'شهرجدیدهشتگرد'),
(234, 5, 'طالقان'),
(235, 5, 'فردیس'),
(236, 5, 'ماهدشت'),
(237, 5, 'مشکین دشت'),
(238, 5, 'نظرآباد'),
(239, 5, 'هشتگرد'),
(240, 5, 'چهارباغ'),
(241, 5, 'کرج'),
(242, 5, 'کمال شهر'),
(243, 5, 'کوهسار'),
(244, 5, 'گرمدره'),
(245, 5, 'گلسار'),
(246, 6, 'آبدانان'),
(247, 6, 'آسمان آباد'),
(248, 6, 'ارکواز'),
(249, 6, 'ایلام'),
(250, 6, 'ایوان'),
(251, 6, 'بدره'),
(252, 6, 'بلاوه'),
(253, 6, 'توحید'),
(254, 6, 'دره شهر'),
(255, 6, 'دلگشا'),
(256, 6, 'دهلران'),
(257, 6, 'زرنه'),
(258, 6, 'سراب باغ'),
(259, 6, 'سرابله'),
(260, 6, 'شباب'),
(261, 6, 'لومار'),
(262, 6, 'ماژین'),
(263, 6, 'مهران'),
(264, 6, 'مورموری'),
(265, 6, 'موسیان'),
(266, 6, 'پهله'),
(267, 6, 'چوار'),
(268, 7, 'آب پخش'),
(269, 7, 'آباد'),
(270, 7, 'آبدان'),
(271, 7, 'امام حسن'),
(272, 7, 'انارستان'),
(273, 7, 'اهرم'),
(274, 7, 'بادوله'),
(275, 7, 'برازجان'),
(276, 7, 'بردخون'),
(277, 7, 'بردستان'),
(278, 7, 'بندردیر'),
(279, 7, 'بندردیلم'),
(280, 7, 'بندرریگ'),
(281, 7, 'بندرکنگان'),
(282, 7, 'بندرگناوه'),
(283, 7, 'بنک'),
(284, 7, 'بوشهر'),
(285, 7, 'بوشکان'),
(286, 7, 'تنگ ارم'),
(287, 7, 'جم'),
(288, 7, 'خارک'),
(289, 7, 'خورموج'),
(290, 7, 'دالکی'),
(291, 7, 'دلوار'),
(292, 7, 'دوراهک'),
(293, 7, 'ریز'),
(294, 7, 'سعد آباد'),
(295, 7, 'سیراف'),
(296, 7, 'شبانکاره'),
(297, 7, 'شنبه'),
(298, 7, 'عالی شهر'),
(299, 7, 'عسلویه'),
(300, 7, 'نخل تقی'),
(301, 7, 'وحدتیه'),
(302, 7, 'چغادک'),
(303, 7, 'کاکی'),
(304, 7, 'کلمه'),
(305, 8, 'آبسرد'),
(306, 8, 'آبعلی'),
(307, 8, 'احمد آباد مستوفی'),
(308, 8, 'ارجمند'),
(309, 8, 'اسلام شهر'),
(310, 8, 'اسلامشهر'),
(311, 8, 'اندیشه'),
(312, 8, 'باغستان'),
(313, 8, 'باقرشهر'),
(314, 8, 'بومهن'),
(315, 8, 'تجریش'),
(316, 8, 'تهران'),
(317, 8, 'جوادآباد'),
(318, 8, 'دماوند'),
(319, 8, 'رباطکریم'),
(320, 8, 'رودهن'),
(321, 8, 'ری'),
(322, 8, 'شاهدشهر'),
(323, 8, 'شریف آباد'),
(324, 8, 'شمشک'),
(325, 8, 'شهریار'),
(326, 8, 'صالحیه'),
(327, 8, 'صباشهر'),
(328, 8, 'صفادشت'),
(329, 8, 'فردوسیه'),
(330, 8, 'فرون اباد'),
(331, 8, 'فشم'),
(332, 8, 'فیروزکوه'),
(333, 8, 'قدس'),
(334, 8, 'قرچک'),
(335, 8, 'لواسان'),
(336, 8, 'ملارد'),
(337, 8, 'نسیم شهر'),
(338, 8, 'نصیرشهر'),
(339, 8, 'وحیدیه'),
(340, 8, 'ورامین'),
(341, 8, 'پاکدشت'),
(342, 8, 'پردیس'),
(343, 8, 'پرند'),
(344, 8, 'پیشوا'),
(345, 8, 'چهاردانگه'),
(346, 8, 'کهریزک'),
(347, 8, 'کیلان'),
(348, 8, 'گلستان'),
(349, 9, 'آرین شهر'),
(350, 9, 'آیسک'),
(351, 9, 'ارسک'),
(352, 9, 'اسدیه'),
(353, 9, 'اسفدن'),
(354, 9, 'اسلامیه'),
(355, 9, 'بشرویه'),
(356, 9, 'بیرجند'),
(357, 9, 'خضری دشت بیاض'),
(358, 9, 'خوسف'),
(359, 9, 'دیهوک'),
(360, 9, 'زهان'),
(361, 9, 'سرایان'),
(362, 9, 'سربیشه'),
(363, 9, 'سه قلعه'),
(364, 9, 'شوسف'),
(365, 9, 'طبس'),
(366, 9, 'طبس مسینا'),
(367, 9, 'فردوس'),
(368, 9, 'قاین'),
(369, 9, 'قهستان'),
(370, 9, 'محمدشهر'),
(371, 9, 'مود'),
(372, 9, 'نهبندان'),
(373, 9, 'نیمبلوک'),
(374, 9, 'گزیک'),
(375, 10, 'احمدابادصولت'),
(376, 10, 'انابد'),
(377, 10, 'باجگیران'),
(378, 10, 'باخرز'),
(379, 10, 'بار'),
(380, 10, 'بایک'),
(381, 10, 'بجستان'),
(382, 10, 'بردسکن'),
(383, 10, 'بیدخت'),
(384, 10, 'تایباد'),
(385, 10, 'تربت جام'),
(386, 10, 'تربت حیدریه'),
(387, 10, 'جغتای'),
(388, 10, 'جنگل'),
(389, 10, 'خرو'),
(390, 10, 'خلیل آباد'),
(391, 10, 'خواف'),
(392, 10, 'داورزن'),
(393, 10, 'درود'),
(394, 10, 'درگز'),
(395, 10, 'دولت آباد'),
(396, 10, 'رباط سنگ'),
(397, 10, 'رشتخوار'),
(398, 10, 'رضویه'),
(399, 10, 'روداب'),
(400, 10, 'ریوش'),
(401, 10, 'سبزوار'),
(402, 10, 'سرخس'),
(403, 10, 'سفیدسنگ'),
(404, 10, 'سلامی'),
(405, 10, 'سلطان آباد'),
(406, 10, 'سنگان'),
(407, 10, 'شادمهر'),
(408, 10, 'شاندیز'),
(409, 10, 'ششتمد'),
(410, 10, 'شهراباد'),
(411, 10, 'شهرزو'),
(412, 10, 'صالح آباد'),
(413, 10, 'طرقبه'),
(414, 10, 'عشق آباد'),
(415, 10, 'فرهادگرد'),
(416, 10, 'فریمان'),
(417, 10, 'فیروزه'),
(418, 10, 'فیض آباد'),
(419, 10, 'قاسم آباد'),
(420, 10, 'قدمگاه'),
(421, 10, 'قلندرآباد'),
(422, 10, 'قوچان'),
(423, 10, 'لطف آباد'),
(424, 10, 'مزدآوند'),
(425, 10, 'مشهد'),
(426, 10, 'مشهد ثامن'),
(427, 10, 'مشهدریزه'),
(428, 10, 'ملک آباد'),
(429, 10, 'نشتیفان'),
(430, 10, 'نصرآباد'),
(431, 10, 'نقاب'),
(432, 10, 'نوخندان'),
(433, 10, 'نیشابور'),
(434, 10, 'نیل شهر'),
(435, 10, 'همت آباد'),
(436, 10, 'چاپشلو'),
(437, 10, 'چناران'),
(438, 10, 'چکنه'),
(439, 10, 'کاخک'),
(440, 10, 'کاریز'),
(441, 10, 'کاشمر'),
(442, 10, 'کدکن'),
(443, 10, 'کلات'),
(444, 10, 'کندر'),
(445, 10, 'گلبهار'),
(446, 10, 'گلمکان'),
(447, 10, 'گناباد'),
(448, 10, 'یونسی'),
(449, 11, 'آشخانه'),
(450, 11, 'آوا'),
(451, 11, 'اسفراین'),
(452, 11, 'ایور'),
(453, 11, 'بجنورد'),
(454, 11, 'تیتکانلو'),
(455, 11, 'جاجرم'),
(456, 11, 'حصارگرمخان'),
(457, 11, 'درق'),
(458, 11, 'راز'),
(459, 11, 'زیارت'),
(460, 11, 'سنخواست'),
(461, 11, 'شوقان'),
(462, 11, 'شیروان'),
(463, 11, 'فاروج'),
(464, 11, 'قاضی'),
(465, 11, 'قوشخانه'),
(466, 11, 'لوجلی'),
(467, 11, 'پیش قلعه'),
(468, 11, 'چناران شهر'),
(469, 11, 'گرمه'),
(470, 12, 'آبادان'),
(471, 12, 'آبژدان'),
(472, 12, 'آزادی'),
(473, 12, 'آغاجاری'),
(474, 12, 'ابوحمیظه'),
(475, 12, 'اروندکنار'),
(476, 12, 'الهایی'),
(477, 12, 'الوان'),
(478, 12, 'امیدیه'),
(479, 12, 'اندیمشک'),
(480, 12, 'اهواز'),
(481, 12, 'ایذه'),
(482, 12, 'باغ ملک'),
(483, 12, 'بستان'),
(484, 12, 'بندرامام خمینی'),
(485, 12, 'بندرماهشهر'),
(486, 12, 'بهبهان'),
(487, 12, 'بیدروبه'),
(488, 12, 'ترکالکی'),
(489, 12, 'تشان'),
(490, 12, 'جایزان'),
(491, 12, 'جنت مکان'),
(492, 12, 'حر'),
(493, 12, 'حسینیه'),
(494, 12, 'حمزه'),
(495, 12, 'حمیدیه'),
(496, 12, 'خرمشهر'),
(497, 12, 'خنافره'),
(498, 12, 'دارخوین'),
(499, 12, 'دزفول'),
(500, 12, 'دهدز'),
(501, 12, 'رامشیر'),
(502, 12, 'رامهرمز'),
(503, 12, 'رفیع'),
(504, 12, 'زهره'),
(505, 12, 'سالند'),
(506, 12, 'سرداران'),
(507, 12, 'سماله'),
(508, 12, 'سوسنگرد'),
(509, 12, 'سیاه منصور'),
(510, 12, 'شادگان'),
(511, 12, 'شاوور'),
(512, 12, 'شرافت'),
(513, 12, 'شمس آباد'),
(514, 12, 'شهر امام'),
(515, 12, 'شوش'),
(516, 12, 'شوشتر'),
(517, 12, 'شیبان'),
(518, 12, 'صالح شهر'),
(519, 12, 'صفی آباد'),
(520, 12, 'صیدون'),
(521, 12, 'فتح المبین'),
(522, 12, 'قلعه تل'),
(523, 12, 'قلعه خواجه'),
(524, 12, 'لالی'),
(525, 12, 'مسجدسلیمان'),
(526, 12, 'مشراگه'),
(527, 12, 'مقاومت'),
(528, 12, 'ملاثانی'),
(529, 12, 'منصوریه'),
(530, 12, 'میانرود'),
(531, 12, 'میداود'),
(532, 12, 'مینوشهر'),
(533, 12, 'هفتگل'),
(534, 12, 'هندیجان'),
(535, 12, 'هویزه'),
(536, 12, 'ویس'),
(537, 12, 'چغامیش'),
(538, 12, 'چم گلک'),
(539, 12, 'چمران'),
(540, 12, 'چویبده'),
(541, 12, 'کوت سیدنعیم'),
(542, 12, 'کوت عبداله'),
(543, 12, 'گتوند'),
(544, 12, 'گلگیر'),
(545, 12, 'گوریه'),
(546, 13, 'آب بر'),
(547, 13, 'ابهر'),
(548, 13, 'ارمغانخانه'),
(549, 13, 'حلب'),
(550, 13, 'خرمدره'),
(551, 13, 'دندی'),
(552, 13, 'زرین آباد'),
(553, 13, 'زرین رود'),
(554, 13, 'زنجان'),
(555, 13, 'سجاس'),
(556, 13, 'سلطانیه'),
(557, 13, 'سهرورد'),
(558, 13, 'صایین قلعه'),
(559, 13, 'قیدار'),
(560, 13, 'ماه نشان'),
(561, 13, 'نوربهار'),
(562, 13, 'نیک پی'),
(563, 13, 'هیدج'),
(564, 13, 'چورزق'),
(565, 13, 'کرسف'),
(566, 13, 'گرماب'),
(567, 14, 'آرادان'),
(568, 14, 'امیریه'),
(569, 14, 'ایوانکی'),
(570, 14, 'بسطام'),
(571, 14, 'بیارجمند'),
(572, 14, 'دامغان'),
(573, 14, 'درجزین'),
(574, 14, 'دیباج'),
(575, 14, 'رودیان'),
(576, 14, 'سرخه'),
(577, 14, 'سمنان'),
(578, 14, 'شاهرود'),
(579, 14, 'شهمیرزاد'),
(580, 14, 'مجن'),
(581, 14, 'مهدی شهر'),
(582, 14, 'میامی'),
(583, 14, 'کلاته'),
(584, 14, 'کلاته خیج'),
(585, 14, 'کهن آباد'),
(586, 14, 'گرمسار'),
(587, 15, 'ادیمی'),
(588, 15, 'اسپکه'),
(589, 15, 'ایرانشهر'),
(590, 15, 'بزمان'),
(591, 15, 'بمپور'),
(592, 15, 'بنت'),
(593, 15, 'بنجار'),
(594, 15, 'جالق'),
(595, 15, 'خاش'),
(596, 15, 'دوست محمد'),
(597, 15, 'راسک'),
(598, 15, 'زابل'),
(599, 15, 'زاهدان'),
(600, 15, 'زهک'),
(601, 15, 'سراوان'),
(602, 15, 'سرباز'),
(603, 15, 'سوران'),
(604, 15, 'سیرکان'),
(605, 15, 'شهرک علی اکبر'),
(606, 15, 'فنوج'),
(607, 15, 'قصرقند'),
(608, 15, 'لوتک'),
(609, 15, 'محمدان'),
(610, 15, 'محمدی'),
(611, 15, 'مهرستان'),
(612, 15, 'میرجاوه'),
(613, 15, 'نصرت آباد'),
(614, 15, 'نوک آباد'),
(615, 15, 'نگور'),
(616, 15, 'نیک شهر'),
(617, 15, 'هیدوچ'),
(618, 15, 'پیشین'),
(619, 15, 'چابهار'),
(620, 15, 'کنارک'),
(621, 15, 'گشت'),
(622, 15, 'گلمورتی'),
(623, 16, 'آباده'),
(624, 16, 'آباده طشک'),
(625, 16, 'اردکان'),
(626, 16, 'ارسنجان'),
(627, 16, 'استهبان'),
(628, 16, 'اسیر'),
(629, 16, 'اشکنان'),
(630, 16, 'افزر'),
(631, 16, 'اقلید'),
(632, 16, 'امام شهر'),
(633, 16, 'اهل'),
(634, 16, 'اوز'),
(635, 16, 'ایج'),
(636, 16, 'ایزدخواست'),
(637, 16, 'باب انار'),
(638, 16, 'بابامنیر'),
(639, 16, 'بالاده'),
(640, 16, 'بنارویه'),
(641, 16, 'بهمن'),
(642, 16, 'بوانات'),
(643, 16, 'بیرم'),
(644, 16, 'بیضا'),
(645, 16, 'جنت شهر'),
(646, 16, 'جهرم'),
(647, 16, 'جویم'),
(648, 16, 'حاجی آباد'),
(649, 16, 'حسامی'),
(650, 16, 'حسن اباد'),
(651, 16, 'خانه زنیان'),
(652, 16, 'خانیمن'),
(653, 16, 'خاوران'),
(654, 16, 'خرامه'),
(655, 16, 'خشت'),
(656, 16, 'خنج'),
(657, 16, 'خور'),
(658, 16, 'خوزی'),
(659, 16, 'خومه زار'),
(660, 16, 'داراب'),
(661, 16, 'داریان'),
(662, 16, 'دبیران'),
(663, 16, 'دهرم'),
(664, 16, 'دوبرجی'),
(665, 16, 'دوزه'),
(666, 16, 'دژکرد'),
(667, 16, 'رامجرد'),
(668, 16, 'رونیز'),
(669, 16, 'زاهدشهر'),
(670, 16, 'زرقان'),
(671, 16, 'سده'),
(672, 16, 'سروستان'),
(673, 16, 'سعادت شهر'),
(674, 16, 'سلطان شهر'),
(675, 16, 'سورمق'),
(676, 16, 'سیدان'),
(677, 16, 'ششده'),
(678, 16, 'شهرصدرا'),
(679, 16, 'شهرپیر'),
(680, 16, 'شیراز'),
(681, 16, 'صغاد'),
(682, 16, 'صفاشهر'),
(683, 16, 'علامرودشت'),
(684, 16, 'عمادده'),
(685, 16, 'فدامی'),
(686, 16, 'فراشبند'),
(687, 16, 'فسا'),
(688, 16, 'فیروزآباد'),
(689, 16, 'قادراباد'),
(690, 16, 'قایمیه'),
(691, 16, 'قره بلاغ'),
(692, 16, 'قطب آباد'),
(693, 16, 'قطرویه'),
(694, 16, 'قیر'),
(695, 16, 'لار'),
(696, 16, 'لامرد'),
(697, 16, 'لطیفی'),
(698, 16, 'لپویی'),
(699, 16, 'مادرسلیمان'),
(700, 16, 'مبارک آباددیز'),
(701, 16, 'مرودشت'),
(702, 16, 'مزایجان'),
(703, 16, 'مشکان'),
(704, 16, 'مصیری'),
(705, 16, 'مهر'),
(706, 16, 'میانشهر'),
(707, 16, 'میمند'),
(708, 16, 'نوبندگان'),
(709, 16, 'نوجین'),
(710, 16, 'نودان'),
(711, 16, 'نورآباد'),
(712, 16, 'نی ریز'),
(713, 16, 'هماشهر'),
(714, 16, 'وراوی'),
(715, 16, 'کارزین (فتح آباد)'),
(716, 16, 'کازرون'),
(717, 16, 'کامفیروز'),
(718, 16, 'کره ای'),
(719, 16, 'کنارتخته'),
(720, 16, 'کوار'),
(721, 16, 'کوهنجان'),
(722, 16, 'کوپن'),
(723, 16, 'گراش'),
(724, 16, 'گله دار'),
(725, 17, 'آبگرم'),
(726, 17, 'آبیک'),
(727, 17, 'آوج'),
(728, 17, 'ارداق'),
(729, 17, 'اسفرورین'),
(730, 17, 'اقبالیه'),
(731, 17, 'الوند'),
(732, 17, 'بویین زهرا'),
(733, 17, 'بیدستان'),
(734, 17, 'تاکستان'),
(735, 17, 'خاکعلی'),
(736, 17, 'خرمدشت'),
(737, 17, 'دانسفهان'),
(738, 17, 'رازمیان'),
(739, 17, 'سگزآباد'),
(740, 17, 'سیردان'),
(741, 17, 'شال'),
(742, 17, 'شریفیه'),
(743, 17, 'ضیاڈآباد'),
(744, 17, 'قزوین'),
(745, 17, 'محمدیه'),
(746, 17, 'محمودآبادنمونه'),
(747, 17, 'معلم کلایه'),
(748, 17, 'نرجه'),
(749, 17, 'کوهین'),
(750, 18, 'جعفریه'),
(751, 18, 'دستجرد'),
(752, 18, 'سلفچگان'),
(753, 18, 'قم'),
(754, 18, 'قنوات'),
(755, 18, 'کهک'),
(756, 19, 'ازنا'),
(757, 19, 'اشترینان'),
(758, 19, 'الشتر'),
(759, 19, 'الیگودرز'),
(760, 19, 'بروجرد'),
(761, 19, 'بیران شهر'),
(762, 19, 'درب گنبد'),
(763, 19, 'دورود'),
(764, 19, 'زاغه'),
(765, 19, 'سراب دوره'),
(766, 19, 'سپیددشت'),
(767, 19, 'شول آباد'),
(768, 19, 'معمولان'),
(769, 19, 'مومن آباد'),
(770, 19, 'هفت چشمه'),
(771, 19, 'ویسیان'),
(772, 19, 'پلدختر'),
(773, 19, 'چالانچولان'),
(774, 19, 'چقابل'),
(775, 19, 'کوهدشت'),
(776, 19, 'کوهنانی'),
(777, 19, 'گراب'),
(778, 20, 'آلاشت'),
(779, 20, 'آمل'),
(780, 20, 'ارطه'),
(781, 20, 'امامزاده عبدالله'),
(782, 20, 'امیرکلا'),
(783, 20, 'ایزدشهر'),
(784, 20, 'بابل'),
(785, 20, 'بابلسر'),
(786, 20, 'بلده'),
(787, 20, 'بهشهر'),
(788, 20, 'بهنمیر'),
(789, 20, 'تنکابن'),
(790, 20, 'جویبار'),
(791, 20, 'خرم آباد'),
(792, 20, 'خلیل شهر'),
(793, 20, 'خوش رودپی'),
(794, 20, 'دابودشت'),
(795, 20, 'رامسر'),
(796, 20, 'رستمکلا'),
(797, 20, 'رویان'),
(798, 20, 'رینه'),
(799, 20, 'زرگرمحله'),
(800, 20, 'زیرآب'),
(801, 20, 'ساری'),
(802, 20, 'سرخرود'),
(803, 20, 'سلمان شهر'),
(804, 20, 'سورک'),
(805, 20, 'شیرود'),
(806, 20, 'شیرگاه'),
(807, 20, 'عباس اباد'),
(808, 20, 'فریدونکنار'),
(809, 20, 'فریم'),
(810, 20, 'قایم شهر'),
(811, 20, 'محمودآباد'),
(812, 20, 'مرزن آباد'),
(813, 20, 'مرزیکلا'),
(814, 20, 'نشتارود'),
(815, 20, 'نور'),
(816, 20, 'نوشهر'),
(817, 20, 'نکا'),
(818, 20, 'هادی شهر'),
(819, 20, 'هچیرود'),
(820, 20, 'پایین هولار'),
(821, 20, 'پل سفید'),
(822, 20, 'پول'),
(823, 20, 'چالوس'),
(824, 20, 'چمستان'),
(825, 20, 'کتالم وسادات شهر'),
(826, 20, 'کجور'),
(827, 20, 'کلارآباد'),
(828, 20, 'کلاردشت'),
(829, 20, 'کوهی خیل'),
(830, 20, 'کیاسر'),
(831, 20, 'کیاکلا'),
(832, 20, 'گتاب'),
(833, 20, 'گزنک'),
(834, 20, 'گلوگاه'),
(835, 21, 'آستانه'),
(836, 21, 'آشتیان'),
(837, 21, 'آوه'),
(838, 21, 'اراک'),
(839, 21, 'تفرش'),
(840, 21, 'توره'),
(841, 21, 'جاورسیان'),
(842, 21, 'خشکرود'),
(843, 21, 'خمین'),
(844, 21, 'خنجین'),
(845, 21, 'خنداب'),
(846, 21, 'داودآباد'),
(847, 21, 'دلیجان'),
(848, 21, 'رازقان'),
(849, 21, 'زاویه'),
(850, 21, 'ساروق'),
(851, 21, 'ساوه'),
(852, 21, 'شازند'),
(853, 21, 'شهباز'),
(854, 21, 'غرق آباد'),
(855, 21, 'فرمهین'),
(856, 21, 'قورچی باشی'),
(857, 21, 'مامونیه'),
(858, 21, 'محلات'),
(859, 21, 'مهاجران'),
(860, 21, 'میلاجرد'),
(861, 21, 'نراق'),
(862, 21, 'نوبران'),
(863, 21, 'نیمور'),
(864, 21, 'هندودر'),
(865, 21, 'پرندک'),
(866, 21, 'کارچان'),
(867, 21, 'کمیجان'),
(868, 22, 'ابوموسی'),
(869, 22, 'بستک'),
(870, 22, 'بندرجاسک'),
(871, 22, 'بندرعباس'),
(872, 22, 'بندرلنگه'),
(873, 22, 'بیکاء'),
(874, 22, 'تازیان پایین'),
(875, 22, 'تخت'),
(876, 22, 'تیرور'),
(877, 22, 'جناح'),
(878, 22, 'خمیر'),
(879, 22, 'درگهان'),
(880, 22, 'دشتی'),
(881, 22, 'دهبارز'),
(882, 22, 'رویدر'),
(883, 22, 'زیارتعلی'),
(884, 22, 'سرگز'),
(885, 22, 'سندرک'),
(886, 22, 'سوزا'),
(887, 22, 'سیریک'),
(888, 22, 'فارغان'),
(889, 22, 'فین'),
(890, 22, 'قشم'),
(891, 22, 'قلعه قاضی'),
(892, 22, 'لمزان'),
(893, 22, 'لیردف'),
(894, 22, 'میناب'),
(895, 22, 'هرمز'),
(896, 22, 'هشتبندی'),
(897, 22, 'پارسیان'),
(898, 22, 'چارک'),
(899, 22, 'کنگ'),
(900, 22, 'کوشکنار'),
(901, 22, 'کوهستک'),
(902, 22, 'کیش'),
(903, 22, 'گروک'),
(904, 22, 'گوهران'),
(905, 23, 'آجین'),
(906, 23, 'ازندریان'),
(907, 23, 'اسدآباد'),
(908, 23, 'اسلام شهر آق گل'),
(909, 23, 'برزول'),
(910, 23, 'بهار'),
(911, 23, 'تویسرکان'),
(912, 23, 'جورقان'),
(913, 23, 'جوکار'),
(914, 23, 'دمق'),
(915, 23, 'رزن'),
(916, 23, 'زنگنه'),
(917, 23, 'سامن'),
(918, 23, 'سرکان'),
(919, 23, 'شیرین سو'),
(920, 23, 'فامنین'),
(921, 23, 'فرسفج'),
(922, 23, 'فیروزان'),
(923, 23, 'قروه درجزین'),
(924, 23, 'قهاوند'),
(925, 23, 'لالجین'),
(926, 23, 'مریانج'),
(927, 23, 'ملایر'),
(928, 23, 'نهاوند'),
(929, 23, 'همدان'),
(930, 23, 'کبودرآهنگ'),
(931, 23, 'کرفس'),
(932, 23, 'گل تپه'),
(933, 23, 'گیان'),
(934, 24, 'آلونی'),
(935, 24, 'اردل'),
(936, 24, 'باباحیدر'),
(937, 24, 'بازفت'),
(938, 24, 'بروجن'),
(939, 24, 'بلداجی'),
(940, 24, 'بن'),
(941, 24, 'جونقان'),
(942, 24, 'دستنا'),
(943, 24, 'دشتک'),
(944, 24, 'سامان'),
(945, 24, 'سرخون'),
(946, 24, 'سفیددشت'),
(947, 24, 'سودجان'),
(948, 24, 'سورشجان'),
(949, 24, 'شلمزار'),
(950, 24, 'شهرکرد'),
(951, 24, 'صمصامی'),
(952, 24, 'طاقانک'),
(953, 24, 'فارسان'),
(954, 24, 'فرادبنه'),
(955, 24, 'فرخ شهر'),
(956, 24, 'لردگان'),
(957, 24, 'مال خلیفه'),
(958, 24, 'منج'),
(959, 24, 'ناغان'),
(960, 24, 'نافچ'),
(961, 24, 'نقنه'),
(962, 24, 'هارونی'),
(963, 24, 'هفشجان'),
(964, 24, 'وردنجان'),
(965, 24, 'پردنجان'),
(966, 24, 'چلگرد'),
(967, 24, 'چلیچه'),
(968, 24, 'کاج'),
(969, 24, 'کیان'),
(970, 24, 'گندمان'),
(971, 24, 'گهرو'),
(972, 24, 'گوجان'),
(973, 25, 'آرمرده'),
(974, 25, 'اورامان تخت'),
(975, 25, 'بابارشانی'),
(976, 25, 'بانه'),
(977, 25, 'برده رشه'),
(978, 25, 'بلبان آباد'),
(979, 25, 'بویین سفلی'),
(980, 25, 'بیجار'),
(981, 25, 'توپ آغاج'),
(982, 25, 'دزج'),
(983, 25, 'دلبران'),
(984, 25, 'دهگلان'),
(985, 25, 'دیواندره'),
(986, 25, 'زرینه'),
(987, 25, 'سروآباد'),
(988, 25, 'سریش آباد'),
(989, 25, 'سقز'),
(990, 25, 'سنندج'),
(991, 25, 'شویشه'),
(992, 25, 'صاحب'),
(993, 25, 'قروه'),
(994, 25, 'مریوان'),
(995, 25, 'موچش'),
(996, 25, 'پیرتاج'),
(997, 25, 'چناره'),
(998, 25, 'کامیاران'),
(999, 25, 'کانی دینار'),
(1000, 25, 'کانی سور'),
(1001, 25, 'یاسوکند'),
(1002, 26, 'اختیارآباد'),
(1003, 26, 'ارزوییه'),
(1004, 26, 'امین شهر'),
(1005, 26, 'انار'),
(1006, 26, 'اندوهجرد'),
(1007, 26, 'باغین'),
(1008, 26, 'بافت'),
(1009, 26, 'بردسیر'),
(1010, 26, 'بروات'),
(1011, 26, 'بزنجان'),
(1012, 26, 'بلورد'),
(1013, 26, 'بلوک'),
(1014, 26, 'بم'),
(1015, 26, 'بهرمان'),
(1016, 26, 'جبالبارز'),
(1017, 26, 'جوزم'),
(1018, 26, 'جوپار'),
(1019, 26, 'جیرفت'),
(1020, 26, 'خاتون اباد'),
(1021, 26, 'خانوک'),
(1022, 26, 'خواجو شهر'),
(1023, 26, 'خورسند'),
(1024, 26, 'درب بهشت'),
(1025, 26, 'دشتکار'),
(1026, 26, 'دهج'),
(1027, 26, 'دوساری'),
(1028, 26, 'رابر'),
(1029, 26, 'راور'),
(1030, 26, 'راین'),
(1031, 26, 'رفسنجان'),
(1032, 26, 'ریحان'),
(1033, 26, 'زرند'),
(1034, 26, 'زنگی آباد'),
(1035, 26, 'زهکلوت'),
(1036, 26, 'زیدآباد'),
(1037, 26, 'سیرجان'),
(1038, 26, 'شهداد'),
(1039, 26, 'شهربابک'),
(1040, 26, 'صفاییه'),
(1041, 26, 'عنبرآباد'),
(1042, 26, 'فاریاب'),
(1043, 26, 'فهرج'),
(1044, 26, 'قلعه گنج'),
(1045, 26, 'لاله زار'),
(1046, 26, 'ماهان'),
(1047, 26, 'محمدآباد'),
(1048, 26, 'محی آباد'),
(1049, 26, 'مردهک'),
(1050, 26, 'مس سرچشمه'),
(1051, 26, 'منوجان'),
(1052, 26, 'نجف شهر'),
(1053, 26, 'نرماشیر'),
(1054, 26, 'نظام شهر'),
(1055, 26, 'نودژ'),
(1056, 26, 'نگار'),
(1057, 26, 'هجدک'),
(1058, 26, 'هنزا'),
(1059, 26, 'پاریز'),
(1060, 26, 'چترود'),
(1061, 26, 'کاظم آباد'),
(1062, 26, 'کرمان'),
(1063, 26, 'کشکوییه'),
(1064, 26, 'کهنوج'),
(1065, 26, 'کوهبنان'),
(1066, 26, 'کیانشهر'),
(1067, 26, 'گلباف'),
(1068, 26, 'گلزار'),
(1069, 26, 'گنبکی'),
(1070, 26, 'یزدان شهر'),
(1071, 27, 'ازگله'),
(1072, 27, 'اسلام آبادغرب'),
(1073, 27, 'بانوره'),
(1074, 27, 'باینگان'),
(1075, 27, 'بیستون'),
(1076, 27, 'تازه آباد'),
(1077, 27, 'جوانرود'),
(1078, 27, 'حمیل'),
(1079, 27, 'رباط'),
(1080, 27, 'روانسر'),
(1081, 27, 'ریجاب'),
(1082, 27, 'سرمست'),
(1083, 27, 'سرپل ذهاب'),
(1084, 27, 'سطر'),
(1085, 27, 'سنقر'),
(1086, 27, 'سومار'),
(1087, 27, 'شاهو'),
(1088, 27, 'صحنه'),
(1089, 27, 'قصرشیرین'),
(1090, 27, 'میان راهان'),
(1091, 27, 'نودشه'),
(1092, 27, 'نوسود'),
(1093, 27, 'هرسین'),
(1094, 27, 'هلشی'),
(1095, 27, 'پاوه'),
(1096, 27, 'کرمانشاه'),
(1097, 27, 'کرند'),
(1098, 27, 'کنگاور'),
(1099, 27, 'کوزران'),
(1100, 27, 'گهواره'),
(1101, 27, 'گودین'),
(1102, 27, 'گیلانغرب'),
(1103, 28, 'باشت'),
(1104, 28, 'دهدشت'),
(1105, 28, 'دوگنبدان'),
(1106, 28, 'دیشموک'),
(1107, 28, 'سرفاریاب'),
(1108, 28, 'سوق'),
(1109, 28, 'سی سخت'),
(1110, 28, 'قلعه رییسی'),
(1111, 28, 'لنده'),
(1112, 28, 'لیکک'),
(1113, 28, 'مادوان'),
(1114, 28, 'مارگون'),
(1115, 28, 'پاتاوه'),
(1116, 28, 'چرام'),
(1117, 28, 'چیتاب'),
(1118, 28, 'گراب سفلی'),
(1119, 28, 'یاسوج'),
(1120, 29, 'آزادشهر'),
(1121, 29, 'آق قلا'),
(1122, 29, 'انبارآلوم'),
(1123, 29, 'اینچه برون'),
(1124, 29, 'بندرترکمن'),
(1125, 29, 'بندرگز'),
(1126, 29, 'تاتارعلیا'),
(1127, 29, 'جلین'),
(1128, 29, 'خان ببین'),
(1129, 29, 'دلند'),
(1130, 29, 'رامیان'),
(1131, 29, 'سرخنکلاته'),
(1132, 29, 'سنگدوین'),
(1133, 29, 'سیمین شهر'),
(1134, 29, 'علی اباد'),
(1135, 29, 'فاضل آباد'),
(1136, 29, 'فراغی'),
(1137, 29, 'قرق'),
(1138, 29, 'مراوه'),
(1139, 29, 'مزرعه'),
(1140, 29, 'مینودشت'),
(1141, 29, 'نوده خاندوز'),
(1142, 29, 'نوکنده'),
(1143, 29, 'نگین شهر'),
(1144, 29, 'کردکوی'),
(1145, 29, 'کلاله'),
(1146, 29, 'گالیکش'),
(1147, 29, 'گرگان'),
(1148, 29, 'گمیش تپه'),
(1149, 29, 'گنبدکاووس'),
(1150, 30, 'آستارا'),
(1151, 30, 'آستانه اشرفیه'),
(1152, 30, 'احمدسرگوراب'),
(1153, 30, 'اسالم'),
(1154, 30, 'اطاقور'),
(1155, 30, 'املش'),
(1156, 30, 'بازار جمعه'),
(1157, 30, 'بره سر'),
(1158, 30, 'بندرانزلی'),
(1159, 30, 'توتکابن'),
(1160, 30, 'جیرنده'),
(1161, 30, 'حویق'),
(1162, 30, 'خشکبیجار'),
(1163, 30, 'خمام'),
(1164, 30, 'دیلمان'),
(1165, 30, 'رانکوه'),
(1166, 30, 'رحیم آباد'),
(1167, 30, 'رستم آباد'),
(1168, 30, 'رشت'),
(1169, 30, 'رضوانشهر'),
(1170, 30, 'رودبار'),
(1171, 30, 'رودبنه'),
(1172, 30, 'رودسر'),
(1173, 30, 'سنگر'),
(1174, 30, 'سیاهکل'),
(1175, 30, 'شفت'),
(1176, 30, 'شلمان'),
(1177, 30, 'صومعه سرا'),
(1178, 30, 'فومن'),
(1179, 30, 'لاهیجان'),
(1180, 30, 'لشت نشاء'),
(1181, 30, 'لنگرود'),
(1182, 30, 'لوشان'),
(1183, 30, 'لولمان'),
(1184, 30, 'لوندویل'),
(1185, 30, 'لیسار'),
(1186, 30, 'ماسال'),
(1187, 30, 'ماسوله'),
(1188, 30, 'ماکلوان'),
(1189, 30, 'مرجقل'),
(1190, 30, 'منجیل'),
(1191, 30, 'هشتپر (تالش)'),
(1192, 30, 'واجارگاه'),
(1193, 30, 'پره سر'),
(1194, 30, 'چابکسر'),
(1195, 30, 'چاف و چمخاله'),
(1196, 30, 'چوبر'),
(1197, 30, 'کلاچای'),
(1198, 30, 'کومله'),
(1199, 30, 'کوچصفهان'),
(1200, 30, 'کیاشهر'),
(1201, 30, 'گوراب زرمیخ'),
(1202, 31, 'ابرکوه'),
(1203, 31, 'احمدآباد'),
(1204, 31, 'اردکان'),
(1205, 31, 'اشکذر'),
(1206, 31, 'بافق'),
(1207, 31, 'بفروییه'),
(1208, 31, 'بهاباد'),
(1209, 31, 'تفت'),
(1210, 31, 'حمیدیا'),
(1211, 31, 'خضرآباد'),
(1212, 31, 'زارچ'),
(1213, 31, 'شاهدیه'),
(1214, 31, 'عقدا'),
(1215, 31, 'مروست'),
(1216, 31, 'مهردشت'),
(1217, 31, 'مهریز'),
(1218, 31, 'میبد'),
(1219, 31, 'ندوشن'),
(1220, 31, 'نیر'),
(1221, 31, 'هرات'),
(1222, 31, 'یزد');

-- --------------------------------------------------------

--
-- Table structure for table `directions`
--

CREATE TABLE `directions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `directions`
--

INSERT INTO `directions` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'شمال', '', NULL, NULL),
(2, 'جنوب', '', NULL, NULL),
(3, 'شرق', '', NULL, NULL),
(4, 'غرب', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'آسانسور', 'elevator', NULL, NULL),
(2, 'پارکینگ', 'parking', NULL, NULL),
(3, 'انباری', 'warehouse', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `facility_property`
--

CREATE TABLE `facility_property` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `facility_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'پیش فروش', 'presell', NULL, NULL),
(2, 'نیمه کاره', 'part-time', NULL, NULL),
(3, 'دوبلکس', 'duplex', NULL, NULL),
(4, 'پنت هاوس', 'penthouse', NULL, NULL),
(5, 'تریپلکس', 'triplex', NULL, NULL),
(6, 'یک طبقه', 'one-floor', NULL, NULL),
(7, 'برج', 'tower', NULL, NULL),
(8, 'نیمه دوبلکس', 'half-duplex', NULL, NULL),
(9, 'انبار', 'store', NULL, NULL),
(10, 'تجاری مسکونی', 'residential-commercial', NULL, NULL),
(11, 'سایر', 'other', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `neighborhoods`
--

CREATE TABLE `neighborhoods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `neighborhoods`
--

INSERT INTO `neighborhoods` (`id`, `name`, `city_id`, `created_at`, `updated_at`) VALUES
(1, 'پاسداران', 316, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sell_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `feature_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `province_id` bigint(20) UNSIGNED DEFAULT NULL,
  `direction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `neighborhood_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rent_price` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rent_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `owner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size_unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bath_count` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parking_count` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bed_count` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `build_time` date DEFAULT NULL,
  `special` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `property_category_id`, `sell_type_id`, `feature_id`, `city_id`, `province_id`, `direction_id`, `neighborhood_id`, `title`, `address`, `price`, `price_label`, `rent_price`, `rent_label`, `description`, `user_id`, `owner`, `phone`, `size`, `size_unit`, `bath_count`, `parking_count`, `bed_count`, `build_time`, `special`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, 316, 8, 1, 1, 'آپارتمان ', 'تهران', '100000000', 'میلیون تومان', '', '', '', 1, 'رضایی', '09126052917', '70', 'متر', '1', '1', '2', '0621-02-17', 0, '2020-11-17 03:39:32', '2020-11-17 03:39:41');

-- --------------------------------------------------------

--
-- Table structure for table `property_categories`
--

CREATE TABLE `property_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `property_categories`
--

INSERT INTO `property_categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'آپارتمان', 'apartment', NULL, NULL),
(2, 'ویلا', 'villa', NULL, NULL),
(3, 'سایر', 'other', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `name`) VALUES
(1, 'آذربایجان شرقی'),
(2, 'آذربایجان غربی'),
(3, 'اردبیل'),
(4, 'اصفهان'),
(5, 'البرز'),
(6, 'ایلام'),
(7, 'بوشهر'),
(8, 'تهران'),
(9, 'خراسان جنوبی'),
(10, 'خراسان رضوی'),
(11, 'خراسان شمالی'),
(12, 'خوزستان'),
(13, 'زنجان'),
(14, 'سمنان'),
(15, 'سیستان وبلوچستان'),
(16, 'فارس'),
(17, 'قزوین'),
(18, 'قم'),
(19, 'لرستان'),
(20, 'مازندران'),
(21, 'مرکزی'),
(22, 'هرمزگان'),
(23, 'همدان'),
(24, 'چهارمحال وبختیاری'),
(25, 'کردستان'),
(26, 'کرمان'),
(27, 'کرمانشاه'),
(28, 'کهگیلویه وبویراحمد'),
(29, 'گلستان'),
(30, 'گیلان'),
(31, 'یزد');

-- --------------------------------------------------------

--
-- Table structure for table `sell_types`
--

CREATE TABLE `sell_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sell_types`
--

INSERT INTO `sell_types` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'فروش', 'sales', NULL, NULL),
(2, 'اجاره', 'rent', NULL, NULL),
(3, 'سایر', 'other', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_province_id_foreign` (`province_id`);

--
-- Indexes for table `directions`
--
ALTER TABLE `directions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facility_property`
--
ALTER TABLE `facility_property`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facility_property_property_id_foreign` (`property_id`),
  ADD KEY `facility_property_facility_id_foreign` (`facility_id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `neighborhoods`
--
ALTER TABLE `neighborhoods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `neighborhoods_city_id_foreign` (`city_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `properties_property_category_id_foreign` (`property_category_id`),
  ADD KEY `properties_sell_type_id_foreign` (`sell_type_id`),
  ADD KEY `properties_feature_id_foreign` (`feature_id`),
  ADD KEY `properties_city_id_foreign` (`city_id`),
  ADD KEY `properties_province_id_foreign` (`province_id`),
  ADD KEY `properties_direction_id_foreign` (`direction_id`),
  ADD KEY `properties_neighborhood_id_foreign` (`neighborhood_id`);

--
-- Indexes for table `property_categories`
--
ALTER TABLE `property_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sell_types`
--
ALTER TABLE `sell_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1223;

--
-- AUTO_INCREMENT for table `directions`
--
ALTER TABLE `directions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `facility_property`
--
ALTER TABLE `facility_property`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `neighborhoods`
--
ALTER TABLE `neighborhoods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `property_categories`
--
ALTER TABLE `property_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `sell_types`
--
ALTER TABLE `sell_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `facility_property`
--
ALTER TABLE `facility_property`
  ADD CONSTRAINT `facility_property_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facility_property_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `neighborhoods`
--
ALTER TABLE `neighborhoods`
  ADD CONSTRAINT `neighborhoods_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `properties`
--
ALTER TABLE `properties`
  ADD CONSTRAINT `properties_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `properties_direction_id_foreign` FOREIGN KEY (`direction_id`) REFERENCES `directions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `properties_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `properties_neighborhood_id_foreign` FOREIGN KEY (`neighborhood_id`) REFERENCES `neighborhoods` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `properties_property_category_id_foreign` FOREIGN KEY (`property_category_id`) REFERENCES `property_categories` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `properties_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `properties_sell_type_id_foreign` FOREIGN KEY (`sell_type_id`) REFERENCES `sell_types` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
