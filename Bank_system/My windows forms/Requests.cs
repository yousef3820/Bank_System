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
    public partial class Requests : Form
    {
        public Requests()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-RKQFJLK;Initial Catalog=database;Integrated Security=True");

        private void button3_Click(object sender, EventArgs e)
        {
            con.Open();
            string query = "select * from LOAN_REQUEST ";
            SqlCommand sda = new SqlCommand(query, con);
            var reader = sda.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            dataGridView1.DataSource = table;
            con.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            accept_loan a = new accept_loan();
            a.ShowDialog();
            this.Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Hide();
            employee emp = new employee();
            emp.ShowDialog();
            this.Close();
        }
    }
}
