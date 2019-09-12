Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFFBB0F73
	for <lists+linux-audit@lfdr.de>; Thu, 12 Sep 2019 15:02:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1C04D1DB6;
	Thu, 12 Sep 2019 13:02:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB9E860C57;
	Thu, 12 Sep 2019 13:02:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E1041802217;
	Thu, 12 Sep 2019 13:02:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8CD2BX2010582 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 12 Sep 2019 09:02:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 31AE2608C2; Thu, 12 Sep 2019 13:02:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx28.extmail.prod.ext.phx2.redhat.com
	[10.5.110.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C1A2608A5
	for <linux-audit@redhat.com>; Thu, 12 Sep 2019 13:02:08 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC83786FC91
	for <linux-audit@redhat.com>; Thu, 12 Sep 2019 13:02:03 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id d17so1412357lfa.7
	for <linux-audit@redhat.com>; Thu, 12 Sep 2019 06:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4/QNcccMPwyyukY2+mCv2E2l2SVywG28eaCklDORhLg=;
	b=Siz7m/2buli92P478u2yijLf8f0ePY+0rBETQzWTZpi6bc4PnRTimuLq7KdsZwNTdQ
	VJGLF3tyDjqfiuhu2gBwH+O7Ag1T6WAiueVr8L0VihVxS0hGXz/erzczrVB0LOd0DmtE
	eVA4Rrrp7zr2DEnuvI8+UJ8UjvtCcpsz+srAYA0qItMNlwbJHsfBgXkx3Fx7H22z8tUx
	NlCh/KKcQmDZqqpWFpeSglWbOADE2rbhi1Vbw2lQMXXfzSaAvrH+g7oVjCgt2LBi/GS/
	4+DzXGUcDjgs3pfP4KDvMOzL0SZhq45qTItzLpQyZYgf3cHvMNz48PNLc0MOCu33H5CZ
	tf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4/QNcccMPwyyukY2+mCv2E2l2SVywG28eaCklDORhLg=;
	b=THIRrE6lGgf+OeULO2cIvu1LU1wfvgC2y7Cduhb0YzIrVExqjG9m+HH0heUG2hpEPU
	wTVGB7+C3BC97zrx7C4db9mH+dVh4rZOqqTwUa8z/nOctg5NYdc07VLDOaeOzy7qFFCV
	das+QiIagTdLGrkQp3qutV8xklC4nd3V2CtpgJJgkjHfkZbmfuUsxqgVl0PCSsw+I6zu
	wY3z9CTX44yMFSnmfBxf2wc4P7Z3X6ovT+UgtJy1YVEffq7HsA26ADAr1bKkYJnbt6ED
	UiKB0doMq2+cn4UKJiLUibeg/wtAs5D872cYdgm79y5PBh5e/1oxETBUo98O+LTqrasB
	hExg==
X-Gm-Message-State: APjAAAUomuL7pjt/enlBQPIJ9uu2qwX7vhGRiPy4Q/23qCGfUtU2kg5W
	kvUPamt04oFSBa5QdUdXL1p1byi9wX3+z9+cOe/O0U5CmW3Q
X-Google-Smtp-Source: APXvYqx0lctB8UIguoi4H1YT0O695DIG0a3hVFez3aoLI3oh6neOigz/h/B1yPLRMKNm4Y73/Bxyc/z0FM1YugERjSE=
X-Received: by 2002:ac2:5101:: with SMTP id q1mr27346537lfb.13.1568293322106; 
	Thu, 12 Sep 2019 06:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <1568258385-10643-1-git-send-email-lirongqing@baidu.com>
In-Reply-To: <1568258385-10643-1-git-send-email-lirongqing@baidu.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 12 Sep 2019 09:01:51 -0400
Message-ID: <CAHC9VhRXj2UpdijxpKgMROfNu9tETpXpHdboPqP=HvVF-GuBVQ@mail.gmail.com>
Subject: Re: [PATCH][RFC] audit: set wait time to zero when audit failed
To: Li RongQing <lirongqing@baidu.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.69]);
	Thu, 12 Sep 2019 13:02:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]);
	Thu, 12 Sep 2019 13:02:05 +0000 (UTC) for IP:'209.85.167.65'
	DOMAIN:'mail-lf1-f65.google.com' HELO:'mail-lf1-f65.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.65 mail-lf1-f65.google.com 209.85.167.65
	mail-lf1-f65.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.69
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Thu, 12 Sep 2019 13:02:18 +0000 (UTC)

On Wed, Sep 11, 2019 at 11:19 PM Li RongQing <lirongqing@baidu.com> wrote:
>
> if audit_log_start failed because queue is full, kauditd is waiting
> the receiving queue empty, but no receiver, a task will be forced to
> wait 60 seconds for each audited syscall, and it will be hang for a
> very long time
>
> so at this condition, set the wait time to zero to reduce wait, and
> restore wait time when audit works again
>
> it partially restore the commit 3197542482df ("audit: rework
> audit_log_start()")
>
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> Signed-off-by: Liang ZhiCheng <liangzhicheng@baidu.com>
> ---
> reboot is taking a very long time on my machine(centos 6u4 +kernel 5.3)
> since TIF_SYSCALL_AUDIT is set by default, and when reboot, userspace process
> which receiver audit message , will be killed, and lead to that no user
> drain the audit queue
>
> git bitsect show it is caused by 3197542482df ("audit: rework audit_log_start()")
>
>  kernel/audit.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

This is typically solved by increasing the backlog using the
"audit_backlog_limit" kernel parameter (link to the docs below).  You
might also want to investigate what is generating some many audit
records prior to starting the audit daemon.

* https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html

> diff --git a/kernel/audit.c b/kernel/audit.c
> index da8dc0db5bd3..6de23599fd43 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -119,6 +119,7 @@ static u32  audit_rate_limit;
>   * When set to zero, this means unlimited. */
>  static u32     audit_backlog_limit = 64;
>  #define AUDIT_BACKLOG_WAIT_TIME (60 * HZ)
> +static u32     audit_backlog_wait_time_master = AUDIT_BACKLOG_WAIT_TIME;
>  static u32     audit_backlog_wait_time = AUDIT_BACKLOG_WAIT_TIME;
>
>  /* The identity of the user shutting down the audit system. */
> @@ -435,7 +436,7 @@ static int audit_set_backlog_limit(u32 limit)
>  static int audit_set_backlog_wait_time(u32 timeout)
>  {
>         return audit_do_config_change("audit_backlog_wait_time",
> -                                     &audit_backlog_wait_time, timeout);
> +                                     &audit_backlog_wait_time_master, timeout);
>  }
>
>  static int audit_set_enabled(u32 state)
> @@ -1202,7 +1203,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
>                 s.lost                  = atomic_read(&audit_lost);
>                 s.backlog               = skb_queue_len(&audit_queue);
>                 s.feature_bitmap        = AUDIT_FEATURE_BITMAP_ALL;
> -               s.backlog_wait_time     = audit_backlog_wait_time;
> +               s.backlog_wait_time     = audit_backlog_wait_time_master;
>                 audit_send_reply(skb, seq, AUDIT_GET, 0, 0, &s, sizeof(s));
>                 break;
>         }
> @@ -1785,11 +1786,15 @@ struct audit_buffer *audit_log_start(struct audit_context *ctx, gfp_t gfp_mask,
>                                                 skb_queue_len(&audit_queue),
>                                                 audit_backlog_limit);
>                                 audit_log_lost("backlog limit exceeded");
> +                               audit_backlog_wait_time = 0;
>                                 return NULL;
>                         }
>                 }
>         }
>
> +       if (audit_backlog_wait_time != audit_backlog_wait_time_master)
> +               audit_backlog_wait_time = audit_backlog_wait_time_master;
> +
>         ab = audit_buffer_alloc(ctx, gfp_mask, type);
>         if (!ab) {
>                 audit_log_lost("out of memory in audit_log_start");
> --
> 2.16.2
>


-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
