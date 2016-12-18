<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SendMail.aspx.cs" Inherits="SendMail" %>


<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.ASPxRichEdit.v15.1, Version=15.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRichEdit" tagprefix="dx" %>


<%@ Register assembly="Dado.Validators" namespace="Dado.Validators" tagprefix="Dado" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Send E-mail</title>
    <link rel="stylesheet" href="Content/AjaxControlToolkit/Styles/global.css" />
    <link rel="stylesheet" href="Content/AjaxControlToolkit/Styles/styles.css" />
    <link rel="stylesheet" href="assets/css/styles.css" />
    <!--<link href="StyleSheet.css" rel="stylesheet" type="text/css" />-->

     <asp:PlaceHolder runat="server">
        <%: System.Web.Optimization.Styles.Render("~/Content/AjaxControlToolkit/Styles/Bundle") %>
    </asp:PlaceHolder>
    <script src ="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 99%;
        }
        #TextArea1 {
            height: 202px;
            width: 430px;
        }
        #message_area {            height: 222px;
            width: 589px;
        }
        .auto-style14 {
            width: 69px;
        }
        .auto-style15 {
            width: 135px;
            height: 29px;
        }
        .auto-style16 {
            height: 29px;
            width: 266px;
        }
        .auto-style17 {
            width: 69px;
            height: 29px;
        }
        .auto-style22 {
            width: 148px;
        }
        .auto-style23 {
            width: 266px;
        }
        .auto-style28 {
            width: 135px;
        }
        .auto-style30 {
            width: 156px;
            height: 3px;
        }
        .auto-style31 {
            height: 3px;
        }
        .auto-style33 {
            width: 156px;
            height: 46px;
        }
        .auto-style34 {
            height: 46px;
        }
        .auto-style35 {
            width: 156px;
        }
        .auto-style37 {
            width: 100%;
        }
        .auto-style38 {
            width: 40px;
        }

        .auto-style39 {
            width: 173px;
        }
        .auto-style40 {
            width: 173px;
            height: 3px;
        }
        .auto-style41 {
            width: 173px;
            height: 46px;
        }

    </style>
</head>
<body style="background-color:teal">
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div>

    <header style="color:grey; Background:blanchedalmond; height: 122px;">
        &nbsp;<table class="auto-style37">
            <tr>
                <td>&nbsp;</td>
                <td>
        <asp:Label ID="welcome_lbl" runat="server" Text="Hello"></asp:Label>
        <asp:Button ID="logout_btn" runat="server" OnClick="logout_btn_Click" Text="Logout" 
                        style="margin-left: 735px" />
                </td>
            </tr>
        </table>
        <h2 style="text-align:center">CFM Group Application</h2>
       <!-- <img src="assests/img/imv.jpg" alt="imv_logo" id="imvLogo" 
            style="width: 270px; height: 68px" />
        <img src="assests/img/imh.jpg" alt="imh_logo" id="imhLogo" 
            style="width: 285px; height: 69px" />
        <img src="assests/img/ciac.jpg" alt="ciac_logo" id ="ciacLogo"
            style="height: 48px; width: 289px" /> -->
    </header>

        <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
            Height="1407px" Width="873px" style="margin: 0px auto" Font-Bold="False" 
            Font-Italic="False" Font-Names="Calibri" Font-Size="Medium" 
            Font-Strikeout="False" Font-Underline="False">
            <ajaxToolkit:TabPanel ID="new_business" runat="server" HeaderText="New Business">
                <HeaderTemplate>
                    New Business
                </HeaderTemplate>
                <ContentTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style39">
                                <asp:Label ID="Label2" runat="server" Text="To (Email):"></asp:Label>
                            </td>
                            <td class="auto-style35">
                                <asp:TextBox ID="to_email" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="to_email" ErrorMessage="Required" ForeColor="Red" ValidationGroup="sendButton"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="to_email" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style39">
                                <asp:Label ID="Label18" runat="server" Text="Name:"></asp:Label>
                            </td>
                            <td class="auto-style35">
                                <asp:TextBox ID="fullname_txtbox" runat="server"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style39">
                                <asp:Label ID="Label3" runat="server" Text="Subject:"></asp:Label>
                            </td>
                            <td class="auto-style35">
                                <asp:TextBox ID="subject" runat="server" ReadOnly="True" Font-Bold="True" 
                                    Font-Italic="True">Cover Note</asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="subject" ErrorMessage="Required" ForeColor="Red" ValidationGroup="sendButton"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style39">
                                &nbsp;</td>
                            <td class="auto-style35">
                                <fieldset>
                                    <legend>
                                        Select Documents
                                    </legend>
                                     <asp:CheckBoxList ID="CheckBoxList2" runat="server" RepeatColumns="3" 
                                        Width="495px" 
                                      
                                        RepeatDirection="Horizontal">
                                    <asp:ListItem>Proposal Form</asp:ListItem>
                                    <asp:ListItem>Drivers License</asp:ListItem>
                                    <asp:ListItem>Named Licence</asp:ListItem>
                                    <asp:ListItem>DDM Zurich</asp:ListItem>
                                         <asp:ListItem>DDM ALZ</asp:ListItem>
                                    <asp:ListItem>Close Premium Finance</asp:ListItem>
                                    <asp:ListItem>Full NDE</asp:ListItem>
                                    <asp:ListItem>4 yr NDE</asp:ListItem>
                                         <asp:ListItem>3 yr NDE</asp:ListItem>
                                         <asp:ListItem>2 yr NDE</asp:ListItem>
                                         <asp:ListItem>1 yr NDE</asp:ListItem>
                                         <asp:ListItem>Full NCD</asp:ListItem>
                                         <asp:ListItem>4 yr NCD</asp:ListItem>
                                         <asp:ListItem>3 yr NCD</asp:ListItem>
                                         <asp:ListItem>2 yr NCD</asp:ListItem>
                                         <asp:ListItem>1 yr NCD</asp:ListItem>
                                         <asp:ListItem>Gap in Cover</asp:ListItem>
                                         <asp:ListItem>Sold car Declaration</asp:ListItem>
                                         <asp:ListItem>Surrender of NCB</asp:ListItem>
                                         <asp:ListItem>Valid/Current NCT Cert</asp:ListItem>
                                         <asp:ListItem>Valid VLC/Logbook</asp:ListItem>
                                </asp:CheckBoxList>
                                </fieldset>
                            </td>
                            <td>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style39">
                                <asp:Label ID="Label19" runat="server" Text="Inception Date"></asp:Label>
                            </td>
                            <td  colspan="1" class="auto-style35">
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" 
                                    TargetControlID="TextBox2" 
                                    BehaviorID="_content_TextBox2_CalendarExtender" Format="dd.MM.yyyy" />
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server" Visible="False"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" 
                                    BehaviorID="TextBox3_CalendarExtender" TargetControlID="TextBox3" 
                                    Format="dd.MM.yyyy"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style39">
                                <asp:Label ID="Label20" runat="server" Text="Gross:"></asp:Label>
                            </td>
                            <td class="auto-style35" colspan="1">
                                <asp:TextBox ID="gross_amt" runat="server"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style39">
                                <asp:Label ID="Label21" runat="server" Text="Charge:"></asp:Label>
                            </td>
                            <td class="auto-style35" colspan="1">
                                <asp:TextBox ID="chrg" runat="server"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style41">
                                <asp:Label ID="Label16" runat="server" Text="Select a Policy"></asp:Label>
                            </td>
                            <td class="auto-style33">
                               
                                
                                <asp:FileUpload ID="FileUpload3" runat="server" />
                               
                                
                            </td>
                            <td class="auto-style34">
                                </td>
                        </tr>
                        <tr>
                            <td class="auto-style41">&nbsp;</td>
                            <td class="auto-style34">
                                <fieldset>
                                    <legend>Select Policy Benefits</legend>

                                    <asp:CheckBoxList ID="CheckBoxList3" runat="server" Height="101px" 
                                        RepeatColumns="3" Width="496px">
                                        <asp:ListItem>Open Drive</asp:ListItem>
                                        <asp:ListItem>Windscreen Cover</asp:ListItem>
                                        <asp:ListItem>Step Back Bonus</asp:ListItem>
                                        <asp:ListItem>Legal Expenses</asp:ListItem>
                                        <asp:ListItem>Driving Other Vans</asp:ListItem>
                                        <asp:ListItem>European Cover</asp:ListItem>
                                        <asp:ListItem>Excess of only (€250)</asp:ListItem>
                                        <asp:ListItem>Third Party Foreign Theft</asp:ListItem>
                                        <asp:ListItem>Third Party Only</asp:ListItem>
                                    </asp:CheckBoxList>

                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style39">
                                <asp:Label ID="Label17" runat="server" Text="Proposal Form"></asp:Label>
                            </td>
                            <td class="auto-style35">
                                <asp:FileUpload ID="FileUpload4" runat="server" 
                                    ToolTip="Click to choose your file" />
                            </td>
                            <td>
                                <fieldset style="visibility:hidden">
                                    <legend>Terms of Business </legend>
                                </fieldset> </td>
                        </tr>
                        <tr>
                            <td class="auto-style40">
                                <asp:Label ID="Label22" runat="server" Text="DDM/CPF"></asp:Label>
                            </td>
                            <td class="auto-style30">
                                <asp:FileUpload ID="FileUpload5" runat="server" />
                            </td>
                            <td class="auto-style31">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style40">
                                <asp:Label ID="Label23" runat="server" Text="Gap in Cover"></asp:Label>
                            </td>
                            <td class="auto-style30">
                                <asp:FileUpload ID="FileUpload6" runat="server" />
                            </td>
                            <td class="auto-style31">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style40">
                                <asp:Label ID="Label24" runat="server" Text="Sold car Declaration"></asp:Label>
                            </td>
                            <td class="auto-style30">
                                <asp:FileUpload ID="FileUpload7" runat="server" />
                            </td>
                            <td class="auto-style31">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style40">
                                <asp:Label ID="Label25" runat="server" Text="Surrender of NCB"></asp:Label>
                            </td>
                            <td class="auto-style30">
                                <asp:FileUpload ID="FileUpload8" runat="server" />
                            </td>
                            <td class="auto-style31">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style39">&nbsp;</td>
                            <td class="auto-style35">
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:CFMConnectionString %>" 
                                    SelectCommand="SELECT * FROM [TOB]"></asp:SqlDataSource>
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" 
                                    DataSourceID="SqlDataSource3" DataTextField="Filename" 
                                    DataValueField="Data">
                                </asp:RadioButtonList>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style39">&nbsp;</td>
                            <td class="auto-style35">
                                <asp:Button ID="Button7" runat="server" Height="28px" OnClick="Button7_Click" 
                                    Text="Send" Width="95px" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="re_new" runat="server" HeaderText="Renewals">
                <HeaderTemplate>
                    Renewals
                </HeaderTemplate>
                <ContentTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style28">
                                <asp:Label ID="Label7" runat="server" Text="To (Email):"></asp:Label>
                            </td>
                            <td class="auto-style23">
                                <asp:TextBox ID="to_ren" runat="server" style="margin-left: 1px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="to_ren" ErrorMessage="Required" ForeColor="Red" 
                                    Enabled="False"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                    ControlToValidate="to_ren" ErrorMessage="Invalid Email" ForeColor="Red" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    Enabled="False"></asp:RegularExpressionValidator>
                            </td>
                            <td class="auto-style14">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style28">
                                <asp:Label ID="Label10" runat="server" Text="First Name"></asp:Label>
                            </td>
                            <td class="auto-style23">
                                <asp:TextBox ID="f_name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="f_name" ErrorMessage="Required" ForeColor="Red" 
                                    Enabled="False"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style14">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style28">
                                <asp:Label ID="Label11" runat="server" Text="Last Name"></asp:Label>
                            </td>
                            <td class="auto-style23">
                                <asp:TextBox ID="l_name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="l_name" ErrorMessage="Required" ForeColor="Red" 
                                    Enabled="False"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style14">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style28">
                                <asp:Label ID="Label8" runat="server" Text="Subject"></asp:Label>
                            </td>
                            <td class="auto-style23">
                                <asp:TextBox ID="subj_ren" runat="server" Font-Bold="True" Font-Italic="True" 
                                    ReadOnly="True">Renewal Notice</asp:TextBox>
                            </td>
                            <td class="auto-style14">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style15">
                                <asp:RadioButtonList ID="RadioButtonList3" runat="server" 
                                    OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged1" 
                                    AutoPostBack="True">
                                    <asp:ListItem>Existing Insurer</asp:ListItem>
                                    <asp:ListItem>Alternate Insurer</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td class="auto-style16">
                                <table class="auto-style1">
                                    <tr>
                                        <td class="auto-style22">
                                            <asp:Label ID="alt_insur_lbl" runat="server" Text="Alternate Insurance Company" 
                                                Visible="False"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="alt_insur" runat="server" Visible="False" 
                                                style="margin-left: 0px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style22">
                                            <asp:Label ID="amt_alt_lbl" runat="server" Text="Amount" Visible="False"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="amt_alt" runat="server" Visible="False">€0.00</asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="auto-style17"></td>
                        </tr>
                        <tr>
                            <td class="auto-style28">
                                <asp:Label ID="exist_insur_lbl" runat="server" Text="Existing Insurer" 
                                    Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style23">
                                <asp:TextBox ID="insure_coy" runat="server" Visible="False"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                    ControlToValidate="insure_coy" ErrorMessage="Required" ForeColor="Red" 
                                    Enabled="False"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style14">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style28">
                                <asp:Label ID="amtexist_lbl" runat="server" Text="Amount" Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style23">
                                <asp:TextBox ID="amt" runat="server" Visible="False">€0.00</asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                    ControlToValidate="amt" ErrorMessage="Required" ForeColor="Red" 
                                    Enabled="False"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style14">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style28">
                                <asp:Label ID="Label13" runat="server" Text="Date"></asp:Label>
                            </td>
                            <td class="auto-style23">
                                <asp:TextBox ID="date" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="date_CalendarExtender" runat="server" 
                                    BehaviorID="_content_date_CalendarExtender" Format="dd-MM-yyyy" 
                                    TargetControlID="date" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                    ControlToValidate="date" ErrorMessage="Required" ForeColor="Red" 
                                    Enabled="False"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style14">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style28">
                                <asp:Label ID="Label14" runat="server" Text="No Claims Bonus"></asp:Label>
                            </td>
                            <td class="auto-style23">
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </td>
                            <td class="auto-style14">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style28">
                                <asp:Label ID="Label15" runat="server" Text="Reason Why Statement"></asp:Label>
                            </td>
                            <td class="auto-style23">
                                <asp:FileUpload ID="FileUpload2" runat="server" />
                            </td>
                            <td class="auto-style14">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style28">
                                <asp:Label ID="Label9" runat="server" Text="Message" Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style23">
                                <textarea style="width:430px; height:200px" id="TextArea1" runat="server" 
                                    visible="False"></textarea> </td>
                            <td class="auto-style14">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style28">&nbsp;</td>
                            <td class="auto-style23">
                                <br />
                                <asp:Button ID="Button6" runat="server" Text="Send" Width="68px" 
                                    OnClick="Button6_Click" />
                            </td>
                            <td class="auto-style14">&nbsp;</td>
                        </tr>
                    </table>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="xxx" runat="server" HeaderText="Unknown">
                <ContentTemplate>
                    <div id="uploads">
                        <table class="auto-style37">
                            <tr>
                                <td class="auto-style38">
                                    &nbsp;</td>
                                <td>
                                   
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style38">&nbsp;</td>
                                <td>
                                    
                                </td>
                            </tr>
                        </table>
                    </div>
                   
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
    </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
    <footer style="text-align:center; color:gold; font-style:italic; font-size:inherit">
        &copy; 2015 Yemi Adewale for CFM Group - All rights reserved.
    </footer>
</body>
</html>
