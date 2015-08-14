﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Microsoft.ApplicationBlocks.Data;
using System.Collections;
using SRP_DAL;
using GRA.SRP.Core.Utilities;

namespace GRA.SRP.DAL
{

    [Serializable]    
    public class MGCodeBreaker : EntityBase, IMinigame
    {

        #region Private Variables

        private static string conn = GRA.SRP.Core.Utilities.GlobalUtilities.SRPDB;

        private int myCBID;
        private int myMGID;
        private string myEasyString = "";
        private bool myEnableMediumDifficulty = false;
        private bool myEnableHardDifficulty = false;
        private string myMediumString = "";
        private string myHardString = "";
        private DateTime myLastModDate;
        private string myLastModUser = "N/A";
        private DateTime myAddedDate;
        private string myAddedUser = "N/A";

        #endregion

        #region Accessors

        public int CBID
        {
            get { return myCBID; }
            set { myCBID = value; }
        }
        public int MGID
        {
            get { return myMGID; }
            set { myMGID = value; }
        }
        public string EasyString
        {
            get { return myEasyString; }
            set { myEasyString = value; }
        }
        public bool EnableMediumDifficulty
        {
            get { return myEnableMediumDifficulty; }
            set { myEnableMediumDifficulty = value; }
        }
        public bool EnableHardDifficulty
        {
            get { return myEnableHardDifficulty; }
            set { myEnableHardDifficulty = value; }
        }
        public string MediumString
        {
            get { return myMediumString; }
            set { myMediumString = value; }
        }
        public string HardString
        {
            get { return myHardString; }
            set { myHardString = value; }
        }
        public DateTime LastModDate
        {
            get { return myLastModDate; }
            set { myLastModDate = value; }
        }
        public string LastModUser
        {
            get { return myLastModUser; }
            set { myLastModUser = value; }
        }
        public DateTime AddedDate
        {
            get { return myAddedDate; }
            set { myAddedDate = value; }
        }
        public string AddedUser
        {
            get { return myAddedUser; }
            set { myAddedUser = value; }
        }

        #endregion

        #region Constructors

        public MGCodeBreaker()
        {
        }

        #endregion

        #region stored procedure wrappers

        public static DataSet GetAll()
        {
            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "app_MGCodeBreaker_GetAll");
        }

        public static DataSet FetchWithParent(int MGID)
        {

            SqlParameter[] arrParams = new SqlParameter[1];

            arrParams[0] = new SqlParameter("@MGID", MGID);

            return SqlHelper.ExecuteDataset(conn, CommandType.StoredProcedure, "app_MGCodeBreaker_GetByIDWithParent", arrParams);
        }

        public static MGCodeBreaker FetchObjectByParent(int MGID)
        {

            // declare reader

            SqlDataReader dr;

            SqlParameter[] arrParams = new SqlParameter[1];

            arrParams[0] = new SqlParameter("@MGID", MGID);

            dr = SqlHelper.ExecuteReader(conn, CommandType.StoredProcedure, "app_MGCodeBreaker_GetByMGID", arrParams);

            if (dr.Read())
            {

                // declare return value

                MGCodeBreaker result = new MGCodeBreaker();

                DateTime _datetime;

                int _int;

                //decimal _decimal;

                if (int.TryParse(dr["CBID"].ToString(), out _int)) result.CBID = _int;
                if (int.TryParse(dr["MGID"].ToString(), out _int)) result.MGID = _int;
                result.EasyString = dr["EasyString"].ToString();
                result.EnableMediumDifficulty = bool.Parse(dr["EnableMediumDifficulty"].ToString());
                result.EnableHardDifficulty = bool.Parse(dr["EnableHardDifficulty"].ToString());
                result.MediumString = dr["MediumString"].ToString();
                result.HardString = dr["HardString"].ToString();
                if (DateTime.TryParse(dr["LastModDate"].ToString(), out _datetime)) result.LastModDate = _datetime;
                result.LastModUser = dr["LastModUser"].ToString();
                if (DateTime.TryParse(dr["AddedDate"].ToString(), out _datetime)) result.AddedDate = _datetime;
                result.AddedUser = dr["AddedUser"].ToString();

                dr.Close();

                return result;
            }

            dr.Close();

            return null;

        }



        public static MGCodeBreaker FetchObject(int CBID)
        {

            // declare reader

            SqlDataReader dr;

            SqlParameter[] arrParams = new SqlParameter[1];

            arrParams[0] = new SqlParameter("@CBID", CBID);

            dr = SqlHelper.ExecuteReader(conn, CommandType.StoredProcedure, "app_MGCodeBreaker_GetByID", arrParams);

            if (dr.Read())
            {

                // declare return value

                MGCodeBreaker result = new MGCodeBreaker();

                DateTime _datetime;

                int _int;

                //decimal _decimal;

                if (int.TryParse(dr["CBID"].ToString(), out _int)) result.CBID = _int;
                if (int.TryParse(dr["MGID"].ToString(), out _int)) result.MGID = _int;
                result.EasyString = dr["EasyString"].ToString();
                result.EnableMediumDifficulty = bool.Parse(dr["EnableMediumDifficulty"].ToString());
                result.EnableHardDifficulty = bool.Parse(dr["EnableHardDifficulty"].ToString());
                result.MediumString = dr["MediumString"].ToString();
                result.HardString = dr["HardString"].ToString();
                if (DateTime.TryParse(dr["LastModDate"].ToString(), out _datetime)) result.LastModDate = _datetime;
                result.LastModUser = dr["LastModUser"].ToString();
                if (DateTime.TryParse(dr["AddedDate"].ToString(), out _datetime)) result.AddedDate = _datetime;
                result.AddedUser = dr["AddedUser"].ToString();

                dr.Close();

                return result;

            }

            dr.Close();

            return null;

        }

        public bool Fetch(int CBID)
        {

            // declare reader

            SqlDataReader dr;

            SqlParameter[] arrParams = new SqlParameter[1];

            arrParams[0] = new SqlParameter("@CBID", CBID);

            dr = SqlHelper.ExecuteReader(conn, CommandType.StoredProcedure, "app_MGCodeBreaker_GetByID", arrParams);

            if (dr.Read())
            {

                // declare return value

                MGCodeBreaker result = new MGCodeBreaker();

                DateTime _datetime;

                int _int;

                //decimal _decimal;

                if (int.TryParse(dr["CBID"].ToString(), out _int)) this.CBID = _int;
                if (int.TryParse(dr["MGID"].ToString(), out _int)) this.MGID = _int;
                this.EasyString = dr["EasyString"].ToString();
                this.EnableMediumDifficulty = bool.Parse(dr["EnableMediumDifficulty"].ToString());
                this.EnableHardDifficulty = bool.Parse(dr["EnableHardDifficulty"].ToString());
                this.MediumString = dr["MediumString"].ToString();
                this.HardString = dr["HardString"].ToString();
                if (DateTime.TryParse(dr["LastModDate"].ToString(), out _datetime)) this.LastModDate = _datetime;
                this.LastModUser = dr["LastModUser"].ToString();
                if (DateTime.TryParse(dr["AddedDate"].ToString(), out _datetime)) this.AddedDate = _datetime;
                this.AddedUser = dr["AddedUser"].ToString();

                dr.Close();

                return true;

            }

            dr.Close();

            return false;

        }

        public int Insert()
        {

            return Insert(this);

        }

        public static int Insert(MGCodeBreaker o)
        {

            SqlParameter[] arrParams = new SqlParameter[11];

            arrParams[0] = new SqlParameter("@MGID", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.MGID, o.MGID.GetTypeCode()));
            arrParams[1] = new SqlParameter("@EasyString", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.EasyString, o.EasyString.GetTypeCode()));
            arrParams[2] = new SqlParameter("@EnableMediumDifficulty", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.EnableMediumDifficulty, o.EnableMediumDifficulty.GetTypeCode()));
            arrParams[3] = new SqlParameter("@EnableHardDifficulty", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.EnableHardDifficulty, o.EnableHardDifficulty.GetTypeCode()));
            arrParams[4] = new SqlParameter("@MediumString", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.MediumString, o.MediumString.GetTypeCode()));
            arrParams[5] = new SqlParameter("@HardString", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.HardString, o.HardString.GetTypeCode()));
            arrParams[6] = new SqlParameter("@LastModDate", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.LastModDate, o.LastModDate.GetTypeCode()));
            arrParams[7] = new SqlParameter("@LastModUser", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.LastModUser, o.LastModUser.GetTypeCode()));
            arrParams[8] = new SqlParameter("@AddedDate", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.AddedDate, o.AddedDate.GetTypeCode()));
            arrParams[9] = new SqlParameter("@AddedUser", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.AddedUser, o.AddedUser.GetTypeCode()));
            arrParams[10] = new SqlParameter("@CBID", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.CBID, o.CBID.GetTypeCode()));
            arrParams[10].Direction = ParameterDirection.Output;

            SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "app_MGCodeBreaker_Insert", arrParams);

            o.CBID = int.Parse(arrParams[10].Value.ToString());

            return o.CBID;

        }

        public int Update()
        {

            return Update(this);

        }

        public static int Update(MGCodeBreaker o)
        {

            int iReturn = -1; //assume the worst

            SqlParameter[] arrParams = new SqlParameter[11];

            arrParams[0] = new SqlParameter("@CBID", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.CBID, o.CBID.GetTypeCode()));
            arrParams[1] = new SqlParameter("@MGID", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.MGID, o.MGID.GetTypeCode()));
            arrParams[2] = new SqlParameter("@EasyString", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.EasyString, o.EasyString.GetTypeCode()));
            arrParams[3] = new SqlParameter("@EnableMediumDifficulty", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.EnableMediumDifficulty, o.EnableMediumDifficulty.GetTypeCode()));
            arrParams[4] = new SqlParameter("@EnableHardDifficulty", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.EnableHardDifficulty, o.EnableHardDifficulty.GetTypeCode()));
            arrParams[5] = new SqlParameter("@MediumString", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.MediumString, o.MediumString.GetTypeCode()));
            arrParams[6] = new SqlParameter("@HardString", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.HardString, o.HardString.GetTypeCode()));
            arrParams[7] = new SqlParameter("@LastModDate", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.LastModDate, o.LastModDate.GetTypeCode()));
            arrParams[8] = new SqlParameter("@LastModUser", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.LastModUser, o.LastModUser.GetTypeCode()));
            arrParams[9] = new SqlParameter("@AddedDate", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.AddedDate, o.AddedDate.GetTypeCode()));
            arrParams[10] = new SqlParameter("@AddedUser", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.AddedUser, o.AddedUser.GetTypeCode()));

            try
            {

                iReturn = SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "app_MGCodeBreaker_Update", arrParams);

            }

            catch (SqlException exx)
            {

                System.Diagnostics.Debug.Write(exx.Message);

            }

            return iReturn;

        }

        public int Delete()
        {

            return Delete(this);

        }

        public static int Delete(MGCodeBreaker o)
        {

            int iReturn = -1; //assume the worst

            SqlParameter[] arrParams = new SqlParameter[1];

            arrParams[0] = new SqlParameter("@CBID", GRA.SRP.Core.Utilities.GlobalUtilities.DBSafeValue(o.CBID, o.CBID.GetTypeCode()));

            try
            {

                iReturn = SqlHelper.ExecuteNonQuery(conn, CommandType.StoredProcedure, "app_MGCodeBreaker_Delete", arrParams);

            }

            catch (SqlException exx)
            {

                System.Diagnostics.Debug.Write(exx.Message);

            }

            return iReturn;

        }

        #endregion

        public string GetEncoded(string s)
        {
            string codedString = "";

            foreach (char c in s.ToCharArray())
            {
                if (c != ' ')
                {
                    codedString = codedString + "<img src='/Images/Games/CodeBreaker/" + CBID.ToString() + "_" +
                                  ((int)c).ToString() + ".png?" + DateTime.Now + "' border='1' width='24px'/> ";
                }
                else
                {
                    codedString = codedString + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                }
            }

            return codedString;
        }

        public string GetKey(string s)
        {
            string keyString = "";
            Hashtable h = new Hashtable();
            foreach (char c in s.ToCharArray())
            {
                if (c != ' ' && !h.ContainsKey(c))
                {
                    keyString = keyString + c + " = <img src='/Images/Games/CodeBreaker/" + CBID.ToString() + "_" +
                                  ((int)c).ToString() + ".png?" + DateTime.Now + "' border='1' width='24px '/><br/>";
                    h.Add(c,c);
                }
            }

            return keyString;
        }

        public string GetEncoded(string s, int difficulty)
        {
            string codedString = "";
            string prefix = "";
            if (difficulty == 2) prefix = "m_";
            if (difficulty == 3) prefix = "h_";

            foreach (char c in s.ToCharArray())
            {
                if (c != ' ')
                {
                    codedString =
                        string.Format(
                            "{4}<img src='/Images/Games/CodeBreaker/{0}{1}_{2}.png?{3}' border='1'  width='24px'/> ",
                            prefix, CBID, ((int)c).ToString(), DateTime.Now, codedString);


                    //codedString = codedString + "<img src='/Images/Games/CodeBreaker/" + CBID.ToString() + "_" +
                    //              ((int)c).ToString() + ".png?" + DateTime.Now + "' border='1' width='24px'/> ";
                }
                else
                {
                    codedString = codedString + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                }
            }

            return codedString;
        }

        public string GetKey(string s, int difficulty)
        {
            string keyString = "";
            string prefix = "";
            if (difficulty == 2) prefix = "m_";
            if (difficulty == 3) prefix = "h_";


            var h = new Hashtable();
            char[] chars = s.ToCharArray();
            Array.Sort<char>(chars);

            foreach (char c in chars)
            {
                if (c != ' ' && !h.ContainsKey(c))
                {
                    keyString =
                        string.Format(
                            "{4}<tr><td nowrap=nowrap>{5} = </td><td><img src='/Images/Games/CodeBreaker/{0}{1}_{2}.png?{3}' border='1'  width='24px'/></td></tr>",
                            prefix, CBID, ((int)c).ToString(), DateTime.Now, keyString, c);

                    //keyString = keyString + c + " = <img src='/Images/Games/CodeBreaker/" + CBID.ToString() + "_" +
                    //              ((int)c).ToString() + ".png?" + DateTime.Now + "' border='1' width='24px '/><br/>";
                    h.Add(c, c);
                }
            }

            return "<table>" + keyString + "</table>";
        }

        public static List<KeyItem> GetKeyCharacters(int CBID)
        {
            List<KeyItem> lst = new List<KeyItem>();

            int currItem = 0;
            for (var i = 65; i <= 90; i++)
            {
                var item = new KeyItem { Character_Num = i, Character = Convert.ToChar(i).ToString(), CBID = CBID };
                lst.Add(item);
                currItem = currItem + 1;
            }
            for (var i = 97; i <= 122; i++)
            {
                var item = new KeyItem { Character_Num = i, Character = Convert.ToChar(i).ToString(), CBID = CBID };
                //lst[currItem] = item;
                lst.Add(item);
                currItem = currItem + 1;
            }

            //33 46 44 63 (, . ! ? )
            var j = 33;
            var newItem = new KeyItem { Character_Num = j, Character = Convert.ToChar(j).ToString(), CBID = CBID };
            //lst[currItem] = newItem;
            lst.Add(newItem);

            j = 46;
            newItem = new KeyItem { Character_Num = j, Character = Convert.ToChar(j).ToString(), CBID = CBID };
            //lst[currItem] = newItem;
            lst.Add(newItem);

            j = 44;
            newItem = new KeyItem { Character_Num = j, Character = Convert.ToChar(j).ToString(), CBID = CBID };
            //lst[currItem] = newItem;
            lst.Add(newItem);

            j = 63;
            newItem = new KeyItem { Character_Num = j, Character = Convert.ToChar(j).ToString(), CBID = CBID };
            //lst[currItem] = newItem;
            lst.Add(newItem);

            return lst;
        }

    }//end class

    [Serializable]
    public class KeyItem
    {
        public int CBID { get; set; }
        public int Character_Num { get; set; }
        public string Character { get; set; }
    }

}//end namespace

