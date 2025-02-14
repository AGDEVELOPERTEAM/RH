Imports System
Imports System.Linq
Imports System.Xml.Linq


Public Class hmap
  Inherits System.Web.UI.Page

  Public Property Zoom As Integer

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    Zoom = 14
  End Sub

  Protected Sub BtnGoClick(ByVal sender As Object, ByVal e As EventArgs)
    'Const welcome As String = "Bienvenid@ a {0}"
  End Sub

End Class
