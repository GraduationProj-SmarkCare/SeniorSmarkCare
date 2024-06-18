# Generated by Django 5.0.4 on 2024-06-18 12:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('disease', '0003_alter_disease_currentdisease_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='disease',
            name='currentDisease',
            field=models.CharField(blank=True, choices=[(1, '고혈압'), (2, '심장 질환'), (3, '당뇨'), (4, '알레르기'), (5, '결핵'), (6, '간염'), (7, '기타'), (8, '없음')], max_length=30, null=True),
        ),
        migrations.AlterField(
            model_name='disease',
            name='pastDisease',
            field=models.CharField(blank=True, choices=[(1, '고혈압'), (2, '심장 질환'), (3, '당뇨'), (4, '알레르기'), (5, '결핵'), (6, '간염'), (7, '기타'), (8, '없음')], max_length=30, null=True),
        ),
    ]
