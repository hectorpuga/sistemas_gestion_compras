<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarProveedor.aspx.cs" Inherits="SistemaGestionCompras.AgregarProveedor" %>
<%@ Register Assembly="DevExpress.Web.v24.2, Version=24.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Agregar Proveedor</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="max-width: 400px; margin: 0 auto;">
            <h2>Agregar Proveedor</h2>

            <dx:ASPxTextBox ID="txtNombre" runat="server" NullText="Nombre" Width="100%" />
            <br /><br />

            <dx:ASPxTextBox ID="txtRFC" runat="server" NullText="RFC" Width="100%" />
            <br /><br />

            <dx:ASPxTextBox ID="txtDireccion" runat="server" NullText="Dirección" Width="100%" />
            <br /><br />

            <dx:ASPxTextBox ID="txtTelefono" runat="server" NullText="Teléfono" Width="100%" />
            <br /><br />

            <dx:ASPxTextBox ID="txtEmail" runat="server" NullText="Email" Width="100%" />
            <br /><br />

            <dx:ASPxButton ID="btnAgregar" runat="server" Text="Agregar" AutoPostBack="true" OnClick="btnAgregar_Click" Width="100%" />
            <br /><br />

            <dx:ASPxLabel ID="lblResultado" runat="server" Width="100%" />
        </div>
    </form>
</body>
</html>
