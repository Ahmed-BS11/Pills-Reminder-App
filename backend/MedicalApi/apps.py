from django.apps import AppConfig


class MedicalapiConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'MedicalApi'


    def ready(self):
        import MedicalApi.signals   