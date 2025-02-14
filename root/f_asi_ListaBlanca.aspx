<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/root/Main.Master" CodeBehind="f_asi_ListaBlanca.aspx.vb" Inherits="RH.f_asi_ListaBlanca" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ph_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph_Titulo" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="plh_Mensaje" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ph_body_head" runat="server">

  <div class="col-sm-6">
    <h1>Administracion de Lista Blanca</h1>
  </div>
  <div class="col-sm-6">
    <ol class="breadcrumb float-sm-right">
      <li class="breadcrumb-item"><a href="#">Home</a></li>
      <li class="breadcrumb-item active">Administracion de Lista Blanca</li>
    </ol>
  </div> 

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ph_body" runat="server">
 
      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Title</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fas fa-minus"></i></button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fas fa-times"></i></button>
          </div>
        </div>
        <div class="card-body">
          <table class="table table-striped projects">
              <thead>
                  <tr>
                      <th style="width: 1%">
                          #
                      </th>
                      <th style="width: 3%">                          
                      </th>
                      <th style="width: 20%">
                          Usuario
                      </th>
                      <th style="width: 10%">
                          Fecha Inicio
                      </th>
                      <th style="width: 10%">
                          Fecha Termino
                      </th>
                      <th style="width: 40%">
                          Observacion
                      </th>
                  </tr>
              </thead>
              <tbody>
                  <tr>
                      <td>
                          #
                      </td>
                      <td>
                          <ul class="list-inline">
                              <li class="list-inline-item">
                                  <img alt="Avatar" class="table-avatar" src="https://serviciosrh.int.austral.com.pe/img/short/01-S-10080389-GUTIERREZ GUTIERREZ GERMAN LANTY.jpg">
                              </li>
                          </ul>
                      </td>
                      <td>
                          <a>
                              German Gutierrez Gutierrez
                          </a>
                          <br/>
                          <small>
                              Oficina Central - Desarrollo de Sistemas
                          </small>
                      </td>
                      <td class="project_progress">
                          <a>
                              01/01/2024
                          </a>
                      </td>
                      <td class="project-state">
                          <a>
                              01/01/2024
                          </a>
                      </td>
                      <td class="project-actions text-right">
                          <a class="btn btn-primary btn-sm" href="#">
                              <i class="fas fa-folder">
                              </i>
                              View
                          </a>
                          <a class="btn btn-info btn-sm" href="#">
                              <i class="fas fa-pencil-alt">
                              </i>
                              Edit
                          </a>
                          <a class="btn btn-danger btn-sm" href="#">
                              <i class="fas fa-trash">
                              </i>
                              Eliminar
                          </a>
                      </td>
                  </tr>
 
 
              </tbody>
          </table>
        </div>
        <!-- /.card-body -->
        <div class="card-footer">
          Footer
        </div>
        <!-- /.card-footer-->
      </div>
      <!-- /.card -->

</asp:Content>
