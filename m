Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD441AE815
	for <lists+linux-audit@lfdr.de>; Sat, 18 Apr 2020 00:19:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587161998;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=12qgQAgfvHJrPrT0+PuHxoT+zomT5gGR6MxkpjcShls=;
	b=ZFYTgg0eOw9Ac9NrfT6TNHMmD9zH/6ybq8awO+IMpqCIPMx51myt4IlbNc189+jzu2wOdY
	bfLTLVC1xnZGZsAYy0B6VOt3kufxv+SYM96tJ9/D1ZRcH6JQnBUWkNWTZ45bWIB31nRWTs
	FAH/xfVemZVj+EwmBRblFlpfQdg6qho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-aQkYmKxIPbKCgOlYIV8X5A-1; Fri, 17 Apr 2020 18:19:53 -0400
X-MC-Unique: aQkYmKxIPbKCgOlYIV8X5A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11CC9107ACCA;
	Fri, 17 Apr 2020 22:19:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ABD6129F81;
	Fri, 17 Apr 2020 22:19:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3117593391;
	Fri, 17 Apr 2020 22:19:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03HMJPvF006664 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 17 Apr 2020 18:19:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ACB46101B544; Fri, 17 Apr 2020 22:19:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8D0B1013026
	for <linux-audit@redhat.com>; Fri, 17 Apr 2020 22:19:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 160DA800297
	for <linux-audit@redhat.com>; Fri, 17 Apr 2020 22:19:23 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-385-OKdRVO31P36gO2BPH-rKew-1; Fri, 17 Apr 2020 18:19:20 -0400
X-MC-Unique: OKdRVO31P36gO2BPH-rKew-1
Received: by mail-ed1-f65.google.com with SMTP id c7so2640550edl.2
	for <linux-audit@redhat.com>; Fri, 17 Apr 2020 15:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=W8Gwda6aJagQ951htxX1UFCzfkSdxr3HJlytQNZ7BG0=;
	b=A3zqq++re4cvhtdli8A+ZtlrLN8nP0d8ZrA75zgDzHMRc/Vz8xyyK4B+YXjwrnFWS6
	GeusizgkqEXbMOLV7Vc+yH4mwlIuY+nPIBoA36IbFNnZWxUxYKY6JwmFAwPBqraMnlWy
	KWcZjRi7FG6JcNhLIatJYeFjBA5Gc8XTRcuT6SbQRJ3/VY8Goj2IbxknmPKcVJPpZyfC
	FBAMniEjdsn96fwZWlWlTnZxpSxM/G8yqLRnHot8SJuIvTWLgXWtzhLl2MBpWg0JMO1h
	1X8VjW6UalLyHPhR3ek266crkGn0lz9jSF5moc4ytCABVxJlM2Egsgi3XimR4Oy1RRxd
	Lvqw==
X-Gm-Message-State: AGi0Pua9LoSm0X1v59kvwlVNYupE7IcBE6m501LOtsfi44C6XHFlkk2p
	jwEd37TjYo+I518he4CvxxSJjHmrrwmOIH5R8/yp
X-Google-Smtp-Source: APiQypKl/tfHK9jHI/GBf28NGrFcg5tn9HvmP2XPnIPytRpWNK1hjfLIGKjX4Ue222ygpwS3+sj0iKDM7sxcH/3cdT4=
X-Received: by 2002:aa7:c401:: with SMTP id j1mr5071836edq.31.1587161959380;
	Fri, 17 Apr 2020 15:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <82d85f72416560c155031375fb5b32ac06394c31.1584033222.git.rgb@redhat.com>
	<CAHC9VhRqytBECZ+bgo_OXavbRmPKEu0OOqS=xe=FQFhG+Qv=oA@mail.gmail.com>
	<20200417213423.leermiriy4jzgwf4@madcap2.tricolour.ca>
In-Reply-To: <20200417213423.leermiriy4jzgwf4@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 17 Apr 2020 18:19:07 -0400
Message-ID: <CAHC9VhRy9krH8gxMHX1qpHLNR7De0KyouOrAvEzGKYkr8r2B0g@mail.gmail.com>
Subject: Re: [PATCH ghak28 V7] audit: log audit netlink multicast bind and
	unbind events
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03HMJPvF006664
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 17, 2020 at 5:34 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-04-17 17:18, Paul Moore wrote:
> > On Tue, Mar 17, 2020 at 12:04 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > Log information about programs connecting to and disconnecting from the
> > > audit netlink multicast socket. This is needed so that during
> > > investigations a security officer can tell who or what had access to the
> > > audit trail.  This helps to meet the FAU_SAR.2 requirement for Common
> > > Criteria.  Here is the systemd startup event:
> > >
> > > type=PROCTITLE msg=audit(2020-02-18 15:26:50.775:10) : proctitle=/init
> > > type=SYSCALL msg=audit(2020-02-18 15:26:50.775:10) : arch=x86_64 syscall=bind success=yes exit=0 a0=0x19 a1=0x55645c369b70 a2=0xc a3=0x7fff9fedec24 items=0 ppid=0 pid=1 auid=unset uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=(none) ses=unset comm=systemd exe=/usr/lib/systemd/systemd subj=kernel key=(null)
> > > type=UNKNOWN[1335] msg=audit(2020-02-18 15:26:50.775:10) : pid=1 uid=root auid=unset tty=(none) ses=unset subj=kernel comm=systemd exe=/usr/lib/systemd/systemd nl-mcgrp=1 op=connect res=yes
> > >
> > > And the events from the test suite:
> > >
> > > type=PROCTITLE msg=audit(2020-02-18 15:28:01.594:307) : proctitle=/usr/bin/perl -w amcast_joinpart/test
> > > type=SYSCALL msg=audit(2020-02-18 15:28:01.594:307) : arch=x86_64 syscall=bind success=yes exit=0 a0=0x7 a1=0x558ebc428be0 a2=0xc a3=0x0 items=0 ppid=642 pid=645 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=ttyS0 ses=1 comm=perl exe=/usr/bin/perl subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> > > type=UNKNOWN[1335] msg=audit(2020-02-18 15:28:01.594:307) : pid=645 uid=root auid=root tty=ttyS0 ses=1 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl exe=/usr/bin/perl nl-mcgrp=1 op=connect res=yes
> > >
> > > type=PROCTITLE msg=audit(2020-03-17 11:35:31.474:344) : proctitle=/usr/bin/perl -w amcast_joinpart/test
> > > type=SYSCALL msg=audit(2020-03-17 11:35:31.474:344) : arch=x86_64 syscall=setsockopt success=yes exit=0 a0=0x7 a1=SOL_NETLINK a2=0x2 a3=0x7ffee21ca5f0 items=0 ppid=686 pid=689 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=ttyS0 ses=3 comm=perl exe=/usr/bin/perl subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> > > type=UNKNOWN[1335] msg=audit(2020-03-17 11:35:31.474:344) : pid=689 uid=root auid=root tty=ttyS0 ses=3 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl exe=/usr/bin/perl nl-mcgrp=1 op=disconnect res=yes
> > >
> > > type=UNKNOWN[1335] msg=audit(2020-01-17 10:36:24.051:295) : pid=674 uid=root auid=root tty=ttyS0 ses=3 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl exe=/usr/bin/perl nl-mcgrp=1 op=disconnect res=yes
> >
> > This patch looks fine to me, but this line is curious ... I'm assuming
> > this is just a stray/cut-n-paste-error from the last time you updated
> > the commit description?  If so, just let me know and I can drop it
> > while merging, otherwise there is something odd going on ....
>
> That last line is the result of close() from an earlier version of the
> testsuite, rather than setsockopt(..., NETLINK_DROP_MEMBERSHIP, ...).
>
> This is why we need the subject attributes, as noted in the first note
> above the changelog below.

Argh.  I wasn't looking at the subject info, I was just noting the
timestamp was obviously wrong and the connects/disconnects didn't
match.

I was going to be nice and just drop that message during the merge,
but you need to regenerate those messages with the audit records from
just this patch since it is 1/3.  As it stands right now someone is
going to be very confused in a few years when they try to reconcile
the code changes with your commit description.

Regardless of the subject info, we should make sure the
connects/disconnects are matched.  The example you provide from the
test shows one connect, but two disconnects.  That is going to confuse
people looking through the audit logs.  I'm hoping you just did a
copy-n-paste error, but if not we need to figure that out and find a
way to make them match if there is somewhat to do so.

While you are respinning this patch, please fix the checkpatch.pl
errors; there were multiple line length, space/tab, and code indent
problems.  I was going to fix them during the merge, but you might as
well fix them now.  Feel free to insert my usual plea to run your
patches through checkpatch.pl before submitting.

> > > Please see the upstream issue tracker at
> > >   https://github.com/linux-audit/audit-kernel/issues/28
> > > With the feature description at
> > >   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Multicast-Socket-Join-Part
> > > The testsuite support is at
> > >   https://github.com/rgbriggs/audit-testsuite/compare/ghak28-mcast-part-join
> > >   https://github.com/linux-audit/audit-testsuite/pull/93
> > > And the userspace support patch is at
> > >   https://github.com/linux-audit/audit-userspace/pull/114
> > >
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > >
> > > ---
> > > Note: subj attrs included due to missing syscall record for disconnect on close
> > > Note: tried refactor of subj attrs, but this is yet another new order.
> > >
> > > Changelog:
> > > v7:
> > > - rename audit_log_multicast_bind to audit_log_multicast
> > >
> > > v6:
> > > - rebased on 5.6-rc1 audit/next and audit log BPF
> > > - updated patch description sample records
> > >
> > > v5:
> > > - rebased on 5.5-rc1 audit/next
> > > - group bind/unbind ops
> > > - add audit context
> > > - justify message number skip
> > > - check audit_enabled
> > > - change field name from nlnk-grp to nl-mcgrp
> > > - fix whitespace issues
> > >
> > > v4:
> > > - 2017-10-13 sgrubb
> > > - squash to 1 patch
> > > - rebase on KERN_MODULE event
> > > - open code subj attrs
> > >
> > > v3:
> > > - 2016-11-30 sgrubb
> > > - rebase on REPLACE event
> > > - minimize audit_log_format calls
> > > - rename audit_log_bind to audit_log_multicast_bind
> > >
> > > v2:
> > > - 2015-07-23 sgrubb
> > > - spin off audit_log_task_simple in seperate patch
> > >
> > > v1:
> > > - 2014-10-07 rgb
> > > ---
> > >  include/uapi/linux/audit.h |  1 +
> > >  kernel/audit.c             | 48 ++++++++++++++++++++++++++++++++++++++++++----
> > >  2 files changed, 45 insertions(+), 4 deletions(-)

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

