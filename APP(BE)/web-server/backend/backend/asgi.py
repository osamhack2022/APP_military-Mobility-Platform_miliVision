"""
ASGI config for backend project.

It exposes the ASGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/4.0/howto/deployment/asgi/
"""

import os
import django
from .wsgi import *
from channels.auth import AuthMiddlewareStack
from channels.http import AsgiHandler
from channels.routing import ProtocolTypeRouter, URLRouter
from django.core.asgi import get_asgi_application

import tms.routing

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backend.settings')
django.setup()

application = ProtocolTypeRouter({
    "http": get_asgi_application(),
    "websocket": AuthMiddlewareStack(
        URLRouter(
            tms.routing.websocket_urlpatterns
        )
    ),
})