CREATE TABLE users (
  id                INT PRIMARY KEY AUTO_INCREMENT,
  email             VARCHAR(120) NOT NULL,
  full_name         VARCHAR(80)  NOT NULL,
  city              VARCHAR(60)  NULL,          -- can be NULL / empty / spaces
  signup_at_utc     DATETIME     NOT NULL,      -- stored as UTC
  last_purchase_inr DECIMAL(10,2) NULL,          -- can be NULL (never purchased)
  last_coupon_code  VARCHAR(30)  NULL,          -- can be NULL
  is_active         TINYINT(1)   NOT NULL DEFAULT 1
);

show tables
DROP TABLE users
select * from users
  
CREATE INDEX idx_users_email       ON users(email);
CREATE INDEX idx_users_signup_at   ON users(signup_at_utc);
CREATE INDEX idx_users_city        ON users(city);

INSERT INTO users
(email, full_name, city, signup_at_utc, last_purchase_inr, last_coupon_code, is_active)
VALUES
('raj@tuf.com',              'Raj',            'Bengaluru', '2025-12-01 00:00:00',  999.00, 'WELCOME10',    1),
('test_user1@gmail.com',     'Test User One',  'Delhi',     '2025-12-05 10:00:00',  499.00, NULL,          1),
('testXuser2@gmail.com',     'Test User Two',  'Delhi',     '2025-12-10 12:00:00',  750.00, 'WELCOME_2026', 1),
('aayush@company.com',       'Aayush',         NULL,        '2025-11-30 23:59:59',  NULL,   NULL,          1),
('neha@example.com',         'Neha',           '',          '2025-12-31 23:59:59',  1500.00,'TUF_50',       1),
('mohit@gmail.com',          'Mohit',          'Mumbai',    '2026-01-01 00:00:00',  299.00, 'NEWYEAR10',    1),
('sara@tuf.com',             'Sara',           'Bengaluru', '2025-10-10 05:00:00',  2000.00,NULL,          1),
('arjun@yahoo.com',          'Arjun',          'Pune',      '2025-12-20 09:00:00',  799.00, 'FLASH_SALE',   0),
('john.doe@gmail.com',       'John Doe',       'Chennai',   '2025-12-05 18:30:00',  300.00, NULL,          1),
('jane_doe@gmail.com',       'Jane Doe',       'Chennai',   '2025-12-06 18:30:00',  1200.00,'WELCOME_BACK',1),
('support+trial@tuf.com',    'Support Trial',  'Gurugram',  '2025-12-07 10:00:00',  NULL,   NULL,          1),
('priya@outlook.com',        'Priya',          'Hyderabad', '2025-12-08 10:00:00',  999.00, 'WELCOME10',    1),
('sameer@rediffmail.com',    'Sameer',         NULL,        '2025-12-09 10:00:00',  100.00, NULL,          1),
('emptycity@demo.com',       'Empty City',     ' ',       '2025-12-10 10:00:00',  499.00, NULL,          1),
('khushi@gmail.com',         'Khushi',         'Delhi',     '2025-12-11 10:00:00',  500.00, 'REFERRAL5',    1),
('promo@demo.com',           'Promo',          'Mumbai',    '2025-12-25 00:00:00',  1499.00,'TUF_50',       1),
('intern@tuf.com',           'Intern',         'Bengaluru', '2025-12-22 20:00:00',  899.00, 'WELCOME_BACK', 1),
('hello@sample.com',         'Hello',          'Delhi',     '2025-12-02 08:00:00',  NULL,   NULL,          1);

-- 1. NULL and NOT NULL
-- select email, full_name, city from users where city <> null This is invalid, null is not used with operators
select email, full_name, city from users where city is not null
select email, full_name, city from users where city is null

-- in not null, the empty string or the blanl spaces are include so to remove that from is not null, we use NULLIIF
select email, full_name, city from users where nullif(trim(city), "") is not null

-- 2. IN and NOT IN
select email, full_name, city from users where city = 'delhi' or city = 'mumbai'
             -- instead we can write
select email, full_name, city from users where city in ('Delhi', 'Mumbai', '')
-- select email, full_name, city from users where city in ('Delhi', 'Mumbai', not null) this is wrong as we cant do the direct comparision with null because null is unknown?
select email, full_name, city from users where city in ('Delhi', 'Mumbai') or city is not null


select email, full_name, city from users where city not in ('Delhi', 'Mumbai')

-- 3. BETWEEN AND NOT between
select email, full_name, signup_at_utc from users where signup_at_utc >= '2025-12-01 00:00:00' and signup_at_utc < '2026:01:01 00:00:00'
select email, full_name, signup_at_utc from users where signup_at_utc >= '2025-12-01' and signup_at_utc <= '2025:12:31'
-- in above case 2025-12-31 23:59:59 will bot be included because we are not mentioning the time and by default assumes at time 00:00:00 so its better to write like this.
select email, full_name, signup_at_utc from users where signup_at_utc >= '2025-12-01' and signup_at_utc <= '2026:01:01'

select email, full_name, signup_at_utc from users where signup_at_utc between '2025-12-01' and '2026:01:01'
select email, full_name, signup_at_utc from users where signup_at_utc not between '2025-12-01' and '2026:01:01'

-- The output of this data is given on the basis of UTC time zone, ist is 5 hours 30 min before than it utc so we will have to do - 5 hours 30 minutes
select email, full_name, signup_at_utc from users where signup_at_utc not between '2025-11-30 18:30:00' and '2025-12-31 18:30:00' -- this will work in itc timezone_hour

-- 4. LIKE AND NOT LIKE
select email, full_name from users where email like '%@tuf.com' -- the % means any number of char allowed before tuf.com and we cant use = here because we dont know what specific we wanna search 
select email, full_name from users where email not like '%@tuf.com'
select email, full_name from users where email like 'r%@tuf.com'

select email, full_name from users where email like 'neh_@example.co_'
select email, full_name from users where email like 'test_user%' -- here _ means can come anything in place of that
select email, full_name from users where email like 'test\_user%' -- here \_ means only email who have test_user format will be inluded