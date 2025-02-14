Imports System.Security.Cryptography

Public Class f_FichaBasc_2
  Inherits System.Web.UI.Page

  Dim oComun As New cl_COMUN_AD
  Dim cRutaImagenes As String = "~/Files/SEG/"
  Dim sid As String = ""
  Dim oUSUARIO_EN As New cl_USUARIO_EN
  Dim oUSUARIO_LN As New cl_USUARIO_LN
  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    sid = Request.QueryString("id")
    If sid <> "" Then
      oUSUARIO_EN.KeyAcceso = sid
      oUSUARIO_EN = oUSUARIO_LN.LN_USUARIO_CARGA(oUSUARIO_EN)
      cDocumento = oUSUARIO_EN.Documento
      cPeriodo = oUSUARIO_EN.Periodo
    Else
      Response.Redirect("/login.aspx")
    End If


    'Dim SGalleta As HttpCookie = Request.Cookies("RH")
    'cDocumento = SGalleta.Values("nd")
    'cPeriodo = SGalleta.Values("pe")

    If Not IsPostBack() Then


      Dim dt_FICHA_2 As DataTable
      Dim cSql As String = ""
      cSql = "SELECT * FROM basc.Ficha WHERE c_NumDNI='" + cDocumento + "' AND v_codper='" + cPeriodo + "'"
      dt_FICHA_2 = oComun.EjecutaCadenaSQL(cSql)
      If dt_FICHA_2.Rows.Count > 0 Then

        tx_EXPLAB_EMP_1.Text = dt_FICHA_2.Rows(0).Item("v_Exp01_Empresa").ToString
        tx_EXPLAB_CAR_1.Text = dt_FICHA_2.Rows(0).Item("v_Exp01_Cargo").ToString
        tx_EXPLAB_TMP_1.Text = dt_FICHA_2.Rows(0).Item("v_Exp01_Perm").ToString
        tx_EXPLAB_JEF_1.Text = dt_FICHA_2.Rows(0).Item("v_Exp01_Jefe").ToString
        tx_EXPLAB_TLF_1.Text = dt_FICHA_2.Rows(0).Item("v_Exp01_Telf").ToString
        tx_EXPLAB_MTR_1.Text = dt_FICHA_2.Rows(0).Item("v_Exp01_Motivo").ToString
        tx_EXPLAB_FRE_1.Text = If(dt_FICHA_2.Rows(0).Item("d_Exp01_FechaRet").ToString <> "", Format(dt_FICHA_2.Rows(0).Item("d_Exp01_FechaRet"), "yyyy-MM-dd"), "")

        tx_EXPLAB_EMP_2.Text = dt_FICHA_2.Rows(0).Item("v_Exp02_Empresa").ToString
        tx_EXPLAB_CAR_2.Text = dt_FICHA_2.Rows(0).Item("v_Exp02_Cargo").ToString
        tx_EXPLAB_TMP_2.Text = dt_FICHA_2.Rows(0).Item("v_Exp02_Perm").ToString
        tx_EXPLAB_JEF_2.Text = dt_FICHA_2.Rows(0).Item("v_Exp02_Jefe").ToString
        tx_EXPLAB_TLF_2.Text = dt_FICHA_2.Rows(0).Item("v_Exp02_Telf").ToString
        tx_EXPLAB_MTR_2.Text = dt_FICHA_2.Rows(0).Item("v_Exp02_Motivo").ToString
        tx_EXPLAB_FRE_2.Text = If(dt_FICHA_2.Rows(0).Item("d_Exp02_FechaRet").ToString <> "", Format(dt_FICHA_2.Rows(0).Item("d_Exp02_FechaRet"), "yyyy-MM-dd"), "")

        tx_EXPLAB_EMP_3.Text = dt_FICHA_2.Rows(0).Item("v_Exp03_Empresa").ToString
        tx_EXPLAB_CAR_3.Text = dt_FICHA_2.Rows(0).Item("v_Exp03_Cargo").ToString
        tx_EXPLAB_TMP_3.Text = dt_FICHA_2.Rows(0).Item("v_Exp03_Perm").ToString
        tx_EXPLAB_JEF_3.Text = dt_FICHA_2.Rows(0).Item("v_Exp03_Jefe").ToString
        tx_EXPLAB_TLF_3.Text = dt_FICHA_2.Rows(0).Item("v_Exp03_Telf").ToString
        tx_EXPLAB_MTR_3.Text = dt_FICHA_2.Rows(0).Item("v_Exp03_Motivo").ToString
        tx_EXPLAB_FRE_3.Text = If(dt_FICHA_2.Rows(0).Item("d_Exp03_FechaRet").ToString <> "", Format(dt_FICHA_2.Rows(0).Item("d_Exp03_FechaRet"), "yyyy-MM-dd"), "")


        Dim wTipo As Integer = 0
        wTipo = IIf(IsDBNull(dt_FICHA_2.Rows(0).Item("v_Viv_Tipo")), 0, dt_FICHA_2.Rows(0).Item("v_Viv_Tipo"))
        rad_tipvivPro.Checked = (wTipo = 1)
        rad_tipvivAlq.Checked = (wTipo = 2)
        rad_tipvivFam.Checked = (wTipo = 3)
        rad_tipvivOtr.Checked = (wTipo = 4)

        'dt_Ficha_2.rows(0).item("v_Viv_Otros", "V", 100, "")

        tx_VEH_MARCA.Text = dt_FICHA_2.Rows(0).Item("v_Veh_Marca").ToString
        tx_VEH_MODELO.Text = dt_FICHA_2.Rows(0).Item("v_Veh_Modelo").ToString
        tx_VEH_PLACA.Text = dt_FICHA_2.Rows(0).Item("v_Veh_Placa").ToString
        tx_VEH_FABRICACION.Text = If(dt_FICHA_2.Rows(0).Item("i_Veh_Anio").ToString.Trim = "", 0, dt_FICHA_2.Rows(0).Item("i_Veh_Anio").ToString.Trim)
        tx_VEH_VALOR.Text = If(dt_FICHA_2.Rows(0).Item("i_Veh_Valor").ToString.Trim = "", 0, dt_FICHA_2.Rows(0).Item("i_Veh_Valor").ToString.Trim)
        tx_VEH_LICENCIA.Text = dt_FICHA_2.Rows(0).Item("v_Veh_Licencia").ToString

        tx_SOC_NOM_1.Text = dt_FICHA_2.Rows(0).Item("v_Soc01_Nombre").ToString
        tx_SOC_RUC_1.Text = dt_FICHA_2.Rows(0).Item("v_Soc01_Ruc").ToString
        tx_SOC_DIR_1.Text = dt_FICHA_2.Rows(0).Item("v_Soc01_Direccion").ToString
        tx_SOC_CAR_1.Text = dt_FICHA_2.Rows(0).Item("v_Soc01_Cargo").ToString
        tx_SOC_TLF_1.Text = dt_FICHA_2.Rows(0).Item("v_Soc01_Telefono").ToString

        tx_SOC_NOM_2.Text = dt_FICHA_2.Rows(0).Item("v_Soc02_Nombre").ToString
        tx_SOC_RUC_2.Text = dt_FICHA_2.Rows(0).Item("v_Soc02_Ruc").ToString
        tx_SOC_DIR_2.Text = dt_FICHA_2.Rows(0).Item("v_Soc02_Direccion").ToString
        tx_SOC_CAR_2.Text = dt_FICHA_2.Rows(0).Item("v_Soc02_Cargo").ToString
        tx_SOC_TLF_2.Text = dt_FICHA_2.Rows(0).Item("v_Soc02_Telefono").ToString

        tx_FTEING_DesActividad.Text = dt_FICHA_2.Rows(0).Item("v_Ing_DescActividad").ToString
        tx_FTEING_Procedencia.Text = dt_FICHA_2.Rows(0).Item("v_Ing_Procedencia").ToString
        tx_FTEING_Empresa.Text = dt_FICHA_2.Rows(0).Item("v_Ing_NomEmpresa").ToString
        tx_FTEING_RUC.Text = dt_FICHA_2.Rows(0).Item("v_Ing_RucEmpresa").ToString
        tx_FTEING_Direccion.Text = dt_FICHA_2.Rows(0).Item("v_Ing_Direccion").ToString
        tx_FTEING_Telefono.Text = dt_FICHA_2.Rows(0).Item("v_Ing_Telefono").ToString
        tx_FTEING_Tiempo.Text = dt_FICHA_2.Rows(0).Item("v_Ing_Tiempo").ToString
        tx_FTEING_Ingresos.Text = dt_FICHA_2.Rows(0).Item("v_Ing_Ingreso").ToString




      End If
    End If

  End Sub

  Private Sub bt_prev_Click(sender As Object, e As EventArgs) Handles bt_prev.Click
    Dim wRet As Integer
    wRet = Graba_2()
    If wRet = 0 Then
      Response.Redirect("f_FichaBasc_1.aspx?id=" & Request.QueryString("id"))
    End If

  End Sub

  Private Sub bt_next_Click(sender As Object, e As EventArgs) Handles bt_next.Click

    Dim wRet As Integer
    wRet = Graba_2()
    If wRet = 0 Then
      Response.Redirect("f_FichaBasc_3.aspx?id=" & Request.QueryString("id"))
    End If

  End Sub

  Private Function Graba_2() As Integer
    Dim TipoVivienda As Integer = 0


    sid = Request.QueryString("id")
    If sid <> "" Then
      oUSUARIO_EN.KeyAcceso = sid
      oUSUARIO_EN = oUSUARIO_LN.LN_USUARIO_CARGA(oUSUARIO_EN)
      cDocumento = oUSUARIO_EN.Documento
      cPeriodo = oUSUARIO_EN.Periodo
    Else
      Response.Redirect("/login.aspx")
    End If


    Dim vRet As Integer = 0
    Try


      oComun.AgregaParametro("@c_NumDNI", "V", 10, cDocumento)
      oComun.AgregaParametro("@v_CodPer", "C", 8, cPeriodo)
      oComun.AgregaParametro("@v_Exp01_Empresa", "V", 50, tx_EXPLAB_EMP_1.Text)
      oComun.AgregaParametro("@v_Exp01_Cargo", "V", 50, tx_EXPLAB_CAR_1.Text)
      oComun.AgregaParametro("@v_Exp01_Perm", "I", 3, Val(tx_EXPLAB_TMP_1.Text))
      oComun.AgregaParametro("@v_Exp01_Jefe", "V", 50, tx_EXPLAB_JEF_1.Text)
      oComun.AgregaParametro("@v_Exp01_Telf", "V", 50, tx_EXPLAB_TLF_1.Text)
      oComun.AgregaParametro("@v_Exp01_Motivo", "V", 200, tx_EXPLAB_MTR_1.Text)
      If tx_EXPLAB_FRE_1.Text <> "" Then oComun.AgregaParametro("@d_Exp01_FechaRet", "D", 10, CDate(tx_EXPLAB_FRE_1.Text))

      oComun.AgregaParametro("@v_Exp02_Empresa", "V", 50, tx_EXPLAB_EMP_2.Text)
      oComun.AgregaParametro("@v_Exp02_Cargo", "V", 50, tx_EXPLAB_CAR_2.Text)
      oComun.AgregaParametro("@v_Exp02_Perm", "I", 3, Val(tx_EXPLAB_TMP_2.Text))
      oComun.AgregaParametro("@v_Exp02_Jefe", "V", 50, tx_EXPLAB_JEF_2.Text)
      oComun.AgregaParametro("@v_Exp02_Telf", "V", 50, tx_EXPLAB_TLF_2.Text)
      oComun.AgregaParametro("@v_Exp02_Motivo", "V", 200, tx_EXPLAB_MTR_2.Text)
      If tx_EXPLAB_FRE_2.Text <> "" Then oComun.AgregaParametro("@d_Exp02_FechaRet", "D", 10, CDate(tx_EXPLAB_FRE_2.Text))

      oComun.AgregaParametro("@v_Exp03_Empresa", "V", 50, tx_EXPLAB_EMP_3.Text)
      oComun.AgregaParametro("@v_Exp03_Cargo", "V", 50, tx_EXPLAB_CAR_3.Text)
      oComun.AgregaParametro("@v_Exp03_Perm", "I", 3, Val(tx_EXPLAB_TMP_3.Text))
      oComun.AgregaParametro("@v_Exp03_Jefe", "V", 50, tx_EXPLAB_JEF_3.Text)
      oComun.AgregaParametro("@v_Exp03_Telf", "V", 50, tx_EXPLAB_TLF_3.Text)
      oComun.AgregaParametro("@v_Exp03_Motivo", "V", 200, tx_EXPLAB_MTR_3.Text)
      If tx_EXPLAB_FRE_3.Text <> "" Then oComun.AgregaParametro("@d_Exp03_FechaRet", "D", 10, CDate(tx_EXPLAB_FRE_3.Text))

      TipoVivienda = 0
      TipoVivienda = IIf(rad_tipvivPro.Checked, 1, TipoVivienda)
      TipoVivienda = IIf(rad_tipvivAlq.Checked, 2, TipoVivienda)
      TipoVivienda = IIf(rad_tipvivFam.Checked, 3, TipoVivienda)
      TipoVivienda = IIf(rad_tipvivOtr.Checked, 4, TipoVivienda)

      oComun.AgregaParametro("@v_Viv_Tipo", "I", 1, TipoVivienda)
      oComun.AgregaParametro("@v_Viv_Otros", "V", 100, "")

      oComun.AgregaParametro("@v_Veh_Marca", "V", 50, tx_VEH_MARCA.Text)
      oComun.AgregaParametro("@v_Veh_Modelo", "V", 50, tx_VEH_MODELO.Text)
      oComun.AgregaParametro("@v_Veh_Placa", "V", 10, tx_VEH_PLACA.Text)
      oComun.AgregaParametro("@i_Veh_Anio", "I", 4, Val(tx_VEH_FABRICACION.Text))
      oComun.AgregaParametro("@i_Veh_Valor", "I", 6, Val(tx_VEH_VALOR.Text))
      oComun.AgregaParametro("@v_Veh_Licencia", "V", 20, tx_VEH_LICENCIA.Text)

      oComun.AgregaParametro("@v_Soc01_Nombre", "V", 50, tx_SOC_NOM_1.Text)
      oComun.AgregaParametro("@v_Soc01_Ruc", "V", 20, tx_SOC_RUC_1.Text)
      oComun.AgregaParametro("@v_Soc01_Direccion", "V", 200, tx_SOC_DIR_1.Text)
      oComun.AgregaParametro("@v_Soc01_Cargo", "V", 50, tx_SOC_CAR_1.Text)
      oComun.AgregaParametro("@v_Soc01_Telefono", "V", 50, tx_SOC_TLF_1.Text)

      oComun.AgregaParametro("@v_Soc02_Nombre", "V", 50, tx_SOC_NOM_2.Text)
      oComun.AgregaParametro("@v_Soc02_Ruc", "V", 20, tx_SOC_RUC_2.Text)
      oComun.AgregaParametro("@v_Soc02_Direccion", "V", 200, tx_SOC_DIR_2.Text)
      oComun.AgregaParametro("@v_Soc02_Cargo", "V", 50, tx_SOC_CAR_2.Text)
      oComun.AgregaParametro("@v_Soc02_Telefono", "V", 50, tx_SOC_TLF_2.Text)

      oComun.AgregaParametro("@v_Ing_DescActividad", "V", 200, tx_FTEING_DesActividad.Text)
      oComun.AgregaParametro("@v_Ing_Procedencia", "V", 50, tx_FTEING_Procedencia.Text)
      oComun.AgregaParametro("@v_Ing_NomEmpresa", "V", 200, tx_FTEING_Empresa.Text)
      oComun.AgregaParametro("@v_Ing_RucEmpresa", "V", 20, tx_FTEING_RUC.Text)
      oComun.AgregaParametro("@v_Ing_Direccion", "V", 20, tx_FTEING_Direccion.Text)
      oComun.AgregaParametro("@v_Ing_Telefono", "V", 20, tx_FTEING_Telefono.Text)
      oComun.AgregaParametro("@v_Ing_Tiempo", "V", 20, tx_FTEING_Tiempo.Text)
      oComun.AgregaParametro("@v_Ing_Ingreso", "I", 6, Val(tx_FTEING_Ingresos.Text))

      If oComun.EjecutaTransaccion("basc.S_Ficha_Graba02") Then
        vRet = 0
      Else
        Mensaje_2(Me.Page, "Por favor Verifique su informacion.", "RH", "error")
        vRet = 1
      End If

    Catch ex As Exception
      vRet = 1

    End Try

    Return vRet

  End Function

  Public Shared Sub Mensaje_2(ByVal page As Page, ByVal message As String, ByVal title As String, Optional ByVal type As String = "info", Optional ByVal clearToast As Boolean = False, Optional ByVal pos As String = "toast-top-center", Optional ByVal Sticky As Boolean = False)
    Dim toastrScript As String = [String].Format("Notify('{0}','{1}','{2}', '{3}', '{4}', '{5}');", message, title, type, clearToast, pos, Sticky)
    page.ClientScript.RegisterStartupScript(page.[GetType](), "toastr_message", toastrScript, addScriptTags:=True)
  End Sub

End Class
