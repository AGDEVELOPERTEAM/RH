Imports System.Security.Cryptography

Public Class f_FichaBasc
  Inherits System.Web.UI.Page
  Dim oUSUARIO_EN As New cl_USUARIO_EN
  Dim oUSUARIO_LN As New cl_USUARIO_LN
  Dim sid As String

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    Dim oComun As New cl_COMUN_AD
    Dim dtItems As New DataTable

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


    oComun.AgregaParametro("@numdni", "C", 10, Session("Documento"))
    dtItems = oComun.EjecutaProcedure("basc.S_Ficha_Periodos")

    rpItems.DataSource = dtItems
    rpItems.DataBind()

  End Sub

  Public Sub bt_EDITA(sender As Object, e As EventArgs)
    Dim sid As String
    Dim btnSelect As Button = CType(sender, Button)
    Dim commandArguments() As String = btnSelect.CommandArgument.Split(",")
    Dim wPeriodo As String
    wPeriodo = commandArguments(0)

    sid = Request.QueryString("id")
    If sid <> "" Then
      Response.Redirect("f_FichaBasc_0.aspx?id=" & sid)
    End If


  End Sub
End Class
