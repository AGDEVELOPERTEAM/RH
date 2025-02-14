Public Class f_des_dp
  Inherits System.Web.UI.Page
  Dim oComun As New cl_COMUN_AD
  Dim dtUO As New DataTable
  Dim dtDP As New DataTable
  Dim dtPos As New DataTable

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    If Not IsPostBack Then
      dtUO = oComun.EjecutaCadenaSQL("SELECT NombreNodo=HIJ_DES,IdentificadorNodo=HIJ_COD,IdentificadorPadre=PAD_COD,TIP_OBJ FROM sap.V_STRUCTURA_ORG WHERE TIP_OBJ='O' ORDER BY HIJ_DES")
      tv_uo.Nodes.Clear()

      oComun.CargaCombo("data.DescripcionPuesto", "i_CodDP", "v_PuestoNombre", "", dl_DPS, "")

      CrearNodosDelPadre(10000001, Nothing)
      tv_uo.ExpandDepth = 2
    End If

  End Sub

  Private Sub CrearNodosDelPadre(ByVal indicePadre As Integer, ByVal nodePadre As TreeNode)

    Dim dataViewHijos As DataView
    ' Crear un DataView con los Nodos que dependen del Nodo padre pasado como parámetro.
    dataViewHijos = New DataView(dtUO)

    dataViewHijos.RowFilter = dtUO.Columns("IdentificadorPadre").ColumnName + " = " + indicePadre.ToString()

    ' Agregar al TreeView los nodos Hijos que se han obtenido en el DataView.
    For Each dataRowCurrent As DataRowView In dataViewHijos

      Dim nuevoNodo As New TreeNode
      nuevoNodo.Text = dataRowCurrent("NombreNodo").ToString().Trim()
      nuevoNodo.Value = dataRowCurrent("TIP_OBJ").ToString() & dataRowCurrent("IdentificadorNodo").ToString()

      Select Case dataRowCurrent("TIP_OBJ").ToString().Trim()
        Case "O"
          nuevoNodo.ImageUrl = "icoTree/baseline_folder_shared_black_18dp.png"
        Case "S"
          nuevoNodo.ImageUrl = "icoTree/baseline_person_black_18dp.png"
      End Select

      ' si el parámetro nodoPadre es nulo es porque es la primera llamada, son los Nodos
      ' del primer nivel que no dependen de otro nodo.
      If nodePadre Is Nothing Then
        tv_uo.Nodes.Add(nuevoNodo)
      Else
        ' se añade el nuevo nodo al nodo padre.
        nodePadre.ChildNodes.Add(nuevoNodo)
      End If

      ' Llamada recurrente al mismo método para agregar los Hijos del Nodo recién agregado.
      CrearNodosDelPadre(Int32.Parse(dataRowCurrent("IdentificadorNodo").ToString()), nuevoNodo)
    Next dataRowCurrent

  End Sub

  Private Sub tv_uo_SelectedNodeChanged(sender As Object, e As EventArgs) Handles tv_uo.SelectedNodeChanged
    Dim cItem As String = Mid(tv_uo.SelectedNode.Value, 2, 20).Trim

    oComun.AgregaParametro("@UNIORG", "V", 20, cItem)
    dtPos = oComun.EjecutaProcedure("data.S_POSICION_UO_CARGA")
    gv_Posiciones.DataSource = dtPos
    gv_Posiciones.DataBind()
    up_PPos.DataBind()
  End Sub

  Private Sub bt_Asi_Graba_Click(sender As Object, e As EventArgs) Handles bt_Asi_Graba.Click
    Dim cItem As String = Mid(tv_uo.SelectedNode.Value, 2, 20).Trim

    If Not IsNothing(gv_Posiciones.SelectedRow) Then
      Dim wCODPUE As String = ""
      Dim wCODDP As String = ""
      wCODPUE = gv_Posiciones.SelectedRow.Cells(2).Text
      wCODDP = dl_DPS.SelectedValue

      oComun.AgregaParametro("@v_Posicion", "V", 50, wCODPUE)
      oComun.AgregaParametro("@i_CodDP", "I", 10, wCODDP)
      oComun.EjecutaTransaccion("data.s_PosicionDP_Graba")

    End If

    oComun.Reset()
    oComun.AgregaParametro("@UNIORG", "V", 20, cItem)
    dtPos = oComun.EjecutaProcedure("data.S_POSICION_UO_CARGA")
    gv_Posiciones.DataSource = dtPos

    up_PPos.DataBind()


  End Sub
End Class
