<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/root/Main.Master" CodeBehind="f_asi_dp.aspx.vb" Inherits="RH.f_des_dp" %>
 
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="RH.cl_COMUN_AD" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ph_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph_Titulo" runat="server">
    <asp:Label ID="lb_TITULO" runat="server" Text="DESCRIPCION DE PUESTO"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph_body_head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ph_body" runat="server">
    <form runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-4">

                        <!-- general form elements -->
                        <div class="card card-warning">
                            <div class="card-header">
                                <h3 class="card-title">Estructura Organizativa</h3>
                            </div>
                            <div class="card-body" style="overflow: auto; width: 100%; height: 800PX;">
                                <asp:UpdatePanel ID="up_UOrg" runat="server">
                                    <ContentTemplate>
                                        <asp:TreeView ID="tv_uo" runat="server" ImageSet="Msdn"></asp:TreeView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <!-- /.card -->

                    </div>

                    <div class="col-md-8"> 
                        <div class="card card-warning">
                            <div class="card-header">
                                <h3 class="card-title">Puestos</h3>
                            </div>
                            <div class="card-body" style="overflow: auto; width: 100%; height: 700px;">

                                <asp:UpdatePanel ID="up_PPos" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="gv_Posiciones" runat="server" AutoGenerateColumns="False" SelectedRowStyle-BackColor="#99CCFF" GridLines="Horizontal" BorderStyle="None" CellSpacing="5" Width="100%">

                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True" SelectImageUrl="img/baseline_play_arrow_black_18dp.png" SelectText=">>" ButtonType="Button" UpdateText="&gt;&gt;&gt;" />
                                                <asp:BoundField DataField="INDJEF" HeaderText="Jefe" ReadOnly="True" SortExpression="INDJEF"></asp:BoundField>
                                                <asp:BoundField DataField="POSCOD" HeaderText="Posicion" ReadOnly="True" SortExpression="POSCOD"></asp:BoundField>
                                                <asp:BoundField DataField="POSDES" HeaderText="Des.Posicion" ReadOnly="True" SortExpression="POSDES"></asp:BoundField>
                                                <asp:BoundField DataField="TRBDES" HeaderText="Des.Trabajador" ReadOnly="True" SortExpression="TRBDES"></asp:BoundField>
                                                <asp:BoundField DataField="DDPCOD" HeaderText="DP" ReadOnly="True" SortExpression="DDPCOD"></asp:BoundField>
                                                <asp:BoundField DataField="DDPDES" HeaderText="Des.Puesto" ReadOnly="True" SortExpression="DDPDES"></asp:BoundField>
                                            </Columns>

                                        </asp:GridView>

                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </div>

                            <div class="modal-footer"> 

                              <input type="button" class="btn btn-outline-dark" data-toggle="modal"  value="Visualizar DP" data-target="#modal-VistaDP" />
                              <input type="button" class="btn btn-outline-dark" data-toggle="modal"  value="Asignar DP" data-target="#modal-asignaDP" />
                                <asp:Button ID="bt_Frm_Com_Salir" CssClass="btn btn-outline-dark" runat="server" Text="   Salir  " />
                              </div>

                        </div>
                    </div>

                </div>
            </div>
        </section>

       

        <div class="modal fade" id="modal-asignaDP">
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
                                <h3 class="card-title col-sm-6">Descripcion de Puesto</h3>
                                <asp:DropDownList ID="dl_DPS" runat="server" class="form-control col-sm-6"></asp:DropDownList>
                            </div>
                        </div>


                    </div>
                    <div class="modal-footer justify-content-between">
                        <asp:Button ID="bt_Asi_Salir" CssClass="btn btn-outline-dark" runat="server" Text="Salir" />
                        <asp:Button ID="bt_Asi_Graba" CssClass="btn btn-outline-dark" runat="server" Text="Grabar" />
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
   



    </form>

</asp:Content>
