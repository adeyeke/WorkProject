using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for SaveFile
/// </summary>
public class SaveFile
{
    public string fileName { set; get; }
    public string fileExtension { set; get; }
    public byte[] data { set; get; }

    public string SaveFileToDB()
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["CFMConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(con))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SaveFilesProc";
            cmd.Connection = conn;

            cmd.Parameters.AddWithValue("@Data", data);
            cmd.Parameters.AddWithValue("@FileName", fileName);
            cmd.Parameters.AddWithValue("@FileExtension", fileExtension);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                return "File stored Successfully!!!";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            finally
            {
                conn.Close();
                cmd.Dispose();
                conn.Dispose();
            }
        }
    }

    public string SaveFileToDB1()
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["CFMConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(con))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SaveFilesProc1";
            cmd.Connection = conn;

            cmd.Parameters.AddWithValue("@Data", data);
            cmd.Parameters.AddWithValue("@FileName", fileName);
            cmd.Parameters.AddWithValue("@FileExtension", fileExtension);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                return "File stored Successfully!!!";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            finally
            {
                conn.Close();
                cmd.Dispose();
                conn.Dispose();
            }
        }
    }
}