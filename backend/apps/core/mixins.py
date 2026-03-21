class ActionSerializerMixin:
    """
    Mixin que permite mapear actions do ViewSet para serializers específicos
    via atributo `serializer_classes`.

    Exemplo de uso:
        class MyViewSet(ActionSerializerMixin, viewsets.ModelViewSet):
            serializer_class = MySerializer  # fallback
            serializer_classes = {
                'create': MyCreateSerializer,
                'update': MyUpdateSerializer,
                'partial_update': MyUpdateSerializer,
            }
    """

    serializer_classes: dict = {}

    def get_serializer_class(self):
        return self.serializer_classes.get(self.action) or super().get_serializer_class()
