local MYSQL = require "common.mysql"

-- enum series of sql you want to execute.
local sql= { 
    [[
        CREATE DATABASE IF NOT EXISTS gserver DEFAULT CHARACTER SET utf8;
    ]],

    [[
        USE gserver;
    ]],

    [[
    CREATE TABLE IF NOT EXISTS id(
        `highid1` int(10) unsigned NOT NULL default 1 COMMENT 'high id 1',
        `highid2` int(10) unsigned NOT NULL default 1 COMMENT 'high id 2',
        `highid3` int(10) unsigned NOT NULL default 1 COMMENT 'high id 3',
        `highid4` int(10) unsigned NOT NULL default 1 COMMENT 'high id 4',
        `highid5` int(10) unsigned NOT NULL default 1 COMMENT 'high id 5',
        `highid6` int(10) unsigned NOT NULL default 1 COMMENT 'high id 6',
        `highid7` int(10) unsigned NOT NULL default 1 COMMENT 'high id 7',
        `highid8` int(10) unsigned NOT NULL default 1 COMMENT 'high id 8',
        `highid9` int(10) unsigned NOT NULL default 1 COMMENT 'high id 9'
    )ENGINE=MYISAM default character set=utf8;
    ]],

    -- other sql statement.
};

-- create mysql and connect it.
local function mysql_init()
    local mysql = MYSQL:new();
    mysql:Init(1, 1);
    mysql:Connect("127.0.0.1", 3306, "root", "123456", "test", "utf8");
    return mysql;
end

local function create_sql(mysql, sql)
    mysql:Sync_update(sql, 0);
end

-- create table.
local mysql = mysql_init();
for i = 1, #sql do
    create_sql(mysql, sql[i]);
end
mysql = nil;