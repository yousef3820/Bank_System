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
    public partial class Update_Employee_information : Form
    {
        public Update_Employee_information()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-RKQFJLK;Initial Catalog=database;Integrated Security=True");

        private void Update_Employee_information_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string name = textBox2.Text;
                string phone = textBox3.Text;
                string address = textBox4.Text;
                string id = textBox1.Text;
                string query = "Update EMPLOYEE Set NAME = '"+name+"',PHONE = '"+phone+"',ADDRESS = '"+address+"' where EMP_ID ='"+id+"'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                sda.SelectCommand.ExecuteNonQuery();
                MessageBox.Show("Successful");
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

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Admin admin = new Admin();
            admin.ShowDialog();
            this.Close();
        }
    }
}
