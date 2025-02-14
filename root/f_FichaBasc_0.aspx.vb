Public Class f_FichaBasc_0
  Inherits System.Web.UI.Page

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    'Dim SGalleta As HttpCookie = Request.Cookies("RH")
    'Session("id") = SGalleta.Values("id")
    'Session("Documento") = SGalleta.Values("nd")
    'Session("Periodo") = SGalleta.Values("pe")
  End Sub

  Private Sub bt_TO_1_Click(sender As Object, e As EventArgs) Handles bt_TO_1.Click
    Dim sid As String = Request.QueryString("id")
    If sid <> "" Then
      Response.Redirect("f_DeclaracionJurada.aspx?id=" & sid)
    Else
      Response.Redirect("/login.aspx")
    End If
  End Sub

End Class
