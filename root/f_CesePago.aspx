<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/root/Main.Master" CodeBehind="f_CesePago.aspx.vb" Inherits="RH.f_CesePago" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="RH.cl_COMUN_AD" %>



<%--
H=HISTORICO
P=PENDIENTE
A=AUTORIZADO
S=PAGADO
--%>



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
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Solicitudes Pendientes
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
                      <asp:BoundField DataField="Importe" HeaderText="Importe" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" />

                      <asp:TemplateField HeaderText="Selecciona">
                        <ItemTemplate>
                          <asp:Label ID="lbl_CodTrb" runat="server" Text='<%# Eval("PERNR") %>' Visible="false" />
                          <asp:Label ID="lbl_nomtrb" runat="server" Text='<%# Eval("ENAME") %>' Visible="false" />
                          <asp:Label ID="lbl_Acreed" runat="server" Text='<%# Eval("Acreedor") %>' Visible="false" />
                          <asp:Label ID="lbl_begda" runat="server" Text='<%# Eval("begda") %>' Visible="false" />
                          <asp:Label ID="lbl_Moneda" runat="server" Text='<%# Eval("Moneda") %>' Visible="false" />
                          <asp:Label ID="lbl_Import" runat="server" Text='<%# Eval("Importe") %>' Visible="false" />
                          <asp:CheckBox ID="ck_Select" runat="server" Checked='<%# Eval("SEL") %>' />
                        </ItemTemplate>
                      </asp:TemplateField>

                      <asp:TemplateField HeaderText="Forma de Pago">
                        <ItemTemplate> 
                          <asp:DropDownList ID="ddl_fmapag" runat="server" >
                            <asp:ListItem Value="T">Transferencia Bancaria</asp:ListItem>
                            <asp:ListItem Value="C">Cheque</asp:ListItem>
                            <asp:ListItem Value="E">Efectivo</asp:ListItem>
                            <asp:ListItem Value="G">Cheque de Gerencia</asp:ListItem>
                            <asp:ListItem Value="D">Deposito</asp:ListItem>
                            <asp:ListItem Value="L">Letra</asp:ListItem>
                            <asp:ListItem Value="M">Realizar Pago Manual</asp:ListItem> 
                          </asp:DropDownList>
                        </ItemTemplate>
                      </asp:TemplateField>

                      <asp:BoundField DataField="SAP_MSG" HeaderText="Msg" />

                    </Columns>

                  </asp:GridView>
                   
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
