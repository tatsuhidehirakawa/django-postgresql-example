from rest_framework import views, permissions, status
from rest_framework.response import Response
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated

from .authentication import JWTAuthentication
from .models import AccountMaster
from .serializers import ObtainTokenSerializer
from .serializers import UserSerializer


class ObtainTokenView(views.APIView):
    permission_classes = [permissions.AllowAny]
    serializer_class = ObtainTokenSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)

        username = serializer.validated_data.get('username')
        password = serializer.validated_data.get('password')

        user = AccountMaster.objects.filter(mail_address=username).first()
        if user is None or not user.check_password(password):
            return Response({'message': 'Invalid credentials'}, status=status.HTTP_400_BAD_REQUEST)

        # JWTトークンを生成する
        jwt_token = JWTAuthentication.create_jwt(user)

        return Response({'token': jwt_token})


# ModelViewSetを定義
class UserViewSet(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated]
    queryset = AccountMaster.objects.all()  # querysetに対象モデルを宣言
    serializer_class = UserSerializer

    def create(self, request, *args, **kwargs):
        request

        return super().create(request, *args, **kwargs)

