<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/root/Main.Master" CodeBehind="vac_solicitud_d.aspx.vb" Inherits="RH.vac_solicitud_d" %>

<%@ Register Assembly="Infragistics45.Web.v16.1, Version=16.1.20161.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.LayoutControls" TagPrefix="ig" %>

<%@ Register Assembly="Infragistics45.Web.v16.1, Version=16.1.20161.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI" TagPrefix="ig" %>

<%@ Register Assembly="Infragistics45.WebUI.WebSchedule.v16.1, Version=16.1.20161.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.WebSchedule" TagPrefix="igsch" %>
<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ph_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph_Titulo" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="plh_Mensaje" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ph_body_head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ph_body" runat="server">

      <form id="frm_solicitud" runat="server">
    <%  Dim LN_vacaciones As New RH.Vacaciones_LN
        Dim dt_vacaciones As DataTable
        Dim dt_workflow As DataTable
        dt_vacaciones = LN_vacaciones.GetListaVacacionesPendientesTrabajador(Session("usuario_en"), "U")
        dt_workflow = LN_vacaciones.GetListaVacacionesworkflow(Session("usuario_en"))
    %>
        <hr />
        <div class="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <%-- Solicitud de Vacaciones--%>
                    <div class="col-md-6">
                        <div class="col-sm-12">
                            <h4 class="page-title">SOLICITUD DE VACACIONES</h4>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <label>Desde <span class="text-danger">*</span></label>
                            </div>
                            <p />
                            <div class="col-md-3">
								<div class="cal-icon"><input id="dtp_desde" class="form-control floating datetimepicker" type="text" runat="server"></div>
                            </div>
                            <div class="col-md-3">
                                <label>Hasta <span class="text-danger">*</span></label>
                            </div>
                            <p />
                            <div class="col-md-3">
								<div class="cal-icon"><input id="dtp_hasta" class="form-control floating datetimepicker" type="text" runat="server"></div>
                            </div>
                            <div class="col-md-6">
                            </div>
                        </div> 
                        <p /> 
                        <div class="row">

                        </div> 
                        <p /> 
                        <div class="row">
                            <div class="col-md-3">
                                <label>Observacion<span class="text-danger">*</span></label>
                            </div>
                            <div class="col-md-9">
                                <input type="text" id="txt_observ" class="form-control floating" runat="server" />
                            </div>
                        </div>

                        <div class="row">
                        <label></label>
                        <label></label>
                        </div>
                          
                        <p/> 
                        <hr />

                        <div class="row">
                                                    
                            <div class="col-xs-6 col-md-3" style="text-align: center; vertical-align: middle">
                                <asp:Button ID="bt_grabar" cssclass="btn btn-success btn-block" runat="server" Text="Grabar" />
                            </div>
                            <div class="col-xs-6 col-md-3">
                                <a href="vac_solicitud_c.aspx" class="btn btn-success btn-block"> Cancelar</a>  
                            </div>                               

			            </div>

                        <hr />
                         
                    </div> 
                    <div class="col-md-6">
                        <%--' Vacaciones Pendientes--%>
                        <div class="col-sm-12">
                            <h4 class="page-title">VACACIONES PENDIENTES</h4>
                        </div> 
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table table-striped custom-table m-b-0">
  <thead>
    <tr>
      <th colspan=5></th>
      <th colspan=2 style="text-align: center">Continuo</th>
      <th colspan=2 style="text-align: center">Fraccionado</th>
    </tr>
	<tr>
      <th>Periodo</th>
      <th>Ganado</th>
      <th>Gozado</th>
      <th>Solicitado</th>
      <th>Saldo</th>
      <th>Laborable</th>
      <th>No Laborable</th>
      <th>Laborable</th>
      <th>No Laborable</th>
    </tr>
  </thead>
                                        <tbody>
                                        <%
                                            Dim usatot As Integer
                                            Dim soltot As Integer
                                            Dim sdotot As Integer
                                            For nItem = 0 To dt_vacaciones.Rows.Count - 1
                                                usatot = dt_vacaciones.Rows(nItem).Item("usa_tot")

                                                soltot = dt_vacaciones.Rows(nItem).Item("sol_con_lab") +
                                                                                                                         dt_vacaciones.Rows(nItem).Item("sol_con_nla") +
                                                                                                                         dt_vacaciones.Rows(nItem).Item("sol_fra_lab") +
                                                                                                                         dt_vacaciones.Rows(nItem).Item("sol_fra_nla")
                                                sdotot = dt_vacaciones.Rows(nItem).Item("sdb_tot")

                                                %>
                                            <tr>
                                                <td style="text-align: center"><%=CInt(dt_vacaciones.Rows(nItem).Item("numper")).ToString %></td>
                                                <td style="text-align: center"><%=CInt(dt_vacaciones.Rows(nItem).Item("gan_tot")).ToString %></td>
                                                <td style="text-align: center"><%=usatot %></td>
                                                <td style="text-align: center"><%=soltot %></td>
                                                <td style="text-align: center"><%=sdotot %></td>
                                                <td style="text-align: center"><%=CInt(dt_vacaciones.Rows(nItem).Item("sdb_con_lab")) %></td>
                                                <td style="text-align: center"><%=CInt(dt_vacaciones.Rows(nItem).Item("sdb_con_nla"))%></td>
                                                <td style="text-align: center"><%=CInt(dt_vacaciones.Rows(nItem).Item("sdb_fra_lab"))%></td>
                                                <td style="text-align: center"><%=CInt(dt_vacaciones.Rows(nItem).Item("sdb_fra_nla"))%></td>
                                            </tr>
                                        <%Next%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <p />
                        <HR/>
                        <%--' Flujo de Aprobacion--%>
                        <div class="col-sm-12">
                            <h4 class="page-title">FLUJO DE APROBACION</h4>
                        </div>  
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table table-striped custom-table m-b-0">
                                        <thead>
                                            <tr>
                                                <th>Aprobador</th>
                                                <th>Puesto</th>  
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                For nItem = 0 To dt_workflow.Rows.Count - 1
                                            %>
                                                   <tr>
                                                       <td><%=dt_workflow.Rows(nItem).Item("nomapp").ToString%></td>
                                                       <td><%=dt_workflow.Rows(nItem).Item("despto").ToString%></td>
                                                   </tr>
                                            <%
                                                Next
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <igsch:WebScheduleInfo ID="sch_info_d" runat="server"></igsch:WebScheduleInfo>
        <igsch:WebScheduleInfo ID="sch_info_h" runat="server"></igsch:WebScheduleInfo>


 

        <ig:WebScriptManager ID="WebScriptManager1" runat="server"></ig:WebScriptManager>
         
         
        <script type="text/javascript" src="assets/js/app.js"></script>
        
        <ig:WebDialogWindow ID="wdl_winMsg" runat="server" Height="300px" Width="400px" InitialLocation="Centered" Visible="False" Modal="True">

            <Header BackColor="Black" ForeColor="White"></Header>

            <ContentPane ForeColor="#009933" Font-Bold="True">
                <Template>
                    <div style="text-align: center; position: relative; padding: 10px;">
                        <asp:Label ID="lb_mensaje" runat="server" Text="" Height="100%" Width="100%"></asp:Label>
                    </div>
                    <div style="text-align: center; position: relative; padding: 10px;">
                        <asp:Button ID="bt_AceptarMensaje" runat="server" Text="Aceptar" />
                    </div>
                </Template>
            </ContentPane>
             
        </ig:WebDialogWindow>


    </form>
</asp:Content>
