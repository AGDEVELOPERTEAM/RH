<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="RH.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>RH</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
   
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
<body class="hold-transition login-page" style="background-position: center top; background-image: url('img/fondo.jpg'); background-repeat: no-repeat; background-size: cover" >

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

        <div class="login-box">
            <div class="card" style="background-color: #232F34;">
                <div class="login-logo">
                    <a href="#" style="color: #F9AA33"><b style="color: #FFFFFF;"><H3>Recursos</H3></b></a>
                    <a href="#" style="color: #F9AA33"><b style="color: #FFFFFF;"><H3>Humanos</H3></b></a>
<%--                    <a href="#" style="color: #F9AA33"><b style="color: #FFFFFF;"><H3>Ficha de Estudio</H3></b></a>
                    <a href="#" style="color: #F9AA33"><b style="color: #FFFFFF;"><H3>de Seguridad - BASC</H3></b></a>--%>
                </div>
                <div class="card-body login-card-body" style="background-color: #232F34;">
                    <asp:Panel ID="pnl_LOGIN" runat="server">
                        <div class="input-group mb-3">
                            <input type="text" id="tx_email" class="form-control" runat="server" placeholder="Usuario" aria-autocomplete="list" autocomplete="on" />
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" id="tx_password" class="form-control" runat="server" placeholder="Contrase&ntilde;a" autocomplete="on" />
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                            </div>
                            <div class="col-12 mb-2">
                                <asp:Button ID="bt_Valida" Width="100%" runat="server" Text="Aceptar" CssClass="btn btn-primary" />
                            </div>
                           
                        </div>
                    </asp:Panel>


                    <p class="mb-1">
                        <a href="root/CambioClave.aspx">Cambio de Contrase&ntilde;a</a>
                    </p>
<%--                    <p class="mb-3">
                        <a href="register.html" class="text-center">Crear Cuenta de Usuario</a>
                    </p>--%>
                    <div class="input-group mb-0" style="text-align: center; vertical-align: bottom; color: #66FFFF;">
                        <div class="col-12">
                            <a style="color: #FFFFFF; font-size: xx-small; font-weight: normal; font-style: normal; font-family: sans-serif;">&copy; 2021 Austral Group SAA.</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    </form>


    <!-- Bootstrap 4 -->
    <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../dist/js/adminlte.min.js"></script>


    <%--<script type="text/javascript">
  $(function() {
    const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 5000
    });

    $('.toastrDefaultError').click(function () {

      toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": true,
        "positionClass": "toast-top-center",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
      }
      toastr.error('Lorem ERROR PE! LANTY ipsum dolor sit amet, consetetur sadipscing elitr.')
    });
    $('.swalDefaultSuccess').click(function() {
      Toast.fire({
        icon: 'success',
        title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.swalDefaultInfo').click(function() {
      Toast.fire({
        icon: 'info',
        title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.swalDefaultError').click(function() {
      Toast.fire({
        icon: 'error',
        title: 'Error de Contrasena.'
      })
    });
    $('.swalDefaultWarning').click(function() {
      Toast.fire({
        icon: 'warning',
        title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.swalDefaultQuestion').click(function() {
      Toast.fire({
        icon: 'question',
        title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });

    $('.toastrDefaultSuccess').click(function() {
      toastr.success('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
    });
    $('.toastrDefaultInfo').click(function() {
      toastr.info('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
    });
    $('.toastrDefaultWarning').click(function() {
      toastr.warning('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
    });

    $('.toastsDefaultDefault').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultTopLeft').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        position: 'topLeft',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultBottomRight').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        position: 'bottomRight',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultBottomLeft').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        position: 'bottomLeft',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultAutohide').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        autohide: true,
        delay: 750,
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultNotFixed').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        fixed: false,
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultFull').click(function() {
      $(document).Toasts('create', {
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.',
        title: 'Toast Title',
        subtitle: 'Subtitle',
        icon: 'fas fa-envelope fa-lg',
      })
    });
    $('.toastsDefaultFullImage').click(function() {
      $(document).Toasts('create', {
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.',
        title: 'Toast Title',
        subtitle: 'Subtitle',
        image: '../../dist/img/user3-128x128.jpg',
        imageAlt: 'User Picture',
      })
    });
    $('.toastsDefaultSuccess').click(function() {
      $(document).Toasts('create', {
        class: 'bg-success', 
        title: 'Toast Title',
        subtitle: 'Subtitle',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultInfo').click(function() {
      $(document).Toasts('create', {
        class: 'bg-info', 
        title: 'Toast Title',
        subtitle: 'Subtitle',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultWarning').click(function() {
      $(document).Toasts('create', {
        class: 'bg-warning', 
        title: 'Toast Title',
        subtitle: 'Subtitle',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultDanger').click(function() {
      $(document).Toasts('create', {
        class: 'bg-danger', 
        title: 'Toast Title',
        subtitle: 'Subtitle',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultMaroon').click(function() {
      $(document).Toasts('create', {
        class: 'bg-maroon', 
        title: 'Toast Title',
        subtitle: 'Subtitle',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
  });

</script>--%>

</body>

</html>
