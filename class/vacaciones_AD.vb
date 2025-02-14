Imports ERPConnect
Imports ERPConnect.Utils

Public Class vacaciones_AD

  Public Function GetSolicitud(oVacaciones As vacaciones_EN) As vacaciones_EN
    Dim EN_Solicitud As New vacaciones_EN
    Dim DT_solicitudes As New DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@ID", "V", 50, oVacaciones.id)
    Try
      DT_solicitudes = o_Comun.EjecutaProcedure("pa_lis_Solicitud")
      If DT_solicitudes.Rows.Count = 1 Then
        With DT_solicitudes.Rows(0)
          EN_Solicitud.id = .Item("ID").ToString
          EN_Solicitud.codtrb = .Item("pernr").ToString
          EN_Solicitud.numdoc = .Item("docnr").ToString
          EN_Solicitud.candia = .Item("kaltg").ToString
          EN_Solicitud.fecdoc = .Item("aedtm").ToString
          EN_Solicitud.fecini = .Item("begda").ToString
          EN_Solicitud.fecfin = .Item("endda").ToString
          EN_Solicitud.estado = .Item("estsol").ToString
          EN_Solicitud.observ = .Item("observ").ToString

        End With
      End If
    Catch ex As Exception
      MsgBox(ex.Message)
      Return EN_Solicitud
    End Try
    Return EN_Solicitud

  End Function

  Public Function GetListaVacacionesConsumoContingente(oUser As usuario_EN) As DataTable
    Dim DT_vacaciones As DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@pernr", "I", 6, oUser.PERNR)
    DT_vacaciones = o_Comun.EjecutaProcedure("pa_lis_Vacaciones_ConsumoContingente")
    Return DT_vacaciones
  End Function

  Public Function GetListaVacacionesPendientesArea(oUser As usuario_EN) As DataTable
    Dim DT_vacaciones As DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@codjef", "I", 6, oUser.PERNR)
    DT_vacaciones = o_Comun.EjecutaProcedure("pa_lis_vacaciones_PendientesArea")
    Return DT_vacaciones
  End Function


  Public Function GetListaVacacionesPendientesTope(oUser As usuario_EN) As DataTable
    Dim DT_vacaciones As DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@anodes", "V", 50, "")
    o_Comun.AgregaParametro("@dessed", "V", 50, "")
    DT_vacaciones = o_Comun.EjecutaProcedure("pa_lis_vacaciones_PendientesTope")
    Return DT_vacaciones
  End Function

  Public Function GetListaSolicitudVacaciones(oUser As cl_USUARIO_EN) As DataTable
    Dim DT_solicitudes As DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@codtrb", "I", 6, oUser.Codigo)
    DT_solicitudes = o_Comun.EjecutaProcedure("vacaciones.S_Vacaciones_Solicitudes_Lista")
    Return DT_solicitudes
  End Function

  Public Function GetListaSolicitudVacacionesPorAutorizar(oUser As cl_USUARIO_EN) As DataTable
    Dim DT_solicitudes As DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@JefeCod", "I", 8, oUser.Codigo)
    DT_solicitudes = o_Comun.EjecutaProcedure("vacaciones.S_Vacaciones_Solicitudes_PendientesPorAutorizar")
    Return DT_solicitudes
  End Function

  Public Function GetListaSolicitudVacacionesUltima(cUsuario As String) As DataTable
    Dim DT_solicitudes As DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@codtrb", "I", 6, cUsuario)
    DT_solicitudes = o_Comun.EjecutaProcedure("pa_lis_vacaciones_Solicitudes_Ultima")
    Return DT_solicitudes
  End Function

  Public Function GetListaVacacionesPorAprobar(oUser As usuario_EN) As DataTable
    Dim DT_solicitudes As DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@codtrb", "I", 6, oUser.PERNR)
    DT_solicitudes = o_Comun.EjecutaProcedure("vacaciones.S_Vacaciones_Solicitudes_PorAprobar")
    Return DT_solicitudes
  End Function

  Public Function GetListaVacacionesPendientesTrabajador(oUser As usuario_EN, ByVal cTipoUsr As String) As DataTable
    Dim DT_vacaciones As DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@codtrb", "I", 6, oUser.PERNR)
    o_Comun.AgregaParametro("@tipusr", "C", 1, cTipoUsr)
    DT_vacaciones = o_Comun.EjecutaProcedure("pa_lis_vacaciones_PendientesTrabajador")
    Return DT_vacaciones
  End Function

  Public Function GetListaVacacionesworkflow(oUser As usuario_EN) As DataTable
    Dim DT_solicitudes As DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@codtrb", "I", 6, oUser.PERNR)
    DT_solicitudes = o_Comun.EjecutaProcedure("pa_lis_workflowTrabajador")
    Return DT_solicitudes
  End Function

  Public Function GetListaVacacionesSaldos(oUser As cl_USUARIO_EN) As DataTable
    Dim DT_solicitudes As DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@codtrb", "I", 8, oUser.Codigo)
    DT_solicitudes = o_Comun.EjecutaProcedure("vacaciones.S_Vacaciones_Saldo")
    Return DT_solicitudes
  End Function

  Public Function GetSolicitudVacacionesLista(oVacaciones As vacaciones_EN) As DataTable
    Dim DT_solicitudes As DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@codtrb", "I", 6, 0)
    o_Comun.AgregaParametro("@id", "V", 50, oVacaciones.id)
    DT_solicitudes = o_Comun.EjecutaProcedure("pa_lis_vacaciones_Solicitudes")
    Return DT_solicitudes
  End Function

  Public Function GetListaVacacionesCronograma(cMes As String, cAno As String, cJefe As String) As DataTable
    Dim DT_solicitudes As DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@cMes", "C", 2, cMes)
    o_Comun.AgregaParametro("@cAno", "C", 4, cAno)
    o_Comun.AgregaParametro("@codJef", "C", 8, cJefe)
    DT_solicitudes = o_Comun.EjecutaProcedure("pa_lis_vacaciones_Cronograma")
    Return DT_solicitudes
  End Function

  Public Function SetVacacionesSolicitudTest(oVacaciones As vacaciones_EN, ByVal cTipUsr As String) As DataTable
    Dim DT_solicitudes As New DataTable
    Dim o_Comun As New cl_COMUN_AD

    o_Comun.AgregaParametro("@id", "V", 50, "")
    o_Comun.AgregaParametro("@tipusr", "C", 1, cTipUsr)         ' Tipo U=Usuario A=Admin
    o_Comun.AgregaParametro("@modo", "C", 1, "T")               ' Modo T=Test   R=Real
    o_Comun.AgregaParametro("@pernr", "V", 10, oVacaciones.codtrb)
    o_Comun.AgregaParametro("@fecini", "V", 10, oVacaciones.fecini)
    o_Comun.AgregaParametro("@fecfin", "V", 10, oVacaciones.fecfin)

    Try
      DT_solicitudes = o_Comun.EjecutaProcedure("pa_prc_Solicitud_Consume")
    Catch ex As Exception
      MsgBox(ex.Message)
    End Try
    Return DT_solicitudes
  End Function

  Public Function XSetVacacionesSolicitudTest2(oVacaciones As vacaciones_EN) As DataTable
    Dim DT_solicitudes As New DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@pernr", "I", 8, oVacaciones.codtrb)
    o_Comun.AgregaParametro("@cTipo", "C", 1, "5")
    o_Comun.AgregaParametro("@fecha1", "D", 10, oVacaciones.fecini)
    o_Comun.AgregaParametro("@fecha2", "D", 10, oVacaciones.fecfin)
    Try
      DT_solicitudes = o_Comun.EjecutaProcedure("pa_prc_solicitud_Consume_Test_02")
    Catch ex As Exception
      MsgBox(ex.Message)
    End Try
    Return DT_solicitudes
  End Function


  Public Function GetSolicitudVacacionesCheckTransgresion(oVacaciones As vacaciones_EN) As DataTable

    Dim DT_solicitudes As New DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@pernr", "I", 8, oVacaciones.codtrb)
    o_Comun.AgregaParametro("@fecini", "D", 10, oVacaciones.fecini)
    o_Comun.AgregaParametro("@fecfin", "D", 10, oVacaciones.fecfin)
    Try
      DT_solicitudes = o_Comun.EjecutaProcedure("pa_prc_Solicitud_CheckTransgresion")
    Catch ex As Exception
      MsgBox(ex.Message)
      Return DT_solicitudes
    End Try
    Return DT_solicitudes

  End Function

  '*****************************
  '****  GRABA SOLICITUD   *****
  '*****************************
  Public Function SetVacacionesSolicitud(oVacaciones As vacaciones_EN, ByVal cTipUsr As String) As String
    Dim DT_solicitudes As New DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@ID", "V", 50, oVacaciones.id)
    o_Comun.AgregaParametro("@pernr", "I", 8, oVacaciones.codtrb)
    o_Comun.AgregaParametro("@FEC_SOL", "D", 10, oVacaciones.fecdoc)
    o_Comun.AgregaParametro("@FEC_INI", "D", 10, oVacaciones.fecini)
    o_Comun.AgregaParametro("@FEC_FIN", "D", 10, oVacaciones.fecfin)
    o_Comun.AgregaParametro("@OBS_TEX", "V", 500, oVacaciones.observ)
    o_Comun.AgregaParametro("@tipusr", "C", 1, cTipUsr)
    Try
      DT_solicitudes = o_Comun.EjecutaProcedure("pa_prc_solicitud_Graba")
    Catch ex As Exception
      MsgBox(ex.Message)
    End Try
    Return DT_solicitudes.Rows(0).Item("NERR").ToString
  End Function

  Public Function SetVacacionesAprobarEval(oVacaciones As vacaciones_EN) As String
    Dim DT_solicitudes As New DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@ID", "V", 50, oVacaciones.id)
    o_Comun.AgregaParametro("@codrol", "C", 6, oVacaciones.rolapr)
    o_Comun.AgregaParametro("@accion", "C", 1, oVacaciones.aproba)
    Try
      DT_solicitudes = o_Comun.EjecutaProcedure("pa_prc_Solicitud_Aprueba_Eval")
    Catch ex As Exception
    End Try
    Return DT_solicitudes.Rows(0).Item("estsol").ToString
  End Function

  '*****************************
  '**** APRUEBA SOLICITUD  *****
  '*****************************
  Public Function SetVacacionesAprobar(oVacaciones As vacaciones_EN) As String
    Dim DT_solicitudes As New DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@ID", "V", 50, oVacaciones.id)
    o_Comun.AgregaParametro("@codrol", "C", 6, oVacaciones.rolapr)
    o_Comun.AgregaParametro("@accion", "C", 1, oVacaciones.aproba)
    Try
      DT_solicitudes = o_Comun.EjecutaProcedure("pa_prc_Solicitud_Aprueba")
    Catch ex As Exception
    End Try
    Return DT_solicitudes.Rows(0).Item("estsol").ToString
  End Function


  ' Elimina una vacacion Opcion ADMIN
  Public Function SetVacacionesSolicitudEliminaADM(oVacaciones As vacaciones_EN) As Boolean
    Dim o_Comun As New cl_COMUN_AD
    Dim DT_solicitudes As New DataTable
    Dim bValRet As Boolean = False
    o_Comun.AgregaParametro("@ID", "V", 50, oVacaciones.id)
    Try
      DT_solicitudes = o_Comun.EjecutaProcedure("pa_prc_Solicitud_Elimina_Adm")
      bValRet = True
    Catch ex As Exception
      bValRet = False
    End Try
    Return bValRet
  End Function

  Public Function SetVacacionesSAPElimina(oVacaciones As vacaciones_EN) As Boolean
    Dim o_Comun As New cl_COMUN_AD
    Dim DT_solicitudes As New DataTable
    Dim bValRet As Boolean = False
    o_Comun.AgregaParametro("@ID", "V", 50, oVacaciones.id)
    Try
      DT_solicitudes = o_Comun.EjecutaProcedure("pa_prc_Solicitud_Elimina")
      bValRet = True
    Catch ex As Exception
      bValRet = False
    End Try
    Return bValRet
  End Function

  '*****************************
  '****    GENERA EN SAP   *****
  '*****************************

  Public Function SetVacacionesSAP(oVacaciones As vacaciones_EN) As String
    Dim oComun As New cl_COMUN_AD
    Dim SAPCnx As R3Connection
    SAPCnx = oComun.SapConexion("")
    Dim trans As New Transaction(SAPCnx)
    Dim dtVaca As DataTable
    Dim cMsgRet As String = ""
    trans.TCode = "PA30"
    Try
      Dim cSQL As String = "SELECT * FROM VAC_SOL WHERE id='" & oVacaciones.id & "'"
      dtVaca = oComun.EjecutaCadenaSQL(cSQL)
      oVacaciones.codtrb = dtVaca.Rows(0).Item("PERNR").ToString
      oVacaciones.fecdoc = dtVaca.Rows(0).Item("AEDTM").ToString
      oVacaciones.fecini = dtVaca.Rows(0).Item("BEGDA").ToString
      oVacaciones.fecfin = dtVaca.Rows(0).Item("ENDDA").ToString
      oVacaciones.observ = dtVaca.Rows(0).Item("OBSERV").ToString
      oVacaciones.estado = dtVaca.Rows(0).Item("ESTSOL").ToString

      'If oVacaciones.estado <> "A" Then
      '    Return ""
      '    Exit Function
      'End If

    Catch ex As Exception
      Return ""
      Exit Function
    End Try

    trans.AddStepSetNewDynpro("SAPMP50A", "1000")
    trans.AddStepSetOKCode("/00")
    trans.AddStepSetField("RP50G-PERNR", oVacaciones.codtrb)
    trans.AddStepSetField("BDC_SUBSCR", "SAPMP50A                                0800SUBSCR_HEADER")
    trans.AddStepSetField("BDC_SUBSCR", "SAPMP50A                                0320SUBSCR_ITMENU")
    trans.AddStepSetField("BDC_SUBSCR", "SAPMP50A                                0330SUBSCR_TIME")
    trans.AddStepSetField("RP50G-TIMR6", "X")
    trans.AddStepSetField("BDC_SUBSCR", "SAPMP50A                                0350SUBSCR_ITKEYS")
    trans.AddStepSetCursor("RP50G-CHOIC")
    trans.AddStepSetField("RP50G-CHOIC", "2001")

    trans.AddStepSetNewDynpro("SAPMP50A", "1000")
    trans.AddStepSetOKCode("/00")
    trans.AddStepSetField("RP50G-PERNR", oVacaciones.codtrb)
    trans.AddStepSetField("BDC_SUBSCR", "/1PAPAXX/HDR_40060A                     0100SUBSCR_HEADER")
    trans.AddStepSetField("BDC_SUBSCR", "SAPMP50A                                0320SUBSCR_ITMENU")
    trans.AddStepSetField("BDC_SUBSCR", "SAPMP50A                                0330SUBSCR_TIME")
    trans.AddStepSetField("RP50G-TIMR6", "X")
    trans.AddStepSetField("BDC_SUBSCR", "SAPMP50A                                0350SUBSCR_ITKEYS")
    trans.AddStepSetCursor("RP50G-SUBTY")
    trans.AddStepSetField("RP50G-CHOIC", "Absentismos")
    trans.AddStepSetField("RP50G-SUBTY", "1007")

    trans.AddStepSetNewDynpro("SAPMP50A", "1000")
    trans.AddStepSetCursor("RP50G-PERNR")
    trans.AddStepSetOKCode("=INS")
    trans.AddStepSetField("RP50G-PERNR", oVacaciones.codtrb)
    trans.AddStepSetField("BDC_SUBSCR", "/1PAPAXX/HDR_40060A                     0100SUBSCR_HEADER")
    trans.AddStepSetField("BDC_SUBSCR", "SAPMP50A                                0320SUBSCR_ITMENU")
    trans.AddStepSetField("BDC_SUBSCR", "SAPMP50A                                0330SUBSCR_TIME")
    trans.AddStepSetField("RP50G-TIMR6", "X")
    trans.AddStepSetField("BDC_SUBSCR", "SAPMP50A                                0350SUBSCR_ITKEYS")
    trans.AddStepSetField("RP50G-CHOIC", "Absentismos")
    trans.AddStepSetField("RP50G-SUBTY", "1007")

    trans.AddStepSetNewDynpro("MP200000", "2001")
    trans.AddStepSetCursor("P2001-BEGDA")
    trans.AddStepSetOKCode("=UPD")
    trans.AddStepSetField("P2001-BEGDA", Format(oVacaciones.fecini, "dd.MM.yyyy"))
    trans.AddStepSetField("P2001-ENDDA", Format(oVacaciones.fecfin, "dd.MM.yyyy"))
    trans.AddStepSetField("P2001-STDAZ", "8.5")

    Try
      trans.Execute()
      cMsgRet = trans.Returns.Item(0).Message

    Catch ex As Exception
      cMsgRet = trans.Returns.Item(0).Message
    End Try

    Return cMsgRet
  End Function


  Public Function GetVacacionesISLocked(oVacaciones As vacaciones_EN) As String
    Dim oComun As New cl_COMUN_AD
    Dim SAPCnx As R3Connection
    SAPCnx = oComun.SapConexion("")
    Dim trans As New Transaction(SAPCnx)
    Dim cMsgRet As String = ""
    Dim cSql As String = ""
    trans.TCode = "PA30"

    'Begin a new Dynpro
    trans.AddStepSetNewDynpro("SAPMP50A", "1000")
    trans.AddStepSetCursor("RP50G-PERNR")
    trans.AddStepSetOKCode("/00")
    trans.AddStepSetField("RP50G-PERNR", oVacaciones.codtrb)
    trans.AddStepSetField("BDC_SUBSCR", "SAPMP50A                                0800SUBSCR_HEADER")
    trans.AddStepSetField("BDC_SUBSCR", "SAPMP50A                                0320SUBSCR_ITMENU")
    trans.AddStepSetField("BDC_SUBSCR", "SAPMP50A                                0330SUBSCR_TIME")
    trans.AddStepSetField("RP50G-TIMR6", "X")
    trans.AddStepSetField("BDC_SUBSCR", "SAPMP50A                                0350SUBSCR_ITKEYS")

    'Begin a new Dynpro
    trans.AddStepSetNewDynpro("SAPMP50A", "1000")
    trans.AddStepSetOKCode("/E")
    trans.AddStepSetCursor("RP50G-PERNR")

    Try
      trans.Execute()
      If trans.Returns.Count() > 0 Then
        cMsgRet = trans.Returns.Item(0).Message
      Else
        cMsgRet = ""
      End If
    Catch ex As Exception
      cMsgRet = ex.Message
    End Try

    Return cMsgRet
  End Function


End Class




