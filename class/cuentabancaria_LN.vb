Public Class cuentabancaria_LN

    Public Function GetListaCuentaBancaria(ByVal iPERNR As Integer)
        Dim ad_cuentabancaria As New cuentabancaria_AD
        Dim dt_cuentabancaria As DataTable
        dt_cuentabancaria = ad_cuentabancaria.GetListaCuentaBancaria(iPERNR)
        Return dt_cuentabancaria
    End Function

End Class
