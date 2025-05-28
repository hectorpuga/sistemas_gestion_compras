using System;
using System.Web.UI;
using ENTIDADES.Proveedores;
using DAL;

namespace SistemaGestionCompras.Controles
{
    public partial class ProveedorForm : UserControl
    {
        // Evento que se lanzará cuando se guarde un proveedor
        public event EventHandler OnProveedorGuardado;

        protected void Page_Load(object sender, EventArgs e)
        {
            // No requiere lógica especial de carga
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            var proveedor = new Proveedor
            {
                Nombre = txtNombre.Text,
                RFC = txtRFC.Text,
                Direccion = txtDireccion.Text,
                Telefono = txtTelefono.Text,
                Email = txtEmail.Text
            };

            if (ConexionBD.AgregarProveedor(proveedor))
            {
                popupAgregarProveedor.ShowOnPageLoad = false;

                // Dispara el evento para que la página principal actualice la grilla
                OnProveedorGuardado?.Invoke(this, EventArgs.Empty);
            }
            else
            {
                popupAgregarProveedor.ShowOnPageLoad = true;
                // Aquí podrías mostrar un mensaje de error si quieres
            }
        }
    }
}
