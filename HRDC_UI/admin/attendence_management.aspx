<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="attendence_management.aspx.cs"  %>


<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Attendance Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
 

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <h2 class="text-primary mb-4">Attendance Management</h2>

            <fieldset class="border p-3 mb-4">
                <legend class="float-none w-auto px-3">Select Training Session</legend>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <asp:DropDownList ID="ddlTrainingSessions" runat="server" CssClass="form-select"></asp:DropDownList>
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnLoad" runat="server" Text="Load Employees" CssClass="btn btn-primary" />
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by employee name..." />
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-info" />
                    </div>
                </div>
            </fieldset>

            <fieldset class="border p-3 mb-4">
                <legend class="float-none w-auto px-3">Employee Attendance</legend>
                <asp:GridView ID="gvAttendance" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped">
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
            </fieldset>

            <div class="d-flex gap-2 mb-3">
                <asp:Button ID="btnSubmit" runat="server" Text="Save Attendance" CssClass="btn btn-success" />
                <asp:Button ID="btnExportExcel" runat="server" Text="Export to Excel" CssClass="btn btn-secondary" />
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="text-success fw-bold" />
        </div>
    </div>
</asp:Content>
