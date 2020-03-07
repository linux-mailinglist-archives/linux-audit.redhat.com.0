Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 74E7617CA82
	for <lists+linux-audit@lfdr.de>; Sat,  7 Mar 2020 02:36:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583544998;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=O9tiIL07wTnGPVBoofWmDaKPiKV55pYHEAxfUo+uNf8=;
	b=G3ZzuCXxBUzeWt/sFe+kc4ou98goKAh1KbSu/xVPchDTg2iVFrwkgwyBaA4EPHT+oZnd4z
	HKI3oiIVe3618kEi9phwTsxLALeibIDzCOJQvY6oaGOvYGVJhYjrb/2AxgbcfMfKxYQeaX
	RnWue+fmbCQJMSTX7V/lPzq9wpIFzao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-14KXSkEgPL-l6WUcq-Bvjg-1; Fri, 06 Mar 2020 20:36:36 -0500
X-MC-Unique: 14KXSkEgPL-l6WUcq-Bvjg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 305F8100550E;
	Sat,  7 Mar 2020 01:36:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 375C85D9CD;
	Sat,  7 Mar 2020 01:36:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A957A18089C8;
	Sat,  7 Mar 2020 01:36:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0271aMTV015649 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 6 Mar 2020 20:36:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 096D32033955; Sat,  7 Mar 2020 01:36:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0451E2026D68
	for <linux-audit@redhat.com>; Sat,  7 Mar 2020 01:36:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78BB2800658
	for <linux-audit@redhat.com>; Sat,  7 Mar 2020 01:36:19 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-177--cSFvXPZM2yjLMcEUcKX6Q-1; Fri, 06 Mar 2020 20:36:17 -0500
X-MC-Unique: -cSFvXPZM2yjLMcEUcKX6Q-1
Received: by mail-ed1-f68.google.com with SMTP id m13so4679304edb.6
	for <linux-audit@redhat.com>; Fri, 06 Mar 2020 17:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rWZeQej+r+kbKlYKnSuKAgl98kSl0oK3lI1u5tJ0hnI=;
	b=dHLar9Q1jptMcjHhLZS4sNg9W7GmQlzBtyIeIY5xE8rrN5i0Uc+FZzZ462w+sA80vT
	4WpCanM3e8aYophGDQFwCJGJUjIrJiDQtEeim2kD/8WkHrDIxAxZzl0F2iGsAJGdeHZ+
	mkSBqbF8QvQMQgstn6hEtT7rFEf6BO3qtbWsQuTVBKk9B8Yx93NipE6ZGIVy3gmVFmM8
	gnfwGnH6O7l4kTX8mNjnLUn6wiqOegoS3VxpqgcTEUE8fCbO2SYrZUZoh33NbWNeFeFy
	D97DBPMUbkscA3uuRUFrgdnM+goRnFiwRf9nOit93DwpXcPXd6A8To+1PaSPviTW4u2m
	+s4w==
X-Gm-Message-State: ANhLgQ0Vc9R5GI/7FbhmklUu8h7nYXk4jakcxAdF4YOkS0eiqzEleIig
	LS5AKAdX2bTaWjkDuBhiZoVwx1sNmYZkpWZv2UNkFXc=
X-Google-Smtp-Source: ADFU+vvAiDOULucCwwG8hI3+7IPofXrz3Vdkc+fdR+CGaU1IhSNB/w+uTCY0M2tFGsPWIAfRo4Qwxq+bVCeIrDyymYI=
X-Received: by 2002:a17:906:370a:: with SMTP id
	d10mr5583142ejc.281.1583544975650; 
	Fri, 06 Mar 2020 17:36:15 -0800 (PST)
MIME-Version: 1.0
References: <20200222000407.110158-1-casey@schaufler-ca.com>
	<20200222000407.110158-9-casey@schaufler-ca.com>
In-Reply-To: <20200222000407.110158-9-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Mar 2020 20:36:04 -0500
Message-ID: <CAHC9VhSxEUrYow60OY6GXK1t4jb9O80ZYtR3U+AvaBUdxTTLFQ@mail.gmail.com>
Subject: Re: [PATCH v15 11/23] LSM: Use lsmblob in security_cred_getsecid
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0271aMTV015649
X-loop: linux-audit@redhat.com
Cc: casey.schaufler@intel.com, linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 21, 2020 at 7:05 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Change the security_cred_getsecid() interface to fill in a
> lsmblob instead of a u32 secid. The associated data elements
> in the audit sub-system are changed from a secid to a lsmblob
> to accommodate multiple possible LSM audit users.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> cc: linux-integrity@vger.kernel.org
> ---
>  include/linux/security.h          |  2 +-
>  kernel/audit.c                    | 19 +++++++-----------
>  kernel/audit.h                    |  5 +++--
>  kernel/auditsc.c                  | 33 +++++++++++--------------------
>  security/integrity/ima/ima_main.c |  8 ++++----
>  security/security.c               | 12 ++++++++---
>  6 files changed, 36 insertions(+), 43 deletions(-)

There is some undefined scaffolding in the IMA section, but I'll leave
that to Mimi if she cares or not.  One small suggestion below, but I'm
okay if you ignore that, it's pretty minor.

Acked-by: Paul Moore <paul@paul-moore.com>

> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index b55e66c2451d..d52ae228ad3d 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -1733,7 +1732,7 @@ void __audit_syscall_exit(int success, long return_code)
>         context->aux = NULL;
>         context->aux_pids = NULL;
>         context->target_pid = 0;
> -       context->target_sid = 0;
> +       lsmblob_init(&context->target_lsm, 0);

Would it be worth having a "lsmblob_unset(struct lsmblob *)" for
situations such as these?  Even if right now it is just a wrapper
around "lsmblob_init(blob, 0)" I think it might have some
futureproofing value in case the struct grows additional fields and is
no longer tightly packed.

>         context->sockaddr_len = 0;
>         context->type = 0;
>         context->fds[0] = -1;

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

