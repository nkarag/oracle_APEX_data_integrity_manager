﻿

ALTER TABLE "DIMGR"."COLUMNS" DROP CONSTRAINT "SYS_C0040457"
/
ALTER TABLE "DIMGR"."TUPLE_CONSTRAINTS_REF_COLUMNS" DROP CONSTRAINT "SYS_C0040465"
/
ALTER TABLE "TABLE_CONSTRAINTS_REF_COLUMNS" DROP CONSTRAINT "COL_IS_REFBY_TCON"
/
ALTER TABLE "ITABLE_CONSTRAINTS_REF_COLUMNS" DROP CONSTRAINT "COL_IS_REFBY_ITCON"
/
CREATE TABLE "DIMGR"."COLUMNS_93DDF1AF19FB4D98AE6E1E"(
  "OWNER" Varchar2(30 ),
  "TABLE_NAME" Varchar2(30 ),
  "COLUMN_NAME" Varchar2(30 ),
  "COLUMN_ID" Number,
  "DATA_TYPE" Varchar2(106 ),
  "DATA_LENGTH" Number,
  "DATA_PRECISION" Number,
  "DATA_SCALE" Number,
  "COLUMN_DESC" Varchar2(100 ),
  "COLUMN_COMMENT" Varchar2(500 ),
  "NULLABLE" Varchar2(1 ),
  "CONSTRAINT_DESC" Varchar2(500 ),
  "CONSTRAINT_CHECK_CONDITION" Clob,
  "CONSTRAINT_VALIDATION_QRY" Clob,
  "CONSTRAINT_NAME" Varchar2(50 )
)
/
INSERT INTO "DIMGR"."COLUMNS_93DDF1AF19FB4D98AE6E1E" ("OWNER", "TABLE_NAME", "COLUMN_NAME", "COLUMN_ID", "DATA_TYPE", "DATA_LENGTH", "DATA_PRECISION", "DATA_SCALE", "COLUMN_DESC", "COLUMN_COMMENT", "NULLABLE", "CONSTRAINT_DESC", "CONSTRAINT_CHECK_CONDITION", "CONSTRAINT_VALIDATION_QRY", "CONSTRAINT_NAME") SELECT "OWNER", "TABLE_NAME", "COLUMN_NAME", "COLUMN_ID", "DATA_TYPE", "DATA_LENGTH", "DATA_PRECISION", "DATA_SCALE", "COLUMN_DESC", "COLUMN_COMMENT", "NULLABLE", "CONSTRAINT_DESC", "CONSTRAINT_CHECK_CONDITION", "CONSTRAINT_VALIDATION_QRY", "CONSTRAINT_NAME" FROM "DIMGR"."COLUMNS"
/



DROP TABLE "DIMGR"."COLUMNS"
/
ALTER TABLE "DIMGR"."COLUMNS_93DDF1AF19FB4D98AE6E1E" RENAME TO "COLUMNS"
/


ALTER TABLE "DIMGR"."COLUMNS" MODIFY ("OWNER" CONSTRAINT "SYS_C0040423" NOT NULL)
/
ALTER TABLE "DIMGR"."COLUMNS" MODIFY ("TABLE_NAME" CONSTRAINT "SYS_C0040424" NOT NULL)
/
ALTER TABLE "DIMGR"."COLUMNS" MODIFY ("COLUMN_NAME" CONSTRAINT "SYS_C0040426" NOT NULL)
/
ALTER TABLE "DIMGR"."COLUMNS" MODIFY ("COLUMN_ID" CONSTRAINT "SYS_C0040425" NOT NULL)
/
ALTER TABLE "DIMGR"."COLUMNS" MODIFY ("DATA_TYPE" CONSTRAINT "SYS_C0040427" NOT NULL)
/
ALTER TABLE "DIMGR"."COLUMNS" MODIFY ("NULLABLE" CONSTRAINT "SYS_C0040428" NOT NULL)
/
ALTER TABLE "DIMGR"."COLUMNS" MODIFY ("NULLABLE" CONSTRAINT "CHECK_NULLABLE_COL" CHECK (nullable in ('Y', 'N')))
/

CREATE INDEX "DIMGR"."XIF1COLUMNS" ON "DIMGR"."COLUMNS" ("OWNER","TABLE_NAME")
/

CREATE UNIQUE INDEX "DIMGR"."XPKCOLUMNS" ON "DIMGR"."COLUMNS" ("OWNER","TABLE_NAME","COLUMN_NAME")
/

ALTER TABLE "DIMGR"."COLUMNS" ADD CONSTRAINT "SYS_C0040429" PRIMARY KEY ("OWNER","TABLE_NAME","COLUMN_NAME")
   USING INDEX "DIMGR"."XPKCOLUMNS"
/

COMMENT ON TABLE "DIMGR"."COLUMNS" IS 'This table records the column-level constraints'
/

COMMENT ON COLUMN "DIMGR"."COLUMNS"."DATA_LENGTH" IS 'Length of the column (in bytes)'
/

COMMENT ON COLUMN "DIMGR"."COLUMNS"."CONSTRAINT_CHECK_CONDITION" IS 'Check constraint condition, without the CHECK keyword'
/


ALTER TABLE "DIMGR"."INTER_TABLE_CONSTRAINTS" MODIFY ("CONSTRAINT_NAME" Varchar2(50 ))
/

ALTER TABLE "DIMGR"."INTER_TABLE_CONS_REF_TABLES" MODIFY ("CONSTRAINT_NAME" Varchar2(50 ))
/

ALTER TABLE "DIMGR"."SRCH_COND" MODIFY ("CONSTRAINT_NAME" Varchar2(50 ))
/

ALTER TABLE "DIMGR"."TABLE_CONSTRAINTS" MODIFY ("CONSTRAINT_NAME" Varchar2(50 ))
/

ALTER TABLE "DIMGR"."TUPLE_CONSTRAINTS" MODIFY ("CONSTRAINT_NAME" Varchar2(50 ))
/

ALTER TABLE "DIMGR"."TUPLE_CONSTRAINTS_REF_COLUMNS" MODIFY ("CONSTRAINT_NAME" Varchar2(50 ))
/

ALTER TABLE "TABLE_CONSTRAINTS_REF_COLUMNS" MODIFY ("CONSTRAINT_NAME" Varchar2(50 ))
/

ALTER TABLE "ITABLE_CONSTRAINTS_REF_COLUMNS" MODIFY ("CONSTRAINT_NAME" Varchar2(50 ))
/

ALTER TABLE "DIMGR"."COLUMNS" ADD CONSTRAINT "SYS_C0040457" FOREIGN KEY ("OWNER", "TABLE_NAME") REFERENCES "DIMGR"."TABLES" ("OWNER", "TABLE_NAME")
/


ALTER TABLE "DIMGR"."TUPLE_CONSTRAINTS_REF_COLUMNS" ADD CONSTRAINT "SYS_C0040465" FOREIGN KEY ("OWNER", "TABLE_NAME", "COLUMN_NAME") REFERENCES "DIMGR"."COLUMNS" ("OWNER", "TABLE_NAME", "COLUMN_NAME")
/


ALTER TABLE "TABLE_CONSTRAINTS_REF_COLUMNS" ADD CONSTRAINT "COL_IS_REFBY_TCON" FOREIGN KEY ("OWNER", "TABLE_NAME", "COLUMN_NAME") REFERENCES "DIMGR"."COLUMNS" ("OWNER", "TABLE_NAME", "COLUMN_NAME")
/


ALTER TABLE "ITABLE_CONSTRAINTS_REF_COLUMNS" ADD CONSTRAINT "COL_IS_REFBY_ITCON" FOREIGN KEY ("OWNER", "TABLE_NAME", "COLUMN_NAME") REFERENCES "DIMGR"."COLUMNS" ("OWNER", "TABLE_NAME", "COLUMN_NAME")
/