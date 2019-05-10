Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1F61A035
	for <lists+linux-audit@lfdr.de>; Fri, 10 May 2019 17:29:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 99FEC9D51C;
	Fri, 10 May 2019 15:29:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CD2A18504;
	Fri, 10 May 2019 15:29:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1AA0041F58;
	Fri, 10 May 2019 15:29:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4AFSPUG023840 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 10 May 2019 11:28:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EABBF4387; Fri, 10 May 2019 15:28:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5945643F2
	for <linux-audit@redhat.com>; Fri, 10 May 2019 15:28:23 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F5C13004158
	for <linux-audit@redhat.com>; Fri, 10 May 2019 15:28:21 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id n134so4426144lfn.11
	for <linux-audit@redhat.com>; Fri, 10 May 2019 08:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=N+yJLpdU2El4oFRGbV8PTQ0vQw/OhQsqHUqq9I8WipU=;
	b=gVKPk7zE4HCqiuTwQmI3LTjVRdJePFsq7buR+uBa1T2dWrig5W+nccJLrsu+2QlHaR
	Ttw58I2Ojx4mz2MqOvx021RkRj6OhOQ80VrFSNje4EgqUW5J+T3u6uuVyrtfMXBS8gLe
	zLJIZsK+u3pSyfAabiKNTWJf/PicStmAwH9OMmcF2mka/GCHPWpNM72hqByfqkGXHLzr
	+va/qnPohGWcj+4UZ69uYvRvbG8Nh45nPk9QXIrQJBo0geAvEAwax748+kxW77lhuXdU
	Yx/fe2+6ZlQMg37B8WLwrhhQqcAzWSlncIbHYAAx6YNRhZUw0xF/jQ6rxLp7APjaNsp2
	gOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N+yJLpdU2El4oFRGbV8PTQ0vQw/OhQsqHUqq9I8WipU=;
	b=PF5toEij0oZbyoQYf386VEGqwBNnyOPCci9sV4QyvuR7ufSSPks71nmLKhNALTS50m
	C898ahLB1DuPPiA7YD2mRUDYAcNj5SC1Ko5u8BNJUCTVsVjxrLotqohr8kAp3TK9ZFuD
	1Nynwg02n1OayYY5T1Ud7niS7t6Km1Q9g932pfFnNN5J/8OAu3hWdbJom3Vc6xT8kaQV
	RRpeywkJvlfwuzvpqt1W1y6g5avjkZ6tLWnAHlsak7pQdsR62ZaZx3H/URKbqi60Q30Q
	hf4bkQd70CNV6m8aMGcHFtPDjG0IX3yHIlYM10UhdkLgZWkm5+HSWb9H2k1VMGi7lBoU
	yBDg==
X-Gm-Message-State: APjAAAXGLkuRdS7oQm9FN0xilCnofl0sKA3zzPemd7wDuN8feqf19Wh3
	nWrAgxVvOmSZRM+p8kiO75IGq3awvrIerUaGKtV2zxFfNw==
X-Google-Smtp-Source: APXvYqyZkahH1k5iz2WS6G3ccvkqNGdZokEMQaBtW04m6N2mw2PtgfJAEb0fEUasnUkHLDt8AK1mkWCeiQ+xagAl1cM=
X-Received: by 2002:ac2:4157:: with SMTP id c23mr6316298lfi.72.1557502099535; 
	Fri, 10 May 2019 08:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <875429973aa2d4d5d54de195b2233f70fed8553c.1557409253.git.rgb@redhat.com>
In-Reply-To: <875429973aa2d4d5d54de195b2233f70fed8553c.1557409253.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 10 May 2019 11:28:08 -0400
Message-ID: <CAHC9VhTqDjh+CnVZFbtThfp9pyE+4tUOFEKyu0Dwu67-MmL5Rw@mail.gmail.com>
Subject: Re: [PATCH ghak64 V3] audit: add saddr_fam filter field
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 10 May 2019 15:28:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Fri, 10 May 2019 15:28:21 +0000 (UTC) for IP:'209.85.167.65'
	DOMAIN:'mail-lf1-f65.google.com' HELO:'mail-lf1-f65.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.011  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2) 209.85.167.65 mail-lf1-f65.google.com
	209.85.167.65 mail-lf1-f65.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Fri, 10 May 2019 15:29:37 +0000 (UTC)

On Thu, May 9, 2019 at 8:02 PM Richard Guy Briggs <rgb@redhat.com> wrote:
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
> v3:
> - eliminate AF_UNSPEC check
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
> index 5beb2244d5ba..df8a7d6184dc 100644
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
> +               if (f->val >= AF_MAX)
> +                       return -EINVAL;
> +               break;

The f->val check looks better, thank you.  However, I just noticed
that it appears you've added two AUDIT_SADDR_FAM cases to the switch
statement?

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

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
