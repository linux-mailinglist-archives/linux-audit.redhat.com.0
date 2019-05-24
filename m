Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC9928E85
	for <lists+linux-audit@lfdr.de>; Fri, 24 May 2019 03:15:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CAC56309264D;
	Fri, 24 May 2019 01:15:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77D1267C8F;
	Fri, 24 May 2019 01:15:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D7221806B13;
	Fri, 24 May 2019 01:15:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4O1DJQC019545 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 21:13:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 37BB519724; Fri, 24 May 2019 01:13:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32A4519C4F
	for <linux-audit@redhat.com>; Fri, 24 May 2019 01:13:17 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 559C8368A5
	for <linux-audit@redhat.com>; Fri, 24 May 2019 01:13:14 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id h19so1689144ljj.4
	for <linux-audit@redhat.com>; Thu, 23 May 2019 18:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=y5q1fgaekb9IUclbfSZU19hVqMX9nWjb2QoSRvsBh1w=;
	b=Barotc24qbKKKRuhyPyiWA9c4LWtSPqpozL+XEGKdrWtkWuXE/Q+wSaCCbg+uJ8FRz
	RRmF4bG6qC4R3O+NvqLDMAcr4EI9HTD8NxMO+UF2cFnpYAHdWkCoGKEcCtObFdYhFjWX
	qUYnOtH7mrzjNqlHztZPbTpfj9F/6gIb7kRBo4zgD0vP3NTPpH7wQKA7qDDz+GfB5waw
	TOWG5LO2NTFWJDNViIQqO6cB02tPaiL242PAjAG2e1YKeouIyFffEeDPs1klHB4zRE5K
	Ara7yggX/kIag067LvdcDO1HK/V2xYQcmgCBUSzEiTcXfQr2e4Y2iU85Iqcpz5hZkFKZ
	luMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=y5q1fgaekb9IUclbfSZU19hVqMX9nWjb2QoSRvsBh1w=;
	b=WOMVTyRJrFUTOxk95iW4nrpACasnAeR0QXo90wIsqn3X5qZ35bw8A5IlDUeDpQo1Ss
	kagn9oEDzZtbdBLk7doIFrulVlvT6XjRjFB6ksp7isnDYvHgNdM5NqY+Fc8T1CUwoFdl
	SB5qnc7POrLYgpDEyEuG2z83CjbHtIuzrJGtSKPr+uwlCrJNwJNP07DzZ7hf8tyc6nTh
	BF7bBIg5TgNE8jwh/ZVWsLkH7POtdAEM7WK0j8kA130fremrpPcWc1CYpkyGmB13pPEx
	CfnubK2iORBU+bjELbHraAecnhK3bvqDzOQvAITv9psqtIgH0KMPukQPcHHEotegkyEJ
	W3jQ==
X-Gm-Message-State: APjAAAUflUx2CTKkxXHYrTQi0sR5/2Yq/4WqYyI96l5SBLSxMSp8rM47
	PMhFHD6DcNSKzdbY8cEqggIrYM8l8NhBrF+ASa/J
X-Google-Smtp-Source: APXvYqyMSdsnUF9BVHI9S7XjT7wSA4uQ4sAxphOsSdoG7sg1735XG1E+4FMRO2MgQLGEVRtytMAUAc8NonMOLrMkmtw=
X-Received: by 2002:a2e:9747:: with SMTP id f7mr9545933ljj.34.1558660392644;
	Thu, 23 May 2019 18:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <875429973aa2d4d5d54de195b2233f70fed8553c.1557409253.git.rgb@redhat.com>
In-Reply-To: <875429973aa2d4d5d54de195b2233f70fed8553c.1557409253.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 23 May 2019 21:13:01 -0400
Message-ID: <CAHC9VhSntkMnKscpG95KZ0HvVU9hUR8g0db43N8SF4MpbcH4KQ@mail.gmail.com>
Subject: Re: [PATCH ghak64 V3] audit: add saddr_fam filter field
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 24 May 2019 01:13:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Fri, 24 May 2019 01:13:14 +0000 (UTC) for IP:'209.85.208.195'
	DOMAIN:'mail-lj1-f195.google.com'
	HELO:'mail-lj1-f195.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.444  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.195 mail-lj1-f195.google.com 209.85.208.195
	mail-lj1-f195.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Fri, 24 May 2019 01:15:44 +0000 (UTC)

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

Merged into audit/next.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
