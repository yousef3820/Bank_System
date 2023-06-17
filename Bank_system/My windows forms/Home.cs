using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace My_windows_forms
{
    public partial class Home : Form
    {
        public Home()
        {
            InitializeComponent();
        }

        private void bank_manager_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Sign_in_customer form3 = new Sign_in_customer();
            form3.ShowDialog();
            this.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Hide();
            sign_in_Employee f = new sign_in_Employee();
            f.ShowDialog();
            this.Close();
        }

        private void flowLayoutPanel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Sign_in_Admin f = new Sign_in_Admin();
            f.ShowDialog();
            this.Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Hide();
            excute_sql_statement_a s = new excute_sql_statement_a();
            s.ShowDialog();
            this.Close();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.Hide();
            excute_sql_statement_b s = new excute_sql_statement_b();
            s.ShowDialog();
            this.Close();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            this.Hide();
            excute_sql_statement_c s = new excute_sql_statement_c();
            s.ShowDialog();
            this.Close();
        }

        private void button9_Click(object sender, EventArgs e)
        {
            this.Hide();
            excute_sql_statement_d s = new excute_sql_statement_d();
            s.ShowDialog();
            this.Close();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            this.Hide();
            excute_sql_statement_e s = new excute_sql_statement_e();
            s.ShowDialog();
            this.Close();
        }

        private void button8_Click(object sender, EventArgs e)
        {
            this.Hide();
            excute_sql_statement_f s = new excute_sql_statement_f();
            s.ShowDialog();
            this.Close();
        }
    }
}
