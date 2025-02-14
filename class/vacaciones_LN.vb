Public Class Vacaciones_LN

    Public Function GetSolicitud(oVacaciones As vacaciones_EN) As vacaciones_EN
        Dim EN_vacaciones As New vacaciones_EN
        Dim AD_vacaciones As New vacaciones_AD
        EN_vacaciones = AD_vacaciones.GetSolicitud(oVacaciones)
        Return EN_vacaciones
    End Function

    Public Function GetListaVacacionesConsumoContingente(oUser As usuario_EN) As DataTable
        Dim AD_vacaciones As New vacaciones_AD
        Dim DT_vacaciones As DataTable
        DT_vacaciones = AD_vacaciones.GetListaVacacionesConsumoContingente(oUser)
        Return DT_vacaciones
    End Function


  Public Function GetListaVacacionesPendientesArea(oUser As usuario_EN) As DataTable
    Dim AD_vacaciones As New vacaciones_AD
    Dim DT_vacaciones As DataTable
    DT_vacaciones = AD_vacaciones.GetListaVacacionesPendientesArea(oUser)
    Return DT_vacaciones
  End Function

  Public Function GetListaVacacionesPendientesTope(oUser As usuario_EN) As DataTable
    Dim AD_vacaciones As New vacaciones_AD
    Dim DT_vacaciones As DataTable
    DT_vacaciones = AD_vacaciones.GetListaVacacionesPendientesTope(oUser)
    Return DT_vacaciones
  End Function

  Public Function GetListaSolicitudVacaciones(oUser As cl_USUARIO_EN) As DataTable
    Dim AD_vacaciones As New vacaciones_AD
    Dim DT_vacaciones As DataTable
    DT_vacaciones = AD_vacaciones.GetListaSolicitudVacaciones(oUser)
    Return DT_vacaciones
  End Function

  Public Function GetListaSolicitudVacacionesPorAutorizar(oUser As cl_USUARIO_EN) As DataTable
    Dim AD_vacaciones As New vacaciones_AD
    Dim DT_vacaciones As DataTable
    DT_vacaciones = AD_vacaciones.GetListaSolicitudVacacionesPorAutorizar(oUser)
    Return DT_vacaciones
  End Function


  Public Function GetListaSolicitudVacacionesUltima(cUsuario As String) As DataTable
    Dim AD_vacaciones As New vacaciones_AD
    Dim DT_vacaciones As DataTable
    DT_vacaciones = AD_vacaciones.GetListaSolicitudVacacionesUltima(cUsuario)
    Return DT_vacaciones
  End Function



  Public Function GetListaVacacionesPorAprobar(oUser As usuario_EN) As DataTable
    Dim AD_vacaciones As New vacaciones_AD
    Dim DT_vacaciones As DataTable
    DT_vacaciones = AD_vacaciones.GetListaVacacionesPorAprobar(oUser)
    Return DT_vacaciones
  End Function

  Public Function GetListaVacacionesPendientesTrabajador(oUser As usuario_EN, ByVal cTipoUsr As String) As DataTable
    Dim AD_vacaciones As New vacaciones_AD
    Dim DT_vacaciones As DataTable
    DT_vacaciones = AD_vacaciones.GetListaVacacionesPendientesTrabajador(oUser, cTipoUsr)
    Return DT_vacaciones
  End Function

  Public Function GetListaVacacionesSaldos(oUser As cl_USUARIO_EN) As DataTable
    '    Function GetListaSolicitudVacaciones(oUser As cl_USUARIO_EN) As DataTable

    Dim AD_vacaciones As New vacaciones_AD
    Dim DT_vacaciones As DataTable
    DT_vacaciones = AD_vacaciones.GetListaVacacionesSaldos(oUser)
    Return DT_vacaciones
  End Function

  Public Function GetListaVacacionesworkflow(oUser As usuario_EN) As DataTable
    Dim AD_vacaciones As New vacaciones_AD
    Dim DT_vacaciones As DataTable
    DT_vacaciones = AD_vacaciones.GetListaVacacionesworkflow(oUser)
    Return DT_vacaciones
  End Function

  Public Function GetSolicitudVacacionesLista(oVacaciones As vacaciones_EN) As DataTable
    Dim AD_vacaciones As New vacaciones_AD
    Dim DT_vacaciones As DataTable
    DT_vacaciones = AD_vacaciones.GetSolicitudVacacionesLista(oVacaciones)
    Return DT_vacaciones
  End Function

  Public Function GetListaVacacionesCronograma(cMes As String, cAno As String, cCodJef As String) As DataTable
    Dim AD_vacaciones As New vacaciones_AD
    Dim DT_vacaciones As DataTable
    DT_vacaciones = AD_vacaciones.GetListaVacacionesCronograma(cMes, cAno, cCodJef)
    Return DT_vacaciones
  End Function


  Public Function SetVacacionesAprobarEval(oVacaciones As vacaciones_EN) As String
    Dim AD_vacaciones As New vacaciones_AD
    Dim ST_vacaciones As String
    ST_vacaciones = AD_vacaciones.SetVacacionesAprobarEval(oVacaciones)

    Return ST_vacaciones
  End Function



  '*****************************
  '****  GRABA SOLICITUD   *****
  '*****************************
  Public Function SetVacacionesSolicitudElimina(oVacaciones As vacaciones_EN) As String
    Dim AD_vacaciones As New vacaciones_AD
    Dim sValRet As String = ""
    oVacaciones = GetSolicitud(oVacaciones)

    If oVacaciones.estado = "G" Then
      AD_vacaciones.SetVacacionesSAPElimina(oVacaciones)
    Else
      sValRet = "E01" 'Estado no es el correcto solo puede eliminarse los que estan en "G"
    End If

    Return sValRet
  End Function


  Public Function SetVacacionesSolicitudEliminaADM(oVacaciones As vacaciones_EN) As String
    Dim AD_vacaciones As New vacaciones_AD
    Dim sValRet As String = ""
    oVacaciones = GetSolicitud(oVacaciones)
    AD_vacaciones.SetVacacionesSolicitudEliminaADM(oVacaciones)
    Return sValRet
  End Function






  Public Function SetVacacionesSolicitud(ByVal oVacaciones As vacaciones_EN, ByVal cTipUsr As String) As String
    Dim AD_vacaciones As New vacaciones_AD
    Dim oUser As New usuario_EN
    Dim oComun As New cl_COMUN_AD
    Dim Dt_Test As DataTable
    Dim DT_Saldos As DataTable
    Dim nDiasLab As Integer
    Dim ST_vacaciones As String = ""
    Dim w_SDB_CON_LAB As Decimal = 0
    Dim w_SDB_CON_NLA As Decimal = 0
    Dim w_SDB_FRA_LAB As Decimal = 0
    Dim w_SDB_FRA_NLA As Decimal = 0


    If Not IsDate(oVacaciones.fecini) Or Not IsDate(oVacaciones.fecfin) Then
      ST_vacaciones = "Por favor ingrese las fechas correctamente."
      Return ST_vacaciones
    End If

    If oVacaciones.fecini <= Now.Date Then
      ST_vacaciones = "No es posible realizar la solicitud para esta fecha ni anteriores."
      Return ST_vacaciones
    End If

    If oVacaciones.fecfin < oVacaciones.fecini Then
      ST_vacaciones = "Fecha Final es menor a fecha inicial, por favor corregir"
      Return ST_vacaciones
    End If

    DT_saldos = AD_vacaciones.GetSolicitudVacacionesCheckTransgresion(oVacaciones)
    If DT_saldos.Rows.Count > 0 Then
      ST_vacaciones = "Error, Transgresion Encontrada solicitud : " & DT_saldos.Rows(0).Item("BEGDA").ToString & " al " & DT_saldos.Rows(0).Item("ENDDA").ToString
      Return ST_vacaciones
    End If

    nDiasLab = oComun.DiasHabiles(Now.Date, oVacaciones.fecini)
    If nDiasLab < 4 Then
      ST_vacaciones = "Error, Las Solicitudes de Vacaciones deben realizarse como minimo 3 dias habiles antes del inicio de las mismas."
      Return ST_vacaciones
    End If

    Dt_Test = AD_vacaciones.SetVacacionesSolicitudTest(oVacaciones, cTipUsr)
    If Dt_Test.Rows(0).Item("TOT") > 0 Then
      ST_vacaciones = "Saldo de Vacaciones no suficiente, por favor revise su saldo."
      Return ST_vacaciones
    End If

    oUser.PERNR = oVacaciones.codtrb
    DT_Saldos = AD_vacaciones.GetListaVacacionesPendientesTrabajador(oUser, cTipUsr)
    For nItem = 0 To DT_saldos.Rows.Count - 1
            If DT_saldos.Rows(nItem).Item("SIT_STG") = "C" Then
                w_SDB_CON_LAB += DT_saldos.Rows(nItem).Item("SDB_CON_LAB")
                w_SDB_CON_NLA += DT_saldos.Rows(nItem).Item("SDB_CON_NLA")
                w_SDB_FRA_LAB += DT_saldos.Rows(nItem).Item("SDB_FRA_LAB")
                w_SDB_FRA_NLA += DT_saldos.Rows(nItem).Item("SDB_FRA_NLA")
            End If
        Next
        'Si hay saldo en contingencia
        If (w_SDB_CON_LAB + w_SDB_CON_NLA + w_SDB_FRA_LAB + w_SDB_FRA_NLA) > 0 Then

            If (w_SDB_CON_LAB + w_SDB_FRA_LAB) > 0 Then
                If DT_Saldos.Rows(0).Item("DIALAB") < (w_SDB_CON_LAB + w_SDB_FRA_LAB) Then
                    ST_vacaciones = "Error, UD. Cuenta con dias de salida obligatoria, por favor seleccione como minimo " & (w_SDB_CON_LAB + w_SDB_FRA_LAB) & " Dias Laborables y " & (w_SDB_CON_NLA + w_SDB_FRA_NLA) & " Dias No Laborables "
                    Return ST_vacaciones
                End If
            End If

        End If


        ST_vacaciones = AD_vacaciones.SetVacacionesSolicitud(oVacaciones, cTipUsr)


        Return ST_vacaciones

    End Function

    '*****************************
    '**** APRUEBA SOLICITUD  *****
    '*****************************
    Public Function SetVacacionesAprobar(oVacaciones As vacaciones_EN) As String
        Dim AD_vacaciones As New vacaciones_AD
        Dim ST_vacaciones As String
        ST_vacaciones = AD_vacaciones.SetVacacionesAprobar(oVacaciones)

        Return ST_vacaciones
    End Function

    '*****************************
    '****    GENERA EN SAP   *****
    '*****************************
    Public Function SetVacacionesSAP(oVacaciones As vacaciones_EN) As String
        Dim AD_vacaciones As New vacaciones_AD
        Dim ST_vacaciones As String
        ST_vacaciones = AD_vacaciones.SetVacacionesSAP(oVacaciones)
        Return ST_vacaciones
    End Function

    Public Function GetVacacionesISLocked(oVacaciones As vacaciones_EN) As String
        Dim AD_vacaciones As New vacaciones_AD
        Dim ST_vacaciones As String
        ST_vacaciones = AD_vacaciones.GetVacacionesISLocked(oVacaciones)
        Return ST_vacaciones
    End Function


End Class
