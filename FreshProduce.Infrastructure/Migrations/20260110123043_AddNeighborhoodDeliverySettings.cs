using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FreshProduce.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class AddNeighborhoodDeliverySettings : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<decimal>(
                name: "DeliveryFee",
                table: "Neighborhoods",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddColumn<string>(
                name: "PickupPointAddress",
                table: "Neighborhoods",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PickupPointNotes",
                table: "Neighborhoods",
                type: "nvarchar(max)",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "DeliveryFee",
                table: "Neighborhoods");

            migrationBuilder.DropColumn(
                name: "PickupPointAddress",
                table: "Neighborhoods");

            migrationBuilder.DropColumn(
                name: "PickupPointNotes",
                table: "Neighborhoods");
        }
    }
}
