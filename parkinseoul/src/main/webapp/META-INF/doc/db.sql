-- 공원 좋아요
DROP TABLE IF EXISTS HEARTS RESTRICT;

-- 게시물 좋아요
DROP TABLE IF EXISTS BOARDUP RESTRICT;

-- 댓글
DROP TABLE IF EXISTS COMMENT RESTRICT;

-- 게시판
DROP TABLE IF EXISTS BOARD RESTRICT;

-- 회원
DROP TABLE IF EXISTS USER RESTRICT;

-- 권한
DROP TABLE IF EXISTS AUTHORITIES RESTRICT;

-- 공원 좋아요
CREATE TABLE `HEARTS` (
  `H_NO`      INT         NOT NULL COMMENT '공원좋아요 번호', -- 공원좋아요 번호
  `park_num`  int         NOT NULL COMMENT '공원번호', -- 공원번호
  `park_name` VARCHAR(20) NOT NULL COMMENT '공원이름', -- 공원이름
  `ID`        VARCHAR(20) NOT NULL COMMENT '아이디', -- 아이디
  `NAME`      VARCHAR(10) NOT NULL COMMENT '닉네임', -- 닉네임
  `SEQ`       INT         NULL     COMMENT '회원번호' -- 회원번호
)
COMMENT '공원 좋아요';

-- 공원 좋아요
ALTER TABLE `HEARTS`
  ADD CONSTRAINT `PK_HEARTS` -- 공원 좋아요 기본키
    PRIMARY KEY (
      `H_NO` -- 공원좋아요 번호
    );

ALTER TABLE `HEARTS`
  MODIFY COLUMN `H_NO` INT NOT NULL AUTO_INCREMENT COMMENT '공원좋아요 번호';

-- 게시판
CREATE TABLE `BOARD` (
  `b_no`      INT            NOT NULL COMMENT '글번호', -- 글번호
  `b_title`   VARCHAR(20)    NOT NULL COMMENT '제목', -- 제목
  `b_content` VARCHAR(20000) NOT NULL COMMENT '내용', -- 내용
  `b_view`    INT            NOT NULL DEFAULT 0 COMMENT '조회수', -- 조회수
  `b_regdate` DATETIME       NOT NULL COMMENT '작성일자', -- 작성일자
  `ID`        VARCHAR(20)    NOT NULL COMMENT '아이디', -- 아이디
  `NAME`      VARCHAR(10)    NOT NULL COMMENT '닉네임', -- 닉네임
  `SEQ`       INT            NULL     COMMENT '회원번호' -- 회원번호
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
CREATE TABLE `REPLY` (
  `r_no`      INT         NOT NULL COMMENT '댓글 번호', -- 댓글 번호
  `r_content` VARCHAR(20) NOT NULL COMMENT '댓글 내용', -- 댓글 내용
  `r_regdate` DATETIME    NOT NULL COMMENT '댓글 작성일', -- 댓글 작성일
  `b_no`      INT         NOT NULL COMMENT '글번호', -- 글번호
  `ID`        VARCHAR(20) NOT NULL COMMENT '아이디', -- 아이디
  `NAME`      VARCHAR(10) NOT NULL COMMENT '닉네임', -- 닉네임
  `SEQ`       INT         NULL     COMMENT '회원번호' -- 회원번호
)
COMMENT '댓글';

-- 댓글
ALTER TABLE `REPLY`
  ADD CONSTRAINT `PK_REPLY` -- 댓글 기본키
    PRIMARY KEY (
      `r_no` -- 댓글 번호
    );

ALTER TABLE `REPLY`
  MODIFY COLUMN `r_no` INT NOT NULL AUTO_INCREMENT COMMENT '댓글 번호';

-- 멤버
CREATE TABLE `USER` (
  `SEQ`     INT          NOT NULL COMMENT '회원번호', -- 회원번호
  `ID`      VARCHAR(50)  NOT NULL COMMENT '아이디', -- 아이디
  `NAME`    VARCHAR(10)  NOT NULL COMMENT '닉네임', -- 닉네임
  `PWD`     VARCHAR(100) NOT NULL COMMENT '비밀번호', -- 비밀번호
  `ENABLED` INT          NULL     COMMENT '사용여부 ', -- 사용여부 
  `A_SEQ`   INT          NULL     COMMENT '권한번호' -- 권한번호
)
COMMENT '멤버';

-- 멤버
ALTER TABLE `USER`
  ADD CONSTRAINT `PK_USER` -- 멤버 기본키
    PRIMARY KEY (
      `SEQ` -- 회원번호
    );

ALTER TABLE `USER`
  MODIFY COLUMN `SEQ` INT NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 권한
CREATE TABLE `AUTHORITIES` (
  `A_SEQ`     INT         NOT NULL COMMENT '권한번호', -- 권한번호
  `AUTHORITY` VARCHAR(30) NOT NULL COMMENT '권한' -- 권한
)
COMMENT '권한';

-- 권한
ALTER TABLE `AUTHORITIES`
  ADD CONSTRAINT `PK_AUTHORITIES` -- 권한 기본키
    PRIMARY KEY (
      `A_SEQ` -- 권한번호
    );

-- 게시물 좋아요
CREATE TABLE `BOARDUP` (
  `SEQ`  INT NOT NULL COMMENT '회원 번호', -- 회원 번호
  `b_no` INT NOT NULL COMMENT '글번호' -- 글번호
)
COMMENT '게시물 좋아요';

-- 게시물 좋아요
ALTER TABLE `BOARDUP`
  ADD CONSTRAINT `PK_BOARDUP` -- 게시물 좋아요 기본키
    PRIMARY KEY (
      `SEQ`,  -- 회원 번호
      `b_no`  -- 글번호
    );

-- 공원 좋아요
ALTER TABLE `HEARTS`
  ADD CONSTRAINT `FK_USER_TO_HEARTS` -- 멤버 -> 공원 좋아요
    FOREIGN KEY (
      `SEQ` -- 회원번호
    )
    REFERENCES `USER` ( -- 멤버
      `SEQ` -- 회원번호
    )
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- 게시판
ALTER TABLE `BOARD`
  ADD CONSTRAINT `FK_USER_TO_BOARD` -- 멤버 -> 게시판
    FOREIGN KEY (
      `SEQ` -- 회원번호
    )
    REFERENCES `USER` ( -- 멤버
      `SEQ` -- 회원번호
    )
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- 댓글
ALTER TABLE `REPLY`
  ADD CONSTRAINT `FK_BOARD_TO_REPLY` -- 게시판 -> 댓글
    FOREIGN KEY (
      `b_no` -- 글번호
    )
    REFERENCES `BOARD` ( -- 게시판
      `b_no` -- 글번호
    )
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- 댓글
ALTER TABLE `REPLY`
  ADD CONSTRAINT `FK_USER_TO_REPLY` -- 멤버 -> 댓글
    FOREIGN KEY (
      `SEQ` -- 회원번호
    )
    REFERENCES `USER` ( -- 멤버
      `SEQ` -- 회원번호
    )
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- 멤버
ALTER TABLE `USER`
  ADD CONSTRAINT `FK_AUTHORITIES_TO_USER` -- 권한 -> 멤버
    FOREIGN KEY (
      `A_SEQ` -- 권한번호
    )
    REFERENCES `AUTHORITIES` ( -- 권한
      `A_SEQ` -- 권한번호
    );

-- 게시물 좋아요
ALTER TABLE `BOARDUP`
  ADD CONSTRAINT `FK_USER_TO_BOARDUP` -- 멤버 -> 게시물 좋아요
    FOREIGN KEY (
      `SEQ` -- 회원 번호
    )
    REFERENCES `USER` ( -- 멤버
      `SEQ` -- 회원번호
    )
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- 게시물 좋아요
ALTER TABLE `BOARDUP`
  ADD CONSTRAINT `FK_BOARD_TO_BOARDUP` -- 게시판 -> 게시물 좋아요
    FOREIGN KEY (
      `b_no` -- 글번호
    )
    REFERENCES `BOARD` ( -- 게시판
      `b_no` -- 글번호
    )
    ON DELETE CASCADE
    ON UPDATE CASCADE;


INSERT INTO AUTHORITIES (a_seq, AUTHORITY) VALUES (1,"ROLE_USER");
commit;