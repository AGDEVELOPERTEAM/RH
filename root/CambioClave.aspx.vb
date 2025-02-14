Public Class CambioClave
  Inherits System.Web.UI.Page

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

  End Sub

  Private Sub bt_Aceptar_Click(sender As Object, e As EventArgs) Handles bt_Aceptar.Click
    Dim oComun As New cl_COMUN_AD
    Dim dtUSER As DataTable
    oComun.AgregaParametro("@v_LoginUsuario", "V", 30, tx_usuario.Value)
    oComun.AgregaParametro("@v_Password", "V", 100, tx_usuario_psw.Value)
    dtUSER = oComun.EjecutaProcedure("root.S_USUARIO_ACCESO")
    If dtUSER.Rows(0).Item("i_id") <> -1 Then
      oComun.AgregaParametro("@v_LoginUsuario", "V", 30, tx_usuario.Value)
      oComun.AgregaParametro("@v_Password", "V", 100, tx_usuario_psw.Value)
      oComun.AgregaParametro("@v_PasswordNew", "V", 100, tx_usuario_pswnew.Value)
      dtUSER = oComun.EjecutaProcedure("root.S_USUARIO_CAMBIA_CLAVE")
      If dtUSER.Rows(0).Item("stat") = 1 Then
        Mensaje(Me.Page, "Actualizacion Confirmada !.", "RH", "success")
        'Response.Redirect("login.aspx")
      Else
        Mensaje(Me.Page, "Error de actualizacion.", "RH", "error")
      End If
    Else
      Mensaje(Me.Page, "Error , contraseña incorrecta !.", "RH", "error")
    End If

  End Sub

  Public Shared Sub Mensaje(ByVal page As Page, ByVal message As String, ByVal title As String, Optional ByVal type As String = "info", Optional ByVal clearToast As Boolean = False, Optional ByVal pos As String = "toast-top-center", Optional ByVal Sticky As Boolean = False)
    Dim toastrScript As String = [String].Format("Notify('{0}','{1}','{2}', '{3}', '{4}', '{5}');", message, title, type, clearToast, pos, Sticky)
    page.ClientScript.RegisterStartupScript(page.[GetType](), "toastr_message", toastrScript, addScriptTags:=True)
  End Sub

End Class
