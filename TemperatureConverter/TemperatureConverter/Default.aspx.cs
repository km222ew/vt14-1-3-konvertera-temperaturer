using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TemperatureConverter
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                //Om celsius till fahrenheit inte är checkad, byt ut header-namnen i tabellen
                if (!CelsToFahr.Checked)
                {
                    FirstTempHeader.Text = "&degF";
                    SecondTempHeader.Text = "&degC";
                }

                for (int i = int.Parse(StartTempInput.Text); i <= int.Parse(EndTempInput.Text); i += int.Parse(TempStepInput.Text))
                {
                    //En ny tabell-rad skapas
                    TableRow tempRow = new TableRow();

                    //Den första tabell-cellen skapas, får en text och läggs till i raden
                    TableCell firstTempCell = new TableCell();
                    firstTempCell.Text = i.ToString();
                    tempRow.Cells.Add(firstTempCell);

                    //Den andra tabell-cellen skapas
                    TableCell secondTempCell = new TableCell();
                    //Om Celsius till Fahrenheit är checkad körs den, annars körs Fahrenheit till Celsius
                    secondTempCell.Text = CelsToFahr.Checked ?
                        secondTempCell.Text = Model.TemperatureConverter.CelsiusToFahrenheit(i).ToString() :
                        secondTempCell.Text = Model.TemperatureConverter.FahrenheitToCelsius(i).ToString();
                    tempRow.Cells.Add(secondTempCell);

                    //Lägger till raden i tabellen
                    Table.Rows.Add(tempRow);
                }

                //Visar tabellen
                Table.Visible = true;
            }
        }
    }
}