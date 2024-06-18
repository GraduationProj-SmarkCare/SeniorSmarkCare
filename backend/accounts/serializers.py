from .models import *
from django.contrib.auth.password_validation import validate_password # Django의 기본 pw 검증 도구

from rest_framework.validators import UniqueValidator
from rest_framework.authtoken.models import Token
from rest_framework import serializers
from django.contrib.auth import authenticate

class SignupSerializer(serializers.ModelSerializer):
    password1 = serializers.CharField(
        write_only=True,
        required=True,
        validators=[validate_password], # 비밀번호에 대한 검증
    )
    password2 = serializers.CharField( # 비밀번호 확인을 위한 필드
        write_only=True,
        required=True,
    )
    userPhone = serializers.CharField(
        write_only=True,
        required = True,
        validators = [UniqueValidator(queryset=User.objects.all())]
    )

    class Meta:
        model = User
        fields = [
            'userName', 'userPhone', 'password1', 'password2'
        ]

    def validate(self, data):
        if data['password1'] != data['password2']:
            raise serializers.ValidationError("Passwords don't match")
        return data

    def create(self, validated_data):
        user = User.objects.create_user(
            userName = validated_data['userName'],
            userPhone = validated_data['userPhone'],
        )
        user.set_password(validated_data['password1'])
        user.save()
        token = Token.objects.create(user = user)
        return user


class LoginSerializer(serializers.ModelSerializer):
    userName = serializers.CharField(required = True)
    password = serializers.CharField(required = True, write_only = True)
    userPhone = serializers.CharField(read_only = True)

    class Meta:
        model = User
        fields = [
            'id', 'userName', 'userPhone', 'password',
        ]

    def validate(self, data):
        user = authenticate(**data)
        if user:
            token = Token.objects.get(user = user)
            return token
        raise serializers.ValidationError(
            {"error" : "No users able to log in with provided credentials"}
        )

    

    
class UserInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserExtra
        fields = [
            'userBirth', 'userGender', 'guardPhone', 'height', 'weight',
        ]