-- Active: 1711637366415@@10.236.78.204@2881@db202436
-- 客户信息
create table users (
    user_id1 varchar(100) not null, -- 用户id
    username varchar(100) not null, -- 用户名
    password1 varchar(30) not null, -- 用户密码 
    user_gander char(1) not null,   -- 用户性别
    user_idcard varchar(30),        -- 客户身份证号
    primary key(user_id1)           -- 主键客户id
);


-- 民宿信息
create table Homestay(
    Home_name varchar(20) not null, -- 民宿名称
    address varchar(50),            -- 民宿地址
    Homeroom_left integer(2),       -- 民宿剩余房间
    Home_contact char(11),          -- 民宿联系方式
    primary key(Home_name)          -- 主键为民宿名称
)

-- 房间信息
create table roominfo(
    Home_name varchar(20) not null, -- 民宿名称，非空
    room_id integer(4) not null,    -- 房间ID，非空
    area_ integer(2),               -- 房间面积
    room_type varchar(50),          -- 房间类型
    room_price integer(4) not null, -- 房间价格，非空
    is_book integer(1),             -- 房间是否被预定
    primary key (Home_name ,room_id), -- 主键为民宿名称和房间ID组合
    foreign key (Home_name) references Homestay(Home_name) -- 外键关联民宿表
)

-- 订单信息
create table reservation (
    reservation_id varchar(50) not null,    -- 订单ID，非空
    amount integer(4) not null,             -- 订单金额，非空
    Home_name varchar(20) not null,         -- 民宿名称
    room_id integer(4) not null,            -- 房间id
    in_date date,                           -- 入住日期
    out_date date,                          -- 离店日期
    total_price integer(5),                 -- 总花费
    room_type varchar(50),                  -- 房间类型
    comment varchar(1000),                  -- 评价（可删）
    primary key (reservation_id),           -- 主键为订单ID
    Foreign Key (Home_name, room_id) REFERENCES roominfo(Home_name, room_id) -- 外键关联房间表（xzjer图需要改应该）
);

-- 评价信息
create table evaluation(
    eva_id varchar(10) not null,    -- 评价ID，非空
    evaor_name varchar(20),         -- 评价者用户名
    eva_time date,                  -- 评价时间
    comment_ varchar(1000) not null,      -- 评论，非空
    primary key(eva_id)             -- 主键为评价ID
)

-- 员工
create table worker (
    Home_name varchar(20) not null, -- 民宿名称，非空
    job_id char(3) not null,        -- 员工工号，非空
    worker_name varchar(20),        -- 员工姓名
    age int,                        -- 员工年龄
    wage int,                       -- 员工工资
    primary key (job_id),           -- 主键为员工工号
    foreign key (Home_name) references Homestay(Home_name) -- 外键关联民宿表
)

-- 办理人信息
create table transactor (
    Home_name varchar(20) not null, -- 民宿名称，非空
    job_id char(3) not null,        -- 员工工号，非空
    transaction_date datetime,      -- 办理日期
    transactor_contact int,         -- 办理人联系方式
    foreign key(Home_name) references Homestay(Home_name), -- 外键关联民宿表
    foreign key(job_id) references worker(job_id) -- 外键关联员工表
)