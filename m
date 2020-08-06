Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 11A5C23E07F
	for <lists+linux-audit@lfdr.de>; Thu,  6 Aug 2020 20:36:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-o9PGuQrzOpqcea2QMT2U3Q-1; Thu, 06 Aug 2020 14:36:47 -0400
X-MC-Unique: o9PGuQrzOpqcea2QMT2U3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE787100CC85;
	Thu,  6 Aug 2020 18:36:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30AB25D9DC;
	Thu,  6 Aug 2020 18:36:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C7591809554;
	Thu,  6 Aug 2020 18:36:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076IZVSj007425 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 14:35:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 235282166B27; Thu,  6 Aug 2020 18:35:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EC7B2156A4F
	for <linux-audit@redhat.com>; Thu,  6 Aug 2020 18:35:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3F2D8007D1
	for <linux-audit@redhat.com>; Thu,  6 Aug 2020 18:35:27 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-149-wDYSjBTaPyKEgYwClAQpug-1; Thu, 06 Aug 2020 14:35:25 -0400
X-MC-Unique: wDYSjBTaPyKEgYwClAQpug-1
Received: by mail-ed1-f66.google.com with SMTP id l23so22149237edv.11
	for <linux-audit@redhat.com>; Thu, 06 Aug 2020 11:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xuh5L///1+6tqkx4SRS1RotcWxk6pfAkKpYSeAk+r38=;
	b=lXOUB60hG1g/qn8e9NadFEstnmE86njXH8XMrK/2yOCsVABV1kKh1njNyRFXcg5bs9
	v6iZu4skiIqRRyTXUgdtm6ghF2aQC51M6oYEBD1HdqFZnLOpJtwdyaUvP/w4bWcMsszl
	YwfQBLjQHamsWycWCR0/Yop9WrZOLVLHoeve1i/zr/lxi71C4zgR+PP9jsIj6arZnn05
	k7OORVVkakvxzWPfiAVy0mk1k4HbnHATkuoBM73FYNXHSZXw7YU1FPjl545vFo9L9Mtx
	afw+/3JxuO+yO6IxZUB5H3QfeIT/lUzLDJZmYbwadUP7MvvaPf5xJFZYPHj3LiGjj8fI
	2Nkg==
X-Gm-Message-State: AOAM530EGEV97N9gGjAg0QQG9hup88AmvZeycNxtbWkdjKia0uuxrru2
	WKwAQLKQpZOuUrPSJcGPsB1b1rFZRWsIJlTgM68a
X-Google-Smtp-Source: ABdhPJzobp3XHFhPQHypcdgsf1CVg1Hjp7fpOVXPXt5WPfkFAmsIZUO5MG4ZWuct7JxXuKpRwr1fkzSlTGifEgIyyd8=
X-Received: by 2002:a50:93c5:: with SMTP id o63mr5213126eda.31.1596738924215; 
	Thu, 06 Aug 2020 11:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200803123439.83400-1-jbi.octave@gmail.com>
	<20200803123439.83400-3-jbi.octave@gmail.com>
In-Reply-To: <20200803123439.83400-3-jbi.octave@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 6 Aug 2020 14:35:13 -0400
Message-ID: <CAHC9VhQA0JZNLZbfUUecrTbMvnD3S7sRMOAoW5eeeK-jpZeEWw@mail.gmail.com>
Subject: Re: [RESEND PATCH 2/2] audit: uninitialize variable audit_sig_sid
To: Jules Irenge <jbi.octave@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: "moderated list:AUDIT SUBSYSTEM" <linux-audit@redhat.com>,
	linux-kernel@vger.kernel.org
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 3, 2020 at 8:35 AM Jules Irenge <jbi.octave@gmail.com> wrote:
>
> Checkpatch tool reports
>
> "ERROR: do not initialise globals/statics to 0"
>
> To fix this, audit_sig_sid is uninitialized
> As this is stored in the .bss section,
> the compiler can initialize the variable automatically.
>
> Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
> ---
>  kernel/audit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Similar to patch 1/2, this will need to wait until after the merge
window closes.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

