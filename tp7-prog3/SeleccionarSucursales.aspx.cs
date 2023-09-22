using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp7_prog3
{
    public partial class SeleccionarSucursales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string text = txtBuscar.Text.Trim();
            SqlDataSource2.SelectCommand =
                "SELECT Id_Sucursal, NombreSucursal, DescripcionSucursal, Id_ProvinciaSucursal, URL_Imagen_Sucursal FROM Sucursal" +
                (text.Length > 0 ? $" WHERE NombreSucursal LIKE '%{text}%'" : "");

            txtBuscar.Text = "";
        }

        protected void btnSeleccionar_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoSeleccionar")
            {
                Session["DatosSuc"] = e.CommandArgument.ToString();
               
               
            }
        }
    }
}