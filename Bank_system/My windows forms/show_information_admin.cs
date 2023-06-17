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
    public partial class show_information_admin : Form
    {
        public show_information_admin()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-RKQFJLK;Initial Catalog=database;Integrated Security=True");

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            con.Open();
            string query = "select distinct EMPLOYEE.NAME as 'Employee_Name', LOAN.LOAN_TYPE , CUSTOMER.NAME  from [dbo].[EMPLOYEE] inner join [dbo].[LOAN] ";
            query += "on LOAN.BRANCH_NO = EMPLOYEE.BRANCH_NO inner join [dbo].[CUSTOMER] on EMPLOYEE.EMP_ID = CUSTOMER.EMP_ID";
            SqlCommand sda = new SqlCommand(query, con);
            var reader = sda.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            dataGridView1.DataSource = table;
            con.Close();
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
