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
q_date DATETIME not null,
FOREIGN KEY (m_id) REFERENCES member(m_id) ON DELETE CASCADE);




