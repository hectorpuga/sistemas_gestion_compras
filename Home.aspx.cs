using DAL;
using ENTIDADES;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;

namespace SistemaGestionCompras
{
    public partial class Home : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                MostrarPopup();
        }

        private void MostrarPopup()
        {
            ScriptManager.RegisterStartupScript(
                this, GetType(), "mostrarPopup", "popupEjemplo.Show();", true);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            var solicitud = new SolicitudDevolucion
            {
                Clave = txtClave.Text.Trim(),
                Descripcion = txtDescripcion.Text.Trim(),
                Cantidad = Convert.ToDecimal(txtCantidad.Text),
                Kilos = Convert.ToDecimal(txtKilos.Text),
                Motivo = txtMotivo.Text.Trim(),
                Archivos = new List<ArchivoEvidencia>()
            };

            string carpetaUploads = Server.MapPath("~/Uploads/");
            if (!Directory.Exists(carpetaUploads))
                Directory.CreateDirectory(carpetaUploads);

            foreach (string key in Request.Files)
            {
                HttpPostedFile archivo = Request.Files[key];
                if (archivo == null || archivo.ContentLength == 0) continue;

                string nombre = Path.GetFileName(archivo.FileName);
                string rutaFisica = Path.Combine(carpetaUploads, nombre);
                archivo.SaveAs(rutaFisica);

                solicitud.Archivos.Add(new ArchivoEvidencia
                {
                    NombreArchivo = nombre,
                    RutaArchivo = "~/Uploads/" + nombre
                });
            }

            if (SolicitudesDAL.GuardarSolicitud(solicitud))
            {
                ScriptManager.RegisterStartupScript(
                    this, GetType(), "ok",
                    "popupEjemplo.Hide(); alert('Guardado correctamente');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(
                    this, GetType(), "fail",
                    "alert('Error al guardar.');", true);
            }
        }
    }
}
