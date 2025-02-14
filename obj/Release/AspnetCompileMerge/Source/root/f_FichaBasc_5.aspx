<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/root/Main.Master" CodeBehind="f_FichaBasc_5.aspx.vb" Inherits="RH.f_FichaBasc_5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ph_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph_Titulo" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph_body_head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ph_body" runat="server">
  <script type="text/javascript">
    function Notify(msg, title, type, clear, pos, sticky) {
      //        toastr.options.positionClass = "toast-bottom-right";
      //        toastr.options.positionClass = "toast-bottom-left";
      //        toastr.options.positionClass = "toast-top-right";
      //        toastr.options.positionClass = "toast-top-left";
      //        toastr.options.positionClass = "toast-bottom-full-width";
      //        toastr.options.positionClass = "toast-top-full-width";
      //        options = {
      //            tapToDismiss: true,
      //            toastClass: 'toast',
      //            containerId: 'toast-container',
      //            debug: false,
      //            fadeIn: 300,
      //            fadeOut: 1000,
      //            extendedTimeOut: 1000,
      //            iconClass: 'toast-info',
      //            positionClass: 'toast-top-right',
      //            timeOut: 5000, // Set timeOut to 0 to make it sticky
      //            titleClass: 'toast-title',
      //            messageClass: 'toast-message' }


      if (clear == true) {
        toastr.clear();
      }
      if (sticky == true) {
        toastr.tapToDismiss = true;
        toastr.timeOut = 10000;
      }

      toastr.options.onclick = function () {
        //alert('You can perform some custom action after a toast goes away');
      }
      //"toast-top-left";
      toastr.options.positionClass = pos;
      if (type.toLowerCase() == 'info') {
        toastr.options.timeOut = 1000;
        toastr.tapToDismiss = true;
        toastr.info(msg, title);
      }
      if (type.toLowerCase() == 'success') {
        toastr.options.timeOut = 1500;
        toastr.success(msg, title);
      }
      if (type.toLowerCase() == 'warning') {
        toastr.options.timeOut = 3000;
        toastr.warning(msg, title);
      }
      if (type.toLowerCase() == 'error') {
        toastr.options.timeOut = 10000;
        toastr.error(msg, title);
      }
    }
  </script>

  <form runat="server">
    
    <asp:ScriptManager runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="upp_cierre" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">

        <ContentTemplate>
          <div class="card card-lightblue">

            <div class="card-header" style="text-align: center">
              <h3 class="card-title">DE LOS PARIENTES</h3>
            </div>
            <div class="card-body">

              <div class="row">
                a) Padres
              </div>
              <div class="form-group row">
                <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-4 col-form-label">Nombre Completo del Padre</label>
                <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-8">
                  <asp:TextBox ID="tx_PadNom" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
              </div>

              <div class="form-group row">
                <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-4 col-form-label">Nombre Completo de la Madre</label>
                <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-8">
                  <asp:TextBox ID="tx_MamNom" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
              </div>
            </div>
            <div>
              <asp:TextBox ID="tx_PadOcu" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_PadDNI" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_PadDir" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_PadTlf" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_MamOcu" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_MamDNI" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_MamDir" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_MamTlf" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_HerNom01" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_HerOcu01" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_HerDNI01" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_HerDir01" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_HerTlf01" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_HerNom02" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_HerOcu02" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_HerDNI02" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_HerDir02" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_HerTlf02" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_HerNom03" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_HerOcu03" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_HerDNI03" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_HerDir03" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_HerTlf03" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_TioNom01" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_TioOcu01" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_TioDNI01" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_TioDir01" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_TioTlf01" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_TioNom02" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_TioOcu02" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_TioDNI02" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_TioDir02" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_TioTlf02" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_AmiNom01" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_AmiOcu01" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_AmiDNI01" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_AmiDir01" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_AmiTlf01" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_AmiNom02" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_AmiOcu02" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_AmiDNI02" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_AmiDir02" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
              <asp:TextBox ID="tx_AmiTlf02" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="card card-lightblue">
              <div class="card-header" style="text-align: center">
                <h3 class="card-title">INFORMACION GENERAL</h3>
              </div>
              <div class="card-body">

                <div class="input-group mb-3">
                  Ciudades del Pa&iacute;s que conoce :
                      <div class="container-fluid">
                        <textarea id="tx_ciupaicon" cols="20" rows="3" style="width: 100%" runat="server"></textarea>
                      </div>
                </div>

                <div class="input-group mb-3">
                  Pa&iacute;ses que ha visitado en los dos &uacute;ltimos a&ntilde;os:
                      <div class="container-fluid">
                        <textarea id="tx_paivisult" cols="20" rows="3" style="width: 100%" runat="server"></textarea>
                      </div>
                </div>

                <div class="input-group mb-3">
                  Aficiones, Deportes, etc :
                      <div class="container-fluid">
                        <textarea id="tx_aficiones" cols="20" rows="3" style="width: 100%" runat="server"></textarea>
                      </div>
                </div>

              </div>


              <div class="card-footer">

                <asp:Button ID="bt_back" CssClass="btn btn-secondary" runat="server" Text="Anterior" />
                <input id="bt_cerrar" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" value="Finaliza" />

              </div>

            </div>

          </div>
          <div class="modal fade modal-primary" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
            aria-hidden="true">
            <!-- Add .modal-dialog-centered to .modal-dialog to vertically center the modal -->
            <div class="modal-dialog modal-dialog-centered" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLongTitle" style="color: #FFFFFF; color: #FFFFFF; text-align: center;">AGREGAR TRABAJADOR</h5>
                </div>
                <div class="modal-body">

                  <div class="row">
                    <p>Opciones:</p>
                    <br />
                    Cancelar: Volvera a la pantalla anterior para continuar con el ingreso.<br />
                    Guardar: La ficha sera guardada para posteriormente continuar.<br />
                    <asp:Label ID="lb_Bloq0" Visible="false" runat="server" Text="Bloquear: La ficha sera bloqueada.  para validacion de huellas digitales*"></asp:Label>
                    <asp:Label ID="lb_Final" Visible="false" runat="server" Text="Finalizar: Da por terminado el proceso."></asp:Label>
                    <br />

                    <br />
                    <asp:Label ID="lb_Bloq1" Visible="false" runat="server" Text="* Por favor acercarse a Recursos Humanos para la toma de Huellas Digitales y dar por Finalizada la presente."></asp:Label>

                  </div>
                  <br />

                </div>
                <div class="modal-footer">

                  <asp:Button ID="bt_Cancela" CssClass="btn btn-warning" runat="server" data-dismiss="modal" Text="Cancelar" />
                  <asp:Button ID="bt_Graba" CssClass="btn btn-info" runat="server" Text="Guardar" />
                  <asp:Button ID="bt_Fin" Visible="false" CssClass="btn btn-primary" runat="server" Text="Bloquear" />
                  <asp:Button ID="bt_End" Visible="false" CssClass="btn btn-primary" runat="server" Text="Finalizar" />


                  <%--                    <button type="button" id="bt_Cancela"  style="width:150px" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                          <button type="button" id="bt_Continuar"  style="width:150px" class="btn btn-secondary" data-dismiss="modal">Guardar</button>
                          <button type="button" id="bt_CerrarFicha" style="width:150px" class="btn btn-primary" runat="server">Finalizar</button>--%>
                </div>
              </div>
            </div>
          </div>
        </contenttemplate>

     </asp:UpdatePanel>      
              
  </form>
  <!-- jQuery -->
  <script src="../plugins/jquery/jquery.min.js"></script>
  <!-- SweetAlert2 -->
  <script src="../plugins/sweetalert2/sweetalert2.min.js"></script>
  <!-- Toastr -->
  <script src="../plugins/toastr/toastr.min.js"></script>
</asp:Content>
