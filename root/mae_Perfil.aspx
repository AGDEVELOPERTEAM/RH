<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/root/Main.Master" CodeBehind="mae_Perfil.aspx.vb" Inherits="RH.mae_Perfil" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="RH.cl_COMUN_AD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ph_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph_Titulo" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="plh_Mensaje" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ph_body_head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ph_body" runat="server">
 <%
   Dim codtrb As String
   Dim dtProfile As DataTable
   Dim oComun As New RH.cl_COMUN_AD
   codtrb = Request.QueryString("code")


   If codtrb <> "" Then
     dtProfile = oComun.EjecutaCadenaSQL("SELECT * FROM [sap].[V_MaestroPersonal_All] WHERE PERNR='" & codtrb & "'")
   End If

   If codtrb = "" Then
     Response.Redirect("..\root\mae_FichaPersonal.aspx")
   ElseIf dtProfile.Rows.Count = 0 Then
     Response.Redirect("..\root\mae_FichaPersonal.aspx")
   End If


   %>

      <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">

           <!-- Profile Image -->
           <div class="card card-primary card-outline">
             <div class="card-body box-profile">
               <div class="text-center">

                 <div class="col-10 text-center align-content-center">
                   <img src="<%=dtProfile.Rows(0).Item("Foto").ToString %>" alt="" class="img-circle img-fluid" align="center">
                 </div>

               </div>

               <h3 class="profile-username text-center"><%=dtProfile.Rows(0).Item("NombreCompleto").ToString %></h3>

               <p class="text-muted text-center"><%=dtProfile.Rows(0).Item("despto").ToString %></p>
               <p class="text-muted text-center"><%=dtProfile.Rows(0).Item("name1").ToString %></p>

               <ul class="list-group list-group-unbordered mb-3">
                 <li class="list-group-item">
                   <b>Codigo</b> <a class="float-right"><%=dtProfile.Rows(0).Item("pernr").ToString %></a>
                 </li>
                 <li class="list-group-item">
                   <b><%=dtProfile.Rows(0).Item("TipDocId").ToString %></b> <a class="float-right"><%=dtProfile.Rows(0).Item("ICNUM").ToString %></a>
                 </li>
                 <li class="list-group-item">
                   <b>Telefono</b> <a class="float-right"><%=dtProfile.Rows(0).Item("Telefono").ToString %></a>
                 </li>
                 <li class="list-group-item">
                   <b>EMail Personal</b> <a class="float-right" href="mailto:<%=dtProfile.Rows(0).Item("CorreoPropio").ToString %>"><%=dtProfile.Rows(0).Item("CorreoPropio").ToString %></a>
                 </li>
                 <li class="list-group-item">
                   <b>EMail Empresa</b> <a class="float-right" href="mailto:<%=dtProfile.Rows(0).Item("CorreoEmpresa").ToString %>"><%=dtProfile.Rows(0).Item("CorreoEmpresa").ToString %></a>
                 </li>
               </ul>

               <%--<a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>--%>
             </div>
             <!-- /.card-body -->
           </div>
           <!-- /.card -->
         </div>
           <div class="col-md-4">
             <!-- About Me Box -->
             <div class="card card-primary">
               <div class="card-header">
                 <h3 class="card-title">ORGANIZATIVO</h3>
               </div>
               <!-- /.card-header -->
               <div class="card-body">

                  <ul class="list-group list-group-unbordered mb-3">
                    <li class="list-group-item">
                      <strong><i class="fas fa-book mr-1"></i>Fecha de Ingreso</strong> <a class="float-right"><%=dtProfile.Rows(0).Item("FechaIngreso").ToString %></a>
                    </li>
                    <li class="list-group-item">
                      <strong><i class="fas fa-book mr-1"></i>Fecha de Cese</strong> <a class="float-right"><%=dtProfile.Rows(0).Item("CeseFecha").ToString %></a>
                    </li>
                    <li class="list-group-item">
                      <strong><i class="fas fa-book mr-1"></i>Motivo de Cese</strong> <a class="float-right"><%=dtProfile.Rows(0).Item("CeseMotivo").ToString %></a>
                    </li>
                    <li class="list-group-item">
                      <strong><i class="fas fa-book mr-1"></i>Division de Personal</strong> <a class="float-right"><%=dtProfile.Rows(0).Item("NAME1").ToString %></a>
                    </li>
                    <li class="list-group-item">
                      <strong><i class="fas fa-book mr-1"></i>Area de Nomina</strong> <a class="float-right"><%=dtProfile.Rows(0).Item("PlanillaDes").ToString %></a>
                    </li>
                    <li class="list-group-item">
                      <strong><i class="fas fa-book mr-1"></i>Area de Personal</strong> <a class="float-right"><%=dtProfile.Rows(0).Item("apedes").ToString %></a>
                    </li>
                    <li class="list-group-item">
                      <strong><i class="fas fa-book mr-1"></i>Unidad Organizativa </strong> <a class="float-right"><%=dtProfile.Rows(0).Item("DESUOG").ToString %></a>
                    </li>
                    <li class="list-group-item">
                      <strong><i class="fas fa-book mr-1"></i>Posicion</strong> <a class="float-right"><%=dtProfile.Rows(0).Item("despto").ToString %></a>
                    </li>
                    <li class="list-group-item">
                      <strong><i class="fas fa-book mr-1"></i>Unidad Organizativa Principal</strong> <a class="float-right"><%=dtProfile.Rows(0).Item("gerencia").ToString %></a>
                    </li>
                    <li class="list-group-item">
                      <strong><i class="fas fa-book mr-1"></i>Jefe Directo</strong> <a class="float-right"><%=dtProfile.Rows(0).Item("JefeDes").ToString %></a>
                    </li>
                    <li class="list-group-item">
                      <strong><i class="fas fa-book mr-1"></i>Centro de Costo Cod.</strong> <a class="float-right"><%=dtProfile.Rows(0).Item("ccocod").ToString %></a>
                    </li>
                    <li class="list-group-item">
                      <strong><i class="fas fa-book mr-1"></i>Centro de Costo Des.</strong> <a class="float-right"><%=dtProfile.Rows(0).Item("ccodes").ToString %></a>
                    </li>

                    <li class="list-group-item">
                      <strong><i class="fas fa-book mr-1"></i>Indicador de Vetado</strong> <a class="float-right"><%=dtProfile.Rows(0).Item("VetadoSN").ToString %></a>
                    </li>
                    <li class="list-group-item">
                      <strong><i class="fas fa-book mr-1"></i>Comentario de Vetado</strong> <a class="float-right"><%=dtProfile.Rows(0).Item("VetadoOBS").ToString %></a>
                    </li>

                    <li class="list-group-item">
                      <strong><i class="fas fa-book mr-1"></i>Indicador de Polifuncionalidad</strong> <a class="float-right"><%=dtProfile.Rows(0).Item("PolifuncSN").ToString %></a>
                    </li>
                    <li class="list-group-item">
                      <strong><i class="fas fa-book mr-1"></i>Comentario de Polifuncionalidad</strong> <a class="float-right"><%=dtProfile.Rows(0).Item("PolifuncOBS").ToString %></a>
                    </li>

                  </ul>
                  
                   

               </div>
               <!-- /.card-body -->
             </div>
             <!-- /.card -->
           </div>
           <!-- /.col -->
           <div class="col-md-4">
             <!-- About Me Box -->
             <div class="card card-primary">
               <div class="card-header">
                 <h3 class="card-title">PERSONAL</h3>
               </div>
               <!-- /.card-header -->
               <div class="card-body">
                 <strong><i class="fas fa-map-marker-alt mr-1"></i>Departamento de Residencia</strong>

                 <p class="text-muted">
                  <%=dtProfile.Rows(0).Item("DepDes").ToString %>
       
                 </p>

                 <hr>

                 <strong><i class="fas fa-map-marker-alt mr-1"></i>Provincia</strong>

                 <p class="text-muted"><%=dtProfile.Rows(0).Item("PrvDes").ToString %></p>

                 <hr>

                 <strong><i class="fas fa-map-marker-alt mr-1"></i>Distrito</strong>

                 <p class="text-muted"><%=dtProfile.Rows(0).Item("DisDes").ToString %></p>

                 <hr>


                 <strong><i class="fas fa-map-marker-alt mr-1"></i>Nombre de Zona</strong>

                 <p class="text-muted"><%=dtProfile.Rows(0).Item("NomZon").ToString %></p>

                 <hr>

                 <strong><i class="fas fa-map-marker-alt mr-1"></i>Nombre de Via</strong>

                 <p class="text-muted"><%=dtProfile.Rows(0).Item("NomVia").ToString %></p>

                 <hr>

                 <strong><i class="fas fa-map-marker-alt mr-1"></i>Numero de Via</strong>

                 <p class="text-muted"><%=dtProfile.Rows(0).Item("NumVia").ToString %></p>

                 <hr>

                 <strong><i class="fas fa-map-marker-alt mr-1"></i>Direccion de Residencia</strong>

                 <p class="text-muted"><%=dtProfile.Rows(0).Item("DIREC").ToString %></p>

                 <hr>

                 <strong><i class="fas fa-map-marker-alt mr-1"></i>Discapacitado</strong>

                 <p class="text-muted"><%=dtProfile.Rows(0).Item("DiscapacitadoSN").ToString %></p>




               </div>
               <!-- /.card-body -->
             </div>
             <!-- /.card -->
           </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->


</asp:Content>
