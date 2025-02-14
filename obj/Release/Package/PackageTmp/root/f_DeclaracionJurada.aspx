<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/root/Main.Master" CodeBehind="f_DeclaracionJurada.aspx.vb" Inherits="RH.f_DeclaracionJurada" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ph_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ph_Titulo" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ph_body_head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ph_body" runat="server">

  <form runat="server">
    <table  class="col COL-xs-12 col-12">
      <tr>
        <td class="col">
          <div class="card card-success">
            <div class="card-header" style="text-align: center">
              <h3 class="card-title">DECLARACION JURADA DE ANTECEDENTES PERSONALES</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">


              <div class="input-group mb-3">
                <div class="container-fluid">

                  <table>
                    <tr>
                      <td style="text-align: left">Yo,
                        <asp:TextBox ID="tx_NOMAPE" runat="server" MaxLength="50" Width="400"></asp:TextBox>
                        ,    identificado/a  con  DNI  Nro :    
                        <asp:TextBox ID="TX_NUMDNI" runat="server" MaxLength="10" Width="200"></asp:TextBox>
                        ,con domicilio en
                        <asp:TextBox ID="tx_DIRECC" runat="server" MaxLength="100" Width="400" ></asp:TextBox>
                        , en mi calidad de trabajador de Austral Group S.A.A. DECLARO BAJO JURAMENTO lo siguiente  (por favor indicar SI o NO  en el recuadro que corresponde) :
                      </td>
                    </tr>
                  </table>

                </div>
              </div>

              <div style="text-align: center">
                <table style="border: thin solid #000000; text-align: center;">
                  <thead>
                    <tr style="background-color: aquamarine">
                      <th class="col col-lg-4"></th>
                      <th class="col col-lg-1">SI</th>
                      <th class="col col-lg-1">NO</th>
                    </tr>
                  </thead>
                  <tbody style="border: thin dotted #000000; table-layout: fixed">

                    <tr style="border: thin solid #000000">
                      <td style="text-align: left">Tener antecedentes penales</td>

                      <td>
                        <asp:RadioButton ID="ant_penal_si" GroupName="ant_penal" CssClass="icheck-primary d-inline" AutoPostBack="true" runat="server" Text="SI" TextAlign="Right" Checked="true" /></td>

                      <td>
                        <asp:RadioButton ID="ant_penal_no" GroupName="ant_penal" CssClass="icheck-primary d-inline" AutoPostBack="true" runat="server" Text="NO" TextAlign="Right" /></td>

                    </tr>

                    <tr style="border: thin solid #000000">
                      <td style="text-align: left">Tener antecedentes judiciales</td>

                      <td>
                        <asp:RadioButton ID="ant_judic_si" GroupName="ant_judic" CssClass="icheck-primary d-inline" AutoPostBack="true" runat="server" Text="SI" TextAlign="Right" Checked="true" /></td>
                      <td>
                        <asp:RadioButton ID="ant_judic_no" GroupName="ant_judic" CssClass="icheck-primary d-inline" AutoPostBack="true" runat="server" Text="NO" TextAlign="Right" /></td>

                    </tr>
                    <tr style="border: thin solid #000000">
                      <td style="text-align: left">Tener antecedentes policiales</td>

                      <td>
                        <asp:RadioButton ID="ant_polic_si" GroupName="ant_polic" CssClass="icheck-primary d-inline" AutoPostBack="true" runat="server" Text="SI" TextAlign="Right" Checked="true" /></td>
                      <td>
                        <asp:RadioButton ID="ant_polic_no" GroupName="ant_polic" CssClass="icheck-primary d-inline" AutoPostBack="true" runat="server" Text="NO" TextAlign="Right" /></td>

                    </tr>

                    <tr style="border: thin solid #000000">
                      <td style="text-align: left">Retenci&oacute;n judicial por demanda de alimentos</td>

                      <td>
                        <asp:RadioButton ID="ant_aliment_si" GroupName="ant_aliment" CssClass="icheck-primary d-inline" AutoPostBack="true" runat="server" Text="SI" TextAlign="Right" Checked="true" /></td>
                      <td>
                        <asp:RadioButton ID="ant_aliment_no" GroupName="ant_aliment" CssClass="icheck-primary d-inline" AutoPostBack="true" runat="server" Text="NO" TextAlign="Right" /></td>

                    </tr>

                    <tr style="border: thin solid #000000">
                      <td style="text-align: left">Formar parte de una investigaci&oacute;n a nivel policial y/o fiscal y/o estar incurso en un proceso judicial por delito penal</td>

                      <td>
                        <asp:RadioButton ID="ant_invest_si" GroupName="ant_invest" CssClass="icheck-primary d-inline" AutoPostBack="true" runat="server" Text="SI" TextAlign="Right" Checked="true" /></td>
                      <td>
                        <asp:RadioButton ID="ant_invest_no" GroupName="ant_invest" CssClass="icheck-primary d-inline" AutoPostBack="true" runat="server" Text="NO" TextAlign="Right" /></td>

                    </tr>

                  </tbody>
                </table>
              </div>


              <div class="input-group mb-1">
                <div class="container-fluid">
                  <textarea id="Textarea1" rows="3" style="border-style: none; width: 100%; height: 100px" runat="server" readonly="readonly">
                              De ser afirmativa su respuesta en alguna o varias de las alternativas propuestas, s&iacute;rvase precisar la materia y la fecha del antecedente; sin perjuicio de ello, autorizo a Austral para que pueda recabar la informaci&oacute;n con la respectiva Instituci&oacute;n (ver anexo Nro. 1 y firmar solo si tiene antecedentes).
                            </textarea>
                </div>
              </div>

              <div class="input-group mb-1">
                <div class="container-fluid">
                  <textarea id="tx_COMMENT" cols="20" rows="3" style="width: 100%" runat="server" maxlength="300">
                            </textarea>
                </div>
              </div>

              <div class="input-group mb-3">
                <div class="container-fluid">
                  <textarea id="Textarea3" cols="20" rows="9" style="border-style: none; width: 100%; height: 320px" runat="server" readonly="readonly">

                            Asimismo, de existir una nueva contingencia despu&eacute;s de suscrita la presente declaraci&oacute;n que pueda situarme en alguno de los supuestos establecidos, me comprometo a informarlo inmediatamente.

                            Tengo pleno conocimiento que los datos suministrados ser&aacute;n tratados y custodiados por Austral Group S.A.A. seg&uacute;n lo establecido en la Ley de Protecci&oacute;n de Datos Personales y sus normas complementarias; en ese sentido, autorizo que estos sean utilizados para los fines que considere conveniente y siempre que est&eacute;n relacionados a la relaci&oacute;n laboral que mantenemos.

                            Ratifico la veracidad de lo declarado, someti&eacute;ndome a las correspondientes acciones legales en caso mi declaraci&oacute;n sea falsa, especialmente, a las disposiciones del r&eacute;gimen laboral en caso sea contratado por la compa&ntilde&iacute;a.
                            </textarea>
                </div>
              </div>
            </div>

            <div class="card-footer">

              <asp:Button ID="bt_back" CssClass="btn btn-secondary" runat="server" Text="Anterior" />
              <asp:Button ID="bt_Aceptar" CssClass="btn btn-primary" runat="server" Text="ACEPTAR" />

            </div>

          </div>

        </td>


      </tr>

    </table>
     
  </form>


</asp:Content>
