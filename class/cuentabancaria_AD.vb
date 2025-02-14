Public Class cuentabancaria_AD

    Public Function GetListaCuentaBancaria(iPERNR As Integer) As DataTable
        Dim dt_cuentabancaria As DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@PERNR", "I", 8, iPERNR)
    dt_cuentabancaria = o_Comun.EjecutaProcedure("pa_lis_cuentabancaria")
    Return dt_cuentabancaria
    End Function

End Class
