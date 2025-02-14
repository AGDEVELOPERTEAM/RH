Imports ERPConnect

Public Class f_CesePago
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
    End If

  End Sub

  Private Sub CargaData()
    Dim dDataD As DataTable
    Dim dDataU As DataTable
    Dim dDataT As DataTable

    Dim sPlantas As String = ""
    Dim con As R3Connection
    Dim iImpLiq As Decimal = 0
    con = oComun.SapConexion("")


    con.Open(False)
    Dim sii As String = con.Codepage()
    ' Create a function object 



    'oComun.CargaCombo("data.ViaPago", "VIA_PAGO", "VIA_PAGO_DES", "",, "", "")
    dDataT = oComun.EjecutaCadenaSQL("SELECT * FROM data.ViaPago")


    dDataU = oComun.EjecutaCadenaSQL("SELECT v_PlantasF47 FROM root.Usuario WHERE v_LoginUsuario='" & oUSUARIO_EN.LoginUsuario & "'")
    If dDataU.Rows.Count > 0 Then
      sPlantas = dDataU.Rows(0).Item("v_PlantasF47").ToString
    End If

    dDataD = oComun.EjecutaCadenaSQL("SELECT DISTINCT * FROM cese.Lista WHERE Estado='A'  AND CHARINDEX(SEDE_COD, '" & sPlantas & "' )>0  ORDER BY BEGDA")

    gv_Liquidaciones.DataSource = dDataD
    gv_Liquidaciones.DataBind()
  End Sub

  Private Sub bt_execute_ServerClick(sender As Object, e As EventArgs) Handles bt_execute.ServerClick
    Dim bSelect As Boolean
    Dim ccodtrb As String
    Dim cnomtrb As String
    Dim cacreed As String
    Dim cDocumento As String
    Dim cFecdoc As String
    Dim cBEGDA As String
    Dim cMoneda As String
    Dim nImport As Double
    Dim cFmaPag As String

    Dim oComun As New cl_COMUN_AD
    Dim nItm As Integer = 0
    For Each oRow As GridViewRow In gv_Liquidaciones.Rows
      ccodtrb = CType(oRow.FindControl("lbl_CodTrb"), Label).Text
      cnomtrb = CType(oRow.FindControl("lbl_nomtrb"), Label).Text
      cacreed = CType(oRow.FindControl("lbl_Acreed"), Label).Text
      cBEGDA = CType(oRow.FindControl("lbl_begda"), Label).Text
      cMoneda = CType(oRow.FindControl("lbl_Moneda"), Label).Text
      nImport = CType(oRow.FindControl("lbl_Import"), Label).Text
      bSelect = CType(oRow.FindControl("ck_Select"), CheckBox).Checked
      cFmaPag = CType(oRow.FindControl("ddl_fmapag"), DropDownList).SelectedValue


      If bSelect Then
        oComun.Reset()

        'cFecdoc = Mid(cFecdoc, 7, 2) & "." & Mid(cFecdoc, 5, 2) & "." & Mid(cFecdoc, 1, 4)   'Now.ToString("dd.MM.yyyy")
        cFecdoc = Now.ToString("dd.MM.yyyy")

        If cFmaPag <> "R" Then
          cDocumento = oComun.GeneraAnticipo(cFecdoc, "K2", "AG10",
                                             cFecdoc, Mid(cFecdoc, 4, 2), cMoneda,
                                             Mid("LBS-" + cnomtrb, 1, 16),
                                             Mid("LBS-" + cnomtrb, 1, 25),
                                             cacreed, "S", nImport,
                                             cFmaPag, "LBS.CES:" & cBEGDA, oUSUARIO_EN.LoginUsuario)
        Else
          cDocumento = "DOCUM000000000000"
        End If


        If Mid(cDocumento, 1, 5) = "DOCUM" Then
          If IsNumeric(Mid(cDocumento, 7, 10)) Then
            oComun.Reset()
            oComun.AgregaParametro("@pernr", "C", 8, ccodtrb)
            oComun.AgregaParametro("@begda", "C", 8, cBEGDA)
            oComun.AgregaParametro("@aprobador", "C", 8, oUSUARIO_EN.Codigo)
            oComun.AgregaParametro("@numdocsap", "V", 20, Mid(cDocumento, 7, 10))
            oComun.AgregaParametro("@FmaPago", "C", 1, cFmaPag)
            oComun.AgregaParametro("@SAPMsg", "V", 500, cDocumento)
            oComun.EjecutaProcedure("[cese].[S_GrabaSolicitudAnticipo]")
          End If
        Else
          oComun.Reset()
          oComun.AgregaParametro("@pernr", "C", 8, ccodtrb)
          oComun.AgregaParametro("@begda", "C", 8, cBEGDA)
          oComun.AgregaParametro("@SAPMsg", "V", 500, cDocumento)
          oComun.EjecutaProcedure("[cese].S_GrabaSolicitudAnticipo_SAPMSG")
        End If


      End If


    Next

    CargaData()

  End Sub

End Class
