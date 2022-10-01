from channels.routing import ProtocolTypeRouter, URLRouter
import notification.routing

application = ProtocolTypeRouter({
    # (http->django views is added by default)
    'websocket': URLRouter(
        notification.routing.websocket_urlpatterns
    )
})