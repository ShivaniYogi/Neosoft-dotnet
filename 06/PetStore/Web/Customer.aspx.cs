using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ShoeStore
{
    public partial class CustomerRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region "On Click of Save Button"
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (InsertData())
            {
                Clear();
                Page.ClientScript.RegisterStartupScript(GetType(), "message", "swal('Success','Your record has been inserted successfully!','success')", true);
            }
            else
            {
                Clear();
                Page.ClientScript.RegisterStartupScript(GetType(), "message", "swal({title: 'Failed!',text: 'Sorry, your record cannot be inserted. Please try again!',type: 'error'})", true);
            }
        }
        #endregion

        #region "Insert Customer Data"
        public bool InsertData()
        {
            bool FunctionReturnValue = false;

            try
            {
                SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["PetDbConnectionString"].ToString());
                SqlCommand SqlComm = new SqlCommand();

                SqlComm.Connection = SqlConn;
                SqlComm.CommandType = CommandType.StoredProcedure;
                SqlComm.CommandText = "InsertCustomerData";

                SqlComm.Parameters.AddWithValue("Name", TxtName.Text);
                SqlComm.Parameters.AddWithValue("Email", TxtEmail.Text);
                SqlComm.Parameters.AddWithValue("Zipcode", Convert.ToInt32(TxtZipCode.Text));
                SqlComm.Parameters.AddWithValue("UserName", TxtUserName.Text);
                SqlComm.Parameters.AddWithValue("Password", TxtPassword.Text);

                if(SqlConn.State == ConnectionState.Closed)
                {
                    SqlConn.Open();
                }

                SqlComm.ExecuteNonQuery();
               
                if (SqlConn.State == ConnectionState.Open)
                {
                    SqlConn.Close();
                }

                SqlComm.Dispose();
                SqlConn.Dispose();

                FunctionReturnValue = true;

            }
            catch(Exception ex)
            {
                throw ex;
            }


            return FunctionReturnValue;
        }
        #endregion

        #region "Clear Form"
        public void Clear()
        {
            TxtName.Text = "";
            TxtEmail.Text = "";
            TxtZipCode.Text = "";
            TxtUserName.Text = "";
            TxtPassword.Text = "";
            TxtConfirmPassword.Text = "";
        }
        #endregion
    }
}