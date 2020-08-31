﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UI
{
    public partial class AltaEmpleado : Form
    {
        public AltaEmpleado()
        {
            InitializeComponent();
        }

        private void AltaEmpleado_Load(object sender, EventArgs e)
        {
            Dictionary<int, string> comboSource = new Dictionary<int, string>();
            comboSource.Add(1, "DNI");
            comboSource.Add(2, "CUIL");
            comboSource.Add(3, "CUIT");
            comboSource.Add(4, "LIBRETA CIVICA");
            cmbTDoc.DataSource = new BindingSource(comboSource, null);
            cmbTDoc.DisplayMember = "Value";
            cmbTDoc.ValueMember = "Key";
            cmbTDoc.SelectedIndex = 0;
        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            BE.Empleado empleado = new BE.Empleado();

            if(txtNombre.Text == "" || txtNombre.Text == null || txtApellido.Text == "" || txtApellido.Text == null ||
               txtDomicilio.Text == "" || txtDomicilio.Text == null || txtNroDoc.Text == "" || txtNroDoc.Text == null
               || txtEmail.Text == "" || txtEmail.Text == null)
            {
                MessageBox.Show("Por favor complete los campos obligatorios");
                return;
            }
            
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string domicilio = txtDomicilio.Text;
            int tipoDoc = cmbTDoc.SelectedIndex;
            long nroDoc = long.Parse(txtNroDoc.Text);
            string email = txtEmail.Text;
            if (!String.IsNullOrEmpty(txtTelefono.Text))
            {
                int telefono = int.Parse(txtTelefono.Text);
                empleado.telefono = telefono;

            }
            

            empleado.nombre = nombre;
            empleado.apellido = apellido;
            empleado.domicilio = domicilio;
            empleado.tipoDocumento = tipoDoc;
            empleado.nroDocumento = nroDoc;
            empleado.email = email;

            BLL.Empleado bllEmpleado = new BLL.Empleado();
            bllEmpleado.altaEmpleado(empleado);

            MessageBox.Show("Se cargo el empleado");
            return;

        }
    }
}