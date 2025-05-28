using System;
using ENTIDADES.Proveedores;
using DAL;

namespace SistemaGestionCompras
{
    public partial class AgregarProveedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        // ←— AHORA EXISTE el manejador que pide el markup



        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            var proveedor = new Proveedor
            {
                Nombre = txtNombre.Text,
                RFC = txtRFC.Text,
                Direccion = txtDireccion.Text,
                Telefono = txtTelefono.Text,
                Email = txtEmail.Text
            };

            bool ok = ConexionBD.AgregarProveedor(proveedor);
            lblResultado.Text = ok
                ? "Proveedor agregado correctamente ✅"
                : "Error al agregar proveedor ❌";
        }


    }


}
