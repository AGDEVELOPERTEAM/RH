Public Class derechohabiente_AD

    Public Function GetListaDerechoHabientes(iPERNR As Integer) As DataTable
        Dim DT_derechohabiente As DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@PERNR", "I", 8, iPERNR)
    DT_derechohabiente = o_Comun.EjecutaProcedure("pa_lis_derechohabiente")
    Return DT_derechohabiente
    End Function

End Class
