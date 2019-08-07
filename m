Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5466F84F0A
	for <lists+linux-audit@lfdr.de>; Wed,  7 Aug 2019 16:46:21 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 833B2C08EC13;
	Wed,  7 Aug 2019 14:46:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE1365D772;
	Wed,  7 Aug 2019 14:46:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0522E18005B9;
	Wed,  7 Aug 2019 14:46:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x77Ej48U030490 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 7 Aug 2019 10:45:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BE4A568360; Wed,  7 Aug 2019 14:45:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B80EC67C96
	for <linux-audit@redhat.com>; Wed,  7 Aug 2019 14:45:01 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 369C1309265B
	for <linux-audit@redhat.com>; Wed,  7 Aug 2019 14:44:58 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id h10so14271378ljg.0
	for <linux-audit@redhat.com>; Wed, 07 Aug 2019 07:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Z8dimpQC8vdtCC4De+gwgwsusg66lz067tL/jw2Tpok=;
	b=xI/cB1Q0P+/iU2AggcY+883RIshtQvO7eXYx72NkUvGrgk0v+K861k/7InZqS+sIE1
	ZjqXKR3exFBY/FA+8QFl02JhO9/3Jz9UIsTWO/8w4uOAuojQ479V52sPgbpZm7h8ytKp
	4S9EIoVOSdQBMOOV9muwxJrWiFj4tKa9xEb/9zLWcSQvM2hGww9WxSYALtIp1XvWLBPp
	iyWX7cUv63T/x3ceZIoG2dkvikUy7Yv4cvoc3nicEjnXqvDx0RAUDUosEKg+ZMkPlZxM
	34Y+rbvKCe7c3krZBMxYEkLQBj9sYSPNqfbKvmobJXjDOUCMS6YD8Xj//I/oC0O/dfMC
	qtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Z8dimpQC8vdtCC4De+gwgwsusg66lz067tL/jw2Tpok=;
	b=qRbH+G+hy6DPb4+7fwQ5k9m8iqBNL4JICSyl7ci1/kqXidb/kOshluzDIVCs1D3cHS
	mAKGvNNtd+ji9yoRqx1x2K7uJsDBjeRuR6gFoe9ATDjY2lzlwRiJmrqZ0g8Ln/cM+tsc
	dUQTvp2sH6vsww3m07lvH/C5prz4r3rCNY6hZlEWyzzzdrhnTb+QWRxMhg/L1qi10qC/
	Zi/3k45/9AnHh71a6AuVWEH9iirNEly0UyTjnOzTPBFpmdPFu1g+ORYF1dlnipDCDKNd
	8WxCUacu7X40yLluIuUUbO6Meun9b83A/zODsW9WExPcDMt9CdKcs5oxdkNsrfF4EtlG
	ZTLg==
X-Gm-Message-State: APjAAAW36/bS24uXAt5kTURw6T5dv5gjOm9twcxgmIvP6/+LhbiVFWe7
	a1bXBrHUSo0l6k21DXq1uVu9AeiQpMEjZyR7ugAW
X-Google-Smtp-Source: APXvYqzCJ4keItAtoCXZi+MHdF7IAbDieeaI/c/9ZNWZ7Wiy4D1n1BDN3LmDbcWF6eHExXUzAWtms8rd2LL3WP6Nk30=
X-Received: by 2002:a2e:86c3:: with SMTP id n3mr5234874ljj.129.1565189096422; 
	Wed, 07 Aug 2019 07:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <DB7PR07MB60579436984C50BB515349C898D50@DB7PR07MB6057.eurprd07.prod.outlook.com>
In-Reply-To: <DB7PR07MB60579436984C50BB515349C898D50@DB7PR07MB6057.eurprd07.prod.outlook.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 7 Aug 2019 10:44:45 -0400
Message-ID: <CAHC9VhSsmTYwcL=U=0Bn0Darkh6cnOUYmTNxG1igS7HJqB-FjA@mail.gmail.com>
Subject: Re: Query - System Calls Arguments in Linux Audit Kernel
To: Muhammad Adil Inam <20100180@lums.edu.pk>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 07 Aug 2019 14:44:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Wed, 07 Aug 2019 14:44:58 +0000 (UTC) for IP:'209.85.208.194'
	DOMAIN:'mail-lj1-f194.google.com'
	HELO:'mail-lj1-f194.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.194 mail-lj1-f194.google.com 209.85.208.194
	mail-lj1-f194.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x77Ej48U030490
X-loop: linux-audit@redhat.com
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>,
	Ali Ahad <20100284@lums.edu.pk>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Wed, 07 Aug 2019 14:46:20 +0000 (UTC)

On Tue, Aug 6, 2019 at 11:35 AM Muhammad Adil Inam <20100180@lums.edu.pk> wrote:
> As you know, linux-audit logs all the syscall arguments as a1, a2, a3, a4 as unsigned longs. In the case of some syscall, such as WRITE, the second argument, a2, stores the pointer to a buffer, where the buffer contains the content being written. I have been trying to deference the buffer from its address stored in a2. I am dereferencing the buffer currently in kernel/auditsc.c and dumping the dereferenced contents of a2 to printk. However, after building the customized kernel, auditd fails probably due to invalid pointer dereferencing.
>
>I am confused regarding the scope of that pointer variable stored in a2. I have two questions:
>
> 1) Is it possible to deference the syscall arguments in the Linux kernel, given the buffer was initially sent by the process that initiated the syscall?

In order for the syscall to work, the kernel must be able to
dereference pointers to memory passed to it from userspace.  How would
open(2) work if the kernel couldn't dereference the pathname pointer?
If you look at how the kernel implements different syscalls you will
see how that is typically done, and you will surely notice that it can
be tricky to do so safely (you can't trust the calling process to be
well behaved).

> 2) If it is possible to do so, what is the right way to go about it. What is the right file to work if the goal is to dereference the address stored in one of the SYSCALL arguments?

The answer to this depends a lot on what exactly you are trying to do.
In general I would say that the audit subsystem is probably not the
best place to unpack/dereference syscall arguments; while we do
capture information that is closely related to the syscall arguments
(e.g. we record PATH records for the open(2) syscall), we only do so
in some special cases.

My gut feeling is that you might be better off looking into some of
the kernel tracing tools, or even just something like strace/ptrace.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
