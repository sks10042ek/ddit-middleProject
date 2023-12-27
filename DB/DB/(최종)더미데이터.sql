DROP SEQUENCE ACC_SEQ; 
DROP SEQUENCE BO_SEQ;
DROP SEQUENCE COM_SEQ;
DROP SEQUENCE GB_SEQ;
DROP SEQUENCE MIL_SEQ;
DROP SEQUENCE PAY_SEQ;
DROP SEQUENCE PH_SEQ;
DROP SEQUENCE REF_SEQ;
DROP SEQUENCE RES_SEQ;
DROP SEQUENCE REV_SEQ;
DROP SEQUENCE ROM_SEQ;
DROP SEQUENCE GB_SEB;
   
DROP TABLE "ACCOMMODATION" CASCADE CONSTRAINTS;
DROP TABLE "ATTENDANCE" CASCADE CONSTRAINTS;
DROP TABLE "BOARD" CASCADE CONSTRAINTS;
DROP TABLE "CHAT_HIS" CASCADE CONSTRAINTS;
DROP TABLE "COMENT" CASCADE CONSTRAINTS;
DROP TABLE "COUPON" CASCADE CONSTRAINTS;
DROP TABLE "CP_HAVING" CASCADE CONSTRAINTS;
DROP TABLE "GB_PRTCP" CASCADE CONSTRAINTS;
DROP TABLE "GROUPBUYING" CASCADE CONSTRAINTS;
DROP TABLE "HIS_MILEAGE" CASCADE CONSTRAINTS;
DROP TABLE "MEM_IMAGE" CASCADE CONSTRAINTS;
DROP TABLE "MEMBER" CASCADE CONSTRAINTS;
DROP TABLE "MILEAGE" CASCADE CONSTRAINTS;
DROP TABLE "PAYMENT" CASCADE CONSTRAINTS;
DROP TABLE "PHOTO" CASCADE CONSTRAINTS;
DROP TABLE "REFUND" CASCADE CONSTRAINTS;
DROP TABLE "RESERVATION" CASCADE CONSTRAINTS;
DROP TABLE "REVIEW" CASCADE CONSTRAINTS;
DROP TABLE "ROOM" CASCADE CONSTRAINTS;
DROP TABLE "SERVICE_LIST" CASCADE CONSTRAINTS;
DROP TABLE "SERVICE_INFO" CASCADE CONSTRAINTS;
DROP TABLE "WISHLIST" CASCADE CONSTRAINTS;   
   commit;
   
---------------------------------------------------------------------------------------------------------

CREATE TABLE ACCOMMODATION
(
	A_CODE               VARCHAR2(10) NOT NULL ,
	A_NAME               VARCHAR2(50) NOT NULL ,
	A_ADDR               VARCHAR2(200) NOT NULL ,
	A_TEL                VARCHAR2(20) NOT NULL ,
	A_WNUM               NUMBER(4) NOT NULL ,
	A_ENTIME             VARCHAR2(10) NOT NULL ,
	A_EXTIME             VARCHAR2(10) NOT NULL ,
	A_TYPE               VARCHAR2(10) NOT NULL 
);



CREATE UNIQUE INDEX XPK숙박업체 ON ACCOMMODATION
(A_CODE   ASC);



ALTER TABLE ACCOMMODATION
	ADD CONSTRAINT  XPK숙박업체 PRIMARY KEY (A_CODE);



CREATE TABLE ATTENDANCE
(
	MEM_ID               VARCHAR2(30) NOT NULL ,
	ATT_DATE             DATE NOT NULL 
);



CREATE UNIQUE INDEX XPK출석_체크 ON ATTENDANCE
(MEM_ID   ASC,ATT_DATE   ASC);



ALTER TABLE ATTENDANCE
	ADD CONSTRAINT  XPK출석_체크 PRIMARY KEY (MEM_ID,ATT_DATE);



CREATE TABLE BOARD
(
	BO_CODE              VARCHAR2(10) NOT NULL ,
	BO_TYPE              VARCHAR2(20) NOT NULL ,
	BO_TITLE             VARCHAR2(100) NOT NULL ,
	BO_CONTENT           CLOB NOT NULL ,
	BO_DATE              DATE NOT NULL ,
	MEM_ID               VARCHAR2(30) NOT NULL 
);



CREATE UNIQUE INDEX XPK게시판 ON BOARD
(BO_CODE   ASC);



ALTER TABLE BOARD
	ADD CONSTRAINT  XPK게시판 PRIMARY KEY (BO_CODE);



CREATE TABLE CHAT_HIS
(
	MEM_ID               VARCHAR2(30) NOT NULL ,
	채팅_코              VARCHAR2(10) NOT NULL ,
	CH_FILENAME          VARCHAR2(300) NOT NULL 
);



CREATE UNIQUE INDEX XPK채팅이력 ON CHAT_HIS
(MEM_ID   ASC,채팅_코   ASC);



ALTER TABLE CHAT_HIS
	ADD CONSTRAINT  XPK채팅이력 PRIMARY KEY (MEM_ID,채팅_코);



CREATE TABLE COMENT
(
	CO_CODE              VARCHAR2(10) NOT NULL ,
	BO_CODE              VARCHAR2(10) NOT NULL ,
	CO_CONTENT           CLOB NOT NULL 
);



CREATE UNIQUE INDEX XPK댓글 ON COMENT
(CO_CODE   ASC);



ALTER TABLE COMENT
	ADD CONSTRAINT  XPK댓글 PRIMARY KEY (CO_CODE);



CREATE TABLE COUPON
(
	CO_CODE              VARCHAR2(10) NOT NULL ,
	CO_NAME              VARCHAR2(30) NOT NULL ,
	CO_RATE              NUMBER(2) NOT NULL 
);



CREATE UNIQUE INDEX XPK쿠폰 ON COUPON
(CO_CODE   ASC);



ALTER TABLE COUPON
	ADD CONSTRAINT  XPK쿠폰 PRIMARY KEY (CO_CODE);



CREATE TABLE CP_HAVING
(
	CO_CODE              VARCHAR2(10) NOT NULL ,
	MEM_ID               VARCHAR2(30) NOT NULL ,
	CP_USE               NUMBER NOT NULL ,
	CP_DATE              date NOT NULL 
);



CREATE UNIQUE INDEX XPK쿠폰_보유자 ON CP_HAVING
(CO_CODE   ASC,MEM_ID   ASC);



ALTER TABLE CP_HAVING
	ADD CONSTRAINT  XPK쿠폰_보유자 PRIMARY KEY (CO_CODE,MEM_ID);



CREATE TABLE GB_PRTCP
(
	GB_CODE              VARCHAR2(10) NOT NULL ,
	MEM_ID               VARCHAR2(30) NOT NULL 
);



CREATE UNIQUE INDEX XPK공동구매_참여자 ON GB_PRTCP
(GB_CODE   ASC,MEM_ID   ASC);



ALTER TABLE GB_PRTCP
	ADD CONSTRAINT  XPK공동구매_참여자 PRIMARY KEY (GB_CODE,MEM_ID);



CREATE TABLE GROUPBUYING
(
	GB_CODE              VARCHAR2(10) NOT NULL ,
	MEM_ID               VARCHAR2(30) NOT NULL ,
	GB_TITLE             VARCHAR2(100) NOT NULL ,
	GB_CONTENT           CLOB NOT NULL ,
	GB_INVEN             NUMBER(2) NOT NULL ,
	GB_DATE              DATE NOT NULL 
);



CREATE UNIQUE INDEX XPK공동구매 ON GROUPBUYING
(GB_CODE   ASC);



ALTER TABLE GROUPBUYING
	ADD CONSTRAINT  XPK공동구매 PRIMARY KEY (GB_CODE);



CREATE TABLE HIS_MILEAGE
(
	MIL_CODE             VARCHAR2(10) NOT NULL ,
	MEM_ID               VARCHAR2(30) NOT NULL ,
	MIL_DATE             DATE NOT NULL ,
	MIL_SAVEHIS          VARCHAR2(50) NULL ,
	MIL_USEHIS           VARCHAR2(50) NULL 
);



CREATE UNIQUE INDEX XPK마일리지내역 ON HIS_MILEAGE
(MIL_CODE   ASC,MEM_ID   ASC);



ALTER TABLE HIS_MILEAGE
	ADD CONSTRAINT  XPK마일리지내역 PRIMARY KEY (MIL_CODE,MEM_ID);



CREATE TABLE MEMBER
(
	MEM_ID               VARCHAR2(30) NOT NULL ,
	MEM_PASS             VARCHAR2(30) NOT NULL ,
	MEM_NAME             VARCHAR2(40) NOT NULL ,
	MEM_EMAIL            VARCHAR2(50) NOT NULL ,
	MEM_TEL              VARCHAR2(20) NOT NULL ,
	MEM_BIRTH            DATE NOT NULL ,
	MEM_GENDER           VARCHAR2(10) NOT NULL ,
	MEM_CODE             VARCHAR2(10) NOT NULL ,
	MEM_MIL              NUMBER(8) NOT NULL ,
	MEM_PHOTO            VARCHAR2(300) NULL 
);



CREATE UNIQUE INDEX XPK회원 ON MEMBER
(MEM_ID   ASC);



ALTER TABLE MEMBER
	ADD CONSTRAINT  XPK회원 PRIMARY KEY (MEM_ID);



CREATE TABLE MILEAGE
(
	MIL_CODE             VARCHAR2(10) NOT NULL ,
	MEM_ID               VARCHAR2(30) NOT NULL ,
	MIL_RESAMOUNT        NUMBER NULL ,
	MIL_USEAMOUNT        NUMBER NULL 
);



CREATE UNIQUE INDEX XPK마일리지 ON MILEAGE
(MIL_CODE   ASC,MEM_ID   ASC);



ALTER TABLE MILEAGE
	ADD CONSTRAINT  XPK마일리지 PRIMARY KEY (MIL_CODE,MEM_ID);



CREATE TABLE PAYMENT
(
	PAY_NO               VARCHAR2(20) NOT NULL ,
	RES_CODE             VARCHAR2(10) NOT NULL ,
	PAY_DATE             DATE NOT NULL ,
	PAY_PRICE            NUMBER(10) NOT NULL ,
	PAY_METHOD           VARCHAR2(20) NOT NULL 
);



CREATE UNIQUE INDEX XPK결제 ON PAYMENT
(PAY_NO   ASC);



ALTER TABLE PAYMENT
	ADD CONSTRAINT  XPK결제 PRIMARY KEY (PAY_NO);



CREATE TABLE PHOTO
(
	PT_CODE              VARCHAR2(15) NOT NULL ,
	PT_OFILE             VARCHAR2(300) NOT NULL ,
	PT_SFILE             VARCHAR2(300) NOT NULL ,
	PT_TYPE              VARCHAR2(30) NOT NULL ,
	PT_PACODE            VARCHAR2(20) NULL 
);



CREATE UNIQUE INDEX XPK사진 ON PHOTO
(PT_CODE   ASC);



ALTER TABLE PHOTO
	ADD CONSTRAINT  XPK사진 PRIMARY KEY (PT_CODE);



CREATE TABLE REFUND
(
	RF_CODE              VARCHAR2(10) NOT NULL ,
	PAY_NO               VARCHAR2(20) NOT NULL ,
	RF_DATE              DATE NOT NULL 
);



CREATE UNIQUE INDEX XPK환불 ON REFUND
(RF_CODE   ASC);



ALTER TABLE REFUND
	ADD CONSTRAINT  XPK환불 PRIMARY KEY (RF_CODE);



CREATE TABLE RESERVATION
(
	RES_CODE             VARCHAR2(10) NOT NULL ,
	R_CODE               VARCHAR2(10) NOT NULL ,
	MEM_ID               VARCHAR2(30) NOT NULL ,
	RES_CIN              DATE NOT NULL ,
	RES_COUT             DATE NOT NULL ,
	RES_MEMO             CLOB NOT NULL ,
	RES_STATUS           VARCHAR2(15) NOT NULL 
);



CREATE UNIQUE INDEX XPK예약 ON RESERVATION
(RES_CODE   ASC);



ALTER TABLE RESERVATION
	ADD CONSTRAINT  XPK예약 PRIMARY KEY (RES_CODE);



CREATE TABLE REVIEW
(
	REV_CODE             VARCHAR2(10) NOT NULL ,
	RES_CODE             VARCHAR2(10) NOT NULL ,
	REV_DATE             DATE NOT NULL ,
	REV_SCORE            NUMBER(1) NOT NULL ,
	REV_TITLE            CLOB NOT NULL ,
	REV_CONTENT          CLOB NOT NULL 
);



CREATE UNIQUE INDEX XPK리뷰 ON REVIEW
(REV_CODE   ASC);



ALTER TABLE REVIEW
	ADD CONSTRAINT  XPK리뷰 PRIMARY KEY (REV_CODE);



CREATE TABLE ROOM
(
	R_CODE               VARCHAR2(10) NOT NULL ,
	A_CODE               VARCHAR2(10) NOT NULL ,
	R_TYPE               VARCHAR2(20) NOT NULL ,
	R_MIN                NUMBER(10) NOT NULL ,
	R_MAX                NUMBER(10) NOT NULL ,
	R_PRICE              NUMBER(10) NOT NULL ,
	R_INVEN              NUMBER(2) NOT NULL 
);



CREATE UNIQUE INDEX XPK객실 ON ROOM
(R_CODE   ASC);



ALTER TABLE ROOM
	ADD CONSTRAINT  XPK객실 PRIMARY KEY (R_CODE);



CREATE TABLE SERVICE_INFO
(
	SI_CODE              VARCHAR2(10) NOT NULL ,
	SI_NAME              VARCHAR2(20) NOT NULL 
);



CREATE UNIQUE INDEX XPK숙박서비스상세 ON SERVICE_INFO
(SI_CODE   ASC);



ALTER TABLE SERVICE_INFO
	ADD CONSTRAINT  XPK숙박서비스상세 PRIMARY KEY (SI_CODE);



CREATE TABLE SERVICE_LIST
(
	A_CODE               VARCHAR2(10) NOT NULL ,
	SI_CODE              VARCHAR2(10) NOT NULL 
);



CREATE UNIQUE INDEX XPK숙박서비스 ON SERVICE_LIST
(A_CODE   ASC,SI_CODE   ASC);



ALTER TABLE SERVICE_LIST
	ADD CONSTRAINT  XPK숙박서비스 PRIMARY KEY (A_CODE,SI_CODE);



CREATE TABLE WISHLIST
(
	MEM_ID               VARCHAR2(30) NOT NULL ,
	A_CODE               VARCHAR2(10) NOT NULL 
);



CREATE UNIQUE INDEX XPK위시리스트 ON WISHLIST
(MEM_ID   ASC,A_CODE   ASC);



ALTER TABLE WISHLIST
	ADD CONSTRAINT  XPK위시리스트 PRIMARY KEY (MEM_ID,A_CODE);



ALTER TABLE ATTENDANCE
	ADD (CONSTRAINT R_13 FOREIGN KEY (MEM_ID) REFERENCES MEMBER (MEM_ID));



ALTER TABLE BOARD
	ADD (CONSTRAINT R_15 FOREIGN KEY (MEM_ID) REFERENCES MEMBER (MEM_ID));



ALTER TABLE CHAT_HIS
	ADD (CONSTRAINT R_41 FOREIGN KEY (MEM_ID) REFERENCES MEMBER (MEM_ID));



ALTER TABLE COMENT
	ADD (CONSTRAINT R_33 FOREIGN KEY (BO_CODE) REFERENCES BOARD (BO_CODE));



ALTER TABLE CP_HAVING
	ADD (CONSTRAINT R_21 FOREIGN KEY (CO_CODE) REFERENCES COUPON (CO_CODE));



ALTER TABLE CP_HAVING
	ADD (CONSTRAINT R_22 FOREIGN KEY (MEM_ID) REFERENCES MEMBER (MEM_ID));



ALTER TABLE GB_PRTCP
	ADD (CONSTRAINT R_17 FOREIGN KEY (GB_CODE) REFERENCES GROUPBUYING (GB_CODE));



ALTER TABLE GB_PRTCP
	ADD (CONSTRAINT R_18 FOREIGN KEY (MEM_ID) REFERENCES MEMBER (MEM_ID));



ALTER TABLE GROUPBUYING
	ADD (CONSTRAINT R_16 FOREIGN KEY (MEM_ID) REFERENCES MEMBER (MEM_ID));



ALTER TABLE HIS_MILEAGE
	ADD (CONSTRAINT R_40 FOREIGN KEY (MIL_CODE, MEM_ID) REFERENCES MILEAGE (MIL_CODE, MEM_ID));



ALTER TABLE MILEAGE
	ADD (CONSTRAINT R_39 FOREIGN KEY (MEM_ID) REFERENCES MEMBER (MEM_ID));



ALTER TABLE PAYMENT
	ADD (CONSTRAINT R_10 FOREIGN KEY (RES_CODE) REFERENCES RESERVATION (RES_CODE));



ALTER TABLE REFUND
	ADD (CONSTRAINT R_14 FOREIGN KEY (PAY_NO) REFERENCES PAYMENT (PAY_NO));



ALTER TABLE RESERVATION
	ADD (CONSTRAINT R_3 FOREIGN KEY (MEM_ID) REFERENCES MEMBER (MEM_ID));



ALTER TABLE RESERVATION
	ADD (CONSTRAINT R_31 FOREIGN KEY (R_CODE) REFERENCES ROOM (R_CODE));



ALTER TABLE REVIEW
	ADD (CONSTRAINT R_8 FOREIGN KEY (RES_CODE) REFERENCES RESERVATION (RES_CODE));



ALTER TABLE ROOM
	ADD (CONSTRAINT R_29 FOREIGN KEY (A_CODE) REFERENCES ACCOMMODATION (A_CODE));
--------------------------------------------------------------------------------
--MEMBER 

INSERT INTO member (mem_id, mem_pass, mem_name, mem_email, mem_tel, mem_birth, mem_gender, mem_code, mem_mil, mem_photo)
VALUES ('LittleQueka', '1234', '김정하', 'little@naver.com', '010-1234-5678', TO_DATE('2000-12-15', 'YYYY-MM-DD'), 'Female','회원', 1000, '');

INSERT INTO member (mem_id, mem_pass, mem_name, mem_email, mem_tel, mem_birth, mem_gender, mem_code, mem_mil, mem_photo)
VALUES ('BigQueka', '1234', '유선영', 'big@naver.com', '010-9101-1213', TO_DATE('2000-12-16', 'YYYY-MM-DD'), 'Male','회원', 1000, '');

INSERT INTO member (mem_id, mem_pass, mem_name, mem_email, mem_tel, mem_birth, mem_gender, mem_code, mem_mil, mem_photo)
VALUES ('MiddleQueka', '1234', '최광식', 'middle@naver.com', '010-1415-1617', TO_DATE('2000-12-17', 'YYYY-MM-DD'), 'Male','회원', 1000, '');

INSERT INTO member (mem_id, mem_pass, mem_name, mem_email, mem_tel, mem_birth, mem_gender, mem_code, mem_mil, mem_photo)
VALUES ('CutieQueka', '1234', '신수연', 'cutie@naver.com', '010-1819-2021', TO_DATE('2000-12-18', 'YYYY-MM-DD'), 'Female','회원', 1000, '');

INSERT INTO member (mem_id, mem_pass, mem_name, mem_email, mem_tel, mem_birth, mem_gender, mem_code, mem_mil, mem_photo)
VALUES ('PrettyQueka', '1234', '황수빈', 'pretty@naver.com', '010-2223-2425', TO_DATE('2000-12-19', 'YYYY-MM-DD'), 'Female','회원', 1000, '');

INSERT INTO member (mem_id, mem_pass, mem_name, mem_email, mem_tel, mem_birth, mem_gender, mem_code, mem_mil, mem_photo)
VALUES ('Admin1', '1234', '관리자1', 'admin1@naver.com', '010-2627-2829', TO_DATE('2000-12-20', 'YYYY-MM-DD'), 'male','관리자', 1000, '');

INSERT INTO member (mem_id, mem_pass, mem_name, mem_email, mem_tel, mem_birth, mem_gender, mem_code, mem_mil, mem_photo)
VALUES ('Admin2', '1234', '관리자2', 'admin2@naver.com', '010-3031-3233', TO_DATE('2000-12-21', 'YYYY-MM-DD'), 'Female','관리자', 1000, '');

commit;
----------------------------------------------------------------------------------
--BOARD 

CREATE SEQUENCE bo_seq INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;
       
INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '1:1문의', '예약을 취소하고 싶어요.', '오늘 예약한 숙소를 취소하고 싶은데, 어떻게 해야할까요?','2023-08-05', 'LittleQueka');

INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '1:1문의', '아이디와 비밀번호를 잊었어요.', '회원 가입한 아이디와 비밀번호를 잊었어요.','2023-08-05', 'BigQueka');

INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '공지사항', '[발표] 7월 4차 제주어때 응원하기 이벤트', '??????????안녕하세요. 제주 어때입니다.
7월 4차 제주 어때 응원하기 이벤트 당첨자를 발표합니다. 당첨자 : Bi****ka','2023-08-05', 'Admin1');

INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '공지사항', '[발표] 8월 1차 제주어때 응원하기 이벤트', '안녕하세요. 제주 어때입니다.
7월 4차 제주 어때 응원하기 이벤트 당첨자를 발표합니다. 당첨자 : Mi*****ka','2023-08-05', 'Admin2');

INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '양도마켓', '그랜드 하얏트 제주 8월 23일~24일(1박2일) 양도해요.', '개인 사정으로 인해, 양도 할 사람을 찾습니다.','2023-08-22', 'LittleQueka');

INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '양도마켓', '호텔 스카이파크 제주 1호점 8월 23일~24일(1박2일) 양도해요', '급히 지방으로 갈 일이 생겼어요. 양도 받으실 분 댓글 부탁드려요.','2023-08-22', 'BigQueka');

commit;
---------------------------------------------------------------------------------
--COMENT

CREATE SEQUENCE com_seq INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;
       
       
INSERT INTO COMENT (CO_CODE, BO_CODE, CO_CONTENT)
VALUES ('JJCO23' || LPAD(COM_SEQ.NEXTVAL,4,'0'), 'JJBO230001', '예약취소는  홈페이지 > 마이페이지 > 예약내역에서 직접 가능합니다. 감사합니다.');

INSERT INTO COMENT (CO_CODE, BO_CODE, CO_CONTENT)
VALUES ('JJCO23' || LPAD(COM_SEQ.NEXTVAL,4,'0'), 'JJBO230002', '회원 정보 수정은 홈페이지 > 마이페이지 > 내 정보 수정에서 회원정보를 수정할 수 있습니다. 감사합니다.');


-- 양도마켓 댓글   ==>> 의문 ? 댓글 단 사람의 아이디는 보이지 않는데, 어떻게 그 해당 아이디를 찾아서 링크를 줄까?

---------------------------------------------------------------------------------
--ACCOMODATION

 create sequence acc_seq         
   increment by 1         
   start with 1         
   minvalue 1         
   maxvalue 9999         
   nocycle         
   nocache         
   noorder;         
            
   insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
   values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'그랜드 하얏트 제주','제주시','010-4455-9999' ,0,'1500','1100','호텔');  
   
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'호텔 스카이파크 제주 1호점','제주시','010-2525-6464' ,0,'1500','1100','호텔');  
   
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'메종 글래드 제주','제주시','010-1155-2626' ,0,'1500','1100','호텔');  

  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'노블리아 호텔','서귀포시','010-2222-5555' ,0,'1500','1100','호텔');  

  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'호텔 윈스토리','서귀포시','010-8877-4949' ,0,'1500','1100','호텔'); 
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'신신호텔 제주오션','서귀포시','010-5252-6666' ,0,'1500','1100','호텔'); 
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'유탑유블레스호텔 제주함덕','동부','010-4455-8888' ,0,'1500','1100','호텔'); 

  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'꼬뜨도르 호텔','동부','010-5522-7788' ,0,'1500','1100','호텔'); 
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'소노벨 제주','동부','010-7878-4455' ,0,'1500','1100','호텔');
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'다인오세아노 호텔','서부','010-4455-8856' ,0,'1500','1100','호텔'); 

  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'에코그린리조트','서부','010-6585-4544' ,0,'1500','1100','호텔'); 
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'제주 더스테이센추리 호텔','서부','010-0012-4545' ,0,'1500','1100','호텔');
  
  -----------------호텔
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'제주 팀버하우스 펜션','제주시','010-8856-9595' ,0,'1600','1100','펜션'); 
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'노브 힐스테이','제주시','010-7878-9515' ,0,'1600','1100','펜션');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'제주 애월펠리스','제주시','010-6622-2454' ,0,'1600','1100','펜션');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'제주 물댄동산 통나무펜션','서귀포시','010-2232-5656' ,0,'1600','1100','펜션');  
    
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'서귀포 더비비스제주 펜션','서귀포시','010-8585-8877' ,0,'1600','1100','펜션');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'서귀포 제주올레돔','서귀포시','010-2232-5656' ,0,'1600','1100','펜션');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'제주 틴더타운','동부','010-1515-9292' ,0,'1600','1100','펜션');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'제주 하이하도 풀빌라','동부','010-1515-9292' ,0,'1600','1100','펜션');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'우도 하얀성 펜션','동부','010-5544-8872' ,0,'1600','1100','펜션'); 
  
    insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'제주 바다그린 펜션','서부','010-4445-8885' ,0,'1600','1100','펜션');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'제주 다몽채 독체풀빌라','서부','010-6565-9514' ,0,'1600','1100','펜션');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'제주 애월바다향기펜션','서부','010-2585-3369' ,0,'1600','1100','펜션'); 
  
  ---------------펜션
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'제주 아지 호스텔','제주시','010-1111-4444' ,0,'1500','1000','게하');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'제주 린든게스트하우스','제주시','010-2222-8844' ,0,'1500','1000','게하');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'제주풍경','서귀포시','010-2525-7575' ,0,'1500','1000','게하');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'제주HY 초이 호스텔','서귀포시','010-2525-3321' ,0,'1500','1000','게하');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'제주 남극노인성 전통 한옥','서귀포시','010-5555-3354' ,0,'1500','1000','게하');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'제주 와락 게스트하우스','동부','010-7788-5555' ,0,'1500','1000','게하');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'뚜르드 제주','동부','010-8858-4444' ,0,'1500','1000','게하');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'제주 하영하영','동부','010-0223-6625' ,0,'1500','1000','게하');  
  
    insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'협재 서쪽 게스트하우스','서부','010-1122-4475' ,0,'1500','1000','게하');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'제주 6758','서부','010-8899-4444' ,0,'1500','1000','게하');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'제주 한옥골오기네','서부','010-4456-5568' ,0,'1500','1000','게하');  
  
  
COMMIT;

-----------------------------------------------------------------------------------
--MILEAGE

CREATE SEQUENCE mil_seq INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 99999
       NOCYCLE
       NOCACHE
       NOORDER;

                                --이부분 컬럼 명을 RESAMOUNT가 아니고.. 뭐.. GETAMOUNT이렇게 해야되는거 아닌강? 몰라~
   insert into MILEAGE (MIL_CODE, MIL_RESAMOUNT, MIL_USEAMOUNT, MEM_ID)
   values('ML23' || lpad(mil_seq.nextval,5,'0'),'1000','0', 'LittleQueka');  
   
   insert into MILEAGE (MIL_CODE, MIL_RESAMOUNT, MIL_USEAMOUNT, MEM_ID)
   values('ML23' || lpad(mil_seq.nextval,5,'0'),'1000','0', 'BigQueka'); 
   
   insert into MILEAGE (MIL_CODE, MIL_RESAMOUNT, MIL_USEAMOUNT, MEM_ID)
   values('ML23' || lpad(mil_seq.nextval,5,'0'),'1000','0', 'MiddleQueka'); 
   
   insert into MILEAGE (MIL_CODE, MIL_RESAMOUNT, MIL_USEAMOUNT, MEM_ID)
   values('ML23' || lpad(mil_seq.nextval,5,'0'),'1000','0', 'CutieQueka');
   
   insert into MILEAGE (MIL_CODE, MIL_RESAMOUNT, MIL_USEAMOUNT, MEM_ID)
   values('ML23' || lpad(mil_seq.nextval,5,'0'),'1000','0', 'PrettyQueka'); 
   
   commit;
-----------------------------------------------------------------------------------
--ROOM

CREATE SEQUENCE rom_seq INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;
       
    insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230001','스탠다드','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230001','슈퍼리어','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230001','디럭스','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230001','스위트','2', '3', '550000', '5');  
    
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230002','스탠다드','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230002','슈퍼리어','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230002','디럭스','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230002','스위트','2', '3', '550000', '5');  
    
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230003','스탠다드','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230003','슈퍼리어','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230003','디럭스','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230003','스위트','2', '3', '550000', '5');  
    
            insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230004','스탠다드','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230004','슈퍼리어','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230004','디럭스','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230004','스위트','2', '3', '550000', '5');  
    
            insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230005','스탠다드','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230005','슈퍼리어','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230005','디럭스','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230005','스위트','2', '3', '550000', '5');  
    
            insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230006','스탠다드','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230006','슈퍼리어','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230006','디럭스','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230006','스위트','2', '3', '550000', '5');  
    
            insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230007','스탠다드','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230007','슈퍼리어','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230007','디럭스','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230007','스위트','2', '3', '550000', '5');  
    
            insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230008','스탠다드','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230008','슈퍼리어','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230008','디럭스','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230008','스위트','2', '3', '550000', '5'); 
    
            insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230009','스탠다드','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230009','슈퍼리어','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230009','디럭스','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230009','스위트','2', '3', '550000', '5');  
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230009','스탠다드','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230009','슈퍼리어','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230009','디럭스','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230009','스위트','2', '3', '550000', '5'); 
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230010','스탠다드','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230010','슈퍼리어','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230010','디럭스','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230010','스위트','2', '3', '550000', '5'); 
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230011','스탠다드','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230011','슈퍼리어','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230011','디럭스','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230011','스위트','2', '3', '550000', '5'); 
    
       insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230012','스탠다드','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230012','슈퍼리어','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230012','디럭스','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230012','스위트','2', '3', '550000', '5'); 
    
    -----호텔
    
    insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230013','A타입','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230013','B타입','3', '5', '95000', '5'); 
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230014','A타입','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230014','B타입','3', '5', '95000', '5'); 
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230015','A타입','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230015','B타입','3', '5', '95000', '5'); 
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230016','A타입','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230016','B타입','3', '5', '95000', '5'); 
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230017','A타입','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230017','B타입','3', '5', '95000', '5'); 
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230018','A타입','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230018','B타입','3', '5', '95000', '5'); 
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230019','A타입','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230019','B타입','3', '5', '95000', '5'); 
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230020','A타입','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230020','B타입','3', '5', '95000', '5');
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230021','A타입','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230021','B타입','3', '5', '95000', '5');
    
         insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230022','A타입','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230022','B타입','3', '5', '95000', '5');
    
         insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230023','A타입','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230023','B타입','3', '5', '95000', '5');
    
         insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230024','A타입','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230024','B타입','3', '5', '95000', '5');

    -----------펜션
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230025','4인실(여자)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230025','4인실(남자)','3', '4', '35000', '5');
    
         insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230026','4인실(여자)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230026','4인실(남자)','3', '4', '35000', '5');


     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230027','4인실(여자)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230027','4인실(남자)','3', '4', '35000', '5');


     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230028','4인실(여자)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230028','4인실(남자)','3', '4', '35000', '5');


     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230029','4인실(여자)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230029','4인실(남자)','3', '4', '35000', '5');


     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230030','4인실(여자)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230030','4인실(남자)','3', '4', '35000', '5');


     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230031','4인실(여자)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230031','4인실(남자)','3', '4', '35000', '5');


     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230032','4인실(여자)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230032','4인실(남자)','3', '4', '35000', '5');
    
         insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230033','4인실(여자)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230033','4인실(남자)','3', '4', '35000', '5');
    
         insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230034','4인실(여자)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230034','4인실(남자)','3', '4', '35000', '5');
    
         insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230035','4인실(여자)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230035','4인실(남자)','3', '4', '35000', '5');

commit;
----------------------------------------------------------------------------------------------------
--RESERVATION

CREATE SEQUENCE res_seq INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 999999
       NOCYCLE
       NOCACHE
       NOORDER;
       
    insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS)
    values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230001','LittleQueka', '2023-08-01', '2023-08-03', '환기가 잘되는 곳으로 부탁해요.', '이용완료');     
       
    insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS) 
    values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230001','LittleQueka', '2023-08-23', '2023-08-24', '환기가 잘되는 곳으로 부탁해요.', '예약완료');  
    
    insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS)
    values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230008','BigQueka', '2023-08-01', '2023-08-03', '통풍이 잘되는 곳으로 부탁해요.', '예약완료'); 
      
    insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS)
    values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230008','BigQueka', '2023-08-23', '2023-08-24', '통풍이 잘되는 곳으로 부탁해요.', '예약완료');  
    
    insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS)
    values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230011','MiddleQueka', '2023-08-01', '2023-08-03', '오션뷰 객실이었으면 좋겠어요.', '예약완료'); 
    
    insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS)
    values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230011','MiddleQueka', '2023-08-28', '2023-08-30', '오션뷰 객실이었으면 좋겠어요.', '예약완료');  
    
    insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS)
    values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230015','CutieQueka', '2023-08-01', '2023-08-03', '마운틴뷰 객실이었으면 좋겠어요.', '예약완료'); 
    
    insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS)
    values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230015','CutieQueka', '2023-08-27', '2023-08-30', '마운틴뷰 객실이었으면 좋겠어요.', '예약완료');  
    
    insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS)
    values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230033','PrettyQueka', '2023-08-01', '2023-08-03', '시끄럽지 않은 곳으로 부탁해요', '예약완료');  
    
    insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS)
    values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230033','PrettyQueka', '2023-08-29', '2023-08-30', '시끄럽지 않은 곳으로 부탁해요', '예약완료');  


commit;
--------------------------------------------------------------------------------
--PAYMENT

CREATE SEQUENCE pay_seq INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 999999
       NOCYCLE
       NOCACHE
       NOORDER;
       
       commit;
    
    insert into payment (PAY_NO, RES_CODE, PAY_DATE, PAY_PRICE, PAY_METHOD)
    values('PY23' || lpad(pay_seq.nextval,6,'0'),'RS23000001','2023-07-31','250000', '토스');  

    insert into payment (PAY_NO, RES_CODE, PAY_DATE, PAY_PRICE, PAY_METHOD)
    values('PY23' || lpad(pay_seq.nextval,6,'0'),'RS23000002','2023-07-31','550000', '토스');  
    
    insert into payment (PAY_NO, RES_CODE, PAY_DATE, PAY_PRICE, PAY_METHOD)
    values('PY23' || lpad(pay_seq.nextval,6,'0'),'RS23000003','2023-08-11','450000', '토스');  
    
    insert into payment (PAY_NO, RES_CODE, PAY_DATE, PAY_PRICE, PAY_METHOD)
    values('PY23' || lpad(pay_seq.nextval,6,'0'),'RS23000004','2023-07-21','450000', '토스');  
    
        insert into payment (PAY_NO, RES_CODE, PAY_DATE, PAY_PRICE, PAY_METHOD)
    values('PY23' || lpad(pay_seq.nextval,6,'0'),'RS23000005','2023-07-18','250000', '토스');  
    
        insert into payment (PAY_NO, RES_CODE, PAY_DATE, PAY_PRICE, PAY_METHOD)
    values('PY23' || lpad(pay_seq.nextval,6,'0'),'RS23000006','2023-07-22','250000', '토스');
    
        insert into payment (PAY_NO, RES_CODE, PAY_DATE, PAY_PRICE, PAY_METHOD)
    values('PY23' || lpad(pay_seq.nextval,6,'0'),'RS23000007','2023-07-15','550000', '토스');
    
        insert into payment (PAY_NO, RES_CODE, PAY_DATE, PAY_PRICE, PAY_METHOD)
    values('PY23' || lpad(pay_seq.nextval,6,'0'),'RS23000008','2023-07-14','450000', '토스');
    
        insert into payment (PAY_NO, RES_CODE, PAY_DATE, PAY_PRICE, PAY_METHOD)
    values('PY23' || lpad(pay_seq.nextval,6,'0'),'RS23000009','2023-07-13','450000', '토스');
    
        insert into payment (PAY_NO, RES_CODE, PAY_DATE, PAY_PRICE, PAY_METHOD)
    values('PY23' || lpad(pay_seq.nextval,6,'0'),'RS23000010','2023-07-11','250000', '토스');
    
    commit;
-------------------------------------------------------------------------------------------------
--REFUND
CREATE SEQUENCE REF_seq INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 999999
       NOCYCLE
       NOCACHE
       NOORDER;
   
    insert into REFUND (RF_CODE, PAY_NO, RF_DATE)
    values('RF23' || lpad(REF_seq.nextval,6,'0'),'PY23000004','2023-08-02');  
       
    insert into REFUND (RF_CODE, PAY_NO, RF_DATE)
    values('RF23' || lpad(REF_seq.nextval,6,'0'),'PY23000005','2023-08-03');  
--------------------------------------------------------------------------------------------
--REVIEW
CREATE SEQUENCE REV_seq INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;
       
    insert into REVIEW (REV_CODE, RES_CODE, REV_DATE, REV_SCORE, REV_TITLE, REV_CONTENT)
    values('JJRV23' || lpad(REV_seq.nextval,4,'0'),'RS23000006','2023-08-04','4','뷰가 너무 좋아요 !','숙소가 너무 깨끗하고, 요청사항도 잘 들어주셔서 만족합니다. 다음에 또 오려구요.');  

    insert into REVIEW (REV_CODE, RES_CODE, REV_DATE, REV_SCORE, REV_TITLE, REV_CONTENT)
    values('JJRV23' || lpad(REV_seq.nextval,4,'0'),'RS23000007','2023-08-08', '5','좋은사람들과 행복한 하루..','경치가 참 좋고요. 서비스도 참 훌륭합니다. 다음에 또 올게요.'); 
        
    insert into REVIEW (REV_CODE, RES_CODE, REV_DATE, REV_SCORE, REV_TITLE, REV_CONTENT)
    values('JJRV23' || lpad(REV_seq.nextval,4,'0'),'RS23000008','2023-08-03', '5','제주도 여행오면 여기로~','제주도 처음 여행왔는데, 숙소가 제일 마음에 들었어요. 감사합니다.');  
        
    insert into REVIEW (REV_CODE, RES_CODE, REV_DATE, REV_SCORE, REV_TITLE, REV_CONTENT)
    values('JJRV23' || lpad(REV_seq.nextval,4,'0'),'RS23000009','2023-08-09', '5','근처에 볼 곳이 많아서 좋아요.','가족 여행으로 왔는데, 너무 만족하고 갑니다~');  
        
    insert into REVIEW (REV_CODE, RES_CODE, REV_DATE, REV_SCORE, REV_TITLE, REV_CONTENT)
    values('JJRV23' || lpad(REV_seq.nextval,4,'0'),'RS23000010','2023-08-04', '3','그럭저럭 만족한 숙소였어요.','배게에서 살짝 쿰쿰한 냄새가 났어요. 그래서 그거 말고는 다 만족스러웠습니다.');  

commit;
--------------------------------------------------------------------------------------------------
--GROUPBUYING

CREATE SEQUENCE GB_seq INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;
       
    insert into GROUPBUYING (GB_CODE, MEM_ID, GB_TITLE, GB_CONTENT, GB_INVEN, GB_DATE)
    values('JJGB23' || lpad(GB_seq.nextval,4,'0'),'LittleQueka','주상절리 제트보트 같이 타실분~','제트보트 총원이 18명인데, 단체손님은 할인해 준대요~ 지금 5명 남았는데, 생각있으신 분 챗주세요~~','5','2023-08-23');  

    insert into GROUPBUYING (GB_CODE, MEM_ID, GB_TITLE, GB_CONTENT, GB_INVEN, GB_DATE)
    values('JJGB23' || lpad(GB_seq.nextval,4,'0'),'BigQueka','한라산 같이 예약하고 등반해요 !! ','한라산은 처음 등반 해 보는데,, 한라산 등반이 많이 어렵다고 들어서,, 같이 등반하실분,, ㅠㅠ 밥도 같이 먹어용~','2','2023-08-23');  
    
    insert into GROUPBUYING (GB_CODE, MEM_ID, GB_TITLE, GB_CONTENT, GB_INVEN, GB_DATE)
    values('JJGB23' || lpad(GB_seq.nextval,4,'0'),'MiddleQueka','제주도에서 같이 플로깅 할 사람 구해요~','이번에 친구들과 같이 제주도 가서 플로깅 하기로 했는데, 다른 분들도 같이 하면 좋을 거 같아서요 ! 같이 하실 분 채팅 주세용~!! ','5','2023-08-29');  
  
    
-----------------------------------------------------------------------------------------------
--PHOTO
CREATE SEQUENCE PH_seq INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999999999
       NOCYCLE
       NOCACHE
       NOORDER;

--    insert into PHOTO (PT_CODE, PT_TYPE, PT_OFILE, PT_SFILE)
--    values('J' || lpad(PH_seq.nextval,10,'0'),'프로필','오리진사진1.jpg','세이브사진1.jpg');  
--
--    insert into PHOTO (PT_CODE, PT_TYPE, PT_OFILE, PT_SFILE)
--    values('J' || lpad(PH_seq.nextval,10,'0'),'프로필','오리진사진2.jpg','세이브사진2.jpg');  
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
--ATTENDANCE
insert into ATTENDANCE (MEM_ID, ATT_DATE)
values('LittleQueka','23/08/05');  

insert into ATTENDANCE (MEM_ID, ATT_DATE)
values('BigQueka','23/08/05');  

insert into ATTENDANCE (MEM_ID, ATT_DATE)
values('MiddleQueka','23/08/05');  

insert into ATTENDANCE (MEM_ID, ATT_DATE)
values('CutieQueka','23/08/05');  

insert into ATTENDANCE (MEM_ID, ATT_DATE)
values('PrettyQueka','23/08/05');  

insert into ATTENDANCE (MEM_ID, ATT_DATE)
values('LittleQueka',sysdate);  

insert into ATTENDANCE (MEM_ID, ATT_DATE)
values('BigQueka',sysdate);  

insert into ATTENDANCE (MEM_ID, ATT_DATE)
values('MiddleQueka',sysdate);  

insert into ATTENDANCE (MEM_ID, ATT_DATE)
values('CutieQueka',sysdate);  

insert into ATTENDANCE (MEM_ID, ATT_DATE)
values('PrettyQueka',sysdate);  

------------------------------------------------------------------------------------
--GB_PRTCP

   insert into GB_PRTCP (GB_CODE, MEM_ID)
   values('JJGB230001','BigQueka');  

   insert into GB_PRTCP (GB_CODE, MEM_ID)
   values('JJGB230002','LittleQueka');  

----------------------------------------------------------------------------------------
--CHAT_HIS
insert into CHAT_HIS (MEM_ID, CH_CODE, CH_FILENAME)
VALUES('BigQueka','JJGB230001', '채팅1');

insert into CHAT_HIS (MEM_ID, CH_CODE, CH_FILENAME)
VALUES('LittleQueka','JJGB230002', '채팅2');

COMMIT;
--------------------------------------------------------------------------------------
--COUPON
INSERT INTO coupon (CO_CODE, CO_NAME, CO_RATE)
VALUES('CO001', '호텔 할인', 10);

INSERT INTO coupon (CO_CODE, CO_NAME, CO_RATE)
VALUES('CO002', '펜션 할인', 10);

INSERT INTO coupon (CO_CODE, CO_NAME, CO_RATE)
VALUES('CO003', '게스트하우스 할인', 10);

INSERT INTO coupon (CO_CODE, CO_NAME, CO_RATE)
VALUES('CO004', '호텔 할인', 20);

INSERT INTO coupon (CO_CODE, CO_NAME, CO_RATE)
VALUES('CO005', '펜션 할인', 20);

INSERT INTO coupon (CO_CODE, CO_NAME, CO_RATE)
VALUES('CO006', '게스트하우스 할인', 20);

INSERT INTO coupon (CO_CODE, CO_NAME, CO_RATE)
VALUES('CO007', '호텔 할인', 30);

INSERT INTO coupon (CO_CODE, CO_NAME, CO_RATE)
VALUES('CO008', '펜션 할인', 30);

INSERT INTO coupon (CO_CODE, CO_NAME, CO_RATE)
VALUES('CO009', '게스트하우스 할인', 30);

COMMIT;
----------------------------------------------------------------------------------
--CP_HAVING
INSERT INTO CP_HAVING (CO_CODE, MEM_ID, CP_USE)
VALUES('CO001','LittleQueka',0);

INSERT INTO CP_HAVING (CO_CODE, MEM_ID, CP_USE)
VALUES('CO004','LittleQueka',1);

INSERT INTO CP_HAVING (CO_CODE, MEM_ID, CP_USE)
VALUES('CO008','LittleQueka',1);

INSERT INTO CP_HAVING (CO_CODE, MEM_ID, CP_USE)
VALUES('CO002','BigQueka',1);

INSERT INTO CP_HAVING (CO_CODE, MEM_ID, CP_USE)
VALUES('CO009','BigQueka',1);

INSERT INTO CP_HAVING (CO_CODE, MEM_ID, CP_USE)
VALUES('CO005','BigQueka',1);

INSERT INTO CP_HAVING (CO_CODE, MEM_ID, CP_USE)
VALUES('CO001','MiddleQueka',0);

INSERT INTO CP_HAVING (CO_CODE, MEM_ID, CP_USE)
VALUES('CO002','MiddleQueka',0);

INSERT INTO CP_HAVING (CO_CODE, MEM_ID, CP_USE)
VALUES('CO003','MiddleQueka',1);

INSERT INTO CP_HAVING (CO_CODE, MEM_ID, CP_USE)
VALUES('CO001','CutieQueka',0);

INSERT INTO CP_HAVING (CO_CODE, MEM_ID, CP_USE)
VALUES('CO004','CutieQueka',1);

INSERT INTO CP_HAVING (CO_CODE, MEM_ID, CP_USE)
VALUES('CO007','CutieQueka',0);

INSERT INTO CP_HAVING (CO_CODE, MEM_ID, CP_USE)
VALUES('CO006','PrettyQueka',1);

INSERT INTO CP_HAVING (CO_CODE, MEM_ID, CP_USE)
VALUES('CO007','PrettyQueka',1);

INSERT INTO CP_HAVING (CO_CODE, MEM_ID, CP_USE)
VALUES('CO003','PrettyQueka',0);
------------------------------------------------------------------------------------
--HIS_MILEAGE
INSERT INTO HIS_MILEAGE (MIL_CODE, MEM_ID, MIL_DATE, MIL_SAVEHIS, MIL_USEHIS)
VALUES('ML2300001', 'LittleQueka', '2023-08-05', '출석체크', '');

INSERT INTO HIS_MILEAGE (MIL_CODE, MEM_ID, MIL_DATE, MIL_SAVEHIS, MIL_USEHIS)
VALUES('ML2300002', 'BigQueka', '2023-08-05', '출석체크', '');

INSERT INTO HIS_MILEAGE (MIL_CODE, MEM_ID, MIL_DATE, MIL_SAVEHIS, MIL_USEHIS)
VALUES('ML2300003', 'MiddleQueka', '2023-08-05', '출석체크', '');

INSERT INTO HIS_MILEAGE (MIL_CODE, MEM_ID, MIL_DATE, MIL_SAVEHIS, MIL_USEHIS)
VALUES('ML2300004', 'CutieQueka', '2023-08-05', '출석체크', '');

INSERT INTO HIS_MILEAGE (MIL_CODE, MEM_ID, MIL_DATE, MIL_SAVEHIS, MIL_USEHIS)
VALUES('ML2300005', 'PrettyQueka', '2023-08-05', '출석체크', '');
-------------------------------------------------------------------------------------
--SERVICE_INFO
INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV01', '와이파이');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV02', '금연');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV03', '수영장');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV04', '스파');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV05', '피트니스');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV06', '편의점');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV07', '주차장');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV08', '세탁실');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV09', '레스토랑');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV10', '어메니티');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV11', '룸서비스');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV12', '라운지');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV13', '반려견동반');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV14', '카지노');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV15', '커피숍');

COMMIT;
-------------------------------------------------------------------------------------
--SERVICE_LIST
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230001', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230001', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230001', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230001', 'JJSV04');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230001', 'JJSV05');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230001', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230001', 'JJSV09');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230001', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230001', 'JJSV11');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230001', 'JJSV12');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230001', 'JJSV13');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230001', 'JJSV14');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230002', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230002', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230002', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230002', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230002', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230002', 'JJSV09');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230002', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230002', 'JJSV12');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230002', 'JJSV14');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230003', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230003', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230003', 'JJSV04');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230003', 'JJSV05');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230003', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230003', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230003', 'JJSV11');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230003', 'JJSV12');                     --제주시 호텔
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230004', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230004', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230004', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230004', 'JJSV04');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230004', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230004', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230004', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230004', 'JJSV12');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230004', 'JJSV13');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230004', 'JJSV14');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230005', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230005', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230005', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230005', 'JJSV04');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230005', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230005', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230005', 'JJSV09');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230005', 'JJSV11');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230005', 'JJSV12');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230006', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230006', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230006', 'JJSV04');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230006', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230006', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230006', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230006', 'JJSV09');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230006', 'JJSV12');                     --서귀포 호텔
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230007', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230007', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230007', 'JJSV04');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230007', 'JJSV05');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230007', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230007', 'JJSV09');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230007', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230007', 'JJSV11');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230007', 'JJSV12');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230007', 'JJSV13');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230007', 'JJSV14');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230008', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230008', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230008', 'JJSV04');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230008', 'JJSV05');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230008', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230008', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230008', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230008', 'JJSV09');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230008', 'JJSV12');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230008', 'JJSV13');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230008', 'JJSV14');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230009', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230009', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230009', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230009', 'JJSV05');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230009', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230009', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230009', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230009', 'JJSV10');                         --동부 호텔
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230010', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230010', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230010', 'JJSV04');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230010', 'JJSV05');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230010', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230010', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230010', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230010', 'JJSV11');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230010', 'JJSV12');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230010', 'JJSV13');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230010', 'JJSV14');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230011', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230011', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230011', 'JJSV04');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230011', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230011', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230011', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230011', 'JJSV09');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230011', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230011', 'JJSV12');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230012', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230012', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230012', 'JJSV04');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230012', 'JJSV05');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230012', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230012', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230012', 'JJSV09');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230012', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230012', 'JJSV11');                     --서부 호텔     --------------호텔 끝

INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230013', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230013', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230013', 'JJSV04');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230013', 'JJSV05');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230013', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230013', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230013', 'JJSV13');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230014', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230014', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230014', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230014', 'JJSV04');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230014', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230014', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230014', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230014', 'JJSV13');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230015', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230015', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230015', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230015', 'JJSV04');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230015', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230015', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230015', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230015', 'JJSV13');                         --제주시 펜션
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230016', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230016', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230016', 'JJSV04');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230016', 'JJSV05');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230016', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230016', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230016', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230016', 'JJSV13');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230017', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230017', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230017', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230017', 'JJSV04');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230017', 'JJSV05');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230017', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230017', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230017', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230018', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230018', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230018', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230018', 'JJSV04');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230018', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230018', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230018', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230018', 'JJSV13');                         --서귀포시 펜션
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230019', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230019', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230019', 'JJSV04');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230019', 'JJSV05');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230019', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230019', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230019', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230019', 'JJSV13');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230020', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230020', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230020', 'JJSV05');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230020', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230020', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230020', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230020', 'JJSV13');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230021', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230021', 'JJSV04');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230021', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230021', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230021', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230021', 'JJSV13');                     -- 동부 펜션
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230022', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230022', 'JJSV04');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230022', 'JJSV05');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230022', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230022', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230022', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230022', 'JJSV13');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230023', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230023', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230023', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230023', 'JJSV05');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230023', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230023', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230023', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230024', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230024', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230024', 'JJSV04');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230024', 'JJSV05');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230024', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230024', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230024', 'JJSV13');                     --서부 펜션         --------------펜션 끝

INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230025', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230025', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230025', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230025', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230025', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230025', 'JJSV13');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230026', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230026', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230026', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230026', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230026', 'JJSV13');                 --제주시 게스트하우스
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230027', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230027', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230027', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230027', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230027', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230027', 'JJSV13');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230028', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230028', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230028', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230028', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230028', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230028', 'JJSV13');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230029', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230029', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230029', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230029', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230029', 'JJSV13');                     --서귀포시 게스트하우스
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230030', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230030', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230030', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230030', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230030', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230030', 'JJSV13');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230031', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230031', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230031', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230031', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230031', 'JJSV13');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230032', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230032', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230032', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230032', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230032', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230032', 'JJSV10');                         --동부 게스트하우스
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230033', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230033', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230033', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230033', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230033', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230033', 'JJSV13');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230034', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230034', 'JJSV03');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230034', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230034', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230034', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230034', 'JJSV13');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230035', 'JJSV01');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230035', 'JJSV02');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230035', 'JJSV06');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230035', 'JJSV07');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230035', 'JJSV08');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230035', 'JJSV10');
INSERT INTO SERVICE_LIST (A_CODE, SI_CODE)
VALUES('JJAC230035', 'JJSV13');                     --서부 게스트하우스             --게스트하우스 끝

COMMIT;
-----------------------------------------------------------------------------------
--WISHLIST

INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('LittleQueka', 'JJAC230001');
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('LittleQueka', 'JJAC230002');
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('LittleQueka', 'JJAC230012');
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('LittleQueka', 'JJAC230030');
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('LittleQueka', 'JJAC230008');

INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('BigQueka', 'JJAC230003');
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('BigQueka', 'JJAC230005');
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('BigQueka', 'JJAC230009');
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('BigQueka', 'JJAC230015');
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('BigQueka', 'JJAC230025');

INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('MiddleQueka', 'JJAC230003');
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('MiddleQueka', 'JJAC230005');
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('MiddleQueka', 'JJAC230009');
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('MiddleQueka', 'JJAC230015');
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('MiddleQueka', 'JJAC230025');

INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('CutieQueka', 'JJAC230010');
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('CutieQueka', 'JJAC230015');
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('CutieQueka', 'JJAC230012');
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('CutieQueka', 'JJAC230025');
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('CutieQueka', 'JJAC230026');

INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('PrettyQueka', 'JJAC230005');
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('PrettyQueka', 'JJAC230009');
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('PrettyQueka', 'JJAC230024');
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('PrettyQueka', 'JJAC230025');
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES('PrettyQueka', 'JJAC230026');

COMMIT;


       
