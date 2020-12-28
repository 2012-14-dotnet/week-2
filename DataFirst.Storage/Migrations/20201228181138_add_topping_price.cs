using Microsoft.EntityFrameworkCore.Migrations;

namespace DataFirst.Storage.Migrations
{
    public partial class add_topping_price : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<decimal>(
                name: "Price",
                schema: "Pizza",
                table: "Topping",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Price",
                schema: "Pizza",
                table: "Topping");
        }
    }
}
