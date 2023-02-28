Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F46E6A572F
	for <lists+linux-audit@lfdr.de>; Tue, 28 Feb 2023 11:53:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677581621;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=tPC8KIQBMZWQK70OsLi04bJ6+xP2/4ethTwft1c3Xus=;
	b=CtcSVw4QGl8lXVsAh46bxrbRYKDLEcR79JXzyUnc5SLtg0nsa02AEDs1aegkoWNqWC0v1E
	TshW0W6xgUxmjCC43DTxsXIv2P1XPQ23MAn8VEB5xBf0cU8VyvFqyNlOFBftVqUboCgfEd
	XiGwpQynBn13wKRFZfH32N0kuCzmqZ4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-KAFSTJy-MNWfMJq-ZVL7hw-1; Tue, 28 Feb 2023 05:53:35 -0500
X-MC-Unique: KAFSTJy-MNWfMJq-ZVL7hw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C30918A6460;
	Tue, 28 Feb 2023 10:53:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CBFB12166B2A;
	Tue, 28 Feb 2023 10:53:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4BF9519465A2;
	Tue, 28 Feb 2023 10:53:20 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BAF181946589 for <linux-audit@listman.corp.redhat.com>;
 Tue, 28 Feb 2023 10:53:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4B91B2026D68; Tue, 28 Feb 2023 10:53:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 423CD2026D4B
 for <linux-audit@redhat.com>; Tue, 28 Feb 2023 10:53:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22BBA886462
 for <linux-audit@redhat.com>; Tue, 28 Feb 2023 10:53:18 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-Bstys3xxNWi92u-48YUUrQ-1; Tue, 28 Feb 2023 05:53:15 -0500
X-MC-Unique: Bstys3xxNWi92u-48YUUrQ-1
Received: by mail-vs1-f54.google.com with SMTP id df20so15405520vsb.3
 for <Linux-audit@redhat.com>; Tue, 28 Feb 2023 02:53:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8h+d7+/egM1Aa2uXjzP2v84v3VatY/7Z9l2GfQDjuiE=;
 b=GHi6E7cB+pYBLIzov6CHtd7dRY/QF5MBWFOzKFGTqGGK12kIZpKwGGJsUYHXwjPA9R
 oQhUu/aUGwRP5BOnNIVhBqwp/A4+441IT1kZM9ij+I5SHwizCv4zjtV+ngiJhcfa7J02
 ucWf3NKUcbbNRMSMgRnCCvSlXZ9p0LOYVTJaBccdKUxkWyPDDTk4+UxgDQrb7F2OR8Il
 OF/p4KYHN8J6LnU+iAmAp5wcdQsZanVX2LQCGfskgCwR4inBfaehJ2wDDjWYABzB+nh2
 s5Oi7VJFzh38lcQ+VymTPe9T6A5ilmm+TdU7EZ7prHVIW/+vtvsJHBEfsMSptx8DLQ3a
 BpbA==
X-Gm-Message-State: AO0yUKW5PQKh4ntFYwi7/8PlZd4DGPG4poi+CvH0qycNzjQgVwHDOoAl
 5lqeHTRq/tyxpKi6YgSBf0W0LsW0Vw8lRQJAXUK3KRjgOR0=
X-Google-Smtp-Source: AK7set8V2xFnRrXavCkQIZqLA4ZTHZLA2D+3clblMGTd8SNFlL8QKjnAYhDNeVVkUf0G5EkBlrzZtNmSFprrVQQMFEY=
X-Received: by 2002:a67:ff09:0:b0:411:ac7f:a94e with SMTP id
 v9-20020a67ff09000000b00411ac7fa94emr1775489vsp.0.1677581594727; Tue, 28 Feb
 2023 02:53:14 -0800 (PST)
MIME-Version: 1.0
From: Anurag Aggarwal <anurag19aggarwal@gmail.com>
Date: Tue, 28 Feb 2023 16:23:04 +0530
Message-ID: <CAPoNrttQKG1uiUx=v6Cj8U0MnYMoU-ZP_Htmxn7F_Q7ZdUc9RA@mail.gmail.com>
Subject: Key based rate limiter (audit_set_rate_limit)
To: Linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============2930740395078575483=="

--===============2930740395078575483==
Content-Type: multipart/alternative; boundary="000000000000091a8c05f5c06780"

--000000000000091a8c05f5c06780
Content-Type: text/plain; charset="UTF-8"

Hello All,

The current rate limiter, audit_set_rate_limit limits all types of events.
In our case, we want to limit auditd events with a specific key, as they
are very noisy and consume very high CPU.

From my understanding, this support is currently missing in AuditD.

Is my understanding correct?

-- 
Anurag Aggarwal

--000000000000091a8c05f5c06780
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello All,<div><br></div><div>The current rate limiter,=C2=
=A0<span style=3D"background-color:rgb(255,255,254);color:rgb(0,0,0);font-f=
amily:Consolas,&quot;Courier New&quot;,monospace;font-size:12px;white-space=
:pre">audit_set_rate_limit </span>limits all types of events. In our case, =
we want to limit auditd events with a specific key, as they are very noisy =
and consume very high CPU.=C2=A0</div><div><br></div><div>From my understan=
ding, this support is currently missing in AuditD.</div><div><br></div><div=
>Is my understanding correct?</div><div><div><br></div>-- <br><div dir=3D"l=
tr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Anurag Agg=
arwal<br></div></div></div>

--000000000000091a8c05f5c06780--

--===============2930740395078575483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============2930740395078575483==--

