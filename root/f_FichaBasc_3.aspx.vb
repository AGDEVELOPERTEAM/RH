Imports System.IO

Public Class f_FichaBasc_3
  Inherits System.Web.UI.Page
  Dim oComun As New cl_COMUN_AD
  Dim cRutaImagenes As String = "~/Files/SEG/"
  Dim sid As String = ""
  Dim oUSUARIO_EN As New cl_USUARIO_EN
  Dim oUSUARIO_LN As New cl_USUARIO_LN

  <System.Web.Services.WebMethod()>
  Public Shared Function GrabaFotoDNI(ByVal data As String) As Boolean

    Dim SGalleta As HttpCookie = HttpContext.Current.Request.Cookies("RH")
    cDocumento = SGalleta.Values("nd")
    cPeriodo = SGalleta.Values("pe")


    Dim objComun As New cl_COMUN_AD
    If data <> "" Then

      Dim fileName As String = cDocumento + "-" + cPeriodo + "-2.jpg"
      Dim imageBytes As Byte() = Convert.FromBase64String(data.Split(","c)(1))
      Dim dtDATA As New DataTable
      Dim csql As String
      csql = "SELECT V_DNI_01=ISNULL(V_DNI_01,'') , V_DNI_02=ISNULL(V_DNI_02,'') FROM [basc].[Ficha] WHERE c_NUMDNI='" & cDocumento & "' AND v_CODPER='" & cPeriodo & "'"
      dtDATA = objComun.EjecutaCadenaSQL(csql)

      If dtDATA.Rows(0).Item("V_DNI_01") <> "" Then
        If System.IO.File.Exists(HttpContext.Current.Server.MapPath(String.Format("~/files/SEG/{0}", dtDATA.Rows(0).Item("V_DNI_01")))) Then
          System.IO.File.Delete(HttpContext.Current.Server.MapPath(String.Format("~/files/SEG/{0}", dtDATA.Rows(0).Item("V_DNI_01"))))
        End If
      End If

      Dim filePath As String = HttpContext.Current.Server.MapPath(String.Format("~/files/SEG/{0}", fileName))
      HttpContext.Current.Session("Path") = String.Format("~/files/SEG/{0}", fileName)
      System.IO.File.WriteAllBytes(filePath, imageBytes)

      Try
        objComun.AgregaParametro("@c_NumDNI", "V", 10, cDocumento)
        objComun.AgregaParametro("@v_Periodo", "C", 8, cPeriodo)

        objComun.AgregaParametro("@Tipo", "I", 5, 1)
        objComun.AgregaParametro("@imagen", "V", 50, fileName)
        objComun.EjecutaTransaccion("basc.S_Ficha_Graba03")

      Catch ex As Exception
      End Try
    End If

    Return True

  End Function

  <System.Web.Services.WebMethod()>
  Public Shared Function GrabaFotoDNIAtras(ByVal data As String) As Boolean

    Dim SGalleta As HttpCookie = HttpContext.Current.Request.Cookies("RH")
    cDocumento = SGalleta.Values("nd")
    cPeriodo = SGalleta.Values("pe")

    Dim objComun As New cl_COMUN_AD
    If data <> "" Then

      Dim fileName As String = cDocumento + "-" + cPeriodo + "-3.jpg"
      Dim imageBytes As Byte() = Convert.FromBase64String(data.Split(","c)(1))
      Dim dtDATA As New DataTable

      Dim csql As String
      csql = "SELECT V_DNI_01=ISNULL(V_DNI_01,'') , V_DNI_02=ISNULL(V_DNI_02,'') FROM [basc].[Ficha] WHERE c_NUMDNI='" & cDocumento & "' AND v_CODPER='" & cPeriodo & "'"
      dtDATA = objComun.EjecutaCadenaSQL(csql)

      If dtDATA.Rows(0).Item("V_DNI_02") <> "" Then
        If System.IO.File.Exists(HttpContext.Current.Server.MapPath(String.Format("~/files/SEG/{0}", dtDATA.Rows(0).Item("V_DNI_02")))) Then
          System.IO.File.Delete(HttpContext.Current.Server.MapPath(String.Format("~/files/SEG/{0}", dtDATA.Rows(0).Item("V_DNI_02"))))
        End If
      End If

      Dim filePath As String = HttpContext.Current.Server.MapPath(String.Format("~/files/SEG/{0}", fileName))
      HttpContext.Current.Session("Path") = String.Format("~/files/SEG/{0}", fileName)
      System.IO.File.WriteAllBytes(filePath, imageBytes)

      Try
        objComun.AgregaParametro("@c_NumDNI", "V", 10, cDocumento)
        objComun.AgregaParametro("@v_Periodo", "C", 8, cPeriodo)

        objComun.AgregaParametro("@Tipo", "I", 5, 2)
        objComun.AgregaParametro("@imagen", "V", 50, fileName)
        objComun.EjecutaTransaccion("basc.S_Ficha_Graba03")

      Catch ex As Exception
      End Try

    End If

    Return True

  End Function

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    sid = Request.QueryString("id")
    If sid <> "" Then
      oUSUARIO_EN.KeyAcceso = sid
      oUSUARIO_EN = oUSUARIO_LN.LN_USUARIO_CARGA(oUSUARIO_EN)
      cDocumento = oUSUARIO_EN.Documento
      cPeriodo = oUSUARIO_EN.Periodo

      Response.Cookies.Remove("RH")

      Dim CertificadoCook As New HttpCookie("RH")
      CertificadoCook.Values.Add("id", sid)
      CertificadoCook.Values.Add("nd", oUSUARIO_EN.Documento)
      CertificadoCook.Values.Add("pe", oUSUARIO_EN.Periodo)
      CertificadoCook.Expires = Now.AddDays(1)
      Response.AppendCookie(CertificadoCook)


    Else
      Response.Redirect("/login.aspx")
    End If






    If Not IsPostBack() Then


      Dim dt_FICHA_3 As DataTable
      Dim cSql As String = ""
      cSql = "SELECT * FROM basc.Ficha WHERE c_NumDNI='" + cDocumento + "' AND v_codper='" + cPeriodo + "'"

      dt_FICHA_3 = oComun.EjecutaCadenaSQL(cSql)
      If dt_FICHA_3.Rows.Count > 0 Then

        If dt_FICHA_3.Rows(0).Item("v_DNI_01").ToString <> "" Then

          img_dni_frente.ImageUrl = "../img/Dni0.jpg"
          img_dni_frente.Dispose()
          img_dni_frente.ImageUrl = cRutaImagenes & dt_FICHA_3.Rows(0).Item("v_DNI_01").ToString & "?" + DateTime.Now.Ticks.ToString
        Else
          img_dni_frente.ImageUrl = "../img/Dni0.jpg"
        End If


        If dt_FICHA_3.Rows(0).Item("v_DNI_02").ToString <> "" Then
          img_dni_atras.ImageUrl = cRutaImagenes & dt_FICHA_3.Rows(0).Item("v_DNI_02").ToString & "?" + DateTime.Now.Ticks.ToString
        Else
          img_dni_atras.ImageUrl = "../img/Dni1.jpg"
        End If

        ''If dt_FICHA_3.Rows(0).Item("v_HUE_01").ToString <> "" Then
        ''  img_Huellas.ImageUrl = cRutaImagenes & dt_FICHA_3.Rows(0).Item("v_HUE_01").ToString & "?" + DateTime.Now.Ticks.ToString
        ''Else
        ''  img_Huellas.ImageUrl = "../img/HuellasEjemplo.png"
        ''End If

      End If



    End If

  End Sub

  Sub GrabaUbicacion()

    sid = Request.QueryString("id")
    If sid <> "" Then
      oUSUARIO_EN.KeyAcceso = sid
      oUSUARIO_EN = oUSUARIO_LN.LN_USUARIO_CARGA(oUSUARIO_EN)
      cDocumento = oUSUARIO_EN.Documento
      cPeriodo = oUSUARIO_EN.Periodo
    Else
      Response.Redirect("/login.aspx")
    End If


    Dim nLat As Decimal
    Dim nLon As Decimal

    nLat = If(Request.Form("lat").ToString = "", 0, Request.Form("lat").ToString)
    nLon = If(Request.Form("lon").ToString = "", 0, Request.Form("lon").ToString)
    Try
      oComun.AgregaParametro("@c_NumDNI", "V", 10, cDocumento)
      oComun.AgregaParametro("@v_CODPER", "V", 8, cPeriodo)
      oComun.AgregaParametro("@nLat", "F", 20, nLat)
      oComun.AgregaParametro("@nLon", "F", 20, nLon)
      oComun.EjecutaTransaccion("basc.S_Ficha_Graba03_01")
    Catch ex As Exception
    End Try


    Dim folderPath As String = Server.MapPath(cRutaImagenes)
    Dim cNomFile As String = cDocumento + "-" + cPeriodo + "-5.jpg" ''objComun.ID & ".jpg"

    Dim cUri As String = "https://maps.googleapis.com/maps/api/staticmap?%20center=" & nLat & "," & nLon & "&zoom=16&size=800x800%20&markers=" & nLat & "," & nLon & "&key=AIzaSyBY-iwYLJw0vPAeTffNuv-EbjupW6B-k5c"

    oComun.GrabaImagen(cUri, folderPath & cNomFile)


  End Sub

  Protected Sub Upload_Huellas(sender As Object, e As EventArgs)
    'GrabaImagen(upl_UploadHuellas, img_Huellas, 3)
  End Sub

  Function GrabaImagen(ByRef oUpload As FileUpload, ByRef oImagen As Image, nTipo As Integer) As String
    'Dim SGalleta As HttpCookie = Request.Cookies("RH")
    'cDocumento = SGalleta.Values("nd")
    'cPeriodo = SGalleta.Values("pe")


    sid = Request.QueryString("id")
    If sid <> "" Then
      oUSUARIO_EN.KeyAcceso = sid
      oUSUARIO_EN = oUSUARIO_LN.LN_USUARIO_CARGA(oUSUARIO_EN)
      cDocumento = oUSUARIO_EN.Documento
      cPeriodo = oUSUARIO_EN.Periodo
    Else
      Response.Redirect("/login.aspx")
    End If


    If oUpload.FileName.ToString = "" Then
      Return ""
      Exit Function
    End If
    Dim cFileExt As String = Mid(oUpload.FileName.ToString, InStrRev(oUpload.FileName.ToString, "."), 5)
    Dim folderPath As String = Server.MapPath(cRutaImagenes)
    Dim cNomFile As String = cDocumento + "-" + cPeriodo + "-4" & cFileExt ''objComun.ID & ".jpg"
    If cFileExt = ".jpg" Or cFileExt = ".png" Or cFileExt = ".jpeg" Or cFileExt <> ".tiff" Then
      oUpload.SaveAs(folderPath & cNomFile)
      oImagen.ImageUrl = cRutaImagenes & cNomFile
      Try
        oComun.AgregaParametro("@c_NumDNI", "V", 10, cDocumento)
        oComun.AgregaParametro("@v_Periodo", "C", 8, cPeriodo)
        oComun.AgregaParametro("@Tipo", "I", 1, nTipo)
        oComun.AgregaParametro("@imagen", "V", 50, cNomFile)
        oComun.EjecutaTransaccion("basc.S_Ficha_Graba03")
      Catch ex As Exception
        Mensaje3(Me.Page, "Error, por favor reintente.", "RH", "error")
      End Try
    Else
      Mensaje3(Me.Page, "Error, Archivo de imagen no valido.", "RH", "error")

    End If
    Return cRutaImagenes & cNomFile
  End Function

  Public Shared Sub Mensaje3(ByVal page As Page, ByVal message As String, ByVal title As String, Optional ByVal type As String = "info", Optional ByVal clearToast As Boolean = False, Optional ByVal pos As String = "toast-top-center", Optional ByVal Sticky As Boolean = False)
    Dim toastrScript As String = [String].Format("Notify('{0}','{1}','{2}', '{3}', '{4}', '{5}');", message, title, type, clearToast, pos, Sticky)
    page.ClientScript.RegisterStartupScript(page.[GetType](), "toastr_message", toastrScript, addScriptTags:=True)
  End Sub

  Private Sub bt_next_Click(sender As Object, e As EventArgs) Handles bt_next.Click
    GrabaUbicacion()
    Response.Redirect("f_FichaBasc_4.aspx?id=" & Request.QueryString("id"))
  End Sub

  Private Sub bt_back_Click(sender As Object, e As EventArgs) Handles bt_back.Click
    GrabaUbicacion()
    Response.Redirect("f_FichaBasc_2.aspx?id=" & Request.QueryString("id"))
  End Sub

End Class

