<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 234px;
    }
    .auto-style3 {
        width: 89px;
    }
</style>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Login Form</title>
  <link rel="stylesheet" href="css/style.css">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body style="background-color:teal">
  <section class="container">
    <div class="login">
      <h1>Login to CFM App</h1>
        <form id="form1" runat="server">
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="user_name" runat="server" Height="26px" Width="138px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="user_name" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="pass_word" runat="server" TextMode="Password" Height="26px" Width="138px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="pass_word" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" Text="Department"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>-- Select Department --</asp:ListItem>
                            <asp:ListItem>Coverinaclick</asp:ListItem>
                            <asp:ListItem>Insuremyhouse</asp:ListItem>
                            <asp:ListItem>Insuremyvan</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" Height="30px" Width="84px" />
&nbsp;&nbsp;&nbsp;
                <input id="Reset1" type="reset" value="Reset" /></p>
        </form>
    </div>

    <div class="login-help">
      <p>Forgot your password? <a href="PasswordReset.aspx">Click here to reset it</a></p>
    </div>
  </section>
<footer style="text-align:center; color:gold; font-style:italic; font-size:inherit">
        &copy; 2015 Yemi Adewale for CFM Group - All rights reserved.
    </footer>
</body>
</html>
