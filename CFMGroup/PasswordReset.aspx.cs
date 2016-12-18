using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class PasswordReset : System.Web.UI.Page
{
    int temp = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    void ShowMessage(string msg)
    {
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + msg + "');</script>");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            //string NewPassword 
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CFMConnectionString"].ConnectionString);
            con.Open();

            string checkUser = "Select Count(*) from UserAccount where Username = '" + username_reset.Text + "'";
            SqlCommand com = new SqlCommand(checkUser, con);
            temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            //con.Close();

            if (temp == 1 && password_reset.Text == confirm_pass_reset.Text)
            {
                string updatePassword = "Update UserAccount set Password = @newPass where Username = '" + username_reset.Text + "'";
                SqlCommand com1 = new SqlCommand(updatePassword, con);
                com1.Parameters.AddWithValue("@newPass", confirm_pass_reset.Text);

                com1.ExecuteNonQuery();
                ShowMessage("Password changed");
                Response.Redirect("Login.aspx");
                con.Close();

            }
            else
            {
                Response.Write("Username doesn't exist");
                ShowMessage("Username doesn't exist");
            }
        }
        catch (Exception ex)
        {
            Response.Write("Error" + ex.ToString());
        }
        
    }
}