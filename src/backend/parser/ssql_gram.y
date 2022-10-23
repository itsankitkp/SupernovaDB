%{
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
void yyerror(char *s, ...);
void emit(char *s, ...);
%}
%union {
 int intval;
 double floatval;
 char *strval;
 int subtok;
}
%token <strval> NAME
%token <strval> STRING
%token <intval> INTNUM
%token <intval> BOOL
%token <floatval> APPROXNUM
 /* user @abc names */
%token <strval> USERVAR
 /* operators and precedence levels */
%right ASSIGN
%left OR
%left XOR
%left ANDOP
%nonassoc IN IS LIKE REGEXP
%left NOT '!'
%left BETWEEN
%left <subtok> COMPARISON /* = <> < > <= >= <=> */
%left '|'
%left '&'
%left <subtok> SHIFT /* << >> */
%left '+' '-'
%left '*' '/' '%' MOD
%left '^'
%nonassoc UMINUS


$end (0) 0
'!' (33) 252
'%' (37) 236
'&' (38) 248
'(' (40) 52 76 77 78 79 85 110 111 112 142 143 144 146 152 153 154
 155 156 165 171 172 198 200 209 210 243 244 245 246 263 264 265
 266 267 268 269 270 271 272 273 274 275 279 280
')' (41) 52 76 77 78 79 85 110 111 112 142 143 144 146 152 153 154
 155 156 165 171 172 198 200 209 210 243 244 245 246 263 264 265
 266 267 268 269 270 271 272 273 274 275 279 280
'*' (42) 43 96 234 269
'+' (43) 232
',' (44) 13 25 30 31 42 46 84 94 112 115 116 121 122 134 135 149 172
 212 222 260 279 280
'-' (45) 233 238
'.' (46) 50 96 133 135 143 146 147 227
'/' (47) 235
';' (59) 1 2 3 4
'^' (94) 249
'|' (124) 247
error (256) 3 4
NAME (258) 28 30 49 50 51 55 56 83 84 87 93 94 99 117 118 119 120 121
 122 124 125 126 132 133 134 135 137 138 142 143 144 145 146 147
 151 225 227 268
STRING (259) 29 31 160 169 179 180 211 212 228
INTNUM (260) 161 171 172 198 200 229
BOOL (261) 163 231 256 257
APPROXNUM (262) 162 230
USERVAR (263) 223 224 226 253
ASSIGN (264) 224 253
OR (265) 240
XOR (266) 241
ANDOP (267) 239
REGEXP (268) 298 299
LIKE (269) 296 297
IS (270) 254 255 256 257
IN (271) 263 264 265 266
NOT (272) 158 251 255 257 264 266 297 299
BETWEEN (273) 258
COMPARISON (274) 119 120 121 122 132 133 134 135 223 242 243 244 245
 246
SHIFT (275) 250
MOD (276) 237
UMINUS (277)
ADD (278)
ALL (279) 33 246
ALTER (280)
ANALYZE (281)
AND (282) 258
ANY (283) 244
AS (284) 53 55
ASC (285) 15
AUTO_INCREMENT (286) 164
BEFORE (287)
BIGINT (288) 187
BINARY (289) 174 199 303
BIT (290) 181
BLOB (291) 202
BOTH (292) 278
BY (293) 11 22
CALL (294)
CASCADE (295)
CASE (296) 290 291 292 293
CHANGE (297)
CHAR (298) 179 197
CHECK (299)
COLLATE (300) 180
COLUMN (301)
COMMENT (302) 169
CONDITION (303)
CONSTRAINT (304)
CONTINUE (305)
CONVERT (306)
CREATE (307) 137 138 142 143 144 145 146 147
CROSS (308) 65
CURRENT_DATE (309) 301
CURRENT_TIME (310) 302
CURRENT_TIMESTAMP (311) 300
CURRENT_USER (312)
CURSOR (313)
DATABASE (314) 137
DATABASES (315)
DATE (316) 192
DATETIME (317) 195
DAY_HOUR (318) 281
DAY_MICROSECOND (319) 282
DAY_MINUTE (320) 283
DAY_SECOND (321) 284
DECIMAL (322) 191
DECLARE (323)
DEFAULT (324) 114 116 120 122 160 161 162 163
DELAYED (325) 104
DELETE (326) 87 92 97
DESC (327) 16
DESCRIBE (328)
DETERMINISTIC (329)
DISTINCT (330) 34
DISTINCTROW (331) 35
DIV (332)
DOUBLE (333) 189
DROP (334)
DUAL (335)
EACH (336)
ELSE (337) 291 293
ELSEIF (338)
ENCLOSED (339)
END (340) 290 291 292 293
ENUM (341) 209
ESCAPED (342)
EXISTS (343) 140 267
EXIT (344)
EXPLAIN (345)
FETCH (346)
FLOAT (347) 190
FOR (348) 81 273
FORCE (349) 79
FOREIGN (350)
FROM (351) 7 87 92 97 272 273 275
FULLTEXT (352) 155 156
GRANT (353)
GROUP (354) 11
HAVING (355) 20
HIGH_PRIORITY (356) 36 105
HOUR_MICROSECOND (357) 287
HOUR_MINUTE (358) 288
HOUR_SECOND (359) 289
IF (360) 140
IGNORE (361) 78 90 106 131 215
INDEX (362) 154 155
INFILE (363)
INNER (364) 64
INOUT (365)
INSENSITIVE (366)
INSERT (367) 99 117 118
INT (368) 185
INTEGER (369) 186
INTERVAL (370) 281 282 283 284 285 286 287 288 289
INTO (371) 27 107
ITERATE (372)
JOIN (373) 58 61 62 81
KEY (374) 77 78 79 101 152 153 156 166 167 168
KEYS (375)
KILL (376)
LEADING (377) 276
LEAVE (378)
LEFT (379) 68 70
LIMIT (380) 24 25
LINES (381)
LOAD (382)
LOCALTIME (383)
LOCALTIMESTAMP (384)
LOCK (385)
LONG (386)
LONGBLOB (387) 204
LONGTEXT (388) 208
LOOP (389)
LOW_PRIORITY (390) 88 103 130
MATCH (391)
MEDIUMBLOB (392) 203
MEDIUMINT (393) 184
MEDIUMTEXT (394) 207
MINUTE_MICROSECOND (395)
MINUTE_SECOND (396)
MODIFIES (397)
NATURAL (398) 62
NO_WRITE_TO_BINLOG (399)
NULLX (400) 158 159 254 255
NUMBER (401)
ON (402) 60 75
ONDUPLICATE (403) 101
OPTIMIZE (404)
OPTION (405)
OPTIONALLY (406)
ORDER (407) 22
OUT (408)
OUTER (409) 67
OUTFILE (410)
PRECISION (411)
PRIMARY (412) 152 167
PROCEDURE (413)
PURGE (414)
QUICK (415) 89
READ (416)
READS (417)
REAL (418) 188
REFERENCES (419)
RELEASE (420)
RENAME (421)
REPEAT (422)
REPLACE (423) 124 125 126 216
REQUIRE (424)
RESTRICT (425)
RETURN (426)
REVOKE (427)
RIGHT (428) 69 71
ROLLUP (429) 18
SCHEMA (430) 138
SCHEMAS (431)
SECOND_MICROSECOND (432)
SELECT (433) 6 7
SENSITIVE (434)
SEPARATOR (435)
SET (436) 117 125 128 179 210 220
SHOW (437)
SMALLINT (438) 183
SOME (439) 245
SONAME (440)
SPATIAL (441)
SPECIFIC (442)
SQL (443)
SQLEXCEPTION (444)
SQLSTATE (445)
SQLWARNING (446)
SQL_BIG_RESULT (447) 39
SQL_CALC_FOUND_ROWS (448) 40
SQL_SMALL_RESULT (449) 38
SSL (450)
STARTING (451)
STRAIGHT_JOIN (452) 37 59 60
TABLE (453) 142 143 144 145 146 147
TEMPORARY (454) 218
TEXT (455) 206
TERMINATED (456)
THEN (457) 294 295
TIME (458) 193
TIMESTAMP (459) 194
TINYBLOB (460) 201
TINYINT (461) 182
TINYTEXT (462) 205
TO (463)
TRAILING (464) 277
TRIGGER (465)
UNDO (466)
UNION (467)
UNIQUE (468) 165 166
UNLOCK (469)
UNSIGNED (470) 176
UPDATE (471) 101 128
USAGE (472)
USE (473) 77
USING (474) 76 97
UTC_DATE (475)
UTC_TIME (476)
UTC_TIMESTAMP (477)
VALUES (478) 99 124
VARBINARY (479) 200
VARCHAR (480) 198
VARYING (481)
WHEN (482) 294 295
WHERE (483) 9
WHILE (484)
WITH (485) 18
WRITE (486)
YEAR (487) 196 286
YEAR_MONTH (488) 285
ZEROFILL (489) 177
FSUBSTRING (490) 271 272 273
FTRIM (491) 274 275
FDATE_ADD (492) 279
FDATE_SUB (493) 280
FCOUNT (494) 269 270
$accept (254)
 on left: 0
stmt_list (255)
 on left: 1 2 3 4, on right: 0 2 4
stmt (256)
 on left: 5 86 98 123 127 136 141 219, on right: 1 2
select_stmt (257)
 on left: 6 7, on right: 5 85 118 126 213 243 244 245 246 265 266
 267
opt_where (258)
 on left: 8 9, on right: 7 87 92 97 128
opt_groupby (259)
 on left: 10 11, on right: 7
groupby_list (260)
 on left: 12 13, on right: 11 13 22
opt_asc_desc (261)
 on left: 14 15 16, on right: 12 13
opt_with_rollup (262)
 on left: 17 18, on right: 11
opt_having (263)
 on left: 19 20, on right: 7
opt_orderby (264)
 on left: 21 22, on right: 7 87 128
opt_limit (265)
 on left: 23 24 25, on right: 7 87 128
opt_into_list (266)
 on left: 26 27, on right: 7
column_list (267)
 on left: 28 29 30 31, on right: 27 30 31 76 110 152 153 154 155
 156 165
select_opts (268)
 on left: 32 33 34 35 36 37 38 39 40, on right: 6 7 33 34 35 36
 37 38 39 40
select_expr_list (269)
 on left: 41 42 43, on right: 6 7 42
select_expr (270)
 on left: 44, on right: 41 42
table_references (271)
 on left: 45 46, on right: 7 46 52 92 97 128
table_reference (272)
 on left: 47 48, on right: 45 46 58 59 60 61 62
table_factor (273)
 on left: 49 50 51 52, on right: 47 58 59 60 61 62
opt_as (274)
 on left: 53 54, on right: 51 213
opt_as_alias (275)
 on left: 55 56 57, on right: 44 49 50
join_table (276)
 on left: 58 59 60 61 62, on right: 48
opt_inner_cross (277)
 on left: 63 64 65, on right: 58
opt_outer (278)
 on left: 66 67, on right: 61 70 71
left_or_right (279)
 on left: 68 69, on right: 61
opt_left_or_right_outer (280)
 on left: 70 71 72, on right: 62
opt_join_condition (281)
 on left: 73 74, on right: 58
join_condition (282)
 on left: 75 76, on right: 61 73
index_hint (283)
 on left: 77 78 79 80, on right: 49 50
opt_for_join (284)
 on left: 81 82, on right: 77 78 79
index_list (285)
 on left: 83 84, on right: 77 78 79 84
table_subquery (286)
 on left: 85, on right: 51
delete_stmt (287)
 on left: 87 92 97, on right: 86
delete_opts (288)
 on left: 88 89 90 91, on right: 87 88 89 90 92 97
delete_list (289)
 on left: 93 94, on right: 92 94 97
opt_dot_star (290)
 on left: 95 96, on right: 93 94
insert_stmt (291)
 on left: 99 117 118, on right: 98
opt_ondupupdate (292)
 on left: 100 101, on right: 99 117 118 124 125 126
insert_opts (293)
 on left: 102 103 104 105 106, on right: 99 103 104 105 106 117
 118 124 125 126 130 131
opt_into (294)
 on left: 107 108, on right: 99 117 118 124 125 126
opt_col_names (295)
 on left: 109 110, on right: 99 118 124 126
insert_vals_list (296)
 on left: 111 112, on right: 99 112 124
insert_vals (297)
 on left: 113 114 115 116, on right: 111 112 115 116
insert_asgn_list (298)
 on left: 119 120 121 122, on right: 101 117 121 122 125
replace_stmt (299)
 on left: 124 125 126, on right: 123
update_stmt (300)
 on left: 128, on right: 127
update_opts (301)
 on left: 129 130 131, on right: 128
update_asgn_list (302)
 on left: 132 133 134 135, on right: 128 134 135
create_database_stmt (303)
 on left: 137 138, on right: 136
opt_if_not_exists (304)
 on left: 139 140, on right: 137 138 142 143 144 145 146 147
create_table_stmt (305)
 on left: 142 143 144 145 146 147, on right: 141
create_col_list (306)
 on left: 148 149, on right: 142 143 144 146 149
create_definition (307)
 on left: 151 152 153 154 155 156, on right: 148 149
$@1 (308)
 on left: 150, on right: 151
column_atts (309)
 on left: 157 158 159 160 161 162 163 164 165 166 167 168 169, on right:
 151 158 159 160 161 162 163 164 165 166 167 168 169
opt_length (310)
 on left: 170 171 172, on right: 181 182 183 184 185 186 187 188
 189 190 191 197 199
opt_binary (311)
 on left: 173 174, on right: 205 206 207 208
opt_uz (312)
 on left: 175 176 177, on right: 176 177 182 183 184 185 186 187
 188 189 190 191
opt_csc (313)
 on left: 178 179 180, on right: 179 180 197 198 205 206 207 208
 209 210
data_type (314)
 on left: 181 182 183 184 185 186 187 188 189 190 191 192 193 194
 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210,
 on right: 151
enum_list (315)
 on left: 211 212, on right: 209 210 212
create_select_statement (316)
 on left: 213, on right: 144 145 146 147
opt_ignore_replace (317)
 on left: 214 215 216, on right: 213
opt_temporary (318)
 on left: 217 218, on right: 142 143 144 145 146 147
set_stmt (319)
 on left: 220, on right: 219
set_list (320)
 on left: 221 222, on right: 220 222
set_expr (321)
 on left: 223 224, on right: 221 222
expr (322)
 on left: 225 226 227 228 229 230 231 232 233 234 235 236 237 238
 239 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254
 255 256 257 258 263 264 265 266 267 268 269 270 271 272 273 274
 275 279 280 290 291 292 293 296 297 298 299 300 301 302 303, on right:
 9 12 13 20 24 25 44 60 75 113 115 119 121 132 133 134 135 223 224
 232 233 234 235 236 237 238 239 240 241 242 243 244 245 246 247
 248 249 250 251 252 253 254 255 256 257 258 259 260 263 264 265
 266 270 272 273 275 279 280 281 282 283 284 285 286 287 288 289
 290 291 293 294 295 296 297 298 299 303
val_list (323)
 on left: 259 260, on right: 260 262 263 264 271 274 275
opt_val_list (324)
 on left: 261 262, on right: 268
trim_ltb (325)
 on left: 276 277 278, on right: 275
interval_exp (326)
 on left: 281 282 283 284 285 286 287 288 289, on right: 279 280
case_list (327)
 on left: 294 295, on right: 290 291 292 293 295

%type <intval> select_opts select_expr_list
%type <intval> val_list opt_val_list case_list
%type <intval> groupby_list opt_with_rollup opt_asc_desc
%type <intval> table_references opt_inner_cross opt_outer
%type <intval> left_or_right opt_left_or_right_outer column_list
%type <intval> index_list opt_for_join
%type <intval> delete_opts delete_list
%type <intval> insert_opts insert_vals insert_vals_list
%type <intval> insert_asgn_list opt_if_not_exists update_opts update_asgn_list
%type <intval> opt_temporary opt_length opt_binary opt_uz enum_list
%type <intval> column_atts data_type opt_ignore_replace create_col_list
%start stmt_list
%%
stmt_list: stmt ';'
 | stmt_list stmt ';'
 | error ';'
 | stmt_list error ';'
stmt: select_stmt
select_stmt: SELECT select_opts select_expr_list
 | SELECT select_opts select_expr_list FROM table_references opt_where
opt_groupby opt_having opt_orderby opt_limit opt_into_list
opt_where: /* empty */
  | WHERE expr
opt_groupby: /* empty */
  | GROUP BY groupby_list opt_with_rollup
groupby_list: expr opt_asc_desc
 | groupby_list ',' expr opt_asc_desc
opt_asc_desc: /* empty */
 | ASC
 | DESC
opt_with_rollup: /* empty */
 | WITH ROLLUP
opt_having: /* empty */
 | HAVING expr
opt_orderby: /* empty */
 | ORDER BY groupby_list
opt_limit: /* empty */
 | LIMIT expr
 | LIMIT expr ',' expr
opt_into_list: /* empty */
 | INTO column_list
column_list: NAME
 | STRING
 | column_list ',' NAME
 | column_list ',' STRING
select_opts: /* empty */
 | select_opts ALL
 | select_opts DISTINCT
 | select_opts DISTINCTROW
 | select_opts HIGH_PRIORITY
 | select_opts STRAIGHT_JOIN
 | select_opts SQL_SMALL_RESULT
 | select_opts SQL_BIG_RESULT
 | select_opts SQL_CALC_FOUND_ROWS
select_expr_list: select_expr
 | select_expr_list ',' select_expr
 | '*'
select_expr: expr opt_as_alias
table_references: table_reference
 | table_references ',' table_reference
table_reference: table_factor
 | join_table
table_factor: NAME opt_as_alias index_hint
 | NAME '.' NAME opt_as_alias index_hint
 | table_subquery opt_as NAME
 | '(' table_references ')'

opt_as: AS
 | /* empty */
opt_as_alias: AS NAME
 | NAME
 | /* empty */
join_table: table_reference opt_inner_cross JOIN table_factor opt_join_condition
 | table_reference STRAIGHT_JOIN table_factor
 | table_reference STRAIGHT_JOIN table_factor ON expr
 | table_reference left_or_right opt_outer JOIN table_factor
join_condition
 | table_reference NATURAL opt_left_or_right_outer JOIN table_factor
opt_inner_cross: /* empty */
 | INNER
 | CROSS
opt_outer: /* empty */
 | OUTER
left_or_right: LEFT
 | RIGHT
opt_left_or_right_outer: LEFT opt_outer
 | RIGHT opt_outer
 | /* empty */
opt_join_condition: join_condition
 | /* empty */
join_condition: ON expr
 | USING '(' column_list ')'
index_hint: USE KEY opt_for_join '(' index_list ')'
 | IGNORE KEY opt_for_join '(' index_list ')'
 | FORCE KEY opt_for_join '(' index_list ')'
 | /* empty */
opt_for_join: FOR JOIN
 | /* empty */
index_list: NAME
 | index_list ',' NAME
table_subquery: '(' select_stmt ')'
stmt: delete_stmt
delete_stmt: DELETE delete_opts FROM NAME opt_where opt_orderby opt_limit
delete_opts: delete_opts LOW_PRIORITY
 | delete_opts QUICK
 | delete_opts IGNORE
 | /* empty */
delete_stmt: DELETE delete_opts delete_list FROM table_references opt_where
delete_list: NAME opt_dot_star
 | delete_list ',' NAME opt_dot_star
opt_dot_star: /* empty */
 | '.' '*'
delete_stmt: DELETE delete_opts FROM delete_list USING table_references
 opt_where
stmt: insert_stmt
insert_stmt: INSERT insert_opts opt_into NAME opt_col_names VALUES
 insert_vals_list opt_ondupupdate
opt_ondupupdate: /* empty */
 | ONDUPLICATE KEY UPDATE insert_asgn_list
insert_opts: /* empty */
 | insert_opts LOW_PRIORITY
 | insert_opts DELAYED
 | insert_opts HIGH_PRIORITY
 | insert_opts IGNORE
opt_into: INTO
 | /* empty */
opt_col_names: /* empty */
 | '(' column_list ')'
insert_vals_list: '(' insert_vals ')'
 | insert_vals_list ',' '(' insert_vals ')'
insert_vals: expr
 | DEFAULT
 | insert_vals ',' expr
 | insert_vals ',' DEFAULT
insert_stmt: INSERT insert_opts opt_into NAME SET insert_asgn_list
opt_ondupupdate
 | INSERT insert_opts opt_into NAME opt_col_names select_stmt
opt_ondupupdate
insert_asgn_list: NAME COMPARISON expr
 | NAME COMPARISON DEFAULT
 | insert_asgn_list ',' NAME COMPARISON expr
 | insert_asgn_list ',' NAME COMPARISON DEFAULT
stmt: replace_stmt
replace_stmt: REPLACE insert_opts opt_into NAME opt_col_names VALUES
insert_vals_list opt_ondupupdate
 | REPLACE insert_opts opt_into NAME SET insert_asgn_list
opt_ondupupdate
 | REPLACE insert_opts opt_into NAME opt_col_names select_stmt
opt_ondupupdate
stmt: update_stmt
update_stmt: UPDATE update_opts table_references SET update_asgn_list opt_where
opt_orderby opt_limit
update_opts: /* empty */
 | insert_opts LOW_PRIORITY
 | insert_opts IGNORE
update_asgn_list: NAME COMPARISON expr
 | NAME '.' NAME COMPARISON expr
 | update_asgn_list ',' NAME COMPARISON expr
 | update_asgn_list ',' NAME '.' NAME COMPARISON expr
stmt: create_database_stmt
create_database_stmt: CREATE DATABASE opt_if_not_exists NAME
 | CREATE SCHEMA opt_if_not_exists NAME
opt_if_not_exists: /* empty */
 | IF EXISTS
stmt: create_table_stmt
create_table_stmt: CREATE opt_temporary TABLE opt_if_not_exists
  NAME '(' create_col_list ')'
 | CREATE opt_temporary TABLE opt_if_not_exists NAME '.'
 NAME '(' create_col_list ')'
 | CREATE opt_temporary TABLE opt_if_not_exists
 NAME '(' create_col_list ')' create_select_statement
 | CREATE opt_temporary TABLE opt_if_not_exists
 NAME create_select_statement
 | CREATE opt_temporary TABLE opt_if_not_exists NAME '.'
 NAME '(' create_col_list ')' create_select_statement
 | CREATE opt_temporary TABLE opt_if_not_exists NAME '.'
 NAME create_select_statement
 create_col_list: create_definition
 | create_col_list ',' create_definition
$@1: /* empty */
create_definition: $@1 NAME data_type column_atts
 | PRIMARY KEY '(' column_list ')'
 | KEY '(' column_list ')'
 | INDEX '(' column_list ')'
 | FULLTEXT INDEX '(' column_list ')'
 | FULLTEXT KEY '(' column_list ')'
column_atts: /* empty */
 | column_atts NOT NULLX
 | column_atts NULLX
 | column_atts DEFAULT STRING
 | column_atts DEFAULT INTNUM
 | column_atts DEFAULT APPROXNUM
 | column_atts DEFAULT BOOL
 | column_atts AUTO_INCREMENT
 | column_atts UNIQUE '(' column_list ')'
 | column_atts UNIQUE KEY
 | column_atts PRIMARY KEY
 | column_atts KEY
 | column_atts COMMENT STRING
opt_length: /* empty */
 | '(' INTNUM ')'
 | '(' INTNUM ',' INTNUM ')'
opt_binary: /* empty */
 | BINARY
opt_uz: /* empty */
 | opt_uz UNSIGNED
 | opt_uz ZEROFILL
opt_csc: /* empty */
 | opt_csc CHAR SET STRING
 | opt_csc COLLATE STRING
data_type: BIT opt_length
 | TINYINT opt_length opt_uz
 | SMALLINT opt_length opt_uz
 | MEDIUMINT opt_length opt_uz
 | INT opt_length opt_uz
 | INTEGER opt_length opt_uz
 | BIGINT opt_length opt_uz
 | REAL opt_length opt_uz
 | DOUBLE opt_length opt_uz
 | FLOAT opt_length opt_uz
 | DECIMAL opt_length opt_uz
 | DATE
 | TIME
 | TIMESTAMP
 | DATETIME
 | YEAR
 | CHAR opt_length opt_csc
 | VARCHAR '(' INTNUM ')' opt_csc
 | BINARY opt_length
 | VARBINARY '(' INTNUM ')'
 | TINYBLOB
 | BLOB
 | MEDIUMBLOB
 | LONGBLOB
 | TINYTEXT opt_binary opt_csc
 | TEXT opt_binary opt_csc
 | MEDIUMTEXT opt_binary opt_csc
 | LONGTEXT opt_binary opt_csc
 | ENUM '(' enum_list ')' opt_csc
 | SET '(' enum_list ')' opt_csc
enum_list: STRING
 | enum_list ',' STRING
create_select_statement: opt_ignore_replace opt_as select_stmt
opt_ignore_replace: /* empty */
 | IGNORE
 | REPLACE
opt_temporary: /* empty */
 | TEMPORARY
stmt: set_stmt
set_stmt: SET set_list
set_list: set_expr
 | set_list ',' set_expr
set_expr: USERVAR COMPARISON expr
 | USERVAR ASSIGN expr
expr: NAME
 | USERVAR
 | NAME '.' NAME
 | STRING
 | INTNUM
 | APPROXNUM
 | BOOL
 | expr '+' expr
 | expr '-' expr
 | expr '*' expr
 | expr '/' expr
 | expr '%' expr
 | expr MOD expr
 | '-' expr
 | expr ANDOP expr
 | expr OR expr
 | expr XOR expr
 | expr COMPARISON expr
 | expr COMPARISON '(' select_stmt ')'
 | expr COMPARISON ANY '(' select_stmt ')'
 | expr COMPARISON SOME '(' select_stmt ')'
 | expr COMPARISON ALL '(' select_stmt ')'
 | expr '|' expr
 | expr '&' expr
 | expr '^' expr
 | expr SHIFT expr
 | NOT expr
 | '!' expr
 | USERVAR ASSIGN expr
 | expr IS NULLX
 | expr IS NOT NULLX
 | expr IS BOOL
 | expr IS NOT BOOL
 | expr BETWEEN expr AND expr
val_list: expr
 | expr ',' val_list
opt_val_list: /* empty */
 | val_list
expr: expr IN '(' val_list ')'
 | expr NOT IN '(' val_list ')'
 | expr IN '(' select_stmt ')'
 | expr NOT IN '(' select_stmt ')'
 | EXISTS '(' select_stmt ')'
 | NAME '(' opt_val_list ')'
 | FCOUNT '(' '*' ')'
 | FCOUNT '(' expr ')'
 | FSUBSTRING '(' val_list ')'
 | FSUBSTRING '(' expr FROM expr ')'
 | FSUBSTRING '(' expr FROM expr FOR expr ')'
 | FTRIM '(' val_list ')'
 | FTRIM '(' trim_ltb expr FROM val_list ')'
trim_ltb: LEADING
 | TRAILING
 | BOTH
expr: FDATE_ADD '(' expr ',' interval_exp ')'
 | FDATE_SUB '(' expr ',' interval_exp ')'
interval_exp: INTERVAL expr DAY_HOUR
 | INTERVAL expr DAY_MICROSECOND
 | INTERVAL expr DAY_MINUTE
 | INTERVAL expr DAY_SECOND
 | INTERVAL expr YEAR_MONTH
 | INTERVAL expr YEAR
 | INTERVAL expr HOUR_MICROSECOND
 | INTERVAL expr HOUR_MINUTE
 | INTERVAL expr HOUR_SECOND
expr: CASE expr case_list END
 | CASE expr case_list ELSE expr END
 | CASE case_list END
 | CASE case_list ELSE expr END
case_list: WHEN expr THEN expr
 | case_list WHEN expr THEN expr
expr: expr LIKE expr
 | expr NOT LIKE expr
 | expr REGEXP expr
 | expr NOT REGEXP expr
 | CURRENT_TIMESTAMP
 | CURRENT_DATE
 | CURRENT_TIME
 | BINARY expr

 expr: NAME { emit("NAME %s", $1); free($1); }
 | NAME '.' NAME { emit("FIELDNAME %s.%s", $1, $3); free($1); free($3); }
 | USERVAR { emit("USERVAR %s", $1); free($1); }
 | STRING { emit("STRING %s", $1); free($1); }
 | INTNUM { emit("NUMBER %d", $1); }
 | APPROXNUM { emit("FLOAT %g", $1); }
 | BOOL { emit("BOOL %d", $1); }
 ;
 expr: expr '+' expr { emit("ADD"); }
 | expr '-' expr { emit("SUB"); }
 | expr '*' expr { emit("MUL"); }
 | expr '/' expr { emit("DIV"); }
 | expr '%' expr { emit("MOD"); }
 | expr MOD expr { emit("MOD"); }
 | '-' expr %prec UMINUS { emit("NEG"); }
 | expr ANDOP expr { emit("AND"); }
 | expr OR expr { emit("OR"); }
 | expr XOR expr { emit("XOR"); }
 | expr '|' expr { emit("BITOR"); }
 | expr '&' expr { emit("BITAND"); }
 | expr '^' expr { emit("BITXOR"); }
 | expr SHIFT expr { emit("SHIFT %s", $2==1?"left":"right"); }
 | NOT expr { emit("NOT"); }
 | '!' expr { emit("NOT"); }
 | expr COMPARISON expr { emit("CMP %d", $2); }
 /* recursive selects and comparisons thereto */
 | expr COMPARISON '(' select_stmt ')' { emit("CMPSELECT %d", $2); }
 | expr COMPARISON ANY '(' select_stmt ')' { emit("CMPANYSELECT %d", $2); }
 | expr COMPARISON SOME '(' select_stmt ')' { emit("CMPANYSELECT %d", $2); }
 | expr COMPARISON ALL '(' select_stmt ')' { emit("CMPALLSELECT %d", $2); }
 ;
expr: expr IS NULLX { emit("ISNULL"); }
 | expr IS NOT NULLX { emit("ISNULL"); emit("NOT"); }
 | expr IS BOOL { emit("ISBOOL %d", $3); }
 | expr IS NOT BOOL { emit("ISBOOL %d", $4); emit("NOT"); }
 | USERVAR ASSIGN expr { emit("ASSIGN @%s", $1); free($1); }
 ;
expr: expr BETWEEN expr AND expr %prec BETWEEN { emit("BETWEEN"); }
 ;
 val_list: expr { $$ = 1; }
 | expr ',' val_list { $$ = 1 + $3; }
 ;
opt_val_list: /* nil */ { $$ = 0 }
 | val_list
 ;
expr: expr IN '(' val_list ')' { emit("ISIN %d", $4); }
 | expr NOT IN '(' val_list ')' { emit("ISIN %d", $5); emit("NOT"); }
 | expr IN '(' select_stmt ')' { emit("CMPANYSELECT 4"); }
 | expr NOT IN '(' select_stmt ')' { emit("CMPALLSELECT 3"); }
 | EXISTS '(' select_stmt ')' { emit("EXISTSSELECT"); if($1)emit("NOT"); }
 ;
  /* regular functions */
expr: NAME '(' opt_val_list ')' { emit("CALL %d %s", $3, $1); free($1); }
 ;
 /* functions with special syntax */
expr: FCOUNT '(' '*' ')' { emit("COUNTALL") }
 | FCOUNT '(' expr ')' { emit(" CALL 1 COUNT"); }
expr: FSUBSTRING '(' val_list ')' { emit("CALL %d SUBSTR", $3); }
 | FSUBSTRING '(' expr FROM expr ')' { emit("CALL 2 SUBSTR"); }
 | FSUBSTRING '(' expr FROM expr FOR expr ')' { emit("CALL 3 SUBSTR"); }
 | FTRIM '(' val_list ')' { emit("CALL %d TRIM", $3); }
 | FTRIM '(' trim_ltb expr FROM val_list ')' { emit("CALL 3 TRIM"); }
 ;
trim_ltb: LEADING { emit("NUMBER 1"); }
 | TRAILING { emit("NUMBER 2"); }
 | BOTH { emit("NUMBER 3"); }
 ;
expr: FDATE_ADD '(' expr ',' interval_exp ')' { emit("CALL 3 DATE_ADD"); }
 | FDATE_SUB '(' expr ',' interval_exp ')' { emit("CALL 3 DATE_SUB"); }
 ;
interval_exp: INTERVAL expr DAY_HOUR { emit("NUMBER 1"); }
 | INTERVAL expr DAY_MICROSECOND { emit("NUMBER 2"); }
 | INTERVAL expr DAY_MINUTE { emit("NUMBER 3"); }
 | INTERVAL expr DAY_SECOND { emit("NUMBER 4"); }
 | INTERVAL expr YEAR_MONTH { emit("NUMBER 5"); }
 | INTERVAL expr YEAR { emit("NUMBER 6"); }
 | INTERVAL expr HOUR_MICROSECOND { emit("NUMBER 7"); }
 | INTERVAL expr HOUR_MINUTE { emit("NUMBER 8"); }
 | INTERVAL expr HOUR_SECOND { emit("NUMBER 9"); }
 ;

  ;
case_list: WHEN expr THEN expr { $$ = 1; }
 | case_list WHEN expr THEN expr { $$ = $1+1; }
 ;
expr: expr LIKE expr { emit("LIKE"); }
 | expr NOT LIKE expr { emit("LIKE"); emit("NOT"); }
 ;
expr: expr REGEXP expr { emit("REGEXP"); }
 | expr NOT REGEXP expr { emit("REGEXP"); emit("NOT"); }
 ;
expr: CURRENT_TIMESTAMP { emit("NOW") };
 | CURRENT_DATE { emit("NOW") };
 | CURRENT_TIME { emit("NOW") };
 ;
expr: BINARY expr %prec UMINUS { emit("STRTOBIN"); }
 ;

/* statements: select statement */
stmt: select_stmt { emit("STMT"); }
 ;
select_stmt: SELECT select_opts select_expr_list simple select with no tables
 { emit("SELECTNODATA %d %d", $2, $3); } ;
 | SELECT select_opts select_expr_list select with tables
 FROM table_references
 opt_where opt_groupby opt_having opt_orderby opt_limit
 opt_into_list { emit("SELECT %d %d %d", $2, $3, $5); } ;
;
opt_where: /* nil */
 | WHERE expr { emit("WHERE"); };
opt_groupby: /* nil */
 | GROUP BY groupby_list opt_with_rollup
 { emit("GROUPBYLIST %d %d", $3, $4); }
;
groupby_list: expr opt_asc_desc
 { emit("GROUPBY %d", $2); $$ = 1; }
 | groupby_list ',' expr opt_asc_desc
 { emit("GROUPBY %d", $4); $$ = $1 + 1; }
 ;
opt_asc_desc: /* nil */ { $$ = 0; }
 | ASC { $$ = 0; }
 | DESC { $$ = 1; }
 ;
opt_with_rollup: /* nil */ { $$ = 0; }
 | WITH ROLLUP { $$ = 1; }
 ;
opt_having: /* nil */
 | HAVING expr { emit("HAVING"); };
opt_orderby: /* nil */
 | ORDER BY groupby_list { emit("ORDERBY %d", $3); }
 ;
opt_limit: /* nil */ | LIMIT expr { emit("LIMIT 1"); }
 | LIMIT expr ',' expr { emit("LIMIT 2"); }
 ;
opt_into_list: /* nil */
 | INTO column_list { emit("INTO %d", $2); }
 ;
column_list: NAME { emit("COLUMN %s", $1); free($1); $$ = 1; }
 | column_list ',' NAME { emit("COLUMN %s", $3); free($3); $$ = $1 + 1; }
 ;
 select_opts: { $$ = 0; }
| select_opts ALL
 { if($1 & 01) yyerror("duplicate ALL option"); $$ = $1 | 01; }
| select_opts DISTINCT
 { if($1 & 02) yyerror("duplicate DISTINCT option"); $$ = $1 | 02; }
| select_opts DISTINCTROW
 { if($1 & 04) yyerror("duplicate DISTINCTROW option"); $$ = $1 | 04; }
| select_opts HIGH_PRIORITY
 { if($1 & 010) yyerror("duplicate HIGH_PRIORITY option"); $$ = $1 | 010; }
| select_opts STRAIGHT_JOIN
 { if($1 & 020) yyerror("duplicate STRAIGHT_JOIN option"); $$ = $1 | 020; }
| select_opts SQL_SMALL_RESULT
 { if($1 & 040) yyerror("duplicate SQL_SMALL_RESULT option"); $$ = $1 | 040; }
| select_opts SQL_BIG_RESULT
 { if($1 & 0100) yyerror("duplicate SQL_BIG_RESULT option"); $$ = $1 | 0100; }
| select_opts SQL_CALC_FOUND_ROWS
 { if($1 & 0200) yyerror("duplicate SQL_CALC_FOUND_ROWS option"); $$ =
 $1 | 0200; }
 ;
select_expr_list: select_expr { $$ = 1; }
 | select_expr_list ',' select_expr {$$ = $1 + 1; }
 | '*' { emit("SELECTALL"); $$ = 1; }
 ;
select_expr: expr opt_as_alias ;
opt_as_alias: AS NAME { emit ("ALIAS %s", $2); free($2); }
 | NAME { emit ("ALIAS %s", $1); free($1); }
 | /* nil */
 ;
 table_references: table_reference { $$ = 1; }
 | table_references ',' table_reference { $$ = $1 + 1; }
 ;
table_reference: table_factor
 | join_table
;
table_factor:
 NAME opt_as_alias index_hint { emit("TABLE %s", $1); free($1); }
 | NAME '.' NAME opt_as_alias index_hint { emit("TABLE %s.%s", $1, $3);
 free($1); free($3); }
 | table_subquery opt_as NAME { emit("SUBQUERYAS %s", $3); free($3); }
 | '(' table_references ')' { emit("TABLEREFERENCES %d", $2); }
 ;
opt_as: AS
 | /* nil */
 ;
join_table:
 table_reference opt_inner_cross JOIN table_factor opt_join_condition
 { emit("JOIN %d", 100+$2); }
 | table_reference STRAIGHT_JOIN table_factor
 { emit("JOIN %d", 200); }
 | table_reference STRAIGHT_JOIN table_factor ON expr
 { emit("JOIN %d", 200); }
 | table_reference left_or_right opt_outer JOIN table_factor join_condition
 { emit("JOIN %d", 300+$2+$3); }
 | table_reference NATURAL opt_left_or_right_outer JOIN table_factor
 { emit("JOIN %d", 400+$3); }
 ;
opt_inner_cross: /* nil */ { $$ = 0; }
 | INNER { $$ = 1; }
 | CROSS { $$ = 2; }
;
opt_outer: /* nil */ { $$ = 0; }
 | OUTER {$$ = 4; }
 ;
left_or_right: LEFT { $$ = 1; }
 | RIGHT { $$ = 2; }
 ;
opt_left_or_right_outer: LEFT opt_outer { $$ = 1 + $2; }
 | RIGHT opt_outer { $$ = 2 + $2; }
 | /* nil */ { $$ = 0; }
 ;
opt_join_condition: /* nil */
 | join_condition ;
join_condition:
  ON expr { emit("ONEXPR"); }
 | USING '(' column_list ')' { emit("USING %d", $3); }
 ;
index_hint:
 USE KEY opt_for_join '(' index_list ')'
 { emit("INDEXHINT %d %d", $5, 10+$3); }
 | IGNORE KEY opt_for_join '(' index_list ')'
 { emit("INDEXHINT %d %d", $5, 20+$3); }
 | FORCE KEY opt_for_join '(' index_list ')'
 { emit("INDEXHINT %d %d", $5, 30+$3); }
 | /* nil */
 ;
opt_for_join: FOR JOIN { $$ = 1; }
 | /* nil */ { $$ = 0; }
 ;
index_list: NAME { emit("INDEX %s", $1); free($1); $$ = 1; }
 | index_list ',' NAME { emit("INDEX %s", $3); free($3); $$ = $1 + 1; }
 ;
table_subquery: '(' select_stmt ')' { emit("SUBQUERY"); }
 ;
 ON expr { emit("ONEXPR"); }
 | USING '(' column_list ')' { emit("USING %d", $3); }
 ;
index_hint:
 USE KEY opt_for_join '(' index_list ')'
 { emit("INDEXHINT %d %d", $5, 10+$3); }
 | IGNORE KEY opt_for_join '(' index_list ')'
 { emit("INDEXHINT %d %d", $5, 20+$3); }
 | FORCE KEY opt_for_join '(' index_list ')'
 { emit("INDEXHINT %d %d", $5, 30+$3); }
 | /* nil */
 ;
opt_for_join: FOR JOIN { $$ = 1; }
 | /* nil */ { $$ = 0; }
 ;
index_list: NAME { emit("INDEX %s", $1); free($1); $$ = 1; }
 | index_list ',' NAME { emit("INDEX %s", $3); free($3); $$ = $1 + 1; }
 ;
table_subquery: '(' select_stmt ')' { emit("SUBQUERY"); }
 ;
  /* multitable delete, first version */
delete_stmt: DELETE delete_opts
 delete_list
 FROM table_references opt_where
 { emit("DELETEMULTI %d %d %d", $2, $3, $5); }
delete_list: NAME opt_dot_star { emit("TABLE %s", $1); free($1); $$ = 1; }
 | delete_list ',' NAME opt_dot_star
 { emit("TABLE %s", $3); free($3); $$ = $1 + 1; }
 ;
opt_dot_star: /* nil */ | '.' '*' ;
 /* multitable delete, second version */
delete_stmt: DELETE delete_opts
 FROM delete_list
 USING table_references opt_where
 { emit("DELETEMULTI %d %d %d", $2, $4, $6); }
;
/* statements: insert statement */
stmt: insert_stmt { emit("STMT"); }
 ;
insert_stmt: INSERT insert_opts opt_into NAME
 opt_col_names
 VALUES insert_vals_list
 opt_ondupupdate { emit("INSERTVALS %d %d %s", $2, $7, $4); free($4) }
 ;
opt_ondupupdate: /* nil */
 | ONDUPLICATE KEY UPDATE insert_asgn_list { emit("DUPUPDATE %d", $4); }
 ;
insert_opts: /* nil */ { $$ = 0; }
 | insert_opts LOW_PRIORITY { $$ = $1 | 01 ; }
 | insert_opts DELAYED { $$ = $1 | 02 ; }
 | insert_opts HIGH_PRIORITY { $$ = $1 | 04 ; }
 | insert_opts IGNORE { $$ = $1 | 010 ; }
 ;
opt_into: INTO | /* nil */
 ;
opt_col_names: /* nil */
 | '(' column_list ')' { emit("INSERTCOLS %d", $2); }
 ;
insert_vals_list: '(' insert_vals ')' { emit("VALUES %d", $2); $$ = 1; }
 | insert_vals_list ',' '(' insert_vals ')' { emit("VALUES %d", $4); $$ = $1 + 1; }
insert_vals:
 expr { $$ = 1; }
 | DEFAULT { emit("DEFAULT"); $$ = 1; }
 | insert_vals ',' expr { $$ = $1 + 1; }
 | insert_vals ',' DEFAULT { emit("DEFAULT"); $$ = $1 + 1; }
 ;
insert_stmt: INSERT insert_opts opt_into NAME
 SET insert_asgn_list
 opt_ondupupdate
 { emit("INSERTASGN %d %d %s", $2, $6, $4); free($4) }
 ;
insert_asgn_list:
 NAME COMPARISON expr
 { if ($2 != 4) { yyerror("bad insert assignment to %s", $1); YYERROR; }
 emit("ASSIGN %s", $1); free($1); $$ = 1; }
 | NAME COMPARISON DEFAULT
 { if ($2 != 4) { yyerror("bad insert assignment to %s", $1); YYERROR; }
 emit("DEFAULT"); emit("ASSIGN %s", $1); free($1); $$ = 1; }
 | insert_asgn_list ',' NAME COMPARISON expr
 { if ($4 != 4) { yyerror("bad insert assignment to %s", $1); YYERROR; }
 emit("ASSIGN %s", $3); free($3); $$ = $1 + 1; }
 | insert_asgn_list ',' NAME COMPARISON DEFAULT
 { if ($4 != 4) { yyerror("bad insert assignment to %s", $1); YYERROR; }
 emit("DEFAULT"); emit("ASSIGN %s", $3); free($3); $$ = $1 + 1; }
 ;
insert_stmt: INSERT insert_opts opt_into NAME opt_col_names
 select_stmt
 opt_ondupupdate { emit("INSERTSELECT %d %s", $2, $4); free($4); }
 ;
 
  /** replace just like insert **/
stmt: replace_stmt { emit("STMT"); }
 ;
replace_stmt: REPLACE insert_opts opt_into NAME
 opt_col_names
 VALUES insert_vals_list
 opt_ondupupdate { emit("REPLACEVALS %d %d %s", $2, $7, $4); free($4) }
 ;
replace_stmt: REPLACE insert_opts opt_into NAME
 SET insert_asgn_list
 opt_ondupupdate
 { emit("REPLACEASGN %d %d %s", $2, $6, $4); free($4) }
 ;
replace_stmt: REPLACE insert_opts opt_into NAME opt_col_names
 select_stmt
 opt_ondupupdate { emit("REPLACESELECT %d %s", $2, $4); free($4); }
 ;
 /** update **/
stmt: update_stmt { emit("STMT"); }
 ;
update_stmt: UPDATE update_opts table_references
 SET update_asgn_list
 opt_where
 opt_orderby
opt_limit { emit("UPDATE %d %d %d", $2, $3, $5); }
;
update_opts: /* nil */ { $$ = 0; }
 | insert_opts LOW_PRIORITY { $$ = $1 | 01 ; }
 | insert_opts IGNORE { $$ = $1 | 010 ; }
 ;
update_asgn_list:
 NAME COMPARISON expr
 { if ($2 != 4) { yyerror("bad update assignment to %s", $1); YYERROR; }
 emit("ASSIGN %s", $1); free($1); $$ = 1; }
 | NAME '.' NAME COMPARISON expr
 { if ($4 != 4) { yyerror("bad update assignment to %s", $1); YYERROR; }
 emit("ASSIGN %s.%s", $1, $3); free($1); free($3); $$ = 1; }
 | update_asgn_list ',' NAME COMPARISON expr
 { if ($4 != 4) { yyerror("bad update assignment to %s", $3); YYERROR; }
 emit("ASSIGN %s.%s", $3); free($3); $$ = $1 + 1; }
 | update_asgn_list ',' NAME '.' NAME COMPARISON expr
 { if ($6 != 4) { yyerror("bad update assignment to %s.$s", $3, $5);
 YYERROR; }
 emit("ASSIGN %s.%s", $3, $5); free($3); free($5); $$ = 1; }
 ;
 stmt: create_database_stmt { emit("STMT"); }
 ;
create_database_stmt:
 CREATE DATABASE opt_if_not_exists NAME
 { emit("CREATEDATABASE %d %s", $3, $4); free($4); }
 | CREATE SCHEMA opt_if_not_exists NAME
 { emit("CREATEDATABASE %d %s", $3, $4); free($4); }
 ;
opt_if_not_exists: /* nil */ { $$ = 0; }
 | IF EXISTS
 { if(!$2) { yyerror("IF EXISTS doesn't exist"); YYERROR; }
 $$ = $2; /* NOT EXISTS hack */ }
 ;
 /** create table **/
stmt: create_table_stmt { emit("STMT"); }
 ;
create_table_stmt: CREATE opt_temporary TABLE opt_if_not_exists NAME
 '(' create_col_list ')' { emit("CREATE %d %d %d %s", $2, $4, $7, $5); free($5); }
 ;
create_table_stmt: CREATE opt_temporary TABLE opt_if_not_exists NAME '.' NAME
 '(' create_col_list ')' { emit("CREATE %d %d %d %s.%s", $2, $4, $9, $5, $7);
 free($5); free($7); }
 ;
create_table_stmt: CREATE opt_temporary TABLE opt_if_not_exists NAME
 '(' create_col_list ')'
create_select_statement { emit("CREATESELECT %d %d %d %s", $2, $4, $7, $5); free($5); }
 ;
 create_table_stmt: CREATE opt_temporary TABLE opt_if_not_exists NAME
 create_select_statement { emit("CREATESELECT %d %d 0 %s", $2, $4, $5); free($5); }
 ;
create_table_stmt: CREATE opt_temporary TABLE opt_if_not_exists NAME '.' NAME
 '(' create_col_list ')'
 create_select_statement { emit("CREATESELECT %d %d 0 %s.%s", $2, $4, $5, $7);
 free($5); free($7); }
 ;
create_table_stmt: CREATE opt_temporary TABLE opt_if_not_exists NAME '.' NAME
 create_select_statement { emit("CREATESELECT %d %d 0 %s.%s", $2, $4, $5, $7);
 free($5); free($7); }
 ;
opt_temporary: /* nil */ { $$ = 0; }
 | TEMPORARY { $$ = 1;}
 ;
 create_col_list: create_definition { $$ = 1; }
 | create_col_list ',' create_definition { $$ = $1 + 1; }
 ;
create_definition: PRIMARY KEY '(' column_list ')' { emit("PRIKEY %d", $4); }
 | KEY '(' column_list ')' { emit("KEY %d", $3); }
 | INDEX '(' column_list ')' { emit("KEY %d", $3); }
 | FULLTEXT INDEX '(' column_list ')' { emit("TEXTINDEX %d", $4); }
 | FULLTEXT KEY '(' column_list ')' { emit("TEXTINDEX %d", $4); }
 ;
create_definition: { emit("STARTCOL"); } NAME data_type column_atts
 { emit("COLUMNDEF %d %s", $3, $2); free($2); }
column_atts: /* nil */ { $$ = 0; }
 | column_atts NOT NULLX { emit("ATTR NOTNULL"); $$ = $1 + 1; }
 | column_atts NULLX
 | column_atts DEFAULT STRING
 { emit("ATTR DEFAULT STRING %s", $3); free($3); $$ = $1 + 1; }
 | column_atts DEFAULT INTNUM
 { emit("ATTR DEFAULT NUMBER %d", $3); $$ = $1 + 1; }
 | column_atts DEFAULT APPROXNUM
 { emit("ATTR DEFAULT FLOAT %g", $3); $$ = $1 + 1; }
 | column_atts DEFAULT BOOL
 { emit("ATTR DEFAULT BOOL %d", $3); $$ = $1 + 1; }
 | column_atts AUTO_INCREMENT
 { emit("ATTR AUTOINC"); $$ = $1 + 1; }
 | column_atts UNIQUE '(' column_list ')'
 { emit("ATTR UNIQUEKEY %d", $4); $$ = $1 + 1; }
 | column_atts UNIQUE KEY { emit("ATTR UNIQUEKEY"); $$ = $1 + 1; }
 | column_atts PRIMARY KEY { emit("ATTR PRIKEY"); $$ = $1 + 1; }
 | column_atts KEY { emit("ATTR PRIKEY"); $$ = $1 + 1; }
 | column_atts COMMENT STRING
 { emit("ATTR COMMENT %s", $3); free($3); $$ = $1 + 1; }
 ;
opt_length: /* nil */ { $$ = 0; }
 | '(' INTNUM ')' { $$ = $2; }
 | '(' INTNUM ',' INTNUM ')' { $$ = $2 + 1000*$4; }
 ;
opt_binary: /* nil */ { $$ = 0; }
 | BINARY { $$ = 4000; }
 ;
opt_uz: /* nil */ { $$ = 0; }
 | opt_uz UNSIGNED { $$ = $1 | 1000; }
 | opt_uz ZEROFILL { $$ = $1 | 2000; }
 ;
opt_csc: /* nil */
 | opt_csc CHAR SET STRING { emit("COLCHARSET %s", $4); free($4); }
 | opt_csc COLLATE STRING { emit("COLCOLLATE %s", $3); free($3); }
 ;

 ata_type:
 BIT opt_length { $$ = 10000 + $2; }
 | TINYINT opt_length opt_uz { $$ = 10000 + $2; }
 | SMALLINT opt_length opt_uz { $$ = 20000 + $2 + $3; }
 | MEDIUMINT opt_length opt_uz { $$ = 30000 + $2 + $3; }
 | INT opt_length opt_uz { $$ = 40000 + $2 + $3; }
 | INTEGER opt_length opt_uz { $$ = 50000 + $2 + $3; }
 | BIGINT opt_length opt_uz { $$ = 60000 + $2 + $3; }
 | REAL opt_length opt_uz { $$ = 70000 + $2 + $3; }
 | DOUBLE opt_length opt_uz { $$ = 80000 + $2 + $3; }
 | FLOAT opt_length opt_uz { $$ = 90000 + $2 + $3; }
 | DECIMAL opt_length opt_uz { $$ = 110000 + $2 + $3; }
 | DATE { $$ = 100001; }
 | TIME { $$ = 100002; }
 | TIMESTAMP { $$ = 100003; }
 | DATETIME { $$ = 100004; }
 | YEAR { $$ = 100005; }
 | CHAR opt_length opt_csc { $$ = 120000 + $2; }
 | VARCHAR '(' INTNUM ')' opt_csc { $$ = 130000 + $3; }
 | BINARY opt_length { $$ = 140000 + $2; }
 | VARBINARY '(' INTNUM ')' { $$ = 150000 + $3; }
 | TINYBLOB { $$ = 160001; }
 | BLOB { $$ = 160002; }
 | MEDIUMBLOB { $$ = 160003; }
 | LONGBLOB { $$ = 160004; }
 | TINYTEXT opt_binary opt_csc { $$ = 170000 + $2; }
 | TEXT opt_binary opt_csc { $$ = 171000 + $2; }
 | MEDIUMTEXT opt_binary opt_csc { $$ = 172000 + $2; }
 | LONGTEXT opt_binary opt_csc { $$ = 173000 + $2; }
 | ENUM '(' enum_list ')' opt_csc { $$ = 200000 + $3; }
 | SET '(' enum_list ')' opt_csc { $$ = 210000 + $3; }
 ;
enum_list: STRING { emit("ENUMVAL %s", $1); free($1); $$ = 1; }
 | enum_list ',' STRING { emit("ENUMVAL %s", $3); free($3); $$ = $1 + 1; }
 ;
create_select_statement: opt_ignore_replace opt_as select_stmt { emit("CREATESELECT %d", $1) }
 ;
opt_ignore_replace: /* nil */ { $$ = 0; }
 | IGNORE { $$ = 1; }
 | REPLACE { $$ = 2; }
 ;
  /**** set user variables ****/
stmt: set_stmt { emit("STMT"); }
 ;
set_stmt: SET set_list ;
set_list: set_expr | set_list ',' set_expr ;
set_expr:
 USERVAR COMPARISON expr { if ($2 != 4) { yyerror("bad set to @%s", $1); YYERROR; }
 emit("SET %s", $1); free($1); }
 | USERVAR ASSIGN expr { emit("SET %s", $1); free($1); }
 ;


 %%
void
emit(char *s, ...)
{
 extern yylineno;
 va_list ap;
 va_start(ap, s);
 printf("rpn: ");
 vfprintf(stdout, s, ap);
 printf("\n");
}
void
yyerror(char *s, ...)
{
 extern yylineno;
 va_list ap;
 va_start(ap, s);
 fprintf(stderr, "%d: error: ", yylineno);
 vfprintf(stderr, s, ap);
 fprintf(stderr, "\n");
}

main(int ac, char **av)
{
 extern FILE *yyin;
 if(ac > 1 && !strcmp(av[1], "-d")) {
 yydebug = 1; ac--; av++;
 }
 if(ac > 1 && (yyin = fopen(av[1], "r")) == NULL) {
 perror(av[1]);
 exit(1);
 }
 if(!yyparse())
 printf("SQL parse worked\n");
 else
 printf("SQL parse failed\n");
} /* main */
