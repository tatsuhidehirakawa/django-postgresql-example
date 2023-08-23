from django.db import models

from users.models import AccountMaster


# プロフィール
class Profile(models.Model):
    account = models.OneToOneField(AccountMaster, on_delete=models.CASCADE, primary_key=True)

    self_introduction = models.CharField(verbose_name="自己紹介", max_length=1000)
    twitter_uri = models.TextField(verbose_name="ツイッターID")
    facebook_uri = models.TextField(verbose_name="フェイスブックID")
    instagram_uri = models.TextField(verbose_name="インスタグラムID")
    skill = models.CharField(verbose_name="スキル", max_length=1000)
    rate = models.TextField(verbose_name="評価")
    status = models.CharField(verbose_name="ステータス", max_length=1)

    class Meta:
        db_table = "account_attribute"
        verbose_name = "プロフィール"
        verbose_name_plural = "プロフィール"
