# Generated by Django 4.1.3 on 2022-12-12 17:22

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Pill',
            fields=[
                ('name', models.CharField(blank=True, max_length=200, null=True)),
                ('dose', models.IntegerField(blank=True, default=1, null=True)),
                ('id_Shape', models.IntegerField(blank=True, default=0, null=True)),
                ('description', models.TextField(blank=True, null=True)),
                ('refillOn', models.IntegerField(blank=True, default=1)),
                ('createdAt', models.DateTimeField(auto_now_add=True)),
                ('_id', models.AutoField(editable=False, primary_key=True, serialize=False)),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Reminder',
            fields=[
                ('days_Key', models.CharField(blank=True, max_length=8, null=True)),
                ('isRepeated', models.BooleanField(default=False)),
                ('isDeactivated', models.BooleanField(default=False)),
                ('pickedTime', models.TimeField()),
                ('createdAT', models.DateTimeField(auto_now_add=True, null=True)),
                ('_id', models.AutoField(editable=False, primary_key=True, serialize=False)),
                ('pill', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='MedicalApi.pill')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
