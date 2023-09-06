Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9727940E2
	for <lists+linux-audit@lfdr.de>; Wed,  6 Sep 2023 17:58:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694015891;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=3sRLTiLxlBKu93Ca1B/6lVW6AQuHbyEIaXuczVvWjms=;
	b=D0N9Eh/D8AfibDfKOK983S+47HFq3HbJMTYX9h+Je+4/bVLfcIA6OGtWt7NBqORuTi/Ce3
	MMT3FSLXS1EJv3ZS2BtMjxmm7C3rDA4UlNkQjkzFWkpMkENrBosKSMjjOiW+WvZjJbYB45
	QPzpmD/ceiWoaSd4q5WcldByNQ1E/iE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-688-RKNk4e_FOzGg28CLOW-7tQ-1; Wed, 06 Sep 2023 11:58:04 -0400
X-MC-Unique: RKNk4e_FOzGg28CLOW-7tQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B3018AA818;
	Wed,  6 Sep 2023 15:58:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12D141460FE5;
	Wed,  6 Sep 2023 15:57:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D1BEB19465B1;
	Wed,  6 Sep 2023 15:57:43 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2BC20194658C for <linux-audit@listman.corp.redhat.com>;
 Wed,  6 Sep 2023 15:56:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BF2BE1460FFB; Wed,  6 Sep 2023 15:56:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B77271460FE5
 for <linux-audit@redhat.com>; Wed,  6 Sep 2023 15:56:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 972798015AA
 for <linux-audit@redhat.com>; Wed,  6 Sep 2023 15:56:25 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-ZZCFspzTO6m7Vn4ufcLv1w-1; Wed, 06 Sep 2023 11:56:23 -0400
X-MC-Unique: ZZCFspzTO6m7Vn4ufcLv1w-1
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-76f036041b4so55544585a.1
 for <linux-audit@redhat.com>; Wed, 06 Sep 2023 08:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694015782; x=1694620582;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qmzb0KqJys64j1Bxy0nPQxBPzdHgOTHK4LrRxPII7dQ=;
 b=RkpjUv7FJYH8J7b4P0KsodPUlxPA81KoP9DF+rujYap/HR1ABOCjMDCFeCYeVAqQ0R
 SA3EjyX9DFy+mRMJZ94aGgHgtoKa4dpDW+xsY5o9J80ONe/lsd/i1f3MbUlSG+woRR+i
 jqpA4qTEF4qUABW7IkeprgPJA6ogna4vfx4m7z3rppfnsTEty5N6jP0fry4nWTsUGfY6
 AGT0/tXJIkD6FTJ1lEAEfRwTDqh1h1Ylli0JnTbaEyBM9X66tz8DjgCFNkZxXRC7PzMw
 O8qcWjavbF9rdL7bz5jAR3J34p44PufJ4hX7t01kEz+M9zRSxyWxieheGRpXrHfIlL0n
 fvAA==
X-Gm-Message-State: AOJu0YwTnM2XOv+lgPgnYE2UNsNtGRtsdFzt93SVyv/lDlKLLXjE6iGF
 cA54NnI41Ph9jC+pdO2zLx6NTX7r7odoVHBomv0NPKfA
X-Google-Smtp-Source: AGHT+IE5LZt8wUEyPa5Y8ebFuEL+xT+LEgX9XRR6LLb2Op6/5WwKY07/jQazMmWKDV8qUUra5UJZYdmSqRiFviVNCn0=
X-Received: by 2002:a05:620a:4552:b0:770:6854:fb7a with SMTP id
 u18-20020a05620a455200b007706854fb7amr14107qkp.17.1694015782547; Wed, 06 Sep
 2023 08:56:22 -0700 (PDT)
MIME-Version: 1.0
From: Amjad Gabbar <amjadgabbar11@gmail.com>
Date: Wed, 6 Sep 2023 10:56:11 -0500
Message-ID: <CAJcJf=Qb7muwWG4DyQtEcCKmCOETD4H3h1BoGrewJ5u26r6o=w@mail.gmail.com>
Subject: Sycall Rules vs Watch Rules
To: linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Wed, 06 Sep 2023 15:57:42 +0000
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============5015541930894123518=="

--===============5015541930894123518==
Content-Type: multipart/alternative; boundary="000000000000f674570604b2c895"

--000000000000f674570604b2c895
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have done some analysis and digging into how both the watch rules and
syscall rules are translated.

From my understanding, in terms of logging, both the below rules are
similar. There is no difference in either of the rules.

1. -w /etc -p wa -k ETC_WATCH

2. -a always,exit -F arch=3Db64 -S <all syscalls part of the write and attr
classes> -F dir=3D/etc  -F perm=3Dwa -k ETC_WATCH

The write and attr classes consist of syscalls in
=E2=80=9Cinclude/asm-generic/audit_*.h=E2=80=9C.

 The perm flag is needed in the second case for including open/openat
syscalls which are not a part of the write and attr syscall list.

I'd like to verify if what I mentioned earlier is accurate, and I have an
additional point but depends on whether this is accurate.

Ali

--000000000000f674570604b2c895
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">I have d=
one some analysis and digging into how both the watch rules and syscall rul=
es are translated.</div><div dir=3D"auto"><br></div><div dir=3D"auto">From =
my understanding, in terms of logging, both the below rules are similar. Th=
ere is no difference in either of the rules.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">1. -w /etc -p wa -k ETC_WATCH</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><div dir=3D"auto"><span style=3D"font-family:-ap=
ple-system,&quot;Helvetica Neue&quot;;font-size:16px;font-style:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:1px;te=
xt-decoration:none;float:none;display:inline!important;color:rgb(49,49,49)"=
>2. -a always,exit -F arch=3Db64 -S &lt;all syscalls part of the write and =
attr classes&gt; -F dir=3D/etc =C2=A0-F perm=3Dwa -k ETC_WATCH</span></div>=
<div dir=3D"auto"><span style=3D"font-family:-apple-system,&quot;Helvetica =
Neue&quot;;font-size:16px;font-style:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:1px;text-decoration:none;float:no=
ne;display:inline!important;color:rgb(49,49,49)"><br></span></div><div dir=
=3D"auto"><span style=3D"font-family:-apple-system,&quot;Helvetica Neue&quo=
t;;font-size:16px;font-style:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:1px;text-decoration:none;float:none;displ=
ay:inline!important;color:rgb(49,49,49)">The write and attr classes consist=
 of syscalls in=C2=A0<div dir=3D"auto" style=3D"font-family:-apple-system,&=
quot;Helvetica Neue&quot;"><span style=3D"font-family:-apple-system,&quot;H=
elvetica Neue&quot;;font-size:16px;font-style:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:1px;text-decoration:none=
;float:none;display:inline!important;color:rgb(49,49,49)">=E2=80=9Cinclude/=
asm-generic/audit_*.h=E2=80=9C.</span></div><div dir=3D"auto" style=3D"font=
-family:-apple-system,&quot;Helvetica Neue&quot;"><span style=3D"font-famil=
y:-apple-system,&quot;Helvetica Neue&quot;;font-size:16px;font-style:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:1=
px;text-decoration:none;float:none;display:inline!important;color:rgb(49,49=
,49)"><br></span></div><div dir=3D"auto" style=3D"font-family:-apple-system=
,&quot;Helvetica Neue&quot;"><span style=3D"font-family:-apple-system,&quot=
;Helvetica Neue&quot;;font-size:16px;font-style:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:1px;text-decoration:no=
ne;float:none;display:inline!important;color:rgb(49,49,49)">=C2=A0The perm =
flag is needed in the second case for including open/openat syscalls which =
are not a part of the write and attr syscall list.</span></div><div dir=3D"=
auto" style=3D"font-family:-apple-system,&quot;Helvetica Neue&quot;"><span =
style=3D"font-family:-apple-system,&quot;Helvetica Neue&quot;;font-size:16p=
x;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:1px;text-decoration:none;float:none;display:inline!import=
ant;color:rgb(49,49,49)"><br></span></div><div dir=3D"auto" style=3D"font-f=
amily:-apple-system,&quot;Helvetica Neue&quot;"><div style=3D"font-family:-=
apple-system,&quot;Helvetica Neue&quot;" dir=3D"auto">I&#39;d like to verif=
y if what I mentioned earlier is accurate, and I have an additional point b=
ut depends on whether this is accurate.</div><div style=3D"font-family:-app=
le-system,&quot;Helvetica Neue&quot;" dir=3D"auto"><br></div><div style=3D"=
font-family:-apple-system,&quot;Helvetica Neue&quot;" dir=3D"auto">Ali</div=
><br></div></span></div></div>
</div>

--000000000000f674570604b2c895--

--===============5015541930894123518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============5015541930894123518==--

