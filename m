Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3C70A172E18
	for <lists+linux-audit@lfdr.de>; Fri, 28 Feb 2020 02:19:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582852744;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vV6UoClPcw86047A8UvzYdjayipwOPI1cjjIaJfZuWo=;
	b=P5lwKFiEF+LeynqO4hBmhwiu8yjwizr0JNaGeC7HK49ESs8FRgEffMS65xtNJCfxE9WUZL
	+Wc5cG2D+FoB9KlFM3XW6zbSsibxJ5Mw3/nKoQcJ+lMV+ZlQfrX1C5B5wg7teQ+aciXL53
	WQZi4+bC2AbXGnKApGEMZF6PUDTDfPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-qctYQQWjMDuBseUyhM-0Ow-1; Thu, 27 Feb 2020 20:19:01 -0500
X-MC-Unique: qctYQQWjMDuBseUyhM-0Ow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD00B1083E80;
	Fri, 28 Feb 2020 01:18:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD00B909FA;
	Fri, 28 Feb 2020 01:18:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C2A081809567;
	Fri, 28 Feb 2020 01:18:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01S1IfK9013856 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 27 Feb 2020 20:18:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 20C7B2028CD2; Fri, 28 Feb 2020 01:18:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AB602022EA7
	for <linux-audit@redhat.com>; Fri, 28 Feb 2020 01:18:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 100A28007A4
	for <linux-audit@redhat.com>; Fri, 28 Feb 2020 01:18:36 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-381-UBMqJihqPBC07K1g5GJOHA-1; Thu, 27 Feb 2020 20:18:34 -0500
X-MC-Unique: UBMqJihqPBC07K1g5GJOHA-1
Received: by mail-qt1-f196.google.com with SMTP id i14so853059qtv.13
	for <linux-audit@redhat.com>; Thu, 27 Feb 2020 17:18:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=QrpFr+6B3oCxyd0DiabeEBzNw/bSmCxGpvBi8A5aZsM=;
	b=UdVEN0I9AuT7KFH3mGJFqGXUozTblCwoCFW3bxcxYnNrFwsXz+Ca5tcF1idG4FQxB8
	nRqSIigEM1q9gO9BDSOiB+9ZBJgKFlQZG0fc3ouFcSeoi3xXFIMEbR8k+lKBqAFy1h1b
	M4f88Ow6iUgXa+EUAoiNZfVEoLlMFG88W/HFY0Lo+5n7OP5nP0q5zI3RhpbiKewbHy8R
	KC1GOaG2NSQkfM5Fp7/D8xvDaG1V/wpkR1zPLUafSrlLJ4eTi2VQNzFCzX1GHA/Rgf1e
	EAPdIrY8tgohO+m6qZwCrLVz4SZ3BMKzZLgU3x66Xk7Yv47pb6zciDaqngHXXBtP7VhL
	Z/Tg==
X-Gm-Message-State: APjAAAWqNe3D3jeHFfozhc+9k3vjXQacPT4EwxZOnORbqj0kY0xPgn8Y
	XDSGWS1cZgoqjcnv0MBU4Mim/C181ILXBlJxxXax
X-Google-Smtp-Source: APXvYqylfKS11fJiLyTUzfHz0YNa7SNLC9pqv/Pt7PsRUJbDSNR6f+WMoPH51vpB0I2LGMfQlmL2sQ9oAbCq4YfkYcg=
X-Received: by 2002:ac8:777b:: with SMTP id h27mr2105555qtu.251.1582852713396; 
	Thu, 27 Feb 2020 17:18:33 -0800 (PST)
MIME-Version: 1.0
References: <857c76090363b6316a89d292cf9cccd0db54c079.1582058914.git.rgb@redhat.com>
In-Reply-To: <857c76090363b6316a89d292cf9cccd0db54c079.1582058914.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 27 Feb 2020 20:18:22 -0500
Message-ID: <CAHC9VhT_o7P5G0FMWpOq0rwQb_V5E8Xrqk5Pq_DhQgYVBC2+=Q@mail.gmail.com>
Subject: Re: [PATCH ghak28 V6] audit: log audit netlink multicast bind and
	unbind events
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01S1IfK9013856
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 18, 2020 at 3:52 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Log information about programs connecting to and disconnecting from the
> audit netlink multicast socket. This is needed so that during
> investigations a security officer can tell who or what had access to the
> audit trail.  This helps to meet the FAU_SAR.2 requirement for Common
> Criteria.  Here is the systemd startup event:
>
> type=PROCTITLE msg=audit(2020-02-18 15:26:50.775:10) : proctitle=/init
> type=SYSCALL msg=audit(2020-02-18 15:26:50.775:10) : arch=x86_64 syscall=bind success=yes exit=0 a0=0x19 a1=0x55645c369b70 a2=0xc a3=0x7fff9fedec24 items=0 ppid=0 pid=1 auid=unset uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=(none) ses=unset comm=systemd exe=/usr/lib/systemd/systemd subj=kernel key=(null)
> type=UNKNOWN[1335] msg=audit(2020-02-18 15:26:50.775:10) : pid=1 uid=root auid=unset tty=(none) ses=unset subj=kernel comm=systemd exe=/usr/lib/systemd/systemd nl-mcgrp=1 op=connect res=yes
>
> And the events from the test suite:
>
> type=PROCTITLE msg=audit(2020-02-18 15:28:01.594:307) : proctitle=/usr/bin/perl -w amcast_joinpart/test
> type=SOCKADDR msg=audit(2020-02-18 15:28:01.594:307) : saddr={ saddr_fam=netlink nlnk-fam=16 nlnk-pid=0 }
> type=SYSCALL msg=audit(2020-02-18 15:28:01.594:307) : arch=x86_64 syscall=bind success=yes exit=0 a0=0x7 a1=0x558ebc428be0 a2=0xc a3=0x0 items=0 ppid=642 pid=645 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=ttyS0 ses=1 comm=perl exe=/usr/bin/perl subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> type=UNKNOWN[1335] msg=audit(2020-02-18 15:28:01.594:307) : pid=645 uid=root auid=root tty=ttyS0 ses=1 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl exe=/usr/bin/perl nl-mcgrp=1 op=connect res=yes
>
> type=UNKNOWN[1335] msg=audit(2020-01-17 10:36:24.051:295) : pid=674 uid=root auid=root tty=ttyS0 ses=3 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl exe=/usr/bin/perl nl-mcgrp=1 op=disconnect res=yes
>
> Please see the upstream issue tracker:
>   https://github.com/linux-audit/audit-kernel/issues/28
>   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Multicast-Socket-Join-Part
>   https://github.com/rgbriggs/audit-testsuite/compare/ghak28-mcast-part-join
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
>
> ---
> Note: msg type 1334 was skipped due to BPF accepted in another tree.
> Note: v5 due to previous 2014-10-07, 2015-07-23, 2016-11-30, 2017-10-13
> Note: subj attrs included due to missing syscall record for systemd (audit=1)
> Note: tried refactor of subj attrs, but this is yet another new order.
> ---
>  include/uapi/linux/audit.h |  1 +
>  kernel/audit.c             | 48 ++++++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 45 insertions(+), 4 deletions(-)

...

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 17b0d523afb3..478259f3fa53 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -1520,20 +1520,60 @@ static void audit_receive(struct sk_buff  *skb)
>         audit_ctl_unlock();
>  }
>
> +/* Log information about who is connecting to the audit multicast socket */
> +static void audit_log_multicast_bind(int group, const char *op, int err)
> +{

Since this is logging both bind and unbind, let's change the name to
something a bit more generic, e.g. audit_log_multicast().

> +       const struct cred *cred;
> +       struct tty_struct *tty;
> +       char comm[sizeof(current->comm)];
> +       struct audit_buffer *ab;
> +
> +       if (!audit_enabled)
> +               return;
> +
> +       ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_EVENT_LISTENER);
> +       if (!ab)
> +               return;
> +
> +       cred = current_cred();
> +       tty = audit_get_tty();
> +       audit_log_format(ab, "pid=%u uid=%u auid=%u tty=%s ses=%u",
> +                        task_pid_nr(current),
> +                        from_kuid(&init_user_ns, cred->uid),
> +                        from_kuid(&init_user_ns, audit_get_loginuid(current)),
> +                        tty ? tty_name(tty) : "(none)",
> +                        audit_get_sessionid(current));
> +       audit_put_tty(tty);
> +       audit_log_task_context(ab); /* subj= */
> +       audit_log_format(ab, " comm=");
> +       audit_log_untrustedstring(ab, get_task_comm(comm, current));
> +       audit_log_d_path_exe(ab, current->mm); /* exe= */
> +       audit_log_format(ab, " nl-mcgrp=%d op=%s res=%d", group, op, !err);
> +       audit_log_end(ab);
> +}

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

