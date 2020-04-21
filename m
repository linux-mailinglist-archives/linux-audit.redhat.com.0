Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 664651B3158
	for <lists+linux-audit@lfdr.de>; Tue, 21 Apr 2020 22:40:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587501608;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NwWuxRblvXWYFTF+mXS910/+rXThPREWGN+0M9HvClo=;
	b=Kx3yie7B9o3t/Sxm2C7a2oglLgOhV78uZJ4C9mqcr4H7wFqsMmvRd/BhV53O4O/Et9RIHw
	b0cAgOqkxSjGs+3RZ1uF7yVjyBsQkf36BiFJSA1uKmF+O2L3MtIWMq+yNWrldNGq1J3GKP
	lK2WgDtDTdlVwatDyCxu1DUkcWCF44A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-Ig4h_YOkP4aElF6hTazqDw-1; Tue, 21 Apr 2020 16:40:02 -0400
X-MC-Unique: Ig4h_YOkP4aElF6hTazqDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D60513F8;
	Tue, 21 Apr 2020 20:39:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 761945C1D4;
	Tue, 21 Apr 2020 20:39:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D0E9B941A5;
	Tue, 21 Apr 2020 20:39:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03LKd4QI004013 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 21 Apr 2020 16:39:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D9D9E5DA83; Tue, 21 Apr 2020 20:39:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 358445DA7C;
	Tue, 21 Apr 2020 20:38:58 +0000 (UTC)
Date: Tue, 21 Apr 2020 16:38:55 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak28 V7] audit: log audit netlink multicast bind and
	unbind events
Message-ID: <20200421203854.dkrvl7oiy5u5ac5j@madcap2.tricolour.ca>
References: <82d85f72416560c155031375fb5b32ac06394c31.1584033222.git.rgb@redhat.com>
	<CAHC9VhRqytBECZ+bgo_OXavbRmPKEu0OOqS=xe=FQFhG+Qv=oA@mail.gmail.com>
	<20200417213423.leermiriy4jzgwf4@madcap2.tricolour.ca>
	<CAHC9VhRy9krH8gxMHX1qpHLNR7De0KyouOrAvEzGKYkr8r2B0g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRy9krH8gxMHX1qpHLNR7De0KyouOrAvEzGKYkr8r2B0g@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-04-17 18:19, Paul Moore wrote:
> On Fri, Apr 17, 2020 at 5:34 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-04-17 17:18, Paul Moore wrote:
> > > On Tue, Mar 17, 2020 at 12:04 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > >
> > > > Log information about programs connecting to and disconnecting from the
> > > > audit netlink multicast socket. This is needed so that during
> > > > investigations a security officer can tell who or what had access to the
> > > > audit trail.  This helps to meet the FAU_SAR.2 requirement for Common
> > > > Criteria.  Here is the systemd startup event:
> > > >
> > > > type=PROCTITLE msg=audit(2020-02-18 15:26:50.775:10) : proctitle=/init
> > > > type=SYSCALL msg=audit(2020-02-18 15:26:50.775:10) : arch=x86_64 syscall=bind success=yes exit=0 a0=0x19 a1=0x55645c369b70 a2=0xc a3=0x7fff9fedec24 items=0 ppid=0 pid=1 auid=unset uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=(none) ses=unset comm=systemd exe=/usr/lib/systemd/systemd subj=kernel key=(null)
> > > > type=UNKNOWN[1335] msg=audit(2020-02-18 15:26:50.775:10) : pid=1 uid=root auid=unset tty=(none) ses=unset subj=kernel comm=systemd exe=/usr/lib/systemd/systemd nl-mcgrp=1 op=connect res=yes
> > > >
> > > > And the events from the test suite:
> > > >
> > > > type=PROCTITLE msg=audit(2020-02-18 15:28:01.594:307) : proctitle=/usr/bin/perl -w amcast_joinpart/test
> > > > type=SYSCALL msg=audit(2020-02-18 15:28:01.594:307) : arch=x86_64 syscall=bind success=yes exit=0 a0=0x7 a1=0x558ebc428be0 a2=0xc a3=0x0 items=0 ppid=642 pid=645 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=ttyS0 ses=1 comm=perl exe=/usr/bin/perl subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> > > > type=UNKNOWN[1335] msg=audit(2020-02-18 15:28:01.594:307) : pid=645 uid=root auid=root tty=ttyS0 ses=1 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl exe=/usr/bin/perl nl-mcgrp=1 op=connect res=yes
> > > >
> > > > type=PROCTITLE msg=audit(2020-03-17 11:35:31.474:344) : proctitle=/usr/bin/perl -w amcast_joinpart/test
> > > > type=SYSCALL msg=audit(2020-03-17 11:35:31.474:344) : arch=x86_64 syscall=setsockopt success=yes exit=0 a0=0x7 a1=SOL_NETLINK a2=0x2 a3=0x7ffee21ca5f0 items=0 ppid=686 pid=689 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=ttyS0 ses=3 comm=perl exe=/usr/bin/perl subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)
> > > > type=UNKNOWN[1335] msg=audit(2020-03-17 11:35:31.474:344) : pid=689 uid=root auid=root tty=ttyS0 ses=3 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl exe=/usr/bin/perl nl-mcgrp=1 op=disconnect res=yes
> > > >
> > > > type=UNKNOWN[1335] msg=audit(2020-01-17 10:36:24.051:295) : pid=674 uid=root auid=root tty=ttyS0 ses=3 subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=perl exe=/usr/bin/perl nl-mcgrp=1 op=disconnect res=yes
> > >
> > > This patch looks fine to me, but this line is curious ... I'm assuming
> > > this is just a stray/cut-n-paste-error from the last time you updated
> > > the commit description?  If so, just let me know and I can drop it
> > > while merging, otherwise there is something odd going on ....
> >
> > That last line is the result of close() from an earlier version of the
> > testsuite, rather than setsockopt(..., NETLINK_DROP_MEMBERSHIP, ...).
> >
> > This is why we need the subject attributes, as noted in the first note
> > above the changelog below.
> 
> Argh.  I wasn't looking at the subject info, I was just noting the
> timestamp was obviously wrong and the connects/disconnects didn't
> match.

I can doctor the timestamp if you like?  ;-)

> I was going to be nice and just drop that message during the merge,
> but you need to regenerate those messages with the audit records from
> just this patch since it is 1/3.  As it stands right now someone is
> going to be very confused in a few years when they try to reconcile
> the code changes with your commit description.
> 
> Regardless of the subject info, we should make sure the
> connects/disconnects are matched.  The example you provide from the
> test shows one connect, but two disconnects.  That is going to confuse
> people looking through the audit logs.  I'm hoping you just did a
> copy-n-paste error, but if not we need to figure that out and find a
> way to make them match if there is somewhat to do so.

No, it wasn't a copy/paste error.  It was an intentional inclusion, but
it will need some prose to explain what it demonstrates.

> While you are respinning this patch, please fix the checkpatch.pl
> errors; there were multiple line length, space/tab, and code indent
> problems.  I was going to fix them during the merge, but you might as
> well fix them now.  Feel free to insert my usual plea to run your
> patches through checkpatch.pl before submitting.

I assume this paragraph was to be conditionally included in the ghak25
patchset comments if a respin was necessary since this patch has no
issues (other than one patch description line too long that is a record
sample).  I've fixed all those issues in ghak25 patches 1/3 and 2/3 and
am just doing a test compile to make sure I've not messed anything up
and that the rebase to v5.7-rc1 didn't cause a problem.

> > > > Please see the upstream issue tracker at
> > > >   https://github.com/linux-audit/audit-kernel/issues/28
> > > > With the feature description at
> > > >   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Multicast-Socket-Join-Part
> > > > The testsuite support is at
> > > >   https://github.com/rgbriggs/audit-testsuite/compare/ghak28-mcast-part-join
> > > >   https://github.com/linux-audit/audit-testsuite/pull/93
> > > > And the userspace support patch is at
> > > >   https://github.com/linux-audit/audit-userspace/pull/114
> > > >
> > > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > >
> > > > ---
> > > > Note: subj attrs included due to missing syscall record for disconnect on close
> > > > Note: tried refactor of subj attrs, but this is yet another new order.
> > > >
> > > > Changelog:
> > > > v7:
> > > > - rename audit_log_multicast_bind to audit_log_multicast
> > > >
> > > > v6:
> > > > - rebased on 5.6-rc1 audit/next and audit log BPF
> > > > - updated patch description sample records
> > > >
> > > > v5:
> > > > - rebased on 5.5-rc1 audit/next
> > > > - group bind/unbind ops
> > > > - add audit context
> > > > - justify message number skip
> > > > - check audit_enabled
> > > > - change field name from nlnk-grp to nl-mcgrp
> > > > - fix whitespace issues
> > > >
> > > > v4:
> > > > - 2017-10-13 sgrubb
> > > > - squash to 1 patch
> > > > - rebase on KERN_MODULE event
> > > > - open code subj attrs
> > > >
> > > > v3:
> > > > - 2016-11-30 sgrubb
> > > > - rebase on REPLACE event
> > > > - minimize audit_log_format calls
> > > > - rename audit_log_bind to audit_log_multicast_bind
> > > >
> > > > v2:
> > > > - 2015-07-23 sgrubb
> > > > - spin off audit_log_task_simple in seperate patch
> > > >
> > > > v1:
> > > > - 2014-10-07 rgb
> > > > ---
> > > >  include/uapi/linux/audit.h |  1 +
> > > >  kernel/audit.c             | 48 ++++++++++++++++++++++++++++++++++++++++++----
> > > >  2 files changed, 45 insertions(+), 4 deletions(-)
> 
> -- 
> paul moore
> www.paul-moore.com
> 

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

