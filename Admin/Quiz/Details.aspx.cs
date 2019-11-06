using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Admin_Quiz_Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // user did not select a record
        if (Request.QueryString["ID"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else // user selected a record
        {
            int coupleID = 0; // initial value
            bool validCouple = int.TryParse(
                Request.QueryString["ID"].ToString(),
                out couplerID);
            if (validCouple) // ID is valid
            {
                if (!IsPostBack)
                {
                    GetData(coupleID);
                }
            }
            else // ID is invalid (or NOT a number)
            {
                Response.Redirect("Default.aspx");
            }
        }
    }

    void GetData(int ID)
    {
        using (SqlConnection con = new SqlConnection(Util.GetCon()))
        {
            string SQL = @"SELECT CoupleID, Groom, Bride,
                WeddingDate, Ceremony, Reception, Status FROM Couples
                WHERE CoupleID=@CoupleID";

            con.Open();

            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                cmd.Parameters.AddWithValue("@coupleID", ID);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.HasRows) // record is existing
                    {
                        while (dr.Read())
                        {
                            ltID.Text = dr["CoupleID"].ToString();
                            txtGroom.Text = dr["Groom"].ToString();
                            txtBride.Text = dr["Bride"].ToString();
                            txtCeremony.Text = dr["Ceremony"].ToString();
                            txtReception.Text = dr["Reception"].ToString();
                            ddlStatus.SelectedValue = dr["Status"].ToString();
                        }
                    }
                }

            }

        }
    }
}