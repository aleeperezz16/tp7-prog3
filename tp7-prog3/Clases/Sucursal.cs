using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tp7_prog3.Clases
{
    public class Sucursal
    {
        private string _id;
        private string _nombre;
        private string _descripcion;

        public Sucursal()
        {

        }

        public Sucursal(string id, string nombre, string descripcion)
        {
            _id = id;
            _nombre = nombre;
            _descripcion = descripcion;
        }

        public string Id
        {
            get { return _id; }
            set { _id = value; }
        }

        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        public string Descripcion
        {
            get { return _descripcion; }
            set { _descripcion = value; }
        }
    }
}