using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace My_windows_forms
{
    public partial class accept_loan : Form
    {
        public accept_loan()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-RKQFJLK;Initial Catalog=database;Integrated Security=True");

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string query = "INSERT INTO ACCEPTED (EMP_ID,REQUEST_NO,PAID) VALUES('" + textBox1.Text + "' , '" + textBox2.Text + "' , '" + textBox3.Text + "')";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                sda.SelectCommand.ExecuteNonQuery();
                MessageBox.Show("ACCEPTED");
            }
            catch
            {
                MessageBox.Show("ERROR");
            }
            finally
            {
                con.Close();
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Hide();
            Requests r = new Requests();
            r.ShowDialog();
            this.Close();
        }
    }
}
