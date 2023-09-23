using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace tp7_prog3
{
    public partial class ListadoSucursalesSeleccionadas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DatosSuc"] != null) {

                DataTable datosSucursales = (DataTable)Session["DatosSuc"];

                grvSucursalesSeleccionadas.DataSource = datosSucursales;
                grvSucursalesSeleccionadas.DataBind();

              
            }
        }
    }
}