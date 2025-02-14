Public Class usuario_LN

    Public Function ValidaUsuario(oUSR As usuario_EN) As Boolean
        Dim W_usuario_AD As New usuario_AD
        Dim W_Return As Boolean = False
        Dim nCODTRB As Integer = W_usuario_AD.GetPERNR(oUSR)

        Select Case nCODTRB
            Case < 0  'El Trabajador ha cesado
                W_Return = False
            Case = 0 'El Trabajador no existe
                W_Return = False
            Case > 0 'El Trabajador existe y esta habilitado
                W_Return = True
        End Select

        Return W_Return

    End Function

    Public Function GetDataByID(oUser As usuario_EN) As usuario_EN
        Dim W_usuario_AD As New usuario_AD
        Dim en_usuario As usuario_EN = W_usuario_AD.GetDataByID(oUser)
        Return en_usuario
    End Function


End Class
