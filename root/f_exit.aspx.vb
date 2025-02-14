Public Class f_exit
  Inherits System.Web.UI.Page

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    Dim CertificadoCook As New HttpCookie("DATACollector")
    CertificadoCook.Values.Add("id", "")
    CertificadoCook.Expires = DateTime.Now 'Expira en este momento
    Response.AppendCookie(CertificadoCook)
    Response.Redirect("../login.aspx")
  End Sub

End Class
