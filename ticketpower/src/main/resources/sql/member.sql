
  CREATE TABLE "DOTORY"."DT_MEMBER" 
   (	"MEMBER_ID" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"MEMBER_PW" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"MEMBER_NAME" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"MEMBER_TEL" VARCHAR2(20 BYTE), 
	"MEMBER_ADDR" VARCHAR2(200 BYTE), 
	"MEMBER_EDATE" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"MEMBER_AUTHOR" VARCHAR2(10 BYTE) DEFAULT 'USER' NOT NULL ENABLE, 
	"MEMBER_DDATE" DATE DEFAULT sysdate, 
	"MEMBER_IMG" VARCHAR2(200 BYTE), 
	 CONSTRAINT "DT_MEMBER_PK" PRIMARY KEY ("MEMBER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "DOTORY"."DT_MEMBER"."MEMBER_ID" IS '아이디';
   COMMENT ON COLUMN "DOTORY"."DT_MEMBER"."MEMBER_PW" IS '비밀번호';
   COMMENT ON COLUMN "DOTORY"."DT_MEMBER"."MEMBER_NAME" IS '이름';
   COMMENT ON COLUMN "DOTORY"."DT_MEMBER"."MEMBER_TEL" IS '전화번호';
   COMMENT ON COLUMN "DOTORY"."DT_MEMBER"."MEMBER_ADDR" IS '권한';
   COMMENT ON COLUMN "DOTORY"."DT_MEMBER"."MEMBER_EDATE" IS '생성일';
   COMMENT ON COLUMN "DOTORY"."DT_MEMBER"."MEMBER_AUTHOR" IS '권한';
   COMMENT ON COLUMN "DOTORY"."DT_MEMBER"."MEMBER_DDATE" IS '탈퇴일';
   COMMENT ON COLUMN "DOTORY"."DT_MEMBER"."MEMBER_IMG" IS '프로필사진';

