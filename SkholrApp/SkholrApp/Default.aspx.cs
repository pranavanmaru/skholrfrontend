using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkholrApp
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable subjects = new DataTable();
            string connString = ConfigurationManager.ConnectionStrings["RDSConn"].ToString();
            using (MySqlConnection con = new MySqlConnection(connString))
            {
                try
                {
                    MySqlDataAdapter adapter = new MySqlDataAdapter("select TopicId, TopicName from Topic;", con);
                    adapter.Fill(subjects);

                    ddlTopic.DataSource = subjects;
                    ddlTopic.DataTextField = "TopicName";
                    ddlTopic.DataValueField = "TopicId";
                    ddlTopic.DataBind();
                }
                catch (Exception ex)
                {
                    // Handle the error
                }

            }
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            String savePath = @"~/Uploads/";

            if (FileUpload1.HasFile)
            {
                String fileName = FileUpload1.FileName;
                savePath += fileName;
                string absFilePath = Server.MapPath(savePath);
                FileUpload1.SaveAs(Server.MapPath(savePath));
                UploadStatusLabel.Visible = false;

                int response = UploadObject.WritingAnObject(fileName, absFilePath);
                if(response == 1)
                {
                    UploadStatusLabel.Text = "Successfully uploaded.";

                    string connString = ConfigurationManager.ConnectionStrings["RDSConn"].ToString();
                    using (MySqlConnection con = new MySqlConnection(connString))
                    {
                        try
                        {
                            con.Open();
                            int topicId = Convert.ToInt32(ddlTopic.SelectedValue);
                            string keywords = txtKeywords.Text;
                            string query = string.Format("insert into DocDetails(TopicId, KeyWords, DocName, DateCreated) values({0},'{1}','{2}', sysdate());", topicId, keywords, fileName);
                            MySqlCommand cmd = new MySqlCommand(query, con);
                            cmd.ExecuteNonQuery();
                            txtKeywords.Text = string.Empty;
                            ddlTopic.SelectedIndex = 0;
                        }
                        catch (Exception ex)
                        {
                            // Handle the error
                            throw ex;
                        }

                    }
                }
                else
                {
                    UploadStatusLabel.Text = "You did not specify a file to upload.";
                }
            }
            else
            {
                // Notify the user that a file was not uploaded.
                UploadStatusLabel.Text = "You did not specify a file to upload.";
            }
        }
    }
}