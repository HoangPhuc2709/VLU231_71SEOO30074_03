//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VLU231_71SEOO30074_03.src
{
    using System;
    using System.Collections.Generic;
    
    public partial class SinhvienHp
    {
        public string MaSinhVien { get; set; }
        public string MaHp { get; set; }
    
        public virtual Diem Diem { get; set; }
        public virtual LopHp LopHp { get; set; }
        public virtual NguoiDung NguoiDung { get; set; }
    }
}
