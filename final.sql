drop table �ֹ�;
drop table ��ǰ;
drop table �з�;
drop table ȸ��;
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


Create table ȸ�� (
	ID varchar2(15),
	�̸� varchar2(10),
	��й�ȣ varchar2(15),
	������� varchar2(10),
	�ּ� varchar2(100),
	����ó varchar2(15),
	primary key (ID)
);

insert into ȸ�� values ('administrator', '������', 'admin1234', '', '', '');
insert into ȸ�� values ('lmk0910', '�̹α�', '1234', '19970910', '�λ걤���� �ϱ� ȿ���� 40 603�� 501ȣ', '01071299822');

Create table �з� (
	�з��ڵ� int,
	�з��� varchar2(20),
	primary key (�з��ڵ�)
);

insert into �з� values (1, '�ǾƳ�');
insert into �з� values (2, '�÷�');
insert into �з� values (3, '���̿ø�');
insert into �з� values (4, '��Ÿ');
insert into �з� values (5, '�巳');

Create table ��ǰ (
	��ǰ��ȣ int,
	��ǰ�� varchar2(80),
	������ varchar2(50),
	���� int,
	�з��ڵ� int,
	�̹��� varchar2(30),
	��õ int,
        primary key (��ǰ��ȣ),
	foreign key (�з��ڵ�) references �з�
);

insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'CASIO CDP-S350', 'CASIO', 750000, 1, 'cdps350.JPG', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'CASIO CDP-235R', 'CASIO', 800000, 1, 'cdp235r.JPG', 1);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'CASIO CDP-130', 'CASIO', 500000, 1, 'cdp130.jpg', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'YAMAHA YDP-164', 'YAMAHA', 1350000, 1, 'ydp164.jpg', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'YAMAHA YDP-S54', 'YAMAHA', 1300000, 1, 'ydps54.JPG', 1);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, '���� ���� �������ǾƳ� NDP-50 Plus', '����', 799000, 1, 'ndp50plus.jpg', 1);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, '���� �������ǾƳ� NSP-20', '����', 799000, 1, 'nsp20.jpg', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, '��â RG120', '��â', 1600000, 1, 'rg120.jpg', 1);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, '��â RG1S', '��â', 1500000, 1, 'rg1s.jpg', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'YAMAHA YFL-222', 'YAMAHA', 590000, 2, 'yfl222.JPG', 1);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'YAMAHA YFL-362', 'YAMAHA', 1500000, 2, 'yfl362.jpg', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'YAMAHA YFL-482', 'YAMAHA', 1500000, 2, 'yfl482.JPG', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, '��â AWFL-110', '��â', 340000, 2, 'awfl110.jpg', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, '��â AWFL-220', '��â', 440000, 2, 'awfl220.jpg', 1);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, '��â AWFL-512', '��â', 1600000, 2, 'awfl512.jpg', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, '���� ESFL-211', '����', 290000, 2, 'esfl211.jpg', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, '���� SFL-411E', '����', 390000, 2, 'sfl411e.jpg', 1);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, '���� SEILER MAESTRO', '����', 350000, 2, 'maestro.jpg', 1);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'YAMAHA V3S', 'YAMAHA', 300000, 3, 'v3s.JPG', 1);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'YAMAHA V5SA', 'YAMAHA', 700000, 3, 'v5sa.jpg', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'YAMAHA V5SC', 'YAMAHA', 750000, 3, 'v5sc.jpg', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, '���� SVD-150A ���̿ø�', '����', 250000, 3, 'svd150a.jpg', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, '���� SVS-5000P ���̿ø�', '����', 499000, 3, 'svd150a.jpg', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, '���� SVD-150C ���̿ø�', '����', 1490000, 3, 'svd150a.jpg', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, '��â AWV250N', '��â', 210000, 3, 'awv250n.jpg', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, '��â AWV290N', '��â', 263000, 3, 'awv290n.jpg', 1);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'YAMAHA GC32C', 'YAMAHA', 1800000, 4, 'gc32c.JPG', 1);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'YAMAHA CGS104AII', 'YAMAHA', 200000, 4, 'cgs104aii.JPG', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'YAMAHA NTX1', 'YAMAHA', 500000, 4, 'ntx1.JPG', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'Cort SFX-ME', 'Cort', 210000, 4, 'sfxme.JPG', 1);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'Cort AC70', 'Cort', 150000, 4, 'ac70.JPG', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'Cort AP550', 'Cort', 200000, 4, 'ap550.JPG', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'Dame LILIES 100 SE CONCERT', 'Dame', 200000, 4, 'lilies100seconcert.jpg', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'Dame LILIES 400 ALL G', 'Dame', 500000, 4, 'lilies400allg.jpg', 1);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'Dame VALENTINE 253', 'Dame', 300000, 4, 'valentine253.jpg', 0);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'YAMAHA RDP2F5', 'YAMAHA', 1100000, 5, 'rdp2f5.JPG', 1);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, 'YAMAHA GIGMAKER', 'YAMAHA', 850000, 5, 'gigmaker.JPG', 1);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, '���� ALESIS �巳 Command Mesh Kit', '����', 1370000, 5, 'commandmeshkit.jpg', 1);
insert into ��ǰ values (GOOD_SEQ.NEXTVAL, '��â AW50 �巳��Ʈ', '��â', 690000, 5, 'aw50.jpg', 1);

Create table �ֹ� (
	�ֹ���ȣ int,
	ID varchar2(15),
	��ǰ��ȣ int,
	����ּ� varchar2(50),
	primary key (�ֹ���ȣ),
	foreign key (ID) references ȸ��,
	foreign key (��ǰ��ȣ) references ��ǰ
);