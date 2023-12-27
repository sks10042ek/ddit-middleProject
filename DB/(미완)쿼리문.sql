---------------------------------------------------------------------------------
--1.MEMBER
-- 1) �α���  ȸ���������� Ȯ��  ->    id =  checkInfo  
SELECT count(*)
FROM MEMBER
WHERE MEM_ID='LittleQueka' AND MEM_PASS='1234';

-- 2) ���̵�/��й�ȣã��      �̸����Է¹޾� ���̵� ��������  id = findId
SELECT MEM_ID --���̵� ã��
FROM MEMBER
WHERE MEM_EMAIL='little@naver.com';

SELECT count(*) --��й�ȣ ã��  id = findPass
FROM MEMBER
WHERE MEM_ID='LittleQueka' AND MEM_EMAIL='little@naver.com';

UPDATE MEMBER SET MEM_PASS='0000'--��й�ȣ ���� 
WHERE MEM_ID='LittleQueka';

--3) ȸ������   id = joinMember
INSERT INTO MEMBER (MEM_ID, MEM_PASS, MEM_NAME, MEM_EMAIL, MEM_TEL, 
                  MEM_BIRTH, MEM_GENDER, MEM_CODE, MEM_MIL, MEM_PHOTO)
VALUES ('MiddleQueka', '1234', '�ֱ���', 'middle@naver.com', '010-4545-8888',
        '96/10/10', 'Female', 'ȸ��', '1000', NULL);
        
SELECT count(*) --���̵� �ߺ��˻� result�� 1�̻��̸� ���̵� ���� checkDuple
FROM MEMBER
WHERE MEM_ID='MiddleQueka';

-- 4)���������� 
--ȸ�� ���� ��ȸ, �������������� ȸ������ �ڵ����� �־��ִ� �κе� �̰����� ���   id = memberInfo
SELECT MEM_ID, MEM_PASS, MEM_NAME, MEM_EMAIL, MEM_TEL, 
        to_char(MEM_BIRTH, 'yyyy-mm-dd') MEM_BIRTH, MEM_GENDER, MEM_MIL, MEM_PHOTO
FROM MEMBER
WHERE MEM_ID='LittleQueka';

UPDATE MEMBER SET MEM_PASS='5555' --ȸ�� ���� ���� (��: �������) id = memberInfoUpdate
WHERE MEM_ID='LittleQueka';

UPDATE MEMBER SET MEM_PHOTO='LittleQueka�������ī.jpg' -- ������ ���� ���ε�   id = memberPhotoUpload
WHERE MEM_ID='LittleQueka';

SELECT MEM_PHOTO  -- ������ ���� ���� ������  id = memberPhoto
FROM MEMBER
WHERE MEM_ID = 'LittleQueka';

SELECT A.* FROM (SELECT P.PT_CODE  -- �ش� ���� ���� ��ȸ ((MAIN ����))    id =  acMainPhoto
FROM ACCOMMODATION A, PHOTO P
WHERE A.A_CODE='JJAC230001' AND A.A_CODE = P.PT_SFILE
ORDER BY P.PT_CODE) A
WHERE ROWNUM = 1;

SELECT P.PT_CODE  -- �ش� ���� ���� ��ȸ ((������ ����)) // ������ ������--> ���ھ�ü������ ������   id= acMultiplePhoto
FROM ACCOMMODATION A, PHOTO P
WHERE A.A_CODE='JJAC230001' AND A.A_CODE = P.PT_SFILE
ORDER BY P.PT_CODE;

-------------- -- - - - -- - - -- - - -- - - -- - - -------------------
-- photo insert�ϴ� ����
   insert into PHOTO (PT_CODE, PT_TYPE, PT_OFILE, PT_SFILE)                   --  id = photoInsert                       
    values('J' || lpad(PH_seq.nextval,10,'0'),'����','����������1.jpg','JJAC230001');  

    insert into PHOTO (PT_CODE, PT_TYPE, PT_OFILE, PT_SFILE)
    values('J' || lpad(PH_seq.nextval,10,'0'),'����','����������2.jpg','JJAC230001'); 
    
        insert into PHOTO (PT_CODE, PT_TYPE, PT_OFILE, PT_SFILE)
    values('J' || lpad(PH_seq.nextval,10,'0'),'����','����������2.jpg','JJAC230001'); 
    
            insert into PHOTO (PT_CODE, PT_TYPE, PT_OFILE, PT_SFILE)
    values('J' || lpad(PH_seq.nextval,10,'0'),'����','����������2.jpg','JJRM230001'); 
-------------- -- - - - -- - - -- - - -- - - -- - - -------------------
--1) WISHLIST��ȸ�ϱ�
-- ������������ ���� ���� ��ȸ���� ȭ�鿡 ������ ���ھ�ü�� ������ ��ȸ              id= resListCheck
SELECT W.A_CODE, A.A_NAME, MIN(P.PT_SFILE) AS PT_SFILE 
FROM WISHLIST W
JOIN ACCOMMODATION A ON W.A_CODE = A.A_CODE
JOIN PHOTO P ON A.A_CODE = P.PT_SFILE
WHERE W.MEM_ID = 'LittleQueka'
GROUP BY W.A_CODE, A.A_NAME;


--���� ����Ʈ �����ֱ� (üũ�γ�¥, üũ�νð�, �����̸�, ��ġ, ���ڱⰣ, �������)       id =resListCheck
select to_char(r.res_cin,'yyyy-mm-dd') res_cin,ac.a_entime,ac.a_name,ac.a_addr,(r.res_cout-r.res_cin) ACDATE,r.res_status
from reservation r, room rm, accommodation ac
where rm.a_code= ac.a_code and rm.r_code = r.r_code and r.MEM_ID = 'LittleQueka';



--���೻���󼼺���                   id = resDetailCheck
SELECT  A.A_NAME,A.A_ADDR, M.MEM_NAME,M.MEM_TEL, R.RES_CIN,A.A_ENTIME, -- ����,���� ���� ��ȸ
        R.RES_COUT,A.A_EXTIME, R.RES_MEMO,R.RES_STATUS, P.PAY_PRICE, P.PAY_METHOD 
FROM  RESERVATION R, ROOM RM, ACCOMMODATION A, PAYMENT P , MEMBER M
WHERE R.MEM_ID='LittleQueka' AND R.R_CODE = RM.R_CODE AND RM.A_CODE = A.A_CODE 
AND R.RES_CODE=P.RES_CODE AND R.MEM_ID = M.MEM_ID;



 -- ���� ��� ���ѰŸ� ��ȸ
SELECT CP.CO_CODE, C.CO_NAME, C.CO_RATE    --����    id = couponCheck  
FROM CP_HAVING CP, COUPON C
WHERE CP.CO_CODE = C.CO_CODE AND CP.CH_USE=1 AND CP.MEM_ID='BigQueka';

-----------------------------------------------------------------------------------
--2. ACCOMODATION
 -- 1) ����, �ο� ���� ���� ��ü �˻�      id = acSearch
SELECT A.A_CODE, A.A_NAME, A.A_ADDR, A.A_TEL, A.A_WNUM, A.A_ENTIME, A.A_EXTIME, P.PT_SFILE, MIN(P.pt_code) AS MIN_PT_CODE
FROM ACCOMMODATION A
JOIN ROOM R ON A.A_CODE = R.A_CODE
JOIN PHOTO P ON A.A_CODE = P.PT_SFILE
WHERE R.R_INVEN >= 1 AND A.A_ADDR = '��������' AND R.R_MIN >= 1 AND R.R_MAX <= 5
GROUP BY A.A_CODE, A.A_NAME, A.A_ADDR, A.A_TEL, A.A_WNUM, A.A_ENTIME, A.A_EXTIME, P.PT_SFILE;

--*** �����Բ� ���庸��
--SELECT A.A_CODE, A.A_NAME, A.A_ADDR, A.A_TEL, -- 2)������ �߰��ؼ�, ���ͱ��� ������ ���, ���� ��ü �˻�
--        A.A_WNUM, A.A_ENTIME, A.A_EXTIME, P.PT_SFILE
--FROM ACCOMMODATION A, ROOM R, PHOTO P, SERVICE_LIST SL
--WHERE R.R_INVEN >= 1 AND A.A_CODE = R.A_CODE AND A.A_CODE=P.PT_SFILE AND R.A_CODE = P.PT_SFILE
--AND A.A_TYPE='ȣ��' AND A.A_ADDR = '���ֽ�' AND R.R_MIN >= 1 AND R.R_MAX <= 3
--AND SL.A_CODE= A.A_CODE AND SL.SI_CODE='JJSV01';-- SL.SI_CODE='JJSV01' ���Ͱ� �߰��ɶ� ���� �̺κ��� �߰��� �Ǿߵ�




-- ��Ʈ��ư�� ������, �ش� ���ø���Ʈ �������� ������ Ȯ���� �־���Ѵ�.
-- ��> ���ھ�ü�� �������������� ���ø���Ʈ ��ȸ�Ҷ�, ���� ����������Ѵ�.
-- ���� ������ INSERT���־�� �ϰ�, ������ DELETE ���־�� �Ѵ�.

--1) WISHLIST��ȸ�ϱ�       id = wishListCheck
SELECT MEM_ID, A_CODE
FROM WISHLIST
WHERE MEM_ID='LittleQueka' AND A_CODE='JJAC230001';

--1-1) ������ ����
DELETE FROM WISHLIST       -- id = wishListDelete
WHERE MEM_ID='LittleQueka' AND A_CODE='JJAC230001';

--1-2) ������ ���          -- id = wishListInsert
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES ('LittleQueka', 'JJAC230001');
-----------------------------------------------------------------------------------------------------------
--3. ROOM
-- ���� ���� ���            -- id=roomInsert
insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN) 
values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230001','1�ν�','1', '1', '60000', '2');  

insert into PHOTO (PT_CODE, PT_TYPE, PT_OFILE, PT_SFILE)   -- ���� ���� ���
values('J' || lpad(PH_seq.nextval,10,'0'),'����','����������','JJRV230003');  
    
insert into PHOTO (PT_CODE, PT_TYPE, PT_OFILE, PT_SFILE)   
values('J' || lpad(PH_seq.nextval,10,'0'),'����','����������','JJRM230009'); 

-- Ʈ���� ����ؼ� ����, ���� �ϱ� �߰��߰�


-- ��ü ���� ���� ���     id = roomInfoCheck
SELECT R.R_CODE, R.A_CODE, R.R_TYPE, R.R_MIN, R.R_MAX, R.R_PRICE, R.R_INVEN, P.PT_SFILE, P.PT_CODE
FROM ROOM R, PHOTO P
WHERE R.R_CODE = P.PT_SFILE AND R.A_CODE = 'JJAC230001' 
ORDER BY  R.R_CODE,P.PT_CODE;


-- ���� ���� ������ ���    id = roomMainCheck
SELECT R.R_CODE, R.A_CODE, R.R_TYPE, R.R_MIN, R.R_MAX, R.R_PRICE, R.R_INVEN, P.PT_SFILE, P.PT_CODE
FROM ROOM R, PHOTO P
WHERE R.R_CODE = P.PT_SFILE AND R.A_CODE = 'JJAC230001' 
AND P.PT_CODE = (
    SELECT MIN(PT_CODE)
    FROM PHOTO
    WHERE PT_SFILE = R.R_CODE
);

-- ���� �� ������Ʈ --> �������� (�÷��� �����ϸ� ��)     id=roomUpdate
UPDATE ROOM SET R_TYPE='���Ĵٵ�' 
WHERE R_CODE='JJRM230001' AND R_TYPE='����Ʈ';

--SELECT * FROM PHOTO                   --���� �� ������Ʈ --> �������� ���� ����
--WHERE PT_SFILE='JJRM230001';

DELETE FROM ROOM                      --id= roomDelete
WHERE A_CODE='JJAC230009';

--CREATE OR REPLACE TRIGGER TR_PHOTO            --Ʈ���ŷ� ���䵵 ���� ���� �� ������ �����
--BEFORE DELETE ON WIN.ROOM
--FOR EACH ROW 
--    BEGIN
--    IF DELETING THEN
--        DELETE FROM PHOTO

--�ش� ���ھ�ü�� �����ϰ� �ִ� ���� ����Ʈ ��ȸ   id = acServiceListCheck
SELECT SL.SI_CODE, SI.SI_NAME                
FROM SERVICE_INFO SI, SERVICE_LIST SL
WHERE SL.A_CODE = 'JJAC230001' AND SL.SI_CODE=SI.SI_CODE;

--�������̺� ��ȸ                             id = reviewCheck
SELECT R.A_CODE, R.R_CODE, RV.RES_CODE, RV.REV_SCORE, RV.REV_TITLE, RV.REV_CONTENT    
FROM ROOM R, RESERVATION RS, REVIEW RV
WHERE R.R_CODE= RS.R_CODE AND RS.RES_CODE = RV.RES_CODE
AND R.A_CODE='JJAC230001';
----------------------------------------------------------------------------------------------
--REVIEW
insert into REVIEW (REV_CODE, RES_CODE, REV_DATE, REV_SCORE, REV_TITLE, REV_CONTENT)  --���� ��� 1�ܰ�  id=reviewInsert
values('JJRV23' || lpad(REV_seq.nextval,4,'0'),'RS23000005','2023-08-04','4','���������׽�Ʈ','���䳻���׽�Ʈ'); 

insert into PHOTO (PT_CODE, PT_TYPE, PT_OFILE, PT_SFILE)   -- ���� ���� ��� 2�ܰ�  id = id=revPhotoInsert
values('J' || lpad(PH_seq.nextval,10,'0'),'����','����������','JJRV230004'); 

---���� ���� Ȯ�� �� ���ϸ��� ����, 1�̻��̸� ���ϸ��� 1000�� 0�̸� 500��
select count(*)imgecnt from review r, photo p               -- id = photoRevCheck  
where r.rev_code = p.pt_sfile and r.rev_code = 'JJRV230003';

insert into MILEAGE (MIL_CODE, MIL_RESAMOUNT, MIL_USEAMOUNT, MEM_ID)        -- ���俩�� Ȯ���� ���ϸ��� ���� insert    id=mileInsert
values('ML23' || lpad(mil_seq.nextval,5,'0'),'1000','0', 'LittleQueka');  
 
--oracle ���� Ʈ���Ÿ� ���鲨��
--
--mileage���̺��� �÷��� 
--MIL_CODE
--MEM_ID
--MIL_RESAMOUNT
--MIL_USEAMOUNT �̰�
--
--������ 
--member ���̺��� insert�� �߻�������
--mileage ���̺��� MIL_CODE�� �ڵ����� �����ǰ� (������ ��������) 
-- mem_id�� member���̺��� insert�� ���� �����ͼ� mileage ���̺� �ڵ����� �־��ְ�
--MIL_RESAMOUNT���� 1000�� insert����
--
--�׸��� 
--his_milage ���̺��� �ִµ� �÷����� �̷���
--MIL_CODE
--MEM_ID
--MIL_DATE
--MIL_SAVEHIS
--MIL_USEHIS
--milege�� insert�� �߻��ҋ�
--
--�ڵ����� mil_code���� �ش� mileage�� MIL_CODE�� �־��ְ� ���� ������� mem_id�� �־��� �׸��� Mil_date�� sysdate�� �־��ְ�
--Mil_savehis �÷����� 'ȸ������' �� �־���



--- ����� �����ڸ� ������ �����ϴ�

SELECT RV.MEM_ID, R.REV_DATE, R.REV_SCORE, R.REV_TITLE, R.REV_CONTENT, P.PT_code -- ���信 �ش��ϴ� ������ �Բ� ��ȸ   id=reviewCheck
FROM REVIEW R, PHOTO P, RESERVATION RV
WHERE RV.RES_CODE=R.RES_CODE AND R.REV_CODE = P.PT_SFILE AND R.REV_CODE='JJRV230003';

--�̰� ���� ���������� ���� UPDATE�� ���並 �����Ҷ� ���䵵 ���� �����ɼ� �ֵ��� Ʈ���� ���� 
COMMIT;
---------------------------------------------------------------------------------------------------------------------
--BOARD
--�Խ��� ���
INSERT INTO member (mem_id, mem_pass, mem_name, mem_email, mem_tel, mem_birth, mem_gender, mem_code, mem_mil, mem_photo) --id =BoardInsert
VALUES ('MANAGER1', '1234', '������1', '����@naver.com', '010-1234-5678', TO_DATE('2002-12-15', 'YYYY-MM-DD'), 'Female','1', 0, '');

INSERT INTO member (mem_id, mem_pass, mem_name, mem_email, mem_tel, mem_birth, mem_gender, mem_code, mem_mil, mem_photo)
VALUES ('MANAGER2', '1234', '������2', '����@naver.com', '010-1234-5678', TO_DATE('2002-12-15', 'YYYY-MM-DD'), 'Female','1', 0, '');

INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '����', '�׽�Ʈ�����Դϴ�1', '�׽�Ʈ�����Դϴ�1','2023-08-05', 'MANAGER1');

INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '����', '�׽�Ʈ�����Դϴ�2', '�׽�Ʈ�����Դϴ�2','2023-08-05', 'MANAGER2');


--�������� �Խñ� ���   id = noticeCheck
SELECT B.BO_CODE, B.BO_TYPE, B.BO_TITLE, B.BO_CONTENT, B.BO_DATE, M.MEM_CODE 
FROM BOARD B, MEMBER M
WHERE B.MEM_ID=M.MEM_ID AND BO_TYPE = '����';

 --  �������� �Խñ� ����      id= noticeDelete
DELETE FROM BOARD           
WHERE BO_CODE ='JJBO230003';

--���� �� ������Ʈ --> �������� ���� (�÷��� �����ϸ� ��) id=selectNoticeUpdate
UPDATE BOARD SET BO_CONTENT='�׽�Ʈ �����Դϴ�.'          
WHERE BO_CODE='JJBO230004';
----------------------------------------------------------------------------------------------------------------------
--BOARD - ���ǻ���

INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)---- ���ǻ��� ���   id = inquiryInsert
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '1:1����', '�׽�Ʈ�����Դϴ�1', '�׽�Ʈ�����Դϴ�1','2023-08-05', 'LittleQueka');

SELECT B.BO_CODE, B.BO_TYPE, B.BO_TITLE, B.BO_CONTENT, B.BO_DATE, M.MEM_NAME, M.MEM_ID --1:1���� �Խñ� ���   id = inquiryCheck
FROM BOARD B, MEMBER M
WHERE B.MEM_ID=M.MEM_ID AND BO_TYPE = '1:1����';

UPDATE BOARD SET BO_CONTENT='�׽�Ʈ �����Դϴ�.(����)'      --���� �� ������Ʈ --> ���ǻ��� ���� (�÷��� �����ϸ� ��)      id = inquiryUpdate
WHERE BO_CODE='JJBO230002' AND BO_TYPE = '1:1����';

DELETE FROM BOARD                                   --  ���ǻ��� �Խñ� ����   id = inquiryDelete
WHERE BO_CODE ='JJBO230003' AND BO_TYPE = '1:1����';

--��� ���
INSERT INTO COMENT (CO_CODE, BO_CODE, CO_CONTENT)           --��� ���  id = commentInsert
VALUES ('JJCO23' || LPAD(COM_SEQ.NEXTVAL,4,'0'), 'JJBO230005', '��۴��');

 --�Խ��ѿ� �ش��ϴ� ��� ��ȸ   id = commentCheck
SELECT CO_CODE, BO_CODE, CO_CONTENT    
FROM COMENT 
WHERE BO_CODE = 'JJBO230005';
--------------------------------------------------------------------------------------------------------
--EVENT


INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)---- �̺�Ʈ ��� id=eventInsert
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '�̺�Ʈ', '�׽�Ʈ�����Դϴ�1', '�׽�Ʈ�����Դϴ�1','2023-08-05', 'MANAGER1');

SELECT B.BO_CODE, B.BO_TYPE, B.BO_TITLE, B.BO_CONTENT, B.BO_DATE, M.MEM_NAME, M.MEM_ID --�̺�Ʈ �Խñ� ���    id = eventCheck
FROM BOARD B, MEMBER M
WHERE B.MEM_ID=M.MEM_ID AND BO_TYPE = '�̺�Ʈ';

UPDATE BOARD SET BO_CONTENT='�׽�Ʈ �����Դϴ�.(����)'      --���� �� ������Ʈ --> �̺�Ʈ ���� (�÷��� �����ϸ� ��)     id = eventUpdate
WHERE BO_CODE='JJBO230006' AND BO_TYPE = '�̺�Ʈ';

DELETE FROM BOARD                                   --  ���ǻ��� �Խñ� ����      id= eventDelete
WHERE BO_CODE ='JJBO230006' AND BO_TYPE = '�̺�Ʈ';
----------------------------------------------------------------------------------------------------------------------
--ATTENDANCE
INSERT INTO ATTENDANCE(MEM_ID, ATT_DATE)        --�⼮üũ �Է� ����      id = attInsert
VALUES('LittleQueka', sysdate);

SELECT MEM_ID, ATT_DATE                         --�⼮üũ �⼮���θ� �˼��ְ� ���̵� �ش��ϴ� ��� �⼮ �����͸� ��ȸ���� id= attCheck 
FROM ATTENDANCE
WHERE MEM_ID='LittleQueka' ;
---------------------------------------------------------------------------------------------------------------
--COUPON
--���� ���
INSERT INTO CP_HAVING (CO_CODE, MEM_ID, CH_USE)    --id = couponInsert  
VALUES('CO001', 'MiddleQueka', '1');
-----------------------------------------------------------------------------------------------------
--MILEEAGE
---------------------------------------------------------------------------------------------------------------
--BOARD ��������

--�������� ���                   id = gbInsert
insert into GROUPBUYING (GB_CODE, MEM_ID, GB_TITLE, GB_CONTENT, GB_INVEN, GB_DATE)
values('JJGB23' || lpad(GB_seq.nextval,4,'0'),'LittleQueka','���������׽�Ʈ1','���������׽�Ʈ1','5','2023-08-05');  

--�������� ��ȸ                   id = gbCheck
SELECT GB.GB_CODE, GB.MEM_ID, GB.GB_TITLE, GB.GB_CONTENT, GB.GB_INVEN, GB.GB_DATE, M.MEM_NAME --�������� �Խñ� ���
FROM GROUPBUYING GB, MEMBER M
WHERE GB.MEM_ID=M.MEM_ID; 
--�������� ����                   id = gbUpdate
UPDATE GROUPBUYING SET GB_CONTENT='�׽�Ʈ �����Դϴ�.(����)'      --���� �� ������Ʈ --> �������� ���� (�÷��� �����ϸ� ��)      
WHERE GB_CODE='JJGB230002';
--�������� ����                   id = gbDelete
DELETE FROM GROUPBUYING                                   --  ���ǻ��� �Խñ� ����
WHERE GB_CODE='JJGB230002';

--�������� �ۿ��� ����Ǵ� 1:1 ä�ÿ��� ���� �ҷ�����       id= gbChatHis
select MEM_ID, CH_CODE, CH_FILENAME from CHAT_HIS where CH_CODE='JJGB230003'; 

-- �������� �ش�ۿ��� ��ũ Ÿ�� ���� �̺�Ʈ �߻��� �������� 1:1 ä�� insert��  id = gbChatInsert
insert into chat_his values('BigQueka','JJGB230003','��������ä�ó�������');
-- ��������ä�ù濡�� ä�ù� ������ �������� �ش�Ǵ� delete��    id = gbchatDelete
delete from chat_his 
where ch_code = 'JJGB230003' and mem_id ='BigQueka';

---------------------------------------------------------------------------------------------------------------------
-- BOARD �絵����
--- �絵���� ���     id = hoMarketInsert 

INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '�絵����', '�׽�Ʈ�����Դϴ�', '�׽�Ʈ�����Դϴ�','2023-08-05', 'MiddleQueka');

--�絵���� �Խñ� ��� id = hoMarketCheck
SELECT B.BO_CODE, B.BO_TYPE, B.BO_TITLE, B.BO_CONTENT, B.BO_DATE, M.MEM_NAME, M.MEM_ID 
FROM BOARD B, MEMBER M
WHERE B.MEM_ID=M.MEM_ID AND BO_TYPE = '�絵����';
----���� �� ������Ʈ --> �絵���� ���� (�÷��� �����ϸ� ��) id = hoMarketUpdate
UPDATE BOARD SET BO_CONTENT='�׽�Ʈ �����Դϴ�.(����)'            
WHERE BO_CODE='JJBO230010' AND BO_TYPE = '�絵����';
----  �絵���� �Խñ� ���� id = hoMarketDelete
DELETE FROM BOARD                                   
WHERE BO_CODE ='JJBO230010' AND BO_TYPE = '�絵����';

-- ��� ���
INSERT INTO COMENT (CO_CODE, BO_CODE, CO_CONTENT)           --��� ���  �̰� ���� �Խ��ǿ� ����ϴ°� ����  �Ȱ����� ��
VALUES ('JJCO23' || LPAD(COM_SEQ.NEXTVAL,4,'0'), 'JJBO230011', '�絵����Ӵ�');

SELECT CO_CODE, BO_CODE, CO_CONTENT     --��� ��ȸ  �̰͵� ���� �Խ��ǿ� ����ϴ°� ���� �Ȱ����� ��
FROM COMENT 
WHERE BO_CODE = 'JJBO230011';

--�絵���� �ۿ��� ����Ǵ� 1:1 ä�ÿ��� ���� �ҷ�����   �̰͵� ���� �������� ä���̶� �Ȱ����Ž�
select MEM_ID, CH_CODE, CH_FILENAME from CHAT_HIS where CH_CODE='JJBO230011'; 

-- �絵���� �ش�ۿ��� ��ũ Ÿ�� ���� �̺�Ʈ �߻��� �絵���� 1:1 ä�� insert��       �̰͵� ���� �������� ä���̶� �Ȱ����Ž�
insert into chat_his values('LittleQueka','JJBO230011','�絵����ä�ó�������');

-- �絵����ä�ù濡�� ä�ù� ������ �������� �ش�Ǵ� delete��     �̰͵� ���� �������� ä���̶� �Ȱ����Ž�
delete from chat_his 
where ch_code = 'JJBO230011' and mem_id ='LittleQueka';
commit;
-----------------------------------------------------------------------------------------------------------------------------
-- reservation

--�����ϱ��ư�� ������ �������̺� insert         id= resInsert
insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS)
values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230002','LittleQueka', '2023-08-03', '2023-08-04', '�ٴٰ����̴� �������� ���ּ���.', '����Ϸ�');  


--ȯ���ϱ⸦ ������ �ڵ����� insert�Ǿ����     id = refundInsert
insert into REFUND (RF_CODE, PAY_NO, RF_DATE)
values('RF23' || lpad(REF_seq.nextval,6,'0'),'PY23000001',sysdate);  

update reservation set res_status = '�������' where res_code ='RS23000002';




--���� �ΰ��� �������� ���� ������ ���ӽ� �ٷ� �ҷ��ͼ� list�������� �ѷ�����Ѵ�.

--�ش� �������� �������� �ҷ�����[cp_user�� 1�ΰ͸� ��밡��]    id = cphCheck
select cp.co_code 
from member m , cp_having cp 
where m.mem_id = cp.mem_id and m.mem_id = 'MiddleQueka' and cp.cp_use='1';

--�ش� �������� ���� ���ϸ��� �ҷ�����                     id= memPosMileage
select mem_mil 
from member 
where mem_id ='BigQueka';
------------------------------------------------------------------------

--���� ��ư �������� ������ ���ϸ����� �����Ǵ� ����       

--�̰� �Ⱦ��� �ؿ��� �Ἥ �׳� ��������� update�� �ٲ��־� ����Ѱ��� 0���� ó���Ѵ�.
--DELETE FROM member                
--WHERE (SELECT co_code FROM cp_having where ch_use='1') In 'CO001';



--���� ��ư�� �������� �������������̺��� �ش� ���̵��� �ش� �����ڵ� �� ��ȸ�Ͽ�
-- ch_use�� 1�� ch_use�� ��뿩�θ� 0���� �ٲ۴�.        id = memCpdelete 
update cp_having 
set ch_use ='0' 
where ch_use ='1' and mem_id='BigQueka' and co_code='CO001';
