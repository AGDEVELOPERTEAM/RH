Public Class home
  Inherits System.Web.UI.Page
  Dim oUSUARIO_EN As New cl_USUARIO_EN
  Dim oUSUARIO_LN As New cl_USUARIO_LN
  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    Dim SGalleta As HttpCookie = Request.Cookies("RH")

    Try
      oUSUARIO_EN.KeyAcceso = SGalleta.Values("id")
      oUSUARIO_EN = oUSUARIO_LN.LN_USUARIO_CARGA(oUSUARIO_EN)

      Session("id") = SGalleta.Values("id")
      Session("Documento") = SGalleta.Values("nd")
      Session("Periodo") = SGalleta.Values("pe")

    Catch ex As Exception
      Response.Redirect("login.aspx")
    End Try
    If oUSUARIO_EN.KeyAcceso = "" Then
      Response.Redirect("login.aspx")
    End If

  End Sub

End Class
