<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Admin_Quiz_Details" %>


<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    <i class="fa fa-user"></i> Update a Couple
    Supplier #<asp:Literal ID="ltID" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-4">Groom's Name</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtGroom" runat="server"
                        class="form-control text-capitalize" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Bride's Name</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtBride" runat="server"
                        class="form-control text-capitalize" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Wedding Date</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtDate" runat="server"
                        class="form-control" TextMode="DateTime" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Ceremony Venue</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtCeremony" runat="server"
                        class="form-control" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Reception Venue</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtReception" runat="server"
                        class="form-control" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Status</label>
                <div class="col-lg-8">
                    <asp:DropDownList ID="ddlStatus" runat="server"
                        class="form-control">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Inactive</asp:ListItem>
                        <asp:ListItem>Archived</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-4 col-lg-8">
                    <asp:Button ID="btnUpdate" runat="server"
                        class="btn btn-success" Text="Update"
                        OnClick="btnUpdate_Click" />
                    <a href="Default.aspx" class="btn btn-default">Back to View
                    </a>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
