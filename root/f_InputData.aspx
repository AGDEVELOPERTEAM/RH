<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/root/Main.Master" CodeBehind="f_InputData.aspx.vb" Inherits="RH.f_InputData" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="eData.cl_COMUN_AD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ph_head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ph_body_head" runat="server">
</asp:Content>

<asp:Content ID="ContentT" ContentPlaceHolderID="ph_Titulo" runat="server">
  <asp:Label ID="lb_TITULO" runat="server" Text="REPORTE DE PRODUCCION"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ph_body" runat="server">

<form runat="server" >
          <asp:ScriptManager runat="server"></asp:ScriptManager>
 
    <div class="card card-primary card-outline"  >
      
        <div class="card-body">

            <div class="row">
                                          
                <div class="col-lg-3 col-md-6 col-xs-6">
                    <div class="form-group">
                        <label>Nro.Parte </label>
                        <div class="input-group">
                            <asp:DropDownList ID="dl_numpar" CssClass="form-control" runat="server"></asp:DropDownList>
                            <input id="tx_numpte" type="text" class="form-control" visible="false" runat="server">
                            <span class="input-group-btn">
                                <button id="bt_buscaOT" type="button" class="btn btn-info btn-flat" runat="server">Buscar</button>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 col-xs-6"  >
                        <div class="form-group">
                        <label>Fecha</label>
                        <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-calendar"></i></span>
                            <input id="tx_fecpte" type="text" class="form-control" runat="server" >
                            <input id="tx_hora" type="text" class="form-control" runat="server" >
                        </div>

                        </div>
                    </div> 
               

                <div id="dv_Proceso" class="col-lg-3 col-md-6 col-xs-6" runat="server">
                    <div class="form-group">
                        <label>Proceso</label>
                        <div class="input-group">
                            <asp:DropDownList ID="dl_proceso" CssClass="form-control" runat="server"></asp:DropDownList>
                            <input id="Text2" type="text" class="form-control" visible="false" runat="server">
                            <span class="input-group-btn">
                                <button id="bt_Proceso" type="button" class="btn btn-info btn-flat" runat="server">Buscar</button>
                            </span>
                        </div>
                    </div>
                </div>

                <div id="dv_SubProceso" class="col-lg-3 col-md-6 col-xs-6" runat="server">
                    <div class="form-group">
                        <label>Sub-Proceso</label>
                        <div class="input-group">
                            <asp:DropDownList ID="dl_SubProceso" CssClass="form-control" runat="server"></asp:DropDownList>
                            <input id="Text3" type="text" class="form-control" visible="false" runat="server">
                            <span class="input-group-btn">
                                <button id="bt_SubProceso" type="button" class="btn btn-info btn-flat" runat="server">Buscar</button>
                            </span>
                        </div>
                    </div>
                </div>
               
            </div> 
          
           <div class="row">
              <div class="col-lg-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                    <asp:Label ID="lb_titgrd" runat="server" Text=""></asp:Label> </h3>
 
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap ">
                  <thead>
                    <tr class="col-lg-6" >
                      <th >Descripcion</th>
                      <th >Valor</th> 
                    </tr>
                  </thead>

                  <tbody>

                    <asp:Repeater ID="rpItems" runat="server">
                        <ItemTemplate>
                          <tr>
                            <td><%#Eval("v_ObjetoDescripcion") %></td>
                            <td>
                            <input id="wcam_<%#Eval("i_Objeto")%>" name="wcam_<%#Eval("i_Objeto")%>" type="<%#Eval("formato")%>" style="width:100%; text-align: right;" /> <%#Eval("c_Unidad").ToString.ToLower %> 
                            </td>
                          </tr> 
                        </ItemTemplate>
                    </asp:Repeater>
                     

                </table>
              </div>
              <!-- /.card-body -->

              <div class="card-footer">

                <button id="bt_graba" type="button" class="btn btn-success btn-flat col col-3" runat="server">Grabar</button>
                <button id="bt_salir" type="button" class="btn btn-warning btn-flat col col-3" runat="server">Salir</button>

              </div>

            </div>
            <!-- /.card -->
          </div>
           </div>
      </div>
          </div>
   
        <!-- /.card --> 
</form>

</asp:Content>
