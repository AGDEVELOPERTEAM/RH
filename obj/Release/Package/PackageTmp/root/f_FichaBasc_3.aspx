<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/root/Main.Master"  CodeBehind="f_FichaBasc_3.aspx.vb" Inherits="RH.f_FichaBasc_3" %>

<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="RH.cl_COMUN_AD" %>

  
<asp:Content ID="Content1" ContentPlaceHolderID="ph_head" runat="server">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
  <script src="../plugins/js/filesaver.js"></script>
  <script src="../plugins/js/html2canvas.js"></script>
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

      $("#btnCaptureF").click(function () {
        Webcam.snap(function (data_uri) {
          $("#imgdnifrente")[0].src = data_uri;
          $("#btnUpload").removeAttr("disabled");
        });
      });

      $("#btnCaptureT").click(function () {
        Webcam.snap(function (data_uri) {
          $("#imgdniatras")[0].src = data_uri;
          $("#btnUpload").removeAttr("disabled");
        });
      });




    });


    function OnSuccess(response) {
      alert(response.d);
    }

    function sleep(milliseconds) {
      var start = new Date().getTime();
      for (var i = 0; i < 1e7; i++) {
        if ((new Date().getTime() - start) > milliseconds) {
          break;
        }
      }
    }

    function xGraba() {
      GrabaFrente();

      sleep(2000);
      GrabaAtras();

      sleep(2000);

      location.reload();
      window.location.href = window.location.href;
      location.reload();

    }

    function GrabaFrente() {
      $.ajax({
        type: "POST",
        url: "f_FichaBasc_3.aspx/GrabaFotoDNI",
        data: "{data: '" + $("#imgdnifrente")[0].src + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {

          $("[id*=imgdnifrente]").css("visibility", "visible");
          $("[id*=imgdnifrente]").attr("src", r.d);
        },
        failure: function (response) {
          alert(response.d);
        },
        oncapture: function () {
          webcam.save(pageUrl);
        }
      });
    }

    function GrabaAtras() {
      $.ajax({
        type: "POST",
        url: "f_FichaBasc_3.aspx/GrabaFotoDNIAtras",
        data: "{data: '" + $("#imgdniatras")[0].src + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (r) {

          $("[id*=imgdniatras]").css("visibility", "visible");
          $("[id*=imgdniatras]").attr("src", r.d);
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
<asp:Content ID="Content2" ContentPlaceHolderID="ph_Titulo" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph_body_head" runat="server"></asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ph_body" runat="server">
    <script>

    mapa = {
      map: false,
      marker: false,

      initMap: function () {

        // Creamos un objeto mapa y especificamos el elemento DOM donde se va a mostrar.

        mapa.map = new google.maps.Map(document.getElementById('mapa'), {
          center: { lat: 0, lng: 0 },
          scrollwheel: false,
          zoom: 18,
          zoomControl: true,
          rotateControl: false,
          mapTypeControl: true,
          streetViewControl: true,
        });

        // Creamos el marcador
        mapa.marker = new google.maps.Marker({
          position: { lat: 0, lng: 0 },
          draggable: true
        });

        // Le asignamos el mapa a los marcadores.
        mapa.marker.setMap(mapa.map);

        mapa.marker.addListener('dragend', function (event) {
          //escribimos las coordenadas de la posicion actual del marcador dentro del input #coords
          document.getElementById("lat").value = this.getPosition().lat();
          document.getElementById("lon").value = this.getPosition().lng();
        });


      },

      // función que se ejecuta al pulsar el botón buscar dirección
      getCoords: function (iBusca) {
        // Creamos el objeto geodecoder
        var geocoder = new google.maps.Geocoder();

        var wlat = document.getElementById("lat").value
        var wlon = document.getElementById("lon").value

        if (wlat == 0 || iBusca == 1 ) {
          address = document.getElementById('tx_search').value;
          if (address != '') {
            // Llamamos a la función geodecode pasandole la dirección que hemos introducido en la caja de texto.
            geocoder.geocode({ 'address': address }, function (results, status) {
              if (status == 'OK') {
                // Mostramos las coordenadas obtenidas en el p con id coordenadas 
                document.getElementById("lat").value = results[0].geometry.location.lat();
                document.getElementById("lon").value = results[0].geometry.location.lng();
                // Posicionamos el marcador en las coordenadas obtenidas
                mapa.marker.setPosition(results[0].geometry.location);
                // Centramos el mapa en las coordenadas obtenidas
                mapa.map.setCenter(mapa.marker.getPosition());
                //agendaForm.showMapaEventForm();
                mapa.map.setZoom(18);
              }
            });
          }
        }

        if (wlat != 0 && iBusca == 0 ) {
          myLatlng = new google.maps.LatLng(wlat, wlon);
          mapa.marker.setPosition(myLatlng );
          mapa.map.setCenter(mapa.marker.getPosition());
          mapa.map.setZoom(18);
        }

      }
    }

  </script>

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

      $(function () {
        $("#crearimagen").click(function () {
          html2canvas($("#mapa"), {
            onrendered: function (canvas) {
              theCanvas = canvas;
              document.body.appendChild(canvas);

              /*
              canvas.toBlob(function(blob) {
                saveAs(blob, "Dashboard.png"); 
              });
              */
            }
          });
        });
      });

    </script>

  <form runat="server">
    <%--<script type="text/javascript" src="https://maps.google.com/maps/api/js?key=AIzaSyBY-iwYLJw0vPAeTffNuv-EbjupW6B-k5c"></script>--%>

    <script type="text/javascript" src="https://maps.google.com/maps/api/js?key=AIzaSyA3s52piKbSGHX-h7lfSq_0CrWcim9AUxo"></script>

    

    <%
      Dim oComun As New RH.cl_COMUN_AD
      Dim wDocu As String
      Dim wPeri As String
      Dim wSqls As String
      Dim wDire As String = ""
      Dim wLat As Decimal = 0
      Dim wLon As Decimal = 0
      Dim sid As String
      Dim tData As New DataTable
      Dim oUSUARIO_EN As New RH.cl_USUARIO_EN
      Dim oUSUARIO_LN As New RH.cl_USUARIO_LN


      sid = Request.QueryString("id")
      If sid <> "" Then
        oUSUARIO_EN.KeyAcceso = sid
        oUSUARIO_EN = oUSUARIO_LN.LN_USUARIO_CARGA(oUSUARIO_EN)
        wDocu = oUSUARIO_EN.Documento
        wPeri = oUSUARIO_EN.Periodo
      Else
        Response.Redirect("/login.aspx")
      End If


      wSqls = "SELECT * FROM root.V_Ficha WHERE c_NumDNI='" + wDocu + "' AND v_codper='" + wPeri + "'"
      tData = oComun.EjecutaCadenaSQL(wSqls)
      If tData.Rows.Count > 0 Then
        wDire =
        tData.Rows(0).Item("v_Direccion").ToString.ToUpper & " / " &
        tData.Rows(0).Item("DisDes").ToString.ToUpper & " / " &
        tData.Rows(0).Item("PrvDes").ToString.ToUpper & " / " &
        tData.Rows(0).Item("DepDes").ToString.ToUpper & " / " &
        tData.Rows(0).Item("PaiDes").ToString.ToUpper

        wLat = tData.Rows(0).Item("n_Dir_Lat")
        wLon = tData.Rows(0).Item("n_Dir_Lon")
      End If

    %>



    <input type="text" id="wdoc" style="width: 100%" value="<%=wDocu%>">
    <input type="text" id="wper" style="width: 100%" value="<%=wPeri %>">

    <div class="card card-lightblue">
      <div class="card-header" style="text-align: center">
        <h3 class="card-title">PLANO DE UBICACION DE DOMICILIO (CROQUIS) - Asegurese de Ubicar el Puntero sobre la ubicacion del Domicilio</h3>
      </div>
      <!-- /.card-header -->
      <div class="card-body">

        <div class="form-group row">

          <div class="col col-lg-10">
            <input type="text" id="tx_search" style="width: 100%" value="<%=wDire %>">
          </div>
          <div class="col col-lg-2">
            <button type="button" class="btn btn-success" onclick="mapa.getCoords(1);">Buscar</button>
          </div>

        </div>

        <div class="input-group mb-3">
          <div class="container-fluid">
            <div id="mapa" style="width: 100%; height: 600px;"></div>
          </div>
        </div>

      </div>


      <div class="card-footer">
        <input type="text" id="lat" name="lat" value="<%=wLat %>">
        <input type="text" id="lon" name="lon" value="<%=wLon %>">





<%--        <button id="crearimagen" class="form-control">Crear Imagen</button>
        <!-- El div id="img-out" sera el contenedor en donde visualizaremos la imagen exportada -->
        <div id="img-out" align="center"></div>--%>
      </div>




      <script>
        mapa.initMap();
      </script>

    </div>
    <div class="card card-lightblue">
      <div class="card-header">
        <h3 class="card-title">IMAGEN DEL DOCUMENTO DE IDENTIDAD - Imagen del Documento de Identidad (asegurese que sea una imagen clara)</h3>
      </div>

      <div class="form-group row col col-xs-12 col-sm-12 col-md-12 col-xl-8">

        <div class="mb mb-3 col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
          <label class="mb mb-3 col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6 col-form-label">Imagen Frontal</label>
          <asp:Image ID="img_dni_frente" runat="server" Width="100%" />
          <asp:Image ID="Image1" runat="server" />
        </div>

        <div class="mb mb-3 col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
          <label class="mb mb-3 col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6 col-form-label">Imagen Trasera</label>
          <asp:Image ID="img_dni_atras" runat="server" Width="100%" />
        </div>

      </div>

      <div class="card-footer">
        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#FotoDniFrente">Capturar Imagen</button>
      </div>


    </div>

    <%--      <div class="card-header">
        <h3 class="card-title">IMAGEN DE HUELLAS DACTILARES - Imagen de las huellas de los 5 dedos de la mano derecha (asegurese que sea una imagen clara)</h3>
      </div>

      <div class="card-body" style="border-width: 0px; padding-bottom: 0px;">

        <div class="form-group row col col-xl-8">
          <div     class="mb mb-3 col-xs-12 col-sm-12 col-md-12 col-lg-4 col-xl-12">
            <label class="mb mb-3 col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-12 col-form-label">Imagen</label>
            <asp:Image ID="img_Huellas" runat="server" BorderStyle="Dashed" Width="100%" />
          </div>
        </div>

      </div>

      <div class="card-footer">       
        <asp:FileUpload ID="upl_UploadHuellas" CssClass="btn btn-secondary" runat="server" Height="40" accept=".png,.jpg,.jpeg"  />

        <asp:RegularExpressionValidator ID="RegExValFileUploadFileType" runat="server"
                                ControlToValidate="upl_UploadHuellas"
                                ErrorMessage="Solor Archivos de imagen .jpg,.png,.jpeg son permitidos" Font-Bold="True" ForeColor="white" BackColor="Red"
                                Font-Size="Medium"
                                ValidationExpression="(.*?)\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$"></asp:RegularExpressionValidator>

        <asp:Button ID="bt_upl_Huellas" Text="Grabar" runat="server" OnClick="Upload_Huellas" />
      </div>--%>

    <div class="card card-lightblue">

      <div class="card-footer">
        <asp:Button ID="bt_back" CssClass="btn btn-secondary" runat="server" Text="Anterior" />
        <asp:Button ID="bt_next" CssClass="btn btn-primary" runat="server" Text="Siguiente" />
      </div>

    </div>

    <script>
      mapa.getCoords(0);
    </script>

    <script>
      function CheckFile(Cntrl) {
        var file = document.getElementById(Cntrl.name);
        var len = file.value.length;
        var ext = file.value;
        if (ext.substr(len - 3, len) != "jpg") {
          alert("Please select a doc or pdf file ");
          return false;
        }
      }
    </script>
     
    <%-- TOMA DE FOTOS DE DNI / PARTE FRENTE --%>

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
<%--              <input type="button" id="btnCaptureFrente" class="btn btn-outline-light" value="Realizar Toma de Imagen Frontal"  /></div>--%>
              <input type="button" id="btnCaptureF" class="btn btn-outline-light" value="Realizar Toma de Imagen Frontal"  /></div>
            <div class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
<%--              <input type="button" id="btnCaptureAtras" class="btn btn-outline-light" value="Realizar Toma de Imagen Posterior" style="text-align: right" /></div>--%>
              <input type="button" id="btnCaptureT" class="btn btn-outline-light" value="Realizar Toma de Imagen Posterior"  /></div>
                  
        </div>

 
          </div>

        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

  </form>



</asp:Content>
