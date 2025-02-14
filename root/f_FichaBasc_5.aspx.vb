'Imports CrystalDecisions.CrystalReports.Engine
'Imports CrystalDecisions.Shared

Imports System.Security.Cryptography

Public Class f_FichaBasc_5
  Inherits System.Web.UI.Page
  Dim oComun As New cl_COMUN_AD
  Dim cRutaImagenes As String = "~/Files/SEG/"
  Dim cSql As String = ""
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

    Dim bD1 As Boolean = False
    Dim bD2 As Boolean = False
    Dim bD3 As Boolean = False
    Dim bD4 As Boolean = False
    Dim bD5 As Boolean = False

    Dim bI1 As Boolean = False
    Dim bI2 As Boolean = False
    Dim bI3 As Boolean = False
    Dim bI4 As Boolean = False
    Dim bI5 As Boolean = False


    bD1 = System.IO.File.Exists(HttpContext.Current.Server.MapPath(String.Format("~/files/FP/{0}", cDocumento & "-D1.jpg")))
    bD2 = System.IO.File.Exists(HttpContext.Current.Server.MapPath(String.Format("~/files/FP/{0}", cDocumento & "-D2.jpg")))
    bD3 = System.IO.File.Exists(HttpContext.Current.Server.MapPath(String.Format("~/files/FP/{0}", cDocumento & "-D3.jpg")))
    bD4 = System.IO.File.Exists(HttpContext.Current.Server.MapPath(String.Format("~/files/FP/{0}", cDocumento & "-D4.jpg")))
    bD5 = System.IO.File.Exists(HttpContext.Current.Server.MapPath(String.Format("~/files/FP/{0}", cDocumento & "-D5.jpg")))

    bI1 = System.IO.File.Exists(HttpContext.Current.Server.MapPath(String.Format("~/files/FP/{0}", cDocumento & "-I1.jpg")))
    bI2 = System.IO.File.Exists(HttpContext.Current.Server.MapPath(String.Format("~/files/FP/{0}", cDocumento & "-I2.jpg")))
    bI3 = System.IO.File.Exists(HttpContext.Current.Server.MapPath(String.Format("~/files/FP/{0}", cDocumento & "-I3.jpg")))
    bI4 = System.IO.File.Exists(HttpContext.Current.Server.MapPath(String.Format("~/files/FP/{0}", cDocumento & "-I4.jpg")))
    bI5 = System.IO.File.Exists(HttpContext.Current.Server.MapPath(String.Format("~/files/FP/{0}", cDocumento & "-I5.jpg")))



    If bD1 And bD2 And bD3 And bD4 And bD5 And
       bI1 And bI2 And bI3 And bI4 And bI5 Then
      lb_Bloq0.Visible = False
      lb_Bloq1.Visible = False
      bt_Fin.Visible = False
      bt_End.Visible = True
      lb_Final.Visible = True

    Else
      lb_Bloq0.Visible = True
      lb_Bloq1.Visible = True
      bt_Fin.Visible = True
      bt_End.Visible = False
      lb_Final.Visible = False
    End If

    upp_cierre.Update()


    If Not IsPostBack() Then
      Dim dt_FICHA5 As DataTable
      cSql = "SELECT * FROM basc.Ficha WHERE c_NumDNI='" + cDocumento + "' AND v_codper='" + cPeriodo + "'"
      dt_FICHA5 = oComun.EjecutaCadenaSQL(cSql)
      If dt_FICHA5.Rows.Count > 0 Then

        tx_PadNom.Text = dt_FICHA5.Rows(0).Item("v_Pad_Nombre").ToString
        tx_PadOcu.Text = dt_FICHA5.Rows(0).Item("v_Pad_Ocupacion").ToString
        tx_PadDNI.Text = dt_FICHA5.Rows(0).Item("v_Pad_DNI").ToString
        tx_PadDir.Text = dt_FICHA5.Rows(0).Item("v_Pad_Direccion").ToString
        tx_PadTlf.Text = dt_FICHA5.Rows(0).Item("v_Pad_Telefono").ToString

        tx_MamNom.Text = dt_FICHA5.Rows(0).Item("v_Mad_Nombre").ToString
        tx_MamOcu.Text = dt_FICHA5.Rows(0).Item("v_Mad_Ocupacion").ToString
        tx_MamDNI.Text = dt_FICHA5.Rows(0).Item("v_Mad_DNI").ToString
        tx_MamDir.Text = dt_FICHA5.Rows(0).Item("v_Mad_Direccion").ToString
        tx_MamTlf.Text = dt_FICHA5.Rows(0).Item("v_Mad_Telefono").ToString

        tx_HerNom01.Text = dt_FICHA5.Rows(0).Item("v_Her_Nombre01").ToString
        tx_HerOcu01.Text = dt_FICHA5.Rows(0).Item("v_Her_Ocupacion01").ToString
        tx_HerDNI01.Text = dt_FICHA5.Rows(0).Item("v_Her_DNI01").ToString
        tx_HerDir01.Text = dt_FICHA5.Rows(0).Item("v_Her_Direccion01").ToString
        tx_HerTlf01.Text = dt_FICHA5.Rows(0).Item("v_Her_Telefono01").ToString

        tx_HerNom02.Text = dt_FICHA5.Rows(0).Item("v_Her_Nombre02").ToString
        tx_HerOcu02.Text = dt_FICHA5.Rows(0).Item("v_Her_Ocupacion02").ToString
        tx_HerDNI02.Text = dt_FICHA5.Rows(0).Item("v_Her_DNI02").ToString
        tx_HerDir02.Text = dt_FICHA5.Rows(0).Item("v_Her_Direccion02").ToString
        tx_HerTlf02.Text = dt_FICHA5.Rows(0).Item("v_Her_Telefono02").ToString

        tx_HerNom03.Text = dt_FICHA5.Rows(0).Item("v_Her_Nombre03").ToString
        tx_HerOcu03.Text = dt_FICHA5.Rows(0).Item("v_Her_Ocupacion03").ToString
        tx_HerDNI03.Text = dt_FICHA5.Rows(0).Item("v_Her_DNI03").ToString
        tx_HerDir03.Text = dt_FICHA5.Rows(0).Item("v_Her_Direccion03").ToString
        tx_HerTlf03.Text = dt_FICHA5.Rows(0).Item("v_Her_Telefono03").ToString

        tx_TioNom01.Text = dt_FICHA5.Rows(0).Item("v_Tio_Nombre01").ToString
        tx_TioOcu01.Text = dt_FICHA5.Rows(0).Item("v_Tio_Ocupacion01").ToString
        tx_TioDNI01.Text = dt_FICHA5.Rows(0).Item("v_Tio_DNI01").ToString
        tx_TioDir01.Text = dt_FICHA5.Rows(0).Item("v_Tio_Direccion01").ToString
        tx_TioTlf01.Text = dt_FICHA5.Rows(0).Item("v_Tio_Telefono01").ToString
        tx_TioNom02.Text = dt_FICHA5.Rows(0).Item("v_Tio_Nombre02").ToString
        tx_TioOcu02.Text = dt_FICHA5.Rows(0).Item("v_Tio_Ocupacion02").ToString
        tx_TioDNI02.Text = dt_FICHA5.Rows(0).Item("v_Tio_DNI02").ToString
        tx_TioDir02.Text = dt_FICHA5.Rows(0).Item("v_Tio_Direccion02").ToString
        tx_TioTlf02.Text = dt_FICHA5.Rows(0).Item("v_Tio_Telefono02").ToString

        tx_AmiNom01.Text = dt_FICHA5.Rows(0).Item("v_Cir_Nombre01").ToString
        tx_AmiOcu01.Text = dt_FICHA5.Rows(0).Item("v_Cir_Ocupacion01").ToString
        tx_AmiDNI01.Text = dt_FICHA5.Rows(0).Item("v_Cir_DNI01").ToString
        tx_AmiDir01.Text = dt_FICHA5.Rows(0).Item("v_Cir_Direccion01").ToString
        tx_AmiTlf01.Text = dt_FICHA5.Rows(0).Item("v_Cir_Telefono01").ToString

        tx_AmiNom02.Text = dt_FICHA5.Rows(0).Item("v_Cir_Nombre02").ToString
        tx_AmiOcu02.Text = dt_FICHA5.Rows(0).Item("v_Cir_Ocupacion02").ToString
        tx_AmiDNI02.Text = dt_FICHA5.Rows(0).Item("v_Cir_DNI02").ToString
        tx_AmiDir02.Text = dt_FICHA5.Rows(0).Item("v_Cir_Direccion02").ToString
        tx_AmiTlf02.Text = dt_FICHA5.Rows(0).Item("v_Cir_Telefono02").ToString

        tx_ciupaicon.Value = dt_FICHA5.Rows(0).Item("v_Viajes").ToString
        tx_paivisult.Value = dt_FICHA5.Rows(0).Item("v_Viajes2Year").ToString
        tx_aficiones.Value = dt_FICHA5.Rows(0).Item("v_AficionDeporte").ToString

      End If

    End If

  End Sub

  Private Sub bt_back_Click(sender As Object, e As EventArgs) Handles bt_back.Click
    Dim wRet As Integer
    wRet = Graba_5()
    If wRet = 0 Then
      Response.Redirect("f_FichaBasc_4.aspx?id=" & sid)
    End If
  End Sub

  Private Sub bt_fin_Click(sender As Object, e As EventArgs) Handles bt_Fin.Click


    sid = Request.QueryString("id")
    If sid <> "" Then
      oUSUARIO_EN.KeyAcceso = sid
      oUSUARIO_EN = oUSUARIO_LN.LN_USUARIO_CARGA(oUSUARIO_EN)
      cDocumento = oUSUARIO_EN.Documento
      cPeriodo = oUSUARIO_EN.Periodo
    Else
      Response.Redirect("/login.aspx")
    End If



    Dim wRet As Integer
    wRet = Graba_5()
    If wRet = 0 Then

      Dim dtValida As DataTable
      Dim cMensaje As String = ""
      oComun.AgregaParametro("@dni", "V", 10, cDocumento)
      oComun.AgregaParametro("@per", "V", 10, cPeriodo)
      dtValida = oComun.EjecutaProcedure("basc.S_Ficha_Valida")
      cMensaje = dtValida.Rows(0).Item("Mensaje")

      If cMensaje = "" Then

        oComun.AgregaParametro("@c_NumDNI", "V", 10, cDocumento)
        oComun.AgregaParametro("@v_CODPER", "C", 8, cPeriodo)

        If oComun.EjecutaTransaccion("basc.S_Ficha_GrabaCierre") Then

          Response.Redirect("f_FichaBasc.aspx?id=" & sid)
          wRet = 0
        Else
          Mensaje_5(Me.Page, "Por favor Verifique su informacion.", "RH", "error")
          wRet = 1
        End If

      Else

        Mensaje_5(Me.Page, cMensaje, "RH", "error")

      End If

    End If

  End Sub

  Private Function Graba_5() As Integer

    sid = Request.QueryString("id")
    If sid <> "" Then
      oUSUARIO_EN.KeyAcceso = sid
      oUSUARIO_EN = oUSUARIO_LN.LN_USUARIO_CARGA(oUSUARIO_EN)
      cDocumento = oUSUARIO_EN.Documento
      cPeriodo = oUSUARIO_EN.Periodo
    Else
      Response.Redirect("/login.aspx")
    End If


    Dim vRet As Integer = 0
    Try

      oComun.AgregaParametro("@c_NumDNI", "V", 10, cDocumento)
      oComun.AgregaParametro("@v_CodPer", "C", 8, cPeriodo)

      oComun.AgregaParametro("@v_Pad_Nombre", "V", 50, tx_PadNom.Text)
      oComun.AgregaParametro("@v_Pad_Ocupacion", "V", 50, tx_PadOcu.Text)
      oComun.AgregaParametro("@v_Pad_DNI", "V", 20, tx_PadDNI.Text)
      oComun.AgregaParametro("@v_Pad_Direccion", "V", 200, tx_PadDir.Text)
      oComun.AgregaParametro("@v_Pad_Telefono", "V", 20, tx_PadTlf.Text)

      oComun.AgregaParametro("@v_Mad_Nombre", "V", 50, tx_MamNom.Text)
      oComun.AgregaParametro("@v_Mad_Ocupacion", "V", 50, tx_MamOcu.Text)
      oComun.AgregaParametro("@v_Mad_DNI", "V", 20, tx_MamDNI.Text)
      oComun.AgregaParametro("@v_Mad_Direccion", "V", 200, tx_MamDir.Text)
      oComun.AgregaParametro("@v_Mad_Telefono", "V", 20, tx_MamTlf.Text)
      oComun.AgregaParametro("v_Viajes", "V", 500, tx_ciupaicon.Value)
      oComun.AgregaParametro("v_Viajes2Year", "V", 500, tx_paivisult.Value)
      oComun.AgregaParametro("v_AficionDeporte", "V", 500, tx_aficiones.Value)

      If oComun.EjecutaTransaccion("basc.S_Ficha_Graba05") Then
        vRet = 0
      Else



        Mensaje_5(Me.Page, "Por favor Verifique su informacion.", "RH", "error")
        vRet = 1
      End If

    Catch ex As Exception
      vRet = 1

    End Try

    Return vRet

  End Function

  Public Shared Sub Mensaje_5(ByVal page As Page, ByVal message As String, ByVal title As String, Optional ByVal type As String = "info", Optional ByVal clearToast As Boolean = False, Optional ByVal pos As String = "toast-top-center", Optional ByVal Sticky As Boolean = False)
    Dim toastrScript As String = [String].Format("Notify('{0}','{1}','{2}', '{3}', '{4}', '{5}');", message, title, type, clearToast, pos, Sticky)
    page.ClientScript.RegisterStartupScript(page.[GetType](), "toastr_message", toastrScript, addScriptTags:=True)
  End Sub

  Private Sub bt_Graba_Click(sender As Object, e As EventArgs) Handles bt_Graba.Click
    Dim wRet As Integer
    wRet = Graba_5()
    If wRet <> 0 Then
      Mensaje_5(Me.Page, "Por favor Verifique su informacion.", "RH", "error")
    Else
      Response.Redirect("f_FichaBasc.aspx?id=" & sid)

    End If
  End Sub

  Private Sub bt_End_Click(sender As Object, e As EventArgs) Handles bt_End.Click

    sid = Request.QueryString("id")
    If sid <> "" Then
      oUSUARIO_EN.KeyAcceso = sid
      oUSUARIO_EN = oUSUARIO_LN.LN_USUARIO_CARGA(oUSUARIO_EN)
      cDocumento = oUSUARIO_EN.Documento
      cPeriodo = oUSUARIO_EN.Periodo
    Else
      Response.Redirect("/login.aspx")
    End If



    Dim wRet As Integer
    wRet = Graba_5()
    If wRet = 0 Then

      Dim dtValida As DataTable
      Dim cMensaje As String = ""
      oComun.AgregaParametro("@dni", "V", 10, cDocumento)
      oComun.AgregaParametro("@per", "V", 10, cPeriodo)
      dtValida = oComun.EjecutaProcedure("basc.S_Ficha_Valida")
      cMensaje = dtValida.Rows(0).Item("Mensaje")

      If cMensaje = "" Then

        oComun.AgregaParametro("@c_NumDNI", "V", 10, cDocumento)
        oComun.AgregaParametro("@v_CODPER", "C", 8, cPeriodo)
        oComun.AgregaParametro("@c_Estado", "C", 2, "CE")

        If oComun.EjecutaTransaccion("basc.S_Ficha_GrabaCierre") Then

          Mensaje_5(Me.Page, "Por favor Verifique su informacion.", "RH", "La Informacion fue Almacenada Satisfactoriamente !")

          Response.Redirect("f_FichaBasc.aspx?id=" & sid)
          wRet = 0
        Else
          Mensaje_5(Me.Page, "Por favor Verifique su informacion.", "RH", "error")
          wRet = 1
        End If

      Else

        Mensaje_5(Me.Page, cMensaje, "RH", "error")

      End If

    End If
  End Sub
End Class




'Dim rpt As ReportDocument = New ReportDocument()
'Dim dtDJ As DataTable
'Dim dtFicha As DataTable
'' Genera Formato
'Try
'  Dim cNOMFILEDJ As String
'  Dim cNOMFILEBS As String
'  Dim cDestDJ As String
'  Dim cDestBasc As String
'  Dim cReporte As String
'  cNOMFILEDJ = oComun.ID
'  cDestDJ = "../Files/Format/" + cNOMFILEDJ + ".pdf"
'  cReporte = "../Report/rpDeclaracionJurada.rpt"
'  dtDJ = oComun.EjecutaCadenaSQL("SELECT * FROM root.V_DeclaracionJurada WHERE c_NUMDNI = '" & Session("Documento") & "' And v_CODPER = '" & Session("Periodo") & "'")
'  dtDJ.TableName = "dtDJ"
'  rpt.Load(Server.MapPath(cReporte))
'  rpt.SetDataSource(dtDJ)
'  rpt.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath(cDestDJ))
'  rpt.Close()
'  cNOMFILEBS = oComun.ID
'  cDestBasc = "../Files/Format/" + cNOMFILEBS + ".pdf"
'  cReporte = "../Report/rpFormatoSeguridad.rpt"
'  dtFicha = oComun.EjecutaCadenaSQL("SELECT * FROM root.V_Ficha WHERE c_NUMDNI = '" & Session("Documento") & "' And v_CODPER = '" & Session("Periodo") & "'")
'  dtFicha.TableName = "dtFicha"
'  rpt.Load(Server.MapPath(cReporte))
'  rpt.SetDataSource(dtFicha)
'  rpt.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath(cDestBasc))
'  rpt.Close()
'  rpt.Dispose()
'  oComun.AgregaParametro("@c_NumDNI", "C", 8, Session("Documento"))
'  oComun.AgregaParametro("@v_CODPER", "C", 8, Session("Periodo"))
'  oComun.AgregaParametro("@cIDDj", "V", 50, cNOMFILEDJ)
'  oComun.AgregaParametro("@cIdFicha", "V", 50, cNOMFILEBS)
'  oComun.EjecutaTransaccion("basc.S_Ficha_GrabaCierre")
'  Mensaje_5(Me.Page, "El Documento ha sido Ingresado Satisfactoriamente !", "RH", "info")
'  Response.Redirect("f_FichaBasc.aspx")
'Catch ex As Exception
'End Try
