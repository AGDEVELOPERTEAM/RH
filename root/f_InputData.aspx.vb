Public Class f_InputData
  Inherits System.Web.UI.Page

  Dim oComun As New cl_COMUN_AD
  Dim oUSUARIO_EN As New cl_USUARIO_EN
  Dim oUSUARIO_LN As New cl_USUARIO_LN

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    Dim lCook As HttpCookie = Request.Cookies("DATACollector")
    oUSUARIO_EN.KeyAcceso = lCook.Values("id")
    oUSUARIO_EN = oUSUARIO_LN.LN_USUARIO_CARGA(oUSUARIO_EN)

    If Not IsPostBack() Then
      Dim dDataC As New DataTable
      Dim dDataT As New DataTable

      dDataC = oComun.EjecutaCadenaSQL("SELECT i_idParte , i_NumeroParte , numpar= cast( i_NumeroParte as varchar(5) ) + '  -  ' + Format (d_Fecha , 'dd.MM.yyyy' ) FROM data.ParteProduccionCab  WHERE i_Empresa=" & oUSUARIO_EN.Empresa & " AND i_Sede=" & oUSUARIO_EN.Sede & " AND c_ESTADO<>'CE'")
      dl_numpar.DataSource = dDataC
      dl_numpar.DataValueField = "i_idParte"
      dl_numpar.DataTextField = "numpar"
      dl_numpar.DataBind()
      tx_fecpte.Value = Format(DateTime.Now, "dd/mm/yyyy")
      tx_hora.Value = Format(DateTime.Now, "HH:mm")
      dl_numpar.SelectedIndex = (dDataC.Rows.Count - 1)
      BuscaCab()

      dDataT = oComun.EjecutaCadenaSQL("SELECT DISTINCT i_Proceso,v_procesoDescripcion FROM master.V_OBJETO_USUARIO_LISTA WHERE i_usuario=" & oUSUARIO_EN.id)
      dl_proceso.DataSource = dDataT
      dl_proceso.DataValueField = "i_Proceso"
      dl_proceso.DataTextField = "v_ProcesoDescripcion"
      dl_proceso.DataBind()

      If dDataT.Rows.Count = 1 Then
        dl_proceso.SelectedIndex = 0
        dv_Proceso.Visible = False
        CargaSubProcesos()
      Else
        dv_Proceso.Visible = True
      End If

    End If

  End Sub

  Private Sub bt_Proceso_ServerClick(sender As Object, e As EventArgs) Handles bt_Proceso.ServerClick
    CargaSubProcesos()
  End Sub

  Private Sub CargaSubProcesos()
    Dim dDataS As New DataTable
    dDataS = oComun.EjecutaCadenaSQL("Select distinct i_proceso,i_SubProceso,v_SubProcesoDescripcion FROM master.V_OBJETO_USUARIO_LISTA Where I_USUARIO=" & oUSUARIO_EN.id & " AND i_Proceso=" & dl_proceso.SelectedValue)
    dl_SubProceso.DataSource = dDataS
    dl_SubProceso.DataValueField = "i_SubProceso"
    dl_SubProceso.DataTextField = "v_SubProcesoDescripcion"
    dl_SubProceso.DataBind()
    If dDataS.Rows.Count = 1 Then
      dl_SubProceso.SelectedIndex = 0
      dv_SubProceso.Visible = False
      CargaDetalle()
    Else
      dv_SubProceso.Visible = True
    End If

  End Sub

  Private Sub bt_SubProceso_ServerClick(sender As Object, e As EventArgs) Handles bt_SubProceso.ServerClick
    CargaDetalle()
  End Sub

  Private Sub CargaDetalle()
    Dim dDataD As New DataTable
    lb_titgrd.Text = dl_proceso.SelectedItem.Text & "/" & dl_SubProceso.SelectedItem.Text
    dDataD = oComun.EjecutaCadenaSQL("Select * FROM master.V_OBJETO_USUARIO_LISTA Where I_USUARIO=" & oUSUARIO_EN.id & " AND i_Proceso=" & dl_proceso.SelectedValue & " AND i_SubProceso=" & dl_SubProceso.SelectedValue & " ORDER BY i_Orden")
    rpItems.DataSource = dDataD
    rpItems.DataBind()
  End Sub

  Private Sub bt_buscaOT_ServerClick(sender As Object, e As EventArgs) Handles bt_buscaOT.ServerClick
    BuscaCab()
  End Sub

  Private Sub BuscaCab()
    Dim dDataD As New DataTable
    dDataD = oComun.EjecutaCadenaSQL("Select * FROM data.ParteProduccionCab Where i_idParte=" & dl_numpar.SelectedValue)
    If dDataD.Rows.Count = 1 Then
      tx_fecpte.Value = Format(Date.Now, "dd/MM/yyy")
    Else
      tx_fecpte.Value = ""
    End If
  End Sub

  Private Sub bt_graba_ServerClick(sender As Object, e As EventArgs) Handles bt_graba.ServerClick
    Dim cNomCampo As String
    Dim iLinea As Integer
    Dim cValor As String
    Dim dDataR As DataTable
    Dim dDataD As New DataTable
    Try

      dDataD = oComun.EjecutaCadenaSQL("Select * FROM master.V_OBJETO_USUARIO_LISTA Where I_USUARIO=" & oUSUARIO_EN.id & " AND i_Proceso=" & dl_proceso.SelectedValue & " AND i_SubProceso=" & dl_SubProceso.SelectedValue & " ORDER BY i_Orden")

      oComun.AgregaParametro("@i_NumeroParte", "I", 10, dl_numpar.SelectedValue)
      oComun.AgregaParametro("@i_NumeroParteDet", "I", 10, 0)
      oComun.AgregaParametro("@i_Area", "I", 10, 0)
      oComun.AgregaParametro("@i_Proceso", "I", 10, dl_proceso.SelectedValue)
      oComun.AgregaParametro("@i_SubProceso", "I", 10, dl_SubProceso.SelectedValue)
      oComun.AgregaParametro("@i_Maquina", "I", 10, 0)
      oComun.AgregaParametro("@d_FechaReporte", "V", 30, tx_fecpte.Value & " " & tx_hora.Value)
      dDataR = oComun.EjecutaProcedure("data.S_PARTEPRODUCCION_DET_GRABA")
      iLinea = dDataR.Rows(0).Item("i_NumeroParteDet")
      oComun.Reset()

      For nItem = 0 To dDataD.Rows.Count - 1
        cNomCampo = "wcam_" & dDataD.Rows(nItem).Item("i_Objeto").ToString
        cValor = Request.Form(cNomCampo).ToString

        Select Case dDataD.Rows(nItem).Item("c_TipoDato")
            Case "NU"
            If IsNumeric(cValor) Then
              oComun.AgregaParametro("@i_NumeroParte", "I", 10, dl_numpar.SelectedValue)
              oComun.AgregaParametro("@i_NumeroParteDet", "I", 10, iLinea)
              oComun.AgregaParametro("@i_Objeto", "I", 10, dDataD.Rows(nItem).Item("i_Objeto").ToString)
              oComun.AgregaParametro("@i_ObjetoValor", "DE", 18, Val(cValor))
              oComun.AgregaParametro("@v_ObjetoValor", "V", 100, "")
              oComun.EjecutaProcedure("data.S_PARTEPRODUCCION_DAT_GRABA")
            End If
          Case "TX", "HR"
            If cValor <> "" Then
              oComun.AgregaParametro("@i_NumeroParte", "I", 10, dl_numpar.SelectedValue)
              oComun.AgregaParametro("@i_NumeroParteDet", "I", 10, iLinea)
              oComun.AgregaParametro("@i_Objeto", "I", 10, dDataD.Rows(nItem).Item("i_Objeto").ToString)
              oComun.AgregaParametro("@i_ObjetoValor", "DE", 18, 0)
              oComun.AgregaParametro("@v_ObjetoValor", "V", 500, cValor)
              oComun.EjecutaProcedure("data.S_PARTEPRODUCCION_DAT_GRABA")
            End If
        End Select



      Next
      Mensaje(Me.Page, "Actualizacion Satisfactoria !.", "DATACollector 1.0", "success")
    Catch ex As Exception
      Mensaje(Me.Page, "Error de Actualizacion, Por favor verifique su Informacion !.", "DATACollector 1.0", "error")
    End Try

  End Sub

  Private Sub bt_salir_ServerClick(sender As Object, e As EventArgs) Handles bt_salir.ServerClick
    Response.Redirect("default.aspx")
  End Sub

  Public Shared Sub Mensaje(ByVal page As Page, ByVal message As String, ByVal title As String, Optional ByVal type As String = "info", Optional ByVal clearToast As Boolean = False, Optional ByVal pos As String = "toast-top-center", Optional ByVal Sticky As Boolean = False)
    Dim toastrScript As String = [String].Format("Notify('{0}','{1}','{2}', '{3}', '{4}', '{5}');", message, title, type, clearToast, pos, Sticky)
    page.ClientScript.RegisterStartupScript(page.[GetType](), "toastr_message", toastrScript, addScriptTags:=True)
  End Sub


End Class
