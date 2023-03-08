Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA5F6B0678
	for <lists+linux-audit@lfdr.de>; Wed,  8 Mar 2023 12:57:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678276640;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=s9uROLJdDhyGzMkxO1yoJWv1xVlHbUd22P+BwXag7ok=;
	b=bJPRWvrektIzkz4AcXZWlFEv3XKewBVauAQE7tBPgf6ytfoGDFxKPnEQwWKuhLpthwTgUk
	u1JXeiwIT5Nhs1dVy0UZVF53pW90cG63VrfBJAI1zhewc9BTQibPAXbgWRCvn8NVsXpVHz
	HVWv/gyIIQ0YgCyjCWUQThUWUqRnyS4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-VS6uI0tQPhCD9jcsOOERgQ-1; Wed, 08 Mar 2023 06:57:16 -0500
X-MC-Unique: VS6uI0tQPhCD9jcsOOERgQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E374C185A794;
	Wed,  8 Mar 2023 11:57:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 978B11402646;
	Wed,  8 Mar 2023 11:57:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6F61619465B9;
	Wed,  8 Mar 2023 11:57:09 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 197E719465B1 for <linux-audit@listman.corp.redhat.com>;
 Wed,  8 Mar 2023 11:54:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0D129492C3E; Wed,  8 Mar 2023 11:54:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03AD9492B02
 for <linux-audit@redhat.com>; Wed,  8 Mar 2023 11:53:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE03B101B429
 for <linux-audit@redhat.com>; Wed,  8 Mar 2023 11:53:53 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-v0v9kWY3Mqq1F3-BpXCNdA-1; Wed, 08 Mar 2023 06:53:51 -0500
X-MC-Unique: v0v9kWY3Mqq1F3-BpXCNdA-1
Received: by mail-ua1-f48.google.com with SMTP id bx14so11048855uab.0
 for <Linux-audit@redhat.com>; Wed, 08 Mar 2023 03:53:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678276430;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JjLndlqzRYJdTZqiKsZutRvS8uQTzvkraC2NEjRhAFg=;
 b=FRyB9NYYZeEQezgIfZk6QqWpKTeAaj/Cxr2k6o/SI7VjRSNnoiHpw3aOU+uMDck/HQ
 NV+7XDtCfBUoDAYPPGGnlUSDeHC8Dq04uKAdNz44FmMnieBoSMXy/nJoC1QJCxvlZbPA
 J3m8cfkYUvnqK1xnpEdMODl7PfJikG+kE+HXrnjZkwiY8ckb5XcmYoN80CsxYl+cVf/V
 6FqS8EesGB1guXO6QPvw2reAtgk75GpT+hLmpooArF1/T8FiM476++GyG9fsKFlFPMRJ
 aT3109nYJnMm7ICh/vtmlsojn53SUElGC4wEyZXEQJ5HpjNXXZ9Dn7hzdD+SxrWmUZXL
 47YA==
X-Gm-Message-State: AO0yUKXih7H71HxE6JVBIzxSEbfx5dJ0Kqi/GWNxf7pYrSIemrndaxqC
 WEfJNiJwLi4p3rrrbPRWzyWgREJBkhoKCWucG60Fn1qroSQ=
X-Google-Smtp-Source: AK7set8vZAO9d5Bw7Pat2ihVMMr/0A/R0vGcujoaLjGd3S8aG+Px7qtcT53jvFOlznDVPXm+cfflizTGD9mCUCg9BEI=
X-Received: by 2002:a1f:6043:0:b0:42d:424c:aea3 with SMTP id
 u64-20020a1f6043000000b0042d424caea3mr1106356vkb.2.1678276430395; Wed, 08 Mar
 2023 03:53:50 -0800 (PST)
MIME-Version: 1.0
References: <CAPoNrttQKG1uiUx=v6Cj8U0MnYMoU-ZP_Htmxn7F_Q7ZdUc9RA@mail.gmail.com>
 <CAHC9VhQAFgv5e3rvoaDTnQvQOoGawoAUfcRonayEwrvJu6znBg@mail.gmail.com>
In-Reply-To: <CAHC9VhQAFgv5e3rvoaDTnQvQOoGawoAUfcRonayEwrvJu6znBg@mail.gmail.com>
From: Anurag Aggarwal <anurag19aggarwal@gmail.com>
Date: Wed, 8 Mar 2023 17:23:39 +0530
Message-ID: <CAPoNrtvt_RZfPYLAWdPp6gTu_67f1RzOz3s4T62SdoG4ryyzGw@mail.gmail.com>
Subject: Re: Key based rate limiter (audit_set_rate_limit)
To: Paul Moore <paul@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: Linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6362759081121885444=="

--===============6362759081121885444==
Content-Type: multipart/alternative; boundary="00000000000078000305f6622e9a"

--00000000000078000305f6622e9a
Content-Type: text/plain; charset="UTF-8"

>
>
> Limiting of audit records is actually done in the kernel, and
> currently the rate limit applies equally[1] to all records, there is
> no ability to enforce limits per-key.


One question Paul, will it be ok, if we contribute something similar to the
Auditd Kernel repository?


-- 
Anurag Aggarwal

--00000000000078000305f6622e9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><br>
Limiting of audit records is actually done in the kernel, and<br>
currently the rate limit applies equally[1] to all records, there is<br>
no ability to enforce limits per-key.=C2=A0</blockquote><div><br></div><div=
>One question Paul, will it be ok, if we contribute something similar to th=
e Auditd Kernel repository?=C2=A0</div></div><br clear=3D"all"><div><br></d=
iv><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" cl=
ass=3D"gmail_signature">Anurag Aggarwal<br></div></div>

--00000000000078000305f6622e9a--

--===============6362759081121885444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============6362759081121885444==--

