Imports System.Security.Cryptography

Public Class f_FichaBasc_4
  Inherits System.Web.UI.Page
  Dim oComun As New cl_COMUN_AD
  Dim cRutaImagenes As String = "~/Files/SEG/"
  Dim sid As String = ""
  Dim oUSUARIO_EN As New cl_USUARIO_EN
  Dim oUSUARIO_LN As New cl_USUARIO_LN

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    sid = Request.QueryString("id")
    If sid <> "" Then
      oUSUARIO_EN.KeyAcceso = sid
      oUSUARIO_EN = oUSUARIO_LN.LN_USUARIO_CARGA(oUSUARIO_EN)
      cDocumento = oUSUARIO_EN.Documento
      cPeriodo = oUSUARIO_EN.Periodo
    Else
      Response.Redirect("/login.aspx")
    End If

    'Dim SGalleta As HttpCookie = Request.Cookies("RH")
    'cDocumento = SGalleta.Values("nd")
    'cPeriodo = SGalleta.Values("pe")


    If Not IsPostBack() Then


      Dim dt_FICHA_4 As DataTable
      Dim cSql As String = ""
      cSql = "SELECT * FROM basc.Ficha WHERE c_NumDNI='" + cDocumento + "' AND v_codper='" + cPeriodo + "'"

      dt_FICHA_4 = oComun.EjecutaCadenaSQL(cSql)
      If dt_FICHA_4.Rows.Count > 0 Then

        oComun.CargaCombo("[sap].[BANCOS]", "BANKL", "BANKA", "", dd_BANCO_01, dt_FICHA_4.Rows(0).Item("c_Fin_Banco01"))
        oComun.CargaCombo("[sap].[BANCOS]", "BANKL", "BANKA", "", dd_BANCO_02, dt_FICHA_4.Rows(0).Item("c_Fin_Banco02"))
        oComun.CargaCombo("[sap].[BANCOS]", "BANKL", "BANKA", "", dd_BANCO_03, dt_FICHA_4.Rows(0).Item("c_Fin_Banco03"))
        oComun.CargaCombo("[sap].[BANCOS]", "BANKL", "BANKA", "", dd_BANCO_04, dt_FICHA_4.Rows(0).Item("c_Fin_Banco04"))

        oComun.CargaCombo("[root].[V_TIPOCUENTABANCO]", "cTipCtaCod", "cTipCtaDes", "", dd_TIPCT_01, dt_FICHA_4.Rows(0).Item("c_Fin_TipCta01"))
        oComun.CargaCombo("[root].[V_TIPOCUENTABANCO]", "cTipCtaCod", "cTipCtaDes", "", dd_TIPCT_02, dt_FICHA_4.Rows(0).Item("c_Fin_TipCta02"))
        oComun.CargaCombo("[root].[V_TIPOCUENTABANCO]", "cTipCtaCod", "cTipCtaDes", "", dd_TIPCT_03, dt_FICHA_4.Rows(0).Item("c_Fin_TipCta03"))
        oComun.CargaCombo("[root].[V_TIPOCUENTABANCO]", "cTipCtaCod", "cTipCtaDes", "", dd_TIPCT_04, dt_FICHA_4.Rows(0).Item("c_Fin_TipCta04"))

        tx_NRCTA_01.Text = dt_FICHA_4.Rows(0).Item("c_Fin_NroCta01")
        tx_NRCTA_02.Text = dt_FICHA_4.Rows(0).Item("c_Fin_NroCta02")
        tx_NRCTA_03.Text = dt_FICHA_4.Rows(0).Item("c_Fin_NroCta03")
        tx_NRCTA_04.Text = dt_FICHA_4.Rows(0).Item("c_Fin_NroCta04")


        oComun.CargaCombo("[sap].[BANCOS]", "BANKL", "BANKA", "", dd_TCR_BANCO_01, dt_FICHA_4.Rows(0).Item("v_Tcr_Banco01"))
        oComun.CargaCombo("[sap].[BANCOS]", "BANKL", "BANKA", "", dd_TCR_BANCO_02, dt_FICHA_4.Rows(0).Item("v_Tcr_Banco02"))
        oComun.CargaCombo("[sap].[BANCOS]", "BANKL", "BANKA", "", dd_TCR_BANCO_03, dt_FICHA_4.Rows(0).Item("v_Tcr_Banco03"))
        oComun.CargaCombo("[sap].[BANCOS]", "BANKL", "BANKA", "", dd_TCR_BANCO_04, dt_FICHA_4.Rows(0).Item("v_Tcr_Banco04"))
        oComun.CargaCombo("[sap].[BANCOS]", "BANKL", "BANKA", "", dd_TCR_BANCO_05, dt_FICHA_4.Rows(0).Item("v_Tcr_Banco05"))

        tx_TCR_NROTJ_01.Text = dt_FICHA_4.Rows(0).Item("v_tcr_numtar01")
        tx_TCR_NROTJ_02.Text = dt_FICHA_4.Rows(0).Item("v_tcr_numtar02")
        tx_TCR_NROTJ_03.Text = dt_FICHA_4.Rows(0).Item("v_tcr_numtar03")
        tx_TCR_NROTJ_04.Text = dt_FICHA_4.Rows(0).Item("v_tcr_numtar04")
        tx_TCR_NROTJ_05.Text = dt_FICHA_4.Rows(0).Item("v_tcr_numtar05")

        tx_BieMueInm.Value = dt_FICHA_4.Rows(0).Item("v_Bienes")


      End If

    End If

  End Sub

  Private Sub bt_next_Click(sender As Object, e As EventArgs) Handles bt_next.Click
    Dim wRet As Integer
    wRet = Graba_4()
    If wRet = 0 Then
      Response.Redirect("f_FichaBasc_5.aspx?id=" & Request.QueryString("id"))
    End If
  End Sub

  Private Sub bt_back_Click(sender As Object, e As EventArgs) Handles bt_back.Click
    Dim wRet As Integer
    wRet = Graba_4()
    If wRet = 0 Then
      Response.Redirect("f_FichaBasc_3.aspx?id=" & Request.QueryString("id"))
    End If

  End Sub


  Private Function Graba_4() As Integer
    Dim SGalleta As HttpCookie = Request.Cookies("RH")
    cDocumento = SGalleta.Values("nd")
    cPeriodo = SGalleta.Values("pe")

    Dim vRet As Integer = 0
    Try

      oComun.AgregaParametro("@c_NumDNI", "V", 10, cDocumento)
      oComun.AgregaParametro("@v_CodPer", "C", 8, cPeriodo)
      oComun.AgregaParametro("@c_Fin_Banco01", "V", 10, dd_BANCO_01.SelectedValue)
      oComun.AgregaParametro("@c_Fin_TipCta01", "C", 2, dd_TIPCT_01.SelectedValue)
      oComun.AgregaParametro("@c_Fin_NroCta01", "V", 50, tx_NRCTA_01.Text)

      oComun.AgregaParametro("@c_Fin_Banco02", "V", 10, dd_BANCO_02.SelectedValue)
      oComun.AgregaParametro("@c_Fin_TipCta02", "C", 2, dd_TIPCT_02.SelectedValue)
      oComun.AgregaParametro("@c_Fin_NroCta02", "V", 50, tx_NRCTA_02.Text)

      oComun.AgregaParametro("@c_Fin_Banco03", "V", 10, dd_BANCO_03.SelectedValue)
      oComun.AgregaParametro("@c_Fin_TipCta03", "C", 2, dd_TIPCT_03.SelectedValue)
      oComun.AgregaParametro("@c_Fin_NroCta03", "V", 50, tx_NRCTA_03.Text)

      oComun.AgregaParametro("@c_Fin_Banco04", "V", 10, dd_BANCO_04.SelectedValue)
      oComun.AgregaParametro("@c_Fin_TipCta04", "C", 2, dd_TIPCT_04.SelectedValue)
      oComun.AgregaParametro("@c_Fin_NroCta04", "V", 50, tx_NRCTA_04.Text)

      oComun.AgregaParametro("@v_Tcr_Banco01", "V", 10, dd_TCR_BANCO_01.SelectedValue)
      oComun.AgregaParametro("@v_Tcr_NumTar01", "V", 20, tx_TCR_NROTJ_01.Text)

      oComun.AgregaParametro("@v_Tcr_Banco02", "V", 10, dd_TCR_BANCO_02.SelectedValue)
      oComun.AgregaParametro("@v_Tcr_NumTar02", "V", 20, tx_TCR_NROTJ_02.Text)

      oComun.AgregaParametro("@v_Tcr_Banco03", "V", 10, dd_TCR_BANCO_03.SelectedValue)
      oComun.AgregaParametro("@v_Tcr_NumTar03", "V", 20, tx_TCR_NROTJ_03.Text)

      oComun.AgregaParametro("@v_Tcr_Banco04", "V", 10, dd_TCR_BANCO_04.SelectedValue)
      oComun.AgregaParametro("@v_Tcr_NumTar04", "V", 20, tx_TCR_NROTJ_04.Text)

      oComun.AgregaParametro("@v_Tcr_Banco05", "V", 10, dd_TCR_BANCO_05.SelectedValue)
      oComun.AgregaParametro("@v_Tcr_NumTar05", "V", 20, tx_TCR_NROTJ_05.Text)

      oComun.AgregaParametro("@v_Bienes", "V", 1000, tx_BieMueInm.Value)



      If oComun.EjecutaTransaccion("basc.S_Ficha_Graba04") Then
        vRet = 0
      Else
        Mensaje_4(Me.Page, "Por favor Verifique su informacion.", "RH", "error")
        vRet = 1
      End If

    Catch ex As Exception
      vRet = 1

    End Try

    Return vRet

  End Function

  Public Shared Sub Mensaje_4(ByVal page As Page, ByVal message As String, ByVal title As String, Optional ByVal type As String = "info", Optional ByVal clearToast As Boolean = False, Optional ByVal pos As String = "toast-top-center", Optional ByVal Sticky As Boolean = False)
    Dim toastrScript As String = [String].Format("Notify('{0}','{1}','{2}', '{3}', '{4}', '{5}');", message, title, type, clearToast, pos, Sticky)
    page.ClientScript.RegisterStartupScript(page.[GetType](), "toastr_message", toastrScript, addScriptTags:=True)
  End Sub



End Class
