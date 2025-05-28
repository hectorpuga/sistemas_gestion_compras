<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProveedorForm.ascx.cs" Inherits="SistemaGestionCompras.Controles.ProveedorForm" %>
<%@ Register Assembly="DevExpress.Web.v24.2, Version=24.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
             Namespace="DevExpress.Web" TagPrefix="dx" %>

<dx:ASPxPopupControl ID="popupAgregarProveedor"
                     runat="server"
                     ClientInstanceName="popupAgregarProveedor"
                     PopupHorizontalAlign="WindowCenter"
                     PopupVerticalAlign="WindowCenter"
                     HeaderText="Agregar Nuevo Proveedor"
                     Modal="true"
                     Width="400px"
                     CloseAction="CloseButton">

    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <dx:ASPxFormLayout ID="formLayout" runat="server" Width="100%">
                <Items>

                    <dx:LayoutItem Caption="Nombre">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtNombre" runat="server" Width="100%" />
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>

                    <dx:LayoutItem Caption="RFC">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtRFC" runat="server" Width="100%" />
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>

                    <dx:LayoutItem Caption="Dirección">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtDireccion" runat="server" Width="100%" />
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>

                    <dx:LayoutItem Caption="Teléfono">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtTelefono" runat="server" Width="100%" />
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>

                    <dx:LayoutItem Caption="Email">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtEmail" runat="server" Width="100%" />
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>

                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" style="text-align:right;">
                                <dx:ASPxButton ID="btnGuardar" runat="server"
                                               Text="Guardar"
                                               OnClick="btnGuardar_Click" />
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>

                </Items>
            </dx:ASPxFormLayout>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
