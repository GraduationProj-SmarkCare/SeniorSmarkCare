# Generated by Django 5.0.4 on 2024-06-19 02:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('symtom', '0003_alter_dailysymtom_symtomdate'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dailysymtom',
            name='symtomDate',
            field=models.DateField(blank=True, null=True),
        ),
    ]