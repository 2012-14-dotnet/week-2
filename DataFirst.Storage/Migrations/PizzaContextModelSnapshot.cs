﻿// <auto-generated />
using System;
using DataFirst.Storage;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace DataFirst.Storage.Migrations
{
    [DbContext(typeof(PizzaContext))]
    partial class PizzaContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .UseIdentityColumns()
                .HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.1");

            modelBuilder.Entity("DataFirst.Storage.Crust", b =>
                {
                    b.Property<byte>("CrustId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("tinyint")
                        .UseIdentityColumn();

                    b.Property<bool?>("Active")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValueSql("((1))");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(100)
                        .IsUnicode(false)
                        .HasColumnType("varchar(100)");

                    b.HasKey("CrustId");

                    b.ToTable("Crust", "Pizza");
                });

            modelBuilder.Entity("DataFirst.Storage.Pizza", b =>
                {
                    b.Property<byte>("PizzaId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("tinyint")
                        .UseIdentityColumn();

                    b.Property<bool?>("Active")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValueSql("((1))");

                    b.Property<byte>("CrustId")
                        .HasColumnType("tinyint");

                    b.Property<DateTime?>("DateModified")
                        .HasPrecision(3)
                        .HasColumnType("datetime2(3)");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(100)
                        .IsUnicode(false)
                        .HasColumnType("varchar(100)");

                    b.Property<byte>("SizeId")
                        .HasColumnType("tinyint");

                    b.HasKey("PizzaId");

                    b.HasIndex("CrustId");

                    b.HasIndex("SizeId");

                    b.ToTable("Pizza", "Pizza");
                });

            modelBuilder.Entity("DataFirst.Storage.PizzaTopping", b =>
                {
                    b.Property<int>("PizzaToppingId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .UseIdentityColumn();

                    b.Property<byte>("PizzaId")
                        .HasColumnType("tinyint");

                    b.Property<short>("ToppingId")
                        .HasColumnType("smallint");

                    b.HasKey("PizzaToppingId");

                    b.HasIndex("PizzaId");

                    b.HasIndex("ToppingId");

                    b.ToTable("PizzaTopping", "Pizza");
                });

            modelBuilder.Entity("DataFirst.Storage.Size", b =>
                {
                    b.Property<byte>("SizeId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("tinyint")
                        .UseIdentityColumn();

                    b.Property<bool?>("Active")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValueSql("((1))");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(100)
                        .IsUnicode(false)
                        .HasColumnType("varchar(100)");

                    b.HasKey("SizeId");

                    b.ToTable("Size", "Pizza");
                });

            modelBuilder.Entity("DataFirst.Storage.Topping", b =>
                {
                    b.Property<short>("ToppingId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("smallint")
                        .UseIdentityColumn();

                    b.Property<bool?>("Active")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValueSql("((1))");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(100)
                        .IsUnicode(false)
                        .HasColumnType("varchar(100)");

                    b.Property<decimal>("Price")
                        .HasColumnType("decimal(18,2)");

                    b.HasKey("ToppingId");

                    b.ToTable("Topping", "Pizza");
                });

            modelBuilder.Entity("DataFirst.Storage.Pizza", b =>
                {
                    b.HasOne("DataFirst.Storage.Crust", "Crust")
                        .WithMany("Pizzas")
                        .HasForeignKey("CrustId")
                        .HasConstraintName("FK_CrustId")
                        .IsRequired();

                    b.HasOne("DataFirst.Storage.Size", "Size")
                        .WithMany("Pizzas")
                        .HasForeignKey("SizeId")
                        .HasConstraintName("FK_SizeId")
                        .IsRequired();

                    b.Navigation("Crust");

                    b.Navigation("Size");
                });

            modelBuilder.Entity("DataFirst.Storage.PizzaTopping", b =>
                {
                    b.HasOne("DataFirst.Storage.Pizza", "Pizza")
                        .WithMany("PizzaToppings")
                        .HasForeignKey("PizzaId")
                        .HasConstraintName("FK_PizzaId")
                        .IsRequired();

                    b.HasOne("DataFirst.Storage.Topping", "Topping")
                        .WithMany("PizzaToppings")
                        .HasForeignKey("ToppingId")
                        .HasConstraintName("FK_ToppingId")
                        .IsRequired();

                    b.Navigation("Pizza");

                    b.Navigation("Topping");
                });

            modelBuilder.Entity("DataFirst.Storage.Crust", b =>
                {
                    b.Navigation("Pizzas");
                });

            modelBuilder.Entity("DataFirst.Storage.Pizza", b =>
                {
                    b.Navigation("PizzaToppings");
                });

            modelBuilder.Entity("DataFirst.Storage.Size", b =>
                {
                    b.Navigation("Pizzas");
                });

            modelBuilder.Entity("DataFirst.Storage.Topping", b =>
                {
                    b.Navigation("PizzaToppings");
                });
#pragma warning restore 612, 618
        }
    }
}
