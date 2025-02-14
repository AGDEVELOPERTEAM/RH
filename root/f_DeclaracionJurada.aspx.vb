Public Class f_DeclaracionJurada
  Inherits System.Web.UI.Page
  Dim oComun As New cl_COMUN_AD
  Dim cRutaImagenes As String = "~/Files/SEG/"
  Dim oUSUARIO_EN As New cl_USUARIO_EN
  Dim oUSUARIO_LN As New cl_USUARIO_LN
  Dim sid As String

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    sid = Request.QueryString("id")
    If sid <> "" Then
      oUSUARIO_EN.KeyAcceso = sid
      oUSUARIO_EN = oUSUARIO_LN.LN_USUARIO_CARGA(oUSUARIO_EN)

      Session("id") = oUSUARIO_EN.id
      Session("Documento") = oUSUARIO_EN.Documento
      Session("Periodo") = oUSUARIO_EN.Periodo
    Else
      Response.Redirect("/login.aspx")
    End If


    If Not IsPostBack() Then
      Dim cSql As String = ""
      Dim dt_MAEPER As DataTable
      Dim EsTrabajador As Boolean = False



      cSql = "SELECT * FROM SAP.V_MaestroPersonal WHERE ICNUM='" & Session("Documento") & "'"
      dt_MAEPER = oComun.EjecutaCadenaSQL(cSql)
      EsTrabajador = (dt_MAEPER.Rows.Count > 0)

      If EsTrabajador Then
        tx_NOMAPE.Enabled = False
        TX_NUMDNI.Enabled = False
      End If

      Dim dt_FICHA_DJ As DataTable
      cSql = "SELECT * FROM basc.Ficha WHERE c_NumDNI='" + Session("Documento") + "' AND v_codper='" + Session("Periodo") + "'"
      dt_FICHA_DJ = oComun.EjecutaCadenaSQL(cSql)

      If dt_FICHA_DJ.Rows.Count = 0 Then
        oComun.AgregaParametro("@NUMDNI", "V", 10, Session("Documento"))
        oComun.AgregaParametro("@CODPER", "C", 6, Session("Periodo"))
        oComun.EjecutaTransaccion("basc.S_Ficha_Init")

        dt_FICHA_DJ = oComun.EjecutaCadenaSQL(cSql)
      End If

      If dt_FICHA_DJ.Rows.Count > 0 Then
        tx_NOMAPE.Text = dt_FICHA_DJ.Rows(0).Item("v_DJ_NOM")
        TX_NUMDNI.Text = dt_FICHA_DJ.Rows(0).Item("v_DJ_DNI")
        tx_DIRECC.Text = dt_FICHA_DJ.Rows(0).Item("v_DJ_DIREC")
        tx_COMMENT.Value = dt_FICHA_DJ.Rows(0).Item("v_DJ_COMENT")

        ant_penal_si.Checked = (dt_FICHA_DJ.Rows(0).Item("i_DJ_PENAL") = 1)
        ant_judic_si.Checked = (dt_FICHA_DJ.Rows(0).Item("i_DJ_JUDIC") = 1)
        ant_polic_si.Checked = (dt_FICHA_DJ.Rows(0).Item("i_DJ_POLIC") = 1)
        ant_aliment_si.Checked = (dt_FICHA_DJ.Rows(0).Item("i_DJ_ALIM") = 1)
        ant_invest_si.Checked = (dt_FICHA_DJ.Rows(0).Item("i_DJ_INVEST") = 1)

        ant_penal_no.Checked = (dt_FICHA_DJ.Rows(0).Item("i_DJ_PENAL") = 0)
        ant_judic_no.Checked = (dt_FICHA_DJ.Rows(0).Item("i_DJ_JUDIC") = 0)
        ant_polic_no.Checked = (dt_FICHA_DJ.Rows(0).Item("i_DJ_POLIC") = 0)
        ant_aliment_no.Checked = (dt_FICHA_DJ.Rows(0).Item("i_DJ_ALIM") = 0)
        ant_invest_no.Checked = (dt_FICHA_DJ.Rows(0).Item("i_DJ_INVEST") = 0)

      End If
    End If
  End Sub

  Private Sub bt_Aceptar_Click(sender As Object, e As EventArgs) Handles bt_Aceptar.Click
    Dim wRet As Integer = 0
    sid = Request.QueryString("id")
    wRet = Graba_DJ()
    If wRet = 0 Then
      Response.Redirect("f_FichaBasc_1.aspx?id=" & sid)
    End If
  End Sub

  Private Sub bt_back_Click(sender As Object, e As EventArgs) Handles bt_back.Click
    Dim wRet As Integer = 0
    If wRet = 0 Then
      Response.Redirect("f_FichaBasc_0.aspx?id=" & Request.QueryString("id"))
    End If
  End Sub
  Private Function Graba_DJ() As Integer
    Dim vRet As Integer = 0
    Dim iPenal As Integer = 0
    Dim iJudic As Integer = 0
    Dim iPolic As Integer = 0
    Dim iAlime As Integer = 0
    Dim iInves As Integer = 0

    Try

      oComun.AgregaParametro("@c_NumDNI", "C", 10, Session("Documento"))
      oComun.AgregaParametro("@v_CODPER", "V", 8, Session("Periodo"))

      iPenal = If(ant_penal_si.Checked, 1, 0)
      iJudic = If(ant_judic_si.Checked, 1, 0)
      iPolic = If(ant_polic_si.Checked, 1, 0)
      iAlime = If(ant_aliment_si.Checked, 1, 0)
      iInves = If(ant_invest_si.Checked, 1, 0)

      oComun.AgregaParametro("@v_DJ_NOM", "V", 50, tx_NOMAPE.Text)
      oComun.AgregaParametro("@v_DJ_DNI", "V", 10, TX_NUMDNI.Text)
      oComun.AgregaParametro("@v_DJ_DIREC", "V", 100, tx_DIRECC.Text)
      oComun.AgregaParametro("@i_DJ_PENAL", "I", 1, iPenal)
      oComun.AgregaParametro("@i_DJ_JUDIC", "I", 1, iJudic)
      oComun.AgregaParametro("@i_DJ_POLIC", "I", 1, iPolic)
      oComun.AgregaParametro("@i_DJ_ALIM", "I", 1, iAlime)
      oComun.AgregaParametro("@i_DJ_INVEST", "I", 1, iInves)
      oComun.AgregaParametro("@v_DJ_COMENT", "V", 300, tx_COMMENT.Value)
      oComun.AgregaParametro("@v_DJ_CUIDAD", "V", 50, "")

      If oComun.EjecutaTransaccion("basc.S_Ficha_GrabaDJ") Then
        vRet = 0
      Else
        Mensaje_DJ(Me.Page, "Por favor Verifique su informacion.", "RH", "error")
        vRet = 1
      End If

    Catch ex As Exception
      vRet = 1

    End Try

    Return vRet

  End Function

  Public Shared Sub Mensaje_DJ(ByVal page As Page, ByVal message As String, ByVal title As String, Optional ByVal type As String = "info", Optional ByVal clearToast As Boolean = False, Optional ByVal pos As String = "toast-top-center", Optional ByVal Sticky As Boolean = False)
    Dim toastrScript As String = [String].Format("Notify('{0}','{1}','{2}', '{3}', '{4}', '{5}');", message, title, type, clearToast, pos, Sticky)
      Page.ClientScript.RegisterStartupScript(page.[GetType](), "toastr_message", toastrScript, addScriptTags:=True)
  End Sub

End Class
