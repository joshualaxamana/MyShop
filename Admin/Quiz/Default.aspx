<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Quiz_Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    <i class="fa fa-users"></i>View Couples
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <form runat="server" class="form-horizontal">
        <asp:Panel ID="pnlSuppliers" runat="server"
            DefaultButton="btnSearch">
            <div class="col-lg-offset-6">
                <div class="input-group">
                    <asp:TextBox ID="txtKeyword" runat="server"
                        class="form-control" placeholder="Type a keyword..." />
                    <span class="input-group-btn">
                        <asp:LinkButton ID="btnSearch" runat="server"
                            class="btn btn-info" OnClick="btnSearch_Click">
                        <i class="fa fa-search"></i>
                        </asp:LinkButton>
                    </span>
                </div>
            </div>
            <br />
            <div class="col-lg-12">
                <table class="table table-hover">
                    <thead>
                        <th>#</th>
                        <th>Couple Name</th>
                        <th>Wedding Date</th>
                        <th>Ceremony Venue</th>
                        <th>Reception Venue</th>
                        <th>Date Added</th>
                        <th>Date Modified</th>
                        <th>Actions</th>
                    </thead>
                    <tbody>
                        <asp:ListView ID="lvCouples" runat="server" OnItemCommand="lvCouples_ItemCommand"
                            OnPagePropertiesChanging="lvCouples_PagePropertiesChanging"
                            OnItemDataBound="lvCouples_ItemDataBound">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Literal ID="ltCoupleID" runat="server"
                                            Text='<%# Eval("CoupleID") %>' /></td>
                                    <td><%# Eval("CoupleName") %></td>
                                    <td><%# Eval("Ceremony") %></td>
                                    <td><%# Eval("Reception") %></td>
                                    <td><%# Eval("Status") %></td>
                                    <td><%# Eval("DateAdded", "{0: MMMM dd, yyyy}") %></td>
                                    <td><%# Eval("DateModified", "{0: MMMM dd, yyyy}") %></td>
                                    <td>
                                        <a href='Details.aspx?ID=<%# Eval("CoupleID") %>'
                                            class="btn btn-xs btn-info" title="View Details">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <asp:LinkButton ID="btnDelete" runat="server"
                                            class="btn btn-xs btn-danger" title="Archive Record"
                                            CommandName="archive"
                                            OnClientClick='return confirm("Archive record?");'>
                                        <i class="fa fa-remove"></i>
                                        </asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <tr>
                                    <td colspan="8">
                                        <h2 class="text-center">No records found.</h2>
                                    </td>
                                </tr>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
                <center>
                <asp:DataPager ID="dpCouples" runat="server"
                    PagedControlID="lvCouples" PageSize="10">
                    <Fields>
                        <asp:NumericPagerField
                            ButtonType="Button"
                            CurrentPageLabelCssClass="btn btn-success"
                            NumericButtonCssClass="btn btn-default"
                            NextPreviousButtonCssClass="btn btn-default"
                            ButtonCount="5" />  
                    </Fields>
                </asp:DataPager>
            </center>
            </div>
        </asp:Panel>
    </form>
</asp:Content>
