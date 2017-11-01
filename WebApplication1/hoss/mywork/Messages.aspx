﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="HOSS.Messages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
        }
        .auto-style7 {
            text-align: left;
        }
        .auto-style8 {
            height: 63px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%; height: 230px; margin-bottom: 139px;">
        <tr>
            <td class="auto-style8" colspan="3">
                <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="~/Default.aspx">Home</asp:HyperLink>
                <strong>&nbsp;&gt;
                </strong>
                <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="~/mywork/Appointments/Appointment.aspx">Patient&#39;s Home Page</asp:HyperLink>
                <strong>&nbsp;&gt;
                </strong>
                <asp:HyperLink ID="HyperLink13" runat="server">Send Message</asp:HyperLink>
                <strong>
                <br />
                <br />
                <br />
                Send To:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="UserName" DataValueField="UserName">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [UserName] FROM [DoctorTable]" OnSelecting="SqlDataSource2_Selecting"></asp:SqlDataSource>
                </strong>
            </td>
        </tr>
        <tr>
            <td class="auto-style7" colspan="3"><strong>Message</strong>:</td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:TextBox ID="msgTextbox" runat="server" Height="94px" TextMode="MultiLine" Width="399px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Button ID="sendButton" runat="server" Height="49px" Text="Send" Width="151px" OnClick="sendButton_Click" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6" colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1170px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [MsgTable]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [MsgTable] WHERE [Id] = @original_Id AND [FromUserName] = @original_FromUserName AND [ToUserName] = @original_ToUserName AND [MsgText] = @original_MsgText AND [MsgDate] = @original_MsgDate" InsertCommand="INSERT INTO [MsgTable] ([FromUserName], [ToUserName], [MsgText], [MsgDate]) VALUES (@FromUserName, @ToUserName, @MsgText, @MsgDate)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [MsgTable] SET [FromUserName] = @FromUserName, [ToUserName] = @ToUserName, [MsgText] = @MsgText, [MsgDate] = @MsgDate WHERE [Id] = @original_Id AND [FromUserName] = @original_FromUserName AND [ToUserName] = @original_ToUserName AND [MsgText] = @original_MsgText AND [MsgDate] = @original_MsgDate">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_FromUserName" Type="String" />
                        <asp:Parameter Name="original_ToUserName" Type="String" />
                        <asp:Parameter Name="original_MsgText" Type="String" />
                        <asp:Parameter Name="original_MsgDate" Type="DateTime" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="FromUserName" Type="String" />
                        <asp:Parameter Name="ToUserName" Type="String" />
                        <asp:Parameter Name="MsgText" Type="String" />
                        <asp:Parameter Name="MsgDate" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="FromUserName" Type="String" />
                        <asp:Parameter Name="ToUserName" Type="String" />
                        <asp:Parameter Name="MsgText" Type="String" />
                        <asp:Parameter Name="MsgDate" Type="DateTime" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_FromUserName" Type="String" />
                        <asp:Parameter Name="original_ToUserName" Type="String" />
                        <asp:Parameter Name="original_MsgText" Type="String" />
                        <asp:Parameter Name="original_MsgDate" Type="DateTime" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
