from django.db import models
from django.contrib.auth.models import AbstractUser


# ユーザマスタクラスを定義
class AccountMaster(models.Model):
    # ユーザマスタ（account_master）
    account_id = models.CharField(verbose_name="ユーザID", max_length=64, primary_key=True)
    account_name = models.CharField(verbose_name="氏名", max_length=20)
    mail_address = models.EmailField(verbose_name="メールアドレス", max_length=254, unique=True)
    password = models.CharField(verbose_name="パスワード", max_length=64)
    zip_code = models.TextField(verbose_name="郵便番号")
    barth_date = models.DateField(verbose_name="誕生日")
    time_zone = models.TextField(verbose_name="タイムゾーン")
    language = models.TextField(verbose_name="言語")
    registration_date = models.DateTimeField(verbose_name="登録日")
    create_date = models.DateTimeField(verbose_name="作成日", auto_now_add=True)
    update_date = models.DateTimeField(verbose_name="更新日", auto_now=True)

    def check_password(self, password):
        return password == self.password

    @property
    def is_authenticated(self):
        return True

    class Meta:
        db_table = "account_master"
        verbose_name = "ユーザマスタ"
        verbose_name_plural = "ユーザマスタ"

    def __str__(self):
        return self.account_name
