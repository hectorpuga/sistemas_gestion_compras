using DAL;
using ENTIDADES.Proveedores;
using System;
using System.Collections.Generic;
using System.IO;

namespace SistemaGestionCompras
{
    public partial class Proveedores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ProveedorForm1.OnProveedorGuardado += ProveedorGuardadoHandler;
            if (!IsPostBack)
            {
                CargarProveedores();

                // Suscribirse al evento del UserControl
                ProveedorForm1.OnProveedorGuardado += ProveedorGuardadoHandler;
            }
        }

        private void CargarProveedores()
        {
            var lista = ConexionBD.ObtenerProveedores(); // Debe retornar List<Proveedor>
            gridProveedores.DataSource = lista;
            gridProveedores.DataBind();
        }

        private void ProveedorGuardadoHandler(object sender, EventArgs e)
        {
            // Se llama cuando el UserControl guarda un proveedor
            CargarProveedores();
        }

        protected void btnDescargarReporte_Click(object sender, EventArgs e)
        {
            // 1. Instanciar el reporte
            var reporte = new ReporteProveedores(); // sin parámetros

            // 2. Exportar a memoria
            using (MemoryStream ms = new MemoryStream())
            {
                reporte.ExportToPdf(ms);
                byte[] bytes = ms.ToArray();

                // 3. Descargar como PDF
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", "attachment; filename=Proveedores.pdf");
                Response.BinaryWrite(bytes);
                Response.End();
            }
        }
    }
}
