<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/root/Main.Master" CodeBehind="mae_FichaPersonal.aspx.vb" Inherits="RH.mae_FichaPersonal" %>

<%@ Register Assembly="Infragistics45.Web.v16.1, Version=16.1.20161.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI" TagPrefix="ig" %>

<%@ Register Assembly="Infragistics45.Web.v16.1, Version=16.1.20161.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="ig" %>
<%@ Import Namespace="HR" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ph_head" runat="server">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 3 | Contacts</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
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


  <form id="maeper" runat="server">

    <div class="card card-teal card-outline">
      <div class="card-header" style="text-align: center">
        <!-- Site wrapper -->
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <div class="container-fluid">
            <div class="row mb-2">
              <div class="col-sm-5">
                <h1>Maestro de Personal</h1>
              </div>

              <div class="col-sm-4">
                <asp:DropDownList ID="ddl_filtro" runat="server">
                  <asp:ListItem Value="nom">Nombres y Apellidos</asp:ListItem>
                  <asp:ListItem Value="dni">Numero Documento</asp:ListItem>
                  <asp:ListItem Value="sed">Sede</asp:ListItem>
                  <asp:ListItem Value="are">Area</asp:ListItem>
                  <asp:ListItem Value="pla">Planilla</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="tx_busqueda" runat="server" AutoPostBack="True"></asp:TextBox>
                <a href="#" class="btn btn-sm btn-primary">
                  <i class="fas fa-search"></i>Buscar
                </a>
              </div>

              <div class="col-sm-1 align-content-end">
                  <a href="..\root\mae_FichaPersonal.aspx?download=1" class="btn btn-sm btn-warning">
                      <i class="fas fa-download"></i>Descargar
                  </a>
              </div> 
              <div class="col-sm-2 align-content-end">
  
                <div class="form-group"> 
                      <asp:CheckBox ID="cbx_activos" runat="server"   /> 
                      <label>Solo Activos</label>
                  </div> 
              </div> 
            </div>
          </div>
          <!-- /.container-fluid -->
        </section>

        <ig:WebDataGrid ID="wdg_MaestroPer" runat="server" Height="350px" Width="400px" AutoGenerateColumns="False" Visible="False">
          <Columns>
            <ig:BoundDataField DataFieldName="COD. TRAB" DataType="System.String" Key="COD. TRAB" Header-Text="COD. TRAB"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="AREA PERSONAL" DataType="System.String" Key="AREA PERSONAL" Header-Text="AREA PERSONAL"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="APELLIDO PATERNO" DataType="System.String" Key="APELLIDO PATERNO" Header-Text="APELLIDO PATERNO"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="APELLIDO MATERNO" DataType="System.String" Key="APELLIDO MATERNO" Header-Text="APELLIDO MATERNO"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="NOMBRES" DataType="System.String" Key="NOMBRES" Header-Text="NOMBRES"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="AREA DE NOMINA" DataType="System.String" Key="AREA DE NOMINA"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="NOMBRE COMPLETO" DataType="System.String" Key="NOMBRE COMPLETO"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="TIPO DOCUMENTO IDENTIDAD" DataType="System.String" Key="TIPO DOCUMENTO IDENTIDAD"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="NUMERO DOCUMENTO IDENTIDAD" DataType="System.String" Key="NUMERO DOCUMENTO IDENTIDAD"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="SEXO" DataType="System.String" Key="SEXO"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="CORREO PERSONAL" DataType="System.String" Key="CORREO PERSONAL"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="CORREO EMPRESA" DataType="System.String" Key="CORREO EMPRESA"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="FECHA INGRESO" DataType="System.String" Key="FECHA INGRESO"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="POSICION" DataType="System.String" Key="POSICION"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="POLIFUNCIONAL" DataType="System.String" Key="POLIFUNCIONAL"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="OBS. POLIFUNCIONAL" DataType="System.String" Key="OBS. POLIFUNCIONAL"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="GRUPO PERSONAL" DataType="System.String" Key="GRUPO PERSONAL"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="FECHA RETIRO" DataType="System.String" Key="FECHA RETIRO"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="MOTIVO RETIRO" DataType="System.String" Key="MOTIVO RETIRO"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="INDICADOR VETADO" DataType="System.String" Key="INDICADOR VETADO"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="COMENTARIO VETADO" DataType="System.String" Key="COMENTARIO VETADO"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="UNIDAD ORGANIZATIVA PRINCIPAL" DataType="System.String" Key="UNIDAD ORGANIZATIVA PRINCIPAL"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="UNIDAD ORGANIZATIVA" DataType="System.String" Key="UNIDAD ORGANIZATIVA"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="DIV. DE PERSONAL" DataType="System.String" Key="DIV. DE PERSONAL"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="JEFE DIRECTO" DataType="System.String" Key="JEFE DIRECTO"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="CODIGO CC" DataType="System.String" Key="CODIGO CC"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="CENTRO DE COSTO" DataType="System.String" Key="CENTRO DE COSTO"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="DISCAPACITADO" DataType="System.String" Key="DISCAPACITADO"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="DEPARTAMENTO RESIDENCIA" DataType="System.String" Key="DEPARTAMENTO RESIDENCIA"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="PROVINCIA RESIDENCIA" DataType="System.String" Key="PROVINCIA RESIDENCIA"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="DISTRITO RESIDENCIA" DataType="System.String" Key="DISTRITO RESIDENCIA"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="NOMBRE ZONA" DataType="System.String" Key="NOMBRE ZONA"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="NOMBRE VIA" DataType="System.String" Key="NOMBRE VIA"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="NUMERO VIA" DataType="System.String" Key="NUMERO VIA"></ig:BoundDataField>
            <ig:BoundDataField DataFieldName="DIRECCION RESIDENCIA" DataType="System.String" Key="DIRECCION RESIDENCIA"></ig:BoundDataField>
          </Columns>
        </ig:WebDataGrid>

        <ig:WebExcelExporter ID="wex_MaestroPer" runat="server" ExportMode="Download" DataExportMode="AllDataInDataSource" DownloadName="MaestroPersonal"></ig:WebExcelExporter>

        <ig:WebScriptManager ID="WebScriptManager1" runat="server"></ig:WebScriptManager>

        <%
          Dim oComun As New cl_COMUN_AD
          Dim oUSUARIO_EN As New cl_USUARIO_EN
          Dim oUSUARIO_LN As New cl_USUARIO_LN

          Dim dt_Trabajadores As DataTable

          Dim SGalleta As HttpCookie = Request.Cookies("RH")
          Session("id") = SGalleta.Values("id")
          Session("Documento") = SGalleta.Values("nd")

          oUSUARIO_EN.KeyAcceso = SGalleta.Values("id")
          oUSUARIO_EN = oUSUARIO_LN.LN_USUARIO_CARGA(oUSUARIO_EN)

          If tx_busqueda.Text <> "" Then


            Select Case ddl_filtro.SelectedValue
              Case "nom"
                oComun.AgregaParametro("@cod", "V", 8, "")
                oComun.AgregaParametro("@dni", "V", 10, "")
                oComun.AgregaParametro("@nom", "V", 50, tx_busqueda.Text)
                oComun.AgregaParametro("@pta", "V", 50, "")
                oComun.AgregaParametro("@are", "V", 50, "")
                oComun.AgregaParametro("@pla", "V", 50, "")
              Case "dni"
                oComun.AgregaParametro("@cod", "V", 8, "")
                oComun.AgregaParametro("@dni", "V", 10, tx_busqueda.Text)
                oComun.AgregaParametro("@nom", "V", 50, "")
                oComun.AgregaParametro("@pta", "V", 50, "")
                oComun.AgregaParametro("@are", "V", 50, "")
                oComun.AgregaParametro("@pla", "V", 50, "")
              Case "sed"
                oComun.AgregaParametro("@cod", "V", 8, "")
                oComun.AgregaParametro("@dni", "V", 10, "")
                oComun.AgregaParametro("@pta", "V", 50, tx_busqueda.Text)
                oComun.AgregaParametro("@nom", "V", 50, "")
                oComun.AgregaParametro("@are", "V", 50, "")
                oComun.AgregaParametro("@pla", "V", 50, "")
              Case "are"
                oComun.AgregaParametro("@cod", "V", 8, "")
                oComun.AgregaParametro("@dni", "V", 10, "")
                oComun.AgregaParametro("@nom", "V", 50, "")
                oComun.AgregaParametro("@pta", "V", 50, "")
                oComun.AgregaParametro("@are", "V", 50, tx_busqueda.Text)
                oComun.AgregaParametro("@pla", "V", 50, "")
              Case "pla"
                oComun.AgregaParametro("@cod", "V", 8, "")
                oComun.AgregaParametro("@dni", "V", 10, "")
                oComun.AgregaParametro("@nom", "V", 50, "")
                oComun.AgregaParametro("@pta", "V", 50, "")
                oComun.AgregaParametro("@are", "V", 50, "")
                oComun.AgregaParametro("@pla", "V", 50, tx_busqueda.Text)
            End Select

            oComun.AgregaParametro("@est", "C", 1, IIf(cbx_activos.Checked, "A", ""))
            dt_Trabajadores = oComun.EjecutaProcedure("maeper.S_BuscaMaePer")

          End If

        %>

        <!-- Main content -->
        <section class="content">

          <!-- Default box -->
          <div class="card card-solid">
            <div class="card-body pb-0">
              <div class="row d-flex align-items-stretch">

                <%
                  If tx_busqueda.Text <> "" Then

                    For nTrb = 0 To dt_Trabajadores.Rows.Count - 1 %>

                <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
                  <div class="card bg-light">
                    <div class="card-header text-muted border-bottom-0">
                      <%=dt_Trabajadores.Rows(nTrb).Item("desuog").ToString & " / " & dt_Trabajadores.Rows(nTrb).Item("despto").ToString  %>
                    </div>
                    <div class="card-body pt-0">
                      <div class="row">
                        <div class="col-7">
                          <h2 class="lead"><b><%=dt_Trabajadores.Rows(nTrb).Item("NombreCompleto").ToString %></b></h2>
                          <p class="text-muted text-sm"><b>COD: <%=dt_Trabajadores.Rows(nTrb).Item("PERNR").ToString %> </b></p>
                          <p class="text-muted text-sm"><%=dt_Trabajadores.Rows(nTrb).Item("Name1").ToString & " / " & dt_Trabajadores.Rows(nTrb).Item("PlanillaDes").ToString %></p>
                          <ul class="ml-4 mb-0 fa-ul text-muted">
                            <li class="small"><span class="fa-li"><i class="fas fa-lg fa-hat-cowboy-side"></i></span>Jefatura: <%=dt_Trabajadores.Rows(nTrb).Item("JefeDes").ToString %></li>
                            <li class="small"><span class="fa-li"><i class="fas fa-lg fa-mail-bulk"></i></span>Mail : <%=dt_Trabajadores.Rows(nTrb).Item("EMail").ToString %></li>
                          </ul>
                        </div>
                        <div class="col-5 text-center">
                          <img src="<%=dt_Trabajadores.Rows(nTrb).Item("Foto").ToString %>" alt="" class="img-circle img-fluid">
                        </div>
                      </div>
                    </div>
                    <div class="card-footer">
                      <div class="text-right">
                        <a href="#" class="btn btn-sm bg-teal">
                          <i class="fas fa-comments"></i>
                        </a>
                        <a href="..\root\mae_Perfil.aspx?code=<%=dt_Trabajadores.Rows(nTrb).Item("PERNR").ToString %>" class="btn btn-sm btn-primary">
                          <i class="fas fa-user"></i>Ver Perfil
                        </a>
                      </div>
                    </div>
                  </div>
                </div>


                <% Next

                  End If
                %>
              </div>
            </div>
            <%--        <!-- /.card-body -->
        <div class="card-footer">
          <nav aria-label="Contacts Page Navigation">
            <ul class="pagination justify-content-center m-0">
              <li class="page-item active"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">4</a></li>
              <li class="page-item"><a class="page-link" href="#">5</a></li>
              <li class="page-item"><a class="page-link" href="#">6</a></li>
              <li class="page-item"><a class="page-link" href="#">7</a></li>
              <li class="page-item"><a class="page-link" href="#">8</a></li>
            </ul>
          </nav>
        </div>
        <!-- /.card-footer -->--%>
          </div>
          <!-- /.card -->


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

                    <br />
                    * Por favor acercarse a Recursos Humanos para la toma de Huellas Digitales y dar por Finalizada la presente.
                  </div>
                  <br />

                </div>
                <div class="modal-footer">
                </div>
              </div>
            </div>
          </div>








        </section>
        <!-- /.content -->
      </div>
      <!-- /.content-wrapper -->





    </div>


  </form>


  <!-- ./wrapper -->

  <!-- jQuery -->
  <script src="../../plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- AdminLTE App -->
  <script src="../../dist/js/adminlte.min.js"></script>
  <!-- AdminLTE for demo purposes -->
  <script src="../../dist/js/demo.js"></script>




</asp:Content>
