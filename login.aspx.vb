Public Class login
  Inherits System.Web.UI.Page
  Dim oUsuario_EN As New cl_USUARIO_EN
  Dim oUsuario_LN As New cl_USUARIO_LN
  Dim oEmpresa_LN As New cl_EMPRESA_LN

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    Dim CertificadoCook As New HttpCookie("RH")
    CertificadoCook.Values.Add("id", "")
    CertificadoCook.Values.Add("nd", "")
    CertificadoCook.Values.Add("pe", "")
    'CertificadoCook.Expires = DateTime.MaxValue 'Expira en este momento
    Response.AppendCookie(CertificadoCook)

    'Request.Cookies.Remove("RH")

  End Sub

  Private Sub bt_Valida_Click(sender As Object, e As EventArgs) Handles bt_Valida.Click
    Dim oComun As New cl_COMUN_AD
    oUsuario_EN.LoginUsuario = tx_email.Value
    oUsuario_EN.Password = tx_password.Value
    oUsuario_EN = oUsuario_LN.LN_USUARIO_VALIDA(oUsuario_EN)

    If oUsuario_EN.KeyAcceso <> "" Then

      oUsuario_EN = oUsuario_LN.LN_USUARIO_CARGA(oUsuario_EN)
      Session("Documento") = oUsuario_EN.Documento
      Session("usuario_en") = oUsuario_EN
      Session("Periodo") = ""

      Dim CertificadoCook As New HttpCookie("RH")
      CertificadoCook.Values.Add("id", oUsuario_EN.KeyAcceso)
      CertificadoCook.Values.Add("nd", oUsuario_EN.Documento)
      CertificadoCook.Values.Add("us", oUsuario_EN.LoginUsuario)
      CertificadoCook.Values.Add("pe", "")
      Response.AppendCookie(CertificadoCook)

      Mensaje(Me.Page, "Acceso Autorizado !.", "RH", "success")
      Response.Redirect("root\default.aspx?id=" & oUsuario_EN.KeyAcceso)

    Else

      Mensaje(Me.Page, "Contraseña Incorrecta, por favor reintente.", "HR", "error")
    End If
  End Sub

  Public Shared Sub Mensaje(ByVal page As Page, ByVal message As String, ByVal title As String, Optional ByVal type As String = "info", Optional ByVal clearToast As Boolean = False, Optional ByVal pos As String = "toast-top-center", Optional ByVal Sticky As Boolean = False)
    Dim toastrScript As String = [String].Format("Notify('{0}','{1}','{2}', '{3}', '{4}', '{5}');", message, title, type, clearToast, pos, Sticky)
    page.ClientScript.RegisterStartupScript(page.[GetType](), "toastr_message", toastrScript, addScriptTags:=True)
  End Sub




End Class
