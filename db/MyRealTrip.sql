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
select * from users;

insert into users(user_email, user_name, postCode, address, detailAddress, user_role, user_pw) values
('kosta@naver.com','이재원','asd','asd','1','1','688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6');
# asdasd

update users set user_pw = '5fd924625f6ab16a19cc9807c7c506ae1813490e4ba675f843d5a10e0baacdb8'; ## asdasd 비번 설정
commit;
select * from users;

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


insert into admin(admin_email, admin_name, admin_role)
values ('whdudgms123@naver.com', '조영흔', 'ADMIN');

insert into admin(admin_email, admin_name, admin_role)
values ('ghdtjrdud38@naver.com', '홍석영', 'ADMIN');
insert into admin(admin_email, admin_name, admin_role)
values ('dlwodnjs0128@naver.com', '이재원', 'ADMIN');

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

# insert문 travel_image 수정했고 update문도 추가했으니 편한 쪽으로 적용해주세요. 만약 sql문이 먹히지 않는다면 set sql_safe_updates =0;을 실행한 뒤 다시 적용해보세요.
insert into travelCard (title, contents, travel_image, admin_id)
values ('피렌체', '피렌체', 'https://bucketmystudy.s3.ap-northeast-2.amazonaws.com/picture/florence-1608113_1280.jpg', 1);
# UPDATE travelCard
# SET travel_image = 'https://bucketmystudy.s3.ap-northeast-2.amazonaws.com/picture/florence-1608113_1280.jpg'
# WHERE title = '피렌체';

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

insert into travelCard (title, contents, travel_image, admin_id)
values ('두바이', '두바이', 'https://bucketmystudy.s3.ap-northeast-2.amazonaws.com/picture/dubai.jpg', 2);
insert into travelCard (title, contents, travel_image, admin_id)
values ('서울', '서울', 'https://d2ur7st6jjikze.cloudfront.net/offer_photos/39578/245722_large_1532762808.jpg?1532762808', 1);


use myRealTrip;
select *
from hotels;
select * from airPay;
select * from hotelImg;
select * from rooms;
select * from room_reservations;
select * from pay;



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
select * from air_notices ORDER BY notice_id DESC ;
SELECT * FROM air_notices ORDER BY notice_id DESC LIMIT 7 OFFSET 2 ;
# 여행지 소개
# 메인 페이지에서도 보여주지만 항공권 banner에서도 보여줄 예정
create table recommendedPlace
(
    place_id       bigint primary key auto_increment,
    place_title    varchar(300)  not null,
    place_contents varchar(4000) not null,
    place_image    varchar(4000),
    admin_id       bigint references admin (admin_id)
);

drop table recommendedPlace;
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (1, 1, '/img/mainPage/place1.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (2, 2, '/img/mainPage/place2.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (3, 3, '/img/mainPage/place3.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (4, 4, '/img/mainPage/place4.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (5,5, '/img/mainPage/place5.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (6, 6, '/img/mainPage/place6.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (7, 7, '/img/mainPage/place7.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (8, 8, '/img/mainPage/place8.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (9, 9, '/img/mainPage/place9.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (10, 10, '/img/mainPage/place10.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (11, 11, '/img/mainPage/place11.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (12, 12, '/img/mainPage/place12.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (13, 13, '/img/mainPage/place13.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (14, 14, '/img/mainPage/place14.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (15, 15, '/img/mainPage/place15.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (16, 16, '/img/mainPage/place16.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (17, 17, '/img/mainPage/place17.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (18, 18, '/img/mainPage/place18.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (19, 19, '/img/mainPage/place19.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (20, 20, '/img/mainPage/place20.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (21, 21, '/img/mainPage/place21.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (22, 22, '/img/mainPage/place22.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (23, 23, '/img/mainPage/place23.png', 1);
insert into recommendedPlace (place_title, place_contents, place_image, admin_id)
values (24, 24, '/img/mainPage/place24.png', 1);



# 여행지 소개 이미지
create table placeImg
(
    place_img_id bigint primary key auto_increment,
    place_images varchar(4000),
    place_id     bigint references recommendedPlace (place_id) on delete cascade
);
drop table recommendedPlace;

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
drop table hotels;
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
    room_id       bigint primary key auto_increment,                   # 룸번호
    room_status   varchar(300)  not null,                              # 1: 예약가능 2: 예약불가능
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
use myRealTrip;

delete from airplanes;
delete from operations;
delete from airplane_reservations;
delete from airPay;

select * from airplanes;
select * from operations;
select * from airplane_reservations;
select * from airPay;
select * from pay;

# 비행기 테이블
create table airplanes
(
    airplane_id      bigint primary key auto_increment,
    airplane_model   varchar(300) not null,
    airplane_company varchar(300) not null, # 비행기 회사 ex) 아시아나 항공
    airport_id       bigint references airports (airport_id)
);
drop table operations;
# 운행 테이블
create table operations
(
    operation_id             bigint primary key auto_increment,
    operation_num            varchar(300)  not null,
    operation_price          varchar(3000) not null,
    operation_departureTime  DATETIME,
    operation_arriveTime     DATETIME,
    operation_departure_area varchar(500),           # SEL
    operation_arrive_area    varchar(500),           # OKA
    airplane_capacity        int           not null, # 좌석수
    airplane_id              bigint references airplanes (airplane_id)
);

use myRealTrip;
# 비행기 예매
drop table airplane_reservations;

select * from airplane_reservations;


create table airplane_reservations
(
    airplane_reservation_id      bigint primary key auto_increment,
    airplane_reservation_regTime datetime default now(),
    airplane_pay                 varchar(3000) not null,
    airplane_id                  bigint references airplanes (airplane_id),
    user_id                      bigint references users (user_id)
);
# 비행기 운행 항공사를 1개에서 2개로 추가한다. IN 입국 : OUT : 출국
ALTER TABLE airplane_reservations
    DROP COLUMN airplane_id;
use myRealTrip;
select * from airplane_reservations;

-- Then, add the new columns in_airplane_id and out_airplane_id
ALTER TABLE airplane_reservations
    ADD COLUMN in_airplane_id bigint,
    ADD COLUMN out_airplane_id bigint;
ALTER TABLE airplane_reservations
    ADD COLUMN peopleCount bigint;

# 항공권 공지사항
create table air_notices
(
    notice_id         bigint primary key auto_increment,
    notice_title      varchar(300)  not null,
    notice_details    varchar(3000) not null,
    notice_regTime    dateTime default now(),
    notice_updateTime dateTime default now(),
    admin_id          bigint references admin (admin_id)
);


create table air_code(
    air_code_id BIGINT PRIMARY key AUTO_INCREMENT,
    air_code_iata varchar(3000) not null,
    air_code_loc varchar(3000) not null,
    air_code_default_price bigint
);

INSERT INTO air_code (air_code_iata, air_code_loc, air_code_default_price) VALUES
    ('LGA', '뉴욕', 1500000),
    ('FLR', '피렌체', 2000000),
    ('LAS', '라스베가스', 1800000),
    ('CDG', '파리', 2200000),
    ('LHR', '런던', 2300000),
    ('BCN', '바르셀로나', 2100000),
    ('FCO', '로마', 1900000),
    ('ZRH', '루체른', 2500000),
    ('BRN', '인터라켄', 2400000),
    ('MAD', '세고비아', 2600000),
    ('MAD', '톨레도', 2600000),
    ('DXB', '두바이', 2700000),
    ('HND', '도쿄', 150000);

use myRealTrip;
select * from air_code;

insert into air_notices (notice_title,notice_details,notice_regTime,notice_updateTime,admin_id)
values('Myrealtrip 클론프로젝트 공지사항입니다.','Myrealtrip 클론프로젝트 공지사항입니다. 화이팅',now(),now(),3);

insert into air_notices (notice_title,notice_details,notice_regTime,notice_updateTime,admin_id)
values('여행지는 12개의 도시에 여행이 가능합니다.','Myrealtrip 여행 도시 안내를 위한 공지사항입니다. ',now(),now(),3);

insert into air_notices (notice_title,notice_details,notice_regTime,notice_updateTime,admin_id)
values('궁금한 내용은 우측 하단에 메세지를 통해서 실시간 문의가 가능합니다.','Myrealtrip 공지사항 안내를 위한 공지사항입니다. ',now(),now(),3);

insert into air_notices (notice_title,notice_details,notice_regTime,notice_updateTime,admin_id)
values('개발 내용에 대한 코드는 YUYOHAN님에게 물어보면 됩니다.','Myrealtrip 코드 안내를 위한 공지사항입니다. ',now(),now(),3);

insert into air_notices (notice_title,notice_details,notice_regTime,notice_updateTime,admin_id)
values('비가 많이 오는 날은 비행기 운행이 지연될 수 있어요','Myrealtrip 운행 지연 안내를 위한 공지사항입니다. ',now(),now(),3);

insert into air_notices (notice_title, notice_details, notice_regTime, notice_updateTime, admin_id)
values('유류할증료 인상 예정 안내', '2023년 8월 1일부터 유류할증료가 인상될 예정입니다.', now(), now(), 3);

insert into air_notices (notice_title, notice_details, notice_regTime, notice_updateTime, admin_id)
values('신규 노선 안내', 'Myrealtrip에서 새로운 국제 노선을 추가합니다.', now(), now(), 3);

insert into air_notices (notice_title, notice_details, notice_regTime, notice_updateTime, admin_id)
values('항공권 할인 이벤트', '다가오는 여름을 맞이하여 항공권 할인 이벤트를 진행합니다.', now(), now(), 3);

insert into air_notices (notice_title, notice_details, notice_regTime, notice_updateTime, admin_id)
values('탑승 수속 절차 변경 안내', '탑승 수속 절차가 변경되었습니다. 자세한 내용은 공지사항을 확인하세요.', now(), now(), 3);

insert into air_notices (notice_title, notice_details, notice_regTime, notice_updateTime, admin_id)
values('COVID-19 방역 지침 안내', 'COVID-19 관련 방역 지침을 준수해주시기 바랍니다.', now(), now(), 3);

insert into air_notices (notice_title, notice_details, notice_regTime, notice_updateTime, admin_id)
values('기내 서비스 변경 안내', '기내에서 제공되는 서비스가 일부 변경되었습니다.', now(), now(), 3);

insert into air_notices (notice_title, notice_details, notice_regTime, notice_updateTime, admin_id)
values('수하물 규정 변경 안내', '수하물 규정이 변경되었습니다. 새로운 규정을 확인해 주세요.', now(), now(), 3);

insert into air_notices (notice_title, notice_details, notice_regTime, notice_updateTime, admin_id)
values('기상 악화로 인한 항공편 지연 안내', '기상 악화로 인해 항공편이 지연될 수 있습니다.', now(), now(), 3);

insert into air_notices (notice_title, notice_details, notice_regTime, notice_updateTime, admin_id)
values('마일리지 적립 프로모션', '마일리지 적립 프로모션을 진행 중입니다. 많은 참여 부탁드립니다.', now(), now(), 3);

insert into air_notices (notice_title, notice_details, notice_regTime, notice_updateTime, admin_id)
values('여권 유효기간 확인 안내', '탑승 전에 여권 유효기간을 확인해 주세요.', now(), now(), 3);




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



create table airPay
(
    air_pay_id              bigint primary key auto_increment,
    dateFilter              varchar(300)  not null,
    airLine                 varchar(300)  not null,
    airNum                  varchar(1000) not null,
    departure               varchar(300)  not null,
    arrive                  varchar(300)  not null,
    user_id                 bigint references users (user_id)
);

create table hotelPay
(
    hotel_pay_id         bigint primary key auto_increment,
    dateFilter           varchar(300)  not null,
    hotelName            varchar(300)  not null,
    hotelImg             varchar(1000) not null,
    user_id              bigint references users (user_id)
);

# 결제
create table pay
(
    pay_id    bigint primary key auto_increment,
    final_pay varchar(3000) not null,
    pay_bank  varchar(1000) not null,
    pay_date  datetime default now(),
    air_pay_id bigint references airPay(air_pay_id),
    hotel_pay_id bigint references hotelPay(hotel_pay_id)
);

drop table pay;
drop table airPay;
drop table hotelPay;


#메인 상세화면
create table mainDetail
(
    mainDetail_id       bigint primary key auto_increment,
    mainDetail_title    varchar(1000)  not null,
    mainDetail_price    varchar(3000) not null,
    mainDetail_option   varchar(3000) not null,
    content_image       varchar(4000) not null,
    content             varchar(4000) not null,
    place_id            bigint references recommendedPlace (place_id)

);

drop table maindetail;

insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('[강원] 설악산 & 낙산사 당일여행(서울출발)', '104,500원 / 1인', 'e-ticket, 차량이동',
        'https://d2ur7st6jjikze.cloudfront.net/offer_photos/83598/660484_large_1658984556.jpg?1658984556',
       '서울에서 출발하여 산과 바다를 한번에
        ● 매주 [월, 금]에 진행하는 상품입니다.
        ●가볍게 떠나는 서울 근교 버스여행
        ●계절마다 바뀌는 화려함과 웅장함속에서의 힐링
        ●고요한 사찰에서 내 눈앞에 펼쳐진 동해바다의 절경
        ● 1명이어도 언제든지 출발 가능합니다. (최소 예약인원 없음)',
       1);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('서울 <-> 에버래드 셔틀버스 티켓(합정역, 홍대입구, 서울역)', '12,000원 / 1인', 'e-ticket, 한국어',
        'https://d2ur7st6jjikze.cloudfront.net/offer_photos/82076/503193_large_1586744690.jpg?1586744690',
        '서울에서 환상의 나라 에버랜드와 캐리비안베이까지 빠르고 편리한 셔틀버스를 타고 이동해보세요!
        [ 이 티켓의 매력 포인트! ]
        • 복잡한 대중교통과 수많은 인파 걱정 끝! 전문 운전기사가 운행하는 셔틀버스를 이용해 서울 근교의 에버랜드로 떠나보세요.
        • 명동역, 홍대입구역, 서울역 등 다양한 장소에서 탑승 가능합니다.
        • 목적지를 오가는 동안 충분한 소지품 수납공간이 준비된 포근한 좌석에 앉아 편안히 휴식을 취해보세요.

        서울에서 스릴과 모험이 가득한 에버랜드까지 빠르게 이동하는 편안한 셔틀버스를 이용해보세요. 편리한 셔틀버스와 함께라면 시간도 절약되고,
        붐비는 대중교통을 이용하지 않아도 되니, 신나는 하루를 순조롭게 시작할 수 있어요. 다양한 셔틀버스 출발 시간과 출발 장소를 활용해 서울
        근교의 인기 만점 놀이공원, 에버랜드까지 걱정 없이 이동하세요. 그뿐만 아니라 포근한 좌석과 최신식 시설, 빠른 서비스 등 여러 가지 편의를 제공합니다.
        지금 부담 없는 가격에 예약하고, 환상의 나라로 떠나보세요!',
        2);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('[수도권] 운전 걱정 없는 골프장 이동서비스 LANE4 GOLF', '492,000원 / 1인', 'e-ticket, 한국어',
        'https://d2ur7st6jjikze.cloudfront.net/offer_photos/138471/871462_large_1693374063.jpg?1693374063',
        '✅LANE4 GOLF의 특징
        1 동반자와 함께 이동하세요!  본인 외 동반자 집 앞까지 픽업, 경유, 샌딩 OK!
        2 라운딩에만 집중! 이동 중 충분한 휴식이 가능합니다:) 새벽부터 피곤하고 힘든 운전 NO!
        3 넓은 공간감과 적재 공간! 최대 4인, 골프백 5개까지 OK!
        4 라운딩 후 음주도 편안하게! 자차 운전이나 대리 운전 NO!
        5 플랫폼운송사업자(Type1)로 합법적 운송 서비스 지원! 사고 보상도(유상운송특약) OK!
        6 차량, 기사, 유류비 포함 요금! 자차 운전으로 손실되는 기회 비용 NO!

        ✅ 공지사항
        - 서비스 이용 시 시간/거리가 초과될 시 1~2일내 추가 결제가 진행됩니다!
         ✔  시간/거리 초과 시 1분당 600원 / 1km당 400원',
        3);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('[서울/경기] LANE4 프리미엄 공항이동 서비스', '48,000원 / 1인', 'e-ticket, 한국어',
        'https://d2ur7st6jjikze.cloudfront.net/offer_photos/136856/849897_large_1689669348.jpg?1689669348',
        '✅ LANE4를 선택 해야 하는 이유
        1. 프리미엄 모빌리티 서비스에 합리적인 가격까지!👍
        사전확정요금제로 합리적인 가격과 프리미엄 차량과 기사를 한번에~
        2. 새벽/심야 시간, 언제든지!🔆🌝
        차량을 호출하기  부담스러운 시간도 편리하게
        3. 인원이 많아도, 짐이 많아도 OK!
        최대 7인, 캐리어 5개까지👌
        4. 주차공간 고민 NO! 주차비 부담 NO!
        항공편 연착 시 최대 2시간까지 추가 비용 NO! 🅿
        5. 항공 피켓팅부터 이동까지 한번에~
        완변한 VIP 의전 서비스 지원👑
        6. 플랫폼운송사업허가(Type1)
        국토부로부터 부여 받은 합법적인 운송 서비스 📑',
        4);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('[강원/투어] 초보자를 위한 명상 리트릿 버스 여행(1박 2일)', '199,000원 / 1인', 'e-ticket, 한국어',
        'https://d2ur7st6jjikze.cloudfront.net/offer_photos/102881/561206_large_1617243340.jpg?1617243340',
        '어서와 명상은 처음이지?
        * 주말과 공휴일에만 진행되는 투어입니다. *

        매력 포인트 -  강원도 청정지역에서 맛보는 자연과 하나 되는 명상 리트릿!!

        안녕하세요, 오랫동안 몸과 마음을 공부하고 여행을 좋아하여
        명상 전문 여행사를 만든 마음챙김여행입니다.
        청정내 설악, 강원도의 산과 바다. 그리고 내 마음을 일깨워주는 명상 리트릿을 소개합니다.

        *고성 핫플 아야진해변과 바다 정원 카페를 갑니다 (2시간)
        * 4만 평 넓은 소나무숲에 둘러싸인 미리내힐빙스테이에서 명상 리트릿 체험
        1부 : 명상에 대한 오해와 이해 (1시간 30분)
        2부: 숙면을 돕는 소도구 테라피와 소리 명상 (1시간 30분)
        3부: 내 마음을 부탁해, 일상에 명상 적용하기 (2시간)

        * 속초에서 바다와 갯배 그리고 먹거리가 가득한 중앙시장 둘러보기 (2시간)

        * 강원도 현지에서 재배하는 로컬푸드로 만든  웰빙 식단 4식 포함',
        5);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('[강원/고성] 설악썬벨리', '383,000원 / 1인', 'e-ticket, 한국어',
        'https://d2ur7st6jjikze.cloudfront.net/offer_photos/83638/512743_large_1590647992.jpg?1590647992',
        '[이 골프장의 매력 포인트]
        - 탁 트인 동해바다와 설악산의 울산바위가 어우러진 제일의 절경!
        - 지중해풍 최고급 콘도미니엄과 27홀의 환상적인 골프장
        - 4계절 내내 골프를 즐길 수 있는 최상의 환경

        ■ 티켓 예약 방법
        - 캘린더에서 이용 일자와 인원을 선택해 주세요.
        - 예약 확정시까지 약 3일정도 시간이 소요됩니다.
        - 자세한 사항은 문의하기를 이용해주세요.',
        6);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('설악산뷰  숙박 해맞이여행 그림책명상 1박2일', '290,000원 / 1인', 'e-ticket, 한국어',
        'https://d2ur7st6jjikze.cloudfront.net/offer_photos/145171/947844_large_1702378270.jpg?1702378270',
        '2024년 1월1일 해맞이 투어
        2023년을 멋지게 마무리하고 새해를 맞이하는
        자작나무숲 눈꽃트래킹과 그림책명상 1박2일여행입니다
         강원도 설악산 설경이 아름다운 인제에서 하룻밤을 보냅니다
        원대리 자작나무숲의 겨울설경은 소문이 자자한것 아시죠?
        숲속의 귀족자작나무숲을 고요히 걸어보고  저녁에는
        그림책명상으로 한해를 정리해 봅니다.
        새해 아침  속초바다의 뜨거운 새해를 맞이하며
        2024년도 힘차게 출발해보아요. !!',
        7);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('[강원 고성] 고고비치서프 렌탈+강습 패키지', '105,000원 / 1인', 'e-ticket, 한국어',
        'https://d2ur7st6jjikze.cloudfront.net/offer_descriptive_images/103703/477540_medium_1713514611.jpg?1713514611',
        '추가정보
        [추가정보]
        - 강습시간은 10시, 14시 중 선택 가능 합니다.
        - 강습 30분 전 도착 부탁드립니다.
        - 상품구매 후 강습날짜와 강습시간을 꼭 예약하셔야합니다.
        - 보드렌탈할인권은 재방문시에만 사용 가능합니다.(자세한 사항은 현장문의)
        - 성수기는 7월 중순~8월 말이며 그 외에는 모두 비수기 티켓 사용 가능합니다.
        - 6세~초등학생은 부모님동반필수입니다.
        - 예약시 픽업신청가능하오니,픽업관련 현장문의바랍니다.',
        8);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('소노 델피노 기획전', '164,000원 / 1인', 'e-ticket, 한국어',
        'https://d2ur7st6jjikze.cloudfront.net/offer_descriptive_images/156748/514877_medium_1721716384.jpg?1721716384',
        '추가정보
        [공통 객실 정보]
        ▶ 전자레인지 구성 없음
        ▶ 객실 내 OTT 서비스 지원 불가
        ▶ 유아용품 및 유아용베드 대여 불가
        ▶ 엑스트라 베드 추가 불가
        ▶ 침구류 추가 가능
        ▶ 상위 객실 업그레이드 불가',
        9);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('[특가] 롯데월드 어드벤처 종합&파크이용권', '23,000원 / 1인', 'e-ticket, 한국어',
        'https://d2ur7st6jjikze.cloudfront.net/offer_descriptive_images/70816/514041_medium_1721574130.jpg?1721574130',
        '[추가정보]
        - 본 티켓은 입장 게이트에서 QR코드 인증 후 바로입장이 가능합니다.
        - 36개월 미만의 유아는 증빙서류를 지참 시 무료입장 가능합니다. (단, 무료 입장에 대한 혜택이며 놀이시설 이용시 별도의 요금이 부과됩니다.)
        - 발송되는 QR코드 캡쳐 이용시 입장이 제한될 수 있습니다.
        - 퇴장 후 재입장이 불가하오니 이용에 참고 부탁드리겠습니다.
        - 주중/주말 동일 이용 상품입니다.
        - 부분 환불 불가합니다.
        - 2인권(어른1+어린이1) 옵션은 부분환불 불가하오니 참고 부탁드립니다.',
        10);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('[1일권] 오사카 유니버셜 스튜디오 재팬 입장권', '75,100원 / 1인', 'e-ticket, 프린트 바우처',
        'https://d2ur7st6jjikze.cloudfront.net/offer_descriptive_images/50211/356870_medium_1686803986.jpg?1686803986',
        '상품 정보
        포함 사항
        - 유니버셜 스튜디오 재팬 1일권

        불포함 사항
        - 익스프레스 패스
        - 특정 기간동안 운영하는 어트랙션
        - 슈퍼 닌텐도 월드 입장권',
        11);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('[특가] 캐리비안베이 입장권 + 에버랜드 오후이용권', '50,440원 / 1인', 'e-ticket, 한국어',
        'https://d2ur7st6jjikze.cloudfront.net/offer_descriptive_images/135498/516036_medium_1721950415.jpg?1721950415',
        '- 대/소 공통 이용 가능하며 36개월부터 요금 적용됩니다.
        - 자켓, 실내락커 ,코인물, 대여물 등은 별도 요금이 부과됩니다.
        - 개인 타월 및 수영복은 개별 준비 바랍니다.
        - 워터파크 특성상 안전을 위하여 제한물품(음식물,돗자리 등) 검사를 할 수 있으니 입장 전 보관소에 맡겨 주시기 바랍니다.
        - 정문주차장/4주차장은 유료, 그외 외곽주차장은 무료로 운영됩니다.
        - QR코드의 사진을 판매사이트에 그대로 올리는 경우 제3자의 무단 도용에  따른 피해가 발생할 수 있습니다.
        - 방문 전 캐리비안베이 홈페이지 또는 앱을 참고하세요.',
        12);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('[특가] [서울 잠실] 롯데월드타워 전망대 서울스카이 입장권', '21,500원 / 1인', 'e-ticket, 한국어',
        'https://d2ur7st6jjikze.cloudfront.net/offer_descriptive_images/103264/514001_medium_1721574075.jpg?1721574075',
        '[추가정보]
        - ★구매 관련 필독 공지★
        - 구매 후 재판매 관련 이슈로 인당 구매 수량을 제한합니다.
        - 중고 사이트에서 재판매 또는 구매 시 발생한 불이익이 대해서는 해당 시설 및 판매사에서 책임지지 않습니다.
        - 동일번호로 최대 4매까지 구매 가능하며 이상 구매 사례 확인 시, 자동 취소될 수 있는 점 안내드립니다.


        - 평일권은 주말 및 공휴일 이용 불가합니다.
        - 본 티켓으로는 서울스카이 모바일 앱 및 온라인 홈페이지에서 사전예약이 불가능하며, 현장에서만 이용가능 합니다.
        - 재판매로 인한 모든 법적인 문제는 해당 시설 및 판매사에서 책임지지 않습니다
        - 입장 마감시간을 꼭 확인해 주시기 바랍니다.',
        13);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('[특가] [서울 잠실] 롯데월드 아쿠아리움 입장권', '23,500원 / 1인', 'e-ticket, 한국어',
        'https://d2ur7st6jjikze.cloudfront.net/offer_descriptive_images/103264/514001_medium_1721574075.jpg?1721574075',
        '[추가정보]
        - ★구매 관련 필독 공지★
        - 구매 후 재판매 관련 이슈로 인당 구매 수량을 제한합니다.
        - 중고 사이트에서 재판매 또는 구매 시 발생한 불이익이 대해서는 해당 시설 및 판매사에서 책임지지 않습니다.
        - 동일번호로 최대 4매까지 구매 가능하며 이상 구매 사례 확인 시, 자동 취소될 수 있는 점 안내드립니다.

        - [시설 이용안내]
        - 롯데월드 아쿠아리움 게이트에서 바코드 제시 후 바로 입장
        - 평일권은 주말 및 공휴일 이용 불가합니다.
        - 36개월 미만 소아는 보호자 동반 하 1명에 한해 무료 입장입니다.(증빙서류 필수)',
        14);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('[특가]에버랜드 오후이용권(방문날짜 지정)', '25,000원 / 1인', 'e-ticket, 한국어',
        'https://d2ur7st6jjikze.cloudfront.net/offer_descriptive_images/43365/511507_medium_1721009167.jpg?1721009167',
        '사용 방법
        - 판매기간 : ~ 2024.09.06
        - 유효기간 : 2024.06.17 ~ 2024.09.06

        - 1.상품구매
        - 2.문자로 QR 코드수신
        - 3.MMS 상단에 보여지는 QR코드를 에버랜드 App에 등록 후 에버랜드 정문에서 제시 후 입장

        - ※ QR코드를 못받으신 경우 방문전 야놀자 고객센터(1599-8370)를 통해 재발송 요청 바랍니다.
        - 에버랜드 방문하여 확인 요청시 입장이 지연될 수 있습니다.
        - (응대 가능시간:~18시)',
        15);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('[부산] 부산투어패스 부산여행 프리패스권', '17,300원 / 1인', 'e-ticket, 한국어',
        'https://d2ur7st6jjikze.cloudfront.net/offer_descriptive_images/113378/497147_medium_1718176500.jpg?1718176500',
        '사용 방법
        ① 기재해주신 핸드폰 번호로 카카오톡 알림톡을 발송해드립니다.
        · 발신자: 엘에스컴퍼니
        · 통신사별로 바코드 티켓 수령시간에 다소 차이가 있을 수 있습니다.
        ② 매표소 또는 입구에서 수신한 바코드를 제시하여 입장해주세요.',
        16);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('[제주서쪽] 제주1번가 프리미엄 서쪽 감성 제주도 버스투어', '31,255원 / 1인', 'e-ticket, 한국어',
        'https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/05/26/A8Sz/qi30ZxiwaQ.jpg',
        '🚌 제주1번가 버스투어
        - 마이리얼트립 판매 8개월만에 제주도 버스투어(가이드투어) 부분 판매량 1등(서쪽)/ 4등(동쪽)을 달성

        - 제주도 패키지 판매 압도적 1등
        - 서쪽/동쪽/남쪽~우도에서 마라도 가파도까지 제주를 다~보고싶은 여행잘들을 위해 가성비 넘치는 투어를 준비했어요!
        - 계절별 제주전문가가 알려주는 핫플레이스부터 소소한 여행TIP까지!

        😎 이런 분들에게 추천합니다.
        - 벌써부터 갈 곳을 찾아볼 생각에 머리가 복잡하신 분
        - 이번 여행은 브레이크 없이! 운전 계획이 없으신 분
        - 계절마다 다른 제주, 지금 이 계절 최고의 감성 스팟을 여행하고 싶으신 분
        - 원하는 점심 메뉴, 노 옵션, 노 쇼핑! 자유로운 투어를 좋아하시는 분
        - 혼자 떠나는 제주 여행자, 뚜벅이 제주 여행자',
        17);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('[제주동쪽] 제주1번가 프리미엄 동쪽 감성 제주도 버스투어', '23,655원 / 1인', 'e-ticket, 한국어',
        'https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/05/26/y2Wh/7CgpUlckg7.jpg',
        '🚌 제주1번가 버스투어
        - 마이리얼트립 판매 8개월만에 제주도 버스투어(가이드투어) 부분 판매량 1등(서쪽)/ 4등(동쪽)을 달성

        - 제주도 패키지 판매 압도적 1등
        - 서쪽/동쪽/남쪽~우도에서 마라도 가파도까지 제주를 다~보고싶은 여행잘들을 위해 가성비 넘치는 투어를 준비했어요!
        - 계절별 제주전문가가 알려주는 핫플레이스부터 소소한 여행TIP까지!

        😎 이런 분들에게 추천합니다.
        - 벌써부터 갈 곳을 찾아볼 생각에 머리가 복잡하신 분
        - 이번 여행은 브레이크 없이! 운전 계획이 없으신 분
        - 계절마다 다른 제주, 지금 이 계절 최고의 감성 스팟을 여행하고 싶으신 분
        - 원하는 점심 메뉴, 노 옵션, 노 쇼핑! 자유로운 투어를 좋아하시는 분
        - 혼자 떠나는 제주 여행자, 뚜벅이 제주 여행자',
        18);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('[우도] 제주도 우도 1일 버스여행 원데이 패키지', '31,350원 / 1인', 'e-ticket, 한국어',
        'https://d2ur7st6jjikze.cloudfront.net/offer_photos/84057/537960_large_1599919724.jpg?1599919724',
        '🚎 제주 핫플버스 Point!

        - 찐! 핫플과 테마가 있는 갓성비 투어에요
        - 제주 NO.1 감성투어 플랫폼 ! 매일 출발하는 제주핫플버스의 제주 우도 투어에요
        - 한국여행업협회 우수여행상품 선정, 제주관광협회 우수관광사업체 지정된 믿을 수 있는 투어에요

        💁‍♂️ 이런점이 좋은 투어에요
        - 투어를 예약하신 여행자님들께 📢[생수와 오메기떡] 제공드립니다.
        - 📢[당일 복권 이벤트], [매월 후기 이벤트] 등을 다양한 이벤트도 준비되어 있습니다.
        - 팁이나 옵션 등 추가 비용이 전혀 없습니다. (차량료, 입장료, 가이드, 공항 샌딩 모두 포함)
        - 투어 코스 내 중간 합류 및 하차 가능합니다.
        - 내 입맛대로 자유롭고 여유있게 개별 식사로 점심시간이 주어집니다.
        - 제주 토박이 기사님의 생생한 제주이야기로 지루할 틈이 없어요.
        - 캐리어 소지하신후, 버스 탑승도 가능합니다.',
        19);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('제주동쪽 트립이즈마인 제주도  동부 프리미엄 리무진 버스여행', '37,810원 / 1인', 'e-ticket, 한국어',
        'https://d2ur7st6jjikze.cloudfront.net/offer_photos/102533/566665_large_1622544416.jpg?1622544416',
        '포함 사항
        - 차량료
        - 기사님 봉사료
        - 휴애리 입장료(13,000원)
        - 허브동산 + 족욕 입장료(24,000원)
        - 생수&오메기떡

        불포함 사항
        - 자유 점심 식사비
        - 여행자 보험',
        20);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('제주 여행 필수템 카페패스! 인기카페 3일 무제한', '12,510원 / 1인', 'e-ticket, 한국어',
        'https://d2ur7st6jjikze.cloudfront.net/offer_descriptive_images/81174/508702_medium_1720164503.jpg?1720164503',
        '■ 카페패스(CAFEPASS)는?

        제주 여행에서 결코 빼먹을 수 없는 카페 자유 이용권 입니다.
        제주도 내 180여 곳의 인기 카페에서 3시간마다 1잔씩 자유롭게 즐겨보세요.
        제주 입도 전, 구매! 제주도에 오신 후 사용 등록을 하시고 최대한 알뜰하게 사용해 보세요.
        소중한 여행을 카페패스와 함께 행복한 시간 보내세요.
        제주패스의 카페패스 이용권 한 장이면 충분합니다.

        - 전송받은 카페패스 이용권 코드를 제주패스 홈페이지에서 등록 후 이용해주세요.
        - 유효 기간 : 2024년 9월 30일까지

        - 주요 인기카페: 보래드베이커스, 원앤온리, 서귀피안베이커리, 바이러닉 에스프레소바, 안도르, 레이오버 등',
        21);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('[제주] 아르떼뮤지엄 입장권', '8,900원 / 1인', 'e-ticket, 한국어',
        'https://d2ur7st6jjikze.cloudfront.net/offer_descriptive_images/100914/512459_medium_1721196746.jpg?1721196746',
        '추가정보
        - 1인 입장권 + ARTE TEA BAR: 1인 체험 이용티켓으로 입장권만 구매한 일행은 TEA BAR 입장 불가하며, 입장을 원할 경우 체험티켓을 현장에서 추가 결제(4,000원) 후 입장가능합니다.
        - 개인 위생용품(마스크) 착용자에 한하여 입장이 가능합니다.
        - 입장 후 환불이 불가하며, 퇴장 후 재입장이 불가합니다.
        - 할인(현장결제) : 미취학 아동(4세~7세), 경로 (65세 이상), 장애인,유공자,군인',
        22);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('[안덕] 제주 뽀로로 앤 타요 테마파크', '8,900원 / 1인', 'e-ticket, 한국어',
        'https://d2ur7st6jjikze.cloudfront.net/offer_descriptive_images/73268/383259_medium_1688634741.jpg?1688634741',
        '[기타안내]
        - 티켓 구매 1시간 이후 사용 가능합니다.
        - 구매인원수대로 입장하셔야 하며 입장인원 변경시 환불 후 재구매 해주세요.
        - 구매하신 인원 수대로 바코드 발송됩니다.
        - 렌터카 및 자가운전자만 이용 가능합니다.
        - 단체관광 및 운전기사, 가이드 동반, 렌터카 기사 대여, 택시 이용 시 사용이 불가합니다.
        - 관광지 폐장 1시간 전까지 입장해주셔야 관람이 편리합니다.
        - 기상 악화시에는 이용이 불가할수 있으니 해당 업체로 직접 문의후 이용바랍니다.
        - 브이패스 고객센터 : 064-723-1551/ 09:00~18:00 (점심시간 12:00~13:00 / 연중무휴)',
        23);
insert into mainDetail (mainDetail_title, mainDetail_price, mainDetail_option, content_image,content,place_id)
values ('[제주 애월] 9.81 파크 제주 카트 이용권', '33,465원 / 1인', 'e-ticket, 한국어',
        'https://d2ur7st6jjikze.cloudfront.net/offer_descriptive_images/101144/440951_medium_1705481562.jpg?1705481562',
        '▶▶▶▶ 마이리얼트립에서 미리 예약하고 남들보다 빠르고 쉽게 이용하는 방법◀◀◀◀

        \n[1] 나에게 딱 맞는 패키지와 이용 시간을 선택하세요.
        \n[2] 결제가 완료되면 카카오톡으로 예약번호 9자리를 보내드려요.
        \n 예시 : >> 영문 대문자, 숫자 조합 (예. I4AYTO868)
        \n[3] 이용 당일 9.81 파크 티켓 키오스크에 예약번호를 입력하고 팔찌형 티켓으로 교환하세요.
        \n[4] 액티비티 이용 시 팔찌로 편하게 태그하고 즐기기만 하면 돼요!'')',
        24);









# rooms 테이블에 room_name 컬럼 추가
alter table rooms add column room_name varchar(1000) not null after room_id;

# table room_reservations 테이블에 room_breakfast 컬럼 추가
alter table room_reservations add column room_breakfast varchar(1000) not null after room_reservations_total_price;

# hotels 테이블에 hotel_city 컬럼 추가
alter table hotels add column hotel_city varchar(1000) not null after hotel_location;

# 뉴욕
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('파크 레인 뉴욕', '36 Central Park S, New York, New York, 미국, 10019', '파크 레인 뉴욕은 센트럴 파크 남쪽에 위치한 럭셔리 호텔로, 공원의 아름다운 전망을 제공합니다. 세련된 객실과 다양한 편의 시설을 갖추고 있으며, 뉴욕의 주요 관광지와 인접해 있습니다. 우아한 레스토랑과 바, 피트니스 센터를 갖추고 있어 편안한 휴식을 즐길 수 있습니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('클럽 쿼터스 호텔, 월드 트레이드 센터', '140 Washington St, New York, New York, 미국, 10006', '클럽 쿼터스 호텔, 월드 트레이드 센터는 뉴욕의 금융 지구에 위치해 있으며, 현대적인 편안함과 뛰어난 접근성을 제공합니다. 비즈니스 여행객을 위한 다양한 시설을 갖추고 있으며, 유명한 월드 트레이드 센터와 인접해 있습니다. 세련된 객실과 친절한 서비스를 제공합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('힐튼 가든 인 뉴욕 타임스 스퀘어 사우스', '326 W 37th St, New York, New York, 미국, 10018', '힐튼 가든 인 뉴욕 타임스 스퀘어 사우스는 뉴욕의 활기찬 타임스 스퀘어 인근에 위치해 있으며, 편리한 위치와 현대적인 편의 시설을 갖추고 있습니다. 넓고 안락한 객실과 다양한 편의 시설을 제공하며, 관광과 비즈니스 모두에 적합한 선택입니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('하얏트 그랜드 센트럴 뉴욕', '109 East 42nd Street, at Grand Central Terminal, New York, New York, 미국, 10017', '하얏트 그랜드 센트럴 뉴욕은 그랜드 센트럴 터미널과 직접 연결된 고급 호텔로, 뉴욕의 중심부에 위치해 있어 편리한 접근성을 자랑합니다. 넓고 편안한 객실과 다양한 부대 시설을 갖추고 있으며, 비즈니스와 관광 모두에 이상적인 장소입니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('뉴욕 힐튼 미드타운', '1335 Avenue Of The Americas, New York, New York, 미국, 10019', '뉴욕 힐튼 미드타운은 뉴욕의 중심부에 위치한 대형 호텔로, 주요 관광 명소와 비즈니스 지구에 가까워 편리한 위치를 자랑합니다. 고급스러운 객실과 다양한 부대 시설을 제공하며, 대규모 회의 및 이벤트를 위한 최적의 장소입니다.', 3);

insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/09/04/yrDp/8lQ3VvthdL.jpg?width=980&height=735&quality=90', 1);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/25/WNoX/iTwQCbJJXF.jpg?width=980&height=735&quality=90', 2);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/27/UEpm/prDd1us92k.jpg?width=980&height=735&quality=90', 3);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/05/07/7Li4/e5dEGz8t3X.jpg?width=980&height=735&quality=90', 4);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/07/08/jgW1/8Fmw14GIKS.jpg?width=980&height=735&quality=90', 5);

insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸, 킹사이즈침대 1개 (Park Lane)', 'RESERVATION_O', 2, '213000', '킹사이즈침대 1개, 성인 2명, 객실 크기(㎡) - 33, 무료 유아용 침대, 타월 제공됨, 에어컨', 1);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸, 킹사이즈침대 1개, 시내 전망', 'RESERVATION_O', 2, '176000', '킹사이즈침대 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 33, 무료 유아용 침대, 타월 제공됨', 1);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('파크 레인 (킹베드)', 'RESERVATION_O', 2, '335000', '킹베드 1개, 성인 2명, 안뜰 전망, 객실 크기(㎡) - 32, 목욕 가운, 에어컨', 1);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('클럽룸, 퀸사이즈침대 1개', 'RESERVATION_O', 2, '373000', '퀸사이즈침대 1개, 성인 2명, 객실 크기(㎡) - 18, 타월 제공됨, 커피/티 메이커, 룸서비스(이용 시간 제한)', 2);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드룸, 장애인 지원 (Mobility)', 'RESERVATION_O', 2, '387000', '퀸사이즈침대 1개, 성인 2명, 객실 크기(㎡) - 22, 타월 제공됨, 커피/티 메이커, 룸서비스(이용 시간 제한)', 2);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드룸, 퀸사이즈침대 1개', 'RESERVATION_O', 2, '418000', '퀸사이즈침대 1개, 성인 2명, 객실 크기(㎡) - 22, 타월 제공됨, 커피/티 메이커, 룸서비스(이용 시간 제한)', 2);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸 (킹베드)', 'RESERVATION_O', 2, '296000', '킹베드 1개 또는 더블베드 1개 또는 슈퍼 킹베드 1개, 성인 2명, 헤어드라이어, 에어컨, 커피/티 메이커, 일일 청소 서비스', 3);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸 (도착 시 배정)', 'RESERVATION_O', 2, '383000', '싱글베드 1개, 성인 2명, 헤어드라이어, 에어컨, 커피/티 메이커, 일일 청소 서비스', 3);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸 (킹베드)', 'RESERVATION_O', 2, '325000', '킹베드 1개, 성인 2명, 객실 크기(㎡) - 30, 목욕 가운, 에어컨, 커피/티 메이커', 3);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸, 킹사이즈침대 1개', 'RESERVATION_O', 2, '374000', '킹사이즈침대 1개, 성인 2명, 객실 크기(㎡) - 28, 간이/추가 침대(요금 별도),무료 유아용 침대, 타월 제공됨, 냉장고', 4);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸, 킹사이즈침대 1개, 장애인 지원, 욕조', 'RESERVATION_O', 2, '333000', '킹사이즈침대 1개, 성인 2명, 객실 크기(㎡) - 28, 침대 수 - 1,간이/추가 침대(요금 별도),무료 유아용 침대, 타월 제공됨, 냉장고', 4);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('디럭스룸, 킹사이즈침대 1개', 'RESERVATION_O', 2, '411000', '킹사이즈침대 1개, 성인 2명, 객실 크기(㎡) - 30, 간이/추가 침대(요금 별도),무료 유아용 침대, 타월 제공됨, 냉장고', 4);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸, 퀸사이즈침대 1개', 'RESERVATION_O', 2, '405000', '퀸사이즈침대 1개, 성인 2명, 침대 수 - 2,무료 유아용 침대, 욕조 또는 샤워, 매일 하우스키핑, 암막 커튼', 5);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸, 킹사이즈침대 1개', 'RESERVATION_O', 2, '231000', '킹사이즈침대 1개, 성인 2명, 객실 크기(㎡) - 31, 침대 수 - 2,소파베드,무료 유아용 침대, 욕조 또는 샤워, 매일 하우스키핑', 5);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸, 킹사이즈침대 1개, 장애인 지원 (Hearing)', 'RESERVATION_O', 2, '375000', '킹사이즈침대 1개, 성인 2명, 객실 크기(㎡) - 31, 침대 수 - 2,무료 유아용 침대, 욕조 또는 샤워, 매일 하우스키핑', 5);

insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/10000/2800/2714/d1f4f691_z.jpg', 1);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/10000/2800/2714/fecad066_z.jpg', 2);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/336421490.jpg?k=145c55d619f26f4a19d79787d25866d6b4cdde2afdaef06a6df81de83e6d908f&o=&s=1000x', 3);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/4000000/3020000/3016300/3016212/35c4726f_z.jpg', 4);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/4000000/3020000/3016300/3016212/891f61b5_z.jpg', 5);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/4000000/3020000/3016300/3016212/33385f46_z.jpg', 6);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/2311917/506087768/20b1c4f873a76c95921403bcc2013ed3.jpg?ca=29&ce=0&s=1000x', 7);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/3591355/0/44daf18d8ca8642b4f6abd8f03f5f18a.jpg?ca=0&ce=1&s=1000x', 8);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/2311917/461797140/20b1c4f873a76c95921403bcc2013ed3.jpg?ca=24&ce=0&s=1000x', 9);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/30000/23700/23677/82825879_z.jpg', 10);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/30000/23700/23677/cfdc916d_z.jpg', 11);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/30000/23700/23677/c9615513_z.jpg', 12);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/20000/19800/19768/48db06c0_z.jpg', 13);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/20000/19800/19768/45c38643_z.jpg', 14);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/20000/19800/19768/3920c3f1_z.jpg', 15);

update hotels set hotel_city = '뉴욕' where hotel_id between 1 and 5;

# 피렌체
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('머큐어 피렌체 센트로', 'Via Nazionale 21/23 R, Florence, Fl, 이탈리아, 50123', '머큐어 피렌체 센트로는 피렌체의 중심에 위치한 현대적인 호텔로, 주요 관광 명소와 편리하게 연결되어 있습니다. 편안한 객실과 우아한 인테리어를 갖추고 있으며, 다양한 편의 시설을 제공합니다. 비즈니스와 레저 여행객 모두에게 적합한 숙소입니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('그랜드 호텔 카부르', 'Via del Proconsolo 3, Florence, FI, 이탈리아, 50122', '그랜드 호텔 카부르는 피렌체의 역사적인 중심지에 위치해 있으며, 아름다운 건축물과 세련된 객실을 자랑합니다. 호텔은 고급 레스토랑과 피트니스 센터를 갖추고 있으며, 두오모와 가까워 관광에 매우 편리합니다. 편안한 휴식을 즐길 수 있는 최적의 장소입니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('글랜스 호텔 인 플로렌스', 'Via Nazionale, 23, Florence, 이탈리아, 50123', '글랜스 호텔 인 플로렌스는 피렌체 중심부에 위치한 현대적인 호텔로, 세련된 디자인과 편리한 위치를 자랑합니다. 주요 관광 명소와 가까워 여행자들에게 이상적이며, 다양한 편의 시설과 친절한 서비스를 제공합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('호텔 알바니 피렌체', 'Via Fiume 12, Florence, FI, 이탈리아, 50123', '호텔 알바니 피렌체는 피렌체의 역사적인 중심지에 위치한 고풍스러운 호텔로, 전통적인 이탈리아 스타일의 인테리어와 현대적인 편의 시설을 갖추고 있습니다. 주요 명소와 가까워 관광에 매우 편리하며, 편안한 객실과 훌륭한 서비스를 제공합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('그랜드 호텔 발리오니', 'Piazza Unita Italiana 6, Florence, FI, 이탈리아, 50123', '그랜드 호텔 발리오니는 피렌체의 중심부에 위치한 우아한 호텔로, 역사적인 건축물과 현대적인 편의 시설이 조화를 이루고 있습니다. 넓고 안락한 객실과 훌륭한 레스토랑을 갖추고 있으며, 주요 관광 명소와 인접해 있어 편리한 숙박을 제공합니다.', 3);

insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/02/29/Fn2D/DSx9pGkO7j.jpg?width=980&height=735&quality=90', 6);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/06/09/daSf/uXRiAsjwlQ.jpg?width=980&height=735&quality=90', 7);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/26/xmyA/NWGtrijifg.jpg?width=980&height=735&quality=90', 8);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/06/10/teMj/ycWsB4MvbR.jpg?width=980&height=735&quality=90', 9);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/27/4BPx/kpLgrCD6yr.jpg?width=980&height=735&quality=90', 10);

insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('클래식룸', 'RESERVATION_O', 2, '341000', '더블베드 1개, 성인 2명, 객실 크기(㎡) - 14, 헤어드라이어, 에어컨, 커피/티 메이커', 6);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('클래식룸', 'RESERVATION_O', 2, '387000', '더블침대 1개, 성인 2명, 객실 크기(㎡) - 14, 간이/추가 침대 없음,유아용 침대 없음, 욕조 또는 샤워, 커피/티 메이커', 6);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('Privilege Room with balcony', 'RESERVATION_O', 2, '240000', '킹베드 1개 + 소파베드 1개 또는 싱글베드 2개 + 소파베드 1개, 성인 2명, 안뜰 전망, 객실 크기(㎡) - 24, 목욕 가운, 에어컨', 6);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('수페리어 더블룸/트윈룸', 'RESERVATION_O', 2, '208000', '싱글베드 1개 + 더블베드 1개 또는 싱글베드 3개, 성인 2명, 객실 크기(㎡) - 20, 목욕 가운, 에어컨, 커피/티 메이커', 7);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('디럭스 더블 / 트윈', 'RESERVATION_O', 2, '266000', '더블베드 1개 + 싱글베드 1개 또는 싱글베드 3개, 성인 2명, 객실 크기(㎡) - 22, 목욕 가운, 에어컨, 커피/티 메이커', 7);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈피리어 더블룸 또는 트윈룸', 'RESERVATION_O', 2, '215000', '성인 2명, 객실 크기(㎡) - 20, 침대 수 - 3,유아용 침대 없음, 비데, 에어컨, 미니바', 7);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('컴포트 더블 / 트윈', 'RESERVATION_O', 2, '178000', '퀸베드 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 16, 헤어드라이어, 에어컨', 8);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 더블룸/트윈룸', 'RESERVATION_O', 2, '267000', '싱글베드 2개 또는 퀸베드 1개, 성인 2명, 객실 크기(㎡) - 14, 헤어드라이어, 에어컨, 커피/티 메이커', 8);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 더블룸 또는 트윈룸', 'RESERVATION_O', 2, '277000', '성인 2명, 객실 크기(㎡) - 14, 무료 유아용 침대, 욕조 또는 샤워, 룸서비스, 암막 커튼', 8);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 더블룸', 'RESERVATION_O', 2, '345000', '성인 2명, 에어컨', 9);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드룸', 'RESERVATION_O', 2, '211000', '성인 2명, 에어컨', 9);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('더블 클래식룸', 'RESERVATION_O', 2, '351000', '싱글베드 2개 또는 더블베드 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 19, 목욕 가운, 에어컨', 9);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스마트룸', 'RESERVATION_O', 2, '284000', '세미 더블베드 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 14, 목욕 가운, 에어컨', 10);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스마트 더블룸', 'RESERVATION_O', 2, '394000', '세미 더블베드 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 12, 목욕 가운, 에어컨', 10);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸 (Smart)', 'RESERVATION_O', 2, '233000', '더블침대 1개, 성인 2명, 객실 크기(㎡) - 11, 침대 수 - 1,간이/추가 침대 없음, 욕조 또는 샤워, 에어컨', 10);

insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/528678610.jpg?k=381a8d66b5eb61c16e706c28896a6fb191796852a0906e757114facbccb96599&o=&s=1000x', 16);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/10000000/9730000/9727700/9727633/a361b3e4_z.jpg', 17);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/929497/-1/a8c0dc6b6b574f49d0b118b8ed67764b.jpg?ce=0&s=1000x', 18);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/48025/-1/8f79d8854c9411779e7439e77d2211dd.jpg?ca=7&ce=1&s=1000x', 19);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/48025/-1/092c9a2073b0ef014aa8bed9490b13b4.jpg?ca=7&ce=1&s=1000x', 20);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/20000/11000/10993/w2998h1997x0y0-2d620be1_z.jpg', 21);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/1276130/9361908/c452aae3d17686222c74fda9b89badef.png?ca=16&ce=1&s=1000x', 22);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/160889272.jpg?k=dad9858f6558b51b4931ab6f0f9143902f7389cbb87016355670da948f8b33bf&o=&s=1000x', 23);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/16000000/15670000/15660900/15660863/b41795ff_z.jpg', 24);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/628/62897/62897_14062522390020039215.jpg?ca=2&ce=1&s=1000x', 25);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/628/62897/62897_14062522390020039215.jpg?ca=2&ce=1&s=1000x', 26);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/146725478.jpg?k=74699b7e0e9b7efe6445d930ecaa03b9abce4041acba7e1fd605327564517c2e&o=&s=1000x', 27);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/425/42525/42525_20021814450088259509.jpg?ca=10&ce=1&s=1000x', 28);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/425/42525/42525_20021814460088259595.jpg?ca=10&ce=1&s=1000x', 29);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/10000/6400/6371/c31af1cc_z.jpg', 30);

update hotels set hotel_city = '피렌체' where hotel_id between 6 and 10;

# 라스베이거스
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('트레저 아일랜드 – TI 라스베가스 호텔 카지노, 라디슨 호텔', '3300 Las Vegas Blvd S, Las Vegas, Nevada, 미국, 89109', '트레저 아일랜드 – TI 라스베가스 호텔 카지노는 라스베가스 스트립에 위치한 고급 호텔로, 다양한 엔터테인먼트 옵션과 카지노를 제공합니다. 편안한 객실과 고급 레스토랑, 스파 등 다양한 부대시설을 갖추고 있어 완벽한 휴식을 즐길 수 있습니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('트래블로지 바이 윈덤 라스베이거스', '2830 Las Vegas Blvd S, Las Vegas, Nevada, 미국, 89109', '트래블로지 바이 윈덤 라스베이거스는 합리적인 가격과 편리한 위치를 자랑하는 호텔로, 라스베가스 스트립의 주요 명소와 가까워 관광에 이상적입니다. 간편한 시설과 친절한 서비스를 제공하여 편안한 숙박을 보장합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('더 코스모폴리탄 오브 라스베이거스', '3708 Las Vegas Blvd S, Las Vegas, Nevada, 미국, 89109', '더 코스모폴리탄 오브 라스베이거스는 세련된 디자인과 현대적인 편의시설을 갖춘 고급 호텔로, 라스베가스 스트립에 위치해 있습니다. 다양한 레스토랑과 바, 풀장, 카지노 등을 갖추고 있어 모든 여행객에게 만족스러운 경험을 제공합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('호스슈 라스베이거스', '3645 Las Vegas Blvd S, Las Vegas, Nevada, 미국, 89109', '호스슈 라스베이거스는 라스베가스 스트립의 중심부에 위치한 호텔로, 현대적인 객실과 다양한 편의시설을 제공합니다. 카지노, 레스토랑, 엔터테인먼트 옵션이 풍부하며, 주요 관광지와의 접근성이 뛰어납니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('플라밍고 라스베이거스 호텔 & 카지노', '3555 Las Vegas Blvd S, Las Vegas, Nevada, 미국, 89109', '플라밍고 라스베이거스 호텔 & 카지노는 라스베가스 스트립에서 가장 오래된 호텔 중 하나로, 클래식한 매력과 현대적인 편의시설을 겸비하고 있습니다. 다양한 레스토랑과 바, 풀장, 카지노를 제공하여 모든 여행객에게 즐거운 경험을 선사합니다.', 3);

insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/01/11/ndPB/Bxb0Ev3mi9.jpg?width=980&height=735&quality=90', 11);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/08/01/VBGs/ajR7VKlqk7.jpg?width=980&height=735&quality=90', 12);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/02/17/zClg/tf5eP2R8pO.jpg?width=980&height=735&quality=90', 13);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/27/Wi0n/hAcTDfqDyM.jpg?width=980&height=735&quality=90', 14);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/07/01/03cF/pKxZvLVRhp.jpg?width=980&height=735&quality=90', 15);

insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('디럭스 퀸룸 - 퀸침대 2개', 'RESERVATION_O', 2, '323000', '퀸베드 2개, 성인 2명, 산 전망, 객실 크기(㎡) - 36, 헤어드라이어, 에어컨', 11);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('Deluxe King Room or Queen Room with 2 Queen Beds', 'RESERVATION_O', 2, '409000', '킹베드 1개 또는 퀸베드 2개, 성인 2명, 시내 전망, 객실 크기(㎡) - 59, 목욕 가운, 에어컨', 11);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸 (Run of the House)', 'RESERVATION_O', 2, '390000', '성인 2명, 시내 전망, 간이/추가 침대(요금 별도),유아용 침대(요금 별도), 타월 제공됨, 미니 냉장고, 룸서비스(24시간)', 11);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸 (더블베드 2개, 금연)', 'RESERVATION_O', 2, '297000', '더블베드 2개, 성인 2명, 객실 크기(㎡) - 27, 헤어드라이어, 에어컨, 커피/티 메이커', 12);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('더블룸, 더블침대 2개, 금연', 'RESERVATION_O', 2, '416000', '더블침대 2개, 성인 2명, 객실 크기(㎡) - 32, 욕조 또는 샤워, 에어컨, 침대 시트 교체(요청 시)', 12);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('NON SMOKING', 'RESERVATION_O', 2, '237000', '성인 2명', 12);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('시티룸', 'RESERVATION_O', 2, '263000', '퀸사이즈침대 2개, 성인 2명, 객실 크기(㎡) - 43, 간이/추가 침대(요금 별도),무료 유아용 침대, 비누, 에어컨', 13);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('시티룸', 'RESERVATION_O', 2, '267000', '퀸베드 2개, 성인 2명, 시내 전망, 객실 크기(㎡) - 43, 목욕 가운, 에어컨', 13);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('Terrace Studio', 'RESERVATION_O', 2, '435000', '킹사이즈침대 1개, 성인 2명, 객실 크기(㎡) - 58, 간이/추가 침대(요금 별도),무료 유아용 침대, 비누, 에어컨', 13);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('리조트룸 - 킹침대 1개, 금연실', 'RESERVATION_O', 2, '357000', '킹베드 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 42, 헤어드라이어, 에어컨', 14);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('리조트룸 - 퀸침대 2개, 금연실', 'RESERVATION_O', 2, '317000', '퀸베드 2개, 성인 2명, 시내 전망, 객실 크기(㎡) - 42, 헤어드라이어, 에어컨', 14);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('리조트 하이롤러뷰 킹룸 (금연)', 'RESERVATION_O', 2, '314000', '퀸베드 1개 또는 킹베드 1개 또는 더블베드 1개, 성인 2명, 객실 크기(㎡) - 40, 헤어드라이어, 에어컨, 커피/티 메이커', 14);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('FAB 룸 (퀸베드 2개, 금연)', 'RESERVATION_O', 2, '316000', '퀸베드 2개, 성인 2명, 시내 전망, 객실 크기(㎡) - 33, 헤어드라이어, 에어컨', 15);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('플라밍고룸 (퀸베드 2개, 금연)', 'RESERVATION_O', 2, '156000', '퀸베드 2개, 성인 2명, 객실 크기(㎡) - 32, 헤어드라이어, 에어컨, 냉장고', 15);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('가든뷰 플라밍고룸 (퀸베드 2개, 금연)', 'RESERVATION_O', 2, '316000', '퀸베드 2개, 성인 2명, 정원 전망, 객실 크기(㎡) - 32, 헤어드라이어, 에어컨', 15);

insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/934/9345/9345_17052401190053178926.jpg?ca=6&ce=1&s=1000x', 31);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/934/9345/9345_14100802180022618224.jpg?ca=13&ce=1&s=1000x', 32);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/20000/16000/15930/7bcfd8a0_z.jpg', 33);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/2286947/459388585/a3eab5ff929ab29e778a5de04ce04eb8.jpg?ce=0&s=1000x', 34);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/10000/8200/8120/901d6548_z.jpg', 35);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/2286947/0/125fadaed532ea03a019bdd99c467103.jpg?ce=0&s=1000x', 36);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/4000000/3820000/3818900/3818880/effe68d0_z.jpg', 37);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/186483/-1/ce8905c0b007c3b3995a6eea8507eb67.jpg?ca=13&ce=1&s=1000x', 38);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/4000000/3820000/3818900/3818880/733ab3fb_z.jpg', 39);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/147/147262/147262_18021301450061751536.jpg?ca=6&ce=1&s=1000x', 40);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/147262/-1/be461b16f43acf48e8cd515c12334f80.jpg?ca=10&ce=1&s=1000x', 41);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/property/25372053/349556132/39012b6edf6c81b7360277274ef2c4c5.jpeg?ce=0&s=1000x', 42);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/147/147263/147263_16062920570044258603.jpg?ca=13&ce=1&s=1000x', 43);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/147263/-1/541b0aef3f3a5c944bb121599c9c0a39.jpg?ca=10&ce=1&s=1000x', 44);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/407511870.jpg?k=fa2c8b5317237f00b4fd789c02b4ab5e664a907ab29cc8d4dca1f54fa5a18b8b&o=&s=1000x', 45);

update hotels set hotel_city = '라스베이거스' where hotel_id between 11 and 15;

# 파리
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('풀먼 파리 타워 에펠', '18 avenue de Suffren, Entrée au 22 rue Jean Rey, Paris, Paris, 프랑스, 75015', '풀먼 파리 타워 에펠 호텔은 에펠탑 바로 옆에 위치한 고급 호텔로, 세련된 인테리어와 최첨단 편의시설을 갖추고 있습니다. 모든 객실에서 에펠탑의 아름다운 전망을 즐길 수 있으며, 다양한 레스토랑과 바, 피트니스 센터가 마련되어 있습니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('노보텔 파리 레 알', '8 Place Marguerite De Navarre, Paris, Paris, 프랑스, 75001', '노보텔 파리 레 알은 파리 중심부에 위치한 현대적인 호텔로, 루브르 박물관과 노트르담 대성당 등 주요 관광지와 가까워 매우 편리합니다. 넓고 안락한 객실과 다양한 편의시설을 제공하여 비즈니스와 레저 여행객 모두에게 이상적입니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('호텔F1 파리 포르트 드 샤티용', '23 Ave de la Porte de Chatillon, Paris, 프랑스, 75014', '호텔F1 파리 포르트 드 샤티용은 합리적인 가격과 편리한 위치를 자랑하는 호텔로, 파리의 주요 명소와 쉽게 접근할 수 있습니다. 간편하고 실용적인 객실을 제공하며, 가성비 좋은 숙소로 여행자들에게 인기가 많습니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('시타딘 레 알 파리', '4 Rue Des Innocents, Paris, Paris, 프랑스, 75001', '시타딘 레 알 파리는 파리의 활기찬 레 알 지역에 위치한 아파트형 호텔로, 자취 여행객들에게 최적화된 시설을 제공합니다. 각 객실에는 주방과 편안한 거실이 있으며, 주요 관광지와의 접근성이 뛰어납니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('시타딘 아파트호텔 생제르망 데 프레 파리', '53 Ter Quai des Grands Augustins, Paris, Paris, 프랑스, 75006', '시타딘 아파트호텔 생제르망 데 프레 파리는 세느강변에 위치한 고급 아파트형 호텔로, 파리의 로맨틱한 분위기를 만끽할 수 있습니다. 넓고 안락한 객실과 다양한 편의시설을 갖추고 있어 편안한 숙박을 제공합니다.', 3);

insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/02/05/k5jB/YqlY7eK0VO.jpg?width=980&height=735&quality=90', 16);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/05/06/uMmL/nQ2FQW5PSU.jpg?width=980&height=735&quality=90', 17);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/07/02/15nJ/qm07hoLg7P.jpg?width=980&height=735&quality=90', 18);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/07/13/E5xn/2m0PZZ1W71.jpg?width=980&height=735&quality=90', 19);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/27/MFZR/6ONwJbnRSr.jpg?width=980&height=735&quality=90', 20);

insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('클래식룸, 싱글침대 2개, 발코니, 정원 전망', 'RESERVATION_O', 2, '306000', '싱글침대 2개, 성인 2명, 정원 전망, 객실 크기(㎡) - 33, 간이/추가 침대(요금 별도),무료 유아용 침대, 욕조 또는 샤워', 16);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('클래식룸, 킹사이즈침대 1개, 발코니, 정원 전망', 'RESERVATION_O', 2, '368000', '킹사이즈침대 1개, 성인 2명, 정원 전망, 객실 크기(㎡) - 26, 유아용 침대 없음,간이/추가 침대(요금 별도), 욕조 또는 샤워', 16);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈피리어룸, 싱글침대 2개', 'RESERVATION_O', 2, '407000', '싱글침대 2개, 성인 2명, 시내 전망, 객실 크기(㎡) - 26, 간이/추가 침대(요금 별도),무료 유아용 침대, 욕조 또는 샤워', 16);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('수페리어 더블룸 - 침대 겸용 소파', 'RESERVATION_O', 2, '372000', '소파베드 1개 + 퀸베드 1개, 성인 2명, 객실 크기(㎡) - 25, 헤어드라이어, 에어컨, 커피/티 메이커', 17);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈피리어룸, 퀸사이즈침대 1개 및 소파베드', 'RESERVATION_O', 2, '249000', '퀸사이즈침대 1개 및 더블사이즈 소파베드 1개, 성인 2명, 객실 크기(㎡) - 25, 침대 수 - 2, 타월 제공됨, 커피/티 메이커', 17);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('이그제큐티브 더블룸 - 소파 베드 ', 'RESERVATION_O', 2, '170000', '싱글베드 1개 + 퀸베드 1개, 성인 2명, 객실 크기(㎡) - 25, 목욕 가운, 에어컨, 커피/티 메이커', 17);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('Side-Car Room for 2 travelers maximum - #onther oad basics', 'RESERVATION_O', 2, '164000', '싱글베드 2개, 성인 2명, 객실 크기(㎡) - 10, 헤어드라이어, 에어컨, 일일 청소 서비스', 18);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸, 싱글침대 2개 (Side Car)', 'RESERVATION_O', 2, '428000', '싱글침대 2개, 성인 2명, 객실 크기(㎡) - 9, 객실 내 세면대가 있는 공용 욕실, 에어컨, 침대 시트 교체(요청 시)', 18);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('Cabrio room with private bathroom - Novelty #on theroad', 'RESERVATION_O', 2, '357000', '더블베드 1개, 성인 2명, 객실 크기(㎡) - 12, 헤어드라이어, 에어컨, 일일 청소 서비스', 18);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스튜디오', 'RESERVATION_O', 2, '347000', '성인 2명, 욕조 또는 샤워, 에어컨, 냉장고, 하우스키핑(요금 별도), 암막 커튼', 19);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스튜디오', 'RESERVATION_O', 2, '190000', '싱글베드 2개 또는 더블베드 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 21, 헤어드라이어, 에어컨', 19);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('디럭스 스튜디오', 'RESERVATION_O', 2, '298000', '성인 2명, 욕조 또는 샤워, 에어컨, 냉장고, 하우스키핑(요금 별도), 암막 커튼', 19);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스튜디오', 'RESERVATION_O', 2, '274000', '성인 2명, 객실 크기(㎡) - 23, 유아용 침대 없음, 비누, 에어컨, 냉장고', 20);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스튜디오', 'RESERVATION_O', 2, '361000', '더블베드 1개 또는 싱글베드 2개, 성인 2명, 시내 전망, 객실 크기(㎡) - 23, 헤어드라이어, 에어컨', 20);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('디럭스 스튜디오', 'RESERVATION_O', 2, '364000', '더블침대 1개, 성인 2명, 객실 크기(㎡) - 23, 유아용 침대 없음, 비누, 에어컨', 20);

insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/20000/10900/10872/4ebaa644_z.jpg', 46);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/20000/10900/10872/e99fcfea_z.jpg', 47);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/20000/10900/10872/e01fb5ab_z.jpg', 48);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/553091154.jpg?k=e8377af4c2278d34ca8febb5721a8cd3ab43ede9b366c04673c290aaef8f352d&o=&s=1000x', 49);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/30000/24800/24795/ae902f6a_z.jpg', 50);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/553094789.jpg?k=8b88abaff56183e5d2376f5972d4c7ba8aedb06cfeaa217c03af9c1f92f1abf6&o=&s=1000x', 51);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/2297361/461766183/1f78d7fa57f7c7bf88bc7ebc61d224df.jpg?ce=0&s=1000x', 52);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/14000000/13450000/13442200/13442171/1aebb6b9_z.jpg', 53);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/10257420/-1/a4812a05b8ecd438bd3f4e1801e70eb0.jpg?ce=0&s=1000x', 54);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/50000/44800/44729/fa2f064c_z.jpg', 55);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/63565/-1/757fcd25236c3b13ce3f9065eb0ad0b6.jpg?ce=0&s=1000x', 56);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/50000/44800/44729/ad4e6420_z.jpg', 57);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/380000/374400/374356/9d8d051c_z.jpg', 58);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/property/4822203/33882689/549f38f3a27d448ee824d2a43257f8ab.jpg?ca=18&ce=1&s=1000x', 59);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/380000/374400/374356/1f49289d_z.jpg', 60);

update hotels set hotel_city = '파리' where hotel_id between 16 and 20;

# 런던
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('풀먼 런던 세인트 판크라스', '100-110 Euston Road, London, England, 영국, NW1 2AJ', '풀먼 런던 세인트 판크라스는 런던 중심부에 위치한 현대적인 호텔로, 세인트 판크라스 역과 가까워 매우 편리합니다. 세련된 디자인의 객실과 다양한 편의시설을 갖추고 있으며, 비즈니스와 레저 여행객 모두에게 이상적인 선택입니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('페이지8, 페이지 호텔스', '8 St. Martins Place, London, England, 영국, WC2N 4JH', '페이지8, 페이지 호텔스는 트라팔가 광장과 국립 미술관 근처에 위치한 부티크 호텔로, 럭셔리한 객실과 세심한 서비스를 제공합니다. 중심지에 위치해 런던의 주요 명소를 도보로 쉽게 접근할 수 있어 편리합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('포인트 A 호텔 런던 쇼디치', '8-10 Paul Street, London, England, 영국, EC2A 4JH', '포인트 A 호텔 런던 쇼디치는 트렌디한 쇼디치 지역에 위치한 합리적인 가격의 호텔로, 깔끔하고 현대적인 객실을 제공합니다. 주요 대중교통과의 접근성이 뛰어나며, 주변에 다양한 레스토랑과 바가 있어 편리합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('Tower Suites by Blue Orchid', '100 Minories, London, England, 영국, EC3N 1JY', 'Tower Suites by Blue Orchid는 런던 타워 브리지 근처에 위치한 고급 호텔로, 넓고 현대적인 스위트룸과 다양한 편의시설을 갖추고 있습니다. 비즈니스와 레저 여행객 모두에게 편안하고 기억에 남는 숙박 경험을 제공합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('팬 퍼시픽 런던', '80 Houndsditch, London, England, 영국, EC3A 7AB', '팬 퍼시픽 런던은 럭셔리한 디자인과 최첨단 편의시설을 갖춘 고급 호텔로, 런던의 주요 비즈니스 및 관광 명소와 가까워 매우 편리합니다. 다양한 레스토랑, 바, 스파 및 피트니스 센터를 이용할 수 있어 완벽한 휴식을 제공합니다.', 3);

insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/27/8ACE/B9wve5gbc8.jpg?width=980&height=735&quality=90', 21);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/27/kzoB/n5FeUz8LQW.jpg?width=980&height=735&quality=90', 22);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/25/Adit/4J1uCsQrDz.jpg?width=980&height=735&quality=90', 23);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/07/06/CxOW/cNnuoKf6gN.jpg?width=980&height=735&quality=90', 24);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/25/XynS/m74YEN8C2b.jpg?width=980&height=735&quality=90', 25);

insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('클래식 룸 킹 침대', 'RESERVATION_O', 2, '331000', '킹베드 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 21, 목욕 가운, 에어컨', 21);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('클래식룸, 더블침대 1개, 장애인 지원', 'RESERVATION_O', 2, '370000', '더블침대 1개, 성인 2명, 시내 전망, 침대 수 - 2,무료 유아용 침대, 타월 제공됨, 커피/티 메이커', 21);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('클래식룸, 킹사이즈침대 1개', 'RESERVATION_O', 2, '298000', '킹사이즈침대 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 21, 침대 수 - 1,무료 유아용 침대, 타월 제공됨', 21);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('더블룸', 'RESERVATION_O', 2, '267000', '퀸사이즈침대 1개, 성인 2명, 객실 크기(㎡) - 17, 침대 수 - 1,간이/추가 침대 없음,유아용 침대 없음, 비누, 에어컨', 22);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('더블룸', 'RESERVATION_O', 2, '324000', '퀸베드 1개, 성인 2명, 안뜰 전망, 객실 크기(㎡) - 17, 최상층 객실 이용 가능, 목욕 가운', 22);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈피리어 더블룸', 'RESERVATION_O', 2, '265000', '퀸사이즈침대 1개, 성인 2명, 객실 크기(㎡) - 17, 침대 수 - 1,간이/추가 침대 없음,유아용 침대 없음, 비누, 에어컨', 22);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('더블룸', 'RESERVATION_O', 2, '184000', '더블베드 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 12, 헤어드라이어, 에어컨', 23);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('더블룸 (장애인 친화형)', 'RESERVATION_O', 2, '271000', '더블베드 1개, 성인 2명, 객실 크기(㎡) - 16, 헤어드라이어, 에어컨, 암막 커튼', 23);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('더블룸, 장애인 지원 (with window)', 'RESERVATION_O', 2, '381000', '더블침대 1개, 성인 2명, 타월 제공됨, 에어컨, 타월 교체(요청 시), 암막 커튼', 23);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈피리어 스튜디오', 'RESERVATION_O', 2, '419000', '성인 2명, 객실 크기(㎡) - 24, 침대 수 - 3,간이/추가 침대 없음,무료 유아용 침대, 욕조 또는 샤워, 에어컨, 커피/티 메이커', 24);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈페리어 스튜디오', 'RESERVATION_O', 2, '397000', '킹베드 1개 또는 싱글베드 2개, 성인 2명, 시내 전망, 객실 크기(㎡) - 23, 목욕 가운, 에어컨', 24);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('이그제큐티브 스튜디오', 'RESERVATION_O', 2, '323000', '성인 2명, 객실 크기(㎡) - 32, 침대 수 - 3,간이/추가 침대 없음,무료 유아용 침대, 욕조 또는 샤워, 에어컨, 커피/티 메이커', 24);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('디럭스룸, 킹사이즈침대 1개', 'RESERVATION_O', 2, '262000', '킹사이즈침대 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 37, 간이/추가 침대 없음,무료 유아용 침대, 비누', 25);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('디럭스룸', 'RESERVATION_O', 2, '335000', '더블베드 2개, 성인 2명, 시내 전망, 객실 크기(㎡) - 37, TV, 헤어드라이어', 25);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('디럭스룸, 시내 전망', 'RESERVATION_O', 2, '304000', '킹사이즈침대 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 37, 간이/추가 침대 없음,무료 유아용 침대, 비누', 25);

insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/785/3171392/36bf128362591d62f07402f2ce884fae.jpeg?s=1000x', 61);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/540000/535700/535667/7e5a56b4_z.jpg', 62);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/540000/535700/535667/854e0c0e_z.jpg', 63);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/39000000/38240000/38230200/38230129/f2d7107d_z.jpg', 64);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/8324662/-1/458838126ef03553156c0ec3eb0175b1.jpg?ca=22&ce=0&s=1000x', 65);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/39000000/38240000/38230200/38230129/7d6a7699_z.jpg', 66);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/1624586/-1/e8664a93348866f21ae3a2b712a12d29.jpg?ca=13&ce=1&s=1000x', 67);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/97432654.jpg?k=c3b541d2c1e4acf4570cd48f25a934efbb6a09b027b118eb303dcf54aa643922&o=&s=1000x', 68);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/18000000/17160000/17151000/17150967/691634de_z.jpg', 69);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/42000000/41550000/41549700/41549669/828f600c_z.jpg', 70);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/490685377.jpg?k=6166e59e8d9a9c91d4ff1a468ac55681e5a8f5e9e1aff1b0ad7b297e4e6e40cf&o=&s=1000x', 71);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/42000000/41550000/41549700/41549669/124e22e9_z.jpg', 72);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/68000000/67550000/67541200/67541187/6f4f6398_z.jpg', 73);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/68000000/67550000/67541200/67541187/5a5cbfaf_z.jpg', 74);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/68000000/67550000/67541200/67541187/17b6907e_z.jpg', 75);

update hotels set hotel_city = '런던' where hotel_id between 21 and 25;

# 바르셀로나
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('바르셀로 산트스', 'Plaza Dels Paisos Catalans S/n, Barcelona, 스페인, 08014', '바르셀로 산트스는 바르셀로나 산트 역 바로 옆에 위치한 현대적인 호텔로, 여행객들에게 뛰어난 편의성을 제공합니다. 넓고 세련된 객실과 다양한 편의시설을 갖추고 있으며, 도시의 주요 명소로의 접근성이 뛰어납니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('세르코텔 로세욘', 'C/ DEL ROSSELLON 390, Barcelona, 스페인, 08025', '세르코텔 로세욘은 사그라다 파밀리아 성당 근처에 위치한 아늑한 호텔로, 편안한 숙박을 제공합니다. 깔끔하고 현대적인 객실과 친절한 서비스가 특징이며, 바르셀로나의 주요 관광지와 쉽게 연결됩니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('손더 파세오 데 그라시아', '29 Passeig de Gràcia, Barcelona, Catalonia, 스페인, 08007', '손더 파세오 데 그라시아는 바르셀로나의 유명한 쇼핑 거리인 그라시아 거리의 중심부에 위치한 고급 호텔로, 세련된 인테리어와 현대적인 편의시설을 갖추고 있습니다. 주요 관광지와의 접근성이 매우 뛰어납니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('H10 메트로폴리탄', 'Rambla Catalunya 7-9, Barcelona, 스페인, 08007', 'H10 메트로폴리탄은 바르셀로나 중심부에 위치한 고급 호텔로, 스타일리시한 객실과 다양한 편의시설을 제공합니다. 카탈루냐 광장과 람블라 거리와 가까워 도시 탐방에 매우 적합한 위치를 자랑합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('바이 필로우 모선', 'Ronda de Sant Pere, 15, Barcelona, 스페인, 08010', '바이 필로우 모선은 바르셀로나 중심부에 위치한 아늑한 호텔로, 현대적인 디자인과 편안한 숙박 환경을 제공합니다. 주요 관광지와 대중교통과의 접근성이 좋아 편리한 여행을 즐길 수 있습니다.', 3);

insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/27/l3iw/8bwJSNdd9F.jpg?width=980&height=735&quality=90', 26);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/05/28/XLe6/qPWLxxeqRi.jpg?width=980&height=735&quality=90', 27);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/12/15/VzZY/W1aEpcFJa9.jpg?width=980&height=735&quality=90', 28);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/03/23/isri/sTAPBeRMPM.jpg?width=980&height=735&quality=90', 29);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/03/23/jTsK/0NLJJ5bUOk.jpg?width=980&height=735&quality=90', 30);

insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸 (Orbital)', 'RESERVATION_O', 2, '233000', '킹사이즈침대 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 25, 타월 제공됨, 커피/티 메이커', 26);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('오르비탈룸', 'RESERVATION_O', 2, '181000', '싱글베드 2개 또는 더블베드 1개, 성인 2명, 객실 크기(㎡) - 23, 헤어드라이어, 에어컨, 커피/티 메이커', 26);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸 (Stratosphere Room)', 'RESERVATION_O', 2, '162000', '킹사이즈침대 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 25, 위치 - 최상층, 타월 제공됨', 26);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('베이직룸', 'RESERVATION_O', 2, '207000', '더블침대 1개, 성인 2명, 객실 크기(㎡) - 16, 욕조 또는 샤워, 난방, 미니바', 27);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('클래식 더블룸', 'RESERVATION_O', 2, '232000', '더블침대 1개, 성인 2명, 객실 크기(㎡) - 16, 욕조 또는 샤워, 난방, 미니바', 27);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('클래식 더블룸, 더블침대 1개 (Sagrada Familia View)', 'RESERVATION_O', 2, '303000', '더블침대 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 1, 욕조 또는 샤워, 난방', 27);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈피리어룸, 킹사이즈침대 1개', 'RESERVATION_O', 2, '283000', '킹사이즈침대 1개, 성인 2명, 객실 크기(㎡) - 30, 침대 수 - 1,무료 유아용 침대, 욕조 또는 샤워, 에어컨', 28);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸, 퀸사이즈침대 1개', 'RESERVATION_O', 2, '441000', '퀸사이즈침대 1개, 성인 2명, 객실 크기(㎡) - 13, 침대 수 - 1,무료 유아용 침대, 욕조 또는 샤워, 에어컨', 28);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸, 킹사이즈침대 1개, 발코니, 시내 전망', 'RESERVATION_O', 2, '271000', '킹사이즈침대 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 25, 침대 수 - 1,무료 유아용 침대, 욕조 또는 샤워', 28);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('더블 / 트윈 (발코니)', 'RESERVATION_O', 2, '349000', '킹베드 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 20, 목욕 가운, 에어컨', 29);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('더블룸, 발코니, 시내 전망', 'RESERVATION_O', 2, '285000', '성인 2명, 시내 전망, 객실 크기(㎡) - 20, 무료 유아용 침대, 타월 제공됨, 에어컨', 29);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈페리어 테라스룸', 'RESERVATION_O', 2, '413000', '더블베드 1개, 성인 2명, 정원 전망, 객실 크기(㎡) - 20, 목욕 가운, 에어컨', 29);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('이코노미 더블룸', 'RESERVATION_O', 2, '317000', '더블침대 1개, 성인 2명, 안뜰 전망, 객실 크기(㎡) - 8, 유아용 침대 없음, 타월 제공됨', 30);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 더블룸', 'RESERVATION_O', 2, '236000', '더블침대 1개, 성인 2명, 안뜰 전망, 객실 크기(㎡) - 9, 유아용 침대 없음, 타월 제공됨', 30);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 트윈룸', 'RESERVATION_O', 2, '297000', '싱글침대 2개, 성인 2명, 안뜰 전망, 객실 크기(㎡) - 14, 유아용 침대 없음, 타월 제공됨', 30);

insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/50000/46900/46853/cb6fc51d_z.jpg', 76);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/508/50823/50823_15012322440024811227.jpg?ca=13&ce=1&s=1000x', 77);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/50000/46900/46853/6e1582e8_z.jpg', 78);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/3000000/2850000/2848000/2847953/98337165_z.jpg', 79);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/3000000/2850000/2848000/2847953/63bbd604_z.jpg', 80);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/3000000/2850000/2848000/2847953/5e3515b7_z.jpg', 81);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/79000000/78010000/78007800/78007797/f3c3ffdf_z.jpg', 82);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/79000000/78010000/78007800/78007797/6f5d7300_z.jpg', 83);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/79000000/78010000/78007800/78007797/d913abb6_z.jpg', 84);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/508165279.jpg?k=f5873972bbe34fa1c606a4cacb9fd6fd4ae8fabd578a78e4551a27cf53fc42f2&o=&s=1000x', 85);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/9000000/8780000/8773800/8773760/f6d865d9_z.jpg', 86);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/508165388.jpg?k=a1358d4767f885416e3795c6d7248d148671d6eda994f4b930b83c81961309e5&o=&s=1000x', 87);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/2000000/1140000/1133400/1133365/da86d5d8_z.jpg', 88);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/2000000/1140000/1133400/1133365/da86d5d8_z.jpg', 89);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/2000000/1140000/1133400/1133365/71b04b5d_z.jpg', 90);

update hotels set hotel_city = '바르셀로나' where hotel_id between 26 and 30;

# 로마
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('알바니 호텔 로마', 'Via Adda 45, Rome, RM, 이탈리아, 198', '알바니 호텔 로마는 로마 중심부에 위치한 아늑한 호텔로, 역사적인 명소와 주요 교통수단에 가까워 편리합니다. 현대적이고 깔끔한 객실을 제공하며, 친절한 서비스와 함께 편안한 숙박을 보장합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('iQ 호텔 로마', 'Via Firenze, 8, Rome, RM, 이탈리아, 184', 'iQ 호텔 로마는 로마의 중심지에 위치해 있어 주요 관광지와 쉽게 접근할 수 있습니다. 현대적인 디자인의 객실과 다양한 편의시설을 제공하며, 친절하고 전문적인 서비스로 편안한 숙박을 제공합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('그랜드 호텔 올림픽', 'Via Properzio 2/a, Rome, RM, 이탈리아, 193', '그랜드 호텔 올림픽은 로마의 역사적인 중심지에 위치하며, 고풍스러운 인테리어와 현대적인 편의시설을 갖춘 고급 호텔입니다. 세련된 객실과 우수한 서비스로 특별한 여행 경험을 제공합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('베스트 웨스턴 플러스 호텔 유니버소', 'Via Principe Amedeo 5/B, Rome, RM, 이탈리아, 185', '베스트 웨스턴 플러스 호텔 유니버소는 로마의 중심부에 위치하며, 현대적인 객실과 다양한 편의시설을 제공합니다. 주요 관광지와 가까워 편리하며, 친절하고 전문적인 서비스로 만족스러운 숙박을 보장합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('C-호텔 클럽 하우스 로마', 'Via Andrea Alciato 14-16, Rome, RM, 이탈리아, 167', 'C-호텔 클럽 하우스 로마는 로마 외곽에 위치한 편안한 호텔로, 조용한 분위기와 현대적인 시설을 제공합니다. 도심까지의 접근이 용이하며, 고객에게 편안한 휴식을 제공합니다.', 3);

insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/27/BObA/3ZNREp3vie.jpg?width=980&height=735&quality=90', 31);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/27/KNK4/GSFmJwszV3.jpg?width=980&height=735&quality=90', 32);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/27/m4zX/raZhALkDVk.jpg?width=980&height=735&quality=90', 33);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/08/01/A0vG/PcPQCtWAY3.jpg?width=980&height=735&quality=90', 34);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/27/iBYL/FUrDwf7Zw7.jpg?width=980&height=735&quality=90', 35);

insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('클래식 더블룸 (카펫 / 타일 바닥)', 'RESERVATION_O', 2, '350000', '더블베드 1개 + 퀸베드 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 22, 헤어드라이어, 에어컨', 31);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드룸', 'RESERVATION_O', 2, '268000', '성인 2명, 헤어드라이어, 에어컨, 미니바, 일일 청소 서비스, 무료 생수', 31);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('Camera Classic con letto matrimoniale o 2 letti singoli con Moquette o Pavimento', 'RESERVATION_O', 2, '162000', '성인 2명, 객실 크기(㎡) - 22, 무료 유아용 침대, 비데, 에어컨, 룸서비스(이용 시간 제한)', 31);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('더블룸 (Small)', 'RESERVATION_O', 2, '226000', '더블침대 1개, 성인 2명, 객실 크기(㎡) - 11, 침대 수 - 1,유아용 침대 없음, 비데, 냉장고', 32);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스몰 더블', 'RESERVATION_O', 2, '273000', '더블베드 1개, 성인 2명, 객실 크기(㎡) - 11, 헤어드라이어, 에어컨, 커피/티 메이커', 32);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('더블룸', 'RESERVATION_O', 2, '401000', '퀸사이즈침대 1개, 성인 2명, 객실 크기(㎡) - 15, 침대 수 - 1,무료 유아용 침대, 욕조 또는 샤워, 냉장고', 32);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 더블룸 또는 트윈룸', 'RESERVATION_O', 2, '195000', '성인 2명, 간이/추가 침대 없음,무료 유아용 침대, 비데, 미니바, 룸서비스(24시간), 객실 금고', 33);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 트리플룸', 'RESERVATION_O', 2, '203000', '성인 2명, 간이/추가 침대 없음,무료 유아용 침대, 비데, 미니바, 룸서비스(24시간), 객실 금고', 33);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 쿼드룸', 'RESERVATION_O', 2, '291000', '성인 2명, 간이/추가 침대 없음,무료 유아용 침대, 비데, 미니바, 룸서비스(24시간), 객실 금고', 33);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('디럭스 더블룸', 'RESERVATION_O', 2, '395000', '더블베드 1개, 성인 2명, 헤어드라이어, 에어컨, 커피/티 메이커, 일일 청소 서비스', 34);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('컴포트 더블 / 트윈', 'RESERVATION_O', 2, '401000', '싱글베드 2개 + 더블베드 1개, 성인 2명, 객실 크기(㎡) - 22, 헤어드라이어, 에어컨, 커피/티 메이커', 34);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('컴포트룸, 싱글침대 2개', 'RESERVATION_O', 2, '312000', '싱글침대 2개, 성인 2명, 객실 크기(㎡) - 23, 침대 수 - 1,간이/추가 침대 없음,무료 유아용 침대, 욕조 또는 샤워, 에어컨', 34);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스마트룸 (더블베드)', 'RESERVATION_O', 2, '258000', '더블베드 1개,성인 2명,시내 전망,객실 크기(㎡) - 14,헤어드라이어,에어컨', 35);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('Smart Double Room', 'RESERVATION_O', 2, '312000', '더블침대 1개,성인 2명,객실 크기(㎡) - 15,타월 제공됨,미니바,룸서비스(이용 시간 제한)', 35);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('컴포트 더블', 'RESERVATION_O', 2, '367000', '더블베드 1개,성인 2명,시내 전망,객실 크기(㎡) - 20,목욕 가운,에어컨', 35);

insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/522958027.jpg?k=0dd8bacdc1f84fad4658398aed28892101aabfa8ee348cae95a4e0304e5f5617&o=&s=1000x', 91);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/11194/-1/644c6a91985984c1b03c8f0db979fac0.jpg?ce=0&s=1000x', 92);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/30000/20100/20050/7f793c05_z.jpg', 93);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/4000000/3550000/3546400/3546384/fdcff746_z.jpg', 94);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/124/124611/124611_17112721210059924205.jpg?ca=6&ce=1&s=1000x', 95);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/4000000/3550000/3546400/3546384/ef009723_z.jpg', 96);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/80000/72900/72827/d04d1a0a_z.jpg', 97);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/80000/72900/72827/8622c532_z.jpg', 98);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/80000/72900/72827/34ead365_z.jpg', 99);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/property/4813947/200887048/3f0ee225a1636e209fb0e39d2b9c7949.jpg?ca=13&ce=1&s=1000x', 100);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/154/154705/154705_17103011310058451634.jpg?ca=13&ce=1&s=1000x', 101);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/30000/21200/21157/02745adf_z.jpg', 102);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/43350/-1/55922357ec12ffbdab8f3498025e23b7.jpg?ca=13&ce=1&s=1000x', 103);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/2000000/1130000/1124500/1124488/cf8bdfd6_z.jpg', 104);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/43350/-1/6789c089cf5e2cde89ccab332b4c0533.jpg?ca=13&ce=1&s=1000x', 105);

update hotels set hotel_city = '로마' where hotel_id between 31 and 35;

# 루체른
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('호텔 모노폴', 'Pilatusstrasse 1, Lucerne, LU, 스위스, 6003', '호텔 모노폴은 루체른의 중심부에 위치하여 호수와 산의 멋진 전망을 제공합니다. 현대적이며 세련된 객실과 다양한 편의시설을 갖추고 있으며, 편리한 위치와 뛰어난 서비스로 여행객들에게 인기가 많습니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('호텔 알피나', 'Frankenstrasse 6, Lucerne, LU, 스위스, 6003', '호텔 알피나는 루체른의 조용한 지역에 위치하며, 아늑하고 편안한 숙박 환경을 제공합니다. 현대적인 객실과 훌륭한 조식을 제공하며, 도시 탐방에 편리한 위치를 자랑합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('호텔 드 라 페', 'Museggstrasse 2, Lucerne, LU, 스위스, 6004', '호텔 드 라 페는 루체른의 역사적인 중심부에 위치하며, 클래식한 인테리어와 현대적인 편의시설을 갖추고 있습니다. 전통적인 스위스 분위기를 느낄 수 있는 조용한 숙소입니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('아메론 루체른 호텔 플로라', 'Seidenhofstrasse 5, Lucerne, LU, 스위스, 6002', '아메론 루체른 호텔 플로라는 루체른의 중심부에 위치하며, 고급스러운 객실과 현대적인 편의시설을 제공합니다. 호수와 구시가지를 탐방하기에 이상적인 위치를 자랑하며, 우수한 서비스와 쾌적한 환경을 제공합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('알트슈타트 호텔 크로네 루체른', 'Weinmarkt 12, Lucerne, 스위스, CH-6004', '알트슈타트 호텔 크로네 루체른은 루체른의 역사적인 구시가지에 위치하여, 고풍스러운 분위기와 현대적인 편의시설을 제공합니다. 편리한 위치와 아늑한 객실로 도시 탐방에 적합한 숙소입니다.', 3);

insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/07/30/aolv/EunIkBK9ru.jpg?width=980&height=735&quality=90', 36);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/27/DIQ9/q0yRYh5jI8.jpg?width=980&height=735&quality=90', 37);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/05/12/w1pp/nSu0wqnXX3.jpg?width=980&height=735&quality=90', 38);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/27/7L9p/YePIpsbOQs.jpg?width=980&height=735&quality=90', 39);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/27/qlmp/xurTfc5PID.jpg?width=980&height=735&quality=90', 40);

insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 더블룸', 'RESERVATION_O', 2, '299000', '싱글침대 2개, 성인 2명, 객실 크기(㎡) - 26, 간이/추가 침대(요금 별도),유아용 침대(요금 별도), 타월 제공됨, 에어컨', 36);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸 (도착 시 배정)', 'RESERVATION_O', 2, '229000', '싱글베드 1개, 성인 2명, 헤어드라이어, 커피/티 메이커, 일일 청소 서비스, 암막 커튼', 36);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드룸', 'RESERVATION_O', 2, '184000', '성인 2명, 헤어드라이어, 커피/티 메이커, 일일 청소 서비스, 암막 커튼, 위성 방송/케이블 방송', 36);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('더블룸', 'RESERVATION_O', 2, '216000', '싱글베드 2개, 성인 2명, 객실 크기(㎡) - 22, 헤어드라이어, 에어컨, 미니바', 37);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 더블룸', 'RESERVATION_O', 2, '301000', '더블침대 1개, 성인 2명, 시내 전망, 침대 수 - 1,간이/추가 침대 없음,유아용 침대(요금 별도), 타월 제공됨, 매일 하우스키핑', 37);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('디럭스 1 킹', 'RESERVATION_O', 2, '239000', '더블베드 1개, 성인 2명, 객실 크기(㎡) - 30, 헤어드라이어, 커피/티 메이커, 객실 내 안전 금고', 37);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 더블룸 또는 트윈룸', 'RESERVATION_O', 2, '279000', '성인 2명, 객실 크기(㎡) - 14, 침대 수 - 2,무료 유아용 침대, 타월 제공됨, 매일 하우스키핑, 암막 커튼', 38);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드룸', 'RESERVATION_O', 2, '285000', '성인 2명, 객실 크기(㎡) - 14, 에어컨', 38);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 더블룸', 'RESERVATION_O', 2, '437000', '퀸베드 1개 + 싱글베드 1개, 성인 2명, 객실 크기(㎡) - 14, 헤어드라이어, 에어컨, 미니바', 38);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('디럭스 더블', 'RESERVATION_O', 2, '385000', '더블베드 1개, 성인 2명, 객실 크기(㎡) - 22, 헤어드라이어, 에어컨, 커피/티 메이커', 39);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('컴포트 더블', 'RESERVATION_O', 2, '210000', '싱글베드 2개, 성인 2명, 안뜰 전망, 객실 크기(㎡) - 26, 목욕 가운, 에어컨', 39);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('디럭스룸', 'RESERVATION_O', 2, '433000', '싱글침대 2개, 성인 2명, 객실 크기(㎡) - 20, 간이/추가 침대 없음,유아용 침대 없음, 타월 제공됨, 에어컨', 39);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('더블룸 / 트윈룸', 'RESERVATION_O', 2, '432000', '싱글베드 2개, 성인 2명, 객실 크기(㎡) - 20, 헤어드라이어, 에어컨, 커피/티 메이커', 40);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 트윈룸', 'RESERVATION_O', 2, '250000', '싱글침대 2개, 성인 2명, 객실 크기(㎡) - 20, 유아용 침대 없음, 욕조 또는 샤워, 난방', 40);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('쿼드룸', 'RESERVATION_O', 2, '173000', '성인 2명, 객실 크기(㎡) - 33, 유아용 침대 없음, 타월 제공됨, 난방, 에스프레소 메이커', 40);

insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/10000/5100/5051/505ffd5a_z.jpg', 106);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/145/145217/145217_15100122320036591084.jpg?ca=13&ce=1&s=1000x', 107);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/145/145217/145217_15100122320036591084.jpg?ca=13&ce=1&s=1000x', 108);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/424/42475/42475_16052321140042645130.jpg?ca=13&ce=1&s=1000x', 109);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/5000000/4730000/4724100/4724099/24a5d297_z.jpg', 110);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/42475/807072702/48d610056c0dcd0885c4b83c6de1a5ea.jpg?ce=0&s=1000x', 111);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/440000/438000/437916/f42da9c9_z.jpg', 112);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/10256811/-1/0afb5fa95503025741ee6d5f316324bc.jpg?ca=9&ce=1&s=1000x', 113);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/7211097/468736148/0c85f3011bd888e5e91132cab1984a92.jpg?ca=25&ce=0&s=1000x', 114);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/33702431.jpg?k=14a641bb5e3a35e6f4b838ae5652417bd5e7489e8d6aba6b2f41d707918be966&o=&s=1000x', 115);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/property/25373654/349591931/93a8899cd4103c657a83be2b3fc8c8c8.jpg?ca=26&ce=0&s=1000x', 116);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/10000/7600/7551/0a27d5e2_z.jpg', 117);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/142/142490/142490_16052418530042681145.jpg?ca=13&ce=1&s=1000x', 118);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/910000/903400/903390/8d80665e_z.jpg', 119);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/910000/903400/903390/0961d451_z.jpg', 120);

update hotels set hotel_city = '루체른' where hotel_id between 36 and 40;

# 인터라켄
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('빅토리아 융프라우 그랜드 호텔 & 스파', 'Höheweg 41, Interlaken, BE, 스위스, 3800', '빅토리아 융프라우 그랜드 호텔 & 스파는 인터라켄의 중심부에 위치하며, 웅장한 알프스 산맥을 조망할 수 있습니다. 고급스러운 스파와 레스토랑, 넓은 객실을 제공하며, 편안한 휴식을 위한 완벽한 장소입니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('트럼프 인터내셔널 호텔 앤드 타워 뉴욕', '1 Central Park W, New York, New York, 미국, 10023', '트럼프 인터내셔널 호텔 앤드 타워는 센트럴 파크와 가까운 뉴욕의 럭셔리 호텔입니다. 모던한 인테리어와 고급스러운 시설을 갖추고 있으며, 도시 전경을 즐길 수 있는 뛰어난 위치를 자랑합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('호텔 로열 세인트 조지 인터라켄 엠갤러리 호텔 컬렉션', 'Hoeheweg 139, Interlaken, BE, 스위스, 3800', '호텔 로열 세인트 조지 인터라켄 엠갤러리 호텔 컬렉션은 알프스 산맥의 아름다운 경관을 제공하며, 현대적이고 우아한 객실을 갖추고 있습니다. 뛰어난 서비스와 편안한 숙박을 제공합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('로만티크 호텔 슈바이처호프', 'Swiss Alp Resort 1, Grindelwald, BE, 스위스, 3818', '로만티크 호텔 슈바이처호프는 그린델발트의 알프스 산속에 위치한 고급 호텔입니다. 아늑하고 세련된 객실과 고급스러운 스파를 제공하며, 자연의 아름다움을 만끽할 수 있는 곳입니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('호텔 레기나 벵엔', 'Dorfstrasse 1, Lauterbrunnen, BE, 스위스, 3823', '호텔 레기나 벵엔은 로이터브루넨의 조용한 지역에 위치하며, 스위스 알프스의 장관을 감상할 수 있습니다. 전통적인 스위스 스타일의 객실과 훌륭한 서비스로 편안한 숙박을 제공합니다.', 3);

insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/05/30/w6LU/pHLHPMkgwh.jpg?width=980&height=735&quality=90', 41);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/06/25/yG4Q/H9rCpyIeeo.jpg?width=980&height=735&quality=90', 42);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/27/ntnk/uLaQBvSqpu.jpg?width=980&height=735&quality=90', 43);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/07/06/4vpM/uYcYwbM7Cp.jpg?width=980&height=735&quality=90', 44);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/04/26/8t1x/dM4MebPipm.jpg?width=980&height=735&quality=90', 45);

insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈피리어 더블룸', 'RESERVATION_O', 2, '164000', '성인 2명, 침대 수 - 1,간이/추가 침대 없음,무료 유아용 침대,별도의 침실, 타월 제공됨, 난방, 냉장고, 룸서비스(24시간)', 41);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈페리어 더블룸', 'RESERVATION_O', 2, '328000', '킹베드 1개 또는 싱글베드 2개, 성인 2명, 시내 전망, 객실 크기(㎡) - 21, 최상층 객실 이용 가능, 목욕 가운', 41);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('디럭스 더블룸', 'RESERVATION_O', 2, '262000', '킹베드 1개 또는 싱글베드 2개, 성인 2명, 산 전망, 객실 크기(㎡) - 25, 최상층 객실 이용 가능, 목욕 가운', 41);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈페리어룸', 'RESERVATION_O', 2, '343000', '슈퍼 킹베드 1개, 성인 2명, 객실 크기(㎡) - 40, 목욕 가운, 에어컨, 커피/티 메이커', 42);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('디럭스 파크뷰 룸', 'RESERVATION_O', 2, '156000', '킹베드 1개, 성인 2명, 공원 전망, 객실 크기(㎡) - 42, 목욕 가운, 에어컨', 42);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈피리어룸', 'RESERVATION_O', 2, '383000', '퀸사이즈침대 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 41, 간이/추가 침대(요금 별도),무료 유아용 침대, 타월 제공됨', 42);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('Historic, Individually Furnished Rooms In Baroque Style Air-Conditioned Without Balcony', 'RESERVATION_O', 2, '193000', '더블베드 1개 또는 싱글베드 2개, 성인 2명, 강 전망, 객실 크기(㎡) - 25, 목욕 가운, 에어컨', 43);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸, 싱글침대 2개 (Historic, customized rooms, with A/C)', 'RESERVATION_O', 2, '226000', '싱글침대 2개, 성인 2명, 침대 수 - 1,간이/추가 침대(요금 별도),무료 유아용 침대, 욕조 또는 샤워, 에어컨, 커피/티 메이커', 43);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('Historic, Customized Rooms In Baroque Style Air-Conditioned With Balcony', 'RESERVATION_O', 2, '443000', '퀸베드 1개, 성인 2명, 산 전망, 객실 크기(㎡) - 25, 목욕 가운, 에어컨', 43);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('컴포트 트윈룸', 'RESERVATION_O', 2, '240000', '싱글베드 2개 + 더블베드 2개, 성인 2명, 정원 전망, 객실 크기(㎡) - 28, 목욕 가운, 에어컨', 44);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('컴포트 트윈룸', 'RESERVATION_O', 2, '285000', '싱글침대 2개, 성인 2명, 객실 크기(㎡) - 28, 간이/추가 침대(요금 별도),유아용 침대(요금 별도), 타월 제공됨, 난방', 44);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('수페리어 트윈룸 - 산 전망', 'RESERVATION_O', 2, '255000', '싱글베드 2개 + 더블베드 2개, 성인 2명, 산 전망, 객실 크기(㎡) - 28, 목욕 가운, 난방', 44);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('주니어 더블룸, 킹사이즈침대 1개, 금연, 정원 전망', 'RESERVATION_O', 2, '240000', '킹사이즈침대 1개,성인 2명,정원 전망,객실 크기(㎡) - 40,침대 수 - 2,무료 유아용 침대,욕조 또는 샤워', 45);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('Junior Suite Mountain View', 'RESERVATION_O', 2, '285000', '킹사이즈침대 1개,,성인 2명,산 전망,객실 크기(㎡) - 40,침대 수 - 2,간이/추가 침대 없음,무료 유아용 침대,별도의 침실,욕조 또는 샤워', 45);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈피리어 스위트, 테라스, 산 전망', 'RESERVATION_O', 2, '255000', '킹사이즈침대 1개,성인 2명,산 전망,객실 크기(㎡) - 70,침대 수 - 1,간이/추가 침대 없음,무료 유아용 침대,별도의 침실,욕조 또는 샤워', 45);

insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/20000/16300/16233/2f376df3_z.jpg', 121);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/984714/5710548/7b90d7d480a87853403a349ce130195b.jpg?ce=0&s=1000x', 122);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/269911508.jpg?k=9ad5e1eb07f7f9c1a70ce044f757f76fb4be1421ed48e3628f35cfc7abb7ccb6&o=&s=1000x', 123);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/536023395.jpg?k=fb8bc3948442f9d6990a717798319d84d347ed42af5a58d41c1a88c54cf4e654&o=&s=1000x', 124);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/property/40557267/672828673/422da4464ebc86234d85ad4a413288f7.jpg?ce=0&s=1000x', 125);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/50000/40400/40338/8e4ae2f9_z.jpg', 126);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/21631543/294984071/1abd35b0e4d6f5fe0d4a99cd8ed324e3.jpg?ca=16&ce=1&s=1000x', 127);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/1000000/991400/991304/2e8fd47f_z.jpg', 128);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/32417882.jpg?k=db1b0962b1fb15edf26168bb18cfc244b7be78b767556a5d0592eee54633b833&o=&s=1000x', 129);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/155388/-1/a3a6960ea93e811003f5d7835033c143.png?ce=0&s=1000x', 130);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/2000000/1060000/1055100/1055038/885cf72e_z.jpg', 131);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/399611885.jpg?k=cee7d8465073a3a4f24e4c1449e6d20e3744c6df2007e8f793036c5f837be331&o=&s=1000x', 132);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/90000/84000/83936/92139e77_z.jpg', 133);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/90000/84000/83936/3f5de73d_z.jpg', 134);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/90000/84000/83936/ee47785c_z.jpg', 135);

update hotels set hotel_city = '인터라켄' where hotel_id between 41 and 45;

# 세고비아
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('레알 세고비아 아파트먼트', 'C. Juan Bravo 30, Segovia, Segovia, 스페인, 40001', '레알 세고비아 아파트먼트는 세고비아의 중심부에 위치하며, 넓고 현대적인 객실을 제공합니다. 여행객들에게 편안한 숙박을 제공하며, 세고비아의 주요 관광지와도 가까운 위치에 있습니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('호텔 인판타 이사벨', 'Plaza Mayor, 12, Segovia, Segovia, 스페인, 40001', '호텔 인판타 이사벨은 세고비아의 역사적인 광장에 위치하며, 전통적인 스페인식 장식과 현대적인 편의시설을 갖추고 있습니다. 고요하고 우아한 환경에서 편안한 휴식을 제공합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('아우레아 콘벤토 카푸치노스 바이 유로스타스 호텔 컴퍼니', 'Plazuela Capuchinos 2, Segovia, Segovia, 스페인, 40001', '아우레아 콘벤토 카푸치노스는 세고비아의 역사적인 지역에 위치하며, 원래 수도원이었던 건물을 리모델링하여 현대적인 편안함을 제공합니다. 고급스러운 객실과 서비스로 손님을 맞이합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('파라도르 데 세고비아', 'Carretera de Valladolid, s/n, Segovia, Segovia, 스페인, 40003', '파라도르 데 세고비아는 세고비아 외곽에 위치하며, 아름다운 자연경관과 고급스러운 시설을 제공합니다. 전통적인 스페인식 건축과 현대적인 편안함이 조화를 이루는 멋진 장소입니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('유로스타스 플라자 아쿠에둑토', 'Avenida Padre Claret 2-4, Segovia, Segovia, 스페인, 40001', '유로스타스 플라자 아쿠에둑토는 세고비아의 상징적인 로마 수도교 근처에 위치합니다. 세련된 객실과 현대적인 시설을 갖추고 있으며, 편리한 위치로 관광과 쇼핑에 이상적입니다.', 3);

insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/02/03/txAt/HhysXB04D6.jpg?width=980&height=735&quality=90', 46);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/27/FWtq/ct5I23W8em.jpg?width=980&height=735&quality=90', 47);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/05/15/W9Zr/Mjrwrqt1o4.jpg?width=980&height=735&quality=90', 48);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/27/JIzo/EJAIXMa3Id.jpg?width=980&height=735&quality=90', 49);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/27/tMtn/kuReyvjpV6.jpg?width=980&height=735&quality=90', 50);

insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('더블룸', 'RESERVATION_O', 2, '450000', '싱글침대 2개, 성인 2명, 객실 크기(㎡) - 12, 타월 제공됨, 에어컨, 하우스키핑 없음', 46);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('이코노미 스튜디오', 'RESERVATION_O', 2, '200000', '성인 2명, 안뜰 전망, 간이/추가 침대 없음,유아용 침대 없음, 욕조 또는 샤워, 냉장고, 하우스키핑(횟수 제한)', 46);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈피리어 아파트', 'RESERVATION_O', 2, '306000', '더블침대 1개, 성인 2명, 시내 전망, 간이/추가 침대 없음,유아용 침대 없음, 욕조 또는 샤워, 냉장고', 46);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드룸', 'RESERVATION_O', 2, '168000', '성인 2명, 객실 크기(㎡) - 20, 침대 수 - 1,간이/추가 침대 없음,유아용 침대 없음, 타월 제공됨, 에어컨, 룸서비스(이용 시간 제한)', 47);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('더블룸/트윈룸', 'RESERVATION_O', 2, '240000', '싱글베드 2개 또는 더블베드 1개, 성인 2명, 객실 크기(㎡) - 20, 헤어드라이어, 에어컨, 커피/티 메이커', 47);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('더블룸, 시내 전망', 'RESERVATION_O', 2, '196000', '성인 2명, 시내 전망, 객실 크기(㎡) - 20, 침대 수 - 1,간이/추가 침대 없음, 타월 제공됨, 에어컨', 47);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈피리어 더블룸', 'RESERVATION_O', 2, '433000', '성인 2명, 객실 크기(㎡) - 30, 침대 수 - 1,간이/추가 침대(요금 별도),무료 유아용 침대, 욕조 또는 샤워, 에어컨, 미니바', 48);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈피리어 더블룸 (Parking)', 'RESERVATION_O', 2, '225000', '성인 2명, 객실 크기(㎡) - 30, 침대 수 - 1,간이/추가 침대(요금 별도),무료 유아용 침대, 욕조 또는 샤워, 에어컨, 미니바', 48);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('주니어 스위트', 'RESERVATION_O', 2, '290000', '더블침대 1개, 성인 2명, 객실 크기(㎡) - 40, 침대 수 - 2, 욕조 또는 샤워, 에어컨', 48);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 트윈룸', 'RESERVATION_O', 2, '375000', '싱글침대 2개, 성인 2명, 객실 크기(㎡) - 24, 침대 수 - 2,무료 유아용 침대, 비데, 미니바', 49);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 더블룸', 'RESERVATION_O', 2, '390000', '싱글베드 2개, 성인 2명, 객실 크기(㎡) - 22, 헤어드라이어, 에어컨, 미니바', 49);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('런 오브 하우스룸 ', 'RESERVATION_O', 2, '348000', '싱글베드 1개, 성인 2명, 헤어드라이어, 에어컨, 미니바, 일일 청소 서비스', 49);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 더블룸 또는 트윈룸', 'RESERVATION_O', 2, '422000', '성인 2명, 객실 크기(㎡) - 20, 간이/추가 침대(요금 별도),무료 유아용 침대, 타월 제공됨, 미니바, 룸서비스', 50);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드룸', 'RESERVATION_O', 2, '365000', '더블베드 1개 또는 싱글베드 2개, 성인 2명, 객실 크기(㎡) - 20, 헤어드라이어, 에어컨, 미니바', 50);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 더블룸 또는 트윈룸 (Parking)', 'RESERVATION_O', 2, '273000', '성인 2명, 객실 크기(㎡) - 20, 간이/추가 침대(요금 별도),무료 유아용 침대, 타월 제공됨, 미니바, 룸서비스', 50);

insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/3000000/2530000/2525700/2525647/c21a65c8_z.jpg', 136);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/73000000/72970000/72966300/72966298/873327a1_z.jpg', 137);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/73000000/72970000/72966300/72966298/e3cba61a_z.jpg', 138);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/30000/24600/24559/d43bca06_z.jpg', 139);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/99338843.jpg?k=bce1b9536007cc626f11ab85442ae3ef7949e6b4745bde71f65ac03ae925f8a9&o=&s=1000x', 140);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/30000/24600/24559/4216d960_z.jpg', 141);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/9000000/8750000/8741500/8741413/a2173e32_z.jpg', 142);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/9000000/8750000/8741500/8741413/d7022185_z.jpg', 143);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/9000000/8750000/8741500/8741413/79474e1d_z.jpg', 144);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/2000000/1140000/1133300/1133236/63402b09_z.jpg', 145);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/53954141.jpg?k=01b1ea5631b4b9f40806fff990a4403284a27161787a02320b8e4e3b0f0d2c0e&o=&s=1000x', 146);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/671/67146/67146_15122320450038708035.jpg?ca=6&ce=1&s=1000x', 147);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/2000000/1490000/1480400/1480373/742f9a86_z.jpg', 148);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/96427597.jpg?k=a94b9486b741c1013ce4057c3a0b37e4c7962c8750dd644b126a191a6e2dd51d&o=&s=1000x', 149);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/2000000/1490000/1480400/1480373/742f9a86_z.jpg', 150);

update hotels set hotel_city = '세고비아' where hotel_id between 46 and 50;

# 톨레도
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('파라도르 데 톨레도', 'Cerro del Emperador, s/n, Toledo, Toledo, 스페인, 45002', '파라도르 데 톨레도는 톨레도의 역사적인 언덕에 위치한 고급 호텔로, 멋진 도시 전경을 제공합니다. 고전적인 스페인식 장식과 현대적인 편의시설이 어우러진 숙소입니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('호텔 세르코텔 알폰소 VI', 'Cuesta de los Capuchinos 2, Toledo, Toledo, 스페인, 45001', '호텔 세르코텔 알폰소 VI는 톨레도의 중심부에 위치하며, 전통적인 스페인식 매력을 가진 숙소입니다. 고객에게 편안하고 고급스러운 숙박을 제공합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('톨레도룸즈 팔라시오스', 'C. Navarro Ledesma 4, Toledo, Toledo, 스페인, 45002', '톨레도룸즈 팔라시오스는 톨레도의 중심에 위치하여 역사적인 명소와 가까운 편리한 장소입니다. 세련된 객실과 현대적인 시설로 편안한 휴식을 제공합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('마리아 크리스티나 호텔', 'C/ Marqués de Mendigorría nº1, Toledo, Toledo, 스페인, 45003', '마리아 크리스티나 호텔은 톨레도의 역사적인 지역에 위치하며, 클래식한 장식과 현대적인 편의시설을 갖추고 있습니다. 편안한 숙박과 훌륭한 서비스를 제공합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('호텔 산타 이자벨', 'Calle Santa Isabel, 24, Toledo, Toledo, 스페인, 45002', '호텔 산타 이자벨은 톨레도의 중심에 위치하여, 전통적인 스페인식 환대와 현대적인 편의시설을 갖춘 숙소입니다. 지역의 명소와 가까워 여행에 적합합니다.', 3);

insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/25/XPyp/axIhbx3uMc.jpg?width=980&height=735&quality=90', 51);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/27/QwP1/o00oj31WpL.jpg?width=980&height=735&quality=90', 52);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/11/11/K0KE/bDFb0tIBBY.jpg?width=980&height=735&quality=90', 53);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/02/06/I7QM/JUpuCFlhfs.jpg?width=980&height=735&quality=90', 54);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/02/02/xnbz/c8Mxa8Hqgm.jpg?width=980&height=735&quality=90', 55);

insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 트윈룸', 'RESERVATION_O', 2, '301000', '싱글침대 2개, 성인 2명, 객실 크기(㎡) - 24, 침대 수 - 2,간이/추가 침대(요금 별도),무료 유아용 침대, 욕조 또는 샤워, 미니바', 51);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 더블룸', 'RESERVATION_O', 2, '186000', '싱글베드 2개, 성인 2명, 수영장 전망, 객실 크기(㎡) - 24, 헤어드라이어, 에어컨', 51);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 트윈룸 (2 adults + 1 child)', 'RESERVATION_O', 2, '167000', '싱글침대 3개, 성인 2명, 객실 크기(㎡) - 24, 침대 수 - 2,간이/추가 침대(요금 별도),무료 유아용 침대, 욕조 또는 샤워, 미니바', 51);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('클래식 트윈룸', 'RESERVATION_O', 2, '208000', '싱글침대 2개, 성인 2명, 비데, 에어컨, 커피/티 메이커, 매일 하우스키핑', 52);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('트윈룸', 'RESERVATION_O', 2, '450000', '싱글베드 2개, 성인 2명, 안뜰 전망, 객실 크기(㎡) - 20, 헤어드라이어, 에어컨', 52);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('클래식룸 (Exterior View)', 'RESERVATION_O', 2, '258000', '싱글침대 2개, 성인 2명, 비데, 에어컨, 커피/티 메이커, 매일 하우스키핑', 52);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 트윈룸, 침대(여러 개)', 'RESERVATION_O', 2, '348000', '슈퍼싱글침대 2개, 성인 2명, 시내 전망, 침대 수 - 1,간이/추가 침대 없음,유아용 침대 없음, 타월 제공됨, 에어컨', 53);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈피리어룸, 더블침대 1개', 'RESERVATION_O', 2, '389000', '더블침대 1개, 성인 2명, 시내 전망, 침대 수 - 1,간이/추가 침대 없음,유아용 침대(요금 별도), 타월 제공됨, 에어컨', 53);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스탠다드 트윈룸', 'RESERVATION_O', 2, '201000', '싱글베드 2개, 성인 2명, 객실 크기(㎡) - 10, 헤어드라이어, 에어컨, 무료 생수', 53);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('베이직 로프트', 'RESERVATION_O', 2, '397000', '싱글침대 2개, 성인 2명, 객실 크기(㎡) - 15, 위치 - 최상층, 타월 제공됨, 에어컨', 54);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('더블룸', 'RESERVATION_O', 2, '281000', '슈퍼싱글침대 2개, 성인 2명, 객실 크기(㎡) - 20, 타월 제공됨, 에어컨, 미니바', 54);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('더블룸, 더블침대 1개', 'RESERVATION_O', 2, '291000', '더블침대 1개, 성인 2명, 객실 크기(㎡) - 20, 타월 제공됨, 에어컨, 미니바', 54);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('클래식 더블룸', 'RESERVATION_O', 2, '191000', '성인 2명, 객실 크기(㎡) - 13, 간이/추가 침대(요금 별도),침대 수 - 1,무료 유아용 침대, 타월 제공됨, 에어컨, 매일 하우스키핑', 55);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('더블룸 또는 트윈룸', 'RESERVATION_O', 2, '309000', '성인 2명, 객실 크기(㎡) - 17, 간이/추가 침대(요금 별도),침대 수 - 1,무료 유아용 침대, 타월 제공됨, 에어컨, 매일 하우스키핑', 55);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈피리어 더블룸', 'RESERVATION_O', 2, '328000', '슈퍼싱글침대 2개, 성인 2명, 객실 크기(㎡) - 22, 간이/추가 침대(요금 별도),침대 수 - 1,무료 유아용 침대, 타월 제공됨, 에어컨', 55);

insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/3000000/2880000/2876200/2876156/f1744953_z.jpg', 151);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/158484876.jpg?k=dd8fc59c60876dd52b3fcebedebdfc1fe5c98e55dd8c2d2983b613b2745c5a5d&o=&s=1000x', 152);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/3000000/2880000/2876200/2876156/ff406eef_z.jpg', 153);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/30000/22200/22176/378ab832_z.jpg', 154);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/136051694.jpg?k=2f89c1fc63c89a5446ed02bc0712f34291ad647aa827240e431f7659a7ab3fa1&o=&s=1000x', 155);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/30000/22200/22176/6dfb6174_z.jpg', 156);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/78000000/77920000/77919800/77919716/7e9b537e_z.jpg', 157);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/78000000/77920000/77919800/77919716/d4af4908_z.jpg', 158);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/354515555.jpg?k=11a981ed96a87361ccf58d723de11d9e85f2bf607b260a8ec537cd430ddeca5d&o=&s=1000x', 159);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/8000000/8000000/7994100/7994075/b2345aeb_z.jpg', 160);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/8000000/8000000/7994100/7994075/6f28a72e_z.jpg', 161);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/8000000/8000000/7994100/7994075/3c0adde6_z.jpg', 162);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/3000000/2540000/2532500/2532490/27091c3d_z.jpg', 163);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/3000000/2540000/2532500/2532490/f5206f0c_z.jpg', 164);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/3000000/2540000/2532500/2532490/ebabba3b_z.jpg', 165);

update hotels set hotel_city = '톨레도' where hotel_id between 51 and 55;

# 두바이
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('스테이브리지 스위트 두바이 피낸셜 센터, 안 IHG 호텔', 'SHEIKH ZAYED ROAD, PO BOX 11189, Dubai, 아랍에미리트', '스테이브리지 스위트 두바이 피낸셜 센터는 현대적인 시설과 편안한 숙박을 제공하는 고급 스위트 호텔입니다. 두바이의 금융 중심지에 위치하여 비즈니스 여행객에게 적합합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('그랜드 하얏트 두바이', 'Riyadh Street, Sheikh Rashid Road, Dubai Healthcare City, Dubai, 아랍에미리트', '그랜드 하얏트 두바이는 럭셔리와 편안함을 제공하는 5성급 호텔로, 두바이 헬스케어 시티에 위치하며, 우수한 식사와 스파 서비스를 제공합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('하얏트 리젠시 두바이 크리크 하이츠', '20th Street, Dubai Healthcare City, Bur Dubai, Dubai, 아랍에미리트, 5668', '하얏트 리젠시 두바이 크리크 하이츠는 현대적인 디자인과 뛰어난 시설을 갖춘 호텔로, 두바이의 헬스케어 시티에 위치하여 뛰어난 전망과 편안함을 제공합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('아시아나 호텔 두바이', 'Salahuddin Street, Deira, Dubai, 아랍에미리트, 4483', '아시아나 호텔 두바이는 두바이 데이라 지역의 중심에 위치하며, 전통적인 스페셜 서비스를 제공하는 호텔로, 편안하고 현대적인 객실을 제공합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('소피텔 두바이 다운타운', 'Sheihk Zayed Road, Downtown Dubai, Dubai, 아랍에미리트', '소피텔 두바이 다운타운은 두바이의 중심에 위치한 럭셔리 호텔로, 세련된 객실과 탁월한 식사 옵션을 제공하며, 뛰어난 서비스로 고객의 만족을 보장합니다.', 3);

insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/09/22/Wyup/SjYzjpvqzi.jpg?width=980&height=735&quality=90', 56);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/07/05/ATE4/bpxIsbfkMr.jpg?width=980&height=735&quality=90', 57);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/06/04/wyuC/kMySXct18Q.jpg?width=980&height=735&quality=90', 58);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/04/25/54WR/gBnZHp3g8Z.jpg?width=980&height=735&quality=90', 59);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/03/23/KzEO/2GXKeygcdR.jpg?width=980&height=735&quality=90', 60);

insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스튜디오 스위트, 주방', 'RESERVATION_O', 2, '360000', '싱글침대 1개, 성인 2명, 바다 전망,시내 전망, 객실 크기(㎡) - 35, 위치 - 1층, 침대 수 - 1,간이/추가 침대(요금 별도),무료 유아용 침대', 56);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스튜디오 스위트', 'RESERVATION_O', 2, '418000', '킹베드 1개, 성인 2명, 객실 크기(㎡) - 35, 목욕 가운, 에어컨, 커피/티 메이커', 56);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('스튜디오 스위트, 킹사이즈침대 1개, 주방 (Burj Khalifa View)', 'RESERVATION_O', 2, '398000', '킹사이즈침대 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 35, 위치 - 최상층, 침대 수 - 1,간이/추가 침대(요금 별도),무료 유아용 침대', 56);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸, 킹사이즈침대 1개', 'RESERVATION_O', 2, '290000', '킹사이즈침대 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 39, 침대 수 - 1,간이/추가 침대(무료),무료 유아용 침대,별도의 침실, 타월 제공됨', 57);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('킹침대 1개 ', 'RESERVATION_O', 2, '298000', '킹베드 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 39, 목욕 가운, 에어컨', 57);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('그랜드룸, 킹사이즈침대 1개 (Skyline View)', 'RESERVATION_O', 2, '449000', '킹사이즈침대 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 39, 침대 수 - 1,간이/추가 침대(무료),무료 유아용 침대,별도의 침실, 타월 제공됨', 57);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸, 킹사이즈침대 1개', 'RESERVATION_O', 2, '232000', '킹사이즈침대 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 38, 침대 수 - 1,간이/추가 침대 없음,무료 유아용 침대, 비데', 58);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('룸, 킹사이즈침대 1개 (Creek View)', 'RESERVATION_O', 2, '220000', '킹사이즈침대 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 38, 무료 유아용 침대, 비데', 58);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('킹침대 1개 ', 'RESERVATION_O', 2, '316000', '킹베드 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 38, 목욕 가운, 에어컨', 58);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈피리어 트윈룸', 'RESERVATION_O', 2, '152000', '싱글침대 2개, 성인 2명, 객실 크기(㎡) - 35, 간이/추가 침대(요금 별도),무료 유아용 침대, 비데, 커피/티 메이커', 59);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈피리어룸, 킹사이즈침대 1개', 'RESERVATION_O', 2, '264000', '킹사이즈침대 1개, 성인 2명, 객실 크기(㎡) - 35, 간이/추가 침대(요금 별도),무료 유아용 침대, 비데, 커피/티 메이커', 59);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('수페리어 킹 베드', 'RESERVATION_O', 2, '391000', '킹베드 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 35, 목욕 가운, 에어컨', 59);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('럭셔리 1 킹베드', 'RESERVATION_O', 2, '323000', '킹베드 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 49, 목욕 가운, 에어컨', 60);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('럭셔리룸 (싱글베드 2개)', 'RESERVATION_O', 2, '168000', '싱글베드 2개, 성인 2명, 시내 전망, 객실 크기(㎡) - 49, 목욕 가운, 에어컨', 60);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('럭셔리룸, 싱글침대 2개', 'RESERVATION_O', 2, '419000', '싱글침대 2개, 성인 2명, 시내 전망, 객실 크기(㎡) - 53, 침대 수 - 1,간이/추가 침대(요금 별도),무료 유아용 침대, 비데', 60);

insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/65000000/64390000/64383200/64383195/d8f327b6_z.jpg', 166);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/22886043/-1/85870220bb9e9f1dbde35ef4505b2344.jpg?ca=26&ce=0&s=1000x', 167);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/65000000/64390000/64383200/64383195/d8f327b6_z.jpg', 168);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/30000/20400/20321/w3995h2660x5y6-83febe20_z.jpg', 169);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/42783/-1/f7169baf26d41d42aba1d5be5372a0ae.jpg?ca=18&ce=1&s=1000x', 170);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/1000000/30000/20400/20321/w3995h2660x5y6-83febe20_z.jpg', 171);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/10000000/9710000/9709400/9709394/01965c44_z.jpg', 172);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/10000000/9710000/9709400/9709394/09ab7841_z.jpg', 173);
insert into roomimg(room_img_url, room_id) values('https://q-xx.bstatic.com/xdata/images/hotel/max500/364279922.jpg?k=76594f707d55e740d6f25729f2c6d6aa3c5ba322dbab384779a241ed7cdd2cec&o=&s=1000x', 174);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/13000000/12340000/12333100/12333050/518a211c_z.jpg', 175);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/13000000/12340000/12333100/12333050/126f7f0a_z.jpg', 176);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/property/56142738/872957283/16a8262a1a4fab576a5bf47668102882.jpeg?ce=0&s=1000x', 177);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/21667684/295005603/9f6a9236f211fe3afbbf9699224c9f55.jpg?ca=16&ce=1&s=1000x', 178);
insert into roomimg(room_img_url, room_id) values('https://pix8.agoda.net/hotelImages/21667684/459346227/4f36b0180f1a24c4c3dccbcc0755fe3d.jpeg?ce=0&s=1000x', 179);
insert into roomimg(room_img_url, room_id) values('https://i.travelapi.com/lodging/7000000/6900000/6899100/6899004/85ff2389_z.jpg', 180);

update hotels set hotel_city = '두바이' where hotel_id between 56 and 60;

# 서울
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('앰배서더 서울 풀만 호텔', '대한민국 서울특별시 중구 동호로 287, 04618', '럭셔리한 객실과 최첨단 시설을 갖춘 앰배서더 서울 풀만 호텔은 도심 속 평온한 휴식을 제공합니다. 다양한 다이닝 옵션과 편안한 스파로 완벽한 휴가를 만끽하세요.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('호텔 나루 서울 엠갤러리', '대한민국 서울특별시 마포구 마포대로19길 8, 04117', '한강 뷰를 자랑하는 호텔 나루 서울 엠갤러리는 현대적인 디자인과 편안함을 결합한 고급 호텔입니다. 피트니스 센터, 레스토랑, 루프탑 바 등 다양한 시설을 제공합니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('파라스파라 서울', '대한민국 서울특별시 강북구 삼양로 689, 01000', '자연과 어우러진 파라스파라 서울은 도심에서 벗어나 힐링을 원하는 분들께 완벽한 장소입니다. 친환경적인 디자인과 편안한 객실을 통해 진정한 휴식을 즐길 수 있습니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('롯데호텔 서울', '대한민국 서울특별시 중구 을지로 30, 04533', '서울의 중심에 위치한 롯데호텔 서울은 비즈니스와 레저를 위한 최상의 선택입니다. 고급 레스토랑, 스파, 쇼핑몰 등 다양한 편의시설을 갖추고 있습니다.', 3);
insert into hotels (hotel_name, hotel_location, hotel_info, admin_id) values('소피텔 앰배서더 서울 호텔 & 서비스드 레지던스', '대한민국 서울특별시 송파구 잠실로 209, 05552', '프랑스의 우아함과 한국의 환대가 만난 소피텔 앰배서더 서울은 럭셔리한 숙박 경험을 제공합니다. 올림픽 공원과 인접해 있으며 고급 다이닝 및 스파를 이용할 수 있습니다.', 3);

insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/12/22/XX7s/rupqNfWYvB.jpg?width=980&height=735&quality=90', 61);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/02/22/2aR8/WLndzcT97m.jpg?width=980&height=735&quality=90', 62);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/05/16/Bk9L/Htyf8L3vUY.jpg?width=980&height=735&quality=90', 63);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/12/22/5kZV/TvfWd4Wb3p.jpg?width=980&height=735&quality=90', 64);
insert into hotelimg (hotel_img_url, hotel_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/03/11/foAH/fVNqIAzSTd.JPG?width=980&height=735&quality=90', 65);

insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈페리어 킹', 'RESERVATION_O', 2, '155000', '킹침대 1개, 성인 2명, 산 전망,시내 전망, 객실 크기(㎡) - 27.00, 전용 욕실, 에어컨', 61);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('디럭스 킹', 'RESERVATION_O', 2, '344000', '킹침대 1개, 성인 2명, 산 전망,시내 전망, 객실 크기(㎡) - 28.00, 전용 욕실, 에어컨', 61);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('디럭스 트윈', 'RESERVATION_O', 2, '275000', '싱글침대 2개, 성인 2명, 산 전망,시내 전망, 객실 크기(㎡) - 28.00, 전용 욕실, 에어컨', 61);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈페리어 킹 (씨티뷰/NEW)', 'RESERVATION_O', 2, '268000', '킹침대 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 29.75, 전용 욕실, 에어컨', 62);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈페리어 킹 시티뷰(시티뷰)', 'RESERVATION_O', 2, '151000', '킹 침대 1개, 성인 2명', 62);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('디럭스리버 킹(리버뷰/NEW)', 'RESERVATION_O', 2, '193000', '킹침대 1개, 성인 2명, 강 전망, 객실 크기(㎡) - 37.00, 전용 욕실, 에어컨', 62);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('캐빈', 'RESERVATION_O', 2, '284000', '킹침대 1개, 성인 2명, 객실 크기(㎡) - 43.00, 전용 욕실, 에어컨, 냉장고', 63);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('팀버 주니어', 'RESERVATION_O', 2, '323000', '싱글침대 1개,킹침대 1개, 성인 2명, 객실 크기(㎡) - 66.00, 전용 욕실, 에어컨, 냉장고', 63);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('팀버', 'RESERVATION_O', 2, '338000', '킹침대 1개, 성인 2명, 객실 크기(㎡) - 66.00, 전용 욕실, 에어컨, 냉장고', 63);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈페리어 더블', 'RESERVATION_O', 2, '268000', '더블 침대 1개, 성인 2명', 64);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('디럭스 더블', 'RESERVATION_O', 2, '379000', '더블 침대 1개, 성인 2명', 64);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('슈페리어 더블', 'RESERVATION_O', 2, '276000', '더블 침대 1개, 성인 2명', 64);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('럭셔리 킹 룸', 'RESERVATION_O', 2, '266000', '킹침대 1개, 성인 2명, 시내 전망, 객실 크기(㎡) - 37.00, 전용 욕실, 에어컨', 65);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('럭셔리 트윈 룸', 'RESERVATION_O', 2, '152000', '싱글침대 2개, 성인 2명, 시내 전망, 객실 크기(㎡) - 37.00, 전용 욕실, 에어컨', 65);
insert into rooms (room_name, room_status, room_count, room_price, option_others, hotel_id) values('럭셔리 레이크 킹', 'RESERVATION_O', 2, '220000', '킹 침대 1개, 성인 2명', 65);

insert into roomimg(room_img_url, room_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/11/29/aYb4/qkR7zml32H.jpg?width=720&quality=90', 181);
insert into roomimg(room_img_url, room_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/11/29/9B3j/v9CtvE7AWr.jpg?width=720&quality=90', 182);
insert into roomimg(room_img_url, room_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/11/29/mCCu/cwEPUq0cYB.jpg?width=720&quality=90', 183);
insert into roomimg(room_img_url, room_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/04/11/oTZp/5UWEbJ4sWd.jpg?width=720&quality=90', 184);
insert into roomimg(room_img_url, room_id) values('https://yaimg.yanolja.com/v5/2022/12/28/15/63ac5d3a17a249.78268184.jpg', 185);
insert into roomimg(room_img_url, room_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2024/06/13/1NMS/PVAzZ5Q7R2.jpg?width=720&quality=90', 186);
insert into roomimg(room_img_url, room_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/10/25/hsr4/doxYBhIRlD.jpg?width=720&quality=90', 187);
insert into roomimg(room_img_url, room_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/10/25/MJ2v/sBKOSSdraQ.jpg?width=720&quality=90', 188);
insert into roomimg(room_img_url, room_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/10/25/byWr/rJaCYal276.jpg?width=720&quality=90', 189);
insert into roomimg(room_img_url, room_id) values('https://yaimg.yanolja.com/v5/2022/10/30/13/635e776cf0ef14.07464400.jpg', 190);
insert into roomimg(room_img_url, room_id) values('https://yaimg.yanolja.com/v5/2022/10/30/13/635e77714085c1.28972843.jpg', 191);
insert into roomimg(room_img_url, room_id) values('https://yaimg.yanolja.com/v5/2022/10/30/13/635e776f459b79.94822000.jpg', 192);
insert into roomimg(room_img_url, room_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/11/01/ACtu/BnQgin88UE.jpg?width=720&quality=90', 193);
insert into roomimg(room_img_url, room_id) values('https://dry7pvlp22cox.cloudfront.net/mrt-images-prod/2023/11/01/o7TP/MWPjlZD3Ei.jpg?width=720&quality=90', 194);
insert into roomimg(room_img_url, room_id) values('https://yaimg.yanolja.com/v5/2022/10/25/17/63581d3a3fa9d1.81374196.jpg', 195);

update hotels set hotel_city = '서울' where hotel_id between 61 and 65;

