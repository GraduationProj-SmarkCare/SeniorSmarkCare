# Generated by Django 5.0.4 on 2024-06-18 11:57

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('disease', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='disease',
            old_name='surgicalHistory',
            new_name='hasSurgicalHistory',
        ),
    ]
