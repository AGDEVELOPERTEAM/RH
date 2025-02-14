<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/root/Main.Master" CodeBehind="f_FichaBasc_4.aspx.vb" Inherits="RH.f_FichaBasc_4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ph_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph_Titulo" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph_body_head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ph_body" runat="server">

  <form runat="server">
     
    <div class="card card-danger">
      <div class="card-header" style="text-align: center">
        <h3 class="card-title">SECCION B</h3>
      </div>
      <div class="card-body">

        <div class="input-group mb-3">
          <div class="container-fluid">
            <div class="row">
              Toda la informacion registrada en esta seccion es considerada como declaracion jurada, la misma que estara sujeta a verificacion cuando la empresa lo considere pertinente, lo cual sera llevado a cabo por un funcionario de la empresa u otra persona a quien esta delegue.
            </div>
          </div>
        </div>
      </div>
    </div>
     
    <div class="card card-lightblue">
      <div class="card-header" style="text-align: center">
        <h3 class="card-title">Cuentas Bancarias que Posee : </h3>
      </div>
      <div class="card-body">

        <div class="form-group row">

          <label class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 col-form-label">Entidad Financiera</label>
          <label class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 col-form-label">Tipo de Cuenta</label>
          <label class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 col-form-label">Nro. DE Cuenta</label>

          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:DropDownList ID="dd_BANCO_01" runat="server" CssClass="form-control"></asp:DropDownList></div>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:DropDownList ID="dd_TIPCT_01" runat="server" CssClass="form-control"></asp:DropDownList></div>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:TextBox ID="tx_NRCTA_01" CssClass="form-control" runat="server"></asp:TextBox></div>

          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:DropDownList ID="dd_BANCO_02" runat="server" CssClass="form-control"></asp:DropDownList></div>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:DropDownList ID="dd_TIPCT_02" runat="server" CssClass="form-control"></asp:DropDownList></div>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:TextBox ID="tx_NRCTA_02" CssClass="form-control" runat="server"></asp:TextBox></div>

          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:DropDownList ID="dd_BANCO_03" runat="server" CssClass="form-control"></asp:DropDownList></div>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:DropDownList ID="dd_TIPCT_03" runat="server" CssClass="form-control"></asp:DropDownList></div>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:TextBox ID="tx_NRCTA_03" CssClass="form-control" runat="server"></asp:TextBox></div>

          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:DropDownList ID="dd_BANCO_04" runat="server" CssClass="form-control"></asp:DropDownList></div>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:DropDownList ID="dd_TIPCT_04" runat="server" CssClass="form-control"></asp:DropDownList></div>
          <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <asp:TextBox ID="tx_NRCTA_04" CssClass="form-control" runat="server"></asp:TextBox></div>

        </div>

      </div>
    </div>

    <div class="card card-lightblue">
      <div class="card-header" style="text-align: center">
        <h3 class="card-title">Tarjetas de Credito : </h3>
      </div>
      <div class="card-body">
         
        <div class="form-group row">

          <label class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-6 col-xl-6 col-form-label">Entidad Financiera</label>
          <label class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-6 col-xl-6 col-form-label">Nro. De Tarjeta</label>

          <div class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-6 col-xl-6">
            <asp:DropDownList ID="dd_TCR_BANCO_01" runat="server" CssClass="form-control"></asp:DropDownList></div>
          <div class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-6 col-xl-6">
            <asp:TextBox ID="tx_TCR_NROTJ_01" CssClass="form-control" runat="server"></asp:TextBox></div>
          <div class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-6 col-xl-6">
            <asp:DropDownList ID="dd_TCR_BANCO_02" runat="server" CssClass="form-control"></asp:DropDownList></div>
          <div class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-6 col-xl-6">
            <asp:TextBox ID="tx_TCR_NROTJ_02" CssClass="form-control" runat="server"></asp:TextBox></div>
          <div class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-6 col-xl-6">
            <asp:DropDownList ID="dd_TCR_BANCO_03" runat="server" CssClass="form-control"></asp:DropDownList></div>
          <div class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-6 col-xl-6">
            <asp:TextBox ID="tx_TCR_NROTJ_03" CssClass="form-control" runat="server"></asp:TextBox></div>
          <div class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-6 col-xl-6">
            <asp:DropDownList ID="dd_TCR_BANCO_04" runat="server" CssClass="form-control"></asp:DropDownList></div>
          <div class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-6 col-xl-6">
            <asp:TextBox ID="tx_TCR_NROTJ_04" CssClass="form-control" runat="server"></asp:TextBox></div>
          <div class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-6 col-xl-6">
            <asp:DropDownList ID="dd_TCR_BANCO_05" runat="server" CssClass="form-control"></asp:DropDownList></div>
          <div class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-6 col-xl-6">
            <asp:TextBox ID="tx_TCR_NROTJ_05" CssClass="form-control" runat="server"></asp:TextBox></div>


        </div>
         
      </div>
    </div>
 
    <div class="card card-lightblue">
      <div class="card-header" style="text-align: center">
        <h3 class="card-title">Bienes Muebles e Inmuebles :</h3>
      </div>
      <div class="card-body">
         
        <div class="input-group mb-3">

          <div class="container-fluid">

            <div class="row">
              <textarea id="tx_BieMueInm" cols="20" rows="10" style="width: 100%" runat="server"></textarea>
            </div>

          </div>

        </div>


      </div>
      <div class="card-footer">

        <asp:Button ID="bt_back" CssClass="btn btn-secondary" runat="server" Text="Anterior" />
        <asp:Button ID="bt_next" CssClass="btn btn-primary" runat="server" Text="Siguiente" />

      </div>
    </div>

     
  </form>

</asp:Content>
