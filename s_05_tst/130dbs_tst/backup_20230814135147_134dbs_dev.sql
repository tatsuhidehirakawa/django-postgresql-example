PGDMP     /    3                {            postgres    14.9 (Debian 14.9-1.pgdg120+1)    14.9 (Debian 14.9-1.pgdg120+1) >               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    13780    postgres    DATABASE     \   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE postgres;
                postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3357            �            1259    16392    account_attribute    TABLE     �  CREATE TABLE public.account_attribute (
    account_id character varying(100) NOT NULL,
    self_introduction character varying(1000),
    twitter_uri character varying,
    facebook_uri character varying,
    instagram_uri character varying,
    youtube_channel_uri character varying,
    skill character varying(1000) NOT NULL,
    rate character varying,
    status character varying(1),
    create_date timestamp(6) without time zone NOT NULL,
    update_date timestamp(6) without time zone
);
 %   DROP TABLE public.account_attribute;
       public         heap    postgres    false                       0    0    TABLE account_attribute    COMMENT     B   COMMENT ON TABLE public.account_attribute IS 'account_attribute';
          public          postgres    false    210                        0    0 #   COLUMN account_attribute.account_id    COMMENT     Y   COMMENT ON COLUMN public.account_attribute.account_id IS 'Account ID:アカウントID';
          public          postgres    false    210            !           0    0 *   COLUMN account_attribute.self_introduction    COMMENT     U   COMMENT ON COLUMN public.account_attribute.self_introduction IS 'Self Introduction';
          public          postgres    false    210            "           0    0 $   COLUMN account_attribute.twitter_uri    COMMENT     [   COMMENT ON COLUMN public.account_attribute.twitter_uri IS 'Twitter URI:ツイッターID';
          public          postgres    false    210            #           0    0 %   COLUMN account_attribute.facebook_uri    COMMENT     c   COMMENT ON COLUMN public.account_attribute.facebook_uri IS 'Facebook URI:フェイスブックID';
          public          postgres    false    210            $           0    0 &   COLUMN account_attribute.instagram_uri    COMMENT     e   COMMENT ON COLUMN public.account_attribute.instagram_uri IS 'Instagram URI:インスタグラムID';
          public          postgres    false    210            %           0    0 ,   COLUMN account_attribute.youtube_channel_uri    COMMENT     c   COMMENT ON COLUMN public.account_attribute.youtube_channel_uri IS 'YouTube Channel URI:YouTubeID';
          public          postgres    false    210            &           0    0    COLUMN account_attribute.skill    COMMENT     G   COMMENT ON COLUMN public.account_attribute.skill IS 'Skill:スキル';
          public          postgres    false    210            '           0    0    COLUMN account_attribute.rate    COMMENT     B   COMMENT ON COLUMN public.account_attribute.rate IS 'Rate:評価';
          public          postgres    false    210            (           0    0    COLUMN account_attribute.status    COMMENT     O   COMMENT ON COLUMN public.account_attribute.status IS 'Status:ステータス';
          public          postgres    false    210            )           0    0 $   COLUMN account_attribute.create_date    COMMENT     S   COMMENT ON COLUMN public.account_attribute.create_date IS 'Create Date:作成日';
          public          postgres    false    210            *           0    0 $   COLUMN account_attribute.update_date    COMMENT     S   COMMENT ON COLUMN public.account_attribute.update_date IS 'Update Date:更新日';
          public          postgres    false    210            �            1259    16399    account_master    TABLE     #  CREATE TABLE public.account_master (
    account_id character varying(64) NOT NULL,
    account_name character varying(20) NOT NULL,
    mail_address character varying NOT NULL,
    password character varying(64) NOT NULL,
    zip_code character varying NOT NULL,
    barth_date date NOT NULL,
    time_zone character varying NOT NULL,
    language character varying NOT NULL,
    registration_date timestamp(6) without time zone NOT NULL,
    create_date timestamp(6) without time zone NOT NULL,
    update_date timestamp(6) without time zone
);
 "   DROP TABLE public.account_master;
       public         heap    postgres    false            +           0    0    TABLE account_master    COMMENT     <   COMMENT ON TABLE public.account_master IS 'account_master';
          public          postgres    false    211            ,           0    0     COLUMN account_master.account_id    COMMENT     P   COMMENT ON COLUMN public.account_master.account_id IS 'Account ID:ユーザID';
          public          postgres    false    211            -           0    0 "   COLUMN account_master.account_name    COMMENT     O   COMMENT ON COLUMN public.account_master.account_name IS 'Account Name:氏名';
          public          postgres    false    211            .           0    0 "   COLUMN account_master.mail_address    COMMENT     ^   COMMENT ON COLUMN public.account_master.mail_address IS 'Mail Addless:メールアドレス';
          public          postgres    false    211            /           0    0    COLUMN account_master.password    COMMENT     P   COMMENT ON COLUMN public.account_master.password IS 'Password:パスワード';
          public          postgres    false    211            0           0    0    COLUMN account_master.zip_code    COMMENT     M   COMMENT ON COLUMN public.account_master.zip_code IS 'Zip Code:郵便番号';
          public          postgres    false    211            1           0    0     COLUMN account_master.barth_date    COMMENT     N   COMMENT ON COLUMN public.account_master.barth_date IS 'Barth Date:誕生日';
          public          postgres    false    211            2           0    0    COLUMN account_master.time_zone    COMMENT     U   COMMENT ON COLUMN public.account_master.time_zone IS 'Time Zone:タイムゾーン';
          public          postgres    false    211            3           0    0    COLUMN account_master.language    COMMENT     G   COMMENT ON COLUMN public.account_master.language IS 'Language:言語';
          public          postgres    false    211            4           0    0 '   COLUMN account_master.registration_date    COMMENT     \   COMMENT ON COLUMN public.account_master.registration_date IS 'Registration Date:登録日';
          public          postgres    false    211            5           0    0 !   COLUMN account_master.create_date    COMMENT     P   COMMENT ON COLUMN public.account_master.create_date IS 'Create_Date:作成日';
          public          postgres    false    211            6           0    0 !   COLUMN account_master.update_date    COMMENT     P   COMMENT ON COLUMN public.account_master.update_date IS 'Update Date:更新日';
          public          postgres    false    211            �            1259    16406 
   offer_list    TABLE       CREATE TABLE public.offer_list (
    offer_id character varying(64) NOT NULL,
    account_id character varying(64) NOT NULL,
    offer_type character varying(1) NOT NULL,
    offer_title character varying NOT NULL,
    offer_severity character varying,
    offer_catagory character varying,
    offer_location character varying,
    offer_status character varying(1) NOT NULL,
    offer_text character varying(140) NOT NULL,
    create_date timestamp(6) without time zone NOT NULL,
    update_date timestamp(6) without time zone
);
    DROP TABLE public.offer_list;
       public         heap    postgres    false            7           0    0    TABLE offer_list    COMMENT     T   COMMENT ON TABLE public.offer_list IS 'offer_list:オファー台帳（catalog）';
          public          postgres    false    212            8           0    0    COLUMN offer_list.offer_id    COMMENT     K   COMMENT ON COLUMN public.offer_list.offer_id IS 'Offer ID:オファーID';
          public          postgres    false    212            9           0    0    COLUMN offer_list.account_id    COMMENT     L   COMMENT ON COLUMN public.offer_list.account_id IS 'Account ID:ユーザID';
          public          postgres    false    212            :           0    0    COLUMN offer_list.offer_type    COMMENT     S   COMMENT ON COLUMN public.offer_list.offer_type IS 'Offer Type:オファー種別';
          public          postgres    false    212            ;           0    0    COLUMN offer_list.offer_title    COMMENT     U   COMMENT ON COLUMN public.offer_list.offer_title IS 'Offer Title:オファー題目';
          public          postgres    false    212            <           0    0     COLUMN offer_list.offer_severity    COMMENT     ^   COMMENT ON COLUMN public.offer_list.offer_severity IS 'Offer Severity:オファー優先度';
          public          postgres    false    212            =           0    0     COLUMN offer_list.offer_catagory    COMMENT     d   COMMENT ON COLUMN public.offer_list.offer_catagory IS 'Offer Catagory:オファー・カテゴリ';
          public          postgres    false    212            >           0    0     COLUMN offer_list.offer_location    COMMENT     [   COMMENT ON COLUMN public.offer_list.offer_location IS 'Offer Location:オファー場所';
          public          postgres    false    212            ?           0    0    COLUMN offer_list.offer_status    COMMENT     D   COMMENT ON COLUMN public.offer_list.offer_status IS 'Offer Status';
          public          postgres    false    212            @           0    0    COLUMN offer_list.offer_text    COMMENT     P   COMMENT ON COLUMN public.offer_list.offer_text IS 'Offer Text:オファー文';
          public          postgres    false    212            A           0    0    COLUMN offer_list.create_date    COMMENT     L   COMMENT ON COLUMN public.offer_list.create_date IS 'Create Date:作成日';
          public          postgres    false    212            B           0    0    COLUMN offer_list.update_date    COMMENT     L   COMMENT ON COLUMN public.offer_list.update_date IS 'Update Date:更新日';
          public          postgres    false    212            �            1259    16385    purchase_histroy    TABLE     �  CREATE TABLE public.purchase_histroy (
    purchase_id character varying NOT NULL,
    purchase_date date NOT NULL,
    purchase_time time without time zone NOT NULL,
    payer_account_id character varying NOT NULL,
    payee_account_id character varying NOT NULL,
    amount numeric NOT NULL,
    create_date timestamp(6) without time zone NOT NULL,
    update_date timestamp(6) without time zone
);
 $   DROP TABLE public.purchase_histroy;
       public         heap    postgres    false            C           0    0    TABLE purchase_histroy    COMMENT     \   COMMENT ON TABLE public.purchase_histroy IS 'purchase_histroy:課金処理用テーブル';
          public          postgres    false    209            D           0    0 #   COLUMN purchase_histroy.purchase_id    COMMENT     H   COMMENT ON COLUMN public.purchase_histroy.purchase_id IS 'Purchase ID';
          public          postgres    false    209            E           0    0 %   COLUMN purchase_histroy.purchase_date    COMMENT     L   COMMENT ON COLUMN public.purchase_histroy.purchase_date IS 'Purchase Date';
          public          postgres    false    209            F           0    0 %   COLUMN purchase_histroy.purchase_time    COMMENT     L   COMMENT ON COLUMN public.purchase_histroy.purchase_time IS 'Purchase Time';
          public          postgres    false    209            G           0    0 (   COLUMN purchase_histroy.payer_account_id    COMMENT     f   COMMENT ON COLUMN public.purchase_histroy.payer_account_id IS 'Payer Account ID:account_idと連動';
          public          postgres    false    209            H           0    0 (   COLUMN purchase_histroy.payee_account_id    COMMENT     f   COMMENT ON COLUMN public.purchase_histroy.payee_account_id IS 'Payee Account ID:account_idと連動';
          public          postgres    false    209            I           0    0    COLUMN purchase_histroy.amount    COMMENT     >   COMMENT ON COLUMN public.purchase_histroy.amount IS 'Amount';
          public          postgres    false    209            J           0    0 #   COLUMN purchase_histroy.create_date    COMMENT     R   COMMENT ON COLUMN public.purchase_histroy.create_date IS 'Create_Date:作成日';
          public          postgres    false    209            K           0    0 #   COLUMN purchase_histroy.update_date    COMMENT     R   COMMENT ON COLUMN public.purchase_histroy.update_date IS 'Update Date:更新日';
          public          postgres    false    209                      0    16392    account_attribute 
   TABLE DATA           �   COPY public.account_attribute (account_id, self_introduction, twitter_uri, facebook_uri, instagram_uri, youtube_channel_uri, skill, rate, status, create_date, update_date) FROM stdin;
    public          postgres    false    210   mC                 0    16399    account_master 
   TABLE DATA           �   COPY public.account_master (account_id, account_name, mail_address, password, zip_code, barth_date, time_zone, language, registration_date, create_date, update_date) FROM stdin;
    public          postgres    false    211   �p                 0    16406 
   offer_list 
   TABLE DATA           �   COPY public.offer_list (offer_id, account_id, offer_type, offer_title, offer_severity, offer_catagory, offer_location, offer_status, offer_text, create_date, update_date) FROM stdin;
    public          postgres    false    212   1�                 0    16385    purchase_histroy 
   TABLE DATA           �   COPY public.purchase_histroy (purchase_id, purchase_date, purchase_time, payer_account_id, payee_account_id, amount, create_date, update_date) FROM stdin;
    public          postgres    false    209   K�       �           2606    16398 '   account_attribute account_attribute_pkc 
   CONSTRAINT     m   ALTER TABLE ONLY public.account_attribute
    ADD CONSTRAINT account_attribute_pkc PRIMARY KEY (account_id);
 Q   ALTER TABLE ONLY public.account_attribute DROP CONSTRAINT account_attribute_pkc;
       public            postgres    false    210            �           2606    16405 !   account_master account_master_pkc 
   CONSTRAINT     g   ALTER TABLE ONLY public.account_master
    ADD CONSTRAINT account_master_pkc PRIMARY KEY (account_id);
 K   ALTER TABLE ONLY public.account_master DROP CONSTRAINT account_master_pkc;
       public            postgres    false    211            �           2606    16412    offer_list offer_list_pkc 
   CONSTRAINT     i   ALTER TABLE ONLY public.offer_list
    ADD CONSTRAINT offer_list_pkc PRIMARY KEY (offer_id, account_id);
 C   ALTER TABLE ONLY public.offer_list DROP CONSTRAINT offer_list_pkc;
       public            postgres    false    212    212            �           2606    16391 %   purchase_histroy purchase_histroy_pkc 
   CONSTRAINT     �   ALTER TABLE ONLY public.purchase_histroy
    ADD CONSTRAINT purchase_histroy_pkc PRIMARY KEY (purchase_id, payer_account_id, payee_account_id);
 O   ALTER TABLE ONLY public.purchase_histroy DROP CONSTRAINT purchase_histroy_pkc;
       public            postgres    false    209    209    209                  x��]YsY�~V����p)7moU�Mw-P��0i)m%�K)oO�l�`0`��0���f56�t�3��,ɞ�����s�Tf�f��pt��RGGR�{���s�d2Wʚ�0R�0����pX�)׭e;��ӵ7��#���l�|�_�ˡ�i拉/�4���m�\�ˌ4�ӯv�����:��ޞ�uyS٢�u����K�@�d��uLQ*�&�}�+~!�;<`�sY��/Z����CbH
�����_R�p8��C�Di8�_��p���4�Oá�<$���B��k�.h������Z���ɽI�S��Q��p)�w����Ӿ?��[��G���?�Ο/��??�?_�фOHQ��Cp�×�Ï�����������k� �C����k�����je�:|�:<Z�ܯVf��������D��j�|�Z~C�k7O�g0�S�3|�Z�S~
���c���]x;�������˕jy��q�Z�Xq�|�"G;:{��w�K��$��[��JCw�@6U�)��9�ۀ5x4_@k�\΄��v��:�����wG��[�o��B�%5	Kȶh�����0Z�r���8R�BdT+s�֮T�'����(�W��p����lT+���&��M��L��R������덓�[+���#��or(#�c[onՆ���E$ލ�)�ع�ꉚR��.{ˊK�#	��ũ��Ӓi#��k���5�1=[��؝�����ɱ\!�F����0�O3���bI�65���#����R��X� E��.G��a�Iq!�$D�|T��б�����M!��v�zJ��w��º��\[���
���	�,�������M����7�i!���V�͵Y��.ssmA��\}��6W7�tns�V2-��<z�^N#¤�66�N�؋����M!ڵ+��l���Y��qh�:�}ў�϶�R8E�HDmq��f��ֳ),���r)��H�'�`"iёD�ئ�Ό�5��dW�v1�5I�V�K� �����1*!�`{��2<jε5a?]%K�yux����{$M����r��j�R�r�Z����;��{���J�h`��>p
���;'`7¶?��|�	ߣ��v��� �^��^�:�9fw��z��2U��h<��y�+id墟�9n��@�SN����~�ь�"��&Fv�������rL@2�	%��
��;�X*�奒���R8'#	���}_�?䋭V寈���ї���g���8v�VLS�@����-���J����>�u��=��!G�-!)��	��a��`�=k+ܤ���4[_Ⱦ���9�AW0�z ��+�^�7w����3bj���R8��H�cq�w���[l� ��{�0������i���ZB���_�s�ئ�~�_I�ùs>�D�w��B��mQ�Z���k2�x�]4�w�O�C�}�O�G�玠۽������:�|���ؙک��s'�������s�`������i$ީ�[���WT����QH*ޢ�R8E�HDeq��S	��C[�'���Z�?ю.W��,��S�u� !�>c	��Ob�cy�|����by}�������i~Iw��C���;��z�:<�t����<���Z���Ȋ����|�9�+��$A���ǁ��۾������G�B/VsK�-���U�`¿ɚ�p�}�ޗ+t�%�D�\����	�	IN����!��c���Zk,��Ö��-9�X�AC4�ʋ��C;��3�stcUF@
`ݧ�7�q� �T<Y��4�ޢ�R8E�HDcq����I�ܯ���?�]+����P�\0����љ�T�w�v�[w�4��ȿӲ(��W�|s������6��ۢ��$إ(Xo�&�C[�׷VV�V�j��`�ܘ���N�����ק��kK'k��j��O�4ޜm\A?��z�qq�PB��x�qv�6y]����M_o�.#JB�%&M-��bz��K�#	�ũi����j�E�hV�/e�aE�{�7���9<��Cޮ���dѮ�%�7h�D/��G-�)�'L�Q��DJ&2N��������F����#�_��GȋD��tR~&OyHR��R+����j����=�v/4�^a� v�u�~���s;�^�W���n�^d��� .C40T���A}z	-G�ߦ^؆2����U����r�Ư��@F�<^[�]��}
s�Vp
�1E��G��QP���Ԗβ��JY	����-0.�S`�$@`'��!	w���8�H����'*W��?�
N�QN�H��I�C��&���B����?��N<$��^] 㣧�\VȖ2z!W*�;�b"h�B�Xz��׍l�T4�^l�EZ'dʹ.tk𡂩'��\w�� ߞ�%!�E�M�Hi�5�ȡ�/w�|+C�&u~x�O���%�'kƣpe�(IP֌q�x��Bs���΂�/q��խF�Y�n#�t�e@��(1 .��$�AjKR �&��0π�(��($^�V�޺�M��3_����hQz{��e���V��ho�l�y^;q�Ӕ�����x+����2l�gh��Ф�M+T�ϰ��1�V�!�B�8��9�_��/��|W�䓹�R8W#	X	'�A��7'F�h/�f^N��6�6�9/��?��2D�a��RC|ǯ��%��?�����Regz����ʖ;�I��w�@�ة���s��l�|y�>r���*L�5�u�S�|;N�_��g�p:}��T8�<^+��t�'{˥p�F�R,NQ5'�&Ro�09���Ōp5D�K�W$)!�	�g"ha\��ے=0ޞ���<d�k�8>��ٝw%ّ\�_"�����HvS�&����B��6�r/�Vǰ�GC�5z�q��:���3{�6q�v1Y�Z�n\:���x}lb��/X��%�h:R44�t/�¥E(I�a�~glA�b>�-"+k16�"�%�>Z5�_S��l' E��^=^��S�O"�Kἃ�$�Z�l!�q-ۙ��R�F;%f��qWY��� "_?�yNp,�)6�!sCi{�)�qз�D"/����{�m���+7^���ě�~���h����o^�V/QJ��K��ױ�wyk�����Ȟ[{�����|���j�|����cR�'F�R8�Hnqjq�9~�%��~)�`�P��h'�PD���!�v"E
pL�i�AsQ��p�=�_s�L��P���Pux��������gR�W^�� ���k�ҝ�L���fq@��˳p(�yB�g���&Ϣ2yC��g*��qyȊ�9&P�	Z�EI�1Kݦ�"�b^O�N�p��
��idȳ�R�}�"
[�4��:�8�A�A�u9"�2�F��AJ��Q�ܾCB����
(��0�C4Q��4�H���h]����^#�����9��L�s�#�"?L*(�vM��^\
�2`$���dτZ)�� $ɡw��A�7,�Մ"'$�#1�	��r��4k5���FO�B����x�1���O��]�:��O7p9�N>#h���=����έY�+�m�x��[ЭfӤs��s����=uf��44�[���M;��jRn��<r)��b$��8�Y�W{��^U���b@b�8F�8eivl���@�����l`_���m�4�n�
,�^'.*�6#�n�m?Y��jɿ`u=��:a�0�.��4���8�U���i�w}���A���S��R8�#	X'ϔ"�1�K����~ӟ�y�o�h������HL[@YCv;�
vX#���e9��r�����0�C֌U�)� ���	Mk ����鵛'c��Hѕƣi��)�.; a�n�S~I��Eף;Ӥ&9�������������	\�q#���>�K�\�$`!X�>2U��c�p�cR[�i��옄�c�
`Yp�QVBG�dgSZ���Z�V@��]�y��6�Pt��hAv�
�b~�<�����K�7
E���@�w9D��W_?�d7���CF+�~��A�9�� ��.-Ϸ�jo��?��&��)MF M��gNcҬuW���$�m������5O�j�A,�c(�m�c��    ؾ��3��N����8���"-+8�����͝��cw��W�Rg�:6^_	V�I5bte}`\
����j�Ϝ��������w�a�$U#�#�H�ǿ��!�Yw�ol����G8���<��Z:-�����V���]����Œ}�y%�S/�Q��E�$�^�8}�L�������B�ZwR�Q.�L���(=��Hg��Q4��+@��V
\���"���mh�O0�!ۑ+d4�� R����dꂙ��
�	P,�螺�9�am�YDQ��>{�K�%	��{q:�-u��QsE	RhK�<79�2i$�\�n�`w��wk&H)�;
�������,�K

C�����I��.� �d� 7M��}M>�O�߱q]ej{�����֚�P�(U{�|r�\
�sDI��#��#r�&W�!v,�b���10�')Cj��x����S�[�6������WQ�ۘZ���ظ���Ԧlm�sӇ�h���ۘ|(�>)=����x?\
��I��,N�D/����q�reD,?�-HG��\�v����Yz7W�$��Mx����.toW�����C�)l�n�B���$`��x�I��iٴ�����|�����28������`���@�#BD_�!d����>�2ֽ�ke��@�1�/l����gI
�F��	f��CD��@� �1K@��2�6��$1t�v ���I?�����.���g.�+�$AQ/�7YL�'���/:�(|t9*�JBR"�֯����sC��78@桊�W�8{
tp3uERГX���A�o�G�w��;/GӒ�����Q����$L�8}j&���.|�M�Ԅ��ߊ���������p~���j�!�$�z��h%���6ޜ�R�aқb�Z�^=,�Hi��.����G�%	���3�M��]mM�ݪ�=-��Ą���r�Ís�.]�0~����_��6�"�������_/\�?f�~��0��Í���wۄ߮\�p�އ���}�Z����F?��L�pu���Ͽ]B�����C�!���z���~xq�K(>�\�;>�����y.�9%	�3N�=He&B�!�n�Š] ��
�b�(��pMv�C����3p�ؑa��U:��Ț\FH�FW��Σp��)I,�q���;�6(��$w�V�킢2�y���1��a����!�֪�^^ r�X�� 7��I{��[��F5?��-#$��2�����,���E\uo��E��bQDH�t�	�̰[)[�4�*.��0����r�qe�4�N����*WL���TC�o|7M�q�З2}��\
W)�������bno/���bB�r��J��YF��Sl��O߯v\������)2F 2��'͇�m1KB��X�Y�x�\���I%�f{��i��R�r$('�8�Ќ�#	�S%������bB�4V���0��h�u�&N����m�V�~���Q���߼�~�@vi�{ԁ�����r)܍�$���r�m~��'�J��ޛ��d�RG1�,v̸�1�j8tp��cҹ�d;�E��d��r��(�"0#�k�5S(B�7��	Z�}�y@Y��R�@�x���s)�����{��.�f ����'��Y!��	E�ר�.�ZY��7�:�`�n@��3�!VYU��X�A�6|�p��e~n�5r���Ɔ�j,����{�K�j0�$A���$n��\����%�HB��U �\�Y�Q���_�N�2�a��@�ÓX�����֍9w{�<�8�e$�����J'[��Jƞt��Yإ�5��j�::}V�µz(I��a�>m�H��5X%Q���H)��s5!CCg�����/��p�+����n��|!m���J:r�R����f;I�U�h/ĵ��n<)����tJǿ���;�錦��x2\
����'~�($Y[0�J̋P�bs(��M�Qw3������{�Fv��i��>�kN(�ǽj�g4�X��,�>��Vn5&<�FEr��i��Q��(IP�) �i ~U�xA\D�$�P8i;U�x��&ED!��q��1���#�����J�R�S��ͣ�����h}�!N��8����N�ǖq��B����(���|�'��R��P��9"��'�8Q[K���*��0��8`"5�:"�i���<�J9�J��M�������M��Rm�kc�!���x>]�B-���Ho�П�qӸ�<2%	�#3N�~&�ŉ!����*�����%SF2�ӂ̥p$�$( a�>���7����
X�
���	������6�6�Z�'���Q����k��樻�.�4 �J���|SV-�-h�Ƶg���3�B�1Y�d�3U���L���%	J�0N���T���2v�ɞQ����
H���m>81|���+߲��-�/�i�5ȅ!.R ���
8Z�<��k>$?��=���3˃K�E(IP,�8�^ܘL�;E2�$��E@�-
�U2���f(Hq�F����1u�J��>f;����0��J��(,��X=xkxJ@����'I�ae�{2s��m:�\"�n���ry���	?`9.�j%�lͥpg�	I`��r��;��IMܵ[��U��B#8'��{[�blv7�O�kR[�
qL3W���}�s:5��h�Y��P>]�{z� R<��8�5:���Ť��mj�Ƴ3�g�Bm��޴O!�K�=%	=����f���B���)v	^��BI����v(��?h�9�}�R�h�5q�-P U�2���΁z�{���c`'������Z�,6��� �9|�aM��]X_LE}z�;�ĳjO����K�R� �(�W�]5-��hs8��r�9t����.����BG�$ؗ˵�,�f/�<��F$��Ec���(9��w%�!k���z�6X|M:�r��Umx�ε���$���4��5��O��1L"��=E��N��>mr��$�X8�=	��ȕ�p9���(�o�\f
�5��g�͵�Mp��<��VFȼ�=�&��Q��ke��z�A�5��@S,��g��S�+@��?�����ڌP�\������xJ4�&��%�b}�͵SI!�~{�D�ѳa���_���hG�gd�µ(I�B`�>;p�� &k��_.%�=���Y��C��:��8&p��y�@�o�S(h�9| 6�ǔ*��}��&HӐ-�f�,�X�CIS�����ϤL?@2��H�$A�d��g]e:x
�+�O�a)a%!s�D�HP�PZL*#�������e�.���jov��9;N.4Sc���<�>ncn�6�ᒉ���x��	!<
v��a�����䦸1dLl&�B�=����]}��������wk�O���[B�*»�wo��'߭�y?�(�����WГ%L>��z����[i�� �g������D���oy��.�7Uޭ�v�~?����Xb������ޭ�{���z?! +�^�[G���m��#��}}����X������G����p�)��?��:~� ֛V�]>��\
�LuB8S�r�̹Th�2���l�^�Ё��Rw���6�Ѓ	��Xx��_!�(w+��@/y�Zh�{�a������m�7V'�W�qg�N��*�lŕ�c�4PecM6�r������Q�� J�0N�9L��3a'J�.�y�� �&�^|�����i|��X@I���a���)�$ZR��#�ݼ����I���\
װcJ4�q���[�nJ+}��Aы"'o��"���˚z6%�����B����V2���x���̒��^?��
�B~�f��t�2���E2~���/�����KBw�c�ktP˧K>.���MH�ߔ�^�(-��6]u�b
�(Cl��6D)��j=���&�o^�fqc�mk�`S�T����#8L�E�ͭڵ�/�t�5R�d ,4�����zBt)wH�fҧs�K�]R� �%��9ҶVh�E몲ıb�������G%�[)��S{n�> C  |�vs��.��W��'>���4����|�)VӤpe����W͌�7蛱�P�3��$0cK9����%ʨK�B%
�����9���K�PB�]�B�i\�̚�R?���cg�w �R�i7��`+��4�7tA�oh�N�̭)��4}k
r��%�{�Rt����p)\�)I�4A�i��x~�. ⑺0�$%4�4�(`�n��������u�^7ך�tE��#]����4�� ��"�#�}�h�4�K��JI�ƹ2N�:�i���s���{�#	��D	�n�[٪{=��r(I�K���~�zc����x��<R��I[�kP��X����n�h�gǥL������Q��TJ�2N{���p��I��!�+YF��#��iR>����y<
�ͣ$A7�qڃ)|1mE��ni)�>��5�(o�������������ѼV�r�qkwgk��vNM:Zؑ]�NL��7�כ@��x���|��U�/��`�?.���P�����A��'��G�АZ����Cd�@�!��$� gc�{��
<Z>: ���jW}-DF� ��~ň��*�O�<��]�!$�5���l������J�B*F%�(�0����4m
%#����#8�'l��B��(������q/μ�n��ߢ�/If�~�q}��.��hWSi9���˥p��)IPi�q��96�9���Ű;����C��˘󴰃���`�C'�Qa'N��n�7� ����vvku���R�$�Puǉ��������Lm�tmny��9�/�ƌ����惁�R�J0N�x^S��H�و&d�k�b�G`jx����(C���lƿ/jƞ���+��'j���\񬩤U�:��U�$Au.��c�j!�Q�}�x�A���2�r�
1)���`����ۇ�2|s�[gѹY\`ȵ���-����<j3��kw!0 �Sl�=GS/�2=>�K�MIHGSRN�+[fEBgߵ�c
N��	vG�VO�W:z�@Ga�t�d��4��R<��4��� �sJ���%��/(r.�q�,�Ǡ���.I��ʥp��$A�~�� @��$��<L�N���i5�=(�����ݮ��ZÇٔ�o����)V�k��q�tۆ�9S���"�b�R8��H�lqڛD��v/��������#��9�W}��9�>𔝸��ԧ��GGYaѓCy�9��ˎ��P����+#�U[��-�@$��f�^����8��2R��Z]�]!�@�1�x{x��]�S��D�z!�t���Y�(\}V�$�ϊq��ɴ��w�� X|����Rb�9���R�'���q)\�J��g�>{��*��ل �,Q��,�����L~����ݝ�
��ҹ��$rE��%��*c5�:�w>`Do@&Ǒ��<�s���:|=�-��A�/��(\a %	
�= �I�ʈ������b�~Ř�!��ud�o��}�lߟ޾c%����k��yj�Y3�,�E����C\
w���(��E�I툍�v'Z��7�79-��T�hh`}�k�+V逶AX�k�Ge�9�c�η���C��|� �n`!	VPN�/0�&l���n9HN#�36b	���!�Nt�R�gվ9s�~:¼�9�kVg��zN�;�_rI��U��X~�B�uޞ\ʴw��d���y�$h����O� �=�Kt�&A΂����59.Z�o�Y���0h���پ��3t�8z��w�v�2|��S[:���c���DJ����$�R��J50N�4�Fs���j��/0�!q�I�9@�8dh��1����wk;"�9Kχ~�3}{g�V�cLc2t
t���	�{l6�Tm�e��I���3ٞ��������&`��Ƌ�Z߀��¥p�ONH�'����F�� hս_�@,dOE����%��^Q@>�>()��ǥpM��$AS���	�"Ini�q�'�?��W�zH3�0���ZG�!����ƃM0�3�I����l?�=�`SXhm�:������;j��K����'3>�"��u%	:
�q���1���������G�)"ו��K"��#L�y|��u�/�T����&�X�b�P��ڹ�x��%pal�"	 3�`yX���zz���'�3O�Kᮧ��z:�WP2���o1>9�2��<4b�S ��m��.���[��K����[2�c�>�nM"'7����T�����p����sB���;�x��=7J����D��%Ǳ@�o볰�e�!���.��1s %w���.h0%	�3N�y5k�sF���!��8��y�ѐ�o�l�����W��R�����9���m�Ƌ+�W��/�y-��Cl.��e�fy������d���������7h�w�>5I��&II�j���g����,���VК�g��蕻pb!�$�$2W�;�ܝ�'�v�ȼB(tS��I�˙��r=Π��@�(��bHr<��}z���1w�$h���<�Z qw�]�)�>�/Ν��y�" (��fUgXx΋�[���7����仲RjW��/��yn|!	ķPN����	�u�=(E�J���~�p8�<��.`�"�7�@�G��4���C�}���KL>޾?�3Η�C5}�����sXz#R�G���[��؜�����t�7��8O:�O�UZ��bX��3r�ѡ�����.[LI�l1�GG��:\�8N�U�~n���0�e�.��?��yh�u����gA�ޘ7��>�L2�����Zg��������苭���T{�˟��]+�}
R{gD��wȥp.F�,N��G���ހ��-ܜ#����C��HKykM7�m���j��W\��qr����~�=A!�l)[>��F�F��О<��>ͥpa�)I��qڛT��</�%����eB�5q'��d�sg�.'������8D:�jo&HSm3�f��$�)Ol���^��~=5�Bbh�������T����񁎾����R��)IP�<��y��1&S��h��$C#s��aWG=Pi�9w�����G8����&�~�z}�!i�8�á��!h�gi��ݰ*Q��ޛ�gGS%=����ǥp�vJd��O����V�g���`#��6k�s�	S�k��B����R���%$�G�RN�/���:�M�Z������s8� '�l���ΝǙ�Ew����f�ȱ�����f�{�� �<�q�SҪ��_���Vp)\[JT�e�>%�/fm��/)�A�� +�c���y}����y�39��@�sm��\�ʫi<{��6A"�����ؓ�wG�K�K=�O#�µ�)IЦg���yֽDk1@��F`������?|D}�            x�}[iO�J����W0b�ĸ��^��U�cV=	9�I��;!������m��<itݪ��JuթS��n7�eӻ�w7M���r�՛���o;y�'����6KW~E��^o���<�[���Q�[nԒ.�*�x�O>Z�l3�r���-.����B6�h��JnJe��]����Mlz��jq��A��z:ph�'q:&�n�ߚ^���?��n$���xȶ&I�v�����&/F,��K��+[�_r�M.6�wײ`���n-�\��F����Ң�ߛ%�<I�E<�sR.x/���u�0?�-7��Q�������-!��6�TA#�P��M)@-�|�U�^��*�f��I:�G;�M�y>"�&�ӯW/ɚ8��g��Z�Hm8�łP��sT�Lṍ�[rA1Зd��d�آ�dC0�����6_��d�v�����+��Bo���R��(.�1{J���KyKBl
4O#SKn.�3��Z"���\�E-�M�b��HO�8׊����^~ߺ}8e���&�`!���?ޤD�?��On#ɟ�Me��

E�X4Sl���!Z�0ϒ��v���G�]�V^k�����\�3$Sȏ�)��+P�b�72�b�W��� �Q��Ő��E;��q���`��y��O;���hvv�;=�G`:��q�k�f��kM�=O�������M���`q�7UhQ.`E��a ���::&eF�}[w�nUqwyt��!��@?e�W���%�xa#����dM�O�;�r!|�$)�\?�y:��l�fݸ�:Y2e��x~��Za���
5$X�C��l����wp��H"	��-�h��uq2�T�S��0.�%�N1w۹�o��yv�1�����8�V(��{a#�(�P��(�4�71�X,�Ӌ��ސ�g�|(�������������|�������q��){�kC�WB� 02PX��\�2�FP���Z��;(�r�x����#9^�wo~2�����W�
�IY�P�cj�@��}ЧD#0����x���6�%d!Gv�4�&��L��}I�='���۽�a��B��RP�)Z��R�18-jd!ޞ�)�FM�-A�Y�B\\�4���`]����y'SH��T�~]�޹��B�9ު@�[��|����Y F�,
2�Q!�M���)ѹ�u6<��4L�%�$����p����|�K�������������,��'��:n1	X(SD�E b�@��ā6��2tG�%�ָPl�f�x���͓��KX��������o���0����/hf�>!�	ἑ���X.D�y�}2��O�t��kJcg/�y���['�7+���I@V@WC0�,�UT��R��	T FF�e- ܐ�,�Ip�e	�3��$ϋ ��.u�����ʷ��>�Y�E-��QKր��i�� � �����d�
<����v�K0�$�tAOg>H�I;/ ��`2��\�\\I�8�e�r�D��Q����YD�60C�����BJĲ8�.���0�ݙ��4)�t�,�������B>&�8�V 7�1��K]�冔�B�Q�odz�q>A����,��;����q�:8�1@L;��L{;�F{wO[�Ɉ�2��4��f���Gh�i 7p��8��3��sNH2��R�����L�$+�ioF�*���ϕ��_����+�Y-D��*u���kj�1�5�1�L!�A��@3d�9@���8rw��O�=?��{7�-��7n@.j�dM`�#�BM���0�Mc?ʷ�Sl,*5N�Au 7����4� �������ƣ8��1W��P���A ~KM&8��Pc@�u�CL�8���4MQ��@��@�$�W���%ȕ���N:e_��t���ty��t�NmX EZ�_E\f�".����ߨ6�_��ZFE#��WF`C��mKK(5 	��98c(��vE� �8"#:ǃ]�~"�o~�0�%�0+P:��f�pztBd�Lj�a/��W(l}+)��׋�4s����iH������;}����  DF��X��2S��1G�2�ڤc�ȁ���fA�!y�<�y:�x<vU�"]o49<<��i��"��W��D�?�(��Ac=L�~����0�d	EGr_$^t�I/���+��Ûh��]���L!��o�&�uLER~�"�MSEaV�T����2(�=K�|�E����,���i��1��^�s�9ꝧ�	�#�~V����
��$;-TA½+#Ӝ:@����{Pv�Y<�����^�#���ƭ�����o�J�ʴ
���6F@J����@D�@=�$g�D�kQ	vOzs��y:�"���|��R����������/�D}ML�'M);�^/47Q�L ("� zT;a�[���f�&���3�L�.���]��wäs���	�+V*&��|+����%2 x��D2�G��
W�����v��`9[���)��t�N��?�ݏ��/ӯ��_�c~h���.��*7��D&��A��V5�OL:�Q�JW�v�<6J��,�A'�a������Ϧ�����E|s��q�.XP�������"�D��B��7
rF��s��=���)�:��tbĽ�x�,�G���F�׷�n�l��t}�1�:��V�9���V��F�hr��ֹ�(m���J^n*`�UFݪ����Uq�=��[g}\*�n���WI�ţn�e�"7��A��R�Y�7`�$/�I�<�.e�����S�Z͟�����u�ïC_���G��Xk(�����{[�kT�*�R�y!$Y�x ���yH��]�9��~��$M.��}�}���"�£�~��6x���#xǝI&;�E�X���
����l/ꌶ��x����:P|`phv.�r��n�OD���C�zNs�H�s���<��Ѻؕ�l��۞�e7�H���ku��݋���'���������BB�`d�X�ɺ+�RSd��@{�q�����L�iw�:�F�X}����￫��෾�P����l�EV&Ğ2���I�_Ǉ(;�S�eiwD�<T}�]7A�m=D��E|�|~��B�^�g�ٌ*���Ģ�fF&����%oj#���bQN����a<�.�~R�m��X��n&����?0)95�CE��Y�Jg|d#đ�lda���� �hl�ڮ�c�3@Iz:E���9��c�<;v�޳��q��TE�������'h(�v<߀������d�UO�9\�� sēza`�|��9�򼫋������ru�!���Ă?iф�S���6#��̐ٸ�90�K	k7�����Q���C�{��y�A��=����@ė��R/��%V��˭YM�ԧ���j�ԩ�B�
"��P~b�"W?�ɬx,��d<+�|��k˽�g�\�g�v���l^�eCL�J�6��EK�w4�Ic��γP�h���t�,�P{$h=`�������m�U�3�"O��|�	L盨�08ldԦT�U�S��f����d��A�H���m����|�(��_;#PEYS?nͻD�����䛚\w�Uhd���!��b��iju�~bp@�}3�ڿy�������@��@O�4C����u��E�f�F�A$���������b@���!b@ @\�W5��?��Vp���\.�cdS���gO��c����F�	���k����Dh�'}A�٢o�N�������i�:{���R������)y���g7]!aJ` V^d��ѠHX�ఏ�&C�th�n0�p�9����p��>{������H�1p���E^#�̫d�3ⳞݠU-�A�Ȳ4�����#,�l����z��=��䵀�l5��ծn���
��,B׃��I3RU�!����b�x: l�O�����ho�o��:ݾ�}_q��d��:�=�6i����J*x�l��p6��Y�����e�Ƴ�������T;�Wn�*��إ�b�g���FF�f�TU@4���pG%�V�y:@�{:h���c����H^]��zLI�+��� R
  ^o0;�K֙}V�X=���{ioFV>1ilq4�L�H�%C�K:9(�P��xx�nB~0ػ+�����!DP'7���1v�f�$-�S�J��&�s~�}�P\ڒ�9`���ӴS��;�,T�UC�׵�K5������%���E��:r�y�l��6�;B8C���t����V�'�ipKO��v���w�¾�}�͎���2�`�+:��i���4�%���p�dl>6�0����j[
��tn�6��)�"�[�n��}`)$%{	]l]>�N��B����HA�F"0T02׭��jQL�.`
zw}H��Z��|��jcv��~��d�q��϶3(�9�w�e��fn�*�u7.2�g��@�&%��t֥f�y�I8�+�����^���7Ut|*��N���6�Ȩ`Gīd�Y�[���8(�X�Ӊ��3F�n\޽J�.����?ם=����%8=l6]�j�e|�����u�MGNB,`(���^IÃS>$`΢���n�?ލ�n�ϊ�8���5�U��קۣ���2$4��R�%���K�L[�@�X�[�	u�"�ǽ���'�w1�x���f�����aWS�����׈����ld*�p�� �$f%��UA��ϊے���@��G�;'����b�r�[c>p��D��Y��������(B�,wktz_r�[��0m!<`ǪX��'��������3b�A��W~�u>e� �E=1��	J*���K��nb��$e<4Og��8�wh���{r������>GզPd� 6�\J��P�f�n?�M��j�[u]6���� ����Ť�y�o��w���/��_����FquG��d�
�M���`Q���f�@j��8�:`�G2�.��F�B�"F7c�ãb���u���[�+2C�4V�V��Y�,BƏ37Y$�F�Ϻ�`㴌s�A<8�<��&�^�{��]���t�I��qHR�3�W"|���"3+
�,n��Z]s���4m���v���"T\ܘ�31��v�G�_B�3aa�� z\����u��x������O u}��7���}�c� -�ɢ��sT���~������0��g�N�(�[��lR�j�������0�PA(��}p&9������z=�M�U�ۀ4춤���4˰m�U����k��h���,F��Jc���5z�"�fn���ɋi��nn���NWN^���G*QM�#�9mf���^#��?+f�4�2�Y�
qngs�����Yj56����k����͑^�bIo-[:0�c��\ؐ|No P�HTU��bغ��T�������ܧ%��g�_OVN����7��)���\�����,�c%���ZF�0�OXǲ��ܹ�=F,��,���	䒷#�����71	zG�L(�ͻf�)��w�t��h����\��=�2lEH�WƝꀛ���|36���o9W��k�;�}�0�9�k����t���4�B�w�i�ӵ��G�����1Є`�����[�<r&�oO,�r T1��`DUU�h-0y-�ʵ._E�X3���	@����zt��{v�?g_�Dov��P�F��އ��Sو�{�c�	�KSA K� �$�8C�C�|n��ZIn��W�{�E�l�W�m0�CRr1�Ua���Bů[�8ָg�="���M�7���X�?��V.���/��?YH%n~�Zjzի.���[�Ыk���Ca��"�	���:@������������wqC{šK�pu�i��J�Eo,�u+_�Pq��Trچ�Oʒ�"Go -c�t�H���6z�~��' �A��麚[-�;h>֎4�12x)����)�y�_nIQ� U^b�� dp����n~���w��`�EP�~�'ԝ5���K�_f��Z�y=�6�V}�ǫ�*3
u��
`[��Z�Ѕ3����<�}e!�e=��)�f�UQaݗD�4�?�I�)�H*�l��Q:��O�U��` \Y���:�G����e���?d\�u��0����Xof��e��<׌�?-��6�P�!8'��<�Q�eIo�v�.����J�z��+��{z���Bt�[�b�$�j]hfϪ޸�*[��`���;�Jx^b�Ѫf�{��z+�ި?�HV��=�%����ev�3ZFo��Ґ�"!�!�I��w�3�	RҸo�N?�$/�����LN�-L��Q�\��0����;.�ɬ�kd� 'hFK��!�c���G��T�������|�������I�s�ƤqԭJ�3��w�2S���^�ěm����*�E7Oo"�7Ǭ@#G����l������@�2�G���5G�-���G]߼�e�ȼhڨ��A�bs<��q�����(�uG��$}x�T�0�N��K � �ܫ^��uc����Y�t�ݪ7g�7$�S֦谼��]�� �݃g����,��u������}�)L�4�A/��:��u����w�yWU��Y+PiCH$����F��fe�f������j�<�ɸ~{�ׄ�2����i5dd#����6��W-���@j`�g}0M�7��������Mts�A��~抭����io�}G��w��zs��'�[w�������r���            x��}YsI��s����'�����5=�vMO��0fmc=�fm;62멱�G� 	�H���H� !��ě�1@&�����qdD�gT�Y�Z�q������������?���~��?�]*�}������������rc�yߵ+K��u�2�.��o:�3�R�]�n�K�?���ʧ����h�~k��;�/�37��S��j{��m~��N�3�������l��]���?���%���
����yg�]^�k����vi���ou7��ґ|Eb�]zl������;��}����?q�yX�������^��]��a-<�L�I��]z�_���]���+��ʇv�ڮ��+���~Xj�7�*|xl��K��� ���>��.�J�^��^�FGR�bz����gi�����F��l1���+gY�̲hY�ڕ�v�I�K�_�+U����O_��@l�|:�o^j�۷���|;���[���b�|�_��[�v�ڥ�vyW\�į_�u�b5����I�L�}��~|���]yG��ጔ�j5�	��q���ك��^�r#�\1�-f<bd�2����q��'��a��߮Lw�`�q��G��-��ve���G������]T��P�g��M�m��ܻ��䆶��L� z�P<�����%�p�A�Cq��h�hJ�\T�p�wqz�Zi�6����zY�f���?~��4�q�K����g�T�en���vww��Y�v�E:=���9��y\3�����l��JE,]�B���q��I������LN�|,Vڥz�<�;���=�[��o���c���1����<�qB�y���g'��g�LbG]^��������D�O�O�/�I�\��#����;�;�}�P����( i����;���o��72�[,�H:�����[�QN��|/_����u�|@�S^7��紂0��.8"�pO���?[�����lÿ��e��%q�ԗ���r�p�`�pw�z	�6�|��U�'bY��O�r�zP��?�9'aȨ��:��(]��q2����>�K%:��o��E;wo����|�v`��ٴ@�|�Z����cx`)�FR�b6_L����hf��t1�E�6��R��G9{��?�:�`�� ��s�>�J��֠�?�����C������WI�]��l���.�+��O&�ןp)J{��,�sX��}Pv�b�pȦ�P٧�~�?�(t�P��	�.,|�4�?� OF�xҧ��pIWp��n�Dn�*8$�;h���8�J6�
]�:�P�t*��J�|��B���]����J�Gj����w|�xޯ}��@C�P��
=y�X��6fD&yFa�gH)�w&唫��
�mo�Թ���T��JW�}�����:�U�a�擣�g��-�����*�)^a�<���)�'�t��K�����{4����M�)�3����<��L1��b>��p��Ȓ�2gQ,�N/��	I?1�P���m�p�=�5�l�6�y���������{�]<�?V�M��箴��#��l�KW.o8!��?��'�>C�wC�]��.���pr2�{;�S_��=
:l�u�5��iРjUoL~�7���д��cV���_���l)/�DX�ȋq������inH�L���mւ}�2���m�O�i��>���x2���{�S]��$Ġ��J����D�bn�g~E��P���i���_O)u���)W;[0*\��G�v?|��۵S6-�+�ɁYc���b ����B}����s�yG循<���:m�{�+MǄ@��o,���z����X��b&�I��2�r��*R��f�ȘA�A�{2m�(������b�pa�J����f�o97�c�l#��]��ί0�|���^�b�0�Q\��q��`�h�Ё���sj;5hy>ӱ��OAs��aku�*�/5U���v�^����z�����3x�i���]e]y -�!*���l��z���������O���ë��ӟ~x������7���z�ɽ9��u�����`�Ɯ9K�/4�p�Q��G�1��;�� �%`7!�(S�F%�Ӭ;�0R�#:p��������:s<��x���:t�KB#$�BG��2ܭ����L��'��/���$á^�CVB��@e	�Mx�t��Qn�9hB{e��G�����)� qV�ȑ�gͯ�4m��i>�8��A	!�FF�L�g�B�I�)�D�����~�Cc��:%߯Jv�D������X���R���D������9p���3�Й/ULqq��@r��(�}��*�����IŠ;B�l�K]�<�xm&�^\,u��⿙�A��z� �"U��/�BH��pA�OҟU+T�>+��{uE���j�q����������:i<^~$�%�P�1���da[p��ⴖ[����ZRz�Ԅ��Iz���s�%�z헺���4F�Mj�I�Av`�y�h(��@����ԃ�:�G�l�p����P̀Ǚ�f��Ŗ6\N�N,p[n�(���k����?�Ok�_�h�o��_$D-���5�Ӡ4=L{3㑹�	�@`E8��Eç��|cc2=�@�F1U��3gY����2�L�����,�YD��jU|oo*X9����"�|�"���0��ɓFMj:**˸
Ná���L�o1��	���0 �{ـ�G�����.*�Y�#	��	���,�Q�)�#�*[?�%�>/2)L�ams|xm(a�CωC�u����Dw������ݽ���>���y�/(5|#�|�-�3���s.U���'Y=�߮�jk������7��*��0H��'��h��R
Xk�#=z���K�4+w��4���
�e�%�S��-z����15���w�=�.��!��&5���pufF�ҝR�cp;��z���#�R:4�q8p��TK
���so)8�HN��8���Q�	���Ihv��(R�H��Ҽ@�zG��<(����ߡ�Ńi��>w�~ k����P��1Ć�0#R�R���v�t�+�2�4|Iv��������V�;g�,�	����Jg�J�����ë��߾$b )�d#���t�N���9��R��Z�x���ӱU�ӄ��c#����6�w-�?u�n�gwV�,'�Wx��5�3�dc�L"��i�,�룑5��H���Fy��G�is��I���D�q��ƤW����e����������JS�+����o]ȓ�&��q��
έ�� Q�4����-ᘍM���=MhDT��M5$+���o�,��8 f,�b�`��	��d�y�ߒӰ������'��5���:�G̗?�3�[��F���p�����npv�x!ݣ%~7�<*�$�pJZ�3YR OdG�G�����]!6 �A"�_Tk���E�Q�Q��Ɗټ�J�t4Af2������"a5po
e!,�R:�������r#|���}6���ϣٝ>�\��=��S�ԏ��Wق�Ud��[�R���ҁ���+<Ӡb�H F���w��p��\�EEx�%��!�'1�Ҙj��Z�A������ad5<�L�t-�j�m&��w��7wջ{�Q��g����%�v{�_}�n�)J#z�Q��V�xē����&mI�:ҹi�^�#��j��!є��1����|� ��W��0��:ex6Ѓ2�K�7a1���.K.
D{y����h�cE/j�䢐2�X��(�ŭJ�A��-=��&L`dF�R�[u�2.�l�l�\�z�~%�\s��h��y�����z��1Z��v���涌[/$�&��ZCq�]�?\R2� �6���x��P�УeJ�N墺4�z9�l±�"J2g�к^����
,��|��5E��h�W�@����
k���q�M+��4g̳L#�Rf�L�2p2����]��y� ��az��o"���Jж�*52޾��1RT��w����^>i"��\�[;S�ςEE��������S�}G�.!)Շ����H a�I�Rĸ�*k'ժ���y$�����ߜ�%yE�_�v���];@l����Mr�ʮ�^�z��֊�j    ����i#��z��Qn�z��X��@/_��!P�� (ޖ��ji
��z�4Z���m{|B�1-a�D^��#ޫ���Ϙ�
Z��W��Z��KYX�S��"/ �Y�f���U��>'�9M��K%��UnSқD(�z����q��e�	C=>��,�� �6Z�Q�;L�����'�z�h�#ե�Cd�P��m�jʎ�$�F�����r0C��5�SGX�/2�H:]�0�AQ0��L���Gx�8$��dH.!�c���kE���BA{��#g�e<O�D&��j�Wo��b���O�*ե���F-#�!�)ּ4�Y����yȱ�7ԇę��ւ�τ��?5����bQ	.b+��	��Vt�_�$?�����$��w�۟;��v���T�Lj�5�ݜ�83���#"�0���s&5\(b�/\Y�e�^�dE�I�A3��0On����py��
��ta�A3�&egG\K���%"LC�E����*��J�(������N@<�4�#�,�,5ƌ/�G�d��ߍVho4�LĢ����#9��������ޔd�\+��â��Ϭ�$��#:	,�ǹo� �0�?��x��t՘�ѩ��&Z�h4�&��#s����0�,��\��s��1�;}�lŴJX	_Q�Ur��;�ӖH��e�z�wT!�(qG��"�-zp�d���Q�8Wg$	p3�%6]G&������/}膩<0ً�u��5�A.^��t&�6��Ϻ�aNQg�a_q8����C���0�E��� �$�	9�F�d_�iV����[��߼�� ����9H�J���1I�g�ى�� ��J�b
��#_��Lm������(y
��ܻ_��e��f[�2Ab<�U��<�Eq�����6���Nq`X�&:h3�P�����o_�������[9l]�RФԺ\D��k?� ��4�ʟXs�<����H[��ݢ����`��(92Ê��o�)�,|ٌٟ��4�x�9)͂=�'��T�P�<)�Ѣ�n:֚y#�1
b�e�0��ȐD�QǓ֔Ñ?���N�jfk\2�7Ɉ$OZb�oQ����i�,�H[�>���F{���n)	����C�.a���l������8�9�1�q�����9� �Q�:&A'� ��If�觳U`�t�"	��	�3��O��R�c�E�a�~"�q�b鬈�3�\����D5:��L�v8`L���-5�qU��8�k'Nc.��T�9��b6Y�x�C�qk4$���"!1v��\ө��8ut* j�?T�7Wѿ� �3u�]>��ȡ#1Y]�ϔ{�&X]�q��
�N6��<0�dDy�i��4�(�C��9�gかH$:�j�UhT�245E���8*�I��.���JI�ra��U�nDB������s�*�9�*���Ew�Ņ\��K���ȨWFۨ�׵S�"0�R].�gf�z	��r�+��ӍT����5��5 +a�ܶ^:�r�>�t�W;w��/�GG3�Z��,�����,"ۏ�zy@>WLd%+HH��]>�~������Լ�+�6�ڧ�?o��.�U��k�K�'u�	�E]X
��\>��x��U�����Z�]���aZ@��!�	Bd�`����ԭ�'��8�n�#~��v�V�4s�P@p����r�`��!$"h��Ԁ:��2��iB�E��q�����Pr�����E,���*��\��'�%���6� -�����3��!���O���q�T!��?R)C�N�L|�x�����F'�E� kH	4��i��(����r2�ӻH���!+E��0Ȓȷ���̹1�d��Is��,x��PT�o�y�m�ю�/s���{��1�l�hh�B�3�oڮ��e�v�E\O�x1��7�Rʻ޽�c������[�STݪQ�Z'�3%��R�?��/ �:���iW6[]�K�C��<�b&'mp�[�x����2��d��szDSZS���! ��>��t۞y�w���Ir��Nu/���Z�e������p������1�hCl�NW���_S B�`(^����^�;7qq<��>EkI�\ ʚ����?V.�*qO�~|b
�&,|�FB>�ܹ!n�+-�N=bD+�T�2��%����-����d*���}C+�=,O�KF���5���O����ZO�V�I�I	��8��z��@Vփw"	��^T�L��U}%ѝ\Tʾ5��;8K|�m�J5
�c+��,U�>Ҧ`{�mAH���f�Pڡ���:���[,�F&\p��S�/�v�/Ԍ�F�~�4��4�d8|͐h&~�ڇ��`ȷ���*�ֹ�)u\�'���K��6R�dp@�!�l}��d���2D�0]�r\���@��_Y"�G�2���ݩih�+Vr�܄*�t�rYĉ~�������gP�YV�mif)3<�&��4K:��3��J)\�G��q�y>�G
�-7w?���T��ڶ��Z���$�P�"l�?�׾�,VO�Ѕvz�P���h�0 ��M��4�丰�a�F;]��y��(˟�����R�6Bb����^�Q��gǖ���� �p��a�\���u��T��vY�FK��>��'��"|rc�Z݆�r�'�)�&��)�_�,_,�����B���2jx[�&F�&l�`����48�$��OQ�J����q�.E�<�V�:l^S#�;��\^�xԛ��'�^M�Ъ���ټ�X]F�)��(7��瘨_�eF�I!�*ؔ5�/g��|�
��{�z��hXQ�����9Tu�҂WGb���f[JY3�_�NN,���ע
�X�]����H�m����hV~C��;�R[�HGh�g;ʄF�ۜ%��Đ)2�Q�0Ck�',.����Q�ȊxYl���<�A!���K�����vZêxS�����Z-�ہ����h��%*�T"$<�>��G?��<`l�G�,ǡ���@_o(�.�{�`\��[�$�j�]��>W��tZ6 [2A�����<�cl�$�VT���/z��z�)��yMz�'��3���˪���
��P�����&vVc�}��+�׌rۘ�%;�c��%px�k;0�X\$��^��f6�U4j�<ت���8F������G���/��d*�B8����& U�F[G�	�R͎��͠�Ǻ����s"W�Pj��i�ͫ�K�.$A=z��R�g
�e�'[���9ǌ��r�KP���l���P�\�?������n�R.<��d�gD�bt�	l����D��l��d�b!�)���b���Bw��_�t��D+Z��aV��Q 6L���t>��0Ӽ�g݂-!pC2��&C���ph,Q���2U����9%��!���J0�0��"���K���h�H�q��TD�����c�Fe:�)�&�k2M�x��`�y.��:wk���/"�����5v������ZmY��x��1���e�Db���Ks5�B�D=���Piź�nD���rC=�-FĄ�h1���C�\:�x��E6��㲧6�*�d�t�����s���ޟ���k�vh�p�\�'��+W���4�q�dX[ʏ!�����<�撀�S�ވ������th֢]Y���_D��"��K���#���f#2"�iC	�:	�Sny�R���턠P���Ls�i�<�:T���h�a���]0kVI�j�)���zGO	�c���PIU��|e6X�ʤY�aז[����<�X�,\}Q���S�����O����I*t]��1�F�u���߂���ˉ�/�$*�N�!���a�a��AXJ���a�3��"Q����&�ӑ�J��#d+�]��;��~HQCt�Ѐ���t	OK��縉ö�й-��W+�X���]j����\G%j`�YXR����r<n/�/,v[Iym�2i��ß��+���>�� �I�Q��bX�o�&��ԑ�2(Z�\e�{XD`���!���r�"qc��m��KLn�Ѻ<b`Ɗ)�?*p��Ւ5��'��1�M��c�~��)/�+i���v �  
  ��:"�P#o�rӟ� ��~��Wݗ�u�MV� D-I�	(���6�)�B�:9M�k,u�.�uS���g�!%Hke"��s2�E	�^��ZHj�hzF��$�߾7[�`|�J��gu�+�l+���^
�P�4���� ��	b�PE[�ޏ�>U Ф��n?m��wL��_ Y���q�M?ig���m�q56N3o�950�&������l�

���R��w}M������ZS��DڍیB�h�%�I.>RT"�A�K�������Z4ˑw Qa�N�������WG2�,��׉��0�U�kT�t)'Ժ�%�TB���-9`������&��$<^5��J+���\T�v{,��T�T�}��Q�TWW=��EpH�:�����riօ��.>6^Ƃm��Ǆu��q�\�j��fN��Ǎ�̉���B^�J3<�,vq��K�Z��cb.�w1��UAĦ�-�W���o�Wí�2�۔���D�ڦ���m�¼v�y|�i؜��	rd�����WB�y*�E|,�[�BLRr�|��0ǣo��>ѓ�v!�f�Ig�Uw�K-���U��c���G�O��j��sTM���%*ګ�#q�&EV�py�i�;�D�����%rQzG|�i�vh��Q��X����c�� ��o�(pd��N�y��++PS(n�`gD@Æ�Ǧz�A!v	�հƌ�b��|��U�
�v���K��4�0T6Ȉ�s1���Ų�Tw�����ҡ�����h��<�߹4���;+{wO�m��r�T�S	�Ř>���DB��➸ք�V���VPV���X��-oi��!n�iy[��ck�4��%@YΣ�Rי�����.��I�������Ӽ#"ʳ��y��7ʷ9��}��q:=�;\�k{t*ñ��.X�Fr�r�� �w=�ҭT�R�5G���S�m&�[N��S�/1=D3p$ῈX��.,�|@�k�>To��E�W��#��p���P��%��<l8��v/8��]�Jx5��ߪ󴾠#0���h���x�T��v8��sW0�+cp���/n���q��!:�-O�a���G!����
�G��S�I`T��4���!����	�s}�zb�=!�B#�r(����L�邷�w�
i�!E�D�c*�&����;�Nc��tO�(�m�wc�7T��暙����v)�_5ˀ1ע*��˿׍n�v*���Ll䱛h&~6F}�LM�(w�}Ƽ�Q�]|�F�7��[m�'�Hp����8H{ҵ�h�ߨ��!��\��u��d�eV���X΀�������EQ�w=&v�Ŷ�qp�Tx�jA.K�w�h25f5>�n�*�}�W��%�^�(y<��㨆
>��OW��cDrh��/����i�!��2;T.8E=��@aK/�tu4����mme���]���
,�:S�$G�X�o��k���i��ݹ���pw�Կ�FtS�D`�eO.����#V"Tv�N! �RpG��
T��B������,&�5���g$��%���`]����+9�>-I���u�,h���됾sϚ��%[x0)iL�S�����u�T0<��B�cB��v������NC���Oڇi�u�ϑ��^����:,qE�{2�>���oȗ��Om���!3=�H7��2`����6m�Bd���� ��9�ddl���$z��V�{$1ҳ�qj:�'k�Z@��4Y$f�v��'�!�|� (+��B�YyhY����H�h,��7��4D6�9Щf�v�y�4��kp����pR�ۺ�1&��P1���m�St�Tsպ$0��_�0�Y���aF�o7\u���9��{��fzL��z ����!X�Mo����@Cl8��F����2�$M@(ƒg�b��foov'(b=�(����)J��V�qU�SU�I9r�������Jb���0����z�z���S��]h�d3�������b�H�F��a�pȴ��<�v<��1ew$�j��ز��%���r�j��;���G�4ӟz#��	��V:��H��a�b{H�g��c�\l��q|eՍ��k�M451�=�$L��MB\x�]��֭<�]�J+�� c��^�I��崘��[g�Y�P�[�Z��;?��Kx��^]=;)F.U�K��_0� bSq� ,�&o��8yl*; ��a/\R�͎��z��b�(�7o2�� �0xH�r��FȀ��my���ӂl�j6v�o���:���S�u*3��#�U�%E;���>�ul�3NB4��'�p$�v`��~#��3�*$��A�k�ƨR�$gӈ�O�.H@ʹ��L��	�ht�:��S�@܀1�N�ϒ>c�=�Q��J�"�%5��&�e�j�3���)R�vKH̟tW���K<���a���붛-�������k���`�,5X�����$�=��2�S_���L�l�%�z).�F0I���\��0m=�%"�`������Xr�L����?tC۟�k!���H��H4G�J�i�6rhV�;���I�.��_�ǯ~���d���         �
  x��ZK���\�O�.P��̏����7���s�aPz��+(�W�W��OD������?������������I��|H>��b��������?��,}��"���� �#���Y�q���o�����)}H����?t��-W����T�$������7�2~�?�~�z�;˧4bx��ǰty�^�O��V�'S�Hz�����x�,����L�-/�jg����z(<�Ƀ@�����aY�<�����Y��[���i����-g����e(/TY��m������o�௒W#�ڡ6��2!/�3�7��]Q^����2�RhE|n Ot��Ji^h//�l��3q�v������y�����{��3��6ޮ@^N��L�ϖY$~�e�d����$i`�7\?K=nTV&vԖ�\�%���,v��,с'K�@��1�(Y$���2-hy�@poyV��[%%�2�[�Gͥ���ӂ�8Rpo�C�H������9��ВU�	y<laYm✷|ſ��^�M�X��lx`�h��U�2Єx+��QR	\�,Hy�n�[�p��]s����� ���=�(�,x�|Ȇ��d��4o�ωe���G{6Y&�ˡ���끻w�S����B��	�99��:[N?��u,��.=�'�弊YMt&��P�� ��S6/��U�o9��A�1rH���V��CD�yKw���l�v:�\���$2-�4 ���N�E�
Ԃ'.3`fU���B�to�G�P4[�������M9#�KH�8�7/�%����������L�И^�$��b=:Ny�,x�8���7��t����!��x��S=�nrԍ _Үn��҂�=�C'�t��#Mbh�I �Gh���V��� ����:�i�L�Y�劺���;�6�h(ٻ��G���P;��o �@�Ppaj���&Ay9d*�sO	6��H��<�Ur�HpW�i;w���wx���Q���ĠY�X��\Բ���'/8�`&���o�PDR����Dyaڦ�N���JϞ��$����ƢX���.��~3$�
3�t��?�B�e�ꝷz��K>���@�)1�l�ɲ��rh�M��v��"�EH?V�L�z\�f� &����>)d���D��|�ciZq�L�P�q��Ҵ	��D&մ�&���ȵS��^�,�WC{2U�R�IhU<mTΛv+�R���">�T�٧�r&1C����R�z�B��o�nc�h}�,��S�k��';]䝹�k������oCD�.�K��.&x��d�/�2���8�[i��,(q�vC	�<�M]#밡�|���F��F�|�A�Δ�8jZ-PP%X�so��z�7FdF/��||��2M����J���0�kla��=�u�L)$��}�<�"�f��Yz�cߚ{���"w��5��KW;��9����[q�{[��*Ŷ{K��d^�XeJ<�j��w󢄜��n��U��0
�{8,�.{k ����w�b�Sf��d�E��f��4ne���C���2{7�K.�?`yD�`Q��f�[,������e�[��@� iyK����q�D�0���aM�b��e���&��3�\�z�I'`/�.ӄZ ��e�<)%�EJ�g�}�OU�,\|�@[�ۘ��Y��΀���w�.y�7�SϚn������(��RD��몦��h�a��i��wر��b����q��{�^&�%JMS4� T�)l`d�ӎ��M�q�c�k�U�{C��zu~�Zz{QVY&�&��{�r+k��0q�Iw�|���V�.Xv���d}H�BP��gA��C���z��˵�ۤ���`�)[y��e�j�2�o����ꓻkw�c� �!M-J����x�H@e�-T�>��8�]�x��Ĩ�'��V�1pJ�en�Y.�n����0[��L��TՁ&;!�X�� ���&��܃�e!�*�ڲ�&Mg$�rv
��R:�n�y�4�N���[��0b�=�U��࠶"9b�u=�&[^[���	.]l��l�r��L����R�;�V��A��X���9�T}��������U���tfJ�G�<��Y��Z]I.(�T��{�갶�D��v���%�%�y�r��[?J��+����ںl����b@�hzx��:=���A�R�$����Wv�z`���Y��T,���u6o�q��%�e]oo,z�i�d99��?.Uyo��/�(H,&�V��t�_�A ��f��FHg�Z�=��h�}���y�3�u�cicX6|ȱ�16�Z�CN�L��@�5���؁��ʹ��M:[6�m.3�J��+u~l��Z����%�.mu�!n+�蕌-�dL��J����,(l�B���2k �@}̼���0΍|������C��$�D�az�8����=$�1�W���q)�E�[Ie�e�,m�m�*r�����dp~ՖR}��6&�/��ڿB�*�b���]}��}��689�Թ8cT�-�J��Ӎ�R��r��G>��7q�^�	s�ڊΓ@�q_�ݢt���m��_肏Rr\��"��ϔM��H����~�1և()6����zv��lLo�'{��Apo���VhXj�/~`�� �ܖ�t��*�`����ݮ1��� }v�>ְ�r�3������ve�o(8�{�_���:B��/��{�el?�oxi�n�ne��zCC�G�R��L;0�y�(���P�~�7�Vֱٰ��`\��qo���۷o3�:U     