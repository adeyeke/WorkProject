using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
using System.Drawing;
using System.ComponentModel;

public partial class SendMail : System.Web.UI.Page
{
    private System.Windows.Forms.TextBox textbox1 = new System.Windows.Forms.TextBox();
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["New"] != null)
        {
            welcome_lbl.Text += " " + Session["New"].ToString();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }

        RadioButtonList2.SelectedIndex = 0;

        //this.textbox1_DragEnter += new DragEventHandler(textbox1_DragEnter);
        //this.textbox1_DragDrop += new DragEventHandler(textbox1_DragDrop);

   
        
    }
    void textbox1_DragEnter(object sender, DragEventArgs e)
    {
        if (e.Data.GetDataPresent(DataFormats.FileDrop))
        {
            e.Effect = DragDropEffects.Copy;
        }
        else
        {
            e.Effect = DragDropEffects.None;
        }
    }
    void textbox1_DragDrop(object sender, DragEventArgs e)
    {
        string[] FileList = (string[])e.Data.GetData(DataFormats.FileDrop, false) as string[];
        foreach (string s in FileList)
        {
            //TextBox3.Text += string.Format("{0}{1}", Environment.NewLine);
        }
    }
    
    

    #region Pop-up Diaglog Box
    void ShowMessage(string msg)
    {
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + msg + "');</script>");
    }
    #endregion

    /*void saveToPdf(string base64Str, string filePath, string file)
    {
        byte[] bytes = Convert.FromBase64String(base64Str);
        //string filename = file + ".pdf";
        //string filename = CheckBoxList1.SelectedItem.ToString();
        //string filepath = CheckBoxList1.SelectedValue;

        //System.IO.FileStream stream = new FileStream(filePath + filename, FileMode.CreateNew);
       // System.IO.BinaryWriter writer = new BinaryWriter(stream);
        //writer.Write(bytes, 0, bytes.Length);
        //writer.Close();
    }*/

    #region Send Message New Business/ Cover Note
    //send message button for new business
    protected void Button7_Click(object sender, EventArgs e)
    {
        
        MemoryStream ms1 = new MemoryStream();
        try
        {
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("yaadewale55@gmail.com", "Coverinaclick.ie", System.Text.Encoding.UTF8);
            msg.To.Add(to_email.Text);
            msg.Subject = subject.Text;
            msg.SubjectEncoding = System.Text.Encoding.UTF8;
            //msg.Body = message_area.Value;
            msg.BodyEncoding = System.Text.Encoding.UTF8;
            msg.IsBodyHtml = true;
            var application = new Microsoft.Office.Interop.Word.Application();
            var document = new Microsoft.Office.Interop.Word.Document();
            

            document = application.Documents.Add(Template: @"c:\Projects\CoverNote.docx");
            //application.Visible = true;

            foreach (Microsoft.Office.Interop.Word.Field field in document.Fields)
            {
                if (field.Code.Text.Contains("FirstName"))
                {
                    field.Select();
                    application.Selection.TypeText(fullname_txtbox.Text);
                }
                else if (field.Code.Text.Contains("date"))
                {
                    field.Select();
                    application.Selection.TypeText(TextBox2.Text);
                }
                else if (field.Code.Text.Contains("InsuranceCoy"))
                {
                    field.Select();
                    application.Selection.TypeText("Axa");
                }
                else if (field.Code.Text.Contains("benefits"))
                {
                    field.Select();
                    List<String> CheckBoxListStr1 = new List<string>();
                    foreach (ListItem item1 in CheckBoxList3.Items)
                    {
                        if (item1.Selected)
                        {
                            CheckBoxListStr1.Add(item1.Value);
                        }
                    }

                    String checkList1 = String.Join(" ", CheckBoxListStr1.ToArray());
                    application.Selection.TypeText(checkList1);
                }
                else if (field.Code.Text.Contains("docs"))
                {
                    field.Select();
                    List<String> CheckBoxListStr = new List<string>();
                    foreach (ListItem item in CheckBoxList2.Items)
                    {
                        if (item.Selected)
                        {
                            CheckBoxListStr.Add(item.Value);
                        }
                    }

                    String checkList = String.Join(Environment.NewLine, CheckBoxListStr.ToArray());
                    application.Selection.TypeText(checkList);
                }
            }
            DateTime add_Months = Convert.ToDateTime(TextBox2.Text).AddDays(365);
            TextBox3.Text = add_Months.ToString();

            var x = double.Parse(gross_amt.Text);
            var y = double.Parse(chrg.Text);
            var z = x + y;

            List<String> checkbxlst = new List<string>();
            foreach (ListItem item in CheckBoxList3.Items)
            {
                if (item.Selected)
                {
                    checkbxlst.Add(item.Value);
                }
            }
            string theList = String.Join(",", checkbxlst.ToArray());

            List<String> checkbxlst1 = new List<string>();
            foreach (ListItem item in CheckBoxList2.Items)
            {
                if (item.Selected)
                {
                    checkbxlst1.Add(item.Value);
                }
            }
            string theList1 = String.Join(",", checkbxlst1.ToArray());
            
                //msg.Body = document.Content.Text;
            msg.Body = "<p>Dear " + fullname_txtbox.Text + ", </p>" + "<p> Thank you for your new business instruction, we have incepted cover from " + TextBox2.Text + ". </p>" +
                "\n" + "<p> Find attached proposal form/statement of fact, which contains the information on which we have provided the quotation and incepted cover. Ensure that you read the proposal form/statement of fact to ensure all risk details are correct. If any of the details are not accurate to the acceptance and assessment of the risk, then please provide full details immediately. </p>"
                + "<p> Your policy would include: </p>" + "&#8594 " + theList
                        + "<p> The proposal form/statement of fact will form part of the contract between you and your insurance company. </p>"
                        + "<p> Please forward the following documents within 7 days:  </p>" + "&#8594" + theList1
                        + "\n" + "<p>Thank you </p>" + "\n----------------" + "<br />" + "coverinaclick.ie"
                        + "<br />Insurance House"
                        + "<br />" + "62A Terenure Road North"
                        + "<br />" + "Terenure"
                        + "<br />" + "Dublin 6W"
                        + "<p><a href = www.insuremyvan.ie><img src = imv.jpg alt = IMV_LOGO></a>"
                        + "<a href = www.coverinaclick.ie><img src = ciac.jpg alt = CIAC_LOGO></a>"
                        + "<a href = www.insuremyhouse.ie><img src = imh.jpg alt = IMH_LOGO></a></p>"
                        /*+ "<p> --------------------------------------------------------------------------------------------"
                        + "<br />" + "-------------------------------------------------------------------------------------------"
                        + "<br />" + " &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp<strong> INVOICE </strong>"
                        + "<br />" + "Should you wish to make any further alterations to your policy, please advise us, and any adjustments will be dealt with when completed."
                        + "\n" + "<table border = 1 style = width:100%> <tr> <td> Period of cover: &nbsp &nbsp &nbsp" + TextBox2.Text + " " + "to" + " " + TextBox3.Text
                        + "<p> Premium:  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp" + "€" + gross_amt.Text + "</p>"
                        + "<p>Administration charge: &nbsp &nbsp &nbsp &nbsp  " + "€" + chrg.Text + "</p>"
                        + "<p><strong> TOTAL PREMIUM: &nbsp &nbsp &nbsp &nbsp </strong>" + "€" + z + "</p></td></tr></table>"*/
                        + "<p><strong> SPECIAL NOTICE - DUTY OF DISCLOSURE</strong> </P>"
                        + "\n" + "<ol>" + "<li> Duty of Disclosure: Any facts known to you, and any changes affecting the risk since inception of the policy or last renewal date (whichever is the later) must be disclosed to us. Failure to disclose may mean that your policy may not provide you with the cover you require, or may invalidate the policy altogether.</li>"
                        + "<li> The amount shown includes a 5% Government levy and an Administration Charge (1989 Insurance Act of Practice)</li>" + "</ol>"
                        + "<p><font color = blue> City Financial Marketing Group Ltd is regulated by the Central Bank of Ireland</p>"
                        + "<p>City Financial Marketing is a memeber of the Irish Brokers Association</p>"
                        + "<p>City Financial Marketing Group Ltd is a company registered in Ireland. Registered office is situated at 70 Northumberland Road, Ballsbridge, Dublin 4, Registered Number 235088.</p>"
                        + "<p>This e-mail and any files transmitted with it are confidential and intended solely for the use of the individual or entity to whom they are addressed. If you have received this e-mail in error please notify the sender. Please note that any views or opinions presented in this e-mail are solely those of the author and do not necessarily represent those of the CFM Group. Finally, whilst every effort has been made to ensure this e-mail and any attachments are virus free CFM Group Ltd accepts no liability for any damage caused should any viruses be transmitted by this email.</p>"
                        + "\nPlease consider the environment before printing this email.</font>";
            
            

            using (System.IO.MemoryStream ms = new MemoryStream())
            {
                using (System.IO.StreamWriter writer = new StreamWriter(ms))
                {
                    writer.Write("Hello");
                    writer.Flush();
                    //writer.Dispose();

                    System.Net.Mime.ContentType ct = new System.Net.Mime.ContentType(System.Net.Mime.MediaTypeNames.Application.Pdf);
                    System.Net.Mail.Attachment attchFile = new Attachment(ms, ct);
                    //attchFile.ContentStream.
                    attchFile.ContentDisposition.FileName = "Terms of Business.pdf";
                    msg.Attachments.Add(attchFile);
                    if (FileUpload3.HasFile)
                    {
                       Attachment attachment;
                       attachment = (new Attachment(FileUpload3.PostedFile.InputStream, FileUpload3.FileName));
                       attachment.ContentDisposition.FileName = "Your Policy Booklet.pdf";
                       msg.Attachments.Add(attachment);
                    }
                    if (FileUpload4.HasFile)
                    {
                        Attachment attachment1;
                        attachment1 = (new Attachment(FileUpload4.PostedFile.InputStream, FileUpload4.FileName));
                        attachment1.ContentDisposition.FileName = "Proposal Form " + "/" + "Statement of Fact.pdf";
                        msg.Attachments.Add(attachment1);
                    }
                    if (FileUpload5.HasFile)
                    {
                        //Directory.CreateDirectory(@"");
                        Attachment attachment2;
                        attachment2 = (new Attachment(FileUpload5.PostedFile.InputStream, FileUpload5.FileName));
                        attachment2.ContentDisposition.FileName = "Direct Debit Mandate.pdf";
                        msg.Attachments.Add(attachment2);
                    }
                    if (FileUpload6.HasFile)
                    {
                        //Directory.CreateDirectory(@"");
                        Attachment attachment3;
                        attachment3 = (new Attachment(FileUpload6.PostedFile.InputStream, FileUpload6.FileName));
                        attachment3.ContentDisposition.FileName = "Gap in Cover";
                        msg.Attachments.Add(attachment3);
                    }
                    if (FileUpload7.HasFile)
                    {
                        //Directory.CreateDirectory(@"");
                        Attachment attachment4;
                        attachment4 = (new Attachment(FileUpload7.PostedFile.InputStream, FileUpload7.FileName));
                        attachment4.ContentDisposition.FileName = "Sold Car Declaration";
                        msg.Attachments.Add(attachment4);
                    }
                    if (FileUpload8.HasFile)
                    {
                        //Directory.CreateDirectory(@"");
                        Attachment attachment5;
                        attachment5 = (new Attachment(FileUpload8.PostedFile.InputStream, FileUpload8.FileName));
                        attachment5.ContentDisposition.FileName = "Surrender of NCB";
                        msg.Attachments.Add(attachment5);
                    }
                    msg.IsBodyHtml = true;

                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    System.Net.NetworkCredential netwrkcred = new System.Net.NetworkCredential();
                    netwrkcred.UserName = "yaadewale55@gmail.com";
                    netwrkcred.Password = "Tomo55lade";
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = netwrkcred;
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.Send(msg);
                   
                    //ms.Close();

                    ShowMessage("Message sent!!");
                    
                    CheckBoxList3.ClearSelection();
                    //RadioButtonList1.ClearSelection();
                    to_email.Text = string.Empty;
                    //message_area.Value = string.Empty;
                    TextBox2.Text = string.Empty;
                    fullname_txtbox.Text = string.Empty;
                    CheckBoxList2.ClearSelection();
                    gross_amt.Text = string.Empty;
                    chrg.Text = string.Empty;
                }
                
                
            }
            
            //byte[] pdfByte = System.IO.File.ReadAllBytes(Server.MapPath("~/PDF Document/Timetable(1)"));
            //Attachment attachFile = new Attachment(new MemoryStream(CheckBoxList1.DataValueField), "pdf");
            // msg.Attachments.Add(attachFile);

           
        }
        catch (Exception ex)
        {
            Response.Write("Error" + ex.ToString());
        }
    }
    #endregion

    #region Logout Button
    protected void logout_btn_Click(object sender, EventArgs e)
    {
        try
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }
        catch (Exception ex)
        {
            Response.Write("Error" + ex.ToString());
        }
        
    }
    #endregion

    #region Send button (Renewals)
    //send message button for renewals
    protected void Button6_Click(object sender, EventArgs e)
    {
        MailMessage msg = new MailMessage();
        try
        {
            if (RadioButtonList3.SelectedValue == "Existing Insurer")
            {
                var application = new Microsoft.Office.Interop.Word.Application();
                var document = new Microsoft.Office.Interop.Word.Document();

                document = application.Documents.Add(Template: @"c:\Projects\Existing.docx");
                //application.Visible = true;

                foreach (Microsoft.Office.Interop.Word.Field field in document.Fields)
                {
                    if (field.Code.Text.Contains("First Name"))
                    {
                        field.Select();
                        application.Selection.TypeText(f_name.Font.Bold.ToString());
                    }
                    else if (field.Code.Text.Contains("LastName"))
                    {
                        field.Select();
                        application.Selection.TypeText(l_name.Font.Bold.ToString());
                    }
                    else if (field.Code.Text.Contains("Date"))
                    {
                        field.Select();
                        application.Selection.TypeText(date.Font.Bold.ToString());
                    }
                    else if (field.Code.Text.Contains("Insurance Company Name"))
                    {
                        field.Select();
                        application.Selection.TypeText(insure_coy.Font.Bold.ToString());
                    }
                    else if (field.Code.Text.Contains("Amount"))
                    {
                        field.Select();
                        application.Selection.TypeText(amt.Font.Bold.ToString());
                    }
                }
                msg.Body = "<p>Dear " + f_name.Text + " " + l_name.Text + ", </p>"
                    + "<p>Firstly, may we take this oppurtunity to thank you for placing your insurance with www.coverinaclick.ie over the past year. </p>"
                    + "<p>There may be a lower premium available, based on a full review of your requirements. Please call our renewal team on 01-6606900 for a free review of your policy and benefits.</p>"
                    + "<p>We wish to advise you that your policy is due for renewal on " + date.Text + ". Having researched the market and based on the information provided by you previously, we believe that the best renewal most suited to your needs is"
                    + " " + amt.Text + " with " + insure_coy.Text + " .</p>"
                    + "<p>Please find attached your renewal notice and your No Claims bonus for " 
                    + insure_coy.Text + ", with the Reason Why Statement and the Terms of Business. </p>"
                    + "<p> If you are happy to proceed with your renewal, simply:"
                    + "\n" + "<ul>" + "<li>Contact us directly on 01-6606900 to make payment by Credit/Debit card or to discuss <u>Direct Debit Options</u></li>"
                    + "\n" + "<li>Send us in a cheque/postal order/bank draft made payable to <u>www.insuremyvan.ie</u> to the address below</li>"
                    + "\n" + "<li>If you currently pay monthly through <strong>Close Premium Finance</strong>, please call us</li>" + "</ul>"
                    + "<p>Small changes could mean further savings to your renewal premium, please contact us on 01-6606900 for your policy review. Please note that if policy is not paid by renewal date"
                    + " " + date.Text + ", all covers will cease. </p>"
                    + "<p>We trust this is to your satisfaction and we look forward to hearing from you in this regard."
                    + "\n" + "<p>Thank you </p>" + "\n----------------" + "<br />" + "coverinaclick.ie";
            }
            else
            {
                var application1 = new Microsoft.Office.Interop.Word.Application();
                var document1 = new Microsoft.Office.Interop.Word.Document();

                document1 = application1.Documents.Add(Template: @"c:\Projects\Alternate.docx");
                //application.Visible = true;

                foreach (Microsoft.Office.Interop.Word.Field field in document1.Fields)
                {
                    if (field.Code.Text.Contains("First Name"))
                    {
                        field.Select();
                        application1.Selection.TypeText(f_name.Text);
                    }
                    else if (field.Code.Text.Contains("LastName"))
                    {
                        field.Select();
                        application1.Selection.TypeText(l_name.Text);
                    }
                    else if (field.Code.Text.Contains("Date"))
                    {
                        field.Select();
                        application1.Selection.TypeText(date.Text);
                    }
                    else if (field.Code.Text.Contains("Insurance Company Name"))
                    {
                        field.Select();
                        application1.Selection.TypeText(insure_coy.Text);
                    }
                    else if (field.Code.Text.Contains("Amount"))
                    {
                        field.Select();
                        application1.Selection.TypeText(amt_alt.Text);
                    }
                    else if (field.Code.Text.Contains("Amt"))
                    {
                        field.Select();
                        application1.Selection.TypeText(amt.Text);
                    }
                    else if (field.Code.Text.Contains("Alternate Insurance Company Name"))
                    {
                        field.Select();
                        application1.Selection.TypeText(alt_insur.Text);
                    }
                }
                msg.Body = "<p>Dear " + f_name.Text + " " + l_name.Text + ", </p>"
                    + "<p>Firstly, may we take this oppurtunity to thank you for placing your insurance with www.coverinaclick.ie over the past year. </p>"
                    + "<p>We wish to advise you that your policy is due for renewal on " + date.Text + ". Having researched our schemes and applying your customer discounts, the renewal most suited for your needs is"
                    + " " + amt_alt.Text + " with " + alt_insur.Text + "(the benefits of this alternate may differ to your current insurer, please call for further details) .</p>"
                    + "<p>Please find attached your renewal notice and your No Claims bonus from "
                    + insure_coy.Text + " " + "offering" + " " + amt.Text + ", with the Reason Why Statement and the Terms of Business. </p>"
                    + "<p> If you are happy to proceed with your renewal, simply:"
                    + "\n" + "<ul>" + "<li>Contact us directly on 01-6606900 to make payment by Credit/Debit card or to discuss <u>Direct Debit Options</u></li>"
                    + "\n" + "<li>Send us in a cheque/postal order/bank draft made payable to <u>www.insuremyvan.ie</u> to the address below</li>"
                    + "\n" + "<li>If you currently pay monthly through <strong>Close Premium Finance</strong>, please call us</li>" + "</ul>"
                    + "<p>Small changes could mean further savings to your renewal premium, please contact us on 01-6606900 for your policy review. Please note that if policy is not paid by renewal date"
                    + " " + date.Text + ", all covers will cease. </p>"
                    + "<p>We trust this is to your satisfaction and we look forward to hearing from you in this regard."
                    + "\n" + "<p>Thank you </p>" + "\n----------------" + "<br />" + "coverinaclick.ie";
                
            }
            
            msg.From = new MailAddress("yaadewale55@gmail.com", "info@converinaclick.ie");
            msg.To.Add(to_ren.Text);
            msg.Subject = subj_ren.Text;
            msg.IsBodyHtml = true;
          
            //gmail stmp client settings and user credentials
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            System.Net.NetworkCredential netwrkcred = new System.Net.NetworkCredential();
            netwrkcred.UserName = "yaadewale55@gmail.com";
            netwrkcred.Password = "Tomo55lade";
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = netwrkcred;
            smtp.Port = 587;
            smtp.EnableSsl = true;
            if (FileUpload1.HasFile)
            {
                msg.Attachments.Add(new Attachment(FileUpload1.PostedFile.InputStream, FileUpload1.FileName));
            }
            if (FileUpload2.HasFile)
            {
                msg.Attachments.Add(new Attachment(FileUpload2.PostedFile.InputStream, FileUpload2.FileName));
            }
            smtp.Send(msg);
          
            ShowMessage("Message sent!!");//pop up box to show message sent confirnmation
            RadioButtonList3.ClearSelection();//clears the selected radiobutton

            //clears all the textboxes when message sent
            CheckBoxList2.ClearSelection();
            to_ren.Text = string.Empty;
            f_name.Text = string.Empty;
            l_name.Text = string.Empty;
            insure_coy.Text = string.Empty;
            alt_insur.Text = string.Empty;
            amt_alt.Text = string.Empty;
            date.Text = string.Empty;
            amt.Text = string.Empty;
        }
            //throws an exception when error is detected in try
        catch (Exception ex)
        {
            Response.Write("Error" + ex.ToString());
        }
    }
    #endregion

    #region Radio Button Selection
    protected void RadioButtonList3_SelectedIndexChanged1(object sender, EventArgs e)
    {
        if (RadioButtonList3.SelectedValue == "Existing Insurer")
        {
            //sets the following textbox visibility to true when this radiobox is selected
            exist_insur_lbl.Visible = true;
            insure_coy.Visible = true;
            amtexist_lbl.Visible = true;
            amt.Visible = true;

            //sets the following texbox visibilty to false when this radiobox is selected
            alt_insur_lbl.Visible = false;
            amt_alt_lbl.Visible = false;
            alt_insur.Visible = false;
            amt_alt.Visible = false;
        }
        else
        {
            //sets the following textbox visibility to true when the other radiobox is selected
            alt_insur_lbl.Visible = true;
            amt_alt_lbl.Visible = true;
            alt_insur.Visible = true;
            amt_alt.Visible = true;

            //and sets the following visibility to true when the other radiobox is selected
            exist_insur_lbl.Visible = true;
            insure_coy.Visible = true;
            amtexist_lbl.Visible = true;
            amt.Visible = true;
        }
    }
    #endregion

    private void TextBox1_PreviewDrop(object sender, DragEventArgs e)
    {
        System.Windows.Forms.TextBox tb = sender as System.Windows.Forms.TextBox;
        if (tb != null)
        {
            if (e.Data.GetDataPresent(DataFormats.FileDrop, false))
            {
                string filename = e.Data.GetData(DataFormats.FileDrop) as string;
                using (StreamReader s = File.OpenText(filename))
                {
                    ((System.Windows.Forms.TextBox)sender).Text = s.ReadToEnd();
                }
            }
        }
        e.Effect = DragDropEffects.All;
    }
}