﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeleccionarSucursales.aspx.cs" Inherits="tp7_prog3.SeleccionarSucursales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 219px;
        }
        .auto-style3 {
            font-size: xx-large;
            height: 75px;
            width: 374px;
        }
        .auto-style4 {
            width: 219px;
            height: 75px;
        }
        .auto-style5 {
            height: 75px;
        }
        .auto-style6 {
            text-align: left;
            height: 47px;
        }
        .auto-style7 {
            width: 219px;
            height: 237px;
        }
        .auto-style8 {
            height: 237px;
        }
        .auto-style9 {
            width: 219px;
            height: 47px;
        }
        .auto-style10 {
            height: 47px;
            width: 374px;
        }
        .auto-style12 {
            width: 244px;
            text-align:center;
        }
        .auto-style13 {
            width: 244px;
            text-align:left;
        }
        .auto-style14 {
            margin-left: 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:HyperLink ID="lnkListadoSucursales" runat="server" NavigateUrl="~/SeleccionarSucursales.aspx">Listado de sucursales</asp:HyperLink>
                    </td>
                    <td style="padding-left: 100px;">
                        <asp:HyperLink ID="lnkMostrarSeleccionadas" runat="server" NavigateUrl="~/ListadoSucursalesSeleccionadas.aspx">Mostrar sucursales seleccionadas</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style3"><strong>Listado de sucursales</strong></td>
                    <td class="auto-style5"></td>
                </tr>
                <tr>
                    <td class="auto-style9"></td>
                    <td class="auto-style10">
                        <asp:Label ID="lblBusquedasucursal" runat="server" Text="Busqueda por nombre de sucursal:"></asp:Label>
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtBuscar" runat="server" Width="250px"></asp:TextBox>
                        <asp:Button ID="btnBuscar" runat="server" CssClass="auto-style14" OnClick="btnBuscar_Click" Text="Buscar" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <br />
                        <br />
                        <br />
                        <asp:DataList ID="dlProvincias" runat="server" DataKeyField="Id_Provincia" DataSourceID="sqlProvincias" Height="362px" Width="180px">
                            <ItemTemplate>
                                <asp:Button ID="btnProvincias" runat="server" Text='<%# Eval("DescripcionProvincia") %>' Height="25px" Width="190px" CommandArgument='<%# Eval("Id_Provincia") %>' CommandName="BtnProvinciaID" OnCommand="btnProvincias_Command" />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="sqlProvincias" runat="server" ConnectionString="<%$ ConnectionStrings:BDSucursalesConnectionString %>" SelectCommand="SELECT * FROM [Provincia]"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style8" colspan="2">
                        <asp:ListView ID="lvSucursales" runat="server" DataKeyNames="Id_Sucursal" DataSourceID="sqlSucursales" GroupItemCount="3">
                            <EmptyDataTemplate>
                                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                    <tr>
                                        <td>No data was returned.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <GroupTemplate>
                                <tr id="itemPlaceholderContainer" runat="server">
                                    <td id="itemPlaceholder" runat="server"></td>
                                </tr>
                            </GroupTemplate>
                            <ItemTemplate>
                                <td runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <table class="auto-style1">
                                        <tr>
                                            <td class="auto-style12">
                                                <asp:Label ID="lblNombreSucursal" runat="server" Font-Bold="True" Text='<%# Eval("NombreSucursal") %>' textID="NombreSucursalLabel"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style12">
                                                <asp:ImageButton ID="ImageButton1" runat="server" Height="300px" ImageAlign="Middle" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>' Width="250px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style13">
                                                <asp:Label ID="lblDescripcionSucursal" runat="server" Height="75px" Text='<%# Eval("DescripcionSucursal") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style12">
                                                <asp:Button ID="btnSeleccionar" runat="server" Height="27px" Text="Seleccionar" Width="92px" CommandArgument='<%# Eval("Id_Sucursal")+";"+Eval("NombreSucursal")+";"+Eval("DescripcionSucursal") %>' CommandName="eventoSeleccionar" OnCommand="btnSeleccionar_Command" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <tr id="groupPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                            <asp:DataPager ID="dpSucursales" runat="server" PageSize="6">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                    <asp:NumericPagerField />
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="sqlSucursales" runat="server" ConnectionString="<%$ ConnectionStrings:BDSucursalesConnectionString %>" SelectCommand="SELECT [Id_Sucursal], [NombreSucursal], [DescripcionSucursal], [URL_Imagen_Sucursal] FROM [Sucursal]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
    </form>
</body>
</html>
