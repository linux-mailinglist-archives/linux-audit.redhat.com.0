Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8264F181E8
	for <lists+linux-audit@lfdr.de>; Thu,  9 May 2019 00:06:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A3B8307D935;
	Wed,  8 May 2019 22:06:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EF2D600CC;
	Wed,  8 May 2019 22:06:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E5C0941F58;
	Wed,  8 May 2019 22:06:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x48M5r6m017223 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 8 May 2019 18:05:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BC79F60C6F; Wed,  8 May 2019 22:05:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7EE460C93
	for <linux-audit@redhat.com>; Wed,  8 May 2019 22:05:50 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 975353092664
	for <linux-audit@redhat.com>; Wed,  8 May 2019 22:05:49 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id w23so37270lfc.9
	for <linux-audit@redhat.com>; Wed, 08 May 2019 15:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LXSTz0fpnKHEOGIV6C4Gh2Xp3nE6MDp/0Fs1OXRkmbs=;
	b=pIsc7Z0N8jTJqfC+uYYKkiRYgDPB/wz3vMeBCB+V/YQLZzCq9EGpjkoCjTcFD2p2S7
	Eb3W+qabzs7DqoV1yygKx5ABha9x8fM2UY58Tibj7pj/5qRKUwydiKjOhtPS4MNlbVa2
	YTjc82MEWMlYy2vQFAzOy7ISVFFAao/ogZDIbglCvMLSL2UDwInk6uppBDpCDRdplN6q
	onxDQtGqV3GuiyJqr14K2KL/E/VknTN6vVnce+bb1GCjhmj3azd3dq/MbMY5vgDzrY1g
	/S6fXm1yDs850NtDKXTAKBqGdUNyCvI6JOvyl31FD3B4wFWqaAJAu2nEb9DyHXPERtcw
	+jCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LXSTz0fpnKHEOGIV6C4Gh2Xp3nE6MDp/0Fs1OXRkmbs=;
	b=ZBCS7Xie3pAlIC0D/rlvWSBkxlG8BcwjityZxPSrxR9NJjQRCLSgQjPrz7CeUHTP2y
	4JLjhAziH1wb12vSvdn9OZ9ff+DmtBI6aLl1D/LQW+JFH0vDlhSdevb7tRp3rOSkXeJ0
	yGWe5NKoYSn1lm6TCPpdSJ3kiXh1JgHnEYDGdLSkEenzpWeZYAZga06eOrp3pU8K0ggK
	hQ3+miPZXQhUr+JWKKUlmzfF5DMFsmvIJLBA5d1Zm6Xx+YynSkCCB7YXCPdPTpnITgJt
	7Oa1MDT+wXRDbsqvopN86tybKjddpFm2EA86wHCCiU9DsCMiFsxGV395SzxZSC2VtM61
	9jSg==
X-Gm-Message-State: APjAAAUkhKyzSvx/z83cJaMHE7vMx0cO3Mhu2nht6Bn2hhzvWeshZi88
	7/4hq2XCPSan4O/fcMRePO90K9B1EEbruqRSzJb5
X-Google-Smtp-Source: APXvYqyVX535AJSW7/Kyot7+HGAluW1+wMmGbIM5JdcIFtkE+etonXkK3+x6m6vGaNPFuYRF8/1TkezvXxLhtwZIN3w=
X-Received: by 2002:a19:f50f:: with SMTP id j15mr253413lfb.135.1557353147857; 
	Wed, 08 May 2019 15:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <bf0d3fc2728cc4ec29aa684d08efdf6d71d185c4.1557330804.git.rgb@redhat.com>
In-Reply-To: <bf0d3fc2728cc4ec29aa684d08efdf6d71d185c4.1557330804.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 8 May 2019 18:05:36 -0400
Message-ID: <CAHC9VhQTVO4nPxY-R4aOghBhJe3jPBQTgfgBk8PfPSnp-wrsqw@mail.gmail.com>
Subject: Re: [PATCH ghak64 V2] audit: add saddr_fam filter field
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 08 May 2019 22:05:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Wed, 08 May 2019 22:05:49 +0000 (UTC) for IP:'209.85.167.66'
	DOMAIN:'mail-lf1-f66.google.com' HELO:'mail-lf1-f66.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.011  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2) 209.85.167.66 mail-lf1-f66.google.com
	209.85.167.66 mail-lf1-f66.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>,
	Eric Paris <eparis@parisplace.org>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 08 May 2019 22:06:11 +0000 (UTC)

On Wed, May 8, 2019 at 12:46 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Provide a method to filter out sockaddr and bind calls by network
> address family.
>
> Existing SOCKADDR records are listed for any network activity.
> Implement the AUDIT_SADDR_FAM field selector to be able to classify or
> limit records to specific network address families, such as AF_INET or
> AF_INET6.
>
> An example of a network record that is unlikely to be useful and flood
> the logs:
>
> type=SOCKADDR msg=audit(07/27/2017 12:18:27.019:845) : saddr={ fam=local
> path=/var/run/nscd/socket }
> type=SYSCALL msg=audit(07/27/2017 12:18:27.019:845) : arch=x86_64
> syscall=connect success=no exit=ENOENT(No such file or directory) a0=0x3
> a1=0x7fff229c4980 a2=0x6e a3=0x6 items=1 ppid=3301 pid=6145 auid=sgrubb
> uid=sgrubb gid=sgrubb euid=sgrubb suid=sgrubb fsuid=sgrubb egid=sgrubb
> sgid=sgrubb fsgid=sgrubb tty=pts3 ses=4 comm=bash exe=/usr/bin/bash
> subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> key=network-test
>
> Please see the audit-testsuite PR at
> https://github.com/linux-audit/audit-testsuite/pull/87
> Please see the github issue
> https://github.com/linux-audit/audit-kernel/issues/64
> Please see the github issue for the accompanying userspace support
> https://github.com/linux-audit/audit-userspace/issues/93
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
> Changelog:
> v2:
> - rebase on ghak73 v2
> - check for valid range of saddr_fam value
>
>  include/uapi/linux/audit.h | 1 +
>  kernel/auditfilter.c       | 5 +++++
>  kernel/auditsc.c           | 5 +++++
>  3 files changed, 11 insertions(+)
>
> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> index a1280af20336..c89c6495983d 100644
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@ -281,6 +281,7 @@
>  #define AUDIT_OBJ_GID  110
>  #define AUDIT_FIELD_COMPARE    111
>  #define AUDIT_EXE      112
> +#define AUDIT_SADDR_FAM        113
>
>  #define AUDIT_ARG0      200
>  #define AUDIT_ARG1      (AUDIT_ARG0+1)
> diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
> index 5beb2244d5ba..4c897281beb8 100644
> --- a/kernel/auditfilter.c
> +++ b/kernel/auditfilter.c
> @@ -387,6 +387,7 @@ static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
>         case AUDIT_SUCCESS:
>         case AUDIT_INODE:
>         case AUDIT_SESSIONID:
> +       case AUDIT_SADDR_FAM:
>                 /* bit ops are only useful on syscall args */
>                 if (f->op == Audit_bitmask || f->op == Audit_bittest)
>                         return -EINVAL;
> @@ -438,6 +439,10 @@ static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
>                 if (f->val > AUDIT_MAX_FIELD_COMPARE)
>                         return -EINVAL;
>                 break;
> +       case AUDIT_SADDR_FAM:
> +               if (f->val <= AF_UNSPEC || f->val >= AF_MAX)

AF_UNSPEC is a valid address family for some operations, and while I'm
not sure what value there is in an auditing these events, we should
allow it.  It's also worth noting that f->val is an unsigned value so
we are never going to see a value less than AF_UNSPEC/0.  This is why
on your earlier patch I only talked about AF_MAX and not AF_UNSPEC.

> +                       return -EINVAL;
> +               break;
>         default:
>                 break;
>         }
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 4bd0ec60a0e8..aab364804b9b 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -623,6 +623,11 @@ static int audit_filter_rules(struct task_struct *tsk,
>                 case AUDIT_LOGINUID_SET:
>                         result = audit_comparator(audit_loginuid_set(tsk), f->op, f->val);
>                         break;
> +               case AUDIT_SADDR_FAM:
> +                       if (ctx->sockaddr)
> +                               result = audit_comparator(ctx->sockaddr->ss_family,
> +                                                         f->op, f->val);
> +                       break;
>                 case AUDIT_SUBJ_USER:
>                 case AUDIT_SUBJ_ROLE:
>                 case AUDIT_SUBJ_TYPE:
> --
> 1.8.3.1
>

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
