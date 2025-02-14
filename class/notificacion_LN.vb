Public Class notificacion_LN

    Public Function GetNotificacionLista(oNotificacion As notificacion_EN) As DataTable
        Dim AD_notificacion As New notificacion_AD
        Dim DT_notificacion As DataTable
        DT_notificacion = AD_notificacion.GetNotificacionLista(oNotificacion)
        Return DT_notificacion
    End Function

End Class
