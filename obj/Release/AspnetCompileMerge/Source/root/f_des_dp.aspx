  <%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/root/Main.Master" CodeBehind="f_des_dp.aspx.vb" Inherits="RH.f_des_dp1" %>

 
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="RH.cl_COMUN_AD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ph_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph_Titulo" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph_body_head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ph_body" runat="server">
    <form runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>

        <section class="content">
            <div class="container-fluid">
                <div class="row"> 
                    <div class="col-md-8"> 
                        <div class="card card-warning">
                            <div class="card-header">
                                <h3 class="card-title">Descripcion de Puesto</h3>
                            </div> 
                            <asp:UpdatePanel ID="up_DPue" runat="server">
                                <ContentTemplate>

                                    <div class="card-body">
                                        <div class="row">

                                            <div class="col-sm-6">
                                                <label>Codigo</label>
                                                <div class="input-group mb-3">
                                                    <input type="text" id="t_CodDP" class="form-control" runat="server">
                                                    <div class="input-group-prepend"> 
                                                        <asp:Button ID="bt_Buscar" CssClass="btn btn-primary" runat="server" Text="Buscar" />
                                                    </div>
                                                    <div class="input-group-prepend">
                                                        <button type="button" class="btn btn-info" >Nuevo</button>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <label>Nombre de Puesto</label>
                                                    <input id="t_DesPuesto" type="text" class="form-control" placeholder="" runat="server">
                                                </div>
                                            </div>
                                           
                                            <div class="col-sm-12">
                                                <!-- textarea -->
                                                <div class="form-group">
                                                    <label>Descripcion General</label>
                                                    <textarea id="t_DesGeneral" class="form-control" rows="3" placeholder="" runat="server"></textarea>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h3 class="card-title">Descripcion Especifica</h3>
                                                    </div>
                                                    <!-- /.card-header -->
                                                    <div class="card-body">
                                                        <table class="table table-bordered">
                                                            <thead>
                                                                <tr>
                                                                    <th style="width: 10px">#</th>
                                                                    <th>Accion</th>
                                                                    <th>Descripcion</th>
                                                                    <th style="width: 120px"></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                              <%
                                                                  Dim oComun As New RH.cl_COMUN_AD
                                                                  Dim oDT As New DataTable

                                                                  If t_CodDP.Value = "" Then
                                                                    t_CodDP.Value = 0
                                                                  End If

                                                                  oComun.AgregaParametro("@i_CodDP", "I", 10, t_CodDP.Value)
                                                                  oDT = oComun.EjecutaProcedure("[data].[S_DescripcionPuesto_Esp_Carga]")
                                                                  For nItem = 0 To oDT.Rows.Count - 1
                                                                    %><tr><td><%=oDT.Rows(nItem).Item("ITEM") %></td><%
                                                                    %><td><%=oDT.Rows(nItem).Item("AC01") + " " + oDT.Rows(nItem).Item("AC02") + " " + oDT.Rows(nItem).Item("AC03") + " " + oDT.Rows(nItem).Item("AC04") %></td><%
                                                                    %><td><%=oDT.Rows(nItem).Item("DEST") %></td>

                      <td>
                      <div>
                        <Button type = "button" Class="btn btn-primary"><i Class="fas fa-edit"></i></button>
                        <Button type = "button" Class="btn btn-danger"><i Class="fas fa-eraser"></i></button>
                      </div>
                    </td>


                                                                      </tr><% %>
                                                              <%
                                                                  Next %>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="card-footer clearfix">
                                                        <asp:Button ID="bt_graba" CssClass="btn btn-primary" runat="server" Text="Agregar"  data-toggle="modal" data-target="#modal-warning" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <table class="table table-bordered">
                                                            <thead>
                                                                <tr>
                                                                    <th style="width: 10px">#</th>
                                                                    <th>Accion</th>
                                                                    <th>Descripcion</th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                                          <%
                                                              Dim wn1 As Integer = 0
                                                              Dim wn2 As Integer = 0
                                                              Dim wn3 As Integer = 0
                                                              Dim nItm As Integer = 0
                                                              Dim oDTT As New DataTable

                                                              oComun.Reset()
                                                              oComun.AgregaParametro("@i_CodDP", "I", 10, t_CodDP.Value)
                                                              oDTT = oComun.EjecutaProcedure("data.S_DPCompetencia_Carga")


                                                              While nItm <= (oDTT.Rows.Count - 1)
                                                          %>
                                                                <tr style="background-color: #C0C0C0">
                                                                    <td colspan="3"><%=oDTT.Rows(nItm).Item("DESN01")%></td>
                                                                </tr>
                                                              <%  wn1 = oDTT.Rows(nItm).Item("CODN01")
                                                                  While oDTT.Rows(nItm).Item("CODN01") = wn1%>
                                                                <tr>
                                                                    <td><%=nItm + 1 %></td>
                                                                    <td><%=oDTT.Rows(nItm).Item("DESN02").ToString %></td>
                                                                    <td>
                                                                        <table class="table table-sm" style="margin: 0px;">
                                                                          <%  wn2 = oDTT.Rows(nItm).Item("CODN02")
                                                                              While oDTT.Rows(nItm).Item("CODN02") = wn2%>
                                                                            <tr>
                                                                                <td style="border-style: none">
                                                                                    <%=oDTT.Rows(nItm).Item("DESN03").ToString %>
                                                                                </td>
                                                                            </tr>
                                                                           <%    nItm=nitm+1
                                                                                 If nItm > oDTT.Rows.Count - 1 Then
                                                                                   Exit While
                                                                                 End If

                                                                               End While
                                                                               %>
                                                                        </table>
                                                                    </td>

                                                                </tr> 

                                                              <%    If nItm > oDTT.Rows.Count - 1 Then
                                                                      Exit While
                                                                    End If

                                                                  End While
                                                                  If nItm > oDTT.Rows.Count - 1 Then
                                                                    Exit While
                                                                  End If%>
                                                              <%End While %>

                                                            </tbody> 
                                                        </table>
                                                    </div>
                                                    <!-- /.card-body -->
                                                    <div class="card-footer clearfix">
                                                        <asp:Button ID="bt_ADD_Espec" CssClass="btn btn-primary" runat="server" Text="Agregar"  data-toggle="modal" data-target="#modal-especs" />
                                                    </div>
                                                </div>
                                                <!-- /.card -->

                                            </div>

                                        </div>

                                    </div>

                                </ContentTemplate>
                            </asp:UpdatePanel>


                            <!-- /.card-body -->
                        </div>
                    </div>



                </div> 
            </div> 
        </section>
       

      <div class="modal fade" id="modal-warning">
        <div class="modal-dialog">
          <div class="modal-content bg-info">
            <div class="modal-header">
              <h4 class="modal-title">Descripcion Especifica</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body"> 


                <div class="col-sm-12">
                    <div class="form-group">
                      <h3 class="card-title col-sm-6" >Accion 1</h3>
                      <asp:DropDownList ID="dl_Acc01" runat="server"  class="form-control col-sm-6" ></asp:DropDownList>
                    </div>
                </div>

                <div class="col-sm-12">
                    <div class="form-group">
                      <h3 class="card-title col-sm-6" >Accion 2</h3>
                      <asp:DropDownList ID="dl_Acc02" runat="server"  class="form-control col-sm-6" ></asp:DropDownList>
                    </div>
                </div>

                <div class="col-sm-12">
                    <div class="form-group">
                      <h3 class="card-title col-sm-6" >Accion 3</h3>
                      <asp:DropDownList ID="dl_Acc03" runat="server"  class="form-control col-sm-6" ></asp:DropDownList>
                    </div>
                </div>

                <div class="col-sm-12">
                    <div class="form-group">
                      <h3 class="card-title col-sm-6" >Accion 4</h3>
                      <asp:DropDownList ID="dl_Acc04" runat="server"  class="form-control col-sm-6" ></asp:DropDownList>
                    </div>
                </div>


                <div class="col-sm-12">
                    <!-- text input -->
                    <div class="form-group">
                        <h3 class="card-title">Descripcion</h3> 
                        <textarea id="t_DesEspe" class="form-control" rows="3" placeholder="" runat="server" maxlength="500"></textarea>
                       
                    </div>
                </div>
               
            </div>
            <div class="modal-footer justify-content-between">
              <asp:Button ID="bt_ItmEsp_Salir" CssClass="btn btn-outline-dark" runat="server" Text="Salir"/>
              <asp:Button ID="bt_ItmEsp_Graba" CssClass="btn btn-outline-dark" runat="server" Text="Grabar"/>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>



      <div class="modal fade" id="modal-especs">
        <div class="modal-dialog">
          <div class="modal-content bg-default">
            <div class="modal-header">
              <h4 class="modal-title">Perfil</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body"> 


            <asp:UpdatePanel ID="up_Stru" runat="server">
              <ContentTemplate>
                    <asp:TreeView ID="tv_Str" runat="server" ImageSet="Msdn" ShowCheckBoxes="Leaf"></asp:TreeView>
                </ContentTemplate>
            </asp:UpdatePanel>
               
            </div>
            <div class="modal-footer justify-content-between">
              <asp:Button ID="bt_Frm_Com_Salir" CssClass="btn btn-outline-dark" runat="server" Text="Salir"/>
              <asp:Button ID="bt_Frm_Com_Graba" CssClass="btn btn-outline-dark" runat="server" Text="Grabar"/>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>





    </form>

</asp:Content>
