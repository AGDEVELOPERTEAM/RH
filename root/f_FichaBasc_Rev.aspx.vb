
Public Class f_FichaBasc_Rev
  Inherits System.Web.UI.Page
  Dim oComun As New cl_COMUN_AD
  Dim cRutaImagenes As String = "~/Files/SEG/"
  Dim cNumeroDocumento As String = ""

  <System.Web.Services.WebMethod()>
  Public Shared Function GrabaImagenTrabajador_REV(ByVal data As String) As Boolean
    Dim SGalleta As HttpCookie = HttpContext.Current.Request.Cookies("RH")
    cDocumento = SGalleta.Values("nd")
    cPeriodo = SGalleta.Values("pe")

    Dim objComun As New cl_COMUN_AD
    Dim fileName As String = cDocumento + "-" + cPeriodo + "-1.jpg" ''objComun.ID & ".jpg"
    Dim imageBytes As Byte() = Convert.FromBase64String(data.Split(","c)(1))
    Dim dtDATA As New DataTable

    Dim csql As String
    csql = "SELECT V_FOT_01=ISNULL(V_FOT_01,'') FROM [basc].[Ficha] WHERE c_NUMDNI='" & cDocumento & "' AND v_CODPER='" & cPeriodo & "'"
    dtDATA = objComun.EjecutaCadenaSQL(csql)

    If dtDATA.Rows(0).Item("V_FOT_01") <> "" Then
      If System.IO.File.Exists(HttpContext.Current.Server.MapPath(String.Format("~/files/SEG/{0}", dtDATA.Rows(0).Item("V_FOT_01")))) Then
        System.IO.File.Delete(HttpContext.Current.Server.MapPath(String.Format("~/files/SEG/{0}", dtDATA.Rows(0).Item("V_FOT_01"))))
      End If
    End If

    Dim filePath As String = HttpContext.Current.Server.MapPath(String.Format("~/files/SEG/{0}", fileName))
    HttpContext.Current.Session("Path") = String.Format("~/files/SEG/{0}", fileName)
    System.IO.File.WriteAllBytes(filePath, imageBytes)

    Try
      objComun.AgregaParametro("@c_NumDNI", "V", 10, cDocumento)
      objComun.AgregaParametro("@v_Periodo", "C", 8, cPeriodo)
      objComun.AgregaParametro("@Tipo", "I", 5, 5)
      objComun.AgregaParametro("@imagen", "V", 50, fileName)
      objComun.EjecutaTransaccion("basc.S_Ficha_Graba03")

    Catch ex As Exception
    End Try

    Return True

  End Function


  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    Dim oComun As New cl_COMUN_AD
    Dim dtItems As New DataTable

    Dim SGalleta As HttpCookie = Request.Cookies("RH")
    Session("id") = SGalleta.Values("id")
    Session("Documento") = SGalleta.Values("nd")
    Session("Periodo") = SGalleta.Values("pe")


    dtItems = oComun.EjecutaCadenaSQL("SELECT Periodo=ISNULL(fi.v_codper,''),v_DJ_NOM,v_fot_01,v_dni_01,v_dni_02,n_DIR_LAT,n_DIR_LON,v_CRO_01,v_HUE_D1,v_HUE_D2,v_HUE_D3,v_HUE_D4,v_HUE_D5,v_HUE_I1,v_HUE_I2,v_HUE_I3,v_HUE_I4,v_HUE_I5,v_HUE_00  FROM [RH].[basc].[Ficha] fi Left JOIN basc.Periodo pe ON fi.v_CODPER=pe.v_CODPER WHERE pe.c_Estado ='AB' AND fi.c_Estado='AB' AND fi.c_NUMDNI='" & TX_NUMDNI.Text & "'")
    If dtItems.Rows.Count > 0 Then

      Session("Periodo") = dtItems.Rows(0).Item("Periodo").ToString
      SGalleta.Values("pe") = dtItems.Rows(0).Item("Periodo").ToString
      Response.AppendCookie(SGalleta)

      lb_nombre.Text = dtItems.Rows(0).Item("v_DJ_NOM")
      im_foto.ImageUrl = cRutaImagenes & dtItems.Rows(0).Item("V_FOT_01")

      im_dni1.ImageUrl = cRutaImagenes & dtItems.Rows(0).Item("V_DNI_01")
      im_dni2.ImageUrl = cRutaImagenes & dtItems.Rows(0).Item("V_DNI_02")
      im_mapa.ImageUrl = IIf(cRutaImagenes & dtItems.Rows(0).Item("v_CRO_01") = "", "", cRutaImagenes & dtItems.Rows(0).Item("v_CRO_01"))
      im_I1.ImageUrl = IIf(dtItems.Rows(0).Item("V_HUE_I1") = "", "~/img/huella.jpg", cRutaImagenes & dtItems.Rows(0).Item("V_HUE_I1"))
      im_I2.ImageUrl = IIf(dtItems.Rows(0).Item("V_HUE_I2").ToString = "", "~/img/huella.jpg", cRutaImagenes & dtItems.Rows(0).Item("V_HUE_I2"))
      im_I3.ImageUrl = IIf(dtItems.Rows(0).Item("V_HUE_I3") = "", "~/img/huella.jpg", cRutaImagenes & dtItems.Rows(0).Item("V_HUE_I3"))
      im_I4.ImageUrl = IIf(dtItems.Rows(0).Item("V_HUE_I4") = "", "~/img/huella.jpg", cRutaImagenes & dtItems.Rows(0).Item("V_HUE_I4"))
      im_I5.ImageUrl = IIf(dtItems.Rows(0).Item("V_HUE_I5") = "", "~/img/huella.jpg", cRutaImagenes & dtItems.Rows(0).Item("V_HUE_I5"))
      im_D1.ImageUrl = IIf(dtItems.Rows(0).Item("V_HUE_D1") = "", "~/img/huella.jpg", cRutaImagenes & dtItems.Rows(0).Item("V_HUE_D1"))
      im_D2.ImageUrl = IIf(dtItems.Rows(0).Item("V_HUE_D2") = "", "~/img/huella.jpg", cRutaImagenes & dtItems.Rows(0).Item("V_HUE_D2"))
      im_D3.ImageUrl = IIf(dtItems.Rows(0).Item("V_HUE_D3") = "", "~/img/huella.jpg", cRutaImagenes & dtItems.Rows(0).Item("V_HUE_D3"))
      im_D4.ImageUrl = IIf(dtItems.Rows(0).Item("V_HUE_D4") = "", "~/img/huella.jpg", cRutaImagenes & dtItems.Rows(0).Item("V_HUE_D4"))
      im_D5.ImageUrl = IIf(dtItems.Rows(0).Item("V_HUE_D5") = "", "~/img/huella.jpg", cRutaImagenes & dtItems.Rows(0).Item("V_HUE_D5"))


    Else

    End If



  End Sub

  Private Sub bt_buscar_Click(sender As Object, e As EventArgs) Handles bt_buscar.Click

  End Sub

  Private Sub xxMap_Click(sender As Object, e As EventArgs) Handles xxMap.Click
    Dim oComun As New cl_COMUN_AD
    Dim dtData As New DataTable

    dtData = oComun.EjecutaCadenaSQL("SELECT v_CRO_01,n_DIR_Lat,n_DIR_Lon FROM [basc].[Ficha]")

    For nItm = 0 To dtData.Rows.Count - 1

      Dim folderPath As String = Server.MapPath(cRutaImagenes) & dtData.Rows(nItm).Item("V_CRO_01")
      Dim cUri As String = "https://maps.googleapis.com/maps/api/staticmap?%20center=" & dtData.Rows(nItm).Item("n_DIR_Lat") & "," & dtData.Rows(nItm).Item("n_DIR_Lon") & "&zoom=16&size=800x800%20&markers=" & dtData.Rows(nItm).Item("n_DIR_Lat") & "," & dtData.Rows(nItm).Item("n_DIR_Lon") & "&key=AIzaSyBY-iwYLJw0vPAeTffNuv-EbjupW6B-k5c"

      oComun.GrabaImagen(cUri, folderPath)
    Next


  End Sub





End Class
