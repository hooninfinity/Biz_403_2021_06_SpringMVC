use startea;

CREATE TABLE `tbl_event` (
    `event_code`    BIGINT NOT NULL,
    `event_date`    VARCHAR(30) NULL,
    `event_user`    VARCHAR(20) NULL,
    `event_text`    VARCHAR(200)    NULL
);

CREATE TABLE `tbl_category` (
    `category_seq`  BIGINT NOT NULL,
    `category_base` BIGINT NULL,
    `category_menu` BIGINT NULL
);

CREATE TABLE `tbl_cmenu` (
    `menu_seq`  BIGINT NOT NULL,
    `user_id`   VARCHAR(20) NULL,
    `menu_code` BIGINT NULL,
    `menu_title`    VARCHAR(50) NULL,
    `menu_option`   VARCHAR(200)    NULL,
    `menu_img`  VARCHAR(1000)   NULL
);

CREATE TABLE `tbl_board` (
    `board_code`    CHAR(5) NULL,
    `user_id`   VARCHAR(20) NULL,
    `board_title`   VARCHAR(50) NULL,
    `board_content` VARCHAR(1000)   NULL,
    `board_like`    INT NULL,
    `board_date`    VARCHAR(10) NULL,
    `board_time`    VARCHAR(8)  NULL,
    `board_img` VARCHAR(1000)   NULL
);

CREATE TABLE `tbl_notice` (
    `nt_code`   CHAR(5) NULL,
    `nt_title`  VARCHAR(50) NULL,
    `nt_content`    VARCHAR(1000)   NULL,
    `nt_date`   CHAR(10)    NULL,
    `nt_time`   CHAR(8) NULL,
    `nt_img`    VARCHAR(1000)   NULL
);

CREATE TABLE `tbl_user` (
    `user_id`   VARCHAR(20) NULL,
    `user_password` VARCHAR(50) NULL,
    `user_email`    VARCHAR(50) NULL
);

ALTER TABLE `tbl_event` ADD CONSTRAINT `PK_TBL_EVENT` PRIMARY KEY (
    `event_code`
);

ALTER TABLE `tbl_category` ADD CONSTRAINT `PK_TBL_CATEGORY` PRIMARY KEY (
    `category_seq`
);

ALTER TABLE `tbl_cmenu` ADD CONSTRAINT `PK_TBL_CMENU` PRIMARY KEY (
    `menu_seq`,
    `user_id`
);

ALTER TABLE `tbl_board` ADD CONSTRAINT `PK_TBL_BOARD` PRIMARY KEY (
    `board_code`,
    `user_id`
);

ALTER TABLE `tbl_notice` ADD CONSTRAINT `PK_TBL_NOTICE` PRIMARY KEY (
    `nt_code`
);

ALTER TABLE `tbl_user` ADD CONSTRAINT `PK_TBL_USER` PRIMARY KEY (
    `user_id`
);

ALTER TABLE `tbl_cmenu`ADD CONSTRAINT `FK_tbl_user_TO_tbl_cmenu_1`FOREIGN KEY (`user_id`
)REFERENCES `tbl_user`(`user_id`);

ALTER TABLE `tbl_board` ADD CONSTRAINT `FK_tbl_user_TO_tbl_board_1` FOREIGN KEY (`user_id`
)REFERENCES `tbl_user` (`user_id`);
