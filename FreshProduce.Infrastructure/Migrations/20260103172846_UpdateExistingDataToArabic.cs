using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FreshProduce.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class UpdateExistingDataToArabic : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql("UPDATE Neighborhoods SET Name = N'المعادي' WHERE Name = 'Maadi';");
            migrationBuilder.Sql("UPDATE Neighborhoods SET Name = N'الزمالك' WHERE Name = 'Zamalek';");
            migrationBuilder.Sql("UPDATE Products SET Name = N'طماطم', Unit = N'كجم' WHERE Name = 'Tomatoes';");
            migrationBuilder.Sql("UPDATE Products SET Name = N'بطاطس', Unit = N'كجم' WHERE Name = 'Potatoes';");
            migrationBuilder.Sql("UPDATE Products SET Name = N'خيار', Unit = N'كجم' WHERE Name = 'Cucumbers';");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql("UPDATE Neighborhoods SET Name = 'Maadi' WHERE Name = N'المعادي';");
            migrationBuilder.Sql("UPDATE Neighborhoods SET Name = 'Zamalek' WHERE Name = N'الزمالك';");
            migrationBuilder.Sql("UPDATE Products SET Name = 'Tomatoes', Unit = 'kg' WHERE Name = N'طماطم';");
            migrationBuilder.Sql("UPDATE Products SET Name = 'Potatoes', Unit = 'kg' WHERE Name = N'بطاطس';");
            migrationBuilder.Sql("UPDATE Products SET Name = 'Cucumbers', Unit = 'kg' WHERE Name = N'خيار';");
        }
    }
}
