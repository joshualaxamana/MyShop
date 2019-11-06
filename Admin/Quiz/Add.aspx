<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Admin_Quiz_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    <i class="fa fa-plus"></i>Add a Couple
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
                        class="form-control" TextMode="Date" required />
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
                <div class="col-lg-offset-4 col-lg-8">
                    <asp:Button ID="btnAdd" runat="server" 
                        CssClass="btn btn-success" Text="Add" />
                </div>
            </div>
            </div>
    </form>
</asp:Content>



