Public Class notificacion_AD

    Public Function GetNotificacionLista(oNotificacion As notificacion_EN) As DataTable
        Dim DT_notificacion As DataTable
    Dim o_Comun As New cl_COMUN_AD
    o_Comun.AgregaParametro("@codtrb", "I", 6, oNotificacion.Jefe)
    DT_notificacion = o_Comun.EjecutaProcedure("pa_Notificaciones_list")
    Return DT_notificacion
    End Function

End Class
