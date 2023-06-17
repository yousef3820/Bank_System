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
    public partial class Sign_in_Admin : Form
    {
        public Sign_in_Admin()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-RKQFJLK;Initial Catalog=database;Integrated Security=True");

        private void button1_Click(object sender, EventArgs e)
        {
            string user = textBox1.Text;
            string pass = textBox2.Text;

            try
            {
                string query = "Select * from Admin where A_name = '" + textBox1.Text + "' AND Password = '" + textBox2.Text + "'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    user = textBox1.Text;
                    pass = textBox2.Text;
                    MessageBox.Show("sign in success");
                    this.Hide();
                    Admin f = new Admin();
                    f.ShowDialog();
                    this.Close();

                }
                else
                {
                    MessageBox.Show("invalid login");
                    textBox1.Clear();
                    textBox2.Clear();
                    textBox1.Focus();
                }
            }
            catch
            {
                MessageBox.Show("Error");

            }
            finally
            {
                con.Close();
            }
        }

        private void Sign_in_Admin_Load(object sender, EventArgs e)
        {

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if(checkBox1.Checked)
            {
                textBox2.UseSystemPasswordChar = true;
            }
            else
            {
                textBox2.UseSystemPasswordChar = false;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Home s = new Home();
            s.ShowDialog();
            this.Close();
        }
    }
}
