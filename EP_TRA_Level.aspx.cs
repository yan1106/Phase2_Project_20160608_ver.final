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
using System.ComponentModel;
using System.Drawing;
using System.Web.SessionState;





public partial class EP_TRA_Level : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string keyitem = Request.QueryString["keyitem"];
        string stage = Request.QueryString["stage"];
                           
        string Version_Name = Request.QueryString["filename"];

        //Response.Write(keyitem + stage + Version_Name);
        if (!Page.IsPostBack) {
            receive_Lv(Version_Name, stage, keyitem);
        }
       
        HttpContext.Current.Session["Version_Name"] = Version_Name;
        HttpContext.Current.Session["keyitem"] = keyitem;
        HttpContext.Current.Session["stage"] = stage;

    }

    protected Boolean jude_Lv(string filename, string stage, string keyitem,string spechar)
    {
       
        string sign = "1";
        string sql = "select * from npi_eptra_doe_lv where Lv_filename='" + filename + "' and Lv_stage ='" + stage + "' and Lv_Iiitems='" + keyitem + "'";
               

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();
       


        while (mydr.Read())
        {
            if(mydr["Lv_TraLv"].ToString()=="")
            {
                sign = "1";
                
            }
            else
            {
                sign = "0";
                break;
            }
        }

        mydr.Close();
        MySqlConn.Close();


        if (sign == "1")
            return true;
        else
            return false;

    }



    protected String select_Lv(string filename, string stage, string keyitem,string spechar)
    {

        string Lv = "";
        string sql = "select Lv_TraLv from npi_eptra_doe_lv where Lv_filename='" + filename + "' and Lv_stage='" + stage + "' and Lv_Iiitems='" + keyitem + "' and Lv_SpecChar='" + spechar + "'";            

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

       while(mydr.Read())
        {
            Lv = mydr["Lv_TraLv"].ToString();
        }

        mydr.Close();
        MySqlConn.Close();


        return Lv;

    }




    protected void receive_Lv (string filename,string stage,string keyitem)
    {
        
        string SpeChar="";
        string md = "";
        string cate = "";
        string key = "";
       

    string str_sql = "select DISTINCT EP_Cate_Iiitems,EP_Cate_Stage,EP_Cate_SpeChar from npi_ep_category where EP_Cate_Stage='" + stage + "' and EP_Cate_Iiitems='" + keyitem + "'";

        


        clsMySQL db = new clsMySQL(); //Connection MySQL
        clsMySQL.DBReply dr = db.QueryDS(str_sql);
        GridView1.DataSource = dr.dsDataSet.Tables[0].DefaultView;
        GridView1.DataBind();
        db.Close();

        



        for(int i=0;i<GridView1.Rows.Count;i++)
        {

            SpeChar = GridView1.Rows[i].Cells[2].Text;
            //md = GridView1.Rows[i].Cells[1].Text;
            //cate = GridView1.Rows[i].Cells[2].Text;
            //key = GridView1.Rows[i].Cells[3].Text;


            if (jude_Lv(filename,stage,keyitem,SpeChar))
            {
                DropDownList  ddl_Lv = (DropDownList)GridView1.Rows[i].Cells[3].FindControl("Doe_Lv");
                ddl_Lv.Items.Add(new ListItem("Lv.3", "Lv.3"));
                ddl_Lv.Items.Add(new ListItem("Lv.4", "Lv.4"));
                ddl_Lv.Items.Add(new ListItem("Lv.5", "Lv.5"));
            }
           else
            {
                DropDownList ddl_Lv = (DropDownList)GridView1.Rows[i].Cells[3].FindControl("Doe_Lv");
                if (select_Lv(filename, stage, keyitem, SpeChar) == "Lv.3")
                {
                    ddl_Lv.Items.Add(new ListItem("Lv.3", "Lv.3"));
                    ddl_Lv.Items.Add(new ListItem("Lv.4", "Lv.4"));
                    ddl_Lv.Items.Add(new ListItem("Lv.5", "Lv.5"));
                }
                else if(select_Lv(filename, stage,keyitem,SpeChar) == "Lv.4")
                {
                    ddl_Lv.Items.Add(new ListItem("Lv.4", "Lv.4"));
                                    
                    ddl_Lv.Items.Add(new ListItem("Lv.5", "Lv.5"));
                    ddl_Lv.Items.Add(new ListItem("Lv.3", "Lv.3"));
                }
                else if(select_Lv(filename, stage, keyitem, SpeChar) == "Lv.5")
                {
                    ddl_Lv.Items.Add(new ListItem("Lv.5", "Lv.5"));
                    ddl_Lv.Items.Add(new ListItem("Lv.4", "Lv.4"));                   
                    ddl_Lv.Items.Add(new ListItem("Lv.3", "Lv.3"));
                }
            }


            


        }


        

        //test.Items.Remove(test.Items.FindByValue("Lv.4"));



    }





    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        string vn =Session["Version_Name"].ToString(); 
        string key = Session["keyitem"].ToString();
        string stage = Session["stage"].ToString();
        GridView1.PageIndex = e.NewPageIndex;
        receive_Lv(vn, stage, key);
    }

    protected void GridView1_PageIndexChanged(object sender, EventArgs e)
    {
        string vn = Session["Version_Name"].ToString();
        string key = Session["keyitem"].ToString();
        string stage = Session["stage"].ToString();
       
        receive_Lv(vn, stage, key);
    }




   




    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {

            case "Save":
                

                break;

            


        }
    }


    protected int count_sum_Lv(string filename, string stage, string keyitem)
    {

        int num = 0;
        string sql = "select COUNT(Lv_TraLv) from npi_eptra_doe_lv where Lv_filename='" + filename + "'and Lv_stage='" + stage + "' and Lv_Iiitems='" + keyitem + "'";
        

        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read())
        {
            num = Convert.ToInt32(mydr["COUNT(Lv_TraLv)"]);
        }

        mydr.Close();
        MySqlConn.Close();


        return num;

    }


    protected int count_Lv(string filename, string stage, string keyitem)
    {

        int num = 0, num2 = 0 ;
        string sql = "select COUNT(Lv_TraLv) from npi_eptra_doe_lv where Lv_filename='" + filename + "'and Lv_stage='" + stage + "' and Lv_Iiitems='" + keyitem + "' and Lv_TraLv= 'Lv.5' ";


        MySqlConnection MySqlConn = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd = new MySqlCommand(sql, MySqlConn);
        MySqlDataReader mydr = MySqlCmd.ExecuteReader();

        while (mydr.Read())
        {
            num =Convert.ToInt32(mydr["COUNT(Lv_TraLv)"]);
        }

        mydr.Close();
        MySqlConn.Close();


        string sql2 = "select COUNT(Lv_TraLv) from npi_eptra_doe_lv where Lv_filename='" + filename + "'and Lv_stage='" + stage + "' and Lv_Iiitems='" + keyitem + "' and Lv_TraLv= 'Lv.4' ";


        MySqlConnection MySqlConn2 = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        MySqlConn.Open();

        MySqlCommand MySqlCmd2 = new MySqlCommand(sql2, MySqlConn2);
        MySqlDataReader mydr2 = MySqlCmd.ExecuteReader();

        while (mydr2.Read())
        {
            num2 = Convert.ToInt32(mydr2["COUNT(Lv_TraLv)"]);
        }

       






        mydr.Close();
        MySqlConn.Close();


        return (num+num2);

    }




    protected void btnInsert_Click(object sender, EventArgs e)
    {
        
        string user = "CIM";
        string vn = Session["Version_Name"].ToString();
        string keyitem = Session["keyitem"].ToString();
        string stage = Session["stage"].ToString();
        int Max = 0, count = 0; ;
        string sign_Lv = "";


        clsMySQL db = new clsMySQL();

        string SpeChar = "";
        string md = "";
        string cate = "";
        string kp = "";

        string t = "";
        string f = "";


        
        if(jude_Lv(vn, stage, keyitem, SpeChar)) {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                SpeChar = GridView1.Rows[i].Cells[2].Text;

                DropDownList ddl_Lv = (DropDownList)GridView1.Rows[i].Cells[3].FindControl("Doe_Lv");
                string select_str2 = ddl_Lv.SelectedValue;









                String insert_cap = string.Format("insert into npi_eptra_doe_lv" +
                               "(Lv_filename,Lv_User,Lv_UpdateTime,Lv_Iiitems,Lv_stage,Lv_SpecChar," +
                               "Lv_TraLv)values" +
                               "('{0}','{1}',NOW(),'{2}','{3}','{4}','{5}')",
                               vn, user, keyitem, stage, SpeChar, select_str2);





                try
                {

                    if (db.QueryExecuteNonQuery(insert_cap) == true)
                    {

                        t += Convert.ToString(i) + ",";
                    }
                    else
                    {
                        f += Convert.ToString(i) + ",";
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }



            }

        }
        else
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                SpeChar = GridView1.Rows[i].Cells[2].Text;

                DropDownList ddl_Lv = (DropDownList)GridView1.Rows[i].Cells[3].FindControl("Doe_Lv");
                string select_str2 = ddl_Lv.SelectedValue;









                String update_Lv = string.Format("UPDATE npi_eptra_doe_lv " +
                               " SET Lv_TraLv='{0}'"+
                               "where Lv_filename='{1}'and Lv_User='{2}'and Lv_Iiitems='{3}' and Lv_stage='{4}' and Lv_SpecChar='{5}'"
                               ,select_str2,vn,user,keyitem,stage,SpeChar);





                try
                {

                    if (db.QueryExecuteNonQuery(update_Lv) == true)
                    {

                        t += Convert.ToString(i) + ",";
                    }
                    else
                    {
                        f += Convert.ToString(i) + ",";
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }



            }
        }





        Max = count_sum_Lv(vn, stage, keyitem);
        count = count_Lv(vn, stage, keyitem);

        
        
        if(count>(Max/2))
        {
            sign_Lv = "l.1";
        }
        else
        {
            sign_Lv = "l.2";
        }
        
        
        
        string strScript = string.Format("<script language='javascript'>temp('"+keyitem+"'"+','+"'"+ stage +"'"+",'"+sign_Lv+"'"+");</script>");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "onload", strScript);
        
        

    }
}