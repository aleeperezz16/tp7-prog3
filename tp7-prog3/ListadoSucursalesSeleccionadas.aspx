<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoSucursalesSeleccionadas.aspx.cs" Inherits="tp7_prog3.ListadoSucursalesSeleccionadas" %>

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
            width: 426px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:HyperLink ID="hlSeleccionarSucursales" runat="server" NavigateUrl="~/SeleccionarSucursales.aspx">Listado De Sucursales</asp:HyperLink>
                    </td>
                    <td>
                        <asp:HyperLink ID="hlMostrarSleccion" runat="server" NavigateUrl="~/ListadoSucursalesSeleccionadas.aspx">Mostrar Sucursales Seleccionadas</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><font size ="5"><b>
                        <br />
                        Mostrar sucursales seleccionadas<br />
                        </b></font></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="grvSucursalesSeleccionadas" runat="server">
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
