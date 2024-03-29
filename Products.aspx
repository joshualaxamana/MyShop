﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    <i class="fa fa-shopping-cart"></i> My Products
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-jhorizontal">
        <div class="col-lg-3">
            <div class="list-group">
                <a href="Products.aspx" class="list-group-item active">
                    <span class="badge">
                        <asp:Literal ID="ltTotal" runat="server" />
                    </span>
                    All Categories
                </a>
                <asp:ListView ID="lvCategories" runat="server">
                    <ItemTemplate>
                        <a href='Products.aspx?c=<%# Eval("CatID") %>'
                            class="list-group-item">
                            <span class="badge"><%# Eval("TotalCount") %></span>
                            <%# Eval("Category") %>
                        </a>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
        <div class="col-lg-9">
            <asp:ListView ID="lvProducts" runat="server"
                OnItemCommand="lvProducts_ItemCommand">
                <ItemTemplate>
                    <div class="col-lg-4">
                        <asp:Literal ID="ltProductID" runat="server"
                            Text='<%# Eval("ProductID") %>' Visible="false" />
                        <a href='Details.aspx?ID=<%# Eval("ProductID") %>'>
                        <div class="thumbnail">
                            <div style="position:relative; width: 100%; height: 0; 
    padding-bottom: 100% ; background-repeat: no-repeat;
    background-position: top center; background-size: cover;
    background-image: url('content/img/products/<%# Eval("Image") %>');">  
</div>
                        <div class="caption">
                            <p>
                                <h3><%# Eval("Name") %></h3>
                                <h4><%# Eval("Category") %></h4>
                                Php<%# Eval("Price", "{0: #,###.00}") %>
                                <asp:LinkButton ID="btnAddToCart" runat="server"
                                    class="btn btn-success btn-block"
                                    CommandName="addtocart">
                                    <i class="fa fa-plus"></i> Add to Cart
                                </asp:LinkButton>
                            </p>
                        </div>
                        </div>
                        </a>
                    </div>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <br />
                    <h2 class="text-center">
                        No products found.
                    </h2>
                    <br />
                </EmptyDataTemplate>
            </asp:ListView>
        </div>
    </form>
</asp:Content>

