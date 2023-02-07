Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1D768E0A7
	for <lists+linux-audit@lfdr.de>; Tue,  7 Feb 2023 19:56:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675796187;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3Xt0F0Nzqg32QIyGeaecRQPjlMIyjOTZpPMXXKCKg28=;
	b=h38Uw2nQ6lAmrNdaSAT3J6G2r1aTj92ui9umaeeSli0lv31GlTdM0nWUoGbJM2jNER/WHW
	+/5tJAaTlojEFjTCur/vcTRny9jQDy6Hb6Kzmy8Ob8WYIM3QcQ1BDfPXyi3cYYrf8iJJLM
	Bu5bIh2usOUqkgv4MytfN84GqLErc2Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-2QkaBMslOA6voPTliNl7xQ-1; Tue, 07 Feb 2023 13:56:25 -0500
X-MC-Unique: 2QkaBMslOA6voPTliNl7xQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 278831C0513A;
	Tue,  7 Feb 2023 18:56:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D4BDC15BA0;
	Tue,  7 Feb 2023 18:56:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2FCFE19465A0;
	Tue,  7 Feb 2023 18:56:21 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4DBEB1946589 for <linux-audit@listman.corp.redhat.com>;
 Tue,  7 Feb 2023 18:56:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F2809400D9D0; Tue,  7 Feb 2023 18:56:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBC6C40B42D4
 for <linux-audit@redhat.com>; Tue,  7 Feb 2023 18:56:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2756811E9C
 for <linux-audit@redhat.com>; Tue,  7 Feb 2023 18:56:19 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-16-ETkblIKrME-xCejh8g-gFg-1; Tue, 07 Feb 2023 13:56:17 -0500
X-MC-Unique: ETkblIKrME-xCejh8g-gFg-1
Received: by mail-pf1-f177.google.com with SMTP id 144so11431186pfv.11
 for <linux-audit@redhat.com>; Tue, 07 Feb 2023 10:56:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1675796176;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tbhrs0B7O+w+kwek2vEgyf5Rv89pXWLBiIPRRKh9t1c=;
 b=5+pcLskELLBBgwVv1OBIPrezg/ZL7oE+QoVBnVbKTsjF3rlQFY/7NTR+lBXAFHl1tO
 KxAb2Nn8nbvbmM11eVaSVAMrp3v7SIR5SculWnhPaAAGziQJJWW/7EYrx8sM6Z/n960+
 6d873kMxC+x2EU60J6xaOgPBmQTjGmzHza7r8YKBVt0qG7EBv5NZc/Cg7aDzGS2dVDi3
 N3k+FkNP37lN9DZGj3MK15SIT3eC7biV0fAOsaij+L/UsLOql2loNmktxjfHIQe4DTXU
 CCQCKq9QqP+vuA180xTmIB7pYvsC9e/X8HSokroejLtKyVay+2OyBmUKRR/gXwdwPpvR
 OTAQ==
X-Gm-Message-State: AO0yUKWErVAFnGRa5LxpSr43VlcmvjAg9X7Lg1vi1Vi9pMnzW0sC1HqL
 8L4hJ7EYTLAkDRZo0J0kL+KV4U8NoaC6wcAH+X3a
X-Google-Smtp-Source: AK7set++Fw8HwHO7H8QGgDdN/QqGLy26R8fqRBoWx9wgna4CjWP/VuDzoplcYJxn6LuoZC8t8p1qmnG+RBN22TdmRVs=
X-Received: by 2002:a05:6a00:dd:b0:5a8:189d:b53f with SMTP id
 e29-20020a056a0000dd00b005a8189db53fmr83363pfj.6.1675796176059; Tue, 07 Feb
 2023 10:56:16 -0800 (PST)
MIME-Version: 1.0
References: <20230207184454.222696-1-paul@paul-moore.com>
In-Reply-To: <20230207184454.222696-1-paul@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 7 Feb 2023 13:56:04 -0500
Message-ID: <CAHC9VhQGS2uXthP_X2yeFRRwW5G3T4JUdbwZgtMCNAfVYnpL4w@mail.gmail.com>
Subject: Re: [PATCH] audit: update the mailing list in MAINTAINERS
To: audit@vger.kernel.org, linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 7, 2023 at 1:44 PM Paul Moore <paul@paul-moore.com> wrote:
>
> We've moved the upstream Linux Kernel audit subsystem discussions to
> a new mailing list, this patch updates the MAINTAINERS info with the
> new list address.
>
> Marking this for stable inclusion to help speed uptake of the new
> list across all of the supported kernel releases.  This is a doc only
> patch so the risk should be close to nil.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Paul Moore <paul@paul-moore.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've just merged this into audit/next.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7f86d02cb427..b686c3af313f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3511,7 +3511,7 @@ F:        drivers/net/ieee802154/atusb.h
>  AUDIT SUBSYSTEM
>  M:     Paul Moore <paul@paul-moore.com>
>  M:     Eric Paris <eparis@redhat.com>
> -L:     linux-audit@redhat.com (moderated for non-subscribers)
> +L:     audit@vger.kernel.org
>  S:     Supported
>  W:     https://github.com/linux-audit
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
> --
> 2.39.1

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

