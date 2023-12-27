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



CREATE UNIQUE INDEX XPK���ھ�ü ON ACCOMMODATION
(A_CODE   ASC);



ALTER TABLE ACCOMMODATION
	ADD CONSTRAINT  XPK���ھ�ü PRIMARY KEY (A_CODE);



CREATE TABLE ATTENDANCE
(
	MEM_ID               VARCHAR2(30) NOT NULL ,
	ATT_DATE             DATE NOT NULL 
);



CREATE UNIQUE INDEX XPK�⼮_üũ ON ATTENDANCE
(MEM_ID   ASC,ATT_DATE   ASC);



ALTER TABLE ATTENDANCE
	ADD CONSTRAINT  XPK�⼮_üũ PRIMARY KEY (MEM_ID,ATT_DATE);



CREATE TABLE BOARD
(
	BO_CODE              VARCHAR2(10) NOT NULL ,
	BO_TYPE              VARCHAR2(20) NOT NULL ,
	BO_TITLE             VARCHAR2(100) NOT NULL ,
	BO_CONTENT           CLOB NOT NULL ,
	BO_DATE              DATE NOT NULL ,
	MEM_ID               VARCHAR2(30) NOT NULL 
);



CREATE UNIQUE INDEX XPK�Խ��� ON BOARD
(BO_CODE   ASC);



ALTER TABLE BOARD
	ADD CONSTRAINT  XPK�Խ��� PRIMARY KEY (BO_CODE);



CREATE TABLE CHAT_HIS
(
	MEM_ID               VARCHAR2(30) NOT NULL ,
	ä��_��              VARCHAR2(10) NOT NULL ,
	CH_FILENAME          VARCHAR2(300) NOT NULL 
);



CREATE UNIQUE INDEX XPKä���̷� ON CHAT_HIS
(MEM_ID   ASC,ä��_��   ASC);



ALTER TABLE CHAT_HIS
	ADD CONSTRAINT  XPKä���̷� PRIMARY KEY (MEM_ID,ä��_��);



CREATE TABLE COMENT
(
	CO_CODE              VARCHAR2(10) NOT NULL ,
	BO_CODE              VARCHAR2(10) NOT NULL ,
	CO_CONTENT           CLOB NOT NULL 
);



CREATE UNIQUE INDEX XPK��� ON COMENT
(CO_CODE   ASC);



ALTER TABLE COMENT
	ADD CONSTRAINT  XPK��� PRIMARY KEY (CO_CODE);



CREATE TABLE COUPON
(
	CO_CODE              VARCHAR2(10) NOT NULL ,
	CO_NAME              VARCHAR2(30) NOT NULL ,
	CO_RATE              NUMBER(2) NOT NULL 
);



CREATE UNIQUE INDEX XPK���� ON COUPON
(CO_CODE   ASC);



ALTER TABLE COUPON
	ADD CONSTRAINT  XPK���� PRIMARY KEY (CO_CODE);



CREATE TABLE CP_HAVING
(
	CO_CODE              VARCHAR2(10) NOT NULL ,
	MEM_ID               VARCHAR2(30) NOT NULL ,
	CP_USE               NUMBER NOT NULL ,
	CP_DATE              date NOT NULL 
);



CREATE UNIQUE INDEX XPK����_������ ON CP_HAVING
(CO_CODE   ASC,MEM_ID   ASC);



ALTER TABLE CP_HAVING
	ADD CONSTRAINT  XPK����_������ PRIMARY KEY (CO_CODE,MEM_ID);



CREATE TABLE GB_PRTCP
(
	GB_CODE              VARCHAR2(10) NOT NULL ,
	MEM_ID               VARCHAR2(30) NOT NULL 
);



CREATE UNIQUE INDEX XPK��������_������ ON GB_PRTCP
(GB_CODE   ASC,MEM_ID   ASC);



ALTER TABLE GB_PRTCP
	ADD CONSTRAINT  XPK��������_������ PRIMARY KEY (GB_CODE,MEM_ID);



CREATE TABLE GROUPBUYING
(
	GB_CODE              VARCHAR2(10) NOT NULL ,
	MEM_ID               VARCHAR2(30) NOT NULL ,
	GB_TITLE             VARCHAR2(100) NOT NULL ,
	GB_CONTENT           CLOB NOT NULL ,
	GB_INVEN             NUMBER(2) NOT NULL ,
	GB_DATE              DATE NOT NULL 
);



CREATE UNIQUE INDEX XPK�������� ON GROUPBUYING
(GB_CODE   ASC);



ALTER TABLE GROUPBUYING
	ADD CONSTRAINT  XPK�������� PRIMARY KEY (GB_CODE);



CREATE TABLE HIS_MILEAGE
(
	MIL_CODE             VARCHAR2(10) NOT NULL ,
	MEM_ID               VARCHAR2(30) NOT NULL ,
	MIL_DATE             DATE NOT NULL ,
	MIL_SAVEHIS          VARCHAR2(50) NULL ,
	MIL_USEHIS           VARCHAR2(50) NULL 
);



CREATE UNIQUE INDEX XPK���ϸ������� ON HIS_MILEAGE
(MIL_CODE   ASC,MEM_ID   ASC);



ALTER TABLE HIS_MILEAGE
	ADD CONSTRAINT  XPK���ϸ������� PRIMARY KEY (MIL_CODE,MEM_ID);



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



CREATE UNIQUE INDEX XPKȸ�� ON MEMBER
(MEM_ID   ASC);



ALTER TABLE MEMBER
	ADD CONSTRAINT  XPKȸ�� PRIMARY KEY (MEM_ID);



CREATE TABLE MILEAGE
(
	MIL_CODE             VARCHAR2(10) NOT NULL ,
	MEM_ID               VARCHAR2(30) NOT NULL ,
	MIL_RESAMOUNT        NUMBER NULL ,
	MIL_USEAMOUNT        NUMBER NULL 
);



CREATE UNIQUE INDEX XPK���ϸ��� ON MILEAGE
(MIL_CODE   ASC,MEM_ID   ASC);



ALTER TABLE MILEAGE
	ADD CONSTRAINT  XPK���ϸ��� PRIMARY KEY (MIL_CODE,MEM_ID);



CREATE TABLE PAYMENT
(
	PAY_NO               VARCHAR2(20) NOT NULL ,
	RES_CODE             VARCHAR2(10) NOT NULL ,
	PAY_DATE             DATE NOT NULL ,
	PAY_PRICE            NUMBER(10) NOT NULL ,
	PAY_METHOD           VARCHAR2(20) NOT NULL 
);



CREATE UNIQUE INDEX XPK���� ON PAYMENT
(PAY_NO   ASC);



ALTER TABLE PAYMENT
	ADD CONSTRAINT  XPK���� PRIMARY KEY (PAY_NO);



CREATE TABLE PHOTO
(
	PT_CODE              VARCHAR2(15) NOT NULL ,
	PT_OFILE             VARCHAR2(300) NOT NULL ,
	PT_SFILE             VARCHAR2(300) NOT NULL ,
	PT_TYPE              VARCHAR2(30) NOT NULL ,
	PT_PACODE            VARCHAR2(20) NULL 
);



CREATE UNIQUE INDEX XPK���� ON PHOTO
(PT_CODE   ASC);



ALTER TABLE PHOTO
	ADD CONSTRAINT  XPK���� PRIMARY KEY (PT_CODE);



CREATE TABLE REFUND
(
	RF_CODE              VARCHAR2(10) NOT NULL ,
	PAY_NO               VARCHAR2(20) NOT NULL ,
	RF_DATE              DATE NOT NULL 
);



CREATE UNIQUE INDEX XPKȯ�� ON REFUND
(RF_CODE   ASC);



ALTER TABLE REFUND
	ADD CONSTRAINT  XPKȯ�� PRIMARY KEY (RF_CODE);



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



CREATE UNIQUE INDEX XPK���� ON RESERVATION
(RES_CODE   ASC);



ALTER TABLE RESERVATION
	ADD CONSTRAINT  XPK���� PRIMARY KEY (RES_CODE);



CREATE TABLE REVIEW
(
	REV_CODE             VARCHAR2(10) NOT NULL ,
	RES_CODE             VARCHAR2(10) NOT NULL ,
	REV_DATE             DATE NOT NULL ,
	REV_SCORE            NUMBER(1) NOT NULL ,
	REV_TITLE            CLOB NOT NULL ,
	REV_CONTENT          CLOB NOT NULL 
);



CREATE UNIQUE INDEX XPK���� ON REVIEW
(REV_CODE   ASC);



ALTER TABLE REVIEW
	ADD CONSTRAINT  XPK���� PRIMARY KEY (REV_CODE);



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



CREATE UNIQUE INDEX XPK���� ON ROOM
(R_CODE   ASC);



ALTER TABLE ROOM
	ADD CONSTRAINT  XPK���� PRIMARY KEY (R_CODE);



CREATE TABLE SERVICE_INFO
(
	SI_CODE              VARCHAR2(10) NOT NULL ,
	SI_NAME              VARCHAR2(20) NOT NULL 
);



CREATE UNIQUE INDEX XPK���ڼ��񽺻� ON SERVICE_INFO
(SI_CODE   ASC);



ALTER TABLE SERVICE_INFO
	ADD CONSTRAINT  XPK���ڼ��񽺻� PRIMARY KEY (SI_CODE);



CREATE TABLE SERVICE_LIST
(
	A_CODE               VARCHAR2(10) NOT NULL ,
	SI_CODE              VARCHAR2(10) NOT NULL 
);



CREATE UNIQUE INDEX XPK���ڼ��� ON SERVICE_LIST
(A_CODE   ASC,SI_CODE   ASC);



ALTER TABLE SERVICE_LIST
	ADD CONSTRAINT  XPK���ڼ��� PRIMARY KEY (A_CODE,SI_CODE);



CREATE TABLE WISHLIST
(
	MEM_ID               VARCHAR2(30) NOT NULL ,
	A_CODE               VARCHAR2(10) NOT NULL 
);



CREATE UNIQUE INDEX XPK���ø���Ʈ ON WISHLIST
(MEM_ID   ASC,A_CODE   ASC);



ALTER TABLE WISHLIST
	ADD CONSTRAINT  XPK���ø���Ʈ PRIMARY KEY (MEM_ID,A_CODE);



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
VALUES ('LittleQueka', '1234', '������', 'little@naver.com', '010-1234-5678', TO_DATE('2000-12-15', 'YYYY-MM-DD'), 'Female','ȸ��', 1000, '');

INSERT INTO member (mem_id, mem_pass, mem_name, mem_email, mem_tel, mem_birth, mem_gender, mem_code, mem_mil, mem_photo)
VALUES ('BigQueka', '1234', '������', 'big@naver.com', '010-9101-1213', TO_DATE('2000-12-16', 'YYYY-MM-DD'), 'Male','ȸ��', 1000, '');

INSERT INTO member (mem_id, mem_pass, mem_name, mem_email, mem_tel, mem_birth, mem_gender, mem_code, mem_mil, mem_photo)
VALUES ('MiddleQueka', '1234', '�ֱ���', 'middle@naver.com', '010-1415-1617', TO_DATE('2000-12-17', 'YYYY-MM-DD'), 'Male','ȸ��', 1000, '');

INSERT INTO member (mem_id, mem_pass, mem_name, mem_email, mem_tel, mem_birth, mem_gender, mem_code, mem_mil, mem_photo)
VALUES ('CutieQueka', '1234', '�ż���', 'cutie@naver.com', '010-1819-2021', TO_DATE('2000-12-18', 'YYYY-MM-DD'), 'Female','ȸ��', 1000, '');

INSERT INTO member (mem_id, mem_pass, mem_name, mem_email, mem_tel, mem_birth, mem_gender, mem_code, mem_mil, mem_photo)
VALUES ('PrettyQueka', '1234', 'Ȳ����', 'pretty@naver.com', '010-2223-2425', TO_DATE('2000-12-19', 'YYYY-MM-DD'), 'Female','ȸ��', 1000, '');

INSERT INTO member (mem_id, mem_pass, mem_name, mem_email, mem_tel, mem_birth, mem_gender, mem_code, mem_mil, mem_photo)
VALUES ('Admin1', '1234', '������1', 'admin1@naver.com', '010-2627-2829', TO_DATE('2000-12-20', 'YYYY-MM-DD'), 'male','������', 1000, '');

INSERT INTO member (mem_id, mem_pass, mem_name, mem_email, mem_tel, mem_birth, mem_gender, mem_code, mem_mil, mem_photo)
VALUES ('Admin2', '1234', '������2', 'admin2@naver.com', '010-3031-3233', TO_DATE('2000-12-21', 'YYYY-MM-DD'), 'Female','������', 1000, '');

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
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '1:1����', '������ ����ϰ� �;��.', '���� ������ ���Ҹ� ����ϰ� ������, ��� �ؾ��ұ��?','2023-08-05', 'LittleQueka');

INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '1:1����', '���̵�� ��й�ȣ�� �ؾ����.', 'ȸ�� ������ ���̵�� ��й�ȣ�� �ؾ����.','2023-08-05', 'BigQueka');

INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '��������', '[��ǥ] 7�� 4�� ���־ �����ϱ� �̺�Ʈ', '??????????�ȳ��ϼ���. ���� ��Դϴ�.
7�� 4�� ���� � �����ϱ� �̺�Ʈ ��÷�ڸ� ��ǥ�մϴ�. ��÷�� : Bi****ka','2023-08-05', 'Admin1');

INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '��������', '[��ǥ] 8�� 1�� ���־ �����ϱ� �̺�Ʈ', '�ȳ��ϼ���. ���� ��Դϴ�.
7�� 4�� ���� � �����ϱ� �̺�Ʈ ��÷�ڸ� ��ǥ�մϴ�. ��÷�� : Mi*****ka','2023-08-05', 'Admin2');

INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '�絵����', '�׷��� �Ͼ�Ʈ ���� 8�� 23��~24��(1��2��) �絵�ؿ�.', '���� �������� ����, �絵 �� ����� ã���ϴ�.','2023-08-22', 'LittleQueka');

INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '�絵����', 'ȣ�� ��ī����ũ ���� 1ȣ�� 8�� 23��~24��(1��2��) �絵�ؿ�', '���� �������� �� ���� ������. �絵 ������ �� ��� ��Ź�����.','2023-08-22', 'BigQueka');

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
VALUES ('JJCO23' || LPAD(COM_SEQ.NEXTVAL,4,'0'), 'JJBO230001', '������Ҵ�  Ȩ������ > ���������� > ���೻������ ���� �����մϴ�. �����մϴ�.');

INSERT INTO COMENT (CO_CODE, BO_CODE, CO_CONTENT)
VALUES ('JJCO23' || LPAD(COM_SEQ.NEXTVAL,4,'0'), 'JJBO230002', 'ȸ�� ���� ������ Ȩ������ > ���������� > �� ���� �������� ȸ�������� ������ �� �ֽ��ϴ�. �����մϴ�.');


-- �絵���� ���   ==>> �ǹ� ? ��� �� ����� ���̵�� ������ �ʴµ�, ��� �� �ش� ���̵� ã�Ƽ� ��ũ�� �ٱ�?

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
   values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'�׷��� �Ͼ�Ʈ ����','���ֽ�','010-4455-9999' ,0,'1500','1100','ȣ��');  
   
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'ȣ�� ��ī����ũ ���� 1ȣ��','���ֽ�','010-2525-6464' ,0,'1500','1100','ȣ��');  
   
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���� �۷��� ����','���ֽ�','010-1155-2626' ,0,'1500','1100','ȣ��');  

  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'����� ȣ��','��������','010-2222-5555' ,0,'1500','1100','ȣ��');  

  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'ȣ�� �����丮','��������','010-8877-4949' ,0,'1500','1100','ȣ��'); 
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'�Ž�ȣ�� ���ֿ���','��������','010-5252-6666' ,0,'1500','1100','ȣ��'); 
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'��ž������ȣ�� �����Դ�','����','010-4455-8888' ,0,'1500','1100','ȣ��'); 

  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���ߵ��� ȣ��','����','010-5522-7788' ,0,'1500','1100','ȣ��'); 
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'�ҳ뺧 ����','����','010-7878-4455' ,0,'1500','1100','ȣ��');
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���ο����Ƴ� ȣ��','����','010-4455-8856' ,0,'1500','1100','ȣ��'); 

  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���ڱ׸�����Ʈ','����','010-6585-4544' ,0,'1500','1100','ȣ��'); 
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���� �������̼��߸� ȣ��','����','010-0012-4545' ,0,'1500','1100','ȣ��');
  
  -----------------ȣ��
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���� �����Ͽ콺 ���','���ֽ�','010-8856-9595' ,0,'1600','1100','���'); 
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'��� ��������','���ֽ�','010-7878-9515' ,0,'1600','1100','���');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���� �ֿ��縮��','���ֽ�','010-6622-2454' ,0,'1600','1100','���');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���� ������ �볪�����','��������','010-2232-5656' ,0,'1600','1100','���');  
    
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'������ ��������� ���','��������','010-8585-8877' ,0,'1600','1100','���');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'������ ���ֿ÷���','��������','010-2232-5656' ,0,'1600','1100','���');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���� ƾ��Ÿ��','����','010-1515-9292' ,0,'1600','1100','���');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���� �����ϵ� Ǯ����','����','010-1515-9292' ,0,'1600','1100','���');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'�쵵 �ϾἺ ���','����','010-5544-8872' ,0,'1600','1100','���'); 
  
    insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���� �ٴٱ׸� ���','����','010-4445-8885' ,0,'1600','1100','���');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���� �ٸ�ä ��üǮ����','����','010-6565-9514' ,0,'1600','1100','���');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���� �ֿ��ٴ�������','����','010-2585-3369' ,0,'1600','1100','���'); 
  
  ---------------���
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���� ���� ȣ����','���ֽ�','010-1111-4444' ,0,'1500','1000','����');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���� ����Խ�Ʈ�Ͽ콺','���ֽ�','010-2222-8844' ,0,'1500','1000','����');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'����ǳ��','��������','010-2525-7575' ,0,'1500','1000','����');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'����HY ���� ȣ����','��������','010-2525-3321' ,0,'1500','1000','����');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���� ���س��μ� ���� �ѿ�','��������','010-5555-3354' ,0,'1500','1000','����');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���� �Ͷ� �Խ�Ʈ�Ͽ콺','����','010-7788-5555' ,0,'1500','1000','����');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'�Ѹ��� ����','����','010-8858-4444' ,0,'1500','1000','����');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���� �Ͽ��Ͽ�','����','010-0223-6625' ,0,'1500','1000','����');  
  
    insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���� ���� �Խ�Ʈ�Ͽ콺','����','010-1122-4475' ,0,'1500','1000','����');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���� 6758','����','010-8899-4444' ,0,'1500','1000','����');  
  
  insert into accommodation (a_code, a_name, a_addr, a_tel, a_wnum, a_entime, a_extime, a_type)         
  values('JJAC23' || lpad(acc_seq.nextval,4,'0'),'���� �ѿ�������','����','010-4456-5568' ,0,'1500','1000','����');  
  
  
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

                                --�̺κ� �÷� ���� RESAMOUNT�� �ƴϰ�.. ��.. GETAMOUNT�̷��� �ؾߵǴ°� �ƴѰ�? ����~
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
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230001','���Ĵٵ�','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230001','���۸���','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230001','�𷰽�','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230001','����Ʈ','2', '3', '550000', '5');  
    
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230002','���Ĵٵ�','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230002','���۸���','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230002','�𷰽�','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230002','����Ʈ','2', '3', '550000', '5');  
    
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230003','���Ĵٵ�','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230003','���۸���','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230003','�𷰽�','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230003','����Ʈ','2', '3', '550000', '5');  
    
            insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230004','���Ĵٵ�','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230004','���۸���','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230004','�𷰽�','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230004','����Ʈ','2', '3', '550000', '5');  
    
            insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230005','���Ĵٵ�','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230005','���۸���','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230005','�𷰽�','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230005','����Ʈ','2', '3', '550000', '5');  
    
            insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230006','���Ĵٵ�','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230006','���۸���','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230006','�𷰽�','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230006','����Ʈ','2', '3', '550000', '5');  
    
            insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230007','���Ĵٵ�','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230007','���۸���','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230007','�𷰽�','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230007','����Ʈ','2', '3', '550000', '5');  
    
            insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230008','���Ĵٵ�','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230008','���۸���','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230008','�𷰽�','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230008','����Ʈ','2', '3', '550000', '5'); 
    
            insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230009','���Ĵٵ�','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230009','���۸���','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230009','�𷰽�','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230009','����Ʈ','2', '3', '550000', '5');  
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230009','���Ĵٵ�','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230009','���۸���','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230009','�𷰽�','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230009','����Ʈ','2', '3', '550000', '5'); 
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230010','���Ĵٵ�','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230010','���۸���','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230010','�𷰽�','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230010','����Ʈ','2', '3', '550000', '5'); 
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230011','���Ĵٵ�','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230011','���۸���','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230011','�𷰽�','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230011','����Ʈ','2', '3', '550000', '5'); 
    
       insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230012','���Ĵٵ�','1', '2', '250000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230012','���۸���','1', '2', '350000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230012','�𷰽�','2', '3', '450000', '5');  
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230012','����Ʈ','2', '3', '550000', '5'); 
    
    -----ȣ��
    
    insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230013','AŸ��','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230013','BŸ��','3', '5', '95000', '5'); 
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230014','AŸ��','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230014','BŸ��','3', '5', '95000', '5'); 
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230015','AŸ��','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230015','BŸ��','3', '5', '95000', '5'); 
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230016','AŸ��','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230016','BŸ��','3', '5', '95000', '5'); 
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230017','AŸ��','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230017','BŸ��','3', '5', '95000', '5'); 
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230018','AŸ��','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230018','BŸ��','3', '5', '95000', '5'); 
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230019','AŸ��','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230019','BŸ��','3', '5', '95000', '5'); 
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230020','AŸ��','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230020','BŸ��','3', '5', '95000', '5');
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230021','AŸ��','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230021','BŸ��','3', '5', '95000', '5');
    
         insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230022','AŸ��','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230022','BŸ��','3', '5', '95000', '5');
    
         insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230023','AŸ��','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230023','BŸ��','3', '5', '95000', '5');
    
         insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230024','AŸ��','2', '4', '75000', '5'); 
        insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230024','BŸ��','3', '5', '95000', '5');

    -----------���
    
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230025','4�ν�(����)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230025','4�ν�(����)','3', '4', '35000', '5');
    
         insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230026','4�ν�(����)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230026','4�ν�(����)','3', '4', '35000', '5');


     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230027','4�ν�(����)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230027','4�ν�(����)','3', '4', '35000', '5');


     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230028','4�ν�(����)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230028','4�ν�(����)','3', '4', '35000', '5');


     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230029','4�ν�(����)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230029','4�ν�(����)','3', '4', '35000', '5');


     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230030','4�ν�(����)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230030','4�ν�(����)','3', '4', '35000', '5');


     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230031','4�ν�(����)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230031','4�ν�(����)','3', '4', '35000', '5');


     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230032','4�ν�(����)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230032','4�ν�(����)','3', '4', '35000', '5');
    
         insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230033','4�ν�(����)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230033','4�ν�(����)','3', '4', '35000', '5');
    
         insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230034','4�ν�(����)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230034','4�ν�(����)','3', '4', '35000', '5');
    
         insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230035','4�ν�(����)','3', '4', '35000', '5'); 
     insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN)
    values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230035','4�ν�(����)','3', '4', '35000', '5');

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
    values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230001','LittleQueka', '2023-08-01', '2023-08-03', 'ȯ�Ⱑ �ߵǴ� ������ ��Ź�ؿ�.', '�̿�Ϸ�');     
       
    insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS) 
    values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230001','LittleQueka', '2023-08-23', '2023-08-24', 'ȯ�Ⱑ �ߵǴ� ������ ��Ź�ؿ�.', '����Ϸ�');  
    
    insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS)
    values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230008','BigQueka', '2023-08-01', '2023-08-03', '��ǳ�� �ߵǴ� ������ ��Ź�ؿ�.', '����Ϸ�'); 
      
    insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS)
    values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230008','BigQueka', '2023-08-23', '2023-08-24', '��ǳ�� �ߵǴ� ������ ��Ź�ؿ�.', '����Ϸ�');  
    
    insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS)
    values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230011','MiddleQueka', '2023-08-01', '2023-08-03', '���Ǻ� �����̾����� ���ھ��.', '����Ϸ�'); 
    
    insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS)
    values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230011','MiddleQueka', '2023-08-28', '2023-08-30', '���Ǻ� �����̾����� ���ھ��.', '����Ϸ�');  
    
    insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS)
    values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230015','CutieQueka', '2023-08-01', '2023-08-03', '����ƾ�� �����̾����� ���ھ��.', '����Ϸ�'); 
    
    insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS)
    values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230015','CutieQueka', '2023-08-27', '2023-08-30', '����ƾ�� �����̾����� ���ھ��.', '����Ϸ�');  
    
    insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS)
    values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230033','PrettyQueka', '2023-08-01', '2023-08-03', '�ò����� ���� ������ ��Ź�ؿ�', '����Ϸ�');  
    
    insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS)
    values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230033','PrettyQueka', '2023-08-29', '2023-08-30', '�ò����� ���� ������ ��Ź�ؿ�', '����Ϸ�');  


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
    values('PY23' || lpad(pay_seq.nextval,6,'0'),'RS23000001','2023-07-31','250000', '�佺');  

    insert into payment (PAY_NO, RES_CODE, PAY_DATE, PAY_PRICE, PAY_METHOD)
    values('PY23' || lpad(pay_seq.nextval,6,'0'),'RS23000002','2023-07-31','550000', '�佺');  
    
    insert into payment (PAY_NO, RES_CODE, PAY_DATE, PAY_PRICE, PAY_METHOD)
    values('PY23' || lpad(pay_seq.nextval,6,'0'),'RS23000003','2023-08-11','450000', '�佺');  
    
    insert into payment (PAY_NO, RES_CODE, PAY_DATE, PAY_PRICE, PAY_METHOD)
    values('PY23' || lpad(pay_seq.nextval,6,'0'),'RS23000004','2023-07-21','450000', '�佺');  
    
        insert into payment (PAY_NO, RES_CODE, PAY_DATE, PAY_PRICE, PAY_METHOD)
    values('PY23' || lpad(pay_seq.nextval,6,'0'),'RS23000005','2023-07-18','250000', '�佺');  
    
        insert into payment (PAY_NO, RES_CODE, PAY_DATE, PAY_PRICE, PAY_METHOD)
    values('PY23' || lpad(pay_seq.nextval,6,'0'),'RS23000006','2023-07-22','250000', '�佺');
    
        insert into payment (PAY_NO, RES_CODE, PAY_DATE, PAY_PRICE, PAY_METHOD)
    values('PY23' || lpad(pay_seq.nextval,6,'0'),'RS23000007','2023-07-15','550000', '�佺');
    
        insert into payment (PAY_NO, RES_CODE, PAY_DATE, PAY_PRICE, PAY_METHOD)
    values('PY23' || lpad(pay_seq.nextval,6,'0'),'RS23000008','2023-07-14','450000', '�佺');
    
        insert into payment (PAY_NO, RES_CODE, PAY_DATE, PAY_PRICE, PAY_METHOD)
    values('PY23' || lpad(pay_seq.nextval,6,'0'),'RS23000009','2023-07-13','450000', '�佺');
    
        insert into payment (PAY_NO, RES_CODE, PAY_DATE, PAY_PRICE, PAY_METHOD)
    values('PY23' || lpad(pay_seq.nextval,6,'0'),'RS23000010','2023-07-11','250000', '�佺');
    
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
    values('JJRV23' || lpad(REV_seq.nextval,4,'0'),'RS23000006','2023-08-04','4','�䰡 �ʹ� ���ƿ� !','���Ұ� �ʹ� �����ϰ�, ��û���׵� �� ����ּż� �����մϴ�. ������ �� ��������.');  

    insert into REVIEW (REV_CODE, RES_CODE, REV_DATE, REV_SCORE, REV_TITLE, REV_CONTENT)
    values('JJRV23' || lpad(REV_seq.nextval,4,'0'),'RS23000007','2023-08-08', '5','���������� �ູ�� �Ϸ�..','��ġ�� �� �����. ���񽺵� �� �Ǹ��մϴ�. ������ �� �ðԿ�.'); 
        
    insert into REVIEW (REV_CODE, RES_CODE, REV_DATE, REV_SCORE, REV_TITLE, REV_CONTENT)
    values('JJRV23' || lpad(REV_seq.nextval,4,'0'),'RS23000008','2023-08-03', '5','���ֵ� ������� �����~','���ֵ� ó�� ����Դµ�, ���Ұ� ���� ������ ������. �����մϴ�.');  
        
    insert into REVIEW (REV_CODE, RES_CODE, REV_DATE, REV_SCORE, REV_TITLE, REV_CONTENT)
    values('JJRV23' || lpad(REV_seq.nextval,4,'0'),'RS23000009','2023-08-09', '5','��ó�� �� ���� ���Ƽ� ���ƿ�.','���� �������� �Դµ�, �ʹ� �����ϰ� ���ϴ�~');  
        
    insert into REVIEW (REV_CODE, RES_CODE, REV_DATE, REV_SCORE, REV_TITLE, REV_CONTENT)
    values('JJRV23' || lpad(REV_seq.nextval,4,'0'),'RS23000010','2023-08-04', '3','�׷����� ������ ���ҿ����.','��Կ��� ��¦ ������ ������ �����. �׷��� �װ� ����� �� �������������ϴ�.');  

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
    values('JJGB23' || lpad(GB_seq.nextval,4,'0'),'LittleQueka','�ֻ����� ��Ʈ��Ʈ ���� Ÿ�Ǻ�~','��Ʈ��Ʈ �ѿ��� 18���ε�, ��ü�մ��� ������ �ش��~ ���� 5�� ���Ҵµ�, ���������� �� ê�ּ���~~','5','2023-08-23');  

    insert into GROUPBUYING (GB_CODE, MEM_ID, GB_TITLE, GB_CONTENT, GB_INVEN, GB_DATE)
    values('JJGB23' || lpad(GB_seq.nextval,4,'0'),'BigQueka','�Ѷ�� ���� �����ϰ� ����ؿ� !! ','�Ѷ���� ó�� ��� �� ���µ�,, �Ѷ�� ����� ���� ��ƴٰ� ��,, ���� ����ϽǺ�,, �Ф� �䵵 ���� �Ծ��~','2','2023-08-23');  
    
    insert into GROUPBUYING (GB_CODE, MEM_ID, GB_TITLE, GB_CONTENT, GB_INVEN, GB_DATE)
    values('JJGB23' || lpad(GB_seq.nextval,4,'0'),'MiddleQueka','���ֵ����� ���� �÷α� �� ��� ���ؿ�~','�̹��� ģ����� ���� ���ֵ� ���� �÷α� �ϱ�� �ߴµ�, �ٸ� �е鵵 ���� �ϸ� ���� �� ���Ƽ��� ! ���� �Ͻ� �� ä�� �ּ���~!! ','5','2023-08-29');  
  
    
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
--    values('J' || lpad(PH_seq.nextval,10,'0'),'������','����������1.jpg','���̺����1.jpg');  
--
--    insert into PHOTO (PT_CODE, PT_TYPE, PT_OFILE, PT_SFILE)
--    values('J' || lpad(PH_seq.nextval,10,'0'),'������','����������2.jpg','���̺����2.jpg');  
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
VALUES('BigQueka','JJGB230001', 'ä��1');

insert into CHAT_HIS (MEM_ID, CH_CODE, CH_FILENAME)
VALUES('LittleQueka','JJGB230002', 'ä��2');

COMMIT;
--------------------------------------------------------------------------------------
--COUPON
INSERT INTO coupon (CO_CODE, CO_NAME, CO_RATE)
VALUES('CO001', 'ȣ�� ����', 10);

INSERT INTO coupon (CO_CODE, CO_NAME, CO_RATE)
VALUES('CO002', '��� ����', 10);

INSERT INTO coupon (CO_CODE, CO_NAME, CO_RATE)
VALUES('CO003', '�Խ�Ʈ�Ͽ콺 ����', 10);

INSERT INTO coupon (CO_CODE, CO_NAME, CO_RATE)
VALUES('CO004', 'ȣ�� ����', 20);

INSERT INTO coupon (CO_CODE, CO_NAME, CO_RATE)
VALUES('CO005', '��� ����', 20);

INSERT INTO coupon (CO_CODE, CO_NAME, CO_RATE)
VALUES('CO006', '�Խ�Ʈ�Ͽ콺 ����', 20);

INSERT INTO coupon (CO_CODE, CO_NAME, CO_RATE)
VALUES('CO007', 'ȣ�� ����', 30);

INSERT INTO coupon (CO_CODE, CO_NAME, CO_RATE)
VALUES('CO008', '��� ����', 30);

INSERT INTO coupon (CO_CODE, CO_NAME, CO_RATE)
VALUES('CO009', '�Խ�Ʈ�Ͽ콺 ����', 30);

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
VALUES('ML2300001', 'LittleQueka', '2023-08-05', '�⼮üũ', '');

INSERT INTO HIS_MILEAGE (MIL_CODE, MEM_ID, MIL_DATE, MIL_SAVEHIS, MIL_USEHIS)
VALUES('ML2300002', 'BigQueka', '2023-08-05', '�⼮üũ', '');

INSERT INTO HIS_MILEAGE (MIL_CODE, MEM_ID, MIL_DATE, MIL_SAVEHIS, MIL_USEHIS)
VALUES('ML2300003', 'MiddleQueka', '2023-08-05', '�⼮üũ', '');

INSERT INTO HIS_MILEAGE (MIL_CODE, MEM_ID, MIL_DATE, MIL_SAVEHIS, MIL_USEHIS)
VALUES('ML2300004', 'CutieQueka', '2023-08-05', '�⼮üũ', '');

INSERT INTO HIS_MILEAGE (MIL_CODE, MEM_ID, MIL_DATE, MIL_SAVEHIS, MIL_USEHIS)
VALUES('ML2300005', 'PrettyQueka', '2023-08-05', '�⼮üũ', '');
-------------------------------------------------------------------------------------
--SERVICE_INFO
INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV01', '��������');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV02', '�ݿ�');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV03', '������');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV04', '����');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV05', '��Ʈ�Ͻ�');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV06', '������');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV07', '������');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV08', '��Ź��');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV09', '�������');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV10', '��޴�Ƽ');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV11', '�뼭��');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV12', '�����');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV13', '�ݷ��ߵ���');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV14', 'ī����');

INSERT INTO SERVICE_INFO (SI_CODE, SI_NAME)
VALUES('JJSV15', 'Ŀ�Ǽ�');

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
VALUES('JJAC230003', 'JJSV12');                     --���ֽ� ȣ��
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
VALUES('JJAC230006', 'JJSV12');                     --������ ȣ��
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
VALUES('JJAC230009', 'JJSV10');                         --���� ȣ��
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
VALUES('JJAC230012', 'JJSV11');                     --���� ȣ��     --------------ȣ�� ��

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
VALUES('JJAC230015', 'JJSV13');                         --���ֽ� ���
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
VALUES('JJAC230018', 'JJSV13');                         --�������� ���
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
VALUES('JJAC230021', 'JJSV13');                     -- ���� ���
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
VALUES('JJAC230024', 'JJSV13');                     --���� ���         --------------��� ��

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
VALUES('JJAC230026', 'JJSV13');                 --���ֽ� �Խ�Ʈ�Ͽ콺
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
VALUES('JJAC230029', 'JJSV13');                     --�������� �Խ�Ʈ�Ͽ콺
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
VALUES('JJAC230032', 'JJSV10');                         --���� �Խ�Ʈ�Ͽ콺
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
VALUES('JJAC230035', 'JJSV13');                     --���� �Խ�Ʈ�Ͽ콺             --�Խ�Ʈ�Ͽ콺 ��

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


       
