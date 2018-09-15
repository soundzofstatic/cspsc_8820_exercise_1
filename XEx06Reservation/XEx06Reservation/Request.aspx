<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Request.aspx.cs" Inherits="XEx06Reservation.Request" UICulture="en-US" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reservations</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <header class="jumbotron">
            <img src="Images/logo.png" alt="Royal Inns and Suites" />
        </header>

        <main>
            <form id="form1" runat="server" class="form-horizontal">
                <h1>Reservation Request</h1>

                <h3>Request data</h3>
                <div class="form-group">
                    <label for="txtArrivalDate" class="col-sm-3 control-label">Arrival Date</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtArrivalDate" runat="server" TextMode="Date"
                             CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvArrivalDate" runat="server"
                        Display="Dynamic"
                        ControlToValidate="txtArrivalDate"
                        CssClass="text-danger"
                        ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvArrivalDate" runat="server"
                        Display="Dynamic"
                        ControlToValidate="txtArrivalDate"
                        CssClass="text-danger"
                        Type="Date"
                        Operator="DataTypeCheck"
                        ErrorMessage="Arrival Date must be a valid Date."></asp:CompareValidator>
                </div>
                <div class="form-group">
                    <label for="txtDeapartureDate" class="col-sm-3 control-label">Departure Date</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtDepartureDate" runat="server" TextMode="Date"
                             CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvDepartureDate" runat="server"
                        Display="Dynamic"
                        ControlToValidate="txtDepartureDate"
                        CssClass="text-danger"
                        ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvDepartureDate" runat="server" CssClass="text-danger"
                        Display="Dynamic"
                        Type="Date"
                        Operator="GreaterThan"
                        ControlToCompare="txtArrivalDate"
                        ControlToValidate="txtDepartureDate"
                        ErrorMessage="Departure Date must be after Arrival date"></asp:CompareValidator>
                </div>
                <div class="form-group">
                    <label for="ddlNumberPeople" class="col-sm-3 control-label">Number of people</label>
                    <div class="col-sm-4">
                       <asp:DropDownList ID="ddlNumberPeople" runat="server" CssClass="form-control">
                           <asp:ListItem Value="">Select</asp:ListItem>
                           <asp:ListItem Value="1">1</asp:ListItem>
                           <asp:ListItem Value="2">2</asp:ListItem>
                           <asp:ListItem Value="3">3</asp:ListItem>
                           <asp:ListItem Value="4">4</asp:ListItem>
                       </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label for="rblBedType" class="col-sm-3 control-label">Bed type</label>
                    <div class="col-sm-9 bedtype">
                        <asp:RadioButtonList ID="rblBedType" runat="server">
                            <asp:ListItem>King</asp:ListItem>
                            <asp:ListItem>Two Queens</asp:ListItem>
                            <asp:ListItem>One Queen</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </div>

                <h3>Contact information</h3>
                <div class="form-group">
                    <label for="txtFirstName" class="col-sm-3 control-label">First Name</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                        Display="Dynamic"
                        ControlToValidate="txtFirstName"
                        CssClass="text-danger"
                        ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="txtLastName" class="col-sm-3 control-label">Last Name</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                     <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName"
                                CssClass="text-danger" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="txtEmail" class="col-sm-3 control-label">Email address</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="you@example.com"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        Display="Dynamic"
                        ControlToValidate="txtEmail"
                        CssClass="text-danger"
                        ErrorMessage="Required Field"></asp:RequiredFieldValidator>

                    <!-- https://regexr.com/3vi15 -->
                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        Display="Dynamic"
                        CssClass="text-danger"
                        ValidationExpression="([A-Za-z0-9.]+)\@([A-Za-z0-9.]+)\.([A-Za-z]+)"
                        ControlToValidate="txtEmail">Must be a valid email address</asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label for="txtPhoneNumber" class="col-sm-3 control-label">Telephone number</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" TextMode="Phone" placeholder="555-555-5555"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server"
                        Display="Dynamic"
                        ControlToValidate="txtPhoneNumber"
                        CssClass="text-danger"
                        ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                    <!-- https://regexr.com/3vi12 -->
                    <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server"
                        Display="Dynamic"
                        CssClass="text-danger"
                        ValidationExpression="\d{10}|((\(\d{3}\))|(\d{3})|(\d{6}))(|[\s.-])((\d{3}[\s.-]\d{4})|(\d{7})|(\d{4}))"
                        ControlToValidate="txtPhoneNumber">Must be a valid US Phone Number</asp:RegularExpressionValidator>
                </div>

                <%-- Submit and Clear buttons --%>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                             CssClass="btn btn-primary" OnClick="btnSubmit_click" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear"
                             CssClass="btn btn-danger" OnClick="btnClear_click"  />
                    </div>
                </div>
            </form>

             <%-- message label --%>
            <div id="acknowledgement" runat="server">
                <div class="row">
                    <div class="col confirmation">
                        <asp:Label ID="lblMessage" runat="server" CssClass="text-info"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col confirmation-details">
                        <pre>
                            First Name: <asp:Label ID="lblFirstNameConfirmation" runat="server" CssClass="text-bold"></asp:Label>
                            Last Name: <asp:Label ID="lblLastNameConfirmation" runat="server" CssClass="text-bold"></asp:Label>
                            Email: <asp:Label ID="lblEmail" runat="server" CssClass="text-bold"></asp:Label>
                            Phone: <asp:Label ID="lblPhone" runat="server" CssClass="text-bold"></asp:Label>
                            Bed Type: <asp:Label ID="lblBedType" runat="server" CssClass="text-bold"></asp:Label>
                            Number of People: <asp:Label ID="lblNumberPeople" runat="server" CssClass="text-bold"></asp:Label>
                            Arrival Date: <asp:Label ID="lblArrivalDate" runat="server" CssClass="text-bold"></asp:Label>
                            Departure Date: <asp:Label ID="lblDepartureDate" runat="server" CssClass="text-bold"></asp:Label>
                        </pre>
                    </div>
                </div>
            </div>

        </main>

        <footer>
            <p>&copy; <asp:Label ID="lblYear" runat="server"></asp:Label> 
                Royal Inns and Suites</p>
        </footer>
    </div>
    
</body>
</html>