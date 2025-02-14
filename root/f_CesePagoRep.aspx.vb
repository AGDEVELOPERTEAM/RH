Imports ERPConnect
Public Class f_CesePagoRep
  Inherits System.Web.UI.Page
  Dim oUSUARIO_EN As New cl_USUARIO_EN
  Dim oUSUARIO_LN As New cl_USUARIO_LN
  Dim oComun As New cl_COMUN_AD

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    Dim sid As String
    sid = Request.QueryString("id")
    If sid <> "" Then
      oUSUARIO_EN.KeyAcceso = sid
      oUSUARIO_EN = oUSUARIO_LN.LN_USUARIO_CARGA(oUSUARIO_EN)
    End If


    If sid = "" Or oUSUARIO_EN.KeyAcceso = "" Then
      Response.Redirect("..\login.aspx")
    End If

    CargaDataRep()


  End Sub

  Private Sub CargaCombos()
    Dim oDSTrab As New DataTable
    'oCombo.DataSource = oDSData
    'oCombo.DataValueField = cCAMCOD
    'oCombo.DataTextField = cCAMDES
    'oCombo.Databind
    'sel_traba
  End Sub

  Private Sub CargaDataRep()
    Dim dDataD As DataTable
    Dim dDataU As DataTable
    Dim sPlantas As String = ""
    Dim wSede As String = ""
    Dim wPlan As String = ""
    Dim wTrab As String = ""

    dDataU = oComun.EjecutaCadenaSQL("SELECT v_PlantasConsulta FROM root.Usuario WHERE v_LoginUsuario='" & oUSUARIO_EN.LoginUsuario & "'")
    If dDataU.Rows.Count > 0 Then
      sPlantas = dDataU.Rows(0).Item("v_PlantasConsulta").ToString
    End If
    'dDataD = oComun.EjecutaCadenaSQL("SELECT * FROM cese.Lista WHERE Estado='S'  AND CHARINDEX(SEDE_COD, '" & sPlantas & "' )>0  ORDER BY BEGDA")

    oComun.AgregaParametro("@wUser", "V", 30, oUSUARIO_EN.LoginUsuario)
    oComun.AgregaParametro("@wSede", "V", 4, sel_sede.Value)
    oComun.AgregaParametro("@wPlanilla", "V", 2, sel_tippla.Value)
    oComun.AgregaParametro("@wTrabajador", "V", 10, sel_traba.Value)
    oComun.AgregaParametro("@wFechaIni", "C", 8, dt_fecini.Value)
    oComun.AgregaParametro("@wFechaFin", "C", 8, dt_fecfin.Value)
    dDataD = oComun.EjecutaProcedure("cese.S_LOAD_Anticipo_Pagados")


    gv_Liquidaciones.DataSource = dDataD
    gv_Liquidaciones.DataBind()
  End Sub


End Class
