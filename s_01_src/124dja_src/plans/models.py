from django.db import models


class OfferListModel(models.Model):
    # オファー台帳（catalog）
    offer_id = models.CharField(verbose_name="オファーID", max_length=64, primary_key=True)
    account_id = models.CharField(verbose_name="ユーザID", max_length=64)
    offer_type = models.CharField(verbose_name="オファー種別", max_length=1)
    offer_title = models.TextField(verbose_name="オファー題目")
    offer_severity = models.TextField(verbose_name="オファー優先度")
    offer_catagory = models.TextField(verbose_name="オファー・カテゴリ")
    offer_location = models.TextField(verbose_name="オファー場所")
    offer_status = models.CharField(verbose_name="オファーStatus", max_length=1)
    offer_text = models.CharField(verbose_name="オファー文", max_length=140)
    create_date = models.DateTimeField(verbose_name="作成日", auto_now_add=True)
    update_date = models.DateTimeField(verbose_name="更新日", auto_now_add=True)

    class Meta:
        db_table = "offer_list"
        verbose_name = "オファー台帳"
        verbose_name_plural = "オファー台帳（catalog）"

