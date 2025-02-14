<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CambioClave.aspx.vb" Inherits="RH.CambioClave" %>

<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>RH | Cambio de Contrase&ntilde;a</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

<%--  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <!-- Toastr -->
  <script src="../plugins/toastr/toastr.min.js"></script>--%>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="../plugins/icheck-bootstrap/icheck-bootstrap.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="../dist/css/adminlte.min.css" />
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet" />
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="../plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css" />
    <!-- Toastr -->
    <link rel="stylesheet" href="../plugins/toastr/toastr.min.css" />

    <!-- jQuery -->
    <script src="../plugins/jquery/jquery.min.js"></script>
    <!-- SweetAlert2 -->
    <script src="../plugins/sweetalert2/sweetalert2.min.js"></script>
    <!-- Toastr -->
    <script src="../plugins/toastr/toastr.min.js"></script>
   
</head>

<body class="hold-transition login-page">

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

<div class="login-box">
  <div class="login-logo">
    <a href="Login.aspx"><b>Recursos Humanos</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Cambio de Contrase&ntilde;a.</p>

      <form  runat="server">

        <div class="input-group mb-3">
          <input type="text" id="tx_usuario" class="form-control" placeholder="Usuario" runat="server">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>

        <div class="input-group mb-3">
          <input type="password" id="tx_usuario_psw" class="form-control" placeholder="Contrase&ntilde;a Actual" runat="server">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>

        <div class="input-group mb-3">
          <input type="password"  id="tx_usuario_pswnew" class="form-control" placeholder="Nueva Contrase&ntilde;a" runat="server">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
         
        <div class="input-group mb-3">
          <input type="password"  id="tx_usuario_psw_newcnf" class="form-control" placeholder="Confirme Nueva Contrase&ntilde;a" runat="server">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-12"> 
            <asp:Button id="bt_Aceptar"  class="btn btn-primary btn-block" runat="server" Text="Cambiar Contrase&ntilde;a" />
          </div>
          <!-- /.col -->
        </div>
        
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

      </form>

      <p class="mt-3 mb-1">
        <a href="../login.aspx">Login</a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>

 

</body>
</html>
