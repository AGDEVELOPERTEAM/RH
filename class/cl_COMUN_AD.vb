Imports System.Data
Imports System.Configuration
Imports System.Text
Imports ERPConnect.Utils
Imports System.Net.Mail
Imports System.IO
Imports System.Threading
Imports System.Data.SqlClient
Imports ERPConnect
Imports System.Net

Public Class cl_COMUN_AD

  '               Clase utilizada para conexiones a base de datos, todas las conexiones a la base de datos,   
  '               ejecucion de consultas, Actualizacion de datos, eliminacion u otros deben pasar por aqui,   
  '               no debe existir otro lugar en el sistema por el que se haga comunicacion a la BD.
  Dim arrParametros(60, 4) As Object
  Dim dsDatos As New DataSet
  Dim cCADCNXDES As String
  Dim cTableDest As String = ""
  Dim nItm As Integer
  Dim intNumParametros As Integer = -1
  Dim dseRetorno As New DataSet
  Dim vUsr As String = "webservice"
  Dim vPwd As String = "omnia400"

  Private Hilo As Thread

  Public Sub New()
    For Me.nItm = 0 To 60
      arrParametros(nItm, 0) = ""
      arrParametros(nItm, 1) = ""
      arrParametros(nItm, 2) = 0
      arrParametros(nItm, 3) = ""
      arrParametros(nItm, 4) = ""
    Next
    intNumParametros = -1
  End Sub

  Public Function GetCnx() As String
    Dim strCnx As String
    Dim cServerSQL As String = ConfigurationManager.AppSettings("SQLServer")
    Try
      strCnx = "Data Source=" + cServerSQL + ";Initial Catalog=RH;uid=wsrrhh;pwd=@W$rrhh2020"
    Catch ex As Exception
      Throw New Exception(ex.Message)
    End Try
    Return strCnx
  End Function

  Public Sub AgregaParametro(ByVal strNombreParametro As String, ByVal strTipoParametro As String, ByVal intLongitud As Integer, ByVal objValor As Object)
    intNumParametros = intNumParametros + 1
    arrParametros(intNumParametros, 0) = strNombreParametro
    arrParametros(intNumParametros, 1) = strTipoParametro
    arrParametros(intNumParametros, 2) = intLongitud
    arrParametros(intNumParametros, 3) = "I"
    arrParametros(intNumParametros, 4) = objValor
  End Sub

  Public Sub Reset()
    For Me.nItm = 0 To 10
      arrParametros(nItm, 0) = ""
      arrParametros(nItm, 1) = ""
      arrParametros(nItm, 2) = 0
      arrParametros(nItm, 3) = ""
      arrParametros(nItm, 4) = ""
    Next
    intNumParametros = -1
  End Sub

  Public Function EjecutaProcedure(ByVal strNombrePA As String) As DataTable
    Dim cnxConexion As New SqlConnection(GetCnx)
    Dim cmdCommand As New SqlCommand
    Dim dadAdaptador As New SqlDataAdapter
    Dim dseRetorno As New DataSet
    Dim dtReturn As New DataTable
    Try
      cmdCommand.CommandText = strNombrePA
      cmdCommand.CommandType = CommandType.StoredProcedure
      cmdCommand.Connection = cnxConexion
      For intIndex As Integer = 0 To (arrParametros.Length / 5) - 1
        If arrParametros(intIndex, 0) <> "" Then
          Dim prmParametro As New SqlParameter
          prmParametro.ParameterName = arrParametros(intIndex, 0)
          Select Case arrParametros(intIndex, 1)
            Case "C" : prmParametro.SqlDbType = SqlDbType.Char
            Case "B" : prmParametro.SqlDbType = SqlDbType.Bit
            Case "I" : prmParametro.SqlDbType = SqlDbType.Int
            Case "V" : prmParametro.SqlDbType = SqlDbType.VarChar
            Case "U" : prmParametro.SqlDbType = SqlDbType.UniqueIdentifier
            Case "F" : prmParametro.SqlDbType = SqlDbType.Float
            Case "D" : prmParametro.SqlDbType = SqlDbType.DateTime
            Case "IM" : prmParametro.SqlDbType = SqlDbType.Image
            Case "DE" : prmParametro.SqlDbType = SqlDbType.Decimal : prmParametro.Precision = arrParametros(intIndex, 2) : prmParametro.Scale = 6
            Case "NV" : prmParametro.SqlDbType = SqlDbType.NVarChar
            Case "VB" : prmParametro.SqlDbType = SqlDbType.VarBinary
            Case "T" : prmParametro.SqlDbType = SqlDbType.Text
          End Select
          prmParametro.Size = arrParametros(intIndex, 2)
          Select Case arrParametros(intIndex, 3)
            Case "I" : prmParametro.Direction = ParameterDirection.Input
            Case "O" : prmParametro.Direction = ParameterDirection.ReturnValue
          End Select
          prmParametro.Value = arrParametros(intIndex, 4)
          cmdCommand.Parameters.Add(prmParametro)
        Else
          Exit For
        End If
      Next
      cnxConexion.Open()
      cmdCommand.CommandTimeout = 0
      dadAdaptador.SelectCommand = cmdCommand
      dadAdaptador.Fill(dseRetorno)
      cnxConexion.Close()
      Reset()
    Catch ex As Exception
      Dim sErr As String
      sErr = ex.Message

    End Try
    dtReturn = dseRetorno.Tables(0)
    Return dtReturn
  End Function

  Public Function EjecutaCadenaSQL(ByVal strCadenaSQL As String) As DataTable
    Dim cnxConexion As New SqlConnection(GetCnx)
    Dim cmdCommand As New SqlCommand
    Dim dadAdaptador As New SqlDataAdapter
    Dim dseRetorno As New DataSet
    Dim dtReturn As New DataTable
    Try
      cmdCommand.CommandText = strCadenaSQL
      cmdCommand.CommandType = CommandType.Text
      cmdCommand.Connection = cnxConexion
      cmdCommand.CommandTimeout = 0
      cnxConexion.Open()
      cmdCommand.CommandTimeout = 0
      dadAdaptador.SelectCommand = cmdCommand
      dadAdaptador.Fill(dseRetorno)
      cnxConexion.Close()
      dtReturn = dseRetorno.Tables(0)
      Return dtReturn
    Catch ex As Exception
      Return dtReturn
    End Try
    Reset()
    Return dtReturn
  End Function

  Public Function EjecutaTransaccion(ByVal strNombrePA As String) As Boolean
    Dim cnxConexion As New SqlConnection(GetCnx)
    Dim cmdCommand As New SqlCommand
    Dim dadAdaptador As New SqlDataAdapter
    Try
      cmdCommand.CommandText = strNombrePA
      cmdCommand.CommandType = CommandType.StoredProcedure
      cmdCommand.Connection = cnxConexion
      For intIndex As Integer = 0 To (arrParametros.Length / 5) - 1
        If arrParametros(intIndex, 0) <> "" Then
          Dim prmParametro As New SqlParameter
          prmParametro.ParameterName = arrParametros(intIndex, 0)
          Select Case arrParametros(intIndex, 1)
            Case "C" : prmParametro.SqlDbType = SqlDbType.Char
            Case "B" : prmParametro.SqlDbType = SqlDbType.Bit
            Case "I" : prmParametro.SqlDbType = SqlDbType.Int
            Case "V" : prmParametro.SqlDbType = SqlDbType.VarChar
            Case "U" : prmParametro.SqlDbType = SqlDbType.UniqueIdentifier
            Case "F" : prmParametro.SqlDbType = SqlDbType.Float
            Case "D" : prmParametro.SqlDbType = SqlDbType.DateTime
            Case "DE" : prmParametro.SqlDbType = SqlDbType.Decimal
            Case "IM" : prmParametro.SqlDbType = SqlDbType.Image
            Case "NV" : prmParametro.SqlDbType = SqlDbType.NVarChar
            Case "VB" : prmParametro.SqlDbType = SqlDbType.VarBinary
            Case "T" : prmParametro.SqlDbType = SqlDbType.Text
          End Select
          prmParametro.Size = arrParametros(intIndex, 2)
          Select Case arrParametros(intIndex, 3)
            Case "I" : prmParametro.Direction = ParameterDirection.Input
            Case "O" : prmParametro.Direction = ParameterDirection.ReturnValue
          End Select
          prmParametro.Value = arrParametros(intIndex, 4)
          cmdCommand.Parameters.Add(prmParametro)
        Else
          Exit For
        End If
      Next
      cnxConexion.Open()
      cmdCommand.CommandTimeout = 0
      dadAdaptador.SelectCommand = cmdCommand
      dadAdaptador.Fill(dseRetorno)
      cnxConexion.Close()
      Return True
    Catch ex As Exception
      Return False
    Finally
      Reset()
    End Try
  End Function

  Public Function EjecutaCadenaSQL_CNX(ByRef oCnx As SqlConnection, ByVal strCadenaSQL As String) As DataTable
    Dim cnxConexion As New SqlConnection(GetCnx)
    Dim cmdCommand As New SqlCommand
    Dim dadAdaptador As New SqlDataAdapter
    Dim dseRetorno As New DataSet
    Dim dtReturn As New DataTable
    Try
      cmdCommand.CommandText = strCadenaSQL
      cmdCommand.CommandType = CommandType.Text
      cmdCommand.Connection = cnxConexion
      cmdCommand.CommandTimeout = 0
      cnxConexion.Open()
      cmdCommand.CommandTimeout = 0
      dadAdaptador.SelectCommand = cmdCommand
      dadAdaptador.Fill(dseRetorno)
      cnxConexion.Close()
      dtReturn = dseRetorno.Tables(0)
      Return dtReturn
    Catch ex As Exception
      Return dtReturn
    End Try
    Reset()
    Return dtReturn
  End Function

  Public Sub CargaCombo(ByVal cTABLA As String, ByVal cCAMCOD As String, ByVal cCAMDES As String, ByVal cCONDIC As String, ByRef oCombo As Object, ByVal cCodigoActual As String, Optional ByVal cCodigoDefault As String = "")
    Dim cSql As String
    Dim oDSData As New DataTable

    If cCONDIC = "" Then
      cSql = "SELECT " & cCAMCOD & "," & cCAMDES & " FROM " & cTABLA & " ORDER BY " & cCAMDES
    Else
      If cCodigoDefault = "" Then
        cSql = "SELECT " & cCAMCOD & "," & cCAMDES & " FROM " & cTABLA & " WHERE " & cCONDIC & " ORDER BY " & cCAMDES
      Else
        cSql = "SELECT " & cCAMCOD & "," & cCAMDES & " FROM " & cTABLA & " WHERE " & cCONDIC & " or " & cCAMCOD & "='-' " & " ORDER BY " & cCAMDES
      End If
    End If

    cCodigoActual = RTrim(LTrim(cCodigoActual))
    oDSData = EjecutaCadenaSQL(cSql)
    oCombo.DataSource = oDSData
    oCombo.DataValueField = cCAMCOD
    oCombo.DataTextField = cCAMDES
    oCombo.Databind
    If cCodigoActual <> "" Then
      Try
        oCombo.SelectedValue = cCodigoActual
      Catch ex As Exception
        If cCodigoDefault = "" Then
          oCombo.SelectedValue = Nothing
        Else
          oCombo.SelectedValue = cCodigoDefault
        End If
      End Try
    End If

  End Sub

  Public Sub Log(ByRef cMensaje As String)
    Try
      Reset()
      AgregaParametro("@V_DESCRIPCION", "V", 5000, cMensaje)
      EjecutaTransaccion("UP_LOG")
    Catch ex As Exception

    End Try
  End Sub

  Public Sub SetCookie(cNomVar As String, cValVar As String)

  End Sub

  Public Function ID() As String
    Dim oTable As New DataTable
    oTable = EjecutaCadenaSQL("SELECT newid()")
    Return oTable.Rows(0).Item(0).ToString
  End Function

  Public Function EnviaCorreo(ByVal cEmailDestino As String, ByVal cAsunto As String, ByVal cCuerpo As String, ByVal cAdjunto As String, Optional ByVal cAdjunto2 As String = "", Optional ByVal cTIPEML As String = "", Optional ByVal cNOMUSR As String = "", Optional ByVal cNUMDOC As String = "", Optional cDESTINO As String = "C", Optional cEmailCOPY As String = "") As Boolean
    Dim correo As New MailMessage
    Dim smtp As New SmtpClient()

    Try

      Dim sMail As String = "german@austral.com.pe"
      Dim sProfile As String = ""
      Dim sNombre As String = "German"
      Dim sPassword As String = ""
      Dim sSMTP_Server As String = "smtp.office365.com"
      Dim sSMTP_Port As Integer = 587
      Dim sSMTP_EnableSSL As String = 0

      correo.From = New MailAddress(sMail, sNombre, System.Text.Encoding.UTF8)

      If Not MailADD("to", correo, cEmailDestino) Then
        Return False
        Exit Function
      End If

      If cEmailCOPY <> "" Then
        If Not MailADD("cc", correo, cEmailCOPY) Then
          Return False
          Exit Function
        End If
      End If

      correo.SubjectEncoding = System.Text.Encoding.UTF8
      correo.Subject = cAsunto
      correo.Body = cCuerpo
      correo.BodyEncoding = System.Text.Encoding.UTF8
      correo.IsBodyHtml = True
      correo.Priority = MailPriority.High

      If cAdjunto <> "" Then
        If File.Exists(cAdjunto) Then
          Dim attachment As System.Net.Mail.Attachment
          attachment = New System.Net.Mail.Attachment(cAdjunto)
          correo.Attachments.Add(attachment)
        End If
        If File.Exists(cAdjunto2) Then
          Dim attachment As System.Net.Mail.Attachment
          attachment = New System.Net.Mail.Attachment(cAdjunto2)
          correo.Attachments.Add(attachment)
        End If
      End If

      smtp.UseDefaultCredentials = False
      smtp.Credentials = New System.Net.NetworkCredential(sMail, sPassword)
      smtp.Port = sSMTP_Port
      smtp.EnableSsl = Not (sSMTP_EnableSSL = 1)
      smtp.Host = sSMTP_Server
      smtp.Send(correo)

    Catch ex As Exception
      Log(ex.Message)
    End Try

    Return True
  End Function

  Private Function MailADD(ByVal cTipoDest As String, ByRef oCorreo As MailMessage, ByVal cEmail As String) As Boolean
    Dim bRetu As Boolean = False
    Try
      If InStr(1, cEmail, ";") = 0 Then
        If cTipoDest = "to" Then
          oCorreo.To.Add(cEmail)
        Else
          oCorreo.CC.Add(cEmail)
        End If
      Else
        Dim cEmailtm As String = ""
        Dim ccar As String = ""
        cEmail = cEmail & ";"
        For nCar = 1 To Len(cEmail)

          ccar = Mid(cEmail, nCar, 1)
          If ccar = ";" Then

            If cEmailtm <> "" Then
              If cTipoDest = "to" Then
                oCorreo.To.Add(cEmailtm)
              Else
                oCorreo.CC.Add(cEmailtm)
              End If
              cEmailtm = ""
            End If

          Else
            cEmailtm = cEmailtm & ccar
          End If
        Next

      End If
      bRetu = True
    Catch ex As Exception
      Log("MAILADD: " & ex.Message)
      bRetu = False
    End Try
    Return bRetu
  End Function

  Public Function DiasHabiles(wFecIni As Date, wFecFin As Date) As Integer
    Dim oDiasHabiles As String
    Dim tTempo As DataTable
    tTempo = EjecutaCadenaSQL("SELECT dbo.DiasLaborables('" & wFecIni & "','" & wFecFin & "')")
    oDiasHabiles = tTempo.Rows(0).Item(0).ToString
    Return CInt(oDiasHabiles)
  End Function


  Public Function SapValidaConexion(wUsuario As String, wPassword As String) As Boolean
    Dim SAPConn As New R3Connection
    Dim vReturn As Boolean = True
    Dim cServerSAP As String = ConfigurationManager.AppSettings("SAPServer")
    Try
      ERPConnect.LIC.SetLic("F78PP3FW41")
      SAPConn.Host = cServerSAP
      SAPConn.SystemNumber = 0
      SAPConn.UserName = wUsuario
      SAPConn.Password = wPassword
      SAPConn.Client = "400"
      SAPConn.Language = "ES"
      SAPConn.Open(False)

    Catch ex As Exception
      Debug.Print(ex.Message)
      vReturn = False
    End Try

    Return vReturn
  End Function






  Public Function SapConexion(wUsuario As String) As R3Connection
    Dim SAPConn As New R3Connection
    Dim wPassword As String = ""
    Dim oUsr As New cl_USUARIO_AD
    Dim oUsrEN As New cl_USUARIO_EN
    Dim xusuario As String = ""
    Dim xclave As String = ""
    Dim cServerSAP As String = ConfigurationManager.AppSettings("SAPServer")

    Try

      If wUsuario <> "" Then
        xusuario = wusuario
        Dim cKey As String = ""
        Dim dtKey As New DataTable

        dtKey = EjecutaCadenaSQL("SELECT wkey=ISNULL(CAST(v_KeyAcceso as varchar(100) ),'') FROM [root].[Usuario] WHERE v_LoginUsuario='" & wUsuario & "'")
        cKey = dtKey.Rows(0).Item("wkey").ToString

        Reset()
        AgregaParametro("@usuario", "V", 100, wUsuario)
        AgregaParametro("@vkey", "V", 100, cKey)
        dtKey = EjecutaProcedure("[root].S_USUARIO_CRYPT")
        xclave = dtKey.Rows(0).Item("ccad").ToString
      Else
        xusuario = vUsr
        xclave = vPwd

      End If

      ERPConnect.LIC.SetLic("F78PP3FW41")
      SAPConn.Host = cServerSAP
      SAPConn.SystemNumber = 0
      SAPConn.UserName = xusuario
      SAPConn.Password = xclave
      SAPConn.Client = "400"
      SAPConn.Language = "ES"
      SAPConn.Open(False)
    Catch ex As Exception
      Debug.Print(ex.Message)
    End Try

    Return SAPConn
  End Function

  Public Function GrabaImagen(cUrl As String, cArchivo As String) As Boolean
    Dim httpRequest As HttpWebRequest

    httpRequest = HttpWebRequest.Create(cUrl)
    httpRequest.Timeout = 15000
    httpRequest.ReadWriteTimeout = 20000

    Dim httpresponse As HttpWebResponse
    httpresponse = httpRequest.GetResponse()

    Dim imageStream As Stream
    imageStream = httpresponse.GetResponseStream()

    Dim buddyicon As System.Drawing.Bitmap
    buddyicon = New System.Drawing.Bitmap(imageStream)

    httpresponse.Close()
    imageStream.Close()

    buddyicon.Save(cArchivo, System.Drawing.Imaging.ImageFormat.Jpeg)
    Return True
  End Function

  Public Function GeneraAnticipo(cFecha As String,
                                 Clase As String,
                                 Sociedad As String,
                                 FechaContab As String,
                                 Periodo As String,
                                 Moneda As String,
                                 Referencia As String,
                                 TxCabecera As String,
                                 Cuenta As String,
                                 CME As String,
                                 Importe As Double,
                                 TipoPago As String,
                                 Texto As String,
                                 wUsuario As String) As String


    Dim trans As New Transaction()
    Dim cMensaje As String = ""
    Dim cXMensaje As String = ""

    ''Please assign a valid R3Connection object to the Transaction object
    trans.Connection = SapConexion(wUsuario)
    trans.TCode = "F-47"
    ''Begin a new Dynpro
    trans.AddStepSetNewDynpro("SAPMF05A", "0112")
    trans.AddStepSetCursor("RF05A-ZUMSK")
    trans.AddStepSetOKCode("/00")
    trans.AddStepSetField("BKPF-BLDAT", cFecha)
    trans.AddStepSetField("BKPF-BLART", Clase)
    trans.AddStepSetField("BKPF-BUKRS", Sociedad)
    trans.AddStepSetField("BKPF-BUDAT", FechaContab)
    trans.AddStepSetField("BKPF-MONAT", Periodo)
    trans.AddStepSetField("BKPF-WAERS", Moneda)
    trans.AddStepSetField("BKPF-XBLNR", Referencia)
    trans.AddStepSetField("BKPF-BKTXT", TxCabecera)
    trans.AddStepSetField("BKPF-NUMPG", "")
    trans.AddStepSetField("RF05A-NEWKO", Cuenta)
    trans.AddStepSetField("RF05A-ZUMSK", CME)

    ''Begin a new Dynpro
    trans.AddStepSetNewDynpro("SAPMF05A", "0304")
    trans.AddStepSetCursor("BSEG-SGTXT")
    trans.AddStepSetOKCode("/00")
    trans.AddStepSetField("BSEG-WRBTR", Importe.ToString)
    trans.AddStepSetField("BSEG-ZFBDT", cFecha)
    trans.AddStepSetField("BSEG-ZLSPR", "A")
    trans.AddStepSetField("BSEG-ZLSCH", TipoPago) ' C=Cheque T=Transferencia
    trans.AddStepSetField("BSEG-SGTXT", Texto)

    ''Begin a new Dynpro
    trans.AddStepSetNewDynpro("SAPMF05A", "0304")
    trans.AddStepSetCursor("BSEG-WRBTR")
    trans.AddStepSetOKCode("=BU")
    trans.AddStepSetField("BSEG-WRBTR", Importe.ToString)
    trans.AddStepSetField("BSEG-ZFBDT", cFecha)
    trans.AddStepSetField("BSEG-ZLSPR", "A")
    trans.AddStepSetField("BSEG-ZLSCH", TipoPago)
    trans.AddStepSetField("BSEG-FIPOS", "DUMMY")
    trans.AddStepSetField("BSEG-SGTXT", Texto)
    Try
      trans.Execute()
    Catch ex As Exception
      cMensaje = ex.Message
    End Try

    cMensaje = trans.Returns(0).Message

    If cMensaje <> "" Then
      If IsNumeric(Mid(cMensaje, 6, 10)) Then
        cMensaje = "DOCUM:" & Mid(cMensaje, 6, 10)
      Else
        cMensaje = "ERROR:" & cMensaje
      End If
    Else
      cMensaje = "ERROR:"
    End If

    Return cMensaje
  End Function

  Public Function FillUser(ByVal sId As String) As cl_USUARIO_EN
    Dim cSql As String
    Dim oUSUARIO_EN As New cl_USUARIO_EN
    Dim dtUser As New DataTable
    cSql = "SELECT * FROM [root].[Usuario] WHERE v_KeyAcceso='" & sId & "'"
    dtUser = EjecutaCadenaSQL(cSql)

    If dtUser.Rows.Count > 0 Then
      oUSUARIO_EN.KeyAcceso = sId
      oUSUARIO_EN.Sede = dtUser.Rows(0).Item("i_sede").ToString
      oUSUARIO_EN.Documento = dtUser.Rows(0).Item("i_sede").ToString
      oUSUARIO_EN.Descripcion = dtUser.Rows(0).Item("i_sede").ToString
      oUSUARIO_EN.Codigo = dtUser.Rows(0).Item("i_sede").ToString
      oUSUARIO_EN.LoginUsuario = dtUser.Rows(0).Item("i_sede").ToString
      oUSUARIO_EN.EMail = dtUser.Rows(0).Item("i_sede").ToString
      oUSUARIO_EN.Periodo = dtUser.Rows(0).Item("i_sede").ToString

    End If

    Return oUSUARIO_EN
  End Function

End Class


