<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Admin_Posts_Add" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    <i class="fa fa-plus"></i> Add a Post
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-4">Post Date</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtDate" runat="server"
                        class="form-control" type="date" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Post Type</label>
                <div class="col-lg-8">
                    <asp:DropDownList ID="ddlType" runat="server"
                        class="form-control" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Title</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtTitle" runat="server"
                        class="form-control" MaxLength="20" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Post</label>
                <div class="col-lg-8">
                    <CKEditor:CKEditorControl ID="txtPost" runat="server"></CKEditor:CKEditorControl>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Featured Image</label>
                <div class="col-lg-8">
                    <asp:FileUpload ID="fuImage" runat="server"
                        class="form-control" required />
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-4">Keyword</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtKeyword" runat="server"
                        class="form-control" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Status</label>
                <div class="col-lg-8">
                    <asp:DropDownList ID="ddlStatus" runat="server"
                        class="form-control">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-offset-4 col-lg-8">
                    <asp:Button ID="btnAdd" runat="server"
                        class="btn btn-success" Text="Add" 
                        OnClick="btnAdd_Click" />
                </div>
            </div>
        </div>
    </form>
</asp:Content>



