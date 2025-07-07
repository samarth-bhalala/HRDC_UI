<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="HRDC.Attendance" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Attendance Management</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Attendance Management</h2>

        <asp:Label ID="lblSelect" runat="server" Text="Select Training Session:"></asp:Label>
        <asp:DropDownList ID="ddlTrainingSessions" runat="server" AutoPostBack="false"></asp:DropDownList>
        <asp:Button ID="btnLoad" runat="server" Text="Load Employees" OnClick="btnLoad_Click" /><br /><br />

        <asp:GridView ID="gvAttendance" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="EmployeeId" HeaderText="Employee ID" />
                <asp:BoundField DataField="Name" HeaderText="Employee Name" />
                <asp:TemplateField HeaderText="Present?">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkPresent" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Save Attendance" OnClick="btnSubmit_Click" />
        <br /><asp:Label ID="lblMessage" runat="server" ForeColor="Green" />
    </form>
</body>
</html>
