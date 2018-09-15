using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XEx06Reservation
{
    public partial class Request : System.Web.UI.Page
    {
        private string currentDate = DateTime.Today.ToShortDateString();
        private string currentYear = DateTime.Today.Year.ToString();

        protected void Page_Load(object sender, EventArgs e)
        {

            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            // https://www.codeproject.com/questions/302329/how-to-force-clear-cache-in-asp-net
            // The browser would not release cached data, such as CSS without telling the server to not hold onto it
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();

            // Hide the Acknowledgement Section
            acknowledgement.Visible = false;

        }

        protected void btnSubmit_click(object sender, EventArgs e)
        {
            
            if (IsValid)
            {
                form1.Visible = false;
                acknowledgement.Visible = true;

                lblMessage.Text = "Thank you for your request.<br/>";
                lblMessage.Text += "We will get back to you within 24 hours.";

                lblFirstNameConfirmation.Text = txtFirstName.Text;
                lblLastNameConfirmation.Text = txtLastName.Text;
                lblEmail.Text = txtEmail.Text;
                lblPhone.Text = txtPhoneNumber.Text;
                lblBedType.Text = rblBedType.SelectedValue;
                lblNumberPeople.Text = ddlNumberPeople.SelectedValue;
                lblArrivalDate.Text= txtArrivalDate.Text;
                lblDepartureDate.Text = txtDepartureDate.Text;

            }


        }

        protected void btnClear_click(object sender, EventArgs e)
        {

            // Text
            txtDepartureDate.Text = null;
            txtArrivalDate.Text = null;
            txtFirstName.Text = null;
            txtLastName.Text = null;
            txtEmail.Text = null;
            txtPhoneNumber.Text = null;
            
            // Drop Down Lists
            ddlNumberPeople.SelectedIndex = -1;

            // Radios
            rblBedType.SelectedIndex = -1;

            //rdoKing.s = null;

        }
    }
}