create database Bank
use Bank

--FIRST TABLE - IFSC
CREATE TABLE [IFSC] (
	Branch_Name varchar(100) NOT NULL primary key,
	IFSC_code varchar(11) NOT NULL UNIQUE,
)
--SECOND TABLE - User_Details
CREATE TABLE [User_Details] (
	Acc_No int NOT NULL primary key identity(1000001,1),
	Ref_ID varchar(15),
	Title varchar(5) NOT NULL,
	Fname varchar(30) NOT NULL,
	Mname varchar(50),
	Lname varchar(50) NOT NULL,
	MobNo bigint NOT NULL,
	Email varchar(50) NOT NULL,
	Aadhar_No bigint NOT NULL,
	DOB date NOT NULL,
	AddressL1 varchar(100) NOT NULL,
	AddressL2 varchar(100) NOT NULL,
	Landmark varchar(100),
	City varchar(100) NOT NULL,
	State varchar(100) NOT NULL,
	Pincode int NOT NULL,
	P_Address1 varchar(100) NOT NULL,
	P_Address2 varchar(100) NOT NULL,
	P_Landmark varchar(100),
	P_City varchar(100) NOT NULL,
	P_State varchar(100) NOT NULL,
	P_Pincode int NOT NULL,
	OccupationType varchar(100) NOT NULL,
	Src_Income varchar(100) NOT NULL,
	GrossAnnual_Income money NOT NULL,
	DebitCard varchar(5) NOT NULL DEFAULT 'Yes',
	NetBanking varchar(5) NOT NULL DEFAULT 'No',
	AccountType varchar(20) NOT NULL,
	Branch_Name varchar(100) NOT NULL references IFSC(Branch_Name),
	Status varchar(25) NOT NULL DEFAULT 'Waiting for Approval',
)
--THIRD TABLE - UserAccount
CREATE TABLE [UserAccount] (
	Acc_No int NOT NULL UNIQUE references User_Details(Acc_No),
	User_Id varchar(50) NOT NULL primary key ,
	Login_Password varchar(50) ,
	Transaction_Password varchar(50) NOT NULL ,
	Balance money NOT NULL DEFAULT 0,
	Acc_Status varchar(20) NOT NULL DEFAULT 'Active',
	Login_Attempts int default 0
)
update UserAccount set Login_Password='hello1234' where USER_ID='Anha_55322'
--FOURTH TABLE - Beneficiary
CREATE TABLE [Beneficiary] (
	Ben_AccNo int NOT NULL primary key,
	User_AccNo int NOT NULL references User_Details(Acc_No),
	Ben_Name varchar(100) NOT NULL,
	Ben_NickName varchar(100) NOT NULL,
	Ben_Banktype varchar(100) NOT NULL,
	IFSC_code varchar(100) NOT NULL,
)
--FIFTH TABLE - Transfer_Details_Withdraw
CREATE TABLE [Transfer_Details_Withdraw] (
    TransactionID varchar(50) primary key,
    Acc_No int NOT NULL references User_Details(Acc_No),
    Ben_AccNo integer NOT NULL,
    Transaction_Type varchar(6) NOT NULL,
    Transaction_date datetime NOT NULL default getDate(),
    Maturity_Ins datetime,
    Remark varchar(100) not null,
    Amount money NOT NULL,
    status varchar(20) NOT NULL default 'Pending',
    Balance money
)
GO
--SIXTH TABLE - Transfer_Details_Deposit
CREATE TABLE [Transfer_Details_Deposit] (
    TransactionID varchar(50) primary key,
    Acc_No int NOT NULL,
    Ben_AccNo integer NOT NULL  references User_Details(Acc_No),
    Transaction_Type varchar(6) NOT NULL,
    Transaction_date datetime NOT NULL default getdate(),
    Maturity_Ins datetime,
    Remark varchar(100) not null,
    Amount money NOT NULL,
    status varchar(20) NOT NULL default 'Pending',
    Balance money
)
GO
--------------------NEW TABLE------------------------------
CREATE TABLE [Transfer_Details_All] (
    Id int identity(1,1) primary key,
    TransactionID varchar(50) ,
    Acc_No int NOT NULL ,
    Ben_AccNo integer NOT NULL,
    Transaction_Type varchar(6) NOT NULL,
    Transaction_date datetime NOT NULL default getDate(),
    Maturity_Ins datetime,
    Remark varchar(100) not null,
    Withdraw money,
    Deposit money,
    status varchar(20) NOT NULL default 'Pending',
    Balance money
)
GO


--SEVENTH TABLE - Admin
CREATE TABLE [Admin] (
    PSNo int identity(100000,10) NOT NULL primary key,
    AdminName varchar(50) NOT NULL,
    Admin_Password varchar(50) NOT NULL,
    Contact_No bigint NOT NULL,
    AdminEmail varchar(50) NOT NULL,
    Acc_Status varchar(20) NOT NULL DEFAULT 'Active',
    Login_Attempts int default 0
)


--Login stored procedure for Admin
create or alter proc sp_Admin_Login(@PSNo int,@Admin_password varchar(50))
as
begin
    update Admin set Login_Attempts=Login_Attempts+1 where PSNo=@PSNo;
    declare @count int;
    set @count = (select Login_Attempts from Admin where PSNo=@PSNo);
    if @count>3
    begin
        update Admin set Acc_Status='Inactive' where PSNo=@PSNo;
    end
    select * from Admin where PSNo=@PSNo and Admin_Password=@Admin_password and Acc_Status='Active';
end
exec sp_Admin_Logout 100000


--Logout Stored Procedure
create proc sp_Admin_Logout(@PSNo int)
as
begin
    update Admin set Login_Attempts=0 where PSNo=@PSNo;
end



---- ADMIN -Resetting the password/ Changing the password/ Changing the INACTIVE status of Account
create proc sp_Admin_Reset_Password(@PSNo int, @Admin_Pass varchar(50))
as
begin
    update Admin set Admin_Password=@Admin_Pass,Login_Attempts=0,Acc_Status='Active' where PSNo=@PSNo
end

--Session Table--
CREATE TABLE [Session](
    id int identity primary key,
    Acc_No int NOT NULL references User_Details(Acc_No),
    Session_Login datetime default getdate(),
    Session_Logout datetime default getdate()
)

--Session Login----
create or alter proc sp_SessionLogin(@Acc_No int)
as
begin
insert into Session (Acc_No) values (@Acc_No)
end

--Session Logout--
create or alter proc sp_SessionLogout(@Acc_No int)
as
begin
    update Session set Session_Logout=GETDATE() where Acc_No=@Acc_No
end

--Login Stored Procedure
create proc sp_Login(@user_id varchar(50),@password varchar(50))
as
begin
	update UserAccount set Login_Attempts=Login_Attempts+1 where User_ID=@user_id;
	declare @count int;
	set @count = (select Login_Attempts from UserAccount where User_ID=@user_id);
	if @count>3
	begin
		update UserAccount set Acc_Status='Inactive' where User_ID=@user_id;
	end
	select * from UserAccount where User_ID=@user_id and Login_Password=@password and Acc_Status='Active';
end

--Logout Stored Procedure
create proc sp_Logout(@user_id varchar(50))
as
begin
	update UserAccount set Login_Attempts=0 where User_ID=@user_id;
end

--Resetting the password/ Changing the password/ Changing the INACTIVE status of Account
create proc sp_Reset_Password(@Acc_No int, @Login_Pass nvarchar(50), @Transaction_Pass nvarchar(50))
as
begin
	
	update UserAccount set Login_Password=@Login_Pass, Transaction_Password=@Transaction_Pass,Login_Attempts=0,Acc_Status='Active' where Acc_No=@Acc_No
end


--Resetting the password while user is aware of user_id
create proc sp_Reset_Pass_ByUserID (@User_id varchar(50), @Login_Pass varchar(50), @Transaction_Pass varchar(50))
as
begin
	update UserAccount set Login_Password=@Login_Pass, Transaction_Password=@Transaction_Pass,Login_Attempts=0,Acc_Status='Active' where User_Id=@User_id
end

--Stored Proceudre to grenerate Ref_ID
create proc sp_Generate_RefID (@Acc_No int) 
as
begin
	update User_Details set Ref_ID=Concat(Substring(State,1,2),Substring(Fname,1,4),Substring(Convert(varchar,Aadhar_No),5,8)) where Acc_No=@Acc_No;
end


--Stored Procedure when Admin approves the Account_User
create or alter proc sp_Admin_Approve (@Acc_No int)
as
begin
    declare @UserID varchar(50);
    declare @Login_Password nvarchar(200);
    declare @Transaction_Password nvarchar(200);
    set @Login_Password = (select Concat(Substring(State,3,2),Substring(Fname,1,2),'@',Substring(Convert(varchar,Aadhar_No),1,5)) from User_Details where Acc_No=@Acc_No);
    set @Transaction_Password = (select Concat(Substring(Convert(varchar,Aadhar_No),3,5),'@',Substring(Fname,2,1),Substring(State,2,2)) from User_Details where Acc_No=@Acc_No);
    set @UserID= (select Concat(Substring(Fname,1,2),Substring(State,3,2),'_',Substring(Convert(varchar,Aadhar_No),5,5)) from User_Details where Acc_No=@Acc_No);

    update User_Details set Status='Approved' where Acc_No=@Acc_No;
    insert into UserAccount values (@Acc_No,@UserID,@Login_Password,@Transaction_Password,1000,'Active',0) 
end
--Stored Procedure when Admin rejects the Account_User
create proc sp_Admin_Reject (@Acc_No int)
as
begin
	update User_Details set Status='Rejected' where Acc_No=@Acc_No;
end

create proc sp_Transfer_Updates (@Acc_No int,@Ben_AccNo int,@Tran_type varchar(6),@Tran_date datetime,@Maturity datetime,@Remark varchar(100),@Amount money)
as
begin
	declare @Tran_ID varchar(50);
	set @Tran_ID = Concat('TRAN',Substring(Convert(varchar,Rand()),3,6))
	insert into Transfer_Details_Withdraw(TransactionID,Acc_No,Ben_AccNo,Transaction_Type,Transaction_date,Maturity_Ins,Remark,Amount) values (@Tran_ID,@Acc_No,@Ben_AccNo,@Tran_type,@Tran_date,@Maturity,@Remark,@Amount)
	insert into Transfer_Details_Deposit(TransactionID,Acc_No,Ben_AccNo,Transaction_Type,Transaction_date,Maturity_Ins,Remark,Amount) values (@Tran_ID,@Ben_AccNo,@Acc_No,@Tran_type,@Tran_date,@Maturity,@Remark,@Amount)
	select @Tran_ID
end

--HELP--Updation of balance in Transfer_Details_Withdraw,Transfer_Details_Deposit,UserAccount when OTP is Successful
create proc sp_Balance_Update (@Tran_id varchar(50))
as
begin
	declare @User_Acc_Bal money
	declare @Ben_Acc_Bal money
	declare @Acc_No int
	declare @Ben_AccNo int
	declare @Amount money
	declare @User_Balance money
	set @Acc_No = (select Acc_No from Transfer_Details_WithDraw where TransactionID= @Tran_id)
	set @Ben_AccNo = (select Ben_AccNo from Transfer_Details_WithDraw where TransactionID= @Tran_id)
	set @Amount = (select Amount from Transfer_Details_WithDraw where TransactionID= @Tran_id)
	set @User_Balance = (select Balance from UserAccount where Acc_No=@Acc_No)
	if ((@Amount < @User_Balance) and ((@User_Balance-@Amount)>=1000))
	begin	
		update UserAccount set Balance=Balance-@Amount where Acc_No=@Acc_No
		update UserAccount set Balance=Balance+@Amount where Acc_No=@Ben_AccNo
		set @User_Acc_Bal = (select Balance from UserAccount where Acc_No=@Acc_No)
		set @Ben_Acc_Bal = (select Balance from UserAccount where Acc_No=@Ben_AccNo)
		update Transfer_Details_WithDraw set status='Successful', Balance=@User_Acc_Bal where TransactionID=@Tran_id
		update Transfer_Details_Deposit set status='Successful', Balance=@Ben_Acc_Bal where TransactionID=@Tran_id
	end
	else
	begin
		set @User_Acc_Bal = (select Balance from UserAccount where Acc_No=@Acc_No)
		set @Ben_Acc_Bal = (select Balance from UserAccount where Acc_No=@Ben_AccNo)
		update Transfer_Details_WithDraw set status='Unsuccessful', Balance=@User_Acc_Bal where TransactionID=@Tran_id
		update Transfer_Details_Deposit set status='Unsuccessful', Balance=@Ben_Acc_Bal where TransactionID=@Tran_id
		delete from Transfer_Details_Deposit where TransactionID=@Tran_id 
	end
end


--Updation of balance in Transfer_Details_Withdraw,Transfer_Details_Deposit,UserAccount when OTP is Successful
create proc sp_Balance_Update_Unsuccessful (@Tran_id varchar(50))
as
begin
	declare @User_Acc_Bal money
	declare @Ben_Acc_Bal money
	declare @Acc_No int
	declare @Ben_AccNo int
	set @Acc_No = (select Acc_No from Transfer_Details_WithDraw where TransactionID= @Tran_id)
	set @Ben_AccNo = (select Ben_AccNo from Transfer_Details_WithDraw where TransactionID= @Tran_id)
	set @User_Acc_Bal = (select Balance from UserAccount where Acc_No=@Acc_No)
	set @Ben_Acc_Bal = (select Balance from UserAccount where Acc_No=@Ben_AccNo)
	update Transfer_Details_WithDraw set status='Unsuccessful', Balance=@User_Acc_Bal where TransactionID=@Tran_id
	update Transfer_Details_Deposit set status='Unsuccessful', Balance=@Ben_Acc_Bal where TransactionID=@Tran_id
	delete from Transfer_Details_Deposit where TransactionID=@Tran_id
end


--Selecting Specific Values
--Login Authorization ---update count..
select a.Fname,a.Lname from User_Details a, UserAccount b where b.User_Id='Mon_132' and b.Login_Password='#1rkbe#$26' and b.Acc_Status='Active' and a.Acc_No=b.Acc_No
--Returns Monica Gellar


--Setting password for the first time/ Changing the password
update UserAccount 
set Login_Password='1111111', Transaction_Password='9999999'
where Acc_No=1000008 and Acc_Status='Active'


--Viewing Personal Details
select * from User_Details where Acc_No=1000001

--Forgot UserID
select User_Id from UserAccount where Acc_No=1000008 and Acc_Status='Active' --Display the UserID after authentication 
update UserAccount 
set Login_Password='1111111', Transaction_Password='9999999'
where Acc_No=1000008 and Acc_Status='Active'  --Change Password accordingly

--Forgot Password
update UserAccount
set Login_Password='1111110', Transaction_Password='9999999'
where User_Id='Rob_962' and Acc_Status='Active'


--Acc Statement
----WithDraw Statement

select t.TransactionID,t.Ben_AccNo,b.Ben_Name,t.Transaction_Type,t.Transaction_date,t.Remark,t.Amount,ua.Balance 
from Transfer_Details t,Beneficiary b,UserAccount ua where t.Transaction_date 
between '06/01/2021' and '06/30/2021' and t.Acc_No=1000002 and t.Ben_AccNo=b.Ben_AccNo and t.status='Successful' and ua.Acc_No=t.Acc_No
select t.TransactionID,t.Ben_AccNo,b.Ben_Name,t.Transaction_Type,t.Transaction_date,t.Remark,t.Amount,ua.Balance  
from Transfer_Details t,Beneficiary b,UserAccount ua where t.Transaction_date 
between '09/01/2021' and '09/30/2021' and t.Acc_No=1000007 and t.Ben_AccNo=b.Ben_AccNo and t.status='Successful' and ua.Acc_No=t.Acc_No
select t.TransactionID,t.Ben_AccNo,b.Ben_Name,t.Transaction_Type,t.Transaction_date,t.Remark,t.Amount,ua.Balance  
from Transfer_Details t,Beneficiary b,UserAccount ua where t.Transaction_date 
between '09/01/2021' and '09/30/2021' and t.Acc_No=1000002 and t.Ben_AccNo=b.Ben_AccNo and t.status='Successful' and ua.Acc_No=t.Acc_No

--Session Expired
----Deactivate Account
update UserAccount 
set Acc_Status='Inactive'
where Acc_No=1000008
----Set New Password after authentication of OTP using Acc_no
update UserAccount
set Login_Password='0000077', Transaction_Password='7700000', Acc_Status='Active'
where Acc_No=1000008

--Adding a beneficiary [(User)-(Acc_No by defualt taken from Session["Acc_no"])]
insert into Beneficiary values(1000008,1000007,'Sanjana','Sanju','Self','SVB89786510')

--Initiating a Payment (User)-(TransID auto-generated, Acc_no taken from Session["Acc_no"], Status auto-updated)
insert into Transfer_Details values('TRAN075462132',1000007,1000008,'NEFT','06/04/2021','Paid','Balance Amount Paid',3000.78,'Successful')

--Account Summary - assuming as last three transactions success/unsuccess
select top 3 t.TransactionID,t.Ben_AccNo,b.Ben_Name,t.Transaction_Type,t.Transaction_date,t.Remark,t.Amount from Transfer_Details t,Beneficiary b where Acc_No=1000002 and t.Ben_AccNo=b.Ben_AccNo order by t.Transaction_date desc

----All transactions
select t.TransactionID,t.Ben_AccNo,b.Ben_Name,t.Transaction_Type,t.Transaction_date,t.Remark,t.Amount from Transfer_Details t,Beneficiary b where Acc_No=1000002 and t.Ben_AccNo=b.Ben_AccNo order by t.Transaction_date desc


CREATE PROCEDURE usp_RandomPassword (@password nvarchar(400) OUTPUT)
AS
DECLARE @ValidChar AS nvarchar(400)
SET @ValidChar = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890()!@$&*^'
DECLARE @counter int
SET @counter = 0
SET @password = ''
WHILE @counter < 10 
	BEGIN 
		SELECT @password = @password + SUBSTRING(@ValidChar, (CONVERT(int, (LEN(@ValidChar) * RAND() + 1))), 1) 
		SET @counter += 1 
	END; 
GO

DECLARE @new_password varchar(50) EXEC dbo.usp_RandomPassword @password = @new_password out
SELECT @new_password

Select Concat('TRAN',Substring(Convert(varchar,Rand()),3,6))


alter table User_Details add Ref_ID varchar(max) 
update User_Details set Ref_ID=SUBSTRING(State,1,2)+SUBSTRING(Fname,1,4)+SUBSTRING(Convert(varchar,Aadhar_No),5,8)

--Stored Procedure for creating Reference ID
create proc sp_Ref_ID(@id bigint)--,@reference varchar(15) out)
as
begin
update User_Details set Ref_ID=SUBSTRING(State,1,2)+SUBSTRING(Fname,1,4)+SUBSTRING(Convert(varchar,Aadhar_No),5,8) where Aadhar_No=@id;
select Ref_ID from User_Details where Aadhar_No=@id
end


exec dbo.sp_Ref_ID @id=96256315422548


declare @ref varchar(15)
exec dbo.sp_Ref_ID @id=25418596451233,@reference=@ref out
select @ref

select * from User_Details
alter table User_Details drop column Ref_ID

ALTER TABLE User_Details ADD Ref_ID varchar(max)


insert into User_Details values ('Ms.','Monica','G','Gellar',8941321730,'mon@gmail.com',256000071564,'09/03/2004','30ft Block','Greater Villa','Aster Society','Bern','Switzerland',401975,'30ft Block','Greater Villa','Aster Society','Bern','Switzerland',401975,'Chef','Salary',99810000,'Yes','Yes','Salary','Nariman Point','Approved')

select * from UserAccount
select* from User_Details

create or alter proc sp_Transfer(@Tran_ID varchar(50),@Acc_No int,@Ben_AccNo int,@Tran_type varchar(6),@Maturity varchar(50),@Remark varchar(100),@Amount money)
as
begin
    declare @date datetime
    set @date=Convert(datetime,@Maturity)
    insert into Transfer_Details_Withdraw(TransactionID,Acc_No,Ben_AccNo,Transaction_Type,Maturity_Ins,Remark,Amount) values (@Tran_ID,@Acc_No,@Ben_AccNo,@Tran_type,@date,@Remark,@Amount)
    insert into Transfer_Details_Deposit(TransactionID,Acc_No,Ben_AccNo,Transaction_Type,Maturity_Ins,Remark,Amount) values (@Tran_ID,@Ben_AccNo,@Acc_No,@Tran_type,@date,@Remark,@Amount)
    insert into Transfer_Details_All(TransactionID,Acc_No,Ben_AccNo,Transaction_Type,Maturity_Ins,Remark,Withdraw) values (@Tran_ID,@Acc_No,@Ben_AccNo,@Tran_type,@date,@Remark,@Amount)
    insert into Transfer_Details_All(TransactionID,Acc_No,Ben_AccNo,Transaction_Type,Maturity_Ins,Remark,Deposit) values (@Tran_ID,@Ben_AccNo,@Acc_No,@Tran_type,@date,@Remark,@Amount)
end

create or alter proc sp_Balance_Update (@Tran_id varchar(50))
as
begin
    declare @User_Acc_Bal money
    declare @Ben_Acc_Bal money
    declare @Acc_No int
    declare @Ben_AccNo int
    declare @Amount money
    declare @User_Balance money
    set @Acc_No = (select Acc_No from Transfer_Details_WithDraw where TransactionID= @Tran_id)
    set @Ben_AccNo = (select Ben_AccNo from Transfer_Details_WithDraw where TransactionID= @Tran_id)
    set @Amount = (select Amount from Transfer_Details_WithDraw where TransactionID= @Tran_id)
    set @User_Balance = (select Balance from UserAccount where Acc_No=@Acc_No)
    if ((@Amount < @User_Balance) and ((@User_Balance-@Amount)>=1000))
    begin   
        update UserAccount set Balance=Balance-@Amount where Acc_No=@Acc_No
        update UserAccount set Balance=Balance+@Amount where Acc_No=@Ben_AccNo
        set @User_Acc_Bal = (select Balance from UserAccount where Acc_No=@Acc_No)
        set @Ben_Acc_Bal = (select Balance from UserAccount where Acc_No=@Ben_AccNo)
        update Transfer_Details_WithDraw set status='Successful', Balance=@User_Acc_Bal where TransactionID=@Tran_id
        update Transfer_Details_Deposit set status='Successful', Balance=@Ben_Acc_Bal where TransactionID=@Tran_id
        update Transfer_Details_All set status='Successful', Balance=@User_Acc_Bal where TransactionID=@Tran_id and Deposit is null
        update Transfer_Details_All set status='Successful', Balance=@Ben_Acc_Bal where TransactionID=@Tran_id and Withdraw is null
    end
    else
    begin
        set @User_Acc_Bal = (select Balance from UserAccount where Acc_No=@Acc_No)
        set @Ben_Acc_Bal = (select Balance from UserAccount where Acc_No=@Ben_AccNo)
        update Transfer_Details_WithDraw set status='Unsuccessful', Balance=@User_Acc_Bal where TransactionID=@Tran_id
        update Transfer_Details_Deposit set status='Unsuccessful', Balance=@Ben_Acc_Bal where TransactionID=@Tran_id
        update Transfer_Details_All set status='Unsuccessful', Balance=@User_Acc_Bal where TransactionID=@Tran_id and Deposit is null
        update Transfer_Details_All set status='Unsuccessful', Balance=@Ben_Acc_Bal where TransactionID=@Tran_id and Withdraw is null
        delete from Transfer_Details_Deposit where TransactionID=@Tran_id
    end
end

create or alter proc sp_Balance_Update_Unsuccessful (@Tran_id varchar(50))
as
begin
    declare @User_Acc_Bal money
    declare @Ben_Acc_Bal money
    declare @Acc_No int
    declare @Ben_AccNo int
    set @Acc_No = (select Acc_No from Transfer_Details_WithDraw where TransactionID= @Tran_id)
    set @Ben_AccNo = (select Ben_AccNo from Transfer_Details_WithDraw where TransactionID= @Tran_id)
    set @User_Acc_Bal = (select Balance from UserAccount where Acc_No=@Acc_No)
    set @Ben_Acc_Bal = (select Balance from UserAccount where Acc_No=@Ben_AccNo)
    update Transfer_Details_WithDraw set status='Unsuccessful', Balance=@User_Acc_Bal where TransactionID=@Tran_id
    update Transfer_Details_Deposit set status='Unsuccessful', Balance=@Ben_Acc_Bal where TransactionID=@Tran_id
    update Transfer_Details_All set status='Unsuccessful', Balance=@User_Acc_Bal where TransactionID=@Tran_id and Deposit is null
    update Transfer_Details_All set status='Unsuccessful', Balance=@Ben_Acc_Bal where TransactionID=@Tran_id and Withdraw is null
    delete from Transfer_Details_Deposit where TransactionID=@Tran_id
end

insert into Beneficiary values(1000005,1000003,'ABC','ABC','Self','ICICI456213')