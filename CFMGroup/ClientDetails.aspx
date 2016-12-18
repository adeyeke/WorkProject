<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ClientDetails.aspx.cs" Inherits="ClientDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 78%;
            height: 10px;
        }
        .auto-style2 {
            width: 225px;
        }
        .auto-style3 {
            width: 315px;
        }
        .auto-style4 {
            width: 106px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label1" runat="server" Text="Select Excel file:"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:FileUpload ID="fileuploadexcel" runat="server" />
                </td>
                <td class="auto-style3">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Import File" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CFMConnectionString %>" SelectCommand="SELECT * FROM [Clients]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="First Name" HeaderText="First Name" SortExpression="First Name" />
                    <asp:BoundField DataField="Last Name" HeaderText="Last Name" SortExpression="Last Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Action" ShowHeader="True" Text="Send Email" />
                </Columns>
            </asp:GridView>
        </p>
    <div>
    
    </div>
    </form>
</body>
</html>
