<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DocMessages.aspx.cs" Inherits="HOSS.Doctors.DocMessages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style8 {
            height: 63px;
        }
        .auto-style7 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%; height: 230px; margin-bottom: 139px;">
        <tr>
            <td class="auto-style8">
                <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="~/Default.aspx">Home</asp:HyperLink>
                <strong>&nbsp;&gt;
                </strong>
                <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="~/Doctors/DoctorsHome.aspx">Doctor&#39;s Home Page</asp:HyperLink>
                <strong>&nbsp;&gt;
                </strong>
                <asp:HyperLink ID="HyperLink13" runat="server">Send Message</asp:HyperLink>
                <strong>
                <br />
                <br />
                <br />
                Send To:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="UserName" DataValueField="UserName">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [UserName] FROM [PatientTable]"></asp:SqlDataSource>
                <table style="width: 100%; height: 230px; margin-bottom: 139px;">
        <tr>
            <td class="auto-style7"><strong>
                <br />
                Message</strong>:</td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:TextBox ID="msgTextbox0" runat="server" Height="94px" TextMode="MultiLine" Width="399px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Button ID="sendButton0" runat="server" Height="49px" Text="Send" Width="151px" OnClick="sendButton_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Width="1179px">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                &nbsp;</td>
        </tr>
    </table>
                </strong></td>
        </tr>
    </table>
</asp:Content>
