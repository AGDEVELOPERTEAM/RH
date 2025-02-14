<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/root/Main.Master" CodeBehind="f_FichaBasc_1.aspx.vb" Inherits="RH.f_FichaBasc_1" %>

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
        url: "f_FichaBasc_1.aspx/GrabaFotoTrabajador",
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph_body_head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ph_body" runat="server">
  <form class="form-horizontal" runat="server">

    <div class="card card-success">
      <div class="card-header" style="text-align: center">
        <h3 class="card-title">SECCION A</h3>
      </div>
      <!-- /.card-header -->
      <div class="card-body">



        <div class="input-group mb-3">

          <div class="container-fluid">

            <div class="row">
              Toda la informacion registrada en esta seccion sera verificada por un funcionario de la empresa, directamente o mediante la subcontratacion de una empresa especializada en investigaciones de personal. El postulante presta su conformidad y aceptacion con la realizacion de la verificacion antes indicada.
                           
            </div>

          </div>

        </div>

      </div>
    </div>

    <div class="card card-lightblue">
      <div class="card-header" style="text-align: center">
        <h3 class="card-title">DATOS PERSONALES</h3>
      </div> 

      <div class="card-body">
        
        <div class="form-group row">

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Fecha</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_Fecha" TextMode="Date" CssClass="form-control" runat="server" ReadOnly></asp:TextBox></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Sede</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:DropDownList ID="dd_Sede" runat="server" CssClass="form-control"></asp:DropDownList></div>
 
            <div class="mb mb-3 col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12" style="text-align: center; vertical-align: middle">
                       <table style="text-align: center; vertical-align: middle">
                         <tbody   style="text-align: center; vertical-align: middle">
                        <tr style="text-align: center; vertical-align: middle">
                          <td  style="text-align: center; vertical-align: middle">
                            <asp:Image ID="img_Foto" runat="server" ImageUrl="~/pages/img/foto.jpg" Height="240" Width="320" /></td>
                        </tr>

                        <tr>
                          <td >

                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal-info">
                              Tomar Imagen
                                               
                            </button>

                          </td>
                        </tr>
                           </tbody>
                      </table>
            </div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Nombres</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_Nombre" CssClass="form-control" runat="server"></asp:TextBox></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Apellidos</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_Apellido" CssClass="form-control" runat="server"></asp:TextBox></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">F.Nacmto.</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_FechaNacimiento" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">DNI</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_dni" CssClass="form-control" runat="server"></asp:TextBox></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Estado Civil</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:DropDownList ID="dd_EstadoCivil" runat="server" CssClass="form-control"></asp:DropDownList></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Pais</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:DropDownList ID="dd_Pais" runat="server" CssClass="form-control" AutoPostBack="true"></asp:DropDownList></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Departamento</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:DropDownList ID="dd_Departamento" CssClass="form-control" runat="server" AutoPostBack="true"></asp:DropDownList></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Provincia</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:DropDownList ID="dd_Provincia" CssClass="form-control" runat="server" AutoPostBack="true"></asp:DropDownList></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Distrito</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:DropDownList ID="dd_Distrito" CssClass="form-control" runat="server"></asp:DropDownList></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Direccion</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_Direccion" CssClass="form-control" runat="server"></asp:TextBox></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Telefono</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_Telefono" CssClass="form-control" TextMode="Phone" runat="server"></asp:TextBox></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Celular</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_Celular" CssClass="form-control" TextMode="Phone" runat="server"></asp:TextBox></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Referencias</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_Referencias" CssClass="form-control" runat="server"></asp:TextBox></div>

        </div>

        <div class="input-group mb-3">

          <div class="container-fluid">

          </div>

        </div>

      </div>
    </div>




    <div class="card card-lightblue">
      <div class="card-header" style="text-align: center">
        <h3 class="card-title">DEL CONYUGUE/CONVIVIENTE</h3>
      </div> 
      <div class="card-body">
        <div class="form-group row">

        <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Nombres</label>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:TextBox ID="tx_ESPO_NOMBRE" CssClass="form-control" runat="server"></asp:TextBox></div>

        <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Apellidos</label>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:TextBox ID="tx_ESPO_APELLIDOS" CssClass="form-control" runat="server"></asp:TextBox></div>

        <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Empresa</label>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:TextBox ID="tx_ESPO_EMPRESA" CssClass="form-control" runat="server"></asp:TextBox></div>

        <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Profesion</label>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:TextBox ID="tx_ESPO_PROFESION" CssClass="form-control" runat="server"></asp:TextBox></div>

        <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Telefono</label>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:TextBox ID="tx_ESPO_TELEFONO" CssClass="form-control" runat="server"></asp:TextBox></div>

        </div>

      </div> 
    </div>

    <div class="card card-lightblue">
      <div class="card-header" style="text-align: center">
        <h3 class="card-title">DE LOS HIJOS</h3>
      </div> 
      <div class="card-body">

        <div class="form-group row">

        <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">1.Nombres</label>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:TextBox ID="tx_HIJ1_NOMBRE" CssClass="form-control" runat="server"></asp:TextBox></div>

        <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Ocupacion</label>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-2">
            <asp:TextBox ID="tx_HIJ1_OCUPACION" CssClass="form-control" runat="server"></asp:TextBox></div>

        <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-1 col-form-label">Edad</label>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-1">
            <asp:TextBox ID="tx_HIJ1_EDAD" CssClass="form-control" runat="server"></asp:TextBox></div>



        <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">2.Nombres</label>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:TextBox ID="tx_HIJ2_NOMBRE" CssClass="form-control" runat="server"></asp:TextBox></div>

        <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Ocupacion</label>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-2">
            <asp:TextBox ID="tx_HIJ2_OCUPACION" CssClass="form-control" runat="server"></asp:TextBox></div>

        <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-1 col-form-label">Edad</label>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-1">
            <asp:TextBox ID="tx_HIJ2_EDAD" CssClass="form-control" runat="server"></asp:TextBox></div>



        <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">3.Nombres</label>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:TextBox ID="tx_HIJ3_NOMBRE" CssClass="form-control" runat="server"></asp:TextBox></div>

        <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Ocupacion</label>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-2">
            <asp:TextBox ID="tx_HIJ3_OCUPACION" CssClass="form-control" runat="server"></asp:TextBox></div>

        <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-1 col-form-label">Edad</label>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-1">
            <asp:TextBox ID="tx_HIJ3_EDAD" CssClass="form-control" runat="server"></asp:TextBox></div>



        <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">4.Nombres</label>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:TextBox ID="tx_HIJ4_NOMBRE" CssClass="form-control" runat="server"></asp:TextBox></div>

        <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Ocupacion</label>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-2">
            <asp:TextBox ID="tx_HIJ4_OCUPACION" CssClass="form-control" runat="server"></asp:TextBox></div>

        <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-1 col-form-label">Edad</label>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-1">
            <asp:TextBox ID="tx_HIJ4_EDAD" CssClass="form-control" runat="server"></asp:TextBox></div>

        </div>

      </div> 
    </div>

    <div class="card card-lightblue">
      <div class="card-header" style="text-align: center">
        <h3 class="card-title">ESTUDIOS DESARROLLADOS DEL COLABORADOR</h3>
      </div> 
      <div class="card-body"> 
        <div class="form-group row">

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Primaria</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EST_PRI" CssClass="form-control" runat="server"></asp:TextBox></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Ult. A&ntilde;o Aprobado</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EST_PRI_ULT" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Secundaria</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EST_SEC" CssClass="form-control" runat="server"></asp:TextBox></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Ult. A&ntilde;o Aprobado</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EST_SEC_ULT" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox></div>




          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Instituto</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EST_INS" CssClass="form-control" runat="server"></asp:TextBox></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Ult. A&ntilde;o Aprobado</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EST_INS_ULT" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Universidad</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EST_UNI" CssClass="form-control" runat="server"></asp:TextBox></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Ult. A&ntilde;o Aprobado</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EST_UNI_ULT" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox></div>




          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Otros</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EST_OTRO" CssClass="form-control" runat="server"></asp:TextBox></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Ult. A&ntilde;o Aprobado</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EST_OTRO_ULT" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox></div>

          <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Grado Actual</label>
            <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EST_GRD_ACT" CssClass="form-control" runat="server"></asp:TextBox></div>


        </div> 
      </div>

      <div class="card-footer">
        <asp:Button ID="bt_prev" CssClass="btn btn-secondary" runat="server" Text="Anterior" />
        <asp:Button ID="bt_next" CssClass="btn btn-primary" runat="server" Text="Siguiente" />
      </div>

    </div>

    <div class="modal fade" id="modal-info">
      <div class="modal-dialog">
        <div class="modal-content bg-info">
          <div class="modal-header">
            <h4 class="modal-title">Toma de Fotografia</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span></button>
          </div>
          <div class="modal-body">
            <table border="1" cellpadding="0" cellspacing="0" style="text-align: center">

              <tr style="text-align: center">
                <td align="center"></td>
              </tr>

              <tr style="text-align: center">

                <td style="text-align: center">
                  <div id="webcam" style="text-align: center"></div>
                </td>

              </tr>

              <tr style="text-align: center">
                <td align="center"></td>
              </tr>

              <tr style="text-align: center">
                <td>
                  <img id="imgCapture" alt="" style="width: 320px; height: 240px" /></td>
              </tr>

              <tr style="text-align: center">
                <td align="center"></td>
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


  </form>
</asp:Content>
