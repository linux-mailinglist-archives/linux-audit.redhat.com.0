Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B932E802
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 00:17:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 308273079B60;
	Wed, 29 May 2019 22:17:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBAA7611D6;
	Wed, 29 May 2019 22:17:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A072554D3D;
	Wed, 29 May 2019 22:17:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TMGELg006577 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 18:16:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7D3F51822A; Wed, 29 May 2019 22:16:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 786B95C5DF
	for <linux-audit@redhat.com>; Wed, 29 May 2019 22:16:12 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD97C308A968
	for <linux-audit@redhat.com>; Wed, 29 May 2019 22:15:48 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id r76so4058888lja.12
	for <linux-audit@redhat.com>; Wed, 29 May 2019 15:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6zFd/+GKbjIaLT3OCgZNCCS2BROhgWZzYWnXfsPDAOI=;
	b=WAja/FZQE2pFEgnKhl94IfcY8BDGBWqmDZ/K0LwYCwgZZCNgvoTkUHQRuwP3YNgoya
	z1f4MJuRSEu/GyirKTd7ZxEucg9gwE45Fe167cp9Gbt6SxK1m/9DrrJu7NRrAZY32bla
	4p+eAFjbcp/9ChooQBY5FdmhiTSlOm5fiQ0RSbq2XomUdeG6vZOenF9TaeHTaq3oDL83
	qHIT7T9Tcnfjs24oWWuvmRTPwH/ItgW4sLZxfljRcoBxDQ9Bb5BU8OKhEHtCsIEsk1yT
	MLqbkKb1a/gLfm9HlkJSnjDqX1VSLIKoT+vVxZCZOOatOa32W60AfV4fnv3pVeojRmLW
	1+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6zFd/+GKbjIaLT3OCgZNCCS2BROhgWZzYWnXfsPDAOI=;
	b=I1SjiwqYS473256WXo4doWaZyn3TA3TQSI5j7e9mt+qOKMLkC/0VfhwOeW5H8a8TS1
	CaP/RnynShVyT86gOcnnFt7L0UCE2wPv+eyrKsRvrUhf24/jEbvZRJAgrClCw/VKCFyf
	VhWsR6SKBpW1/1NY3ZteY8aCJaF9IzEA3vudZvo0otOR7+w5QcBUF+zKNgq7KtLieDqM
	7NFAHYjxyvOqf4z/TcdsV0N7B6UKnlsrGXDaiP17jfbQl8Lwn6PFK9ZSaRwOGAemS3q5
	aL+iI/Z8vlkzQgc9r1sCsWFN8HmjDfj5mPnUaOVnys6RyFapDOZ5XtF/HfHV7Qj1P2eg
	fipg==
X-Gm-Message-State: APjAAAX6tpbsMNpx42VzwguEuK6dFm0BJS/B2RmxoBEA/KizmUflRQxB
	HQeLnkbKK7CdfXQFpBYiI845N6VS2IFweoOsDwTEcIs=
X-Google-Smtp-Source: APXvYqxr7bNBNEWEvitp9VD5magGhpRxnhpJ7GgxKw0cRkL8xChwhJX2izxpfcFyAxd9QA/po4PJvxe1rJlY+6u8D5I=
X-Received: by 2002:a2e:92cc:: with SMTP id k12mr132567ljh.16.1559168142045;
	Wed, 29 May 2019 15:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<f4a49f7c949e5df80c339a3fe5c4c2303b12bf23.1554732921.git.rgb@redhat.com>
In-Reply-To: <f4a49f7c949e5df80c339a3fe5c4c2303b12bf23.1554732921.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 May 2019 18:15:30 -0400
Message-ID: <CAHC9VhRfQp-avV2rcEOvLCAXEz-MDZMp91UxU+BtvPkvWny9fQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 04/10] audit: log container info of syscalls
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Wed, 29 May 2019 22:15:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Wed, 29 May 2019 22:15:49 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com'
	HELO:'mail-lj1-f193.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.315  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x4TMGELg006577
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Wed, 29 May 2019 22:17:41 +0000 (UTC)

On Mon, Apr 8, 2019 at 11:40 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Create a new audit record AUDIT_CONTAINER_ID to document the audit
> container identifier of a process if it is present.
>
> Called from audit_log_exit(), syscalls are covered.
>
> A sample raw event:
> type=SYSCALL msg=audit(1519924845.499:257): arch=c000003e syscall=257 success=yes exit=3 a0=ffffff9c a1=56374e1cef30 a2=241 a3=1b6 items=2 ppid=606 pid=635 auid=0 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=3 comm="bash" exe="/usr/bin/bash" subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key="tmpcontainerid"
> type=CWD msg=audit(1519924845.499:257): cwd="/root"
> type=PATH msg=audit(1519924845.499:257): item=0 name="/tmp/" inode=13863 dev=00:27 mode=041777 ouid=0 ogid=0 rdev=00:00 obj=system_u:object_r:tmp_t:s0 nametype= PARENT cap_fp=0 cap_fi=0 cap_fe=0 cap_fver=0
> type=PATH msg=audit(1519924845.499:257): item=1 name="/tmp/tmpcontainerid" inode=17729 dev=00:27 mode=0100644 ouid=0 ogid=0 rdev=00:00 obj=unconfined_u:object_r:user_tmp_t:s0 nametype=CREATE cap_fp=0 cap_fi=0 cap_fe=0 cap_fver=0
> type=PROCTITLE msg=audit(1519924845.499:257): proctitle=62617368002D6300736C65657020313B206563686F2074657374203E202F746D702F746D70636F6E7461696E65726964
> type=CONTAINER_ID msg=audit(1519924845.499:257): contid=123458
>
> Please see the github audit kernel issue for the main feature:
>   https://github.com/linux-audit/audit-kernel/issues/90
> Please see the github audit userspace issue for supporting additions:
>   https://github.com/linux-audit/audit-userspace/issues/51
> Please see the github audit testsuiite issue for the test case:
>   https://github.com/linux-audit/audit-testsuite/issues/64
> Please see the github audit wiki for the feature overview:
>   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> Acked-by: Serge Hallyn <serge@hallyn.com>
> Acked-by: Steve Grubb <sgrubb@redhat.com>
> Acked-by: Neil Horman <nhorman@tuxdriver.com>
> Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>  include/linux/audit.h      |  5 +++++
>  include/uapi/linux/audit.h |  1 +
>  kernel/audit.c             | 20 ++++++++++++++++++++
>  kernel/auditsc.c           | 20 ++++++++++++++------
>  4 files changed, 40 insertions(+), 6 deletions(-)

...

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 182b0f2c183d..3e0af53f3c4d 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -2127,6 +2127,26 @@ void audit_log_session_info(struct audit_buffer *ab)
>         audit_log_format(ab, "auid=%u ses=%u", auid, sessionid);
>  }
>
> +/*
> + * audit_log_contid - report container info
> + * @context: task or local context for record
> + * @contid: container ID to report
> + */
> +void audit_log_contid(struct audit_context *context, u64 contid)
> +{
> +       struct audit_buffer *ab;
> +
> +       if (!audit_contid_valid(contid))
> +               return;
> +       /* Generate AUDIT_CONTAINER_ID record with container ID */
> +       ab = audit_log_start(context, GFP_KERNEL, AUDIT_CONTAINER_ID);
> +       if (!ab)
> +               return;
> +       audit_log_format(ab, "contid=%llu", (unsigned long long)contid);

We have a consistency problem regarding how to output the u64 contid
values; this function uses an explicit cast, others do not.  According
to Documentation/core-api/printk-formats.rst the recommendation for
u64 is %llu (or %llx, if you want hex).  Looking quickly through the
printk code this appears to still be correct.  I suggest we get rid of
the cast (like it was in v5).

> +       audit_log_end(ab);
> +}
> +EXPORT_SYMBOL(audit_log_contid);

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
