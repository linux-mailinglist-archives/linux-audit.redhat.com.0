Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D673B74060
	for <lists+linux-audit@lfdr.de>; Wed, 24 Jul 2019 22:46:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD0E73086262;
	Wed, 24 Jul 2019 20:46:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6B3F601B7;
	Wed, 24 Jul 2019 20:46:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 150901800206;
	Wed, 24 Jul 2019 20:46:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6OKk9WY031958 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 24 Jul 2019 16:46:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7B1045C22F; Wed, 24 Jul 2019 20:46:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7600E5C22D
	for <linux-audit@redhat.com>; Wed, 24 Jul 2019 20:46:07 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CA5251026
	for <linux-audit@redhat.com>; Wed, 24 Jul 2019 20:46:05 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id p17so45824309ljg.1
	for <linux-audit@redhat.com>; Wed, 24 Jul 2019 13:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jchNrpEFta2pR8g8F+xkNJeAvSbMUE7xllhKBLOSK2c=;
	b=MT7C+GiDQsqfC6X4YF7XxqEjuHYQy6MkJXzY4VC0qhnNA7PObwYrofbT0r598vkaqm
	tZd01yPjirtGKecjfAo34GEk7/kG/ltr2AkDz4xEN22dwQQmQ4xTWp+vmZg+uRHb7ACL
	37l+PyATPULqjEz3PWn7dodMVvq3EtqfVP0OHwtsKRWIYMB95cxIP3yBLfwwy5zSPiPa
	H5fQ0tFczUX9E2hmwBqB5Jwios+1t4mTttpb0hKRTQfCEoQXL+PiHvOhsXknjLaMK4Vc
	msC92JHlEnCp9cWJnB2PcX/Afmg3RThj36Nl5GOUvXTPeKvth4kwjALe4x/d6e21L9f6
	Aq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jchNrpEFta2pR8g8F+xkNJeAvSbMUE7xllhKBLOSK2c=;
	b=fJw8VPGo/hLZPVyefRw14UZa/A8FtgaQoUUFiip1iK2jBDtWQcjWJZzhjw9Nfs6jvu
	TNiUCv08+qnxB9Th806c0F9VadAqR0XBlz4ARIf61pxAAisFiDTbwe3RMqMdkuYSfwqr
	F778lLgHxa682vS+N18VUG7+PozTSlmcxqh0BzajQMJueMiYfDiq1k76FEO0hmye1uVq
	icLNDGZ2JSStfLUIJp1EO7uQc+QKePcguPOOheOrYXRJW4ln0kXtR8Mew5ZJiO6RCg06
	h6rxFKR+hmz+MLy/NAA8Pan/sinVoRLOJw7rZRUJJOoBOIQ/lo19iumX3vKaPG0W0gyu
	mEUg==
X-Gm-Message-State: APjAAAXoKcrLtnKtuGlrME4BHGMNHzMg4tK9gAH3h9u5q83+1zpt3haU
	UBNGt6Ssoyrf4y8ij1nFngy66geXXeBT4cNlbmC/
X-Google-Smtp-Source: APXvYqws44gRqgHRNLZfmXyFQsmnH97j7fLY7u2xaxMTGUblpGERsrTI10OKVZzx4H5OjfRs/HLBGzdeE07/cNF9yXE=
X-Received: by 2002:a2e:9dc1:: with SMTP id x1mr44291493ljj.0.1564001163840;
	Wed, 24 Jul 2019 13:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190723124951.25713-1-baijiaju1990@gmail.com>
In-Reply-To: <20190723124951.25713-1-baijiaju1990@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 24 Jul 2019 16:45:52 -0400
Message-ID: <CAHC9VhQJwif4NXVydmQkTUXgM8Xnp5rG_zscXmKc5_CSYo-e5w@mail.gmail.com>
Subject: Re: [PATCH] kernel: auditfilter: Fix a possible null-pointer
	dereference in audit_watch_path()
To: Jia-Ju Bai <baijiaju1990@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 24 Jul 2019 20:46:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Wed, 24 Jul 2019 20:46:05 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com'
	HELO:'mail-lj1-f193.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Wed, 24 Jul 2019 20:46:29 +0000 (UTC)

On Tue, Jul 23, 2019 at 8:50 AM Jia-Ju Bai <baijiaju1990@gmail.com> wrote:
> In audit_find_rule(), there is an if statement on line 894 to check
> whether entry->rule.watch is NULL:
>     else if (entry->rule.watch)
>
> If entry->rule.watch is NULL, audit_compare_rule on 910 is called:
>     audit_compare_rule(&entry->rule, &e->rule))
>
> In audit_compare_rule(), a->watch is used on line 720:
>     if (strcmp(audit_watch_path(a->watch), ...)
>
> In this case, a->watch is NULL, and audit_watch_path() will use:
>     watch->path
>
> Thus, a possible null-pointer dereference may occur in this case.
>
> To fix this possible bug, an if statement is added in
> audit_compare_rule() to check a->watch before using a->watch.
>
> This bug is found by a static analysis tool STCheck written by us.
>
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> ---
>  kernel/auditfilter.c | 2 ++
>  1 file changed, 2 insertions(+)

Thank you for taking the time to analyze the kernel's audit subsystem
and send a report, but I believe this is a false positive.

The only way we can hit the AUDIT_WATCH comparison in
audit_compare_rules is if both rules are AUDIT_WATCH rules, and when
we create the audit_krule entries we ensure that the watch field is
correctly populated for AUDIT_WATCH rules, see the
audit_data_to_entry() and audit_to_watch() functions.

If you disagree with this, please let us know, but as of right now I
don't believe there is a problem here.

> diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
> index b0126e9c0743..b0ad17b14609 100644
> --- a/kernel/auditfilter.c
> +++ b/kernel/auditfilter.c
> @@ -717,6 +717,8 @@ static int audit_compare_rule(struct audit_krule *a, struct audit_krule *b)
>                                 return 1;
>                         break;
>                 case AUDIT_WATCH:
> +                       if (!a->watch)
> +                               break;
>                         if (strcmp(audit_watch_path(a->watch),
>                                    audit_watch_path(b->watch)))
>                                 return 1;
> --
> 2.17.0

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
