<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TemperatureConverter.Default" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Konvertera Temperaturer</title>
    <link href="~/Content/Style.css" rel="stylesheet" type="text/css" />

</head>
<body>

    <h1>Konvertera Temperaturer</h1>

    <div id="container">

        <form id="form" runat="server">

            <div>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error" />
            </div>

            <div>

                <%-- Starttemperatur --%>
                <asp:Label ID="StartTempLabel" runat="server" Text="Starttemperatur" CssClass="info"></asp:Label>
                <asp:TextBox ID="StartTempInput" runat="server" CssClass="input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="StartTempRequiredField" runat="server" ErrorMessage="Fyll i en starttemperatur." ControlToValidate="StartTempInput" Display="Dynamic" CssClass="error">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="StartTempCompare" runat="server" ErrorMessage="Ange temperaturen i hela grader." ControlToValidate="StartTempInput" Display="Dynamic" Operator="DataTypeCheck" Type="Integer" CssClass="error">*</asp:CompareValidator>

                <%-- Sluttemperatur --%>
                <asp:Label ID="EndTempLabel" runat="server" Text="Sluttemperatur" CssClass="info"></asp:Label>
                <asp:TextBox ID="EndTempInput" runat="server" CssClass="input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EndTempRequiredField" runat="server" ErrorMessage="Fyll i sluttemperatur." ControlToValidate="EndTempInput" Display="Dynamic" CssClass="error">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="EndTempCompare" runat="server" ErrorMessage="Sluttemperaturen måste vara ett heltal större än starttemperaturen." ControlToCompare="StartTempInput" ControlToValidate="EndTempInput" Display="Dynamic" Operator="GreaterThanEqual" Type="Integer" CssClass="error">*</asp:CompareValidator>

                <%-- Temperatursteg --%>
                <asp:Label ID="TempStepLabel" runat="server" Text="Temperatursteg" CssClass="info"></asp:Label>
                <asp:TextBox ID="TempStepInput" runat="server" CssClass="input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="TempStepRequiredField" runat="server" ErrorMessage="Fyll i ett temperatursteg." ControlToValidate="TempStepInput" Display="Dynamic" CssClass="error">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="TempStepRange" runat="server" ErrorMessage="Temperatursteget måste vara ett heltal mellan 1 och 100." ControlToValidate="TempStepInput" Display="Dynamic" MaximumValue="100" MinimumValue="1" Type="Integer" CssClass="error">*</asp:RangeValidator>

                <%-- Typ av konvertering --%>
                <asp:Label ID="ConvertTypeLabel" runat="server" Text="Typ av konvertering" CssClass="info"></asp:Label>
                <div class="margin">
                    <asp:RadioButton ID="CelsToFahr" runat="server" GroupName="ConvertType" Text="Celsius till Fahrenheit" Checked="True" />
                </div>
                <div class="margin">
                    <asp:RadioButton ID="FahrToCels" runat="server" GroupName="ConvertType" Text="Fahrenheit till Celsius" />
                </div>

                <%-- Konverterings-knapp --%>
                <asp:Button ID="Submit" runat="server" Text="Konvertera" OnClick="Submit_Click" CssClass="submit" />
    
            </div>
        </form>

        <%-- Tabell med temperatur-datan --%>
        
            <asp:Table ID="Table" runat="server" Visible="False">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell ID="FirstTempHeader">&degC</asp:TableHeaderCell>
                    <asp:TableHeaderCell ID="SecondTempHeader">&degF</asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>
        

    </div>
</body>
</html>
