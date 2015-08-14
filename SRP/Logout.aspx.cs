﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SRPApp.Classes;
using GRA.SRP.DAL;

namespace GRA.SRP
{
    public partial class Logout : BaseSRPPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IsSecure = false;
            var navTo = "~/";
            if (IsLoggedIn)
            {
                var p = Programs.FetchObject((int)Session["PatronProgramID"]);
                if (p.LogoutURL.Trim().Length > 0) navTo = p.LogoutURL;
            }

            Session.Remove("PatronLoggedIn");
            Session.Remove("Patron");
            Session.Remove("ProgramID");
            Session.Remove("PatronProgramID");
            Session.Remove("CurrentProgramID");
            Session.Remove("IsMasterAcct");
            Session.Remove("MasterAcctPID");

            Response.Redirect(navTo);

        }
    }
}