<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/root/Main.Master" CodeBehind="f_FichaBasc.aspx.vb" Inherits="RH.f_FichaBasc" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="RH.cl_COMUN_AD" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ph_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph_Titulo" runat="server">
  
<H3 style="color: #FFFFFF; font-style: normal;"><label style="font-weight: normal; font-style: normal; color: #FFFFFF">FICHAS DE ESTUDIO DE SEGURIDAD</label></H3>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph_body_head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ph_body" runat="server">

<form runat="server">
      <div class="card card-warning ">
        <div class="card-header">
            <h3 class="card-title">Historial de Fichas</h3>
        </div> 
            <div class="card-body"> 



  <table style="width: 100%;"  class="table table-hover text-nowrap">
    <thead>
      <tr>
        <th>Estado</th>
        <th>Periodo</th>
        <th>Desde</th>
        <th>Hasta</th>
        <th>Cierre</th>
      </tr>
    </thead>
    <tbody>

      <asp:Repeater ID="rpItems" runat="server"> 
            <ItemTemplate>
                <tr>
                    <td>                     
                        <asp:Button ID="bt_edit" runat="server" type="button" Text='<%#Eval("C_DESEST")%>' OnClick="bt_EDITA" Enabled='<%#Eval("c_Editar")%>' CommandArgument='<%#Eval("v_CODPER") %>' />
                            
                    </td>

                    <td><%#Eval("V_DESPER") %></td>
                    <td><%#Eval("D_FECINI") %></td>
                    <td><%#Eval("D_FECFIN") %></td>
                    <td><%#Eval("D_FecCierre")  %></td>

                </tr>
            </ItemTemplate>
        </asp:Repeater>

    </tbody>
  </table>



 

 


            </div> 
    </div>
</form>   
    
</asp:Content>
