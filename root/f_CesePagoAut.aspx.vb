Imports ERPConnect

Public Class f_CesePagoAut
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

    If Not IsPostBack Then
      CargaData()
    Else
      GrabaData()
    End If

  End Sub

  Private Sub CargaData()
    Dim dDataD As DataTable
    Dim dDataU As DataTable
    Dim sPlantas As String = ""

    Dim con As R3Connection
    Dim iImpLiq As Decimal
    con = oComun.SapConexion("")

    dDataU = oComun.EjecutaCadenaSQL("SELECT v_PlantasACargo FROM root.Usuario WHERE v_LoginUsuario='" & oUSUARIO_EN.LoginUsuario & "'")
    If dDataU.Rows.Count > 0 Then
      sPlantas = dDataU.Rows(0).Item("v_PlantasACargo").ToString
    End If



    con.Open(False)
    Dim sii As String = con.Codepage()
    ' Create a function object
    Dim func = con.CreateFunction("Z_HCC_LEER_CLUSTER")

    dDataD = oComun.EjecutaCadenaSQL("SELECT * FROM cese.Lista WHERE Estado='P' AND CHARINDEX(SEDE_COD, '" & sPlantas & "' )>0 ORDER BY BEGDA")

    For iRegistro = 0 To dDataD.Rows.Count - 1

      func.Exports("P_PERNR").ParamValue = dDataD.Rows(iRegistro).Item("PERNR").ToString
      func.Exports("P_BEGDA").ParamValue = dDataD.Rows(iRegistro).Item("FechaCese").ToString
      func.Exports("P_ENDDA").ParamValue = dDataD.Rows(iRegistro).Item("FechaCese").ToString
      func.Exports("P_OCRSN").ParamValue = "ZLBS"

      If dDataD.Rows(iRegistro).Item("Sede_COD").ToString = "1000" Then
        func.Exports("P_LGART").ParamValue = "6TV3"
      Else
        func.Exports("P_LGART").ParamValue = "/55X"
      End If

      Try
        func.Execute()
        If func.Tables(8).Rows.Count > 0 Then
          iImpLiq = func.Tables(8).Rows(0).Item("BETRG")
        Else
          iImpLiq = 0
        End If
      Catch ex As ERPException
        iImpLiq = -1
      End Try
      If iImpLiq <> 0 Then
        dDataD.Rows(iRegistro).SetField("Importe", Format(iImpLiq, "##,##0.00"))
      Else
        dDataD.Rows(iRegistro).Delete()
      End If

    Next

    gv_Liquidaciones.DataSource = dDataD
    gv_Liquidaciones.DataBind()
  End Sub

  Private Sub GrabaData()

    'Dim bSelect As Boolean
    Dim cAccion As String
    Dim ccodtrb As String
    Dim cnomtrb As String
    Dim cacreed As String
    Dim cDocumento As String = ""
    Dim cBEGDA As String
    Dim cMoneda As String
    Dim nImport As Double

    Dim oComun As New cl_COMUN_AD
    Dim nItm As Integer = 0

    For Each oRow As GridViewRow In gv_Liquidaciones.Rows
      ccodtrb = CType(oRow.FindControl("lbl_CodTrb"), Label).Text
      cnomtrb = CType(oRow.FindControl("lbl_nomtrb"), Label).Text
      cacreed = CType(oRow.FindControl("lbl_Acreed"), Label).Text
      cBEGDA = CType(oRow.FindControl("lbl_begda"), Label).Text
      cMoneda = CType(oRow.FindControl("lbl_Moneda"), Label).Text
      nImport = CType(oRow.FindControl("lbl_Import"), Label).Text
      cAccion = CType(oRow.FindControl("ddl_accion"), DropDownList).SelectedValue

      If cAccion <> "-" Then
        oComun.Reset()
        oComun.AgregaParametro("@pernr", "C", 8, ccodtrb)
        oComun.AgregaParametro("@begda", "C", 8, cBEGDA)
        oComun.AgregaParametro("@moneda", "C", 3, cMoneda)
        oComun.AgregaParametro("@importe", "N", 18, nImport)
        oComun.AgregaParametro("@aprobador", "C", 8, oUSUARIO_EN.Codigo)
        oComun.AgregaParametro("@estado", "C", 1, cAccion)
        oComun.EjecutaProcedure("[cese].[S_GrabaSolicitudAnticipo_Autorizacion]")

        If cAccion = "P" Then

        End If

      End If
    Next

  End Sub


  Private Sub bt_execute_ServerClick(sender As Object, e As EventArgs) Handles bt_execute.ServerClick
    'Dim cSelect As Control

    CargaData()

  End Sub



End Class
