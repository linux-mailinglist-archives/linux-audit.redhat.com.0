Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C81F68058E
	for <lists+linux-audit@lfdr.de>; Mon, 30 Jan 2023 06:22:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675056141;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=hiLwvpWlE9z29tOLpiU46LXoG0uWa0cr+Uh0WQ7tqEU=;
	b=Q2m0p+zk+6oP0KBLiTCFTw9wzN5DnuhSR00JBu4nkFsLH/aWM4B2TymbF2GJtqnqhIiteB
	SB2fBvVhqztx2CdvQV56f+DsgsTd77JS4GuNyv34aAzCL9Spk7Wh/0tHM5DPXwySU4eK8Q
	WKsQf17z8HKkU8GFirj6dxtlg6BP5G0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59--pIWQB0GPxWkCeKb7t9rww-1; Mon, 30 Jan 2023 00:22:18 -0500
X-MC-Unique: -pIWQB0GPxWkCeKb7t9rww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 219DF85CBE3;
	Mon, 30 Jan 2023 05:22:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 13C6B14171BB;
	Mon, 30 Jan 2023 05:22:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C50331946597;
	Mon, 30 Jan 2023 05:22:06 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6AB911946587 for <linux-audit@listman.corp.redhat.com>;
 Mon, 30 Jan 2023 05:22:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 59B142166B2A; Mon, 30 Jan 2023 05:22:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 530402166B26
 for <linux-audit@redhat.com>; Mon, 30 Jan 2023 05:22:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3424F85A5B1
 for <linux-audit@redhat.com>; Mon, 30 Jan 2023 05:22:05 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-7-mt4CemN8NmaNvQdZUDXrMQ-1; Mon, 30 Jan 2023 00:22:02 -0500
X-MC-Unique: mt4CemN8NmaNvQdZUDXrMQ-1
Received: by mail-vs1-f49.google.com with SMTP id h19so9524535vsv.13
 for <Linux-audit@redhat.com>; Sun, 29 Jan 2023 21:22:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QIIwGw7un6D9aEX06YG3bVwzm3VDAt8sAIz6KPZbYaw=;
 b=GHmSirxu+UjYazBcfRosXySRsGxSGr/WoOgvTQOWwzdlC7eox3xCzpMTHEuqSApqPA
 sYhCJR6VZycoUXyvrZzyJfMjZx1vWgPmd/2g168FJpGo4oRiB6Tdu8U/OvMqPNXqe/oD
 6YgGpBYxthjyD2MORxvJx702AhbVy0i4iYH/Y8mTHVVXzau/jHn/rWdvVa7Pf2C7qgrv
 rBb3sgjG4RzlySLB31KTcvkswMQwqrL6ujXX/9ZxIL6Mn/EWxuzE4odFh2Ax9Zwl52nP
 cicmMbE4z75gIGtB4s4oDHbwBgqDzdnnPbU4uprKc8MoUNLTrkH92NGpsgK9S/0kArCi
 w69Q==
X-Gm-Message-State: AO0yUKWFcYKtbXeDXpZIZhtiMWoTzUnCVrVfsDUUBLRw+PeXUnnRsfAA
 CjLHdvUJ7taVUBPeyECL26u6i+w6mAQxOWOb8CZ2GWxD
X-Google-Smtp-Source: AK7set9/ilQXiLJNwoWnNWq0wTpb293APTKUma/87I/aDQokm0TVudZtJ7g2+5qHyAiTY8u4uyFLimERzWplmsoFU9Y=
X-Received: by 2002:a67:bb08:0:b0:3f9:fb55:f178 with SMTP id
 m8-20020a67bb08000000b003f9fb55f178mr152460vsn.42.1675056121896; Sun, 29 Jan
 2023 21:22:01 -0800 (PST)
MIME-Version: 1.0
From: Anurag Aggarwal <anurag19aggarwal@gmail.com>
Date: Mon, 30 Jan 2023 10:51:53 +0530
Message-ID: <CAPoNrtu5eH8aPWkRTK+GkgddF=f_SVF3Pfi+WuHMafFxSdGTgw@mail.gmail.com>
Subject: Setting priority to auditd rule files
To: Linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============8691889369598991046=="

--===============8691889369598991046==
Content-Type: multipart/alternative; boundary="0000000000001fe74805f37465fd"

--0000000000001fe74805f37465fd
Content-Type: text/plain; charset="UTF-8"

Hello All,

As per my understanding, currently auditd picks up rule files as per
alphabetical order.
Is there a way to force auditd to prioritize which rule file should be
first read and applied, other than renaming it as 000-<app>.rules and
hoping that customers don't have anything lexicographically smaller than
this?

-- 
Anurag Aggarwal

--0000000000001fe74805f37465fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello All,<div><br></div><div>As per my understanding, cur=
rently auditd picks up rule files as per alphabetical order.</div><div>Is t=
here a way to force auditd to prioritize which rule file should be first re=
ad and applied, other than renaming it as 000-&lt;app&gt;.rules and hoping =
that customers don&#39;t have anything lexicographically smaller than this?=
=C2=A0</div><div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_sign=
ature" data-smartmail=3D"gmail_signature">Anurag Aggarwal<br></div></div></=
div>

--0000000000001fe74805f37465fd--

--===============8691889369598991046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============8691889369598991046==--

