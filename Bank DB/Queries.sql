select * from Session
select * from IFSC
select * from User_Details
select * from UserAccount
select * from Beneficiary
select * from Transfer_Details_Withdraw
select * from Transfer_Details_Deposit
select * from Admin

select * from Transfer_Details_All
update UserAccount set Balance = 1000000 where USER_ID = 'Didu_78124'

exec sp_SessionLogin 1000008
exec sp_SessionLogout 1000005

