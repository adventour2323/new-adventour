create database adventour;
use adventour;

--member 테이블 create문
create table member(m_id varchar(20) not null,
m_pw varchar(20) not null,
m_lastname varchar(20) not null,
m_firstname varchar(20) not null,
m_nickname varchar(10),
m_postcode varchar(50) not null,
m_addr1 varchar(50) not null,
m_addr2 varchar(50) not null,
m_pnum1 varchar(11) not null,
m_pnum2 varchar(11),
m_email varchar(100) not null,
m_birth_y varchar(4),
m_birth_m varchar(2),
m_birth_d varchar(2),
m_gender varchar(1),
m_agree varchar(1),
primary key(m_id));

--qna테이블 create문
create table qna(q_num int AUTO_INCREMENT primary key,
m_id varchar(20) not null,
q_title varchar(30) not null,
q_cntt varchar(250) not null,
q_date DATETIME DEFAULT CURRENT_TIMESTAMP not null,
FOREIGN KEY (m_id) REFERENCES member(m_id) ON DELETE CASCADE);



--확인용 회원가입 insert문
INSERT INTO `adventour`.`member` (`m_id`, `m_pw`, `m_lastname`, `m_firstname`, `m_nickname`, `m_postcode`, `m_addr1`, `m_addr2`, `m_pnum1`, `m_pnum2`, `m_email`, `m_birth_y`, `m_birth_m`, `m_birth_d`, `m_gender`, `m_agree`) VALUES ('qwer', 'qwer12', '김', '요요', '요요쓰', '12345', '사울', '강남구', '01012341234', '01012341234', '1234@naver.com', '2000', '01', '01', 'f', 'y');
INSERT INTO `adventour`.`member` (`m_id`, `m_pw`, `m_lastname`, `m_firstname`, `m_nickname`, `m_postcode`, `m_addr1`, `m_addr2`, `m_pnum1`, `m_pnum2`, `m_email`, `m_birth_y`, `m_birth_m`, `m_birth_d`, `m_gender`, `m_agree`) VALUES ('asdf', 'asdf12', '김', '야야', '야야쓰', '12345', '경기도', '성남시', '01023452345', '01023452345', '2345@naver.com', '2001', '02', '02', 'f', 'y');
INSERT INTO `adventour`.`member` (`m_id`, `m_pw`, `m_lastname`, `m_firstname`, `m_nickname`, `m_postcode`, `m_addr1`, `m_addr2`, `m_pnum1`, `m_pnum2`, `m_email`, `m_birth_y`, `m_birth_m`, `m_birth_d`, `m_gender`, `m_agree`) VALUES ('zxcv', 'zxcv12', '김', '여여', '여여쓰', '12345', '서울', '서초구', '01034563456', '01034563456', '3456@naver.com', '2002', '03', '03', 'f', 'y');
INSERT INTO `adventour`.`member` (`m_id`, `m_pw`, `m_lastname`, `m_firstname`, `m_nickname`, `m_postcode`, `m_addr1`, `m_addr2`, `m_pnum1`, `m_pnum2`, `m_email`, `m_birth_y`, `m_birth_m`, `m_birth_d`, `m_gender`, `m_agree`) VALUES ('wert', 'wert12', '김', '아아', '아아쓰', '12345', '경기도', '광주시', '01045674567', '01045674567', '4567@naver.com', '2003', '04', '04', 'f', 'y');
INSERT INTO `adventour`.`member` (`m_id`, `m_pw`, `m_lastname`, `m_firstname`, `m_nickname`, `m_postcode`, `m_addr1`, `m_addr2`, `m_pnum1`, `m_pnum2`, `m_email`, `m_birth_y`, `m_birth_m`, `m_birth_d`, `m_gender`, `m_agree`) VALUES ('sdfg', 'sdfg12', '김', '어어', '어어쓰', '12345', '서울', '강북구', '01056785678', '01056785678', '5678@naver.com', '2004', '05', '05', 'f', 'y');

----호텔 정보 h_hotel 테이블 create문

SELECT * FROM adventour.h_hotel;CREATE TABLE `h_hotel` (
  `country_eng` varchar(30) NOT NULL,
  `country_ko` varchar(30) NOT NULL,
  `city_eng` varchar(30) NOT NULL,
  `city_ko` varchar(30) NOT NULL,
  `h_name_eng` varchar(50) NOT NULL,
  `h_name_ko` varchar(50) NOT NULL,
  `h_grade` varchar(1) NOT NULL,
  `h_addr` varchar(150) NOT NULL,
  `h_lat` varchar(11) NOT NULL,
  `h_lon` varchar(11) NOT NULL,
  `h_pho` varchar(150) NOT NULL,
  `h_breakfast` varchar(1) NOT NULL,
  `h_pool` varchar(1) NOT NULL,
  `h_rooftop` varchar(1) NOT NULL,
  `h_tel` varchar(15) NOT NULL,
  PRIMARY KEY (`h_name_eng`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--------호텔 정보 insert문
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('uk', '영국', 'london', '런던', 'parkplaza', '파크플라자', '4', '200 Westminster Bridge Rd', '51.5010106', '-0.1169471', 'h_parkplaza', 'y', 'y', 'y', '0');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('uk', '영국', 'london', '런던', 'the tower', '더 타워', '4', 'St Katharine\'s Way, London E1W 1LD ', '51.5067938', '-0.0739672', 'h_thetower.PNG', 'y', 'y',  'y', '0');
UPDATE `adventour`.`h_hotel` SET `h_pho` = 'h_parkplaza.PNG' WHERE (`h_name_eng` = 'parkplaza');
UPDATE `adventour`.`h_hotel` SET `h_pho` = 'h_thetower.PNG' WHERE (`h_name_eng` = 'the tower');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('uk', '영국', 'liverpool', '리버풀', 'hard days night  hotel', '하드 데이즈 나이트 호텔', '4', 'Central Buildings, N John St, Liverpool L2 6RR ', '53.4060505', '-2.9881734', 'h_harddays.PNG', 'y', 'y', 'y', '+441512361964');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('uk', '영국', 'liverpool', '리버풀', 'titanic hotel liverpool', '타이타닉 호텔 리버풀', '4', 'Stanley Dock, Regent Rd, Liverpool L3 0AN ', '53.4221038', '-2.9985748', 'h_titanic.PNG', 'y', 'y', 'y', '0');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('uk', '영국', 'edinburgh', '에든버러', 'the villiage hotel', '더 빌리지 호텔 에든버러', '4', '140 Crewe Rd S, Edinburgh EH4 2NY', '55.967804', '-3.2345368', 'h_thevillage', 'y', 'y', 'y', '0');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('uk', '영국', 'edinburgh', '에든버러', 'novotel edinburgh center', '노보텔 에든버러 센터', '4', '80 Lauriston Pl, Edinburgh EH3 9DE ', '55.94505', '-3.199782', 'h_novotel_eden.PNG', 'y', 'y', 'y', '+441316563500');
UPDATE `adventour`.`h_hotel` SET `h_name_eng` = 'parkplaza hotel', `h_name_ko` = '파크플라자 호텔' WHERE (`h_name_eng` = 'parkplaza');
UPDATE `adventour`.`h_hotel` SET `h_name_eng` = 'the tower hotel', `h_name_ko` = '더 타워 호텔' WHERE (`h_name_eng` = 'the tower');

INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('italy', '이탈리아', 'rome', '로마', 'imperial rooms', '임페리얼룸스', '3', 'Via di S. Giovanni in Laterano, 10, 00184 Roma RM', '41.8899259', '12.494457', 'h_imperial.PNG', 'y', 'y', 'y', '+390697996832');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('italy', '이탈리아', 'rome', '로마', 'hotel celio roma', '호텔 첼리오 로마', '3', 'Via dei SS. Quattro, 35C, 00184 Roma RM', '41.8890452', '12.4955628', 'h_celio.PNG', 'y', 'y', 'y', '0');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('italy', '이탈리아', 'venice', '베네치아', 'hotel rialto', '호텔 리알토', '3', 'Riva del Ferro, 5149, 30124 Venezia VE', '45.4376634', '12.3361107', 'h_rialto.PNG', 'y', 'y', 'y', '+390415209166');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('italy', '이탈리아', 'venice', '베네치아', 'smart hotel holiday', '스마트 호텔 홀리데이', '4', 'Via dell\'Essiccatoio, 38, 30173 Venezia VE', '45.504727', '12.2708102', 'h_smart hotel.PNG', 'y', 'y', 'y', '+39041611088');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('italy', '이탈리아', 'milano', '밀라노', 'hotel berna', '호텔 베르나', '4', 'Via Napo Torriani, 18, 20124 Milano MI', '45.4827339', '9.2033686', 'h_hotel berna.PNG', 'y', 'y', 'y', '+3902677311');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('italy', '이탈리아', 'milano', '밀라노', 'hotel boston', '호텔 보스턴', '4', 'Via Roberto Lepetit, 7, 20124 Milano MI', '45.4825416', '9.2035671', 'h_boston.PNG', 'y', 'y', 'y', '+39026692636');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('france', '프랑스', 'psris', '파리', 'the originals boutique, hotel maison montmartre', '더 오리지널스 부티끄 호텔  메종 몽마르트', '4', '32 Av. de la Prte de Montmartre, 75018 Paris,', '48.9003969', '2.3360559', 'h_masion.PNG', 'y', 'n', 'n', '+33183755151');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('france', '프랑스', 'psris', '파리', 'novotel paris centre tour ', '노보텔 파리 센터 투어', '4', '61 Quai de Grenelle, 75015 Paris', '48.8498976', '2.2831449', 'h_novotelparis.PNG', 'y', 'y', 'y', '+33140582000');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('france', '프랑스', 'marseille', '마르세유', 'atolon park hotel', '아톨론 파크 호텔', '3', '5 Rue d\'Oslo, 67170 Bernolsheim', '48.7481939', '7.6783141', 'h_atolon.PNG', 'y', 'n', 'n', '+33367290239');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('france', '프랑스', 'marseille', '마르세유', 'hotel au petit pont', '호텔 오 프티 퐁', '3', '1 Quai des Bateliers, 67610 La Wantzenau', '48.6549131', '7.8319186', 'h_pont.PNG', 'y', 'n', 'n', '+33631342093');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('france', '프랑스', 'monaco', '모나코', 'hotel novotel monte carlo', '호텔 노보텔 몬테카를로', '3', '16 Bd Princesse Charlotte, 98000 Monaco', '43.7389167', '7.4217026', 'h_novotelmonte.PNG', 'y', 'y', 'y', '+37799998300');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('france', '프랑스', 'monaco', '모나코', 'hotel olympia', '호텔 올림피아', '3', '17 bis Bd du General Leclerc, 06240 Beausoleil', '43.7431554', '7.4267573', 'h_olympia.PNG', 'y', 'n', 'n', '+33493781270');

INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('spain', '스페인', 'madrid', '마드리드', 'hotel santo domingo madrid', '호텔 산토 도밍고', '4', 'C. de San Bernardo, 1, 28013 Madrid', '40.4206442', '-3.7086409', 'h_santo.PNG', 'y', 'y', 'y', '+34915479800');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('spain', '스페인', 'madrid', '마드리드', 'eurostars madrid tower', '유로스타 마드리드 타워', '5', 'P.º de la Castellana, 259, B, 28046 Madrid', '40.4766616', '-3.6878227', 'h_eurostars.PNG', 'y', 'y', 'y', '+34913342700');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('spain', '스페인', 'barcelona', '바르셀로나', 'hotel barcelo sants', '바르셀로 산츠', '4', 'Pl. dels Països Catalans, s/n, 08014 Barcelona', '41.3790888', '2.1388857', 'h_sants.PNG', 'y', 'y', 'y', '+34935035300');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('spain', '스페인', 'barcelona', '바르셀로나', 'hotel barcelona universal', '바르셀로나 유니버셜 호텔', '4', 'Av. del Paral·lel, 76-80, 08001 Barcelona', '41.3752413', '2.1680881', 'h_universal.PNG', 'y', 'y', 'y', '+34935677447');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('spain', '스페인', 'sevilla', '세비야', 'hotel NH collection sevilla', 'NH 콜렉션 세비야', '4', 'Av. de Diego Martínez Barrio, 8, 41013 Sevilla', '37.3749337', '-5.9763778', 'h_ NH collection.PNG', 'y', 'y', 'y', '+34954548500');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('spain', '스페인', 'sevilla', '세비야', 'hilton garden inn sevilla', '힐튼 가든 인 세비야', '4', 'Torneo Parque Empresarial, Av Ingeniería, 11, 41015 Sevilla', '37.4274177', '-5.97182', 'h_hilton.PNG', 'y', 'y', 'y', '+34955054054');


--------호텔 룸정보 h_room create문 ----->내용이 너무 많아서 csv 파일로 insert
CREATE TABLE `adventour`.`h_room` (
    ->   `h_name_eng` VARCHAR(50) NOT NULL,
    ->   `h_date` DATE NOT NULL,
    ->   `h_roomtype` VARCHAR(10) NOT NULL,
    ->   `h_roompeo` INT NOT NULL,
    ->   `h_roomnum` INT NOT NULL,
    ->   `h_roompri` INT NOT NULL,
    ->   INDEX `h_name_eng_idx` (`h_name_eng` ASC),
    ->   CONSTRAINT `h_name_eng`
    ->     FOREIGN KEY (`h_name_eng`)
    ->     REFERENCES `adventour`.`h_hotel` (`h_name_eng`)
    ->     ON DELETE NO ACTION
    ->     ON UPDATE NO ACTION
    -> )
    -> ENGINE = InnoDB
    -> DEFAULT CHARACTER SET = utf8;
    
 ----- 호텔 예약 확인용 테이블 생성 h_reserv create문
 CREATE TABLE `adventour`.`h_reserve` (
  `h_tinum` INT NOT NULL,
  `h_roomnum` INT NOT NULL,
  `m_id` VARCHAR(20) NOT NULL,
  `h_room_user` INT NOT NULL,
  `h_total_price` INT NOT NULL,
  PRIMARY KEY (`h_tinum`),
  INDEX `h_roomnum_idx` (`h_roomnum` ASC),
  CONSTRAINT `h_roomnum`
    FOREIGN KEY (`h_roomnum`)
    REFERENCES `adventour`.`h_room` (`h_roomnum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-----------------------------예약 번호 insert--------------------------------------------
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `m_id`, `h_room_user`, `h_total_price`) VALUES ('231001h101', '101', 'qwer', '4', '100000');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `m_id`, `h_room_user`, `h_total_price`) VALUES ('231002h202', '202', 'qwer', '2', '200000');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `m_id`, `h_room_user`, `h_total_price`) VALUES ('231001h301', '301', 'asdf', '4', '110000');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `m_id`, `h_room_user`, `h_total_price`) VALUES ('231002h402', '402', 'asdf', '4', '220000');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `m_id`, `h_room_user`, `h_total_price`) VALUES ('231011h411', '411', 'asdf', '2', '220000');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `m_id`, `h_room_user`, `h_total_price`) VALUES ('231001h701', '701', 'zxcv', '4', '110000');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `m_id`, `h_room_user`, `h_total_price`) VALUES ('231001h901', '901', 'wert', '4', '110000');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `m_id`, `h_room_user`, `h_total_price`) VALUES ('231001h1301', '1301', 'sdfg', '4', '110000');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `m_id`, `h_room_user`, `h_total_price`) VALUES ('231001h2101', '2101', 'xcvb', '4', '110000');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `m_id`, `h_room_user`, `h_total_price`) VALUES ('231001h1501', '1501', 'wert', '4', '110000');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `m_id`, `h_room_user`, `h_total_price`) VALUES ('231001h1701', '1701', 'sdfg', '4', '110000');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `m_id`, `h_room_user`, `h_total_price`) VALUES ('231001h1801', '1801', 'sdfg', '2', '220000');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `m_id`, `h_room_user`, `h_total_price`) VALUES ('231001h2001', '2001', 'qwer', '2', '220000');

