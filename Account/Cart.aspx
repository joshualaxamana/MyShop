﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    <i class="fa fa-shopping-cart"></i>My Cart
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-9">
            <table class="table table-hover">
                <thead>
                    <th colspan="2">Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Amount</th>
                    <th>Actions</th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvCart" runat="server" 
                        OnItemCommand="lvCart_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <img src='../content/img/products/<%# Eval("Image")%>'
                                        width="150" class="img-responsive" />
                                </td>
                                <td>
                                    <asp:Literal ID="ltProductID" runat="server"
                                        Text='<%# Eval("ProductID") %>' Visible="false" />
                                    <asp:Literal ID="ltRefNo" runat="server"
                                        Text='<%# Eval("RefNo") %>' Visible="false" />
                                    <a href='../Details.aspx?ID=<%# Eval("ProductID") %>'>
                                        <%# Eval("Name") %> (<%# Eval("Code") %>)<br />
                                        <small>Category: <%# Eval("Category") %></small>
                                    </a>
                                </td>
                                <td>
                                    Php<%# Eval("Price", "{0: #,###,###.00}") %>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtQty" runat="server"
                                        class="form-control" type="number"
                                        min="1" max="99" Text='<%# Eval("Quantity") %>'
                                        required />
                                </td>
                                <td>
                                    Php<%# Eval("Amount", "{0: #,###,###.00}") %>
                                </td>
                                <td>
                                    <asp:LinkButton ID="btnUpdate" runat="server"
                                        class="btn btn-xs btn-info" CommandName="updateqty">
                                        <i class="fa fa-refresh"></i>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" runat="server"
                                        class="btn btn-xs btn-danger" CommandName="removeitem">
                                        <i class="fa fa-remove"></i>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <tr>
                                <td colspan="6">
                                    <h2 class="text-center">No Items Found</h2>
                                </td>
                            </tr>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </tbody>
            </table>
        </div>
        <div class="col-lg-3 well">
            <h3>Payment Summary</h3>
            <table class="table table-hover">
                <tbody>
                    <tr>
                        <td>Gross Amount</td>
                        <td align="right">
                            Php<asp:Literal ID="ltGross" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>VAT (12%)</td>
                        <td align="right">
                            Php<asp:Literal ID="ltVAT" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Delivery Fee</td>
                        <td align="right">
                            Php<asp:Literal ID="ltDelivery" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Total Amount</td>
                        <td align="right">
                            Php<asp:Literal ID="ltTotal" runat="server" />
                        </td>
                    </tr>
                </tbody>
            </table>
            <asp:LinkButton ID="btnCheckOut" runat="server"
                class="btn btn-success btn-lg btn-block"
                PostBackUrl="~/Account/Checkout.aspx">
                <i class="fa fa-money"></i> Checkout
            </asp:LinkButton>
        </div>
    </form>
</asp:Content>

