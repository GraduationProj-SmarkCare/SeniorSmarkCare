# Generated by Django 5.0.4 on 2024-06-04 09:34

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0004_alter_user_guardphone_alter_user_userphone'),
    ]

    operations = [
        migrations.AlterModelManagers(
            name='user',
            managers=[
            ],
        ),
        migrations.RemoveField(
            model_name='user',
            name='exerciseAlarmCnt',
        ),
        migrations.RemoveField(
            model_name='user',
            name='is_active',
        ),
        migrations.RemoveField(
            model_name='user',
            name='is_staff',
        ),
        migrations.RemoveField(
            model_name='user',
            name='mealAlarmCnt',
        ),
        migrations.RemoveField(
            model_name='user',
            name='userType',
        ),
        migrations.AlterField(
            model_name='user',
            name='guardPhone',
            field=models.CharField(max_length=11, null=True, validators=[django.core.validators.RegexValidator(message='Enter a valid phone number', regex='^01[0-9]{8,9}$')]),
        ),
        migrations.AlterField(
            model_name='user',
            name='userBirth',
            field=models.DateField(null=True),
        ),
        migrations.AlterField(
            model_name='user',
            name='userGender',
            field=models.CharField(max_length=12, null=True),
        ),
    ]