CREATE TABLE IF NOT EXISTS t_user(
	f_id INTEGER PRIMARY KEY AUTOINCREMENT, 																-- 自增id
	f_user_id BIGINT(20) NOT NULL UNIQUE, 																	-- 用户id
	f_username VARCHAR(64) NOT NULL,																				-- 用户名
	f_password  VARCHAR(64) DEFAULT NULL,																		-- 密码
	f_faceid VARCHAR(128) NOT NULL DEFAULT '0',															-- 头像id
	f_nickname VARCHAR(64) NOT NULL,																				-- 昵称
	f_gender VARCHAR(2) DEFAULT '男',																				-- 性别
	f_birthday  BIGINT(20) DEFAULT 19900101,																-- 生日
	f_signature  VARCHAR(256) DEFAULT NULL,																	-- 个性签名
	f_address  VARCHAR(256) DEFAULT NULL,																		-- 地址
	f_phonenumber  VARCHAR(64) DEFAULT NULL,																-- 电话号码
	f_mail  VARCHAR(256) DEFAULT NULL,																			-- 邮箱
	f_register_time TIMESTAMP NOT NULL DEFAULT (datetime('now','localtime')),-- 注册时间
	f_owner_id  BIGINT(20) DEFAULT 0,																				 -- 群账号的群主userid
	f_remark  VARCHAR(64) DEFAULT NULL,																			 -- 备注
	f_update_time TIMESTAMP NOT NULL DEFAULT (datetime('now','localtime')),	 -- 更新时间
	f_teaminfo BLOB DEFAULT NULL																						 -- 好友分组信息
);

CREATE TABLE IF NOT EXISTS  t_user_relationship(
	f_id INTEGER PRIMARY KEY AUTOINCREMENT,																		-- 自增id
	f_user_id1  BIGINT(20) NOT NULL,																					-- 第一个用户id
	f_user_id2  BIGINT(20) NOT NULL,																					-- 第二个用户id
	f_user1_teamname VARCHAR(32) NOT NULL DEFAULT '我的好友',									-- 用户2在用户1的好友分组名称
	f_user1_markname VARCHAR(32),																							-- 用户2在用户1的备注名称
	f_user2_teamname VARCHAR(32) NOT NULL DEFAULT '我的好友',									-- 用户1在用户2的好友分组名称
	f_user2_markname VARCHAR(32),																							-- 用户1在用户2的备注名称					
	f_update_time  TIMESTAMP NOT NULL DEFAULT (datetime('now','localtime')),  -- 更新时间
	f_remark  VARCHAR(64) DEFAULT NULL																				-- 备注
);

CREATE TABLE IF NOT EXISTS  t_chatmsg(
	f_id INTEGER PRIMARY KEY AUTOINCREMENT,																		-- 主键id
	f_senderid  BIGINT(20) NOT NULL,																					-- 发送方id
	f_targetid  BIGINT(20) NOT NULL,																					-- 接收方id
	f_msgcontent  BLOB NOT NULL,																							-- 聊天消息
	f_create_time  TIMESTAMP NOT NULL DEFAULT (datetime('now','localtime')),	-- 创建时间
	f_remark  VARCHAR(64) DEFAULT NULL																				-- 备注
);