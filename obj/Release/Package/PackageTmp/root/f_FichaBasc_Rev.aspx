<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/root/Main.Master" CodeBehind="f_FichaBasc_Rev.aspx.vb" Inherits="RH.f_FichaBasc_Rev" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="RH.cl_COMUN_AD" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ph_head" runat="server">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
  <script src="../WebCam.js" type="text/javascript"></script>

  <script type="text/javascript">  
    var pageUrl = '<%=ResolveUrl("~/xFoto.aspx") %>';
    $(function () {
      Webcam.set({
        width: 320,
        height: 240,
        image_format: 'jpeg',
        jpeg_quality: 100
      });
      Webcam.attach('#webcam');

      $("#btnCapture").click(function () {
        Webcam.snap(function (data_uri) {
          $("#imgCapture")[0].src = data_uri;
          $("#btnUpload").removeAttr("disabled");
        });
      });

      $("#btnCaptureFrente").click(function () {
        Webcam.snap(function (data_uri) {
          $("#imgDniFrente")[0].src = data_uri;
        });
      });

      $("#btnCaptureAtras").click(function () {
        Webcam.snap(function (data_uri) {
          $("#imgDniAtras")[0].src = data_uri;
        });
      });



    });


    function sleep(milliseconds) {
      var start = new Date().getTime();
      for (var i = 0; i < 1e7; i++) {
        if ((new Date().getTime() - start) > milliseconds) {
          break;
        }
      }
    }

    function OnSuccess(response) {
      alert(response.d);
    }

    function GrabaFoto() {
      GrabaImagen();
      //location.reload(true);
      //window.location.href = window.location.href;
      sleep(3000);
      location.reload(true);
    }

    function GrabaImagen() {
      $.ajax({
        type: "POST",
        url: "f_FichaBasc_Rev.aspx/GrabaImagenTrabajador_REV",
        data: "{data: '" + $("#imgCapture")[0].src + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {
          $("[id*=imgCapture]").css("visibility", "visible");
          $("[id*=imgCapture]").attr("src", r.d);
        },
        failure: function (response) {
          alert(response.d);
        },
        oncapture: function () {
          webcam.save(pageUrl);
        }
      });
    }

    function capture() {
      webcam.capture();
      return false;
    }

  </script>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ph_Titulo" runat="server">
  <h3 style="color: #FFFFFF; font-style: normal;">
    <label style="font-weight: normal; font-style: normal; color: #FFFFFF">FICHAS DE ESTUDIO DE SEGURIDAD</label></h3>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph_body_head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ph_body" runat="server">

  <form runat="server">
    <div class="card card-warning ">
      <div class="card-header">
        <h3 class="card-title">REVISION DE FICHAS</h3>
      </div>
      <div class="card-body">

        <div class="input-group mb-3">
          <div class="container-fluid">
            <table>
              <tr>
                <td style="text-align: left">Nro. Documento de Trabajador :                        
                  <asp:TextBox ID="TX_NUMDNI" runat="server" MaxLength="10" Width="200"></asp:TextBox>
                  <asp:Button ID="bt_buscar" CssClass="btn btn-primary" runat="server" Text="Buscar" />
                </td>
              </tr>
            </table>
          </div>
        </div>

        <div class="col-12" style="text-align: center; background-color: #000000; color: #FFFFFF;">
          <asp:Label ID="lb_nombre" runat="server" Text=""></asp:Label>
        </div>

        <div class="input-group mb-3">
          <div class="container-fluid">
            <table class="col-lg-12" border="0">


              <tr>
                <td style="text-align: center; vertical-align: middle; background-color: #00CC99; color: #FFFFFF; font-weight: bold;" colspan="6">
                  <asp:Label ID="Label4" runat="server" Text="Fotografia"></asp:Label>
                </td>
              </tr>

              <tr>
                <td style="text-align: center; vertical-align: middle" colspan="6">
                  <asp:Image ID="im_foto" runat="server" ImageUrl="~/img/person_black_48dp.png" Height="240" Width="320" />
                </td>
              </tr>

              <tr>
                <td style="text-align: center; vertical-align: middle" colspan="6">
                  <%--<asp:Button ID="D" CssClass="btn btn-secondary" runat="server" Text="Actualizar" />--%>
                  <button id="bt_Foto" name="bt_Foto" type="button" class="btn btn-info" data-toggle="modal" data-target="#modal-foto" onclick="exefoto()">Actualizar</button>
                </td>
              </tr>

              <tr>
                <td class="col-6" style="width: 50%; text-align: center;" colspan="3">
                  <asp:Label ID="Label8" runat="server" Text="DNI - Imagen Frontal"></asp:Label>

                <td class="col-6" style="width: 50%; text-align: center;" colspan="3">
                  <asp:Label ID="Label9" runat="server" Text="DNI - Imagen Posterior"></asp:Label>
              </tr>

              <tr>
                <td class="col-6" style="width: 50%; text-align: center;" colspan="3">
                  <asp:Image ID="im_dni1" runat="server" CssClass="COL-6" ImageUrl="~/img/dni0.jpg" Height="350" Width="450" /></td>

                <td class="col-6" style="width: 50%; text-align: center;" colspan="3">
                  <asp:Image ID="im_dni2" runat="server" CssClass="COL-6" ImageUrl="~/img/dni1.jpg" Height="350" Width="450" /></td>
              </tr>

              <tr>
                <td class="col-6" style="width: 50%; text-align: center;" colspan="3">
                  <button id="bt_dni1" name="bt_dni1" type="button" class="btn btn-info" data-toggle="modal" data-target="#modal-foto">Actualizar</button>
                </td>

                <td class="col-6" style="width: 50%; text-align: center;" colspan="3">
                  <button id="bt_dni2" name="bt_dni2" type="button" class="btn btn-info" data-toggle="modal" data-target="#modal-foto">Actualizar</button>
                </td>
              </tr>



              <tr>
                <td style="text-align: center; vertical-align: middle; background-color: #00CC99; color: #FFFFFF; font-weight: bold;" colspan="6">
                  <asp:Label ID="Label5" runat="server" Text="Croquis de Ubicacion"></asp:Label>
              </tr>

              <tr>
                <td style="text-align: center; vertical-align: middle" class="col-12" colspan="6">
                  <asp:Image ID="im_mapa" runat="server" ImageUrl="" Height="640" Width="640" /></td>
              </tr>

              <tr>
                <td style="text-align: center; vertical-align: middle" class="col-12" colspan="6">
                  <asp:Button ID="bt_croquis" CssClass="btn btn-secondary" runat="server" Text="Actualizar" />
              </tr>

              <tr>
                <td style="text-align: center; vertical-align: middle; background-color: #00CC99; color: #FFFFFF; font-weight: bold;" colspan="6">
                  <asp:Label ID="Label1" runat="server" Text="Huellas Digitales"></asp:Label>
              </tr>

              <tr>
                <td class="col-2">
                  <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Label ID="Label10" runat="server" Text="Pulgar"></asp:Label>
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Label ID="Label11" runat="server" Text="Indice"></asp:Label>
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Label ID="Label12" runat="server" Text="Dedo Medio"></asp:Label>
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Label ID="Label13" runat="server" Text="Anular"></asp:Label>
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Label ID="Label14" runat="server" Text="Menique"></asp:Label>
                </td>
              </tr>

              <%-- mano izquiera--%>
              <tr>
                <td class="col-2">
                  <asp:Label ID="Label6" runat="server" Text="Mano Izquierda"></asp:Label>
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Image ID="im_I1" runat="server" ImageUrl="~/img/huella.jpg" Height="194" Width="137" />
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Image ID="im_I2" runat="server" ImageUrl="~/img/huella.jpg" Height="194" Width="137" />
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Image ID="im_I3" runat="server" ImageUrl="~/img/huella.jpg" Height="194" Width="137" />
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Image ID="im_I4" runat="server" ImageUrl="~/img/huella.jpg" Height="194" Width="137" />
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Image ID="im_I5" runat="server" ImageUrl="~/img/huella.jpg" Height="194" Width="137" />
                </td>
              </tr>

              <tr>
                <td class="col-2"></td>
                <td class="col-2" style="text-align: center;">
                  <asp:Button ID="bt_I1" CssClass="btn btn-secondary" runat="server" Text="Actualizar" />
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Button ID="bt_I2" CssClass="btn btn-secondary" runat="server" Text="Actualizar" />
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Button ID="bt_I3" CssClass="btn btn-secondary" runat="server" Text="Actualizar" />
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Button ID="bt_I4" CssClass="btn btn-secondary" runat="server" Text="Actualizar" />
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Button ID="bt_I5" CssClass="btn btn-secondary" runat="server" Text="Actualizar" />
                </td>
              </tr>


              <%-- mano derecha--%>
              <tr>
                <td class="col-2">
                  <asp:Label ID="Label7" runat="server" Text="Mano Derecha"></asp:Label>
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Image ID="im_D1" runat="server" ImageUrl="~/img/huella.jpg" Height="194" Width="137" />
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Image ID="im_D2" runat="server" ImageUrl="~/img/huella.jpg" Height="194" Width="137" />
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Image ID="im_D3" runat="server" ImageUrl="~/img/huella.jpg" Height="194" Width="137" />
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Image ID="im_D4" runat="server" ImageUrl="~/img/huella.jpg" Height="194" Width="137" />
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Image ID="im_D5" runat="server" ImageUrl="~/img/huella.jpg" Height="194" Width="137" />
                </td>

              </tr>

              <tr>
                <td class="col-2"></td>
                <td class="col-2" style="text-align: center;">
                  <asp:Button ID="bt_D1" CssClass="btn btn-secondary" runat="server" Text="Actualizar" />
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Button ID="bt_D2" CssClass="btn btn-secondary" runat="server" Text="Actualizar" />
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Button ID="bt_D3" CssClass="btn btn-secondary" runat="server" Text="Actualizar" />
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Button ID="bt_D4" CssClass="btn btn-secondary" runat="server" Text="Actualizar" />
                </td>
                <td class="col-2" style="text-align: center;">
                  <asp:Button ID="bt_D5" CssClass="btn btn-secondary" runat="server" Text="Actualizar" />
                </td>
              </tr>




            </table>
          </div>
        </div>

      </div>

      <div class="card-footer">

        <asp:Button ID="bt_back" CssClass="btn btn-secondary" runat="server" Text="Anterior" />
        <asp:Button ID="xxMap" runat="server" Text="Button" />

      </div>

    </div>

    <div class="modal fade" id="modal-foto">
      <div class="modal-dialog modal-lg">
        <div class="modal-content bg-info">
          <div class="modal-header">
            <h4 class="modal-title">
              <input id="Text1" type="text" value="Actualizacion de Imagen" readonly="readonly" />
            </h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
          </div>
          <div class="modal-body" style="border-color: #00FFFF; border-style: double; text-align: center; vertical-align: middle;">
            <table border="1" cellpadding="0" cellspacing="0" style="text-align: center">

              <tr style="text-align: center">

                <td style="text-align: center">
                  <div id="webcam" style="text-align: center"></div>
                </td>

                <td>
                  <img id="imgCapture" alt="" style="width: 320px; height: 240px" />
                </td>

              </tr>

            </table>

          </div>
          <div class="modal-footer justify-content-between">
            <input type="button" id="btnCapture" class="btn btn-outline-light" value="Realizar Toma" />
            <input type="button" id="btnUpload" class="btn btn-outline-light" value="Grabar" disabled="disabled" onclick="GrabaFoto()" data-dismiss="modal" />
          </div>

        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>





    <div class="modal fade" id="FotoDniFrente">
      <div class="modal-dialog modal-xl ">
        <div class="modal-content bg-info">
          <div class="modal-header" style="text-align: right">
            <h4 class="modal-title" style="text-align: right; vertical-align: middle;">Captura de Imagen de Documento </h4>
            - Por favor acerque su documento a la camara y haga click &emsp;
              <input type="button" id="btnGrabaDNI" class="btn btn-warning" value="GRABAR" style="text-align: center; width: 110px" onclick="xGraba()" />

            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
          </div>
          <div class="modal-body">

            <div class="form-group row">

              <label class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-6 col-xl-4 col-form-label">Camara</label>
              <label class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-6 col-xl-4 col-form-label">Imagen Frontal</label>
              <label class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-6 col-xl-4 col-form-label">Imagen Posterior</label>


              <div id="webcam" class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4"></div>

              <div class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                <img id="imgdnifrente" alt="" />
              </div>

              <div class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                <img id="imgdniatras" alt="" />
              </div>


              <div class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4"></div>
              <div class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                <input type="button" id="btnCaptureFrente" class="btn btn-outline-light" value="Realizar Toma de Imagen Frontal" /></div>
              <div class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                <input type="button" id="btnCaptureAtras" class="btn btn-outline-light" value="Realizar Toma de Imagen Posterior" style="text-align: right" /></div>

            </div>


          </div>

        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>




  </form>

</asp:Content>
