Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EC2B4443
	for <lists+linux-audit@lfdr.de>; Tue, 17 Sep 2019 00:52:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E49A618CB8E3;
	Mon, 16 Sep 2019 22:52:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FBF160A9F;
	Mon, 16 Sep 2019 22:52:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E5161803518;
	Mon, 16 Sep 2019 22:52:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8GMqVlJ024921 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 16 Sep 2019 18:52:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BA6315D6C8; Mon, 16 Sep 2019 22:52:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4FFF5D6B2
	for <linux-audit@redhat.com>; Mon, 16 Sep 2019 22:52:29 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40119308FBAC
	for <linux-audit@redhat.com>; Mon, 16 Sep 2019 22:52:28 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id e17so1449328ljf.13
	for <linux-audit@redhat.com>; Mon, 16 Sep 2019 15:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dlZ1zGHZkoJ6/E2qOm43de5/u/WlaXxfSVzrgQidlFw=;
	b=ass72gui8ieoGaQqwVDq7A+wZcUGy/s6Azd5l/YVhCnxF+qESro02gfZzOaKs8h2UY
	MCwJ0rYiaOA9AfI9so231GaTCfc1XP6GWpcHG42bbW6nOV+wfSGSxNPspUl9QOXrUMQI
	+7JjuFln3SWjSj9okw5WAeCwed5wEF9czaLRHz+It7mc4IZsey6vDwpYLZOD2ulCaP/1
	DjHphh6LsqXtuQ019DnDepUM2p4e4gXilclqETDgPlC4a3CMH2lWmAodWRbaI8Tg6smT
	TIimiTjZJwqEJUuD8GQ5TC0v6uDZnQ3EwGj6t0E46OWpDv1gfiAfU2B6quYwOK3Pv+PH
	MzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dlZ1zGHZkoJ6/E2qOm43de5/u/WlaXxfSVzrgQidlFw=;
	b=f0hlUkpdKPKRWDvE0uN4mW3+yc5hxlkOF1IJYTVhjDdYfMZMBsVIwERqF1y0rInYt4
	c0hF2UQfY/GHwwx+cWUpE5t+/EAnuxrxqEa9LRfqYuFF6ltLFUiyFzrfXZdT8deg2cf7
	7QgJdqZuDkmx2mtDpSzS6wdbBOt4gjj1SuNoy9kcWGsuA+yZq1uYqcpURtGiPnUhbhIt
	gqhJXeMECmHCPmGusVf1foezzJqNVoITbZFZdCg4NH9x1YeQhRbh9KyapxSM623A2reU
	PpPIOGCmTrrACCXfC3S0OuhEhJiAb2+osOr3GiyeglGsITw9jmSTcC32KU+dcnyP/MJ9
	p4oA==
X-Gm-Message-State: APjAAAVI5I04Eiv4nT4OcBKt5PkRkggPK2rvOuU2kuLNM0+UeaqblWNK
	i0vV5vlOEg1Grc4sz2GGytS9ORc4pMiNvClLfEVp2yKHFg==
X-Google-Smtp-Source: APXvYqzN+GxIWNb3nxT9jAI04PaDf6E3uNbHg9dvP3jzxBGLP4N93kLn0SlQVS37v6/5tu9nowKDlKqntPJlQx8ziDg=
X-Received: by 2002:a2e:6e18:: with SMTP id j24mr140752ljc.158.1568674346441; 
	Mon, 16 Sep 2019 15:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <1568258385-10643-1-git-send-email-lirongqing@baidu.com>
	<CAHC9VhRXj2UpdijxpKgMROfNu9tETpXpHdboPqP=HvVF-GuBVQ@mail.gmail.com>
	<f0efb280c80342049d4c43c9acb42676@baidu.com>
In-Reply-To: <f0efb280c80342049d4c43c9acb42676@baidu.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 16 Sep 2019 18:52:15 -0400
Message-ID: <CAHC9VhR79o8aSkORj0fU2XKfLUBipRtTO+xUHPAd+StfpzAV-g@mail.gmail.com>
Subject: Re: [PATCH][RFC] audit: set wait time to zero when audit failed
To: "Li,Rongqing" <lirongqing@baidu.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 16 Sep 2019 22:52:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Mon, 16 Sep 2019 22:52:28 +0000 (UTC) for IP:'209.85.208.196'
	DOMAIN:'mail-lj1-f196.google.com'
	HELO:'mail-lj1-f196.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.196 mail-lj1-f196.google.com 209.85.208.196
	mail-lj1-f196.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]); Mon, 16 Sep 2019 22:52:50 +0000 (UTC)

On Sun, Sep 15, 2019 at 10:55 PM Li,Rongqing <lirongqing@baidu.com> wrote:
> > > if audit_log_start failed because queue is full, kauditd is waiting
> > > the receiving queue empty, but no receiver, a task will be forced to
> > > wait 60 seconds for each audited syscall, and it will be hang for a
> > > very long time
> > >
> > > so at this condition, set the wait time to zero to reduce wait, and
> > > restore wait time when audit works again
> > >
> > > it partially restore the commit 3197542482df ("audit: rework
> > > audit_log_start()")
> > >
> > > Signed-off-by: Li RongQing <lirongqing@baidu.com>
> > > Signed-off-by: Liang ZhiCheng <liangzhicheng@baidu.com>
> > > ---
> > > reboot is taking a very long time on my machine(centos 6u4 +kernel
> > > 5.3) since TIF_SYSCALL_AUDIT is set by default, and when reboot,
> > > userspace process which receiver audit message , will be killed, and
> > > lead to that no user drain the audit queue
> > >
> > > git bitsect show it is caused by 3197542482df ("audit: rework
> > > audit_log_start()")
> > >
> > >  kernel/audit.c | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > This is typically solved by increasing the backlog using the "audit_backlog_limit"
> > kernel parameter (link to the docs below).
>
> It should be able to avoid my issue, but the default behaviors does not working for me; And not all have enough knowledge about audit, who maybe spend lots of effort to find the root cause, and estimate how large should be "audit_backlog_limit"

The pause/sleep behavior is desired behavior and is intended to help
kauditd/auditd process the audit backlog on a busy system.  If we
didn't sleep the current process and give kauditd/auditd a chance to
flush the backlog when it was full, a lot of bad things could happen
with respect to audit.  We generally select the backlog limit so that
this is not a problem for most systems, although there will always be
edge cases where the default does not work well; it is impossible to
pick defaults that work well for every case.

If you are not using audit, you can always disable it via the kernel
command line, or at runtime (look at what Fedora does).

> > You might also want to investigate
> > what is generating some many audit records prior to starting the audit
> > daemon.
>
> It is /sbin/readahead-collector, in fact, we stop the auditd; We are doing a reboot test, which rebooting machine continue to test hardware/software.
>
> it is same as below:
> auditctl -a always,exit -S all -F pid='xxx'
> kill -s 19 `pidof auditd`
>
> then the audited task will be hung

So you are seeing this problem only when you run a test, or did you
provide this as a reproducer?

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
