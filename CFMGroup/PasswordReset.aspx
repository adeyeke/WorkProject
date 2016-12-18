<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PasswordReset.aspx.cs" Inherits="PasswordReset" %>

<!DOCTYPE html>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        height: 20px;
        width: 111px;
    }
    .auto-style3 {
        width: 298px;
    }
    .auto-style4 {
        height: 20px;
        width: 298px;
    }
    .auto-style5 {
        width: 130px;
    }
    .auto-style6 {
        height: 20px;
        width: 130px;
    }
    .auto-style7 {
        width: 111px;
    }
</style>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Reset Password Form</title>
  <link rel="stylesheet" href="css/style.css">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body style="background-color:seagreen">
  <section class="container">
    <div class="login">
      <h1>Reset Password</h1>
        <form id="form1" runat="server">
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            </p>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="username_reset" runat="server" Height="28px" Width="150px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="username_reset" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="password_reset" runat="server" TextMode="Password" Height="28px" Width="150px"></asp:TextBox>
                        <ajaxToolkit:PasswordStrength ID="password_reset_PasswordStrength" runat="server" TargetControlID="password_reset" />
                    </td>
                    <td class="auto-style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="password_reset" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="Label3" runat="server" Text="Confirm Password"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="confirm_pass_reset" runat="server" TextMode="Password" Height="28px" Width="150px"></asp:TextBox>
                        <ajaxToolkit:PasswordStrength ID="confirm_pass_reset_PasswordStrength" runat="server" TargetControlID="confirm_pass_reset" />
                    </td>
                    <td class="auto-style2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" ControlToValidate="confirm_pass_reset" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password_reset" ErrorMessage="Doesn't match" ForeColor="Red" ControlToValidate="confirm_pass_reset"></asp:CompareValidator>
                    </td>
                </tr>
            </table>
            <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" Width="60px"/>
&nbsp;&nbsp;&nbsp;&nbsp;
                <input id="Reset1" type="reset" value="Reset" /></p>
        </form>
    </div>
      <div class="login-help">
      <p>Want to Login? <a href="Login.aspx">Click here to Login</a>.</p>
    </div>
  </section>
    <footer style="text-align:center; color:gold; font-style:italic; font-size:inherit">
        &copy; 2015 Yemi Adewale for CFM Group - All rights reserved.
    </footer>
</body>
</html>

