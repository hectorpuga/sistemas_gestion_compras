using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace SistemaGestionCompras
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool ok = DAL.ConexionBD.ProbarConexion();
            Response.Write(ok ? "Conexión OK" : "Error de conexión");
        }
    }
}