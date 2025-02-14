Public Class Main
  Inherits System.Web.UI.MasterPage
  Dim oUSUARIO_EN As New cl_USUARIO_EN
  Dim oUSUARIO_LN As New cl_USUARIO_LN
  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    Dim sid As String
    sid = Request.QueryString("id")


    If sid <> "" Then
      oUSUARIO_EN.KeyAcceso = sid
      oUSUARIO_EN = oUSUARIO_LN.LN_USUARIO_CARGA(oUSUARIO_EN)
      tx_UsuarioNombre.Text = LCase(oUSUARIO_EN.NombreCorto)
      UserImg.Src = oUSUARIO_EN.Foto
    Else
      Dim CertificadoCook As New HttpCookie("RH")
      oUSUARIO_EN.KeyAcceso = CertificadoCook.Values("id")
      oUSUARIO_EN = oUSUARIO_LN.LN_USUARIO_CARGA(oUSUARIO_EN)
      tx_UsuarioNombre.Text = LCase(oUSUARIO_EN.NombreCorto)
      UserImg.Src = oUSUARIO_EN.Foto
    End If

  End Sub

  'Private Sub bt_salir_ServerClick(sender As Object, e As EventArgs) Handles bt_salir.ServerClick
  '  'Dim CertificadoCook As New HttpCookie("DATACollector")
  '  'CertificadoCook.Values.Add("id", "")
  '  'CertificadoCook.Expires = DateTime.Now 'Expira en este momento
  '  'Response.AppendCookie(CertificadoCook)
  '  'Response.Redirect("login.aspx")
  'End Sub


End Class
