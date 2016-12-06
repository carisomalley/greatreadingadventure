﻿using GRA.Domain.Model;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace GRA.Domain.Repository
{
    public interface IUserRepository : IRepository<User>
    {
        Task<User> AddPointsSaveAsync(int currentUserId,
            int whoEarnedUserId,
            int pointsEarned,
            bool loggingAsAdminUser);
        Task AddRoleAsync(int currentUserId, int userId, int roleId);
        Task<AuthenticationResult> AuthenticateUserAsync(string username, string password);
        Task<User> GetByUsernameAsync(string username);
        Task<int> GetCountAsync();
        Task<int> GetHouseholdCountAsync(int householdHeadUserId);
        Task<IEnumerable<Model.User>> PageAllAsync(int siteId, 
            int skip, 
            int take, 
            SortUsersBy sortBy = SortUsersBy.LastName);
        Task<IEnumerable<Model.User>>
            PageHouseholdAsync(int householdHeadUserId, int skip, int take);
        Task<User> RemovePointsSaveASync(int userId, int whoRemoveUserId, int pointsToRemove);
        Task SetUserPasswordAsync(int currentUserId, int userId, string password);
    }
}