Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 903E1663FE4
	for <lists+linux-audit@lfdr.de>; Tue, 10 Jan 2023 13:08:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673352521;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=jBlr1Q+xOA1lX6qKSJU+MLGL+Aag+7twcnckahBSkLI=;
	b=Hg7OfftT+3V09bw6I8MeXXeB8Kk2zmTxnccuZsnMo6fLHmERROS2L4qj06LXYNSiE05Bsv
	VT+lgWUquPyvExemilUxmyMlu+al07rI3gVMoJkWR0yum+Pa38ZwMDD97cR0YhhL6/fX+v
	WLfVuYd5xNpAwkz0imrP6TMNlimjGiM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-jtDx9_yiPAWjijvbC9NFWg-1; Tue, 10 Jan 2023 07:08:38 -0500
X-MC-Unique: jtDx9_yiPAWjijvbC9NFWg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEF88101A55E;
	Tue, 10 Jan 2023 12:08:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 86AF0492B03;
	Tue, 10 Jan 2023 12:08:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 333A4194E107;
	Tue, 10 Jan 2023 12:08:28 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D9DEE1946587 for <linux-audit@listman.corp.redhat.com>;
 Tue, 10 Jan 2023 12:08:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B81DC1121319; Tue, 10 Jan 2023 12:08:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0B0F1121314
 for <linux-audit@redhat.com>; Tue, 10 Jan 2023 12:08:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B921101A521
 for <linux-audit@redhat.com>; Tue, 10 Jan 2023 12:08:26 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-jO7kWyUkN7qOlYmkgI97Ww-1; Tue, 10 Jan 2023 07:08:24 -0500
X-MC-Unique: jO7kWyUkN7qOlYmkgI97Ww-1
Received: by mail-vs1-f41.google.com with SMTP id i188so11977723vsi.8
 for <Linux-audit@redhat.com>; Tue, 10 Jan 2023 04:08:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KQYlUFWasdOtHK39LwUpwkDrTdYdBr6rxCwRvG9g4gg=;
 b=ecllUKTmJLKDnX0MhGSPxKHGa74xD+BQG1nfOhtLOVYYhd/K26eOlgFrDLQagdeM68
 LsPg+/u1S7DxKK1mekowTOV0C6rxt4Qi9b6x1PxkefbwE+pKupXhiINGa2nKwYpnrPJ2
 WVs+xKEwyUwcYPRBAqrACdGQNjNGPvgBeIgkclo/sUlks4epoiITIsh4RqHrxif4mMrY
 ST9dcAi/Z8P378ppdXcc7UyNiaAk4Ig21XzwzuNayhdxPot0nE0xO4XyX6nNNqCS0ddc
 STawLgAVvsixoms0OJElR+NU7+x/olaaN4vIWha4dlvR4tQ/ZVubNlCfxqmz27G74waI
 Q+Fw==
X-Gm-Message-State: AFqh2koAYsKNu3WO9Ebg8y4uSRZaPu/OjRQNSrOP8TmtwgfWhG2nCaSJ
 YYaKj5ql2K43DwKsxNLvKpJLXBChrDUKq5f1XC6fiTTstJY=
X-Google-Smtp-Source: AMrXdXuGCzLf2UvPfyOmXHDlmPLyucZzQ0ihLs0jCaqRPlvh1kQvgRmpwpIJ0sWzoKgWRKPqO9U2+xqcrje22rUJwZQ=
X-Received: by 2002:a67:fe04:0:b0:3cb:a2d:a8bb with SMTP id
 l4-20020a67fe04000000b003cb0a2da8bbmr5209977vsr.39.1673352503350; Tue, 10 Jan
 2023 04:08:23 -0800 (PST)
MIME-Version: 1.0
From: Anurag Aggarwal <anurag19aggarwal@gmail.com>
Date: Tue, 10 Jan 2023 17:38:12 +0530
Message-ID: <CAPoNrttQd+ieQ+B93SbrbiPjppRoiyT_a+7FpiRdQNGQ2ApiXQ@mail.gmail.com>
Subject: Identify whether the kernel version supports Path based exclusion
To: Linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Cc: avtanshgupta1995@gmail.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============7917768178969278743=="

--===============7917768178969278743==
Content-Type: multipart/alternative; boundary="0000000000008bdd0a05f1e7bd17"

--0000000000008bdd0a05f1e7bd17
Content-Type: text/plain; charset="UTF-8"

Hello All,

I need a method to identify whether the audid version a kernel is running
supports path based exclusions.

One option would be to use audit_add_rule_data to add a temporary path
based rule and check if it is successful, but this won't work when auditd
is running in immutable mode.


Any other way which does not require checking versions of Kernel or
Distribution?

-- 
Anurag Aggarwal

--0000000000008bdd0a05f1e7bd17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello All,<div><br></div><div>I need a method to identify =
whether the audid version a kernel is running supports path based exclusion=
s.</div><div><br></div><div>One option would be to use=C2=A0audit_add_rule_=
data to add a temporary path based rule and check if it is successful, but =
this won&#39;t work when auditd is running in immutable mode.<br clear=3D"a=
ll"><div><br></div><div><br></div><div>Any other way which does not require=
 checking versions of Kernel or Distribution?</div><div><br></div>-- <br><d=
iv dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"=
>Anurag Aggarwal<br></div></div></div>

--0000000000008bdd0a05f1e7bd17--

--===============7917768178969278743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============7917768178969278743==--

