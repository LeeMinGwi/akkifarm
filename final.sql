drop table 주문;
drop table 상품;
drop table 분류;
drop table 회원;
drop sequence NO_SEQ;
drop sequence GOOD_SEQ;

Create sequence NO_SEQ
	start with 1
	increment by 1
	maxvalue 99999
	minvalue 1
	nocycle;

Create sequence GOOD_SEQ
	start with 1
	increment by 1
	maxvalue 99999
	minvalue 1
	nocycle;


Create table 회원 (
	ID varchar2(15),
	이름 varchar2(10),
	비밀번호 varchar2(15),
	생년월일 varchar2(10),
	주소 varchar2(100),
	연락처 varchar2(15),
	primary key (ID)
);

insert into 회원 values ('administrator', '관리자', 'admin1234', '', '', '');
insert into 회원 values ('lmk0910', '이민귀', '1234', '19970910', '부산광역시 북구 효열로 40 603동 501호', '01071299822');

Create table 분류 (
	분류코드 int,
	분류명 varchar2(20),
	primary key (분류코드)
);

insert into 분류 values (1, '피아노');
insert into 분류 values (2, '플룻');
insert into 분류 values (3, '바이올린');
insert into 분류 values (4, '기타');
insert into 분류 values (5, '드럼');

Create table 상품 (
	상품번호 int,
	상품명 varchar2(80),
	제조사 varchar2(50),
	가격 int,
	분류코드 int,
	이미지 varchar2(30),
	추천 int,
        primary key (상품번호),
	foreign key (분류코드) references 분류
);

insert into 상품 values (GOOD_SEQ.NEXTVAL, 'CASIO CDP-S350', 'CASIO', 750000, 1, 'cdps350.JPG', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'CASIO CDP-235R', 'CASIO', 800000, 1, 'cdp235r.JPG', 1);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'CASIO CDP-130', 'CASIO', 500000, 1, 'cdp130.jpg', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'YAMAHA YDP-164', 'YAMAHA', 1350000, 1, 'ydp164.jpg', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'YAMAHA YDP-S54', 'YAMAHA', 1300000, 1, 'ydps54.JPG', 1);
insert into 상품 values (GOOD_SEQ.NEXTVAL, '삼익 슬림 디지털피아노 NDP-50 Plus', '삼익', 799000, 1, 'ndp50plus.jpg', 1);
insert into 상품 values (GOOD_SEQ.NEXTVAL, '삼익 디지털피아노 NSP-20', '삼익', 799000, 1, 'nsp20.jpg', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, '영창 RG120', '영창', 1600000, 1, 'rg120.jpg', 1);
insert into 상품 values (GOOD_SEQ.NEXTVAL, '영창 RG1S', '영창', 1500000, 1, 'rg1s.jpg', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'YAMAHA YFL-222', 'YAMAHA', 590000, 2, 'yfl222.JPG', 1);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'YAMAHA YFL-362', 'YAMAHA', 1500000, 2, 'yfl362.jpg', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'YAMAHA YFL-482', 'YAMAHA', 1500000, 2, 'yfl482.JPG', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, '영창 AWFL-110', '영창', 340000, 2, 'awfl110.jpg', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, '영창 AWFL-220', '영창', 440000, 2, 'awfl220.jpg', 1);
insert into 상품 values (GOOD_SEQ.NEXTVAL, '영창 AWFL-512', '영창', 1600000, 2, 'awfl512.jpg', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, '삼익 ESFL-211', '삼익', 290000, 2, 'esfl211.jpg', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, '삼익 SFL-411E', '삼익', 390000, 2, 'sfl411e.jpg', 1);
insert into 상품 values (GOOD_SEQ.NEXTVAL, '삼익 SEILER MAESTRO', '삼익', 350000, 2, 'maestro.jpg', 1);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'YAMAHA V3S', 'YAMAHA', 300000, 3, 'v3s.JPG', 1);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'YAMAHA V5SA', 'YAMAHA', 700000, 3, 'v5sa.jpg', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'YAMAHA V5SC', 'YAMAHA', 750000, 3, 'v5sc.jpg', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, '삼익 SVD-150A 바이올린', '삼익', 250000, 3, 'svd150a.jpg', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, '삼익 SVS-5000P 바이올린', '삼익', 499000, 3, 'svd150a.jpg', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, '삼익 SVD-150C 바이올린', '삼익', 1490000, 3, 'svd150a.jpg', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, '영창 AWV250N', '영창', 210000, 3, 'awv250n.jpg', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, '영창 AWV290N', '영창', 263000, 3, 'awv290n.jpg', 1);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'YAMAHA GC32C', 'YAMAHA', 1800000, 4, 'gc32c.JPG', 1);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'YAMAHA CGS104AII', 'YAMAHA', 200000, 4, 'cgs104aii.JPG', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'YAMAHA NTX1', 'YAMAHA', 500000, 4, 'ntx1.JPG', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'Cort SFX-ME', 'Cort', 210000, 4, 'sfxme.JPG', 1);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'Cort AC70', 'Cort', 150000, 4, 'ac70.JPG', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'Cort AP550', 'Cort', 200000, 4, 'ap550.JPG', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'Dame LILIES 100 SE CONCERT', 'Dame', 200000, 4, 'lilies100seconcert.jpg', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'Dame LILIES 400 ALL G', 'Dame', 500000, 4, 'lilies400allg.jpg', 1);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'Dame VALENTINE 253', 'Dame', 300000, 4, 'valentine253.jpg', 0);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'YAMAHA RDP2F5', 'YAMAHA', 1100000, 5, 'rdp2f5.JPG', 1);
insert into 상품 values (GOOD_SEQ.NEXTVAL, 'YAMAHA GIGMAKER', 'YAMAHA', 850000, 5, 'gigmaker.JPG', 1);
insert into 상품 values (GOOD_SEQ.NEXTVAL, '삼익 ALESIS 드럼 Command Mesh Kit', '삼익', 1370000, 5, 'commandmeshkit.jpg', 1);
insert into 상품 values (GOOD_SEQ.NEXTVAL, '영창 AW50 드럼세트', '영창', 690000, 5, 'aw50.jpg', 1);

Create table 주문 (
	주문번호 int,
	ID varchar2(15),
	상품번호 int,
	배송주소 varchar2(50),
	primary key (주문번호),
	foreign key (ID) references 회원,
	foreign key (상품번호) references 상품
);