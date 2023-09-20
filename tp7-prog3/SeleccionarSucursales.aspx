<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeleccionarSucursales.aspx.cs" Inherits="tp7_prog3.SeleccionarSucursales" %>

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
        .auto-style11 {
            height: 237px;
            width: 374px;
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
                    <td style="text-align: center">
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
                        <asp:TextBox ID="tbBusquedasucursal" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <br />
                        <br />
                        <br />
                        <asp:DataList ID="dlProvincias" runat="server" DataKeyField="Id_Provincia" DataSourceID="SqlDataSource1" Height="362px" Width="180px">
                            <ItemTemplate>
                                <asp:Button ID="btnProvincias" runat="server" Text='<%# Eval("DescripcionProvincia") %>' Height="25px" Width="190px" />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDSucursalesConnectionString %>" SelectCommand="SELECT * FROM [Provincia]"></asp:SqlDataSource>
                        <br />
                    </td>
                    <td class="auto-style11"></td>
                    <td class="auto-style8"></td>
                </tr>
            </table>
    </form>
</body>
</html>
