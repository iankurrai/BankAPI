//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Transfer_Details_All
    {
        public int Id { get; set; }
        public string TransactionID { get; set; }
        public int Acc_No { get; set; }
        public int Ben_AccNo { get; set; }
        public string Transaction_Type { get; set; }
        public System.DateTime Transaction_date { get; set; }
        public Nullable<System.DateTime> Maturity_Ins { get; set; }
        public string Remark { get; set; }
        public Nullable<decimal> Withdraw { get; set; }
        public Nullable<decimal> Deposit { get; set; }
        public string status { get; set; }
        public Nullable<decimal> Balance { get; set; }
    }
}
