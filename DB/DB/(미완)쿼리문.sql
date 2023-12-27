---------------------------------------------------------------------------------
--1.MEMBER
-- 1) 로그인  회원정보유무 확인  ->    id =  checkInfo  
SELECT count(*)
FROM MEMBER
WHERE MEM_ID='LittleQueka' AND MEM_PASS='1234';

-- 2) 아이디/비밀번호찾기      이메일입력받아 아이디 가져오기  id = findId
SELECT MEM_ID --아이디 찾기
FROM MEMBER
WHERE MEM_EMAIL='little@naver.com';

SELECT count(*) --비밀번호 찾기  id = findPass
FROM MEMBER
WHERE MEM_ID='LittleQueka' AND MEM_EMAIL='little@naver.com';

UPDATE MEMBER SET MEM_PASS='0000'--비밀번호 변경 
WHERE MEM_ID='LittleQueka';

--3) 회원가입   id = joinMember
INSERT INTO MEMBER (MEM_ID, MEM_PASS, MEM_NAME, MEM_EMAIL, MEM_TEL, 
                  MEM_BIRTH, MEM_GENDER, MEM_CODE, MEM_MIL, MEM_PHOTO)
VALUES ('MiddleQueka', '1234', '최광식', 'middle@naver.com', '010-4545-8888',
        '96/10/10', 'Female', '회원', '1000', NULL);
        
SELECT count(*) --아이디 중복검사 result값 1이상이면 아이디 있음 checkDuple
FROM MEMBER
WHERE MEM_ID='MiddleQueka';

-- 4)마이페이지 
--회원 정보 조회, 예약페이지에서 회원정보 자동으로 넣어주는 부분도 이것으로 사용   id = memberInfo
SELECT MEM_ID, MEM_PASS, MEM_NAME, MEM_EMAIL, MEM_TEL, 
        to_char(MEM_BIRTH, 'yyyy-mm-dd') MEM_BIRTH, MEM_GENDER, MEM_MIL, MEM_PHOTO
FROM MEMBER
WHERE MEM_ID='LittleQueka';

UPDATE MEMBER SET MEM_PASS='5555' --회원 정보 수정 (예: 비번수정) id = memberInfoUpdate
WHERE MEM_ID='LittleQueka';

UPDATE MEMBER SET MEM_PHOTO='LittleQueka사랑해쿼카.jpg' -- 프로필 사진 업로드   id = memberPhotoUpload
WHERE MEM_ID='LittleQueka';

SELECT MEM_PHOTO  -- 프로필 사진 정보 가져옴  id = memberPhoto
FROM MEMBER
WHERE MEM_ID = 'LittleQueka';

SELECT A.* FROM (SELECT P.PT_CODE  -- 해당 숙소 사진 조회 ((MAIN 사진))    id =  acMainPhoto
FROM ACCOMMODATION A, PHOTO P
WHERE A.A_CODE='JJAC230001' AND A.A_CODE = P.PT_SFILE
ORDER BY P.PT_CODE) A
WHERE ROWNUM = 1;

SELECT P.PT_CODE  -- 해당 숙소 사진 조회 ((나머지 사진)) // 사진이 여러장--> 숙박업체사진이 여러장   id= acMultiplePhoto
FROM ACCOMMODATION A, PHOTO P
WHERE A.A_CODE='JJAC230001' AND A.A_CODE = P.PT_SFILE
ORDER BY P.PT_CODE;

-------------- -- - - - -- - - -- - - -- - - -- - - -------------------
-- photo insert하는 쿼리
   insert into PHOTO (PT_CODE, PT_TYPE, PT_OFILE, PT_SFILE)                   --  id = photoInsert                       
    values('J' || lpad(PH_seq.nextval,10,'0'),'숙소','오리진사진1.jpg','JJAC230001');  

    insert into PHOTO (PT_CODE, PT_TYPE, PT_OFILE, PT_SFILE)
    values('J' || lpad(PH_seq.nextval,10,'0'),'숙소','오리진사진2.jpg','JJAC230001'); 
    
        insert into PHOTO (PT_CODE, PT_TYPE, PT_OFILE, PT_SFILE)
    values('J' || lpad(PH_seq.nextval,10,'0'),'숙소','오리진사진2.jpg','JJAC230001'); 
    
            insert into PHOTO (PT_CODE, PT_TYPE, PT_OFILE, PT_SFILE)
    values('J' || lpad(PH_seq.nextval,10,'0'),'객실','오리진사진2.jpg','JJRM230001'); 
-------------- -- - - - -- - - -- - - -- - - -- - - -------------------
--1) WISHLIST조회하기
-- 마이페이지의 예약 내역 조회에서 화면에 보여줄 숙박업체와 사진명 조회              id= resListCheck
SELECT W.A_CODE, A.A_NAME, MIN(P.PT_SFILE) AS PT_SFILE 
FROM WISHLIST W
JOIN ACCOMMODATION A ON W.A_CODE = A.A_CODE
JOIN PHOTO P ON A.A_CODE = P.PT_SFILE
WHERE W.MEM_ID = 'LittleQueka'
GROUP BY W.A_CODE, A.A_NAME;


--예약 리스트 보여주기 (체크인날짜, 체크인시간, 숙소이름, 위치, 숙박기간, 예약상태)       id =resListCheck
select to_char(r.res_cin,'yyyy-mm-dd') res_cin,ac.a_entime,ac.a_name,ac.a_addr,(r.res_cout-r.res_cin) ACDATE,r.res_status
from reservation r, room rm, accommodation ac
where rm.a_code= ac.a_code and rm.r_code = r.r_code and r.MEM_ID = 'LittleQueka';



--예약내역상세보기                   id = resDetailCheck
SELECT  A.A_NAME,A.A_ADDR, M.MEM_NAME,M.MEM_TEL, R.RES_CIN,A.A_ENTIME, -- 예약,결제 정보 조회
        R.RES_COUT,A.A_EXTIME, R.RES_MEMO,R.RES_STATUS, P.PAY_PRICE, P.PAY_METHOD 
FROM  RESERVATION R, ROOM RM, ACCOMMODATION A, PAYMENT P , MEMBER M
WHERE R.MEM_ID='LittleQueka' AND R.R_CODE = RM.R_CODE AND RM.A_CODE = A.A_CODE 
AND R.RES_CODE=P.RES_CODE AND R.MEM_ID = M.MEM_ID;



 -- 쿠폰 사용 안한거만 조회
SELECT CP.CO_CODE, C.CO_NAME, C.CO_RATE    --쿠폰    id = couponCheck  
FROM CP_HAVING CP, COUPON C
WHERE CP.CO_CODE = C.CO_CODE AND CP.CH_USE=1 AND CP.MEM_ID='BigQueka';

-----------------------------------------------------------------------------------
--2. ACCOMODATION
 -- 1) 지역, 인원 따른 숙박 업체 검색      id = acSearch
SELECT A.A_CODE, A.A_NAME, A.A_ADDR, A.A_TEL, A.A_WNUM, A.A_ENTIME, A.A_EXTIME, P.PT_SFILE, MIN(P.pt_code) AS MIN_PT_CODE
FROM ACCOMMODATION A
JOIN ROOM R ON A.A_CODE = R.A_CODE
JOIN PHOTO P ON A.A_CODE = P.PT_SFILE
WHERE R.R_INVEN >= 1 AND A.A_ADDR = '서귀포시' AND R.R_MIN >= 1 AND R.R_MAX <= 5
GROUP BY A.A_CODE, A.A_NAME, A.A_ADDR, A.A_TEL, A.A_WNUM, A.A_ENTIME, A.A_EXTIME, P.PT_SFILE;

--*** 선생님께 여쭤보기
--SELECT A.A_CODE, A.A_NAME, A.A_ADDR, A.A_TEL, -- 2)위에거 추가해서, 필터까지 제약준 결과, 숙박 업체 검색
--        A.A_WNUM, A.A_ENTIME, A.A_EXTIME, P.PT_SFILE
--FROM ACCOMMODATION A, ROOM R, PHOTO P, SERVICE_LIST SL
--WHERE R.R_INVEN >= 1 AND A.A_CODE = R.A_CODE AND A.A_CODE=P.PT_SFILE AND R.A_CODE = P.PT_SFILE
--AND A.A_TYPE='호텔' AND A.A_ADDR = '제주시' AND R.R_MIN >= 1 AND R.R_MAX <= 3
--AND SL.A_CODE= A.A_CODE AND SL.SI_CODE='JJSV01';-- SL.SI_CODE='JJSV01' 필터가 추가될때 마다 이부분이 추가가 되야됨




-- 하트버튼을 누를때, 해당 위시리스트 데이터의 유무를 확인해 주어야한다.
-- ㄴ> 숙박업체랑 마이페이지에서 위시리스트 조회할때, 먼저 선행해줘야한다.
-- 만약 없으면 INSERT해주어야 하고, 있으면 DELETE 해주어야 한다.

--1) WISHLIST조회하기       id = wishListCheck
SELECT MEM_ID, A_CODE
FROM WISHLIST
WHERE MEM_ID='LittleQueka' AND A_CODE='JJAC230001';

--1-1) 있으면 삭제
DELETE FROM WISHLIST       -- id = wishListDelete
WHERE MEM_ID='LittleQueka' AND A_CODE='JJAC230001';

--1-2) 없으면 등록          -- id = wishListInsert
INSERT INTO WISHLIST (MEM_ID, A_CODE)
VALUES ('LittleQueka', 'JJAC230001');
-----------------------------------------------------------------------------------------------------------
--3. ROOM
-- 객실 정보 등록            -- id=roomInsert
insert into ROOM (R_CODE, A_CODE, R_TYPE, R_MIN, R_MAX, R_PRICE, R_INVEN) 
values('JJRM23' || lpad(rom_seq.nextval,4,'0'),'JJAC230001','1인실','1', '1', '60000', '2');  

insert into PHOTO (PT_CODE, PT_TYPE, PT_OFILE, PT_SFILE)   -- 객실 포토 등록
values('J' || lpad(PH_seq.nextval,10,'0'),'리뷰','오리진사진','JJRV230003');  
    
insert into PHOTO (PT_CODE, PT_TYPE, PT_OFILE, PT_SFILE)   
values('J' || lpad(PH_seq.nextval,10,'0'),'객실','오리진사진','JJRM230009'); 

-- 트리거 사용해서 생성, 삭제 하기 추가추가


-- 전체 객실 정보 출력     id = roomInfoCheck
SELECT R.R_CODE, R.A_CODE, R.R_TYPE, R.R_MIN, R.R_MAX, R.R_PRICE, R.R_INVEN, P.PT_SFILE, P.PT_CODE
FROM ROOM R, PHOTO P
WHERE R.R_CODE = P.PT_SFILE AND R.A_CODE = 'JJAC230001' 
ORDER BY  R.R_CODE,P.PT_CODE;


-- 메인 객실 사진만 출력    id = roomMainCheck
SELECT R.R_CODE, R.A_CODE, R.R_TYPE, R.R_MIN, R.R_MAX, R.R_PRICE, R.R_INVEN, P.PT_SFILE, P.PT_CODE
FROM ROOM R, PHOTO P
WHERE R.R_CODE = P.PT_SFILE AND R.A_CODE = 'JJAC230001' 
AND P.PT_CODE = (
    SELECT MIN(PT_CODE)
    FROM PHOTO
    WHERE PT_SFILE = R.R_CODE
);

-- 선택 값 업데이트 --> 객실정보 (컬럼만 변경하면 됨)     id=roomUpdate
UPDATE ROOM SET R_TYPE='스탠다드' 
WHERE R_CODE='JJRM230001' AND R_TYPE='스위트';

--SELECT * FROM PHOTO                   --선택 값 업데이트 --> 사진정보 선택 변경
--WHERE PT_SFILE='JJRM230001';

DELETE FROM ROOM                      --id= roomDelete
WHERE A_CODE='JJAC230009';

--CREATE OR REPLACE TRIGGER TR_PHOTO            --트리거로 포토도 같이 지울 수 있으면 지우기
--BEFORE DELETE ON WIN.ROOM
--FOR EACH ROW 
--    BEGIN
--    IF DELETING THEN
--        DELETE FROM PHOTO

--해당 숙박업체가 포함하고 있는 서비스 리스트 조회   id = acServiceListCheck
SELECT SL.SI_CODE, SI.SI_NAME                
FROM SERVICE_INFO SI, SERVICE_LIST SL
WHERE SL.A_CODE = 'JJAC230001' AND SL.SI_CODE=SI.SI_CODE;

--리뷰테이블 조회                             id = reviewCheck
SELECT R.A_CODE, R.R_CODE, RV.RES_CODE, RV.REV_SCORE, RV.REV_TITLE, RV.REV_CONTENT    
FROM ROOM R, RESERVATION RS, REVIEW RV
WHERE R.R_CODE= RS.R_CODE AND RS.RES_CODE = RV.RES_CODE
AND R.A_CODE='JJAC230001';
----------------------------------------------------------------------------------------------
--REVIEW
insert into REVIEW (REV_CODE, RES_CODE, REV_DATE, REV_SCORE, REV_TITLE, REV_CONTENT)  --리뷰 등록 1단계  id=reviewInsert
values('JJRV23' || lpad(REV_seq.nextval,4,'0'),'RS23000005','2023-08-04','4','리뷰제목테스트','리뷰내용테스트'); 

insert into PHOTO (PT_CODE, PT_TYPE, PT_OFILE, PT_SFILE)   -- 리뷰 포토 등록 2단계  id = id=revPhotoInsert
values('J' || lpad(PH_seq.nextval,10,'0'),'리뷰','오리진사진','JJRV230004'); 

---포토 여부 확인 후 마일리지 지급, 1이상이면 마일리지 1000원 0이면 500원
select count(*)imgecnt from review r, photo p               -- id = photoRevCheck  
where r.rev_code = p.pt_sfile and r.rev_code = 'JJRV230003';

insert into MILEAGE (MIL_CODE, MIL_RESAMOUNT, MIL_USEAMOUNT, MEM_ID)        -- 포토여부 확인후 마일리지 지급 insert    id=mileInsert
values('ML23' || lpad(mil_seq.nextval,5,'0'),'1000','0', 'LittleQueka');  
 
--oracle 에서 트리거를 만들꺼야
--
--mileage테이블의 컬럼은 
--MIL_CODE
--MEM_ID
--MIL_RESAMOUNT
--MIL_USEAMOUNT 이고
--
--조건은 
--member 테이블에서 insert가 발생했을때
--mileage 테이블의 MIL_CODE가 자동으로 생성되고 (시퀀스 만들어놨음) 
-- mem_id는 member테이블의 insert된 값을 가져와서 mileage 테이블에 자동으로 넣어주고
--MIL_RESAMOUNT값에 1000을 insert해줘
--
--그리고 
--his_milage 테이블이 있는데 컬럼명은 이렇고
--MIL_CODE
--MEM_ID
--MIL_DATE
--MIL_SAVEHIS
--MIL_USEHIS
--milege에 insert가 발생할떄
--
--자동으로 mil_code값은 해당 mileage의 MIL_CODE를 넣어주고 같은 방식으로 mem_id도 넣어줘 그리고 Mil_date는 sysdate를 넣어주고
--Mil_savehis 컬럼에는 '회원가입' 을 넣어줘



--- 리뷰는 관리자만 삭제가 가능하다

SELECT RV.MEM_ID, R.REV_DATE, R.REV_SCORE, R.REV_TITLE, R.REV_CONTENT, P.PT_code -- 리뷰에 해당하는 사진과 함께 조회   id=reviewCheck
FROM REVIEW R, PHOTO P, RESERVATION RV
WHERE RV.RES_CODE=R.RES_CODE AND R.REV_CODE = P.PT_SFILE AND R.REV_CODE='JJRV230003';

--이것 또한 마찬가지로 선택 UPDATE와 리뷰를 삭제할때 포토도 같이 삭제될수 있도록 트리것 생성 
COMMIT;
---------------------------------------------------------------------------------------------------------------------
--BOARD
--게시판 등록
INSERT INTO member (mem_id, mem_pass, mem_name, mem_email, mem_tel, mem_birth, mem_gender, mem_code, mem_mil, mem_photo) --id =BoardInsert
VALUES ('MANAGER1', '1234', '관리자1', 'ㅇㅇ@naver.com', '010-1234-5678', TO_DATE('2002-12-15', 'YYYY-MM-DD'), 'Female','1', 0, '');

INSERT INTO member (mem_id, mem_pass, mem_name, mem_email, mem_tel, mem_birth, mem_gender, mem_code, mem_mil, mem_photo)
VALUES ('MANAGER2', '1234', '관리자2', 'ㄱㄱ@naver.com', '010-1234-5678', TO_DATE('2002-12-15', 'YYYY-MM-DD'), 'Female','1', 0, '');

INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '공지', '테스트제목입니다1', '테스트내용입니다1','2023-08-05', 'MANAGER1');

INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '공지', '테스트제목입니다2', '테스트내용입니다2','2023-08-05', 'MANAGER2');


--공지사항 게시글 출력   id = noticeCheck
SELECT B.BO_CODE, B.BO_TYPE, B.BO_TITLE, B.BO_CONTENT, B.BO_DATE, M.MEM_CODE 
FROM BOARD B, MEMBER M
WHERE B.MEM_ID=M.MEM_ID AND BO_TYPE = '공지';

 --  공지사항 게시글 삭제      id= noticeDelete
DELETE FROM BOARD           
WHERE BO_CODE ='JJBO230003';

--선택 값 업데이트 --> 공지사항 정보 (컬럼만 변경하면 됨) id=selectNoticeUpdate
UPDATE BOARD SET BO_CONTENT='테스트 내용입니다.'          
WHERE BO_CODE='JJBO230004';
----------------------------------------------------------------------------------------------------------------------
--BOARD - 문의사항

INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)---- 문의사항 등록   id = inquiryInsert
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '1:1문의', '테스트제목입니다1', '테스트내용입니다1','2023-08-05', 'LittleQueka');

SELECT B.BO_CODE, B.BO_TYPE, B.BO_TITLE, B.BO_CONTENT, B.BO_DATE, M.MEM_NAME, M.MEM_ID --1:1문의 게시글 출력   id = inquiryCheck
FROM BOARD B, MEMBER M
WHERE B.MEM_ID=M.MEM_ID AND BO_TYPE = '1:1문의';

UPDATE BOARD SET BO_CONTENT='테스트 내용입니다.(수정)'      --선택 값 업데이트 --> 문의사항 정보 (컬럼만 변경하면 됨)      id = inquiryUpdate
WHERE BO_CODE='JJBO230002' AND BO_TYPE = '1:1문의';

DELETE FROM BOARD                                   --  문의사항 게시글 삭제   id = inquiryDelete
WHERE BO_CODE ='JJBO230003' AND BO_TYPE = '1:1문의';

--댓글 등록
INSERT INTO COMENT (CO_CODE, BO_CODE, CO_CONTENT)           --댓글 등록  id = commentInsert
VALUES ('JJCO23' || LPAD(COM_SEQ.NEXTVAL,4,'0'), 'JJBO230005', '댓글댓글');

 --게시한에 해당하는 댓글 조회   id = commentCheck
SELECT CO_CODE, BO_CODE, CO_CONTENT    
FROM COMENT 
WHERE BO_CODE = 'JJBO230005';
--------------------------------------------------------------------------------------------------------
--EVENT


INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)---- 이벤트 등록 id=eventInsert
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '이벤트', '테스트제목입니다1', '테스트내용입니다1','2023-08-05', 'MANAGER1');

SELECT B.BO_CODE, B.BO_TYPE, B.BO_TITLE, B.BO_CONTENT, B.BO_DATE, M.MEM_NAME, M.MEM_ID --이벤트 게시글 출력    id = eventCheck
FROM BOARD B, MEMBER M
WHERE B.MEM_ID=M.MEM_ID AND BO_TYPE = '이벤트';

UPDATE BOARD SET BO_CONTENT='테스트 내용입니다.(수정)'      --선택 값 업데이트 --> 이벤트 정보 (컬럼만 변경하면 됨)     id = eventUpdate
WHERE BO_CODE='JJBO230006' AND BO_TYPE = '이벤트';

DELETE FROM BOARD                                   --  문의사항 게시글 삭제      id= eventDelete
WHERE BO_CODE ='JJBO230006' AND BO_TYPE = '이벤트';
----------------------------------------------------------------------------------------------------------------------
--ATTENDANCE
INSERT INTO ATTENDANCE(MEM_ID, ATT_DATE)        --출석체크 입력 쿼리      id = attInsert
VALUES('LittleQueka', sysdate);

SELECT MEM_ID, ATT_DATE                         --출석체크 출석여부를 알수있게 아이디에 해당하는 모든 출석 데이터를 조회해줌 id= attCheck 
FROM ATTENDANCE
WHERE MEM_ID='LittleQueka' ;
---------------------------------------------------------------------------------------------------------------
--COUPON
--쿠폰 등록
INSERT INTO CP_HAVING (CO_CODE, MEM_ID, CH_USE)    --id = couponInsert  
VALUES('CO001', 'MiddleQueka', '1');
-----------------------------------------------------------------------------------------------------
--MILEEAGE
---------------------------------------------------------------------------------------------------------------
--BOARD 공동구매

--공동구매 등록                   id = gbInsert
insert into GROUPBUYING (GB_CODE, MEM_ID, GB_TITLE, GB_CONTENT, GB_INVEN, GB_DATE)
values('JJGB23' || lpad(GB_seq.nextval,4,'0'),'LittleQueka','공구제목테스트1','공구내용테스트1','5','2023-08-05');  

--공동구매 조회                   id = gbCheck
SELECT GB.GB_CODE, GB.MEM_ID, GB.GB_TITLE, GB.GB_CONTENT, GB.GB_INVEN, GB.GB_DATE, M.MEM_NAME --공동구매 게시글 출력
FROM GROUPBUYING GB, MEMBER M
WHERE GB.MEM_ID=M.MEM_ID; 
--공동구매 수정                   id = gbUpdate
UPDATE GROUPBUYING SET GB_CONTENT='테스트 내용입니다.(수정)'      --선택 값 업데이트 --> 공동구매 정보 (컬럼만 변경하면 됨)      
WHERE GB_CODE='JJGB230002';
--공동구매 삭제                   id = gbDelete
DELETE FROM GROUPBUYING                                   --  문의사항 게시글 삭제
WHERE GB_CODE='JJGB230002';

--공동구매 글에서 진행되는 1:1 채팅에는 내역 불러오기       id= gbChatHis
select MEM_ID, CH_CODE, CH_FILENAME from CHAT_HIS where CH_CODE='JJGB230003'; 

-- 공동구매 해당글에서 링크 타고 들어가는 이벤트 발생시 공동구매 1:1 채팅 insert문  id = gbChatInsert
insert into chat_his values('BigQueka','JJGB230003','공동구매채팅내역파일');
-- 공동구매채팅방에서 채팅방 나가기 눌렀을때 해당되는 delete문    id = gbchatDelete
delete from chat_his 
where ch_code = 'JJGB230003' and mem_id ='BigQueka';

---------------------------------------------------------------------------------------------------------------------
-- BOARD 양도마켓
--- 양도마켓 등록     id = hoMarketInsert 

INSERT INTO BOARD (BO_CODE, BO_TYPE, BO_TITLE, BO_CONTENT, BO_DATE, MEM_ID)
VALUES (('JJBO23' || LPAD(BO_SEQ.NEXTVAL,4,'0')), '양도마켓', '테스트제목입니다', '테스트내용입니다','2023-08-05', 'MiddleQueka');

--양도마켓 게시글 출력 id = hoMarketCheck
SELECT B.BO_CODE, B.BO_TYPE, B.BO_TITLE, B.BO_CONTENT, B.BO_DATE, M.MEM_NAME, M.MEM_ID 
FROM BOARD B, MEMBER M
WHERE B.MEM_ID=M.MEM_ID AND BO_TYPE = '양도마켓';
----선택 값 업데이트 --> 양도마켓 정보 (컬럼만 변경하면 됨) id = hoMarketUpdate
UPDATE BOARD SET BO_CONTENT='테스트 내용입니다.(수정)'            
WHERE BO_CODE='JJBO230010' AND BO_TYPE = '양도마켓';
----  양도마켓 게시글 삭제 id = hoMarketDelete
DELETE FROM BOARD                                   
WHERE BO_CODE ='JJBO230010' AND BO_TYPE = '양도마켓';

-- 댓글 등록
INSERT INTO COMENT (CO_CODE, BO_CODE, CO_CONTENT)           --댓글 등록  이건 위에 게시판에 등록하는거 있음  똑같은거 써
VALUES ('JJCO23' || LPAD(COM_SEQ.NEXTVAL,4,'0'), 'JJBO230011', '양도댓글임다');

SELECT CO_CODE, BO_CODE, CO_CONTENT     --댓글 조회  이것도 위에 게시판에 등록하는거 있음 똑같은거 써
FROM COMENT 
WHERE BO_CODE = 'JJBO230011';

--양도마켓 글에서 진행되는 1:1 채팅에는 내역 불러오기   이것도 위에 공동구매 채팅이랑 똑같은거써
select MEM_ID, CH_CODE, CH_FILENAME from CHAT_HIS where CH_CODE='JJBO230011'; 

-- 양도마켓 해당글에서 링크 타고 들어가는 이벤트 발생시 양도마켓 1:1 채팅 insert문       이것도 위에 공동구매 채팅이랑 똑같은거써
insert into chat_his values('LittleQueka','JJBO230011','양도마켓채팅내역파일');

-- 양도마켓채팅방에서 채팅방 나가기 눌렀을때 해당되는 delete문     이것도 위에 공동구매 채팅이랑 똑같은거써
delete from chat_his 
where ch_code = 'JJBO230011' and mem_id ='LittleQueka';
commit;
-----------------------------------------------------------------------------------------------------------------------------
-- reservation

--예약하기버튼을 누르면 예약테이블 insert         id= resInsert
insert into reservaTion (RES_CODE, R_CODE, MEM_ID, RES_CIN, RES_COUT, RES_MEMO, RES_STATUS)
values('RS23' || lpad(res_seq.nextval,6,'0'),'JJRM230002','LittleQueka', '2023-08-03', '2023-08-04', '바다가보이는 전망으로 해주세요.', '예약완료');  


--환불하기를 누르면 자동으로 insert되어야함     id = refundInsert
insert into REFUND (RF_CODE, PAY_NO, RF_DATE)
values('RF23' || lpad(REF_seq.nextval,6,'0'),'PY23000001',sysdate);  

update reservation set res_status = '예약취소' where res_code ='RS23000002';




--밑의 두개의 쿼리문은 예약 페이지 접속시 바로 불러와서 list형식으로 뿌려줘야한다.

--해당 예약자의 보유쿠폰 불러오기[cp_user가 1인것만 사용가능]    id = cphCheck
select cp.co_code 
from member m , cp_having cp 
where m.mem_id = cp.mem_id and m.mem_id = 'MiddleQueka' and cp.cp_use='1';

--해당 예약자의 보유 마일리지 불러오기                     id= memPosMileage
select mem_mil 
from member 
where mem_id ='BigQueka';
------------------------------------------------------------------------

--결제 버튼 눌럿을때 쿠폰과 마일리지가 차감되는 쿼리       

--이거 안쓰고 밑에꺼 써서 그냥 사용유무를 update로 바꿔주어 사용한것은 0으로 처리한다.
--DELETE FROM member                
--WHERE (SELECT co_code FROM cp_having where ch_use='1') In 'CO001';



--결제 버튼을 눌럿을때 쿠폰보유자테이블에서 해당 아이디의 해당 쿠폰코드 를 조회하여
-- ch_use가 1인 ch_use의 사용여부를 0으로 바꾼다.        id = memCpdelete 
update cp_having 
set ch_use ='0' 
where ch_use ='1' and mem_id='BigQueka' and co_code='CO001';
