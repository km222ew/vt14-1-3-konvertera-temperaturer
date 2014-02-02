<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TemperatureConverter.Default" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Konvertera Temperaturer</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        </div>

        <div>
            <%-- Starttemperatur --%>
            <asp:Label ID="StartTempLabel" runat="server" Text="Starttemperatur"></asp:Label>
            <asp:TextBox ID="StartTempInput" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="StartTempRequiredField" runat="server" ErrorMessage="Fyll i en starttemperatur." ControlToValidate="StartTempInput" Display="Dynamic">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="StartTempCompare" runat="server" ErrorMessage="Ange temperaturen i hela grader." ControlToValidate="StartTempInput" Display="Dynamic" Operator="DataTypeCheck" Type="Integer">*</asp:CompareValidator>

            <%-- Sluttemperatur --%>
            <asp:Label ID="EndTempLabel" runat="server" Text="Sluttemperatur"></asp:Label>
            <asp:TextBox ID="EndTempInput" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="EndTempRequiredField" runat="server" ErrorMessage="Fyll i sluttemperatur." ControlToValidate="EndTempInput" Display="Dynamic">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="EndTempCompare" runat="server" ErrorMessage="Sluttemperaturen måste vara ett heltal större än starttemperaturen." ControlToCompare="StartTempInput" ControlToValidate="EndTempInput" Display="Dynamic" Operator="GreaterThanEqual" Type="Integer">*</asp:CompareValidator>

            <%-- Temperatursteg --%>
            <asp:Label ID="TempStepLabel" runat="server" Text="Temperatursteg"></asp:Label>
            <asp:TextBox ID="TempStepInput" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="TempStepRequiredField" runat="server" ErrorMessage="Fyll i ett temperatursteg." ControlToValidate="TempStepInput" Display="Dynamic">*</asp:RequiredFieldValidator>
            <asp:RangeValidator ID="TempStepRange" runat="server" ErrorMessage="Temperatursteget måste vara ett heltal mellan 1 och 100." ControlToValidate="TempStepInput" Display="Dynamic" MaximumValue="100" MinimumValue="1" Type="Integer">*</asp:RangeValidator>

            <%-- Typ av konvertering --%>
            <asp:Label ID="ConvertTypeLabel" runat="server" Text="Typ av konvertering"></asp:Label>
            <asp:RadioButton ID="CelsToFahr" runat="server" GroupName="ConvertType" Text="Celsius till Fahrenheit" Checked="True" />
            <asp:RadioButton ID="FahrToCels" runat="server" GroupName="ConvertType" Text="Fahrenheit till Celsius" />

            <%-- Konverterings-knapp --%>
            <asp:Button ID="Submit" runat="server" Text="Konvertera" />
    
        </div>
    </form>
</body>
</html>
