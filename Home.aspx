<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.master"
         AutoEventWireup="true" CodeBehind="Home.aspx.cs"
         Inherits="SistemaGestionCompras.Home" %>
<%@ Register Assembly="DevExpress.Web.v24.2, Version=24.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Bienvenido</h2>
    <p>Selecciona una opción del menú lateral.</p>

    <asp:Button ID="btnAbrirPopup" runat="server" Text="Abrir Popup"
                CssClass="btn btn-primary"
                OnClientClick="popupEjemplo.Show();return false;"
                UseSubmitBehavior="false" />

    <!-- Popup -->
    <dx:ASPxPopupControl ID="popupEjemplo" runat="server"
                         ClientInstanceName="popupEjemplo"
                         HeaderText="Solicita Devolución"
                         Modal="true" AllowDragging="true" ShowCloseButton="true"
                         Width="700px"
                         PopupHorizontalAlign="WindowCenter"
                         PopupVerticalAlign="WindowCenter">

        <ContentCollection>
            <dx:PopupControlContentControl>
                <div class="p-4" style="font-family:'Segoe UI',sans-serif;font-size:14px;">

                    <!-- datos de la solicitud -->
                    <div class="form-group mb-3">
                        <label><strong>Clave:</strong></label>
                        <asp:TextBox ID="txtClave" runat="server" CssClass="form-control" />
                    </div>

                    <div class="form-group mb-3">
                        <label><strong>Descripción:</strong></label>
                        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" />
                    </div>

                    <div class="form-group mb-3">
                        <label><strong>Cantidad:</strong></label>
                        <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control" />
                    </div>

                    <div class="form-group mb-3">
                        <label><strong>Kilos Reales:</strong></label>
                        <asp:TextBox ID="txtKilos" runat="server" CssClass="form-control" />
                    </div>

                    <div class="form-group mb-3">
                        <label><strong>Motivo:</strong></label>
                        <asp:TextBox ID="txtMotivo" runat="server" CssClass="form-control" />
                    </div>

                    <!-- Evidencias -->
                    <div class="form-group mb-3">
                        <label><strong>Evidencias (múltiples archivos):</strong></label>

                        <!-- input visible -->
                        <input type="file" id="fileEvidenciaVisible" name="fileEvidencia"
                               class="form-control" multiple onchange="previewFiles()" />

                        <!-- inputs con selección, ocultos -->
                        <div id="inputsWrapper" style="display:none;"></div>

                        <!-- listado -->
                        <div id="fileList" class="mt-2 small text-muted"></div>
                    </div>

                    <div class="form-group mb-4">
                        <asp:CheckBoxList ID="chkMotivos" runat="server"
                                          RepeatDirection="Horizontal"
                                          CssClass="d-flex gap-3">
                            <asp:ListItem>Devolución por Acuerdo Comercial</asp:ListItem>
                            <asp:ListItem>Devolución Técnica</asp:ListItem>
                        </asp:CheckBoxList>
                    </div>

                    <div class="text-end">
                        <asp:Button ID="btnGuardar" runat="server"
                                    Text="Guardar" CssClass="btn btn-success me-2"
                                    OnClick="btnGuardar_Click" />

                        <asp:Button ID="btnCerrar" runat="server"
                                    Text="Cerrar" CssClass="btn btn-danger"
                                    OnClientClick="popupEjemplo.Hide();return false;" />
                    </div>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <!-- JavaScript -->
 <script type="text/javascript">
     let allFiles = [];
     let contadorInputs = 0;          // ➊ para generar nombres únicos

     function previewFiles() {
         const input = document.getElementById("fileEvidenciaVisible");
         const fileList = document.getElementById("fileList");
         const wrapper = document.getElementById("inputsWrapper");

         /* ---------- 1. Vista previa ---------- */
         allFiles = allFiles.concat(Array.from(input.files));
         fileList.innerHTML = "";

         if (allFiles.length === 0) {
             fileList.innerHTML = "<div class='text-muted'>No se han seleccionado archivos.</div>";
         } else {
             const ul = document.createElement("ul");
             ul.className = "list-group";
             allFiles.forEach(f => {
                 const li = document.createElement("li");
                 li.className =
                     "list-group-item d-flex justify-content-between align-items-center";
                 li.innerHTML = `<span>📎 ${f.name}</span>
                                <span class="badge bg-secondary">${(f.size / 1024).toFixed(1)} KB</span>`;
                 ul.appendChild(li);
             });
             fileList.appendChild(ul);
         }

         /* ---------- 2. Mover el input con un nombre único ---------- */
         input.name = "fileEvidencia_" + contadorInputs++;   // ➋ cambia el name
         input.removeAttribute("id");
         input.removeAttribute("onchange");
         wrapper.appendChild(input);

         /* ---------- 3. Crear input nuevo y limpio ---------- */
         const nuevo = document.createElement("input");
         nuevo.type = "file";
         nuevo.name = "fileEvidencia_TEMP";   // mismo patrón, luego será renombrado
         nuevo.id = "fileEvidenciaVisible";
         nuevo.className = "form-control";
         nuevo.multiple = true;
         nuevo.onchange = previewFiles;

         fileList.parentNode.insertBefore(nuevo, fileList.previousSibling);
     }
 </script>

</asp:Content>
