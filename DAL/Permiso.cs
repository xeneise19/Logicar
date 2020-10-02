﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DAL
{
    public class Permiso
    {
        Acceso _acceso;
        public Permiso()
        {
            _acceso = new Acceso();
        }


        public BE.Permiso GuardarPermiso(BE.Permiso permiso)
        {
            try
            {
                string sql = string.Format(@"insert into patente (nombre,es_familia,dvh) values ('{0}',{1},{2});  SELECT ID AS LastID FROM patente WHERE ID = @@Identity;", permiso.nombre,permiso.esFamilia,permiso.dvh);
                int id = _acceso.ExecuteScalar(sql);
                permiso.id = id;
                return permiso;

            }
            catch (Exception e)
            {


                throw e;
            }


        }

        public void InsertarFamilia(BE.Familia familia)
        {

            try
            {
                var sql = string.Format(@"delete from compuesto where id_familia={0};",familia.id);
                _acceso.ExecuteNonQuery(sql);

                foreach (var item in familia.Hijos)
                {
                    sql = string.Format(@"insert into compuesto (id_familia,id_patente) values ({0},{1})",familia.id,item.id);

                    _acceso.ExecuteNonQuery(sql);
                }

            }
            catch (Exception)
            {

                throw;
            }
        }


        public IList<BE.Patente> GetAllPatentes()
        {
            string sql = "select * from patente p where p.es_familia = 0;";

            DataTable tb = _acceso.ExecuteReader(sql);

            var lista = new List<BE.Patente>();

            foreach(DataRow row in tb.Rows)
            {
                BE.Patente c = new BE.Patente();

                c.id = int.Parse(row["id"].ToString());
                c.nombre = row["nombre"].ToString();
                c.esFamilia = bool.Parse(row["es_familia"].ToString()) ? 1 : 0;
                lista.Add(c);

            }

            return lista;
        }

        public IList<BE.Familia> GetAllFamilias()
        {
            string sql = @"select * from patente p where p.es_familia = 1;";
            DataTable tb = _acceso.ExecuteReader(sql);

            var lista = new List<BE.Familia>();

            foreach (DataRow row in tb.Rows)
            {
                BE.Familia c = new BE.Familia();

                c.id = int.Parse(row["id"].ToString()); ;
                c.nombre = row["nombre"].ToString();
                c.esFamilia = int.Parse(row["es_familia"].ToString());
                lista.Add(c);

            }

            return lista;
        }

        public IList<BE.Permiso> GetAll(string familia)
        {
            string condicion = "is NULL";

            if (!String.IsNullOrEmpty(familia))
            {
                condicion = familia;
            }

            string sql = string.Format(@"with recursivo as (
                        select com2.id_familia, com2.id_patente  from compuesto com2
                        where sp2.id_familia {0} --acá se va variando la familia que busco
                        UNION ALL 
                        select com.id_familia, com.id_patente from compuesto com 
                        inner join recursivo r on r.id_patente = sp.id_familia
                        )
                        select r.id_familia,r.id_patente,p.id,p.nombre, p.es_familia
                        from recursivo r 
                        inner join patente p on r.id_patente = p.id 
                        ", condicion);

            DataTable tb = _acceso.ExecuteReader(sql);
            
            var lista = new List<BE.Permiso>();

            foreach (DataRow row in tb.Rows)
            {
                int id_padre = 0;
                if (row["id_familia"] != DBNull.Value)
                {
                    id_padre = int.Parse(row["id_familia"].ToString());
                }

                int id = int.Parse(row["id"].ToString());
                string nombre = row["nombre"].ToString();

                int esFamilia = int.Parse(row["permiso"].ToString());

                BE.Permiso p;

                if (esFamilia == 1)//usamos este campo para identificar. Solo las patentes van a tener un permiso del sistema relacionado
                    p = new BE.Familia();

                else
                    p = new BE.Patente();

                p.id = id;
                p.nombre = nombre;
                /*if (!string.IsNullOrEmpty(permiso))
                    c.Permiso = (TipoPermiso)Enum.Parse(typeof(TipoPermiso), permiso);*/
                p.esFamilia = esFamilia;
                
                var padre = GetPermiso(id_padre, lista);

                if (padre == null)
                {
                    lista.Add(p);
                }
                else
                {
                    padre.AgregarHijo(p);
                }

            }

            return lista;
        }

        private BE.Permiso GetPermiso(int id, IList<BE.Permiso> lista)
        {

            BE.Permiso permiso = lista != null ? lista.Where(i => i.id.Equals(id)).FirstOrDefault() : null;

            if (permiso == null && lista != null)
            {
                foreach (var c in lista)
                {

                    var l = GetPermiso(id, c.Hijos);
                    if (l != null && l.id == id) return l;
                    else
                    if (l != null)
                        return GetPermiso(id, l.Hijos);

                }
            }

            return permiso;
        }

        public void LlenarUsuarioPermisos(BE.Usuario u)
        {
            string sql = string.Format(@"select p.* from PatenteUsuario up inner join patente p on up.id_patente=p.id where up.id_usuario={0};",u.id);

            DataTable tb = _acceso.ExecuteReader(sql);

            u.Permisos.Clear();

            foreach (DataRow row in tb.Rows)
            {

                int idpat = int.Parse(row["id"].ToString());
                string nombrepat = row["nombre"].ToString();

                int esFamiliaPat = int.Parse(row["es_familia"].ToString());

                BE.Permiso permiso;
                if (esFamiliaPat != 1)
                {
                    permiso = new BE.Patente();
                    permiso.id = idpat;
                    permiso.nombre = nombrepat;
                    permiso.esFamilia = esFamiliaPat;
                    u.Permisos.Add(permiso);
                }
                else
                {
                    permiso = new BE.Familia();
                    permiso.id = idpat;
                    permiso.nombre = nombrepat;
                    permiso.esFamilia = esFamiliaPat;

                    var familia = GetAll("=" + idpat);

                    foreach (var p in familia)
                    {
                        permiso.AgregarHijo(p);
                    }
                    u.Permisos.Add(permiso);
                }
            }
        }

        public void ListarFamiliaPatentes(BE.Familia familia)
        {
            familia.VaciarHijos();
            foreach (var item in GetAll("=" + familia.id))
            {
                familia.AgregarHijo(item);
            }
        }



    }
}
