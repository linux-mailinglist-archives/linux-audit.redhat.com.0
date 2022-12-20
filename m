Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E739E6529E0
	for <lists+linux-audit@lfdr.de>; Wed, 21 Dec 2022 00:31:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671579080;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+edoDkAQUvuAUWV9wMihbl1h/G15a8S5X04knE2lAgY=;
	b=HghOJbHaubHDYCrICpeJEhmRm6rrf9I08IQwAlT7F+zDJJoIZEmQZCJ+nx6mvudDVW4ONJ
	6ByhThpmFPvgyNJ3yqnuA6VZycD32/Jba+MM7XSl1FlA1sEtBrR7/nsitaTQTg+DxdqRne
	B02F93ScGrfBywFoewbxjHXPmW20Gg0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-RVy8K9nqPM-tj-XmS4PTUQ-1; Tue, 20 Dec 2022 18:31:16 -0500
X-MC-Unique: RVy8K9nqPM-tj-XmS4PTUQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9795101A521;
	Tue, 20 Dec 2022 23:31:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4EB8D4014EB9;
	Tue, 20 Dec 2022 23:31:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C2A9B19465B3;
	Tue, 20 Dec 2022 23:31:12 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 78D4619465A0 for <linux-audit@listman.corp.redhat.com>;
 Tue, 20 Dec 2022 23:31:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 66234C16028; Tue, 20 Dec 2022 23:31:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F909C16027
 for <linux-audit@redhat.com>; Tue, 20 Dec 2022 23:31:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1124B8027F8
 for <linux-audit@redhat.com>; Tue, 20 Dec 2022 23:31:12 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-PfAh2hvfO3ej_bJmA2-KPQ-1; Tue, 20 Dec 2022 18:31:08 -0500
X-MC-Unique: PfAh2hvfO3ej_bJmA2-KPQ-1
Received: by mail-pl1-f171.google.com with SMTP id d7so13821006pll.9
 for <linux-audit@redhat.com>; Tue, 20 Dec 2022 15:31:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zre1kotzR+gyUnyjZM5SkqNzTaEPBauNGGmkiFmJLxA=;
 b=6INm+BsuWNt0XvbfgERafqTIA5mPL10hSSGztVmaW6uZX2hOmJeYcM+jRWfL+P5S/U
 CY/7NsaXjmr+E5mlnF0ADMF+pxBcA4VmmKQ9hrDEHpSBI+77Yp24LXSTHem+mpFUuh2O
 PXq31Wrc2uCR7lEjP6l5kNwN/ukk++JtzHk0LktQRsXFLqW4YzNUkwgNgM+DtGHku3DY
 C97Nt1rTOHIwBfd5mNZZsgBmhL7ocxLtBQEXpYvtnBPswxSF4a5CQNWCwTfc1l1BrHHx
 gO6W6AUE/tbqbyycrcPjyAhR06Di7/b1pZOhhbtkojqezK42TvAOq51ExtSA5pK927Qy
 gzKw==
X-Gm-Message-State: ANoB5pk0bjPPT0B1SYA5i5/bcl2I4rSi8SDPf2Od6emJ25qrovc7vq/Z
 YI2+5kd5KmCXv59o7DHeUWlW2Pqsin9JKq4i6A6I
X-Google-Smtp-Source: AA0mqf7+YJR0aQlb22cA8u1ukv0bd+pXUGYeqBMNcL0hZcYc3FUyoIGarrrn28B0nOfNbTsag/TgPOEscRMb7Pf8iqk=
X-Received: by 2002:a17:902:9892:b0:186:c3b2:56d1 with SMTP id
 s18-20020a170902989200b00186c3b256d1mr81913259plp.15.1671579067046; Tue, 20
 Dec 2022 15:31:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1670606054.git.rgb@redhat.com>
 <33f683794883676be88e503594ba094db2ff6bbb.1670606054.git.rgb@redhat.com>
In-Reply-To: <33f683794883676be88e503594ba094db2ff6bbb.1670606054.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 20 Dec 2022 18:30:56 -0500
Message-ID: <CAHC9VhTyqAvevFFBwB0NLGRB9wwgp22VH_vDXq-FbjzL63A2cg@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] fanotify: Ensure consistent variable type for
 response
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: Jan Kara <jack@suse.cz>, linux-api@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Audit Mailing List <linux-audit@redhat.com>,
 linux-fsdevel@vger.kernel.org, Eric Paris <eparis@parisplace.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022 at 9:06 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> The user space API for the response variable is __u32. This patch makes
> sure that the whole path through the kernel uses u32 so that there is
> no sign extension or truncation of the user space response.
>
> Suggested-by: Steve Grubb <sgrubb@redhat.com>
> Link: https://lore.kernel.org/r/12617626.uLZWGnKmhe@x2
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  fs/notify/fanotify/fanotify.h      | 2 +-
>  fs/notify/fanotify/fanotify_user.c | 6 +++---
>  include/linux/audit.h              | 6 +++---
>  kernel/auditsc.c                   | 2 +-
>  4 files changed, 8 insertions(+), 8 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com> (audit)

--
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

