using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Deliveries_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GetDeliveries();
    }

    void GetDeliveries()
    {
        using (SqlConnection con = new SqlConnection(Util.GetCon()))
        {
            con.Open();
            string SQL = @"SELECT d.DeliveryNo, d.OrderNo,
                o.DateOrdered, d.Deadline,
                (SELECT SUM(Quantity) FROM OrderDetails
                WHERE OrderNo = d.OrderNo) AS TotalQuantity,
                d.DateDelivered, d.Status FROM Deliveries d
                INNER JOIN Orders o ON d.OrderNo = o.OrderNo
                ORDER BY o.DateOrdered DESC";

            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Deliveries");

                    lvDeliveries.DataSource = ds;
                    lvDeliveries.DataBind();
                }
            }

        }
    }

    void UpdateInventory(string productID, string quantity)
    {
        using (SqlConnection con = new SqlConnection(Util.GetCon()))
        {
            con.Open();
            string SQL = @"UPDATE Products SET Available = Available - @Quantity
                WHERE ProductID = @ProductID";

            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                cmd.Parameters.AddWithValue("@Quantity", quantity);
                cmd.Parameters.AddWithValue("@ProductID", productID);
                cmd.ExecuteNonQuery();
            }
        }
    }

    protected void lvDeliveries_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "deliver")
        {
            Literal ltOrderNo = (Literal)e.Item.FindControl("ltOrderNo");

            #region Step 1: Update Inventory Based from Order Details
            
            using (SqlConnection con = new SqlConnection(Util.GetCon()))
            {
                con.Open();
                string SQL = @"SELECT ProductID, Quantity FROM OrderDetails
                    WHERE OrderNo=@OrderNo";

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.AddWithValue("@OrderNo", ltOrderNo.Text);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            UpdateInventory(dr["ProductID"].ToString(),
                                dr["Quantity"].ToString());
                        }
                    }
                }
            }

            #endregion

            #region Step 2: Update Delivery Status to Delivered

            using (SqlConnection con = new SqlConnection(Util.GetCon()))
            {
                con.Open();
                string SQL = @"UPDATE Deliveries SET DateDelivered=@DateDelivered,
                    Status=@Status WHERE OrderNo=@OrderNo";

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@DateDelivered", DateTime.Now);
                    cmd.Parameters.AddWithValue("@Status", "Delivered");
                    cmd.Parameters.AddWithValue("@OrderNo", ltOrderNo.Text);
                    cmd.ExecuteNonQuery();
                }
            }

            #endregion

            #region Step 3: Update Order Status 

            using (SqlConnection con = new SqlConnection(Util.GetCon()))
            {
                con.Open();
                string SQL = @"UPDATE Orders SET Status=@Status
                    WHERE OrderNo=@OrderNo";

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@OrderNo", ltOrderNo.Text);
                    cmd.Parameters.AddWithValue("@Status", "Completed");
                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("Default.aspx");

            #endregion
        }
    }
}