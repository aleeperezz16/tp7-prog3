using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
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
                if (Session["DatosSuc"] == null)
                {
                    Session["DatosSuc"] = CrearTabla();
                }
                string[] valores = e.CommandArgument.ToString().Split(' ');
                agregarFila((DataTable)Session["DatosSuc"], valores);
            }
        }
        private DataTable CrearTabla()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add(new DataColumn("ID_Sucursal", Type.GetType("System.String")));
            dt.Columns.Add(new DataColumn("Nombre", Type.GetType("System.String")));
            dt.Columns.Add(new DataColumn("Descripcion", Type.GetType("System.String")));

            return dt;
        }
        public void agregarFila(DataTable tabla, string[] valores)
        {
            if (tabla.Rows.Count != 0)
            {
                foreach (DataRow fila in tabla.Rows)
                {
                    if (fila["Id_Sucursal"].ToString() == valores[0])
                    {
                        return;
                    }
                }
            }
            DataRow dr = tabla.NewRow();
            dr["ID_Sucursal"] = valores[0];
            dr["Nombre"] = valores[1];
            dr["Descripcion"] = valores[2];
            tabla.Rows.Add(dr);
        }
        protected void btnProvincias_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "BtnProvinciaID")
            {
                string provinciaID = e.CommandArgument.ToString();
                SqlDataSource2.SelectCommand =
                "SELECT Id_Sucursal, NombreSucursal, DescripcionSucursal, Id_ProvinciaSucursal, URL_Imagen_Sucursal FROM Sucursal WHERE Id_ProvinciaSucursal = " + provinciaID;
            }
        }

        protected void lvSucursales_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            
        }
    }
}