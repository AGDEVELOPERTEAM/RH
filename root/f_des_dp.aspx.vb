Public Class f_des_dp1
  Inherits System.Web.UI.Page
  Dim oComun As New cl_COMUN_AD
  Dim dtSkill As New DataTable
  Dim tGen As New DataTable

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    If Not IsPostBack Then
      oComun.CargaCombo("data.AccionesDP", "i_AccCod", "v_AccDes", "", dl_Acc01, "")
      oComun.CargaCombo("data.AccionesDP", "i_AccCod", "v_AccDes", "", dl_Acc02, "")
      oComun.CargaCombo("data.AccionesDP", "i_AccCod", "v_AccDes", "", dl_Acc03, "")
      oComun.CargaCombo("data.AccionesDP", "i_AccCod", "v_AccDes", "", dl_Acc04, "")
    End If

  End Sub

  Private Sub bt_graba_Click(sender As Object, e As EventArgs) Handles bt_graba.Click




  End Sub

  Private Sub bt_Buscar_Click(sender As Object, e As EventArgs) Handles bt_Buscar.Click
    If t_CodDP.Value = "" Then
      t_CodDP.Value = 0
    End If
    oComun.AgregaParametro("@i_CodDP", "I", 10, t_CodDP.Value)
    tGen = oComun.EjecutaProcedure("data.S_DescripcionPuesto_Carga")
    If tGen.Rows.Count = 1 Then
      t_DesPuesto.Value = tGen.Rows(0).Item("v_PuestoNombre")
      t_DesGeneral.Value = tGen.Rows(0).Item("v_Descripcion")


      dtSkill = oComun.EjecutaCadenaSQL("SELECT NombreNodo=V_DESSTR,IdentificadorNodo=i_CODSTR,IdentificadorPadre=i_CODDAD FROM [data].[Competencia]")
      tv_Str.Nodes.Clear()

      CrearNodos(0, Nothing)
      tv_Str.ExpandAll()


    End If

  End Sub

  Private Sub bt_ItmEsp_Graba_Click(sender As Object, e As EventArgs) Handles bt_ItmEsp_Graba.Click


    oComun.AgregaParametro("@i_CodDP", "I", 10, t_CodDP.Value)
    oComun.AgregaParametro("@v_PuestoNombre", "V", 100, t_DesPuesto.Value)
    oComun.AgregaParametro("@v_Descripcion", "V", 5000, t_DesGeneral.Value)
    oComun.AgregaParametro("@i_Jefatura", "I", 10, 0)
    tGen = oComun.EjecutaProcedure("data.S_DescripcionPuesto_Graba")


    oComun.AgregaParametro("@i_CodDP", "I", 10, t_CodDP.Value)
    oComun.AgregaParametro("@i_Itm", "I", 10, 0)
    oComun.AgregaParametro("@i_AccCod_01", "I", 10, dl_Acc01.SelectedValue)
    oComun.AgregaParametro("@i_AccCod_02", "I", 10, dl_Acc02.SelectedValue)
    oComun.AgregaParametro("@i_AccCod_03", "I", 10, dl_Acc03.SelectedValue)
    oComun.AgregaParametro("@i_AccCod_04", "I", 10, dl_Acc04.SelectedValue)
    oComun.AgregaParametro("@v_DescEspec", "V", 500, t_DesEspe.Value)
    oComun.EjecutaTransaccion("Data.S_DescripcionPuesto_Esp_Graba")


  End Sub

  Private Sub CrearNodos(ByVal indicePadre As Integer, ByVal nodePadre As TreeNode)

    Dim dataViewHijos As DataView
    ' Crear un DataView con los Nodos que dependen del Nodo padre pasado como parámetro.
    dataViewHijos = New DataView(dtSkill)

    dataViewHijos.RowFilter = dtSkill.Columns("IdentificadorPadre").ColumnName + " = " + indicePadre.ToString()

    ' Agregar al TreeView los nodos Hijos que se han obtenido en el DataView.
    For Each dataRowCurrent As DataRowView In dataViewHijos

      Dim nuevoNodo As New TreeNode
      nuevoNodo.Text = dataRowCurrent("NombreNodo").ToString().Trim()
      nuevoNodo.Value = dataRowCurrent("IdentificadorNodo").ToString()


      ' si el parámetro nodoPadre es nulo es porque es la primera llamada, son los Nodos
      ' del primer nivel que no dependen de otro nodo.
      If nodePadre Is Nothing Then
        tv_Str.Nodes.Add(nuevoNodo)
      Else
        ' se añade el nuevo nodo al nodo padre.
        nodePadre.ChildNodes.Add(nuevoNodo)
      End If

      ' Llamada recurrente al mismo método para agregar los Hijos del Nodo recién agregado.
      CrearNodos(Int32.Parse(dataRowCurrent("IdentificadorNodo").ToString()), nuevoNodo)
    Next dataRowCurrent

  End Sub

  Private Sub bt_Frm_Com_Graba_Click(sender As Object, e As EventArgs) Handles bt_Frm_Com_Graba.Click
    Dim wc As Integer = 0

    oComun.AgregaParametro("@i_CodDP", "I", 10, t_CodDP.Value)
    oComun.AgregaParametro("@I_CodStr", "I", 10, 0)
    oComun.EjecutaTransaccion("data.S_DescripcionPuesto_Com_Graba")

    For Each nNode In tv_Str.CheckedNodes
      wc = nNode.value
      oComun.AgregaParametro("@i_CodDP", "I", 10, t_CodDP.Value)
      oComun.AgregaParametro("@I_CodStr", "I", 10, wc)
      oComun.EjecutaTransaccion("data.S_DescripcionPuesto_Com_Graba")
    Next

  End Sub

End Class
