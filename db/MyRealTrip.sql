# 데이터 베이스 생성
create database myRealTrip;
use myRealTrip;


# 유저 테이블
create table users
(
    user_id       bigint primary key auto_increment,
    user_email    varchar(300),
    user_name     varchar(300),
    postCode      varchar(1000),
    address       varchar(1000),
    detailAddress varchar(1000),
    user_role     varchar(300),
    user_pw       varchar(300)
);
drop table users;

# 관리자
# 관리자는 회원가입이 아니라 직접 insert로 넣어야 함
create table admin
(
    admin_id    bigint primary key auto_increment,
    admin_email varchar(300) not null,
    admin_name  varchar(300) not null,
    admin_role  varchar(300) not null
);
insert into admin(admin_email, admin_name, admin_role)
values ('zxzz45@naver.com', '유요한', 'ADMIN');

insert into admin(admin_email, admin_name, admin_role)
values ('700eeu@gmail.com', '김예은', 'ADMIN');

select *
from admin;

# 메인 페이지 정보와 이미지
# 도시 추천
create table travelCard
(
    card_id      bigint primary key auto_increment,
    title        varchar(300)  not null,
    contents     varchar(4000) not null,
    travel_image varchar(3000),
    admin_id     bigint references admin (admin_id)
);
drop table travelCard;
insert into travelCard (title, contents, travel_image, admin_id)
values ('뉴욕', '뉴욕', 'https://d2ur7st6jjikze.cloudfront.net/landscapes/4721_large_square_1535704006.jpg?1535704006', 1);
insert into travelCard (title, contents, travel_image, admin_id)
values ('피렌체', '피렌체', 'https://d2ur7st6jjikze.cloudfront.net/landscapes/476_large_square_1448513381.jpg?1448513381', 1);
insert into travelCard (title, contents, travel_image, admin_id)
values ('라스베가스', '라스베가스',
        'https://d2ur7st6jjikze.cloudfront.net/landscapes/4654_large_square_1535621335.jpg?1535621335', 1);
insert into travelCard (title, contents, travel_image, admin_id)
values ('파리', '파리', 'https://d2ur7st6jjikze.cloudfront.net/landscapes/4747_large_square_1536047752.jpg?1536047752', 1);
insert into travelCard (title, contents, travel_image, admin_id)
values ('런던', '런던', 'https://d2ur7st6jjikze.cloudfront.net/landscapes/4750_large_square_1536049651.jpg?1536049651', 1);
insert into travelCard (title, contents, travel_image, admin_id)
values ('바르셀로나', '바르셀로나',
        'https://d2ur7st6jjikze.cloudfront.net/landscapes/4672_large_square_1535678422.jpg?1535678422', 1);
insert into travelCard (title, contents, travel_image, admin_id)
values ('로마', '로마', 'https://d2ur7st6jjikze.cloudfront.net/landscapes/4751_large_square_1536050273.jpg?1536050273', 1);
insert into travelCard (title, contents, travel_image, admin_id)
values ('루체른', '루체른', 'https://d2ur7st6jjikze.cloudfront.net/landscapes/476_large_square_1448513381.jpg?1448513381', 1);
insert into travelCard (title, contents, travel_image, admin_id)
values ('인터라켄', '인터라켄', 'https://d2ur7st6jjikze.cloudfront.net/landscapes/4650_large_square_1535618926.jpg?1535618926',
        1);
insert into travelCard (title, contents, travel_image, admin_id)
values ('세고비아', '세고비아', 'https://d2ur7st6jjikze.cloudfront.net/landscapes/210_large_square_1405351805.jpg?1405351805',
        1);
insert into travelCard (title, contents, travel_image, admin_id)
values ('톨레도', '톨레도', 'https://d2ur7st6jjikze.cloudfront.net/landscapes/725_large_square_1482978918.jpg?1482978918', 1);

select *
from travelCard;
drop table travelCard;

# mainBanner
# 광고
create table mainBanner
(
    bannerId    int primary key auto_increment,
    bannerURL   varchar(1000) not null,
    bannerImage varchar(1000) not null,
    admin_id    bigint references admin (admin_id)
);
drop table mainBanner;
insert into mainBanner (bannerURL, bannerImage, admin_id)
values ('https://www.myrealtrip.com/promotions/lucky_week3_main',
        'https://d2ur7st6jjikze.cloudfront.net/cms/1560_original_1654246467.png?1654246467', 1);
insert into mainBanner (bannerURL, bannerImage, admin_id)
values ('https://www.myrealtrip.com/promotions/mrtcommunity',
        'https://d2ur7st6jjikze.cloudfront.net/cms/2125_original_1652664555.png?1652664555', 1);
insert into mainBanner (bannerURL, bannerImage, admin_id)
values ('https://www.myrealtrip.com/themes/1041/offers',
        'https://d2ur7st6jjikze.cloudfront.net/cms/1252_original_1653271301.png?1653271301', 1);
insert into mainBanner (bannerURL, bannerImage, admin_id)
values ('https://market.bomappbiz.co.kr/overseas-axa?partner=MYREALTRIP',
        'https://d2ur7st6jjikze.cloudfront.net/cms/1643_original_1652173495.png?1652173495', 1);
insert into mainBanner (bannerURL, bannerImage, admin_id)
values ('https://www.myrealtrip.com/promotions/donkey',
        'https://d2ur7st6jjikze.cloudfront.net/cms/1527_original_1650959341.png?1650959341', 1);
insert into mainBanner (bannerURL, bannerImage, admin_id)
values ('https://www.myrealtrip.com/promotions/jejuplus_202204',
        'https://d2ur7st6jjikze.cloudfront.net/cms/1648_original_1653994068.png?1653994068', 1);
insert into mainBanner (bannerURL, bannerImage, admin_id)
values ('https://www.myrealtrip.com/promotions/overseastravel',
        'https://d2ur7st6jjikze.cloudfront.net/cms/1684_original_1652022421.png?1652022421', 1);
insert into mainBanner (bannerURL, bannerImage, admin_id)
values ('https://www.myrealtrip.com/promotions/myrealhocance_ep130',
        'https://d2ur7st6jjikze.cloudfront.net/cms/1424_original_1653962625.png?1653962625', 1);
insert into mainBanner (bannerURL, bannerImage, admin_id)
values ('https://www.myrealtrip.com/promotions/myrealhocance_zip',
        'https://d2ur7st6jjikze.cloudfront.net/cms/1117_original_1653354747.png?1653354747', 1);
select *
from mainBanner;
drop table mainBanner;
# 여행지 소개


# 문의하기
create table questions
(
    qu_id      bigint primary key auto_increment,
    qu_title   varchar(300)  not null,
    qu_content varchar(3000) not null,
    user_id    bigint references users (user_id) ON DELETE CASCADE,
    answers    bigint        references answers (ans_id) ON DELETE SET NULL
);

drop table questions;

# 관리자 답변 테이블
# 이부분은 관리자 페이지가 필요해보임
create table answers
(
    ans_id   bigint primary key auto_increment,
    answer   varchar(3000) not null,
    admin_id bigint references admin (admin_id)
);

# 공지사항
create table notices
(
    notice_id         bigint primary key auto_increment,
    notice_title      varchar(300)  not null,
    notice_details    varchar(3000) not null,
    notice_regTime    dateTime default now(),
    notice_updateTime dateTime default now(),
    admin_id          bigint references admin (admin_id)
);


# 호텔
create table hotels
(
    hotel_id       bigint primary key auto_increment,
    hotel_name     varchar(300)  not null,
    hotel_location varchar(1000) not null,
    hotel_info     varchar(3000) not null,
    admin_id       bigint references admin (admin_id)
);
# 호텔 이미지
create table hotelImg
(
    hotel_img_id  bigint primary key auto_increment,
    hotel_img_url varchar(3000) not null,
    hotel_id      bigint references hotels (hotel_id) on delete cascade
);

# 방
create table rooms
(
    room_id       bigint primary key auto_increment,   # 룸번호
    room_status   varchar(300)  not null,              # 1: 예약가능 2: 예약불가능
    room_count    int           not null,
    room_price    varchar(3000) not null,
    option_others varchar(3000),
    hotel_id      bigint references hotels (hotel_id) on delete cascade#호텔번호
);
# 방 이미지
create table roomImg
(
    room_img_id  bigint primary key auto_increment,
    room_img_url varchar(3000) not null,
    room_id      bigint references rooms (room_id) on delete cascade
);

# 숙소 예약
create table room_reservations
(
    room_reservations_id                bigint primary key auto_increment,
    room_reservations_start             datetime,
    room_reservations_end               datetime,
    room_reservations_regTime           datetime default now(),
    room_reservations_guest_count       int           not null,
    room_reservations_customer_requests varchar(3000),
    room_reservations_total_price       varchar(1000) not null,
    room_id                             bigint references rooms (room_id) on delete cascade,
    user_id                             bigint references users (user_id)
);


# 공항 테이블
create table airports
(
    airport_id       bigint primary key auto_increment,
    airport_name     varchar(300)  not null,
    airport_location varchar(1000) not null,
    admin_id         bigint references admin (admin_id)
);

# 비행기 테이블
create table airplanes
(
    airplane_id       bigint primary key auto_increment,
    airplane_model    varchar(300) not null,
    airplane_company  varchar(300) not null, # 비행기 회사 ex) 아시아나 항공
    airplane_capacity int          not null, # 탐승객 수
    airport_id        bigint references airports (airport_id)
);

# 운행 테이블
create table operations
(
    operation_id             bigint primary key auto_increment,
    operation_num            varchar(300)  not null,
    operation_price          varchar(3000) not null,
    operation_departureTime  DATETIME,
    operation_arriveTime     DATETIME,
    operation_departure_area varchar(500), # SEL
    operation_arrive_area    varchar(500), # OKA
    airplane_id              bigint references airplanes (airplane_id)
);

# 비행기 예매
create table airplane_reservations
(
    airplane_reservation_id      bigint primary key auto_increment,
    airplane_reservation_regTime datetime default now(),
    airplane_pay                 varchar(3000) not null,
    airplane_id                  bigint references airplanes (airplane_id),
    user_id                      bigint references users (user_id)
);

# 항공권 공지사항
create table notices
(
    notice_id         bigint primary key auto_increment,
    notice_title      varchar(300)  not null,
    notice_details    varchar(3000) not null,
    notice_regTime    dateTime default now(),
    notice_updateTime dateTime default now(),
    admin_id          bigint references admin (admin_id)
);


# 찜하기
create table pickList
(
    pick_id   bigint primary key auto_increment,
    user_id   bigint references users (user_id),
    hotels_id bigint references hotels (hotel_id) ON DELETE CASCADE
);


# 유저 정보 보기
create table myInfo
(
    code_id                 bigint primary key auto_increment,
    room_reservations_id    bigint references room_reservations (room_reservations_id),
    airplane_reservation_id bigint references airplane_reservations (airplane_reservation_id),
    qu_id                   bigint references questions (qu_id),
    pick_id                 bigint references pickList (pick_id),
    user_id                 bigint references users (user_id)
);

# 결제
create table pay
(
    pay_id                  bigint primary key auto_increment,
    final_pay               varchar(3000) not null,
    pay_bank                varchar(1000) not null,
    pay_date                datetime default now(),
    pay_status              varchar(500)  not null,
    room_reservations_id    bigint references room_reservations (room_reservations_id),
    airplane_reservation_id bigint references airplane_reservations (airplane_reservation_id)
);

