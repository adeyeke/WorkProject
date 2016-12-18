using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.IO;

public partial class ClientDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("SendMail.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string Constr = "";
            string ext = Path.GetExtension(fileuploadexcel.FileName).ToLower();
            string path = fileuploadexcel.PostedFile.FileName;
            //fileuploadexcel.SaveAs(path);

            if (ext.Trim() == ".xls")
            {
                Constr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + path + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"";
            }
            else if (ext.Trim() == ".xlxs")
            {
                Constr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=2\"";
            }

            string query = "select * from [Sheet1$]";
            OleDbConnection conn = new OleDbConnection(Constr);

            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            OleDbCommand com = new OleDbCommand(query, conn);
            OleDbDataAdapter da = new OleDbDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
            conn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("Error" + ex.ToString());
        }
        
    }
}