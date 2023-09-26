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
    public partial class ListadoSucursalesSeleccionadas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DatosSuc"] != null) 
            {
                List<Sucursal> sucursales = (List<Sucursal>)Session["DatosSuc"];

                grvSucursalesSeleccionadas.DataSource = CrearTabla(sucursales);
                grvSucursalesSeleccionadas.DataBind();
            }
        }

        private DataTable CrearTabla(List<Sucursal> sucursales)
        {
            DataTable dt = new DataTable();

            dt.Columns.Add(new DataColumn("ID_Sucursal", Type.GetType("System.String")));
            dt.Columns.Add(new DataColumn("Nombre", Type.GetType("System.String")));
            dt.Columns.Add(new DataColumn("Descripcion", Type.GetType("System.String")));


            foreach (Sucursal s in sucursales)
            {
                DataRow dr = dt.NewRow();
                
                dr["ID_Sucursal"] = s.Id;
                dr["Nombre"] = s.Nombre;
                dr["Descripcion"] = s.Descripcion;
            
                dt.Rows.Add(dr);
            }

            return dt;
        }
    }
}