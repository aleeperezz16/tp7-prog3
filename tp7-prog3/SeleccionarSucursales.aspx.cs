using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using tp7_prog3.Clases;

namespace tp7_prog3
{
    public partial class SeleccionarSucursales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Consulta"] = null;
            }
            else
            {
                if (Session["Consulta"] != null)
                    sqlSucursales.SelectCommand = Session["Consulta"].ToString();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ReiniciarPagina();

            string text = txtBuscar.Text.Trim();
            sqlSucursales.SelectCommand = "SELECT [Id_Sucursal], [NombreSucursal], [DescripcionSucursal], [URL_Imagen_Sucursal], [Id_ProvinciaSucursal] FROM [Sucursal]" + (text.Length > 0 ? $" WHERE ([NombreSucursal] LIKE '%{text}%')" : "");
            Session["Consulta"] = sqlSucursales.SelectCommand; 

            txtBuscar.Text = "";
        }

        protected void btnSeleccionar_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoSeleccionar")
            {
                if (Session["DatosSuc"] == null)
                {
                    Session["DatosSuc"] = new List<Sucursal>();
                }

                string[] valores = e.CommandArgument.ToString().Split(';');
                Sucursal sucursal = new Sucursal(valores[0], valores[1], valores[2]);

                if (!((List<Sucursal>)Session["DatosSuc"]).Exists(x => x.Id == valores[0]))
                    ((List<Sucursal>)Session["DatosSuc"]).Add(sucursal);
            }
        }

        protected void btnProvincias_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "BtnProvinciaID")
            {
                ReiniciarPagina();

                string provinciaID = e.CommandArgument.ToString();
                sqlSucursales.SelectCommand =
                "SELECT [Id_Sucursal], [NombreSucursal], [DescripcionSucursal], [Id_ProvinciaSucursal], [URL_Imagen_Sucursal] FROM [Sucursal] WHERE [Id_ProvinciaSucursal] = " + provinciaID;
                Session["Consulta"] = sqlSucursales.SelectCommand;
            }
        }

        private void ReiniciarPagina()
        {
            DataPager pager = (DataPager)lvSucursales.FindControl("dpSucursales");

            if (pager != null)
                pager.SetPageProperties(0, pager.MaximumRows, true);
        }
    }
}