Public Class mae_FichaPersonal
  Inherits System.Web.UI.Page

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    Dim ocomun As New cl_COMUN_AD
    Dim cAccion As String = ""


    cAccion = Request.QueryString("download")

    If cAccion = "1" Then
      Dim dtMAEPER As DataTable
      Dim dNomArchivoExpo As DateTime = DateTime.Now
      Dim cNomArchivoExpo As String = "MaestroPersonal_" & dNomArchivoExpo.ToString("yyyyMMddHHmm")

      If cbx_activos.Checked Then
        dtMAEPER = ocomun.EjecutaCadenaSQL("SELECT * FROM [sap].[V_MaestroPersonal_Export] WHERE ESTADO='A'")
      Else
        dtMAEPER = ocomun.EjecutaCadenaSQL("SELECT * FROM [sap].[V_MaestroPersonal_Export]")
      End If

      wdg_MaestroPer.DataSource = dtMAEPER
      wdg_MaestroPer.DataBind()

      wex_MaestroPer.DownloadName = cNomArchivoExpo
      wex_MaestroPer.Export(wdg_MaestroPer)
    End If



  End Sub

End Class
