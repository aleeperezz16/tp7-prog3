using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tp7_prog3.Clases
{
    public class Sucursal
    {
        private int _id;
        private string _nombre;
        private string _descripcion;
        private int _provincia;

        public Sucursal()
        {

        }

        public Sucursal(int id, string nombre, string descripcion, int provincia)
        {
            _id = id;
            _nombre = nombre;
            _descripcion = descripcion;
            _provincia = provincia;
        }

        public int Id
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

        public int Provincia
        {
            get { return _provincia; }
            set { _provincia = value; }
        }
    }
}