﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Admin_Suppliers_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    <i class="fa fa-plus"></i>Add a Supplier
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-4">Company Name</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtName" runat="server"
                        class="form-control text-capitalize" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Contact Person</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtContact" runat="server"
                        class="form-control text-capitalize" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Address</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtAddress" runat="server"
                        TextMode="MultiLine"
                        class="form-control" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Phone</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtPhone" runat="server"
                        class="form-control" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Mobile</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtMobile" runat="server"
                        class="form-control" required />
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-4 col-lg-8">
                    <asp:Button ID="btnAdd" runat="server" 
                        CssClass="btn btn-success" Text="Add" OnClick="btnAdd_Click"/>
                </div>
            </div>
            </div>
    </form>
</asp:Content>

