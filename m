Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F018A140
	for <lists+linux-audit@lfdr.de>; Mon, 12 Aug 2019 16:36:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57FEF30024DB;
	Mon, 12 Aug 2019 14:36:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C0E362670;
	Mon, 12 Aug 2019 14:36:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8209718005C7;
	Mon, 12 Aug 2019 14:36:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7CEXAdg023961 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 12 Aug 2019 10:33:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A429969FC2; Mon, 12 Aug 2019 14:33:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from krava (unknown [10.43.17.33])
	by smtp.corp.redhat.com (Postfix) with SMTP id D0EF669FA0;
	Mon, 12 Aug 2019 14:32:57 +0000 (UTC)
Date: Mon, 12 Aug 2019 16:32:57 +0200
From: Jiri Olsa <jolsa@redhat.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [RFC] audit support for BPF notification
Message-ID: <20190812143257.GC23992@krava>
References: <20190809141831.GB9377@krava> <2985228.9kGasGrDWd@x2>
	<20190812075922.GA3012@krava> <5293423.BmRMD7FMx9@x2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5293423.BmRMD7FMx9@x2>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 12 Aug 2019 10:36:38 -0400
Cc: Stanislav Kozina <skozina@redhat.com>,
	Yauheni Kaliuta <yauheni.kaliuta@redhat.com>,
	Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
	Jiri Benc <jbenc@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-audit@redhat.com, Jesper Dangaard Brouer <brouer@redhat.com>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 12 Aug 2019 14:36:48 +0000 (UTC)

On Mon, Aug 12, 2019 at 09:49:43AM -0400, Steve Grubb wrote:
> On Monday, August 12, 2019 3:59:22 AM EDT Jiri Olsa wrote:
> > On Fri, Aug 09, 2019 at 01:45:21PM -0400, Steve Grubb wrote:
> > > Hello,
> > > 
> > > On Friday, August 9, 2019 10:18:31 AM EDT Jiri Olsa wrote:
> > > > I posted initial change that allows auditd to log BPF program
> > > > 
> > > > load/unload events, it's in here:
> > > >   https://github.com/linux-audit/audit-userspace/pull/104
> > > 
> > > Thanks for the patch...but we probably should have talked a bit more
> > > before undertaking this effort. We normally do not audit from user space
> > > what happens in the kernel. Doing this can be racy and it keeps auditd
> > > from doing the one job it has - which is to grab events and record them
> > > to disk and send them out the realtime interface.
> > > 
> > > > We tried to push pure AUDIT interface for BPF program notification,
> > > > 
> > > > but it was denied, the discussion is in here:
> > > >   https://marc.info/?t=153866123200003&r=1&w=2
> > > 
> > > Hmm. The email I remember was here:
> > > https://www.redhat.com/archives/linux-audit/2018-October/msg00053.html
> > > 
> > > and was only 2 emails long with no answer to my question. :-)
> > 
> > oops, sry about that, your question was:
> > 	> I'm not sure exactly what the issue is. You can audit for specific
> > 	> syscall
> > 	> and argument. So, if you want to see loads, then you can make a rule
> > 	> like:
> > 	> 
> > 	> -a always,exit -F arch=b64 -S bpf -F a0=5
> > 
> > The problem with above for us is that we also:
> > 
> >   - need to log also other properties of the BPF program,
> >     which are not visible from BPF syscall arguments, like
> >     its ID, JIT status 
> 
> The way this is normally done is to add a supplemental record. For example, 
> when auditing the open syscall, we also get CWD & PATH supplemental records. 
> When auditing connect, we get a SOCKADDR supplemental record. We have 
> requirements around selective audit whereby the admin is in control of what 
> is selected for audit via audit rules. So, what one could do is set a rule 
> for the bpf syscall and then when it triggers, we get these other records 
> added to the bpf syscall event.

right, that was the initial plan, but BPF guys wanted just
single notification system without specific hooks for audit,
so we ended up with perf specific interface

> >     or license info
> 
> This ^^ is not a security issue.
> 
> 
> >   - need to see BPF program UNLOAD, which is not done
> >     via syscall, so those would be unvisible at all
> 
> Is there a place in the kernel where this happens? I could see abnormal 
> termination being something we might want. Does the program go through 
> something like an exit syscall internally?

it's happening in here (kernel/bpf/syscall.c):

	bpf_prog_put
	  __bpf_prog_put
	  {
		    if (atomic_dec_and_test(&prog->aux->refcnt)) {
			perf_event_bpf_event(prog, PERF_BPF_EVENT_PROG_UNLOAD, 0);
			...
	  }

BPF program is released when it drops the reference count,
which is normally when its file descriptor is closed.

However it might get pinned and stay alive even when the initial
file descriptor is closed.. and then there's the networking world,
which might have some other specific ways.. but it all ends up
in bpf_prog_put and zero reference count.

> > > > The outcome of the discussion was to use perf event interface
> > > > for BPF notification and use it in some deamon.. audit was our
> > > > first choice.
> > > > 
> > > > thoughts?
> > > 
> > > I'd like to understand what the basic problem is that needs to be solved.
> > 
> > we need a way for administrators to see the history of loaded BPF
> > programs, to help investigating issues related to BPF.. and the
> > only BPF interface for this data is through perf ring buffer
> 
> That is really not the audit way. Let's keep talking to see where this ends 
> up.

Would you see some other auditing daemon/app in place for this kind of data?

thanks,
jirka

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
