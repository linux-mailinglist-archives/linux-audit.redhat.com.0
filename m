Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E391D172DCD
	for <lists+linux-audit@lfdr.de>; Fri, 28 Feb 2020 02:02:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582851760;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5RNTwk/xYF7DOEwUFf+JOxSQHWsf1lWZ56NjQjFmI24=;
	b=CRCYODhT1iv4LYMPbr6vOXVoDM+hvDkLbfIH12uzZGW8xSAxwoqCQF1ebEKbBy8j9U16xJ
	0e/g3jYxLZfS/TsiOurvPWuOiQRVvyozzhnWK7XbYvhCm3WSyX+/egE8OLtXyvISRjIZAN
	4rx5YeqSlhQLbLjQqy7x3psfNMHHGjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-3YSnOk6IM1WNUd6o69bMmw-1; Thu, 27 Feb 2020 20:02:38 -0500
X-MC-Unique: 3YSnOk6IM1WNUd6o69bMmw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98EDA8017CC;
	Fri, 28 Feb 2020 01:02:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20F01388;
	Fri, 28 Feb 2020 01:02:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B7491809567;
	Fri, 28 Feb 2020 01:02:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01S12N4K012829 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 27 Feb 2020 20:02:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 18EA210545F1; Fri, 28 Feb 2020 01:02:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14BB410545EF
	for <linux-audit@redhat.com>; Fri, 28 Feb 2020 01:02:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80D1C101A55F
	for <linux-audit@redhat.com>; Fri, 28 Feb 2020 01:02:20 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-475-LnHIuyjaOIOWSIEQZlrR0w-1; Thu, 27 Feb 2020 20:02:18 -0500
X-MC-Unique: LnHIuyjaOIOWSIEQZlrR0w-1
Received: by mail-qt1-f193.google.com with SMTP id j23so838380qtr.11
	for <linux-audit@redhat.com>; Thu, 27 Feb 2020 17:02:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zHNdL5vIU3ym+nRkxPHmO4brBZzXl4WpJN55o5fu+5A=;
	b=IavLmD2cvGpVsfF50RTHtg4Uvyb23gIREoVEo9zxWPxb81KUGUtDcd+x3Gt6DGhJkn
	upgcCFF75ZmruXo9Y6RTEmtmF28/XufHR+JBEJQmfJcCA2KLAKvlFEZrZsC7stP5CMyT
	zIfhevuaOTjvo6Klpwfi5IJu1FE5ZVqwHzbS04aspiXirH4frvoTob7AUDTT0oaaQqfW
	Cw/KX9RIhkTTCJb5YZh8mNIRsl5PrLNNjfGGFs7dZYGICqYst4MpKPviXxfnULUZfbRL
	gVnANdURPgktrSOMkCvAcUcYyLAjacyXQxuwofKw3LIhWQbRFPSTrKKQrxnv7dl8yJz5
	xPQA==
X-Gm-Message-State: APjAAAVNZE/QKd/6aV3svbTdcloP8p9fMWDZVogJ7s8W+8lrOpeoGm0S
	JX51/JuBUz1hhQTp/dx17ZEbK0MT8xRq4T8Ck/RQ
X-Google-Smtp-Source: APXvYqxqi824RiA93aCv8xP7hTuVGPyd53weG4l6SiW8n7aYoR3akEiTKuu+zA84Hf+sdPgmrEnD3/GB9eV0q4e5sdQ=
X-Received: by 2002:aed:3ecd:: with SMTP id o13mr1987479qtf.309.1582851737381; 
	Thu, 27 Feb 2020 17:02:17 -0800 (PST)
MIME-Version: 1.0
References: <e75e80e820f215d2311941e083580827f6c1dbb6.1582059594.git.rgb@redhat.com>
In-Reply-To: <e75e80e820f215d2311941e083580827f6c1dbb6.1582059594.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 27 Feb 2020 20:02:06 -0500
Message-ID: <CAHC9VhTXFg_w8xJChPZZFY=HMpF722p-_NYy=06xjSkLFSCzbg@mail.gmail.com>
Subject: Re: [PATCH ghak120] audit: trigger accompanying records when no rules
	present
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01S12N4K012829
X-loop: linux-audit@redhat.com
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, Eric Paris <eparis@parisplace.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 18, 2020 at 4:01 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> When there are no audit rules registered, mandatory records (config,
> etc.) are missing their accompanying records (syscall, proctitle, etc.).
>
> This is due to audit context dummy set on syscall entry based on absence
> of rules that signals that no other records are to be printed.
>
> Clear the dummy bit in auditsc_set_stamp() when the first record of an
> event is generated.
>
> Please see upstream github issue
> https://github.com/linux-audit/audit-kernel/issues/120
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  kernel/auditsc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 4effe01ebbe2..31195d122344 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -2176,6 +2176,8 @@ int auditsc_get_stamp(struct audit_context *ctx,
>         t->tv_sec  = ctx->ctime.tv_sec;
>         t->tv_nsec = ctx->ctime.tv_nsec;
>         *serial    = ctx->serial;
> +       if (ctx->dummy)
> +               ctx->dummy = 0;

Two comments:

* Why even bother checking to see if ctx->dummy is true?  If it is
true you set it to false/0; if it is already false you leave it alone.
Either way ctx->dummy is going to be set to false when you are past
these two lines, might as well just always set ctx->dummy to false/0.

* Why are you setting ->dummy to false in auditsc_get_stamp() and not
someplace a bit more obvious like audit_log_start()?  Is it because
auditsc_get_stamp() only gets called once per event?  I'm willing to
take the "hit" of one extra assignment in audit_log_start() to keep
this in a more obvious place and not buried in auditsc_get_stamp().

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

