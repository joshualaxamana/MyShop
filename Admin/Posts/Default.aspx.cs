using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Posts_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetPosts();
        }
    }

    void GetPosts()
    {
        using (SqlConnection con = new SqlConnection(Util.GetCon()))
        {
            con.Open();
            string SQL = @"SELECT p.PostID, p.PostDate, t.PostType,
                p.Title , p.FeaturedImage, p.Post, p.Keywords, p.Status
                FROM Posts p INNER JOIN PostTypes t ON p.TypeID = t.TypeID";

            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Posts");

                    lvPost.DataSource = ds;
                    lvPost.DataBind();
                }
            }
        }
    }
}