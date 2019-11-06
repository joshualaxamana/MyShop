using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Admin_Quiz_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Util.GetCon()))
        {
            string SQL = @"INSERT INTO Couples VALUES (@Groom, @Bride,
                @WeddingDate, @Ceremony, @Reception, @DateAdded, 
                @Status, @DateModified)";

            con.Open();
            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                cmd.Parameters.AddWithValue("@Groom", txtGroom.Text);
                cmd.Parameters.AddWithValue("@Bride", txtBride.Text);
                cmd.Parameters.AddWithValue("@WeddingDate", txtDate.Text);
                cmd.Parameters.AddWithValue("@Ceremony", txtCeremony.Text);
                cmd.Parameters.AddWithValue("@Reception", txtReception.Text);
                cmd.Parameters.AddWithValue("@DateAdded", DateTime.Now);
                cmd.Parameters.AddWithValue("@Status", "Active");
                cmd.Parameters.AddWithValue("@DateModified", DBNull.Value);
                cmd.ExecuteNonQuery();
            }
        }

        Response.Redirect("Default.aspx");
    }
}