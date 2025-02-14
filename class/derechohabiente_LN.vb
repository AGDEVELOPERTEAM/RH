Public Class derechohabiente_LN

    Public Function GetListaDerechoHabientes(ByVal iPERNR As Integer)
        Dim AD_DerechoHabientes As New derechohabiente_AD
        Dim dt_DerechoHabientes As DataTable
        dt_DerechoHabientes = AD_DerechoHabientes.GetListaDerechoHabientes(iPERNR)
        Return dt_DerechoHabientes
    End Function

End Class
