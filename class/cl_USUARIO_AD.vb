Imports ERPConnect.Utils

Public Class cl_USUARIO_AD

  Public Function AD_USUARIO_VALIDA(ByRef oUSUARIO_EN As cl_USUARIO_EN) As cl_USUARIO_EN
    ' Si El acceso es permitido, se devuelve un key tipo uniqueidentifier 
    ' de lo contrario un "" mismo que sirve para validar en el login
    Dim wcl_COMUN_AD As New cl_COMUN_AD
    Dim wdt_USUARIO_DT As DataTable
    Dim oUsuario_LN As New cl_USUARIO_LN
    ' valida contraseña SAP
    Dim trans As New Transaction()
    Dim bAccesoSAP As Boolean
    bAccesoSAP = wcl_COMUN_AD.SapValidaConexion(oUSUARIO_EN.LoginUsuario, oUSUARIO_EN.Password)

    If bAccesoSAP Then
      wcl_COMUN_AD.AgregaParametro("@v_LoginUsuario", "V", 30, oUSUARIO_EN.LoginUsuario)
      wcl_COMUN_AD.AgregaParametro("@v_Password", "V", 100, oUSUARIO_EN.Password)
      wdt_USUARIO_DT = wcl_COMUN_AD.EjecutaProcedure("root.S_USUARIO_ACCESO")
      oUSUARIO_EN.id = wdt_USUARIO_DT.Rows(0).Item("i_id")
      oUSUARIO_EN.KeyAcceso = wdt_USUARIO_DT.Rows(0).Item("v_KeyAcceso").ToString
    Else
      oUSUARIO_EN.id = -1
      oUSUARIO_EN.KeyAcceso = ""
    End If

    Return oUSUARIO_EN
  End Function

  Public Function AD_USUARIO_CARGA(ByRef oUSUARIO_EN As cl_USUARIO_EN) As cl_USUARIO_EN
    ' Carga la entidad con el Key generado en VALIDA_INGRESO
    '  Dim wcl_USUARIO_EN As New cl_USUARIO_EN
    Dim wcl_COMUN_AD As New cl_COMUN_AD
    Dim wdt_USUARIO_DT As DataTable

    wcl_COMUN_AD.AgregaParametro("@v_KeyAcceso", "V", 100, oUSUARIO_EN.KeyAcceso)
    wdt_USUARIO_DT = wcl_COMUN_AD.EjecutaProcedure("root.S_USUARIO_CARGA")

    If wdt_USUARIO_DT.Rows.Count > 0 Then
      oUSUARIO_EN.id = wdt_USUARIO_DT.Rows(0).Item("i_Usuario")
      oUSUARIO_EN.Codigo = wdt_USUARIO_DT.Rows(0).Item("i_Codigo")
      oUSUARIO_EN.LoginUsuario = wdt_USUARIO_DT.Rows(0).Item("v_LoginUsuario")
      oUSUARIO_EN.Documento = wdt_USUARIO_DT.Rows(0).Item("v_Documento")
      oUSUARIO_EN.EMail = wdt_USUARIO_DT.Rows(0).Item("v_EMail")
      oUSUARIO_EN.Descripcion = wdt_USUARIO_DT.Rows(0).Item("v_Descripcion")
      oUSUARIO_EN.NombreCorto = wdt_USUARIO_DT.Rows(0).Item("v_NombreCorto")
      oUSUARIO_EN.KeyAcceso = wdt_USUARIO_DT.Rows(0).Item("v_KeyAcceso").ToString
      oUSUARIO_EN.KeyAccesoFecha = wdt_USUARIO_DT.Rows(0).Item("d_KeyAccesoFecha")
      oUSUARIO_EN.Empresa = wdt_USUARIO_DT.Rows(0).Item("i_Empresa")
      oUSUARIO_EN.Sede = wdt_USUARIO_DT.Rows(0).Item("i_Sede")
      oUSUARIO_EN.Foto = wdt_USUARIO_DT.Rows(0).Item("Foto")
      oUSUARIO_EN.Periodo = wdt_USUARIO_DT.Rows(0).Item("v_periodo")
    Else
      oUSUARIO_EN.id = -1
      oUSUARIO_EN.LoginUsuario = ""
      oUSUARIO_EN.Documento = ""
      oUSUARIO_EN.EMail = ""
      oUSUARIO_EN.Descripcion = ""
      oUSUARIO_EN.KeyAcceso = ""
      oUSUARIO_EN.KeyAccesoFecha = Date.Now
      oUSUARIO_EN.Empresa = 0
      oUSUARIO_EN.Sede = 0
      oUSUARIO_EN.Foto = "#"
      oUSUARIO_EN.Periodo = ""
    End If
    Return oUSUARIO_EN

  End Function


End Class
