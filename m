Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B76EE1F5F9F
	for <lists+linux-audit@lfdr.de>; Thu, 11 Jun 2020 03:46:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591839994;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5mgpjPaddUHuQiQ5uWqkmjO5VUsJhrwfO6RrRvfcy6k=;
	b=eU9/KEKUh8c2ThMZfoenjxwxQ5BXte06nAlZ32rHTw+Ks53ZvRl37gIohHvBAbFS3fK64q
	77/k4U7CR0vwBj5poALUGWLRiy06pDmGcxo3Fiy22tki47wYwbwgc2rb0oBxOAopcWHw1Q
	5LeS7V3rrV7+UWgWLsCMNnD9Oi2ylwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203--8TdpvJ-MsSv7x-E0iKBlQ-1; Wed, 10 Jun 2020 21:46:32 -0400
X-MC-Unique: -8TdpvJ-MsSv7x-E0iKBlQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F71D8014D9;
	Thu, 11 Jun 2020 01:46:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D23025D9D3;
	Thu, 11 Jun 2020 01:46:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 02FF51809547;
	Thu, 11 Jun 2020 01:46:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05B1k8F6006319 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 10 Jun 2020 21:46:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D900A2026D5D; Thu, 11 Jun 2020 01:46:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4913202696C
	for <linux-audit@redhat.com>; Thu, 11 Jun 2020 01:46:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68C3E1019CA9
	for <linux-audit@redhat.com>; Thu, 11 Jun 2020 01:46:06 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-285-XaAArX0EP7mbfv8hXua8Hg-1; Wed, 10 Jun 2020 21:46:03 -0400
X-MC-Unique: XaAArX0EP7mbfv8hXua8Hg-1
Received: by mail-ej1-f68.google.com with SMTP id l27so4784848ejc.1
	for <linux-audit@redhat.com>; Wed, 10 Jun 2020 18:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yEHCpF8ZKQcSmRp+P4kQatevjs0uu/nGZLZrcoIwtHQ=;
	b=q9GOSG2OWLD0mnair/6ZZPNIFbceNBsRZpJ2LQrOqtekMzAFWgG7OAunSbAWHOBg31
	J2z+ASxP+396XGDIMRv2cX5Pttqqe92nNiMdxxEjZYh//SF/HG+E0sNvjUDcjmLllL1s
	2UhkMt26GctSWjZVbuqW2TmNWi1tJgG9I4krjXIKeB7H7fcCR4Wa9hPB6nJlBYrBLGup
	zgCYTTuEfn09kkhfqvq+eHH88iRg/c5P35m1fbXkfHcQb2SQ/qtrRFVOvuypRxKq4FDt
	tAhBqGsS6XWKhIy30bpWG5vr+GhPB/gDcEZlIpuDWXoYM31Vfg/Zp2bwrzvKwpJiXYl4
	INQg==
X-Gm-Message-State: AOAM533fclx1DDEjRozWRXC1yO8eMu9yABpzPl6oLKZu163JHR9c/Vs3
	GDFAJNtxYalpWYdAg9YH7kVJ5blxc7iqykIyLKL6
X-Google-Smtp-Source: ABdhPJycVLpo0VWLE6JHhJuZOgmlhZARe6uwX9dyxxNulxXzwt/RSBw8W5r9ZVz4dWJkx6MaaESuYp9LOSP8ywyUBuM=
X-Received: by 2002:a17:906:ecef:: with SMTP id
	qt15mr5919376ejb.91.1591839962038; 
	Wed, 10 Jun 2020 18:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200611000400.3771-1-nramas@linux.microsoft.com>
In-Reply-To: <20200611000400.3771-1-nramas@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 10 Jun 2020 21:45:50 -0400
Message-ID: <CAHC9VhTZb_evUcdygs6MHP73Bi_r3esxV6+Ko6VDpncfmLYEZw@mail.gmail.com>
Subject: Re: [PATCH 1/2] integrity: Add errno field in audit message
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: rgb@redhat.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com,
	linux-audit@redhat.com, linux-integrity@vger.kernel.org
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

On Wed, Jun 10, 2020 at 8:04 PM Lakshmi Ramasubramanian
<nramas@linux.microsoft.com> wrote:
>
> Error code is not included in the audit messages logged by
> the integrity subsystem. Add a new field namely "errno" in
> the audit message and set the value to the error code passed
> to integrity_audit_msg() in the "result" parameter.
>
> Sample audit message:
>
> [    6.284329] audit: type=1804 audit(1591756723.627:2): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel op=add_boot_aggregate cause=alloc_entry errno=-12 comm="swapper/0" name="boot_aggregate" res=0
>
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Suggested-by: Steve Grubb <sgrubb@redhat.com>
> ---
>  security/integrity/integrity_audit.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/security/integrity/integrity_audit.c b/security/integrity/integrity_audit.c
> index 5109173839cc..8cbf415bb977 100644
> --- a/security/integrity/integrity_audit.c
> +++ b/security/integrity/integrity_audit.c
> @@ -42,7 +42,8 @@ void integrity_audit_msg(int audit_msgno, struct inode *inode,
>                          from_kuid(&init_user_ns, audit_get_loginuid(current)),
>                          audit_get_sessionid(current));
>         audit_log_task_context(ab);
> -       audit_log_format(ab, " op=%s cause=%s comm=", op, cause);
> +       audit_log_format(ab, " op=%s cause=%s errno=%d comm=",
> +                        op, cause, result);

Hi Lakshmi,

I'm sorry I didn't get a chance to mention this before you posted this
patch, but for the past several years we have been sticking with a
policy of only adding new fields to the end of existing records;
please adjust this patch accordingly.  Otherwise, this looks fine to
me.

>         audit_log_untrustedstring(ab, get_task_comm(name, current));
>         if (fname) {
>                 audit_log_format(ab, " name=");
> --
> 2.27.0

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

