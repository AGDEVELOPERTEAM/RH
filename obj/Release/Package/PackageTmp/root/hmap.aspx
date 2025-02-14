<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="hmap.aspx.vb" Inherits="RH.hmap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>API Google Maps</title>
 
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/&sensor=false"></script>
    <script type="text/javascript">
        function Init() {
            var nLat = 0.0;
            var nLon = 0.0;
            var zoom = <%=18 %>;
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (position) {
                    nLat = position.coords.latitude;
                    nLon = position.coords.longitude;
                    document.getElementById("lat").value = nLat;
                    document.getElementById("lon").value = nLon;
                    MapIt(nLat, nLon, zoom);
                });
            }
        }
 
        function MapIt(lat, lon, zoom) {
            if (lat == null || lon == null || zoom  == null) {
                lat = document.getElementById("lat").value;
                lon = document.getElementById("lon").value;
                zoom = <%=Zoom %>;
            }
 
            var myOptions = {
                center: new google.maps.LatLng(lat, lon),
                zoom: zoom,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var mapGoogle = new google.maps.Map(document.getElementById("myMap"), myOptions);
        }
    </script>
 
</head>
<body>
    <form id="form1" runat="server">
        <asp:XmlDataSource ID="XmlDS" runat="server" DataFile="~/Places.xml"></asp:XmlDataSource>
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div style="margin: auto; width: 800px; height: 600px">
            <asp:UpdatePanel runat="server" ID="Panel">
                <ContentTemplate>
                    <div style="float: right; width: 200px; height: 400px;">
                        
                        <asp:Button runat="server" ID="BtnGo" Text="Ir!"
                        OnClientClick="MapIt()" OnClick="BtnGoClick" />
                        <asp:Literal runat="server" ID="TextCity"/>
                        <input id="lat" runat="server" type="hidden" />
                        <input id="lon" runat="server" type="hidden" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div id="myMap" style="float: left; width: 600px; height: 600px;">
                <script>Init('myMap')</script>
            </div>
        </div>
    </form>
</body>
</html>
