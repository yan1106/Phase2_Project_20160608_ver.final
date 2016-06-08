using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Linq;
using System.Web.Configuration;
using MySql.Data.MySqlClient;




public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


   



    protected void Button1_Click(object sender, EventArgs e)
    {
        string strScript = "<script language='javascript'>inputnums();</script>";       
        Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);




    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string strScript = "<script language='javascript'>inputnums();</script>";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
    }
}