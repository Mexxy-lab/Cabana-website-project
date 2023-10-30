from django.apps import AppConfig


class WebsiteConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'website'

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=3000)