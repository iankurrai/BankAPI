--Insert Dummy Values--

insert into IFSC values('Powai','SVB90786521')
insert into IFSC values('Airoli','SVB70566521')
insert into IFSC values('Navi Mumbai','SVB89786510')
insert into IFSC values('Nariman Point','SVB10786513')

insert into [Beneficiary] values(1111111,1001009,'Shama','SMS','FinTech','FIN0011755')

insert into Admin values ('Sandnya','Sandy@1234',9852164377,'sandy@gmail.com','Active',0)



--Inserting Data through default values - "User_Details TABLE" [(User)-(Approved by Admin*)] 
insert into User_Details (Title,Fname,Lname,MobNo,Email,Aadhar_No,DOB,AddressL1,AddressL2,City,State,Pincode,P_Address1,P_Address2,P_City,P_State,P_Pincode,OccupationType,Src_Income,GrossAnnual_Income,AccountType,Branch_Name) values('Ms.','Rachel','Green',9625413870,'rach@gmail.com',895632541256,'05/04/2021','12 Cross Street','Central Perk','New York','USA',854269,'12 Cross Street','Central Perk','New York','USA',854269,'Architect','Business',94800000,'Savings','Powai')
insert into User_Details (Title,Fname,Lname,MobNo,Email,Aadhar_No,DOB,AddressL1,AddressL2,City,State,Pincode,P_Address1,P_Address2,P_City,P_State,P_Pincode,OccupationType,Src_Income,GrossAnnual_Income,AccountType,Branch_Name) values('Ms.','Anna','Hathway',9603613870,'anna@hotmail.com',895632511156,'06/30/2018','26 ft Road','Med Centre','San Frnacisco','California',214269,'26 ft Road','Med Square','San Frnacisco','California',214269,'Doctor','Service',69470000,'Salary','Airoli')
insert into User_Details (Title,Fname,Lname,MobNo,Email,Aadhar_No,DOB,AddressL1,AddressL2,City,State,Pincode,P_Address1,P_Address2,P_City,P_State,P_Pincode,OccupationType,Src_Income,GrossAnnual_Income,AccountType,Branch_Name) values('Mr.','Robert','Bing',9625413870,'rach@gmail.com',890002541256,'09/07/2016','A-12 Villa','Banjara Hills','Banglore','Karnataka',784269,'A-203, Elixir Heights','Kings Circle','Mumbai','Maharashtra',868569,'Lawyer','Rent',89800500,'DMAT','Navi Mumbai')

insert into User_Details (Title,Fname,Lname,MobNo,Email,Aadhar_No,DOB,AddressL1,AddressL2,City,State,Pincode,P_Address1,P_Address2,P_City,P_State,P_Pincode,OccupationType,Src_Income,GrossAnnual_Income,AccountType,Branch_Name) values('Ms.','Rachel','Green',9625413870,'rach@gmail.com',895600001256,'05/04/2021','12 Cross Street','Central Perk','New York','USA',854269,'12 Cross Street','Central Perk','New York','USA',854269,'Architect','Business',94800000,'Savings','Powai')
insert into User_Details (Title,Fname,Lname,MobNo,Email,Aadhar_No,DOB,AddressL1,AddressL2,City,State,Pincode,P_Address1,P_Address2,P_City,P_State,P_Pincode,OccupationType,Src_Income,GrossAnnual_Income,AccountType,Branch_Name) values('Ms.','Anna','Hathway',9603613870,'anna@hotmail.com',899999511156,'06/30/2018','26 ft Road','Med Centre','San Frnacisco','California',214269,'26 ft Road','Med Square','San Frnacisco','California',214269,'Doctor','Service',69470000,'Salary','Airoli')
insert into User_Details (Title,Fname,Lname,MobNo,Email,Aadhar_No,DOB,AddressL1,AddressL2,City,State,Pincode,P_Address1,P_Address2,P_City,P_State,P_Pincode,OccupationType,Src_Income,GrossAnnual_Income,AccountType,Branch_Name) values('Mr.','Robert','Bing',9625413870,'rach@gmail.com',999982111156,'09/07/2016','A-12 Villa','Banjara Hills','Banglore','Karnataka',784269,'A-203, Elixir Heights','Kings Circle','Mumbai','Maharashtra',868569,'Lawyer','Rent',89800500,'DMAT','Navi Mumbai')

--Inserting Data through Default values - "UserAccount TABLE" [(By default Admin values)-(Later Edited by User)]
insert into UserAccount (Acc_No,User_Id,Login_Password,Transaction_Password, Balance) values (1000001,'Ra_870','Pass!@123','Trans$*098',10000)
insert into UserAccount (Acc_No,User_Id,Login_Password,Transaction_Password, Balance) values (1000002,'Anna_3870','ABC!@129','Ds24*079',10000)
insert into UserAccount (Acc_No,User_Id,Login_Password,Transaction_Password, Balance) values (1000003,'J_730','123MoP','($098Pizza',10000)
insert into UserAccount (Acc_No,User_Id,Login_Password,Transaction_Password, Balance) values (1000003,'J_730','123MoP','($098Pizza',10000)
insert into UserAccount (Acc_No,User_Id,Login_Password,Transaction_Password, Balance) values (1001009,'A_730','123MoP','($098Pizza',10000)

--Inserting all values - "Beneficiary TABLE" (User)
insert into Beneficiary values(1000002,1000001,'Joey','Joe','Self','SVB10786513')
insert into Beneficiary values(1000001,1000003,'Rachel','Rach','Self','SVB90786521')
insert into Beneficiary values(2045687,1000002,'Thomas','Tom','HDFC','HDFC7958650')
insert into Beneficiary values(4099009,1000002,'Jackson','Jack','ICICI','ICICI786522')

--Inserting through null values  - "Transfer_Details TABLE" (User except TransID auto-generated, staus auto-updated)
insert into Transfer_Details_Withdraw(TransactionID,Acc_No,Ben_AccNo,Transaction_Type,Transaction_date,Remark,Amount) values ('TRAN019999999',1000001,1000002,'IMPS','05/04/2021','Gift',5000)
insert into Transfer_Details_Withdraw(TransactionID,Acc_No,Ben_AccNo,Transaction_Type,Transaction_date,Remark,Amount) values ('TRAN028888899',1000003,1000001,'IMPS','09/08/2021','Rent',6000)
insert into Transfer_Details_Withdraw(TransactionID,Acc_No,Ben_AccNo,Transaction_Type,Transaction_date,Remark,Amount) values ('TRAN039977799',1000002,4099009,'IMPS','06/07/2021','Loan',8900)

insert into Transfer_Details_Deposit(TransactionID,Acc_No,Ben_AccNo,Transaction_Type,Transaction_date,Remark,Amount) values ('TRAN019999999',1000002,1000001,'IMPS','05/04/2021','Gift',5000)
insert into Transfer_Details_Deposit(TransactionID,Acc_No,Ben_AccNo,Transaction_Type,Transaction_date,Remark,Amount) values ('TRAN028888899',1000001,1000003,'IMPS','09/08/2021','Rent',6000)
insert into Transfer_Details_Deposit(TransactionID,Acc_No,Ben_AccNo,Transaction_Type,Transaction_date,Remark,Amount) values ('TRAN039977799',4099009,1000002,'IMPS','06/07/2021','Loan',8900)

--Inserting all values - "Transfer_Details TABLE" 
insert into Transfer_Details_Withdraw values('TRAN049977700',1000002,2045687,'RTGS','06/26/2021','06/30/2021','Re-pay',500,'Unsuccessful',0)
insert into Transfer_Details_Withdraw values('TRAN059955521',1000002,4099009,'NEFT','06/30/2021','07/30/2021','Gift',5000,'Successful',0)
insert into Transfer_Details_Withdraw values('TRAN069950000',1000002,4099009,'RTGS','09/06/2021','01/27/2021','Payment',97400,'Successful',0)

insert into Transfer_Details_Deposit values('TRAN049977700',2045687,1000002,'RTGS','06/26/2021','06/30/2021','Re-pay',500,'Unsuccessful',0)
insert into Transfer_Details_Deposit values('TRAN059955521',4099009,1000002,'NEFT','06/30/2021','07/30/2021','Gift',5000,'Successful',0)
insert into Transfer_Details_Deposit values('TRAN069950000',4099009,1000002,'RTGS','09/06/2021','01/27/2021','Payment',97400,'Successful',0)

exec sp_Login @user_id='Anna_3870', @password='DEF$&987'

exec sp_Transfer_Updates @Acc_No=1000001,@Ben_AccNo=1000002,@Tran_type='IMPS',@Tran_date='04/12/2021',@Maturity=null,@Remark='Gift',@Amount=500
exec sp_Transfer_Updates @Acc_No=1000003,@Ben_AccNo=1000002,@Tran_type='RTGS',@Tran_date='04/12/2021',@Maturity='04/15/2021',@Remark='Gift',@Amount=12000
exec sp_Transfer_Updates @Acc_No=1000003,@Ben_AccNo=1000002,@Tran_type='RTGS',@Tran_date='04/12/2021',@Maturity='04/15/2021',@Remark='Gift',@Amount=9500
exec sp_Transfer_Updates @Acc_No=1000003,@Ben_AccNo=1000002,@Tran_type='RTGS',@Tran_date='04/12/2021',@Maturity='04/15/2021',@Remark='Gift',@Amount=9000
