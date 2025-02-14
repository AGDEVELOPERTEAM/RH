<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/root/Main.Master" CodeBehind="f_CesePagoRep.aspx.vb" Inherits="RH.f_CesePagoRep" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="RH.cl_COMUN_AD" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ph_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph_Titulo" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph_body_head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ph_body" runat="server">
  <form id="frm_main" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>

    <div class="card card-primary card-outline col-lg-12">

      <div class="card-body">

        <div id="accordion">
          <!-- we are adding the .class so bootstrap.js collapse plugin detects it -->
          <div class="card card-primary">
            <div class="card-header">
              <h4 class="card-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Solicitudes Autorizadas
                </a>
              </h4>
              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-toggle="modal" data-target="#modal-lg"></button>
                <button type="button" id="bt_execute" class="btn btn-tool" runat="server">EJECUTAR <i class="fas fa-play "></i></button>
              </div>


            </div>
            <div id="collapseOne" class="panel-collapse was-collapsed">
              <div class="card-body">
                 
                <div class="col-lg-12">
                   
                  <asp:GridView ID="gv_Liquidaciones" runat="server" AutoGenerateColumns="false" CssClass="table  table-sm">

                    <Columns>
                      <asp:BoundField DataField="PERNR" HeaderText="Cod.Trabajador" />
                      <asp:BoundField DataField="Sede_DES" HeaderText="Sede" />
                      <asp:BoundField DataField="Des.Planilla" HeaderText="Planilla" />
                      <asp:BoundField DataField="FechaCeseD" HeaderText="Fecha Cese" />
                      <asp:BoundField DataField="ENAME" HeaderText="Trabajador" />
                      <asp:BoundField DataField="Moneda" HeaderText="Moneda" />
                      <asp:BoundField DataField="Importe" HeaderText="Importe" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N2}" />
                      <asp:BoundField DataField="EstadoDes" HeaderText="Estado" />
                      <asp:BoundField DataField="numdoc_sap" HeaderText="Nro. Solicitud SAP" />
                      <asp:BoundField DataField="FormaPagoDes" HeaderText="Forma de Pago" />
                      
<%--                      <asp:TemplateField HeaderText="Selecciona">
                        <ItemTemplate>
                          <asp:Label ID="lbl_CodTrb" runat="server" Text='<%# Eval("PERNR") %>' Visible="false" />
                          <asp:Label ID="lbl_nomtrb" runat="server" Text='<%# Eval("ENAME") %>' Visible="false" />
                          <asp:Label ID="lbl_Acreed" runat="server" Text='<%# Eval("Acreedor") %>' Visible="false" />
                          <asp:Label ID="lbl_begda" runat="server" Text='<%# Eval("begda") %>' Visible="false" />
                          <asp:Label ID="lbl_Moneda" runat="server" Text='<%# Eval("Moneda") %>' Visible="false" />
                          <asp:Label ID="lbl_Import" runat="server" Text='<%# Eval("Importe") %>' Visible="false" /> 
                        </ItemTemplate>
                      </asp:TemplateField>--%>

                    </Columns>

                  </asp:GridView>




                  <!-- /.card-header -->
                  <%--                    <table  class="table  table-sm" >
                        <thead>
                            <tr>
                                <th>Cod.Trabajador</th>
                                <th>Fecha Cese</th>
                                <th>Trabajador</th>
                                <th>Area</th>
                                <th>Importe</th>
                                <th>Estado</th>
                                <th>Autorizar</th>

                            </tr>
                        </thead>

                        <tbody>
                              <%
                                  If dDataD.Rows.Count > 0 Then
                                    For nItm = 0 To dDataD.Rows.Count - 1
                              %>
                              <tr>
                              <td><%=dDataD.Rows(nItm).Item("PERNR")%></td>
                              <td><%=dDataD.Rows(nItm).Item("BEGDA")%></td>
                              <td><%=dDataD.Rows(nItm).Item("ENAME")%></td>
                              <td><%=dDataD.Rows(nItm).Item("Des.UnidadOrganizativa")%></td>
                              <td><%="10,000.00"%></td>
                              <td><%=dDataD.Rows(nItm).Item("EstadoDes")%></td>
                                <td> 
                                  <input id="cbx_<%=dDataD.Rows(nItm).Item("PERNR")%>" type="checkbox" />
                                </tr>
                            <%
                                  Next
                                End If

                                  %>
                        </tbody>

                      </table>
                  --%>
                </div>



              </div>
            </div>
          </div>

        </div>

      </div>

    </div>
    <!-- /.card -->
  </form>

</asp:Content>
