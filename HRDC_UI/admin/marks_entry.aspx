﻿<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="marks_entry.aspx.cs" Inherits="HRDC_UI.admin.marks_entry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="card shadow-lg p-4">
        <h2 class="text-primary mb-4">Marks Entry</h2>

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
        </fieldset>

        <fieldset class="border p-3 mb-4">
            <legend class="float-none w-auto px-3">Enter Marks</legend>
            <asp:GridView ID="gvMarks" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped">
                <Columns>
                    <asp:BoundField DataField="EmployeeId" HeaderText="Employee ID" />
                    <asp:BoundField DataField="Name" HeaderText="Employee Name" />
                    <asp:TemplateField HeaderText="Marks">
                        <ItemTemplate>
                            <asp:TextBox ID="txtMarks" runat="server" CssClass="form-control" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </fieldset>

        <div class="d-flex gap-2 mb-3">
            <asp:Button ID="btnSubmit" runat="server" Text="Save Marks" CssClass="btn btn-success" />
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="text-success fw-bold" />
    </div>

</asp:Content>
