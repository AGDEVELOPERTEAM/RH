Public Class cl_EMPRESA_LN

  Public Sub EmpresaUsuario_CargaCombo(ByRef oDropDown As DropDownList, ByVal i_ID_Usuario As String, ByVal cCodigoActual As String)
    Dim wcl_COMUN_AD As New cl_COMUN_AD
    wcl_COMUN_AD.CargaCombo("root.V_USUARIO_EMPRESA", "i_id_empresa", "v_RazonSocial", "i_id_usuario=" & i_ID_Usuario, oDropDown, cCodigoActual)
  End Sub

  Public Sub EmpresaServer_CargaCombo(ByRef oDropDown As DropDownList, ByVal i_ID_Empresa As String, ByVal cCodigoActual As String)
    Dim wcl_COMUN_AD As New cl_COMUN_AD
    wcl_COMUN_AD.CargaCombo("root.V_EMPRESA_SERVER", "i_id_server", "v_Descripcion", "i_id_empresa=" & i_ID_Empresa, oDropDown, cCodigoActual)
  End Sub



End Class
