Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3678A13F
	for <lists+linux-audit@lfdr.de>; Mon, 12 Aug 2019 16:36:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F26130FB8FC;
	Mon, 12 Aug 2019 14:36:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78863600C4;
	Mon, 12 Aug 2019 14:36:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F1FBD18005B9;
	Mon, 12 Aug 2019 14:36:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7C7xZG6009591 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 12 Aug 2019 03:59:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 272B298B8; Mon, 12 Aug 2019 07:59:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from krava (unknown [10.43.17.33])
	by smtp.corp.redhat.com (Postfix) with SMTP id CF1F35D6A0;
	Mon, 12 Aug 2019 07:59:22 +0000 (UTC)
Date: Mon, 12 Aug 2019 09:59:22 +0200
From: Jiri Olsa <jolsa@redhat.com>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [RFC] audit support for BPF notification
Message-ID: <20190812075922.GA3012@krava>
References: <20190809141831.GB9377@krava>
 <2985228.9kGasGrDWd@x2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2985228.9kGasGrDWd@x2>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 12 Aug 2019 14:36:47 +0000 (UTC)

On Fri, Aug 09, 2019 at 01:45:21PM -0400, Steve Grubb wrote:
> Hello,
> 
> On Friday, August 9, 2019 10:18:31 AM EDT Jiri Olsa wrote:
> > I posted initial change that allows auditd to log BPF program
> > load/unload events, it's in here:
> >   https://github.com/linux-audit/audit-userspace/pull/104
> 
> Thanks for the patch...but we probably should have talked a bit more before 
> undertaking this effort. We normally do not audit from user space what happens 
> in the kernel. Doing this can be racy and it keeps auditd from doing the one 
> job it has - which is to grab events and record them to disk and send them 
> out the realtime interface.
> 
> 
> > We tried to push pure AUDIT interface for BPF program notification,
> > but it was denied, the discussion is in here:
> >   https://marc.info/?t=153866123200003&r=1&w=2
> 
> Hmm. The email I remember was here:
> https://www.redhat.com/archives/linux-audit/2018-October/msg00053.html
> 
> and was only 2 emails long with no answer to my question. :-)

oops, sry about that, your question was:

	> I'm not sure exactly what the issue is. You can audit for specific syscall 
	> and argument. So, if you want to see loads, then you can make a rule like:

	> -a always,exit -F arch=b64 -S bpf -F a0=5


The problem with above for us is that we also:

  - need to log also other properties of the BPF program,
    which are not visible from BPF syscall arguments, like
    its ID, JIT status or license info

  - need to see BPF program UNLOAD, which is not done
    via syscall, so those would be unvisible at all

> 
> > The outcome of the discussion was to use perf event interface
> > for BPF notification and use it in some deamon.. audit was our
> > first choice.
> > 
> > thoughts?
> 
> I'd like to understand what the basic problem is that needs to be solved.

we need a way for administrators to see the history of loaded BPF
programs, to help investigating issues related to BPF.. and the
only BPF interface for this data is through perf ring buffer

jirka

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
