using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
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
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CFMConnectionString"].ConnectionString);
        con.Open();

        string checkuser = "SELECT count(*) FROM UserAccount WHERE Username = '" + user_name.Text + "'";
        SqlCommand com = new SqlCommand(checkuser, con);
        temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        con.Close();

        if (temp == 1)
        {
            con.Open();
            string checkPasswordQuery = "select Password from UserAccount where Username = '" + user_name.Text + "'";
            SqlCommand passCom = new SqlCommand(checkPasswordQuery, con);
            string password = passCom.ExecuteScalar().ToString().Replace(" ", "");

            //when it matches
            if (password == pass_word.Text && DropDownList1.SelectedValue == "Coverinaclick")
            {
                Session["New"] = user_name.Text + "," + "Welcome to" + " " + DropDownList1.SelectedValue;
                Response.Redirect("SendMail.aspx");
            }
            else if (password == pass_word.Text && DropDownList1.SelectedValue == "Insuremyvan")
            {
                Session["New"] = user_name.Text + "," + "Welcome to " + " " + DropDownList1.SelectedValue;
                Response.Redirect("Sendmail.aspx");
            }
            else
            {
                ShowMessage("Password or Department is Incorrect");//doesnt match
            }

        }
        else
        {
            ShowMessage("Username is Incorrect");//incorrect staff ID
        }
    }
}