<%@ Page Title="Proveedores"
          Language="C#"
          MasterPageFile="~/Site.master"
          AutoEventWireup="true"
          CodeBehind="Proveedores.aspx.cs"
          Inherits="SistemaGestionCompras.Proveedores" %>

<%@ Register Assembly="DevExpress.Web.v24.2, Version=24.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
             Namespace="DevExpress.Web"
             TagPrefix="dx" %>

<%@ Register Src="~/Controles/ProveedorForm.ascx" TagPrefix="uc" TagName="ProveedorForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista de Proveedores</h2>

    <!-- ✅ Botón para descargar el reporte PDF -->
    <dx:ASPxButton ID="btnDescargarReporte" runat="server" Text="Descargar Reporte PDF" OnClick="btnDescargarReporte_Click"
                   AutoPostBack="true" CssClass="btn btn-primary" />

    <br /><br />

    <!-- Botón que muestra el popup -->
    <dx:ASPxButton ID="btnMostrarPopup" runat="server" Text="Agregar Proveedor" AutoPostBack="false">
        <ClientSideEvents Click="function(s, e) { popupAgregarProveedor.Show(); }" />
    </dx:ASPxButton>

    <!-- Control reutilizable para el formulario de proveedor -->
    <uc:ProveedorForm ID="ProveedorForm1" runat="server" />

    <br /><br />

    <!-- Grid de proveedores -->
    <dx:ASPxGridView ID="gridProveedores"
                     runat="server"
                     AutoGenerateColumns="False"
                     KeyFieldName="IdProveedor"
                     Width="100%">

        <Columns>
            <dx:GridViewDataTextColumn FieldName="IdProveedor" Caption="ID" />
            <dx:GridViewDataTextColumn FieldName="Nombre"      Caption="Nombre"    />
            <dx:GridViewDataTextColumn FieldName="RFC"         Caption="RFC"       />
            <dx:GridViewDataTextColumn FieldName="Direccion"   Caption="Dirección" />
            <dx:GridViewDataTextColumn FieldName="Telefono"    Caption="Teléfono"  />
            <dx:GridViewDataTextColumn FieldName="Email"       Caption="Email"     />
        </Columns>

    </dx:ASPxGridView>

</asp:Content>
