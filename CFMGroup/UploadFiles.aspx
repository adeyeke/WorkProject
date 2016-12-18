<%@ Page Language="C#" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    protected void Button1_Click(object sender, EventArgs e)
    {
        SaveFile sf = new SaveFile();

        if (FileUpload1.HasFile)
        {
            sf.fileName = FileUpload1.PostedFile.FileName;
            sf.fileExtension = Path.GetExtension(FileUpload1.PostedFile.FileName);
            sf.data = FileUpload1.FileBytes;

            Label1.Text = sf.SaveFileToDB();            
        }        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        SaveFile sf1 = new SaveFile();


        if (FileUpload2.HasFile)
        {
            sf1.fileName = FileUpload2.PostedFile.FileName;
            sf1.fileExtension = Path.GetExtension(FileUpload2.PostedFile.FileName);
            sf1.data = FileUpload2.FileBytes;

            Label2.Text = sf1.SaveFileToDB1();
        }; 
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Select a File to upload the same to DB - <br />

        <asp:FileUpload 
            ID="FileUpload1" 
            runat="server" />

        <br />

        <asp:Button 
            ID="Button1" 
            runat="server" 
            Text="Save to DB" OnClick="Button1_Click" /><br />

        <asp:Label 
            ID="Label1" 
            runat="server">
        </asp:Label>
    
        <br />
        <br />
        <br />
        <asp:FileUpload ID="FileUpload2" runat="server" />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Save to TOB" />
        <br />

        <asp:Label 
            ID="Label2" 
            runat="server">
        </asp:Label>
    
    </div>
    </form>
</body>
</html>