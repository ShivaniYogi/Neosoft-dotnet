<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="ShoeStore.CustomerRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- SweetAlert2 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="col-lg-7 mx-auto">
                <div class="card mt-5">                   
                    <div class="card-header text-center">
                        <h1>Registration</h1>
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-sm-4 text-right">Name</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="TxtName" AutoCompleteType="Disabled" class="form-control" runat="server" placeholder="Enter your Name"></asp:TextBox>
                            </div>
                        </div>                       
                        <div class="form-group row">
                            <label class="col-sm-4 text-right">Email</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="TxtEmail" AutoCompleteType="Disabled" class="form-control" runat="server" placeholder="Enter your Email"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 text-right">Zip Code</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="TxtZipCode" AutoCompleteType="Disabled" class="form-control" runat="server" placeholder="Enter your Zip Code"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 text-right">User Name</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="TxtUserName" AutoCompleteType="Disabled" class="form-control" runat="server" placeholder="Enter your Username"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 text-right">Password</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="TxtPassword" TextMode="Password" AutoCompleteType="Disabled" class="form-control" runat="server" placeholder="Enter your Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 text-right">Confirm Password</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="TxtConfirmPassword" TextMode="Password" AutoCompleteType="Disabled" class="form-control" runat="server" placeholder="Confirm your Password"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-center">
                        <div class="col-md-6 mx-auto">
                            <asp:Button ID="BtnSave" runat="server" Text="Save" class="btn btn-dark btn-block" OnClick="BtnSave_Click" OnClientClick="return ValidateForm()" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
    <script>

        function ValidateForm() {
            if (document.getElementById('<%=TxtName.ClientID%>').value == '') {
                alert("Please enter your name");
                document.getElementById('<%=TxtName.ClientID%>').focus();
                return false;
            }
            else if (document.getElementById('<%=TxtEmail.ClientID%>').value == '') {
                alert("Please enter your email");
                document.getElementById('<%=TxtEmail.ClientID%>').focus();
                return false;
            }
           else if (!validateEmail(document.getElementById('<%=TxtEmail.ClientID%>').value)) {
                alert("Please enter valid Email Address");
                document.getElementById('<%=TxtEmail.ClientID%>').focus();
                return false;
            }
            else if (document.getElementById('<%=TxtZipCode.ClientID%>').value == '') {
                alert("Please enter your zipcode");
                document.getElementById('<%=TxtZipCode.ClientID%>').focus();
                return false;
            }
            else if (document.getElementById('<%=TxtUserName.ClientID%>').value == '') {
                alert("Please enter your username");
                document.getElementById('<%=TxtUserName.ClientID%>').focus();
                return false;
            }
            else if (document.getElementById('<%=TxtPassword.ClientID%>').value == '') {
                alert("Please enter your password");
                document.getElementById('<%=TxtPassword.ClientID%>').focus();
                return false;
            }
            else if (document.getElementById('<%=TxtConfirmPassword.ClientID%>').value == '') {
                alert("Please confirm your password");
                document.getElementById('<%=TxtConfirmPassword.ClientID%>').focus();
                return false;
            }
            else if (document.getElementById('<%=TxtPassword.ClientID%>').value != document.getElementById('<%=TxtConfirmPassword.ClientID%>').value) {
                alert("Your password does not match");
                return false;
            }

            return true;
        }


        function validateEmail(email) {
            const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(String(email).toLowerCase());
        }


    </script>
</html>
