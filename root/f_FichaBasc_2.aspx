<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/root/Main.Master" CodeBehind="f_FichaBasc_2.aspx.vb" Inherits="RH.f_FichaBasc_2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ph_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph_Titulo" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph_body_head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ph_body" runat="server">

    <form  class="form-horizontal" runat="server">
       


            <div class="card card-lightblue">
              <div class="card-header" style="text-align: center">
                <h3 class="card-title">EXPERIENCIA LABORAL</h3>
              </div> 
              <div class="card-body">
                  <div class="form-group row">

                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">1. Empresa</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_EMP_1" CssClass="form-control"  runat="server"></asp:TextBox></div>

                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Cargo</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_CAR_1" CssClass="form-control"  runat="server"></asp:TextBox></div>

                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Tiempo</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_TMP_1" CssClass="form-control"  textmode="Number" runat="server"></asp:TextBox></div>
                           
                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Jefe Inmediato</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_JEF_1" CssClass="form-control"  runat="server"></asp:TextBox></div>

                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Telefono</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_TLF_1" CssClass="form-control" textmode="Phone" runat="server"></asp:TextBox></div>

                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Motivo de Retiro</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_MTR_1" CssClass="form-control" runat="server"></asp:TextBox></div>

                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Fecha de Retiro</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_FRE_1" CssClass="form-control" textmode="Date" runat="server"></asp:TextBox></div>
                  </div>
                           
                  <div class="form-group row">
                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">2. Empresa</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_EMP_2" CssClass="form-control"  runat="server"></asp:TextBox></div>

                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Cargo</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_CAR_2" CssClass="form-control"   runat="server"></asp:TextBox></div>

                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Tiempo</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_TMP_2" CssClass="form-control" textmode="Number" runat="server"></asp:TextBox></div>
                           
                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Jefe Inmediato</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_JEF_2" CssClass="form-control"   runat="server"></asp:TextBox></div>

                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Telefono</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_TLF_2" CssClass="form-control" textmode="Phone" runat="server"></asp:TextBox></div>

                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Motivo de Retiro</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_MTR_2" CssClass="form-control"  runat="server"></asp:TextBox></div>

                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Fecha de Retiro</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_FRE_2" CssClass="form-control" textmode="Date" runat="server"></asp:TextBox></div>
                  
                    </div>
                 
                  <div class="form-group row">
                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">3. Empresa</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_EMP_3" CssClass="form-control"  runat="server"></asp:TextBox> </div>

                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Cargo</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_CAR_3" CssClass="form-control"  runat="server"></asp:TextBox></div>

                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Tiempo</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_TMP_3" CssClass="form-control" textmode="Number" runat="server"></asp:TextBox></div>
                           
                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Jefe Inmediato</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_JEF_3" CssClass="form-control"  runat="server"></asp:TextBox></div>

                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Telefono</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_TLF_3" CssClass="form-control" textmode="Phone" runat="server"></asp:TextBox></div>

                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Motivo de Retiro</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_MTR_3" CssClass="form-control" runat="server"></asp:TextBox></div>

                      <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Fecha de Retiro</label>
                        <div class="mb mb-3 col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_EXPLAB_FRE_3" CssClass="form-control" textmode="Date" runat="server"></asp:TextBox></div>
                  
                    </div>
                 
              </div>

        </div>

            <div class="card card-lightblue">
              <div class="card-header" style="text-align: center">
                <h3 class="card-title">VIVIENDA</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">

                <div class="input-group mb-3">

                    <div class="container-fluid">

                        <div class="row">

                            <table class="table table-borderless ">
                                <thead style="visibility: collapse;">
                                    <tr>
                                        <th style="width: 60px"></th>
                                        <th style="width: 200px"></th>
                                        <th style="width: 60px"></th>
                                        <th style="width: 200px"></th>
                                        <th style="width: 60px"></th>
                                        <th style="width: 200px"></th>
                                        <th style="width: 60px"></th>
                                        <th style="width: 200px"></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><asp:RadioButton ID="rad_tipvivPro" runat="server" GroupName="TipoVivienda"  /></td>
                                        <td>Propia</td>
                                        <td><asp:RadioButton ID="rad_tipvivAlq" runat="server" GroupName="TipoVivienda" /></td>
                                        <td>Arrendada</td>
                                        <td><asp:RadioButton ID="rad_tipvivFam" runat="server" GroupName="TipoVivienda" /></td>
                                        <td>Familia</td>
                                        <td><asp:RadioButton ID="rad_tipvivOtr" runat="server" GroupName="TipoVivienda" /></td>
                                        <td>Otros</td>
                                        <td></td>
                                    </tr>
                                   
  
                                </tbody>
                            </table>

                        </div>

                    </div>

                </div>

            </div>
        </div>
 


            <div class="card card-lightblue">
              <div class="card-header" style="text-align: center">
                <h3 class="card-title">VEHICULO</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">

                <div class="form-group row">

                    <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Marca</label>
                      <div class="        col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_VEH_MARCA" CssClass="form-control" runat="server"></asp:TextBox></div>

                    <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Modelo</label>
                      <div class="        col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_VEH_MODELO" CssClass="form-control" runat="server"></asp:TextBox></div>

                    <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Placa</label>
                      <div class="        col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_VEH_PLACA" CssClass="form-control" runat="server"></asp:TextBox></div>

                    <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">A&ntilde;o de Fab.</label>
                      <div class="        col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_VEH_FABRICACION"  CssClass="form-control" textmode="Number" runat="server"></asp:TextBox></div>

                    <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Valor Comercial</label>
                      <div class="        col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_VEH_VALOR" CssClass="form-control" textmode="Number" runat="server"></asp:TextBox></div>

                    <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 col-form-label">Nro. Licencia</label>
                      <div class="        col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4"><asp:TextBox ID="tx_VEH_LICENCIA" CssClass="form-control" runat="server"></asp:TextBox></div>

                </div>
            </div>
         </div>


            <div class="card card-lightblue">
              <div class="card-header" style="text-align: center">
                <h3 class="card-title">Indique si es parte de una sociedad unipersonal, mercantil/comercial o civil</h3>
              </div>
Se consideran unipersonales a la EIRL, como mercantiles a las sociedades que se dedican al comercio o la industria, mientras que son civiles aquellas que desarrollan otras actividades (Ejm: artesania, actividades profesionales, etc).
              <div class="card-body">

                <div class="form-group row">

                    <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-1 col-form-label">Nombre</label>
                      <div class="        col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-2"><asp:TextBox ID="tx_SOC_NOM_1" CssClass="form-control" runat="server"></asp:TextBox></div>

                    <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-1 col-form-label">Ruc</label>
                      <div class="        col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-2"><asp:TextBox ID="tx_SOC_RUC_1" CssClass="form-control" runat="server"></asp:TextBox></div>

                    <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-1 col-form-label">Direccion</label>
                      <div class="        col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-2"><asp:TextBox ID="tx_SOC_DIR_1" CssClass="form-control" runat="server"></asp:TextBox></div>

                    <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-1 col-form-label">Cargo</label>
                      <div class="        col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-2"><asp:TextBox ID="tx_SOC_CAR_1" CssClass="form-control" runat="server"></asp:TextBox></div>

                    <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-1 col-form-label">Telefono</label>
                      <div class="        col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-2"><asp:TextBox ID="tx_SOC_TLF_1" CssClass="form-control" runat="server"></asp:TextBox></div>

                </div>


                <div class="form-group row">

                    <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-1 col-form-label">Nombre</label>
                      <div class="        col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-2"><asp:TextBox ID="tx_SOC_NOM_2" CssClass="form-control" runat="server"></asp:TextBox></div>

                    <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-1 col-form-label">Ruc</label>
                      <div class="        col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-2"><asp:TextBox ID="tx_SOC_RUC_2" CssClass="form-control" runat="server"></asp:TextBox></div>

                    <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-1 col-form-label">Direccion</label>
                      <div class="        col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-2"><asp:TextBox ID="tx_SOC_DIR_2" CssClass="form-control" runat="server"></asp:TextBox></div>

                    <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-1 col-form-label">Cargo</label>
                      <div class="        col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-2"><asp:TextBox ID="tx_SOC_CAR_2" CssClass="form-control" runat="server"></asp:TextBox></div>

                    <label class="mb mb-3 col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-1 col-form-label">Telefono</label>
                      <div class="        col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-2"><asp:TextBox ID="tx_SOC_TLF_2" CssClass="form-control" runat="server"></asp:TextBox></div>

                </div>

            </div>

        </div>


            <div class="card card-lightblue">
              <div class="card-header" style="text-align: center">
                <h3 class="card-title">Indique con que fuentes de ingresos adicionales cuenta actualmente:</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="form-group row">

                    <label class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-5 col-form-label">Descripcion de la Actividad :</label>
                      <div class="        col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xl-7"><asp:TextBox ID="tx_FTEING_DesActividad" CssClass="form-control" runat="server"></asp:TextBox></div>

                    <label class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-5 col-form-label">Indicar si la actividad la realiza a titulo individual o a traves de una empresa:</label>
                      <div class="        col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xl-7"><asp:TextBox ID="tx_FTEING_Procedencia" CssClass="form-control" runat="server"></asp:TextBox></div>
 

                    <label class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-2 col-form-label">Indicar nombre de la empresa :</label>
                      <div class="        col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xl-4"><asp:TextBox ID="tx_FTEING_Empresa" CssClass="form-control" runat="server"></asp:TextBox></div>

                    <label class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-2 col-form-label">R.U.C.:</label>
                      <div class="        col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xl-4"><asp:TextBox ID="tx_FTEING_RUC" CssClass="form-control" runat="server"></asp:TextBox></div>

                    <label class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-2 col-form-label">Direccion:</label>
                      <div class="        col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xl-4"><asp:TextBox ID="tx_FTEING_Direccion" CssClass="form-control" runat="server"></asp:TextBox></div>

                    <label class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-2 col-form-label">Telefono:</label>
                      <div class="        col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xl-4"><asp:TextBox ID="tx_FTEING_Telefono" CssClass="form-control" runat="server"></asp:TextBox></div>

                    <label class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-2 col-form-label">Tiempo que viene realizando la actividad:</label>
                      <div class="        col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xl-4"><asp:TextBox ID="tx_FTEING_Tiempo" CssClass="form-control" runat="server"></asp:TextBox></div>

                    <label class="mb mb-3 col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-2 col-form-label">Ingreso anual aproximado que genera la actividad:</label>
                      <div class="        col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xl-4"><asp:TextBox ID="tx_FTEING_Ingresos" CssClass="form-control" runat="server"></asp:TextBox></div>

                 </div>

                <div class="input-group mb-3">
                    <div class="container-fluid">
                        <div class="row">
                            <table class="table table-borderless">
                                <thead style="visibility: collapse;">

                             </table>


                        </div>

                    </div>

                </div>


            </div>



           <div class="card-footer">

                <asp:Button ID="bt_prev" CssClass="btn btn-secondary" runat="server" Text="Anterior" />
                <asp:Button ID="bt_next" CssClass="btn btn-primary" runat="server" Text="Siguiente" />

            </div>

        </div>




    </form>

</asp:Content>
