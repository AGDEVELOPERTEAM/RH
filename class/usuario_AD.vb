Public Class usuario_AD

  Public Function GetPERNR(oUsr As usuario_EN) As Integer
    Dim oComun As New cl_COMUN_AD
    Dim dtDATA As New DataTable
    Try
      oComun.AgregaParametro("@id", "V", 50, oUsr.ID)
      oComun.AgregaParametro("@clave", "V", 50, oUsr.PASSW)
      dtDATA = oComun.EjecutaProcedure("pa_usuario_valida")
      Return dtDATA.Rows(0).Item("PERNR")
    Catch ex As Exception
      Return 0
    End Try

  End Function


  Public Function GetDataByID(oUsr As usuario_EN) As usuario_EN
    Dim oComun As New cl_COMUN_AD
    Dim w_usuario_en As New usuario_EN
    Dim dtDATA As New DataTable
    Try
      oComun.AgregaParametro("@id", "V", 50, oUsr.ID)
      dtDATA = oComun.EjecutaProcedure("pa_usuario_carga")
      w_usuario_en.PERNR = dtDATA.Rows(0).Item("codtrb")
      w_usuario_en.type = dtDATA.Rows(0).Item("usrtype")
            w_usuario_en.NUMDOC = dtDATA.Rows(0).Item("numdoc")
            w_usuario_en.NOMBRE = dtDATA.Rows(0).Item("nomapp")

            w_usuario_en.ESJEFE = dtDATA.Rows(0).Item("numSubalternos")

            w_usuario_en.NOMTRB = dtDATA.Rows(0).Item("nomtrb")
            w_usuario_en.APETRB = dtDATA.Rows(0).Item("apetrb")

            w_usuario_en.FECING = dtDATA.Rows(0).Item("fecing")
            w_usuario_en.FECNAC = dtDATA.Rows(0).Item("fecnac")
            w_usuario_en.SEXO = dtDATA.Rows(0).Item("sexo")

            w_usuario_en.CODECV = dtDATA.Rows(0).Item("codestciv")
            w_usuario_en.DESECV = dtDATA.Rows(0).Item("desestciv")

            w_usuario_en.CODPAI = dtDATA.Rows(0).Item("codpainac")
            w_usuario_en.DESPAI = dtDATA.Rows(0).Item("despainac")

            w_usuario_en.DIRECC = dtDATA.Rows(0).Item("direcc")

            w_usuario_en.CODNAC = dtDATA.Rows(0).Item("codnacion")
            w_usuario_en.DESNAC = dtDATA.Rows(0).Item("desnacion")

            w_usuario_en.ANOCOD = dtDATA.Rows(0).Item("anocod")
            w_usuario_en.ANODES = dtDATA.Rows(0).Item("anodes")

            w_usuario_en.OFICOD = dtDATA.Rows(0).Item("codsed")
            w_usuario_en.OFIDES = dtDATA.Rows(0).Item("dessed")

            w_usuario_en.JEFCOD = dtDATA.Rows(0).Item("codjef")
            w_usuario_en.JEFDES = dtDATA.Rows(0).Item("codjef")

            w_usuario_en.PLLCOD = dtDATA.Rows(0).Item("codtip")
            w_usuario_en.PLLDES = dtDATA.Rows(0).Item("destip")

            w_usuario_en.UORCOD = dtDATA.Rows(0).Item("coduog")
            w_usuario_en.UORDES = dtDATA.Rows(0).Item("desuog")

            w_usuario_en.PUECOD = dtDATA.Rows(0).Item("codpto")
            w_usuario_en.PUEDES = dtDATA.Rows(0).Item("despto")

            w_usuario_en.CODSUJ = dtDATA.Rows(0).Item("codsuj")
            w_usuario_en.DESSUJ = dtDATA.Rows(0).Item("dessuj")

            w_usuario_en.TLFPER = dtDATA.Rows(0).Item("tlfper")
            w_usuario_en.TLFEMP = dtDATA.Rows(0).Item("tlfemp")

            w_usuario_en.EMLEMP = dtDATA.Rows(0).Item("emlcor")
            w_usuario_en.EMLPER = dtDATA.Rows(0).Item("emlper")

            Return w_usuario_en
        Catch ex As Exception
            Return w_usuario_en
        End Try

    End Function

End Class
