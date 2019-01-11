-- 공원 좋아요
DROP TABLE IF EXISTS HEARTS RESTRICT;

-- 게시판
DROP TABLE IF EXISTS BOARD RESTRICT;

-- 댓글
DROP TABLE IF EXISTS COMMENT RESTRICT;

-- 회원
DROP TABLE IF EXISTS USER RESTRICT;

-- 권한
DROP TABLE IF EXISTS AUTHORITIES RESTRICT;

-- 공원 좋아요
CREATE TABLE `HEARTS` (
  `H_NO`      INT         NOT NULL COMMENT '번호', -- 번호
  `park_num`  int         NOT NULL COMMENT '공원번호', -- 공원번호
  `park_name` VARCHAR(20) NOT NULL COMMENT '공원이름', -- 공원이름
  `ID`        VARCHAR(20) NOT NULL COMMENT '아이디', -- 아이디
  `NAME`      VARCHAR(10) NOT NULL COMMENT '닉네임', -- 닉네임
  `SEQ`       INT         NULL     COMMENT '번호2' -- 번호2
)
COMMENT '공원 좋아요';

-- 공원 좋아요
ALTER TABLE `HEARTS`
  ADD CONSTRAINT `PK_HEARTS` -- 공원 좋아요 기본키
    PRIMARY KEY (
      `H_NO` -- 번호
    );

ALTER TABLE `HEARTS`
  MODIFY COLUMN `H_NO` INT NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 게시판
CREATE TABLE `BOARD` (
  `b_no`      INT         NOT NULL COMMENT '글번호', -- 글번호
  `b_title`   VARCHAR(20) NOT NULL COMMENT '제목', -- 제목
  `b_content` VARCHAR(50) NOT NULL COMMENT '내용', -- 내용
  `b_view`    INT         NOT NULL DEFAULT 0 COMMENT '조회수', -- 조회수
  `b_up`      int         NOT NULL DEFAULT 0 COMMENT '추천', -- 추천
  `b_regdate` DATETIME    NOT NULL COMMENT '작성일자', -- 작성일자
  `ID`        VARCHAR(20) NOT NULL COMMENT '아이디', -- 아이디
  `NAME`      VARCHAR(10) NOT NULL COMMENT '닉네임', -- 닉네임
  `SEQ`       INT         NULL     COMMENT '번호' -- 번호
)
COMMENT '게시판';

-- 게시판
ALTER TABLE `BOARD`
  ADD CONSTRAINT `PK_BOARD` -- 게시판 기본키
    PRIMARY KEY (
      `b_no` -- 글번호
    );

ALTER TABLE `BOARD`
  MODIFY COLUMN `b_no` INT NOT NULL AUTO_INCREMENT COMMENT '글번호';

-- 댓글
CREATE TABLE `COMMENT` (
  `c_no`      INT         NOT NULL COMMENT '댓글 번호', -- 댓글 번호
  `c_content` VARCHAR(20) NOT NULL COMMENT '댓글 내용', -- 댓글 내용
  `c_regdate` DATETIME    NOT NULL COMMENT '댓글 작성일', -- 댓글 작성일
  `b_no`      INT         NOT NULL COMMENT '글번호', -- 글번호
  `ID`        VARCHAR(20) NOT NULL COMMENT '아이디', -- 아이디
  `NAME`      VARCHAR(10) NOT NULL COMMENT '닉네임', -- 닉네임
  `SEQ`       INT         NULL     COMMENT '번호' -- 번호
)
COMMENT '댓글';

-- 댓글
ALTER TABLE `COMMENT`
  ADD CONSTRAINT `PK_COMMENT` -- 댓글 기본키
    PRIMARY KEY (
      `c_no` -- 댓글 번호
    );

ALTER TABLE `COMMENT`
  MODIFY COLUMN `c_no` INT NOT NULL AUTO_INCREMENT COMMENT '댓글 번호';

-- 멤버
CREATE TABLE `USER` (
  `SEQ`      INT          NOT NULL COMMENT '번호', -- 번호
  `ID`       VARCHAR(20)  NOT NULL COMMENT '아이디', -- 아이디
  `NAME`     VARCHAR(10)  NOT NULL COMMENT '닉네임', -- 닉네임
  `PWD`      VARCHAR(100) NOT NULL COMMENT '비밀번호', -- 비밀번호
  `ENABLED`  INT          NULL     COMMENT '사용여부 ', -- 사용여부 
  `AUTH_SEQ` INT          NULL     COMMENT '회원번호' -- 회원번호
)
COMMENT '멤버';

-- 멤버
ALTER TABLE `USER`
  ADD CONSTRAINT `PK_USER` -- 멤버 기본키
    PRIMARY KEY (
      `SEQ` -- 번호
    );

ALTER TABLE `USER`
  MODIFY COLUMN `SEQ` INT NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 권한
CREATE TABLE `AUTHORITIES` (
  `SEQ`       INT         NOT NULL COMMENT '회원번호', -- 회원번호
  `AUTHORITY` VARCHAR(30) NOT NULL COMMENT '권한' -- 권한
)
COMMENT '권한';

-- 권한
ALTER TABLE `AUTHORITIES`
  ADD CONSTRAINT `PK_AUTHORITIES` -- 권한 기본키
    PRIMARY KEY (
      `SEQ` -- 회원번호
    );

-- 공원 좋아요
ALTER TABLE `HEARTS`
  ADD CONSTRAINT `FK_USER_TO_HEARTS` -- 멤버 -> 공원 좋아요
    FOREIGN KEY (
      `SEQ` -- 번호2
    )
    REFERENCES `USER` ( -- 멤버
      `SEQ` -- 번호
    )
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- 게시판
ALTER TABLE `BOARD`
  ADD CONSTRAINT `FK_USER_TO_BOARD` -- 멤버 -> 게시판
    FOREIGN KEY (
      `SEQ` -- 번호
    )
    REFERENCES `USER` ( -- 멤버
      `SEQ` -- 번호
    )
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- 댓글
ALTER TABLE `COMMENT`
  ADD CONSTRAINT `FK_BOARD_TO_COMMENT` -- 게시판 -> 댓글
    FOREIGN KEY (
      `b_no` -- 글번호
    )
    REFERENCES `BOARD` ( -- 게시판
      `b_no` -- 글번호
    )
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- 댓글
ALTER TABLE `COMMENT`
  ADD CONSTRAINT `FK_USER_TO_COMMENT` -- 멤버 -> 댓글
    FOREIGN KEY (
      `SEQ` -- 번호
    )
    REFERENCES `USER` ( -- 멤버
      `SEQ` -- 번호
    )
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- 멤버
ALTER TABLE `USER`
  ADD CONSTRAINT `FK_AUTHORITIES_TO_USER` -- 권한 -> 멤버
    FOREIGN KEY (
      `AUTH_SEQ` -- 회원번호
    )
    REFERENCES `AUTHORITIES` ( -- 권한
      `SEQ` -- 회원번호
    );
 
 INSERT INTO AUTHORITIES (seq, AUTHORITY) VALUES (1,"ROLE_USER");