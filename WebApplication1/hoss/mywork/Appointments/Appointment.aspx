<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="HOSS.mywork.Appointments.Appointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style6 {
        font-size: x-large;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/Default.aspx">Home</asp:HyperLink>
&nbsp;&gt;
        <asp:HyperLink ID="HyperLink10" runat="server">Patient Home Page</asp:HyperLink>
    </p>
    <p class="auto-style6">
        <strong>Upcoming Appointments</strong></p>
<p>
    <asp:Button ID="btnAdd" runat="server" Height="55px" OnClick="btnAdd_Click" Text="Add Appointment" Width="260px" />
</p>
    <p>
        <asp:GridView ID="GridView3" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="975px" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
</p>
<p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Reason], [AppointmentDate], [AppointmentTime], [Id] FROM [AppointmentTable]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [AppointmentTable] WHERE [Id] = @original_Id AND [Reason] = @original_Reason AND [AppointmentDate] = @original_AppointmentDate AND [AppointmentTime] = @original_AppointmentTime" InsertCommand="INSERT INTO [AppointmentTable] ([Reason], [AppointmentDate], [AppointmentTime]) VALUES (@Reason, @AppointmentDate, @AppointmentTime)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [AppointmentTable] SET [Reason] = @Reason, [AppointmentDate] = @AppointmentDate, [AppointmentTime] = @AppointmentTime WHERE [Id] = @original_Id AND [Reason] = @original_Reason AND [AppointmentDate] = @original_AppointmentDate AND [AppointmentTime] = @original_AppointmentTime">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_Reason" Type="String" />
            <asp:Parameter DbType="Date" Name="original_AppointmentDate" />
            <asp:Parameter DbType="Time" Name="original_AppointmentTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Reason" Type="String" />
            <asp:Parameter DbType="Date" Name="AppointmentDate" />
            <asp:Parameter DbType="Time" Name="AppointmentTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Reason" Type="String" />
            <asp:Parameter DbType="Date" Name="AppointmentDate" />
            <asp:Parameter DbType="Time" Name="AppointmentTime" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_Reason" Type="String" />
            <asp:Parameter DbType="Date" Name="original_AppointmentDate" />
            <asp:Parameter DbType="Time" Name="original_AppointmentTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p class="auto-style6">
        <strong>Messages</strong></p>
    <p class="auto-style6">
        <asp:Button ID="Button1" runat="server" Height="53px" OnClick="Button1_Click" Text="Send new message" Width="260px" />
</p>
<p>
    <asp:GridView ID="GridView4" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1023px">
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [AppointmentTable] WHERE [Id] = @original_Id AND [DoctorID] = @original_DoctorID AND [PatientID] = @original_PatientID AND [Reason] = @original_Reason AND [AppointmentDate] = @original_AppointmentDate AND [AppointmentTime] = @original_AppointmentTime" InsertCommand="INSERT INTO [AppointmentTable] ([DoctorID], [PatientID], [Reason], [AppointmentDate], [AppointmentTime]) VALUES (@DoctorID, @PatientID, @Reason, @AppointmentDate, @AppointmentTime)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [AppointmentTable]" UpdateCommand="UPDATE [AppointmentTable] SET [DoctorID] = @DoctorID, [PatientID] = @PatientID, [Reason] = @Reason, [AppointmentDate] = @AppointmentDate, [AppointmentTime] = @AppointmentTime WHERE [Id] = @original_Id AND [DoctorID] = @original_DoctorID AND [PatientID] = @original_PatientID AND [Reason] = @original_Reason AND [AppointmentDate] = @original_AppointmentDate AND [AppointmentTime] = @original_AppointmentTime">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_DoctorID" Type="Int32" />
            <asp:Parameter Name="original_PatientID" Type="Int32" />
            <asp:Parameter Name="original_Reason" Type="String" />
            <asp:Parameter Name="original_AppointmentDate" DbType="Date" />
            <asp:Parameter DbType="Time" Name="original_AppointmentTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DoctorID" Type="Int32" />
            <asp:Parameter Name="PatientID" Type="Int32" />
            <asp:Parameter Name="Reason" Type="String" />
            <asp:Parameter Name="AppointmentDate" DbType="Date" />
            <asp:Parameter DbType="Time" Name="AppointmentTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DoctorID" Type="Int32" />
            <asp:Parameter Name="PatientID" Type="Int32" />
            <asp:Parameter Name="Reason" Type="String" />
            <asp:Parameter Name="AppointmentDate" DbType="Date" />
            <asp:Parameter Name="AppointmentTime" DbType="Time" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_DoctorID" Type="Int32" />
            <asp:Parameter Name="original_PatientID" Type="Int32" />
            <asp:Parameter Name="original_Reason" Type="String" />
            <asp:Parameter DbType="Date" Name="original_AppointmentDate" />
            <asp:Parameter DbType="Time" Name="original_AppointmentTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </p>
<p>
    &nbsp;</p>
</asp:Content>
