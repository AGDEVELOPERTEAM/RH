<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/root/Main.Master" CodeBehind="vac_solicitud_c.aspx.vb" Inherits="RH.vac_solicitud_c" %>

<%@ Register Assembly="Infragistics45.Web.v16.1, Version=16.1.20161.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="ig" %>

<%@ Register Assembly="Infragistics45.Web.v16.1, Version=16.1.20161.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI" TagPrefix="ig" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ph_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph_Titulo" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph_body_head" runat="server">
</asp:Content>


<asp:Content ID="Mensaje" ContentPlaceHolderID="plh_Mensaje" runat="server">
    <asp:Label ID="lb_Mensaje" runat="server" Text=""></asp:Label>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ph_body" runat="server">
      <form id="form1" runat="server">
         
        <ig:WebScriptManager ID="wsm_scriptMan" runat="server"></ig:WebScriptManager>        
        <div class="page-wrapper">
            <div class="content container-fluid">
                <div class="row">
                    <div class="col-sm-8">
                        <h4 class="page-title">Historial de Solicitudes</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-lg-5">

                        <ig:WebDataGrid ID="wdg_solicitud_lista" runat="server" Height="400px" Width="100%" AutoGenerateColumns="False">
                            <Columns>
                                <ig:BoundDataField DataFieldName="id" Hidden="True" Key="id">
                                    <Header Text="id">
                                    </Header>
                                </ig:BoundDataField>
                                <ig:BoundDataField DataFieldName="docnr" Hidden="True" Key="docnr">
                                    <Header Text="docnr">
                                    </Header>
                                </ig:BoundDataField>
                                <ig:BoundDataField DataFieldName="pernr" Hidden="True" Key="pernr">
                                    <Header Text="pernr">
                                    </Header>
                                </ig:BoundDataField>
                                <ig:BoundDataField DataFieldName="begda" Key="begda" Width="100">
                                    <Header Text="F.Inicio">
                                    </Header>
                                </ig:BoundDataField>
                                <ig:BoundDataField DataFieldName="endda" Key="endda" Width="100">
                                    <Header Text="F.Termino">
                                    </Header>
                                </ig:BoundDataField>
                                <ig:BoundDataField DataFieldName="kaltg" Key="kaltg" Width="40">
                                    <Header Text="Dias">
                                    </Header>
                                </ig:BoundDataField> 

                                <ig:BoundDataField DataFieldName="estsoldes" Key="estsoldes" Width="100">
                                    <Header Text="Estado">
                                    </Header>
                                </ig:BoundDataField>

                            </Columns>
                            <Behaviors>
                                <ig:RowSelectors RowNumbering="True">
                                </ig:RowSelectors>
                                <ig:Selection CellClickAction="Row" CellSelectType="None" RowSelectType="Single">
                                </ig:Selection>
                            </Behaviors>
                        </ig:WebDataGrid>
                    </div>
                </div>
            </div>

            <div class="row" style="text-align: center">
                <div class="col-xs-4 col-lg-1">
                    <a href="vac_solicitud_d.aspx" class="btn btn-success btn-block">Nuevo</a>
                </div>
<%--                <div class="col-sm-2">
                    <a href="vac_solicitud_d.aspx" id="bt_edit" class="btn btn-success btn-block" runat="server">Editar</a>
                 </div>--%>
                <div class="col-xs-4 col-lg-1">
                    <a href="vac_solicitud_d.aspx" id="bt_del" class="btn btn-success btn-block" runat="server">Eliminar</a>
                </div>
                <div class="col-xs-4 col-lg-1">
                    <a href="index.aspx" class="btn btn-success btn-block">Cerrar</a>
                </div>
            </div>             
        </div>
          
        <script type="text/javascript" src="assets/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="assets/js/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/select2.min.js"></script>
        <script type="text/javascript" src="assets/js/moment.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap-datetimepicker.min.js"></script>
        <script type="text/javascript" src="../Scripts/bootbox/bootbox.all.js"></script>

    </form>

</asp:Content>

