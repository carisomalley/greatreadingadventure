﻿using Microsoft.EntityFrameworkCore.Migrations;

namespace GRA.Data.SqlServer.Migrations
{
    public partial class addpremadeavatars : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "AssociatedBundleId",
                table: "AvatarBundles",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Description",
                table: "AvatarBundles",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "AssociatedBundleId",
                table: "AvatarBundles");

            migrationBuilder.DropColumn(
                name: "Description",
                table: "AvatarBundles");
        }
    }
}