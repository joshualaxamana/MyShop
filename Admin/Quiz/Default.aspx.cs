using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Admin_Quiz_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetCouples();
        }
    }

    void GetCouples()
    {
        using (SqlConnection con = new SqlConnection(Util.GetCon()))
        {
            string SQL = @"SELECT CoupleID, Groom + '&' + Bride AS CoupleName, WeddingDate,
                Ceremony, Reception, DateAdded, Status
                FROM Couples";

            con.Open();

            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Couples");

                    lvCouples.DataSource = ds;
                    lvCouples.DataBind();
                }
            }
        }
    }

    // method overloading
    void GetSuppliers(string keyword)
    {
        using (SqlConnection con = new SqlConnection(Util.GetCon()))
        {
            string SQL = @"SELECT CoupleID, Groom + '&' + Bride AS CoupleName, WeddingDate,
                Ceremony, Reception, DateAdded, Status
                FROM Couples WHERE CoupleID LIKE @keyword OR
                CoupleName LIKE @keyword OR
                Ceremony LIKE @keyword OR
                Reception LIKE @keyword";

            con.Open();

            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                cmd.Parameters.AddWithValue("@keyword",
                    "%" + keyword + "%");

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Couples");

                    lvCouples.DataSource = ds;
                    lvCouples.DataBind();
                }
            }
        }
    }

    protected void lvCouples_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "archive") // user clicks delete icon
        {
            Literal ltSupplierID = (Literal)e.Item.FindControl("ltCoupleID");

            using (SqlConnection con = new SqlConnection(Util.GetCon()))
            {
                string SQL = @"UPDATE Couples SET Status=@Status,
                    DateModified=@DateModified WHERE CoupleID=@ID";

                con.Open();

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.AddWithValue("@Status", "Archived");
                    cmd.Parameters.AddWithValue("@DateModified", DateTime.Now);
                    cmd.Parameters.AddWithValue("@CoupleID", ltSupplierID.Text);
                    cmd.ExecuteNonQuery();
                }

            }
        }
        GetCouples();
    }

    protected void lvCouples_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpCouples.SetPageProperties(e.StartRowIndex,
            e.MaximumRows, false);
        GetCouples();
    }
    protected void lvCouples_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        dpCouples.Visible = dpCouples.TotalRowCount >
            dpCouples.PageSize;
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtKeyword.Text == "")
            GetCouples();
        else
            GetSuppliers(txtKeyword.Text);
    }
}