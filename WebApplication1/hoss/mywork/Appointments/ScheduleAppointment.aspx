<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ScheduleAppointment.aspx.cs" Inherits="HOSS.ScheduleAppointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style10 {
        width: 365px;
    }
    .auto-style6 {
        height: 100px;
        text-align: left;
    }
    .auto-style11 {
        height: 100px;
        width: 365px;
    }
    .auto-style7 {
        height: 23px;
    }
    .auto-style12 {
        height: 23px;
        width: 365px;
    }
    .auto-style8 {
        height: 218px;
        text-align: left;
    }
    .auto-style13 {
        height: 218px;
        width: 365px;
    }
    .auto-style9 {
        height: 21px;
    }
    .auto-style14 {
        height: 21px;
        width: 365px;
    }
    .auto-style15 {
        width: 365px;
        text-align: left;
    }
    .auto-style16 {
        text-align: left;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
&nbsp;<asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="~/Default.aspx">Home</asp:HyperLink>
&nbsp;&gt;
        <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/mywork/Appointments/Appointment.aspx">Patient Home Page</asp:HyperLink>
&nbsp;&gt;
        <asp:HyperLink ID="HyperLink11" runat="server">Schedule Appointment</asp:HyperLink>
    </p>
    <h2 class="auto-style16"> Add Appointment</h2>
    <p class="auto-style16"> &nbsp;</p>
    
    <table>
    <tr>
    <td class="auto-style16">
        Location</td>
    <td class="auto-style10">
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged1" Height="17px" Width="105px">
            <asp:ListItem>Select</asp:ListItem>
        </asp:DropDownList>
    </td>
    </tr>
    
    <tr>
    <td class="auto-style16">
        Doctor:</td>
    <td class="auto-style10">
        <asp:DropDownList ID="DropDownList1" runat="server" Height="16px" Width="109px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Location] FROM [DoctorTable]"></asp:SqlDataSource>
        <br />
        <br />
    </td>
    </tr>
    
    <tr>
    <td class="auto-style6">
     Appointment Text : 
    </td>
    <td class="auto-style11">
        <asp:TextBox ID="txtText" runat="server"  TextMode="MultiLine" Rows="5" Columns ="30"></asp:TextBox>
    </td>
    </tr>
    
    <tr>
    <td class="auto-style7">
    </td>
    <td class="auto-style12">
    </td>
    </tr>
    
    <tr>
    <td class="auto-style8">
     Appointment Date :  
    </td>
    <td class="auto-style13">
    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar1_SelectionChanged" Width="350px">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
        <TodayDayStyle BackColor="#CCCCCC" />
        </asp:Calendar>
        <div class="auto-style16">
        <asp:TextBox ID="txtDate" runat="server"  size="20" Width="96px"></asp:TextBox> (MM/DD/YY)
        </div>
    </td>
    </tr>
    
    <tr>
    <td class="auto-style9">
    </td>
    <td class="auto-style14">
    </td>
    </tr>
    
    <tr>
    <td class="auto-style16">
     Appointment  Time :  
    </td>
    <td class="auto-style15">
        <asp:DropDownList ID="DropDownList3" runat="server">
            <asp:ListItem>10:00</asp:ListItem>
            <asp:ListItem>10:30</asp:ListItem>
            <asp:ListItem>11:00</asp:ListItem>
            <asp:ListItem>11:30</asp:ListItem>
            <asp:ListItem>12:00</asp:ListItem>
            <asp:ListItem>12:30</asp:ListItem>
            <asp:ListItem>13:00</asp:ListItem>
            <asp:ListItem>13:30</asp:ListItem>
            <asp:ListItem>14:00</asp:ListItem>
        </asp:DropDownList>
    </td>
    </tr>
    
    <tr>
    <td class="auto-style16">
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Check for Availability" />
        </td>
    <td class="auto-style10">
        &nbsp;</td>
    </tr>
    
    </table>
    
    <p />
    <asp:Button ID="btnAdd" runat="server" Text="Add Appointment" 
            onclick="btnAdd_Click" Height="65px" Width="368px" Visible="False" />
        <p />
            &nbsp;
    
</asp:Content>
