Imports System.Security.Cryptography

Public Class f_FichaBasc_1
  Inherits System.Web.UI.Page
  Dim oComun As New cl_COMUN_AD
  Dim cRutaImagenes As String = "~/Files/SEG/"
  Dim cNumeroDocumento As String = ""
  Dim sid As String = ""
  Dim oUSUARIO_EN As New cl_USUARIO_EN
  Dim oUSUARIO_LN As New cl_USUARIO_LN

  'Public Shared cPeriodo As String = ""
  'Public Shared cDocumento As String = ""


  <System.Web.Services.WebMethod()>
  Public Shared Function GrabaFotoTrabajador(ByVal data As String) As Boolean

    Dim SGalleta As HttpCookie = HttpContext.Current.Request.Cookies("RH")
    cDocumento = SGalleta.Values("nd")
    cPeriodo = SGalleta.Values("pe")



    Dim objComun As New cl_COMUN_AD
    Dim fileName As String = cDocumento + "-" + cPeriodo + "-1.jpg" ''objComun.ID & ".jpg"
    Dim imageBytes As Byte() = Convert.FromBase64String(data.Split(","c)(1))
    Dim dtDATA As New DataTable

    Dim csql As String
    csql = "SELECT V_FOT_01=ISNULL(V_FOT_01,'') FROM [basc].[Ficha] WHERE c_NUMDNI='" & cDocumento & "' AND v_CODPER='" & cPeriodo & "'"
    dtDATA = objComun.EjecutaCadenaSQL(csql)

    If dtDATA.Rows(0).Item("V_FOT_01") <> "" Then
      If System.IO.File.Exists(HttpContext.Current.Server.MapPath(String.Format("~/files/SEG/{0}", dtDATA.Rows(0).Item("V_FOT_01")))) Then
        System.IO.File.Delete(HttpContext.Current.Server.MapPath(String.Format("~/files/SEG/{0}", dtDATA.Rows(0).Item("V_FOT_01"))))
      End If
    End If

    Dim filePath As String = HttpContext.Current.Server.MapPath(String.Format("~/files/SEG/{0}", fileName))
    HttpContext.Current.Session("Path") = String.Format("~/files/SEG/{0}", fileName)
    System.IO.File.WriteAllBytes(filePath, imageBytes)

    Try
      objComun.AgregaParametro("@c_NumDNI", "V", 10, cDocumento)
      objComun.AgregaParametro("@v_Periodo", "C", 8, cPeriodo)
      objComun.AgregaParametro("@Tipo", "I", 5, 5)
      objComun.AgregaParametro("@imagen", "V", 50, fileName)
      objComun.EjecutaTransaccion("basc.S_Ficha_Graba03")

    Catch ex As Exception
    End Try

    Return True

  End Function

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    sid = Request.QueryString("id")
    If sid <> "" Then
      oUSUARIO_EN.KeyAcceso = sid
      oUSUARIO_EN = oUSUARIO_LN.LN_USUARIO_CARGA(oUSUARIO_EN)
      cDocumento = oUSUARIO_EN.Documento
      cPeriodo = oUSUARIO_EN.Periodo
      Session("id") = oUSUARIO_EN.id
      Session("Documento") = oUSUARIO_EN.Documento
      Session("Periodo") = oUSUARIO_EN.Periodo

      Response.Cookies.Remove("RH")
      Dim CertificadoCook As New HttpCookie("RH")
      CertificadoCook.Values.Add("id", sid)
      CertificadoCook.Values.Add("nd", oUSUARIO_EN.Documento)
      CertificadoCook.Values.Add("pe", oUSUARIO_EN.Periodo)
      CertificadoCook.Expires = DateTime.MaxValue 'Expira en este momento
      Response.AppendCookie(CertificadoCook)

    Else
      Response.Redirect("/login.aspx")
    End If


    Dim cPERNR As String = ""
    Dim dt_MAEPER As DataTable
    Dim dt_FICHA_1 As DataTable
    Dim cSql As String = ""
    Dim EsTrabajador As Boolean = False
    Dim s_Pais As String = ""
    Dim s_Depa As String = ""
    Dim s_Prov As String = ""
    Dim s_Dist As String = ""

    cSql = "SELECT * FROM SAP.V_MaestroPersonal WHERE ICNUM='" & cDocumento & "'"
    dt_MAEPER = oComun.EjecutaCadenaSQL(cSql)
    EsTrabajador = (dt_MAEPER.Rows.Count > 0)


    If EsTrabajador Then
      cPERNR = dt_MAEPER.Rows(0).Item("PERNR").ToString
      tx_Fecha.Enabled = False
      tx_Nombre.Enabled = False
      tx_Apellido.Enabled = False
      tx_dni.Enabled = False
      tx_FechaNacimiento.Enabled = False
      dd_Sede.Enabled = False
    End If

    cSql = "SELECT * FROM basc.Ficha WHERE c_NumDNI='" + Session("Documento") + "' AND v_codper='" + Session("Periodo") + "'"
    dt_FICHA_1 = oComun.EjecutaCadenaSQL(cSql)

    If Not IsPostBack() Then
      oComun.CargaCombo("root.v_sede", "PERSA", "NAME1", "", dd_Sede, "")
      oComun.CargaCombo("root.EstadoCivil", "c_ESTCIV_Cod", "c_ESTCIV_Des", "", dd_EstadoCivil, "")

      If dt_FICHA_1.Rows.Count > 0 Then
        If dt_FICHA_1.Rows(0).Item("v_Nombres").ToString <> "" Then

          s_Pais = dt_FICHA_1.Rows(0).Item("c_CodPAI").ToString.Trim
          s_Depa = dt_FICHA_1.Rows(0).Item("c_CodDEP").ToString.Trim
          s_Prov = dt_FICHA_1.Rows(0).Item("c_CodPRV").ToString.Trim
          s_Dist = dt_FICHA_1.Rows(0).Item("c_CodDIS").ToString.Trim

          oComun.CargaCombo("root.v_ubi_pais", "UbigeoCOD", "UbigeoDES", "", dd_Pais, s_Pais)
          oComun.CargaCombo("root.v_ubi_Departamento", "UbigeoCOD", "UbigeoDES", "", dd_Departamento, s_Depa)
          oComun.CargaCombo("root.V_UBI_Provincia", "UbigeoCOD", "UbigeoDES", "SUBSTRING(UbigeoCOD,1,2)='" & s_Depa & "'", dd_Provincia, s_Prov)
          oComun.CargaCombo("root.V_UBI_Distrito", "UbigeoCOD", "UbigeoDES", "SUBSTRING(UbigeoCOD,1,4)='" & s_Prov & "'", dd_Distrito, s_Dist)

          tx_Fecha.Text = If(IsDBNull(dt_FICHA_1.Rows(0).Item("d_Fecha")), "", Format(dt_FICHA_1.Rows(0).Item("d_Fecha"), "yyyy-MM-dd"))
          tx_Nombre.Text = dt_FICHA_1.Rows(0).Item("v_Nombres").ToString
          tx_Apellido.Text = dt_FICHA_1.Rows(0).Item("v_Apellidos").ToString
          tx_dni.Text = dt_FICHA_1.Rows(0).Item("c_NumDNI").ToString
          tx_FechaNacimiento.Text = If(IsDBNull(dt_FICHA_1.Rows(0).Item("d_FecNac")), "", Format(dt_FICHA_1.Rows(0).Item("d_FecNac"), "yyyy-MM-dd"))
          dd_Pais.SelectedValue = If(IsDBNull(dt_FICHA_1.Rows(0).Item("c_CodPAI")), 0, dt_FICHA_1.Rows(0).Item("c_CodPAI"))
          dd_Departamento.SelectedValue = If(IsDBNull(dt_FICHA_1.Rows(0).Item("c_CodDEP")), 0, dt_FICHA_1.Rows(0).Item("c_CodDEP"))
          dd_Provincia.SelectedValue = If(IsDBNull(dt_FICHA_1.Rows(0).Item("c_CodPRV")), 0, dt_FICHA_1.Rows(0).Item("c_CodPRV"))
          dd_Distrito.SelectedValue = If(IsDBNull(dt_FICHA_1.Rows(0).Item("c_CodDIS")), 0, dt_FICHA_1.Rows(0).Item("c_CodDIS"))

          dd_Sede.SelectedValue = If(IsDBNull(dt_FICHA_1.Rows(0).Item("i_Sede")), 0, dt_FICHA_1.Rows(0).Item("i_Sede"))
          dd_EstadoCivil.SelectedValue = If(IsDBNull(dt_FICHA_1.Rows(0).Item("i_EstCiv")), 0, dt_FICHA_1.Rows(0).Item("i_EstCiv"))
          tx_Direccion.Text = dt_FICHA_1.Rows(0).Item("v_Direccion").ToString
          tx_Referencias.Text = dt_FICHA_1.Rows(0).Item("v_Referencia").ToString
          tx_Telefono.Text = dt_FICHA_1.Rows(0).Item("v_Telefono").ToString
          tx_Celular.Text = dt_FICHA_1.Rows(0).Item("v_Celular").ToString
          tx_ESPO_NOMBRE.Text = dt_FICHA_1.Rows(0).Item("v_CyNombre").ToString
          tx_ESPO_APELLIDOS.Text = dt_FICHA_1.Rows(0).Item("v_CyApellidos").ToString
          tx_ESPO_PROFESION.Text = dt_FICHA_1.Rows(0).Item("v_CyProfesion").ToString
          tx_ESPO_EMPRESA.Text = dt_FICHA_1.Rows(0).Item("v_CyEmpresa").ToString
          tx_ESPO_TELEFONO.Text = dt_FICHA_1.Rows(0).Item("v_CyTelefono").ToString
          tx_HIJ1_NOMBRE.Text = dt_FICHA_1.Rows(0).Item("v_Hj1_Nombre").ToString
          tx_HIJ1_OCUPACION.Text = dt_FICHA_1.Rows(0).Item("v_Hj1_Ocupacion").ToString
          tx_HIJ1_EDAD.Text = dt_FICHA_1.Rows(0).Item("v_Hj1_Edad").ToString
          tx_HIJ2_NOMBRE.Text = dt_FICHA_1.Rows(0).Item("v_Hj2_Nombre").ToString
          tx_HIJ2_OCUPACION.Text = dt_FICHA_1.Rows(0).Item("v_Hj2_Ocupacion").ToString
          tx_HIJ2_EDAD.Text = dt_FICHA_1.Rows(0).Item("v_Hj2_Edad").ToString
          tx_HIJ3_NOMBRE.Text = dt_FICHA_1.Rows(0).Item("v_Hj3_Nombre").ToString
          tx_HIJ3_OCUPACION.Text = dt_FICHA_1.Rows(0).Item("v_Hj3_Ocupacion").ToString
          tx_HIJ3_EDAD.Text = dt_FICHA_1.Rows(0).Item("v_Hj3_Edad").ToString
          tx_HIJ4_NOMBRE.Text = dt_FICHA_1.Rows(0).Item("v_Hj4_Nombre").ToString
          tx_HIJ4_OCUPACION.Text = dt_FICHA_1.Rows(0).Item("v_Hj4_Ocupacion").ToString
          tx_HIJ4_EDAD.Text = dt_FICHA_1.Rows(0).Item("v_Hj4_Edad").ToString
          tx_EST_PRI.Text = dt_FICHA_1.Rows(0).Item("v_Est_Pri_Inst").ToString
          tx_EST_PRI_ULT.Text = dt_FICHA_1.Rows(0).Item("v_Est_Pri_anio").ToString
          tx_EST_SEC.Text = dt_FICHA_1.Rows(0).Item("v_Est_Sec_Inst").ToString
          tx_EST_SEC_ULT.Text = dt_FICHA_1.Rows(0).Item("v_Est_Sec_anio").ToString
          tx_EST_INS.Text = dt_FICHA_1.Rows(0).Item("v_Est_Ins_Inst").ToString
          tx_EST_INS_ULT.Text = dt_FICHA_1.Rows(0).Item("v_Est_Ins_anio").ToString
          tx_EST_UNI.Text = dt_FICHA_1.Rows(0).Item("v_Est_Uni_Ins").ToString
          tx_EST_UNI_ULT.Text = dt_FICHA_1.Rows(0).Item("v_Est_Uni_anio").ToString
          tx_EST_OTRO.Text = dt_FICHA_1.Rows(0).Item("v_Est_Otros").ToString
          tx_EST_OTRO_ULT.Text = dt_FICHA_1.Rows(0).Item("v_Est_Otros_anio").ToString
          tx_EST_GRD_ACT.Text = dt_FICHA_1.Rows(0).Item("v_Est_GradoObtenido").ToString
          img_Foto.Dispose()

          img_Foto.ImageUrl = cRutaImagenes & dt_FICHA_1.Rows(0).Item("V_FOT_01").ToString & "?" + DateTime.Now.Ticks.ToString

        End If
      End If

    Else

      s_Pais = dd_Pais.SelectedValue
      s_Depa = dd_Departamento.SelectedValue
      s_Prov = dd_Provincia.SelectedValue
      s_Dist = dd_Distrito.SelectedValue

      oComun.CargaCombo("root.v_ubi_pais", "UbigeoCOD", "UbigeoDES", "", dd_Pais, s_Pais)
      oComun.CargaCombo("root.v_ubi_Departamento", "UbigeoCOD", "UbigeoDES", "", dd_Departamento, s_Depa)
      oComun.CargaCombo("root.V_UBI_Provincia", "UbigeoCOD", "UbigeoDES", "SUBSTRING(UbigeoCOD,1,2)='" & s_Depa & "'", dd_Provincia, s_Prov, "-")
      oComun.CargaCombo("root.V_UBI_Distrito", "UbigeoCOD", "UbigeoDES", "SUBSTRING(UbigeoCOD,1,4)='" & s_Prov & "'", dd_Distrito, s_Dist, "-")



    End If

  End Sub

  Private Sub bt_next_Click(sender As Object, e As EventArgs) Handles bt_next.Click
    Dim wRet As Integer
    wRet = Graba_1()
    If wRet = 0 Then
      sid = Request.QueryString("id")
      Response.Redirect("f_FichaBasc_2.aspx?id=" & sid)
    End If
  End Sub

  Private Sub bt_prev_Click(sender As Object, e As EventArgs) Handles bt_prev.Click
    sid = Request.QueryString("id")
    Response.Redirect("f_FichaBasc_0.aspx?id=" & sid)
  End Sub

  Private Function Graba_1() As Integer
    Dim vRet As Integer = 0
    Try

      oComun.AgregaParametro("@c_NumDNI", "V", 10, cDocumento)
      oComun.AgregaParametro("@v_CODPER", "V", 8, cPeriodo)
      oComun.AgregaParametro("@c_CODTRB", "C", 8, "1")
      oComun.AgregaParametro("@d_Fecha", "D", 10, tx_Fecha.Text)
      oComun.AgregaParametro("@i_Sede", "I", 10, dd_Sede.SelectedValue)
      oComun.AgregaParametro("@v_Nombres", "V", 50, tx_Nombre.Text)
      oComun.AgregaParametro("@v_Apellidos", "V", 100, tx_Apellido.Text)
      oComun.AgregaParametro("@d_FecNac", "D", 10, IIf(tx_FechaNacimiento.Text = "", Now.Date, tx_FechaNacimiento.Text))
      oComun.AgregaParametro("@c_CodDIS", "V", 10, dd_Distrito.SelectedValue)
      oComun.AgregaParametro("@c_CodPRV", "V", 10, dd_Provincia.SelectedValue)
      oComun.AgregaParametro("@c_CodDEP", "V", 10, dd_Departamento.SelectedValue)
      oComun.AgregaParametro("@c_CodPAI", "V", 10, dd_Pais.SelectedValue)
      oComun.AgregaParametro("@v_Direccion", "V", 200, tx_Direccion.Text)
      oComun.AgregaParametro("@v_Referencia", "V", 500, tx_Referencias.Text)
      oComun.AgregaParametro("@i_EstCiv", "I", 10, dd_EstadoCivil.SelectedValue)
      oComun.AgregaParametro("@v_Telefono", "V", 50, tx_Telefono.Text)
      oComun.AgregaParametro("@v_Celular", "V", 50, tx_Celular.Text)
      oComun.AgregaParametro("@v_CyNombre", "V", 50, tx_ESPO_NOMBRE.Text)
      oComun.AgregaParametro("@v_CyApellidos", "V", 100, tx_ESPO_APELLIDOS.Text)
      oComun.AgregaParametro("@v_CyProfesion", "V", 160, tx_ESPO_PROFESION.Text)
      oComun.AgregaParametro("@v_CyEmpresa", "V", 50, tx_ESPO_EMPRESA.Text)
      oComun.AgregaParametro("@v_CyTelefono", "V", 50, tx_ESPO_TELEFONO.Text)
      oComun.AgregaParametro("@v_Hj1_Nombre", "V", 50, tx_HIJ1_NOMBRE.Text)
      oComun.AgregaParametro("@v_Hj1_Ocupacion", "V", 100, tx_HIJ1_OCUPACION.Text)
      oComun.AgregaParametro("@v_Hj1_Edad", "I", 10, IIf(tx_HIJ1_EDAD.Text.Trim = "", 0, tx_HIJ1_EDAD.Text))
      oComun.AgregaParametro("@v_Hj2_Nombre", "V", 50, tx_HIJ2_NOMBRE.Text)
      oComun.AgregaParametro("@v_Hj2_Ocupacion", "V", 100, tx_HIJ2_OCUPACION.Text)
      oComun.AgregaParametro("@v_Hj2_Edad", "I", 10, IIf(tx_HIJ2_EDAD.Text.Trim = "", 0, tx_HIJ2_EDAD.Text))
      oComun.AgregaParametro("@v_Hj3_Nombre", "V", 50, tx_HIJ3_NOMBRE.Text)
      oComun.AgregaParametro("@v_Hj3_Ocupacion", "V", 100, tx_HIJ3_OCUPACION.Text)
      oComun.AgregaParametro("@v_Hj3_Edad", "I", 10, IIf(tx_HIJ3_EDAD.Text.Trim = "", 0, tx_HIJ3_EDAD.Text))
      oComun.AgregaParametro("@v_Hj4_Nombre", "V", 50, tx_HIJ4_NOMBRE.Text)
      oComun.AgregaParametro("@v_Hj4_Ocupacion", "V", 100, tx_HIJ4_OCUPACION.Text)
      oComun.AgregaParametro("@v_Hj4_Edad", "I", 10, IIf(tx_HIJ4_EDAD.Text.Trim = "", 0, tx_HIJ4_EDAD.Text))
      oComun.AgregaParametro("@v_Est_Pri_Inst", "V", 50, tx_EST_PRI.Text)
      oComun.AgregaParametro("@v_Est_Pri_anio", "V", 20, tx_EST_PRI_ULT.Text)
      oComun.AgregaParametro("@v_Est_Sec_Inst", "V", 50, tx_EST_SEC.Text)
      oComun.AgregaParametro("@v_Est_Sec_anio", "V", 20, tx_EST_SEC_ULT.Text)
      oComun.AgregaParametro("@v_Est_Ins_Inst", "V", 50, tx_EST_INS.Text)
      oComun.AgregaParametro("@v_Est_Ins_anio", "V", 20, tx_EST_INS_ULT.Text)
      oComun.AgregaParametro("@v_Est_Uni_Ins", "V", 50, tx_EST_UNI.Text)
      oComun.AgregaParametro("@v_Est_Uni_anio", "V", 20, tx_EST_UNI_ULT.Text)
      oComun.AgregaParametro("@v_Est_Otros", "V", 50, tx_EST_OTRO.Text)
      oComun.AgregaParametro("@v_Est_Otros_anio", "V", 20, tx_EST_OTRO_ULT.Text)
      oComun.AgregaParametro("@v_Est_GradoObtenido", "V", 50, tx_EST_GRD_ACT.Text)

      If oComun.EjecutaTransaccion("basc.S_Ficha_Graba01") Then
        vRet = 0
      Else
        Mensaje_1(Me.Page, "Por favor Verifique su informacion.", "RH", "error")
        vRet = 1
      End If

    Catch ex As Exception
      vRet = 1

    End Try

    Return vRet
  End Function

  Public Shared Sub Mensaje_1(ByVal page As Page, ByVal message As String, ByVal title As String, Optional ByVal type As String = "info", Optional ByVal clearToast As Boolean = False, Optional ByVal pos As String = "toast-top-center", Optional ByVal Sticky As Boolean = False)
    Dim toastrScript As String = [String].Format("Notify('{0}','{1}','{2}', '{3}', '{4}', '{5}');", message, title, type, clearToast, pos, Sticky)
    page.ClientScript.RegisterStartupScript(page.[GetType](), "toastr_message", toastrScript, addScriptTags:=True)
  End Sub

  Function GrabaFoto(ByRef oUpload As FileUpload, ByRef oImagen As Image, nTipo As Integer) As String
    Dim cFileExt As String = Mid(oUpload.FileName.ToString, InStrRev(oUpload.FileName.ToString, "."), 5)

    Dim folderPath As String = Server.MapPath(cRutaImagenes)
    Dim cNomFile As String = oComun.ID & cFileExt

    oUpload.SaveAs(folderPath & cNomFile)
    oImagen.ImageUrl = cRutaImagenes & cNomFile

    Try
      oComun.AgregaParametro("@c_NumDNI", "V", 10, cDocumento)
      oComun.AgregaParametro("@Tipo", "I", 5, nTipo)
      oComun.AgregaParametro("@imagen", "V", 50, cNomFile)
      oComun.EjecutaTransaccion("basc.S_Ficha_Graba03")
    Catch ex As Exception
    End Try
    Return cRutaImagenes & cNomFile
  End Function
  Private Sub dd_Pais_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dd_Pais.SelectedIndexChanged

  End Sub

  Private Sub dd_Departamento_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dd_Departamento.SelectedIndexChanged
    dd_Provincia.SelectedValue = "-"
    dd_Distrito.SelectedValue = "-"
  End Sub
  Private Sub dd_Provincia_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dd_Provincia.SelectedIndexChanged
    dd_Distrito.SelectedValue = "-"
  End Sub

End Class
