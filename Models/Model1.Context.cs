﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BankAPI.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Objects;
    using System.Data.Objects.DataClasses;
    using System.Linq;
    
    public partial class BankEntities : DbContext
    {
        public BankEntities()
            : base("name=BankEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Admin> Admins { get; set; }
        public DbSet<Beneficiary> Beneficiaries { get; set; }
        public DbSet<IFSC> IFSCs { get; set; }
        public DbSet<Session> Sessions { get; set; }
        public DbSet<Transfer_Details_All> Transfer_Details_All { get; set; }
        public DbSet<Transfer_Details_Deposit> Transfer_Details_Deposit { get; set; }
        public DbSet<Transfer_Details_Withdraw> Transfer_Details_Withdraw { get; set; }
        public DbSet<User_Details> User_Details { get; set; }
        public DbSet<UserAccount> UserAccounts { get; set; }
    
        public virtual int sp_Admin_Approve(Nullable<int> acc_No)
        {
            var acc_NoParameter = acc_No.HasValue ?
                new ObjectParameter("Acc_No", acc_No) :
                new ObjectParameter("Acc_No", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Admin_Approve", acc_NoParameter);
        }
    
        public virtual ObjectResult<sp_Admin_Login_Result> sp_Admin_Login(Nullable<int> pSNo, string admin_password)
        {
            var pSNoParameter = pSNo.HasValue ?
                new ObjectParameter("PSNo", pSNo) :
                new ObjectParameter("PSNo", typeof(int));
    
            var admin_passwordParameter = admin_password != null ?
                new ObjectParameter("Admin_password", admin_password) :
                new ObjectParameter("Admin_password", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_Admin_Login_Result>("sp_Admin_Login", pSNoParameter, admin_passwordParameter);
        }
    
        public virtual int sp_Admin_Logout(Nullable<int> pSNo)
        {
            var pSNoParameter = pSNo.HasValue ?
                new ObjectParameter("PSNo", pSNo) :
                new ObjectParameter("PSNo", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Admin_Logout", pSNoParameter);
        }
    
        public virtual int sp_Admin_Reject(Nullable<int> acc_No)
        {
            var acc_NoParameter = acc_No.HasValue ?
                new ObjectParameter("Acc_No", acc_No) :
                new ObjectParameter("Acc_No", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Admin_Reject", acc_NoParameter);
        }
    
        public virtual int sp_Admin_Reset_Password(Nullable<int> pSNo, string admin_Pass)
        {
            var pSNoParameter = pSNo.HasValue ?
                new ObjectParameter("PSNo", pSNo) :
                new ObjectParameter("PSNo", typeof(int));
    
            var admin_PassParameter = admin_Pass != null ?
                new ObjectParameter("Admin_Pass", admin_Pass) :
                new ObjectParameter("Admin_Pass", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Admin_Reset_Password", pSNoParameter, admin_PassParameter);
        }
    
        public virtual int sp_Balance_Update(string tran_id)
        {
            var tran_idParameter = tran_id != null ?
                new ObjectParameter("Tran_id", tran_id) :
                new ObjectParameter("Tran_id", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Balance_Update", tran_idParameter);
        }
    
        public virtual int sp_Balance_Update_Unsuccessful(string tran_id)
        {
            var tran_idParameter = tran_id != null ?
                new ObjectParameter("Tran_id", tran_id) :
                new ObjectParameter("Tran_id", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Balance_Update_Unsuccessful", tran_idParameter);
        }
    
        public virtual int sp_Generate_RefID(Nullable<int> acc_No)
        {
            var acc_NoParameter = acc_No.HasValue ?
                new ObjectParameter("Acc_No", acc_No) :
                new ObjectParameter("Acc_No", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Generate_RefID", acc_NoParameter);
        }
    
        public virtual ObjectResult<sp_Login_Result> sp_Login(string user_id, string password)
        {
            var user_idParameter = user_id != null ?
                new ObjectParameter("user_id", user_id) :
                new ObjectParameter("user_id", typeof(string));
    
            var passwordParameter = password != null ?
                new ObjectParameter("password", password) :
                new ObjectParameter("password", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_Login_Result>("sp_Login", user_idParameter, passwordParameter);
        }
    
        public virtual int sp_Logout(string user_id)
        {
            var user_idParameter = user_id != null ?
                new ObjectParameter("user_id", user_id) :
                new ObjectParameter("user_id", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Logout", user_idParameter);
        }
    
        public virtual ObjectResult<string> sp_Ref_ID(Nullable<long> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(long));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("sp_Ref_ID", idParameter);
        }
    
        public virtual int sp_Reset_Pass_ByUserID(string user_id, string login_Pass, string transaction_Pass)
        {
            var user_idParameter = user_id != null ?
                new ObjectParameter("User_id", user_id) :
                new ObjectParameter("User_id", typeof(string));
    
            var login_PassParameter = login_Pass != null ?
                new ObjectParameter("Login_Pass", login_Pass) :
                new ObjectParameter("Login_Pass", typeof(string));
    
            var transaction_PassParameter = transaction_Pass != null ?
                new ObjectParameter("Transaction_Pass", transaction_Pass) :
                new ObjectParameter("Transaction_Pass", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Reset_Pass_ByUserID", user_idParameter, login_PassParameter, transaction_PassParameter);
        }
    
        public virtual int sp_Reset_Password(Nullable<int> acc_No, string login_Pass, string transaction_Pass)
        {
            var acc_NoParameter = acc_No.HasValue ?
                new ObjectParameter("Acc_No", acc_No) :
                new ObjectParameter("Acc_No", typeof(int));
    
            var login_PassParameter = login_Pass != null ?
                new ObjectParameter("Login_Pass", login_Pass) :
                new ObjectParameter("Login_Pass", typeof(string));
    
            var transaction_PassParameter = transaction_Pass != null ?
                new ObjectParameter("Transaction_Pass", transaction_Pass) :
                new ObjectParameter("Transaction_Pass", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Reset_Password", acc_NoParameter, login_PassParameter, transaction_PassParameter);
        }
    
        public virtual int sp_SessionLogin(Nullable<int> acc_No)
        {
            var acc_NoParameter = acc_No.HasValue ?
                new ObjectParameter("Acc_No", acc_No) :
                new ObjectParameter("Acc_No", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_SessionLogin", acc_NoParameter);
        }
    
        public virtual int sp_SessionLogout(Nullable<int> acc_No)
        {
            var acc_NoParameter = acc_No.HasValue ?
                new ObjectParameter("Acc_No", acc_No) :
                new ObjectParameter("Acc_No", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_SessionLogout", acc_NoParameter);
        }
    
        public virtual int sp_Transfer(string tran_ID, Nullable<int> acc_No, Nullable<int> ben_AccNo, string tran_type, string maturity, string remark, Nullable<decimal> amount)
        {
            var tran_IDParameter = tran_ID != null ?
                new ObjectParameter("Tran_ID", tran_ID) :
                new ObjectParameter("Tran_ID", typeof(string));
    
            var acc_NoParameter = acc_No.HasValue ?
                new ObjectParameter("Acc_No", acc_No) :
                new ObjectParameter("Acc_No", typeof(int));
    
            var ben_AccNoParameter = ben_AccNo.HasValue ?
                new ObjectParameter("Ben_AccNo", ben_AccNo) :
                new ObjectParameter("Ben_AccNo", typeof(int));
    
            var tran_typeParameter = tran_type != null ?
                new ObjectParameter("Tran_type", tran_type) :
                new ObjectParameter("Tran_type", typeof(string));
    
            var maturityParameter = maturity != null ?
                new ObjectParameter("Maturity", maturity) :
                new ObjectParameter("Maturity", typeof(string));
    
            var remarkParameter = remark != null ?
                new ObjectParameter("Remark", remark) :
                new ObjectParameter("Remark", typeof(string));
    
            var amountParameter = amount.HasValue ?
                new ObjectParameter("Amount", amount) :
                new ObjectParameter("Amount", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Transfer", tran_IDParameter, acc_NoParameter, ben_AccNoParameter, tran_typeParameter, maturityParameter, remarkParameter, amountParameter);
        }
    
        public virtual ObjectResult<string> sp_Transfer_Updates(Nullable<int> acc_No, Nullable<int> ben_AccNo, string tran_type, Nullable<System.DateTime> tran_date, Nullable<System.DateTime> maturity, string remark, Nullable<decimal> amount)
        {
            var acc_NoParameter = acc_No.HasValue ?
                new ObjectParameter("Acc_No", acc_No) :
                new ObjectParameter("Acc_No", typeof(int));
    
            var ben_AccNoParameter = ben_AccNo.HasValue ?
                new ObjectParameter("Ben_AccNo", ben_AccNo) :
                new ObjectParameter("Ben_AccNo", typeof(int));
    
            var tran_typeParameter = tran_type != null ?
                new ObjectParameter("Tran_type", tran_type) :
                new ObjectParameter("Tran_type", typeof(string));
    
            var tran_dateParameter = tran_date.HasValue ?
                new ObjectParameter("Tran_date", tran_date) :
                new ObjectParameter("Tran_date", typeof(System.DateTime));
    
            var maturityParameter = maturity.HasValue ?
                new ObjectParameter("Maturity", maturity) :
                new ObjectParameter("Maturity", typeof(System.DateTime));
    
            var remarkParameter = remark != null ?
                new ObjectParameter("Remark", remark) :
                new ObjectParameter("Remark", typeof(string));
    
            var amountParameter = amount.HasValue ?
                new ObjectParameter("Amount", amount) :
                new ObjectParameter("Amount", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("sp_Transfer_Updates", acc_NoParameter, ben_AccNoParameter, tran_typeParameter, tran_dateParameter, maturityParameter, remarkParameter, amountParameter);
        }
    
        public virtual int usp_RandomPassword(ObjectParameter password)
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("usp_RandomPassword", password);
        }
    }
}
