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

