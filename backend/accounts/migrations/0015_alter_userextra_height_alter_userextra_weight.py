# Generated by Django 5.0.4 on 2024-06-18 08:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0014_alter_userextra_height_alter_userextra_weight'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userextra',
            name='height',
            field=models.IntegerField(blank=True, default=0, null=True),
        ),
        migrations.AlterField(
            model_name='userextra',
            name='weight',
            field=models.IntegerField(blank=True, default=0, null=True),
        ),
    ]
