﻿using GRA.Controllers.ViewModel.SignIn;
using GRA.Domain.Service;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Threading.Tasks;

namespace GRA.Controllers
{
    public class SignInController : Base.Controller
    {
        private readonly ILogger<SignInController> _logger;
        private readonly AuthenticationService _authenticationService;
        private readonly UserService _userService;
        public SignInController(ILogger<SignInController> logger,
            ServiceFacade.Controller context,
            AuthenticationService authenticationService,
            UserService userService)
                : base(context)
        {
            _logger = Require.IsNotNull(logger, nameof(logger));
            _authenticationService = Require.IsNotNull(authenticationService,
                nameof(authenticationService));
            _userService = Require.IsNotNull(userService, nameof(userService));
            PageTitle = "Sign In";
        }

        public async Task<IActionResult> Index(string sitePath = null, string ReturnUrl = null)
        {
            var site = await GetCurrentSite(sitePath);
            PageTitle = $"Sign In to {site.Name}";

            SignInViewModel viewModel = new SignInViewModel();
            viewModel.ReturnUrl = ReturnUrl;
            return View(viewModel);
        }

        [HttpPost]
        public async Task<IActionResult> Index(SignInViewModel model, string sitePath = null)
        {
            if (ModelState.IsValid)
            {
                var loginAttempt = await _authenticationService
                    .AuthenticateUserAsync(model.Username, model.Password);
                if (loginAttempt.PasswordIsValid)
                {
                    await LoginUserAsync(loginAttempt);
                    if (!string.IsNullOrEmpty(model.ReturnUrl))
                    {
                        return Redirect(model.ReturnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
                model.ErrorMessage = "The username and password entered do not match";
            }
            return View(model);
        }
    }
}