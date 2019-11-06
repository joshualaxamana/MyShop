<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Posts_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    <i class="fa fa-shopping-cart"></i> View Posts
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-12">
            <table class="table table-hover">
                <thead>
                    <th>#</th>
                    <th>Post Date</th>
                    <th>Post Type</th>
                    <th>Title</th>
                    <th>Featured Image</th>
                    <th>Post</th>
                    <th>Keywords</th>
                    <th>Status</th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvPost" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("PostID") %></td>
                                <td><%# Eval("PostDate", "{0: MM/dd/yyyy}") %></td>
                                <td><%# Eval("PostType") %></td>
                                <td><%# Eval("Title") %></td>
                                <td>
                                    <img src='../../content/img/products/<%# Eval("FeaturedImage") %>'
                                        width="100" />
                                </td>
                                <td>
                                    <%# Server.HtmlDecode(Eval("Post").ToString()) %>
                                </td>
                                <td><%# Eval("Keywords") %></td>
                                <td><%# Eval("Status") %></td>
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <tr>
                                <td colspan="10">
                                    <h2 class="text-center">No records found!
                                    </h2>
                                </td>
                            </tr>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </tbody>
            </table>
        </div>
    </form>
</asp:Content>

