Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4D22FBFC1
	for <lists+linux-audit@lfdr.de>; Tue, 19 Jan 2021 20:15:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611083744;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Rs5IQMqX52EDV0K3ntHiSvxaYjeKtMTAB1JZJsO6MjA=;
	b=T9fGytGkLDOU7pVflN2mEhciHeVUgis7zsz+9w8rQt0KHfqo29+ZW4bcnRvbcBSo6VsG5v
	5u6/N+fyxcOYgsQz2g+ND2HNQMz4jJn7J7vIKoZujGLoW7viSOfYFUCvcphJDizLIYHQiN
	G+lHt8oxl879hs0BEjhFChmYWwNqF1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-kn3mn5OiN4W4zGQYVSvfUg-1; Tue, 19 Jan 2021 14:15:41 -0500
X-MC-Unique: kn3mn5OiN4W4zGQYVSvfUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 943FB1081B29;
	Tue, 19 Jan 2021 19:15:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC14219EF2;
	Tue, 19 Jan 2021 19:15:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 326AD4BB7B;
	Tue, 19 Jan 2021 19:15:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10JJFAuc019168 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 14:15:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 606271B058; Tue, 19 Jan 2021 19:15:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-90.rdu2.redhat.com [10.10.116.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 06DA8177F8;
	Tue, 19 Jan 2021 19:15:06 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
	Joe Wulf <joe_wulf@yahoo.com>
Subject: Re: AuditRule Questions
Date: Tue, 19 Jan 2021 14:15:06 -0500
Message-ID: <3523142.MHq7AAxBmi@x2>
Organization: Red Hat
In-Reply-To: <2025971311.1108480.1611079916924@mail.yahoo.com>
References: <61239576.993577.1611062133080.ref@mail.yahoo.com>
	<2759467.e9J7NaK4W3@x2>
	<2025971311.1108480.1611079916924@mail.yahoo.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, January 19, 2021 1:11:56 PM EST Joe Wulf wrote:
>  Steve,
> 
> On Tuesday, January 19, 2021, 11:57:03 AM EST, Steve Grubb 
<sgrubb@redhat.com> wrote:
>  > On Tuesday, January 19, 2021 8:15:33 AM EST Joe Wulf wrote:
> > > 1. In audit rules 2.8.5 (front portion of the rules):> > > > ##
> > > Unsuccessful file access (any other opens) This has to go last.> > -a
> > > always,exit -F arch=b32 -S> >
> > > open,creat,truncate,ftruncate,openat,open_by_handle_at -F
> > > exit=-EACCES-a> > always,exit -F arch=b64 -S> >
> > > open,creat,truncate,ftruncate,openat,open_by_handle_at -F
> > > exit=-EACCES-a> > always,exit -F arch=b32 -S> >
> > > open,creat,truncate,ftruncate,openat,open_by_handle_at -F
> > > exit=-EPERM-a> > always,exit -F arch=b64 -S> >
> > > open,creat,truncate,ftruncate,openat,open_by_handle_at  -F
> > > exit=-EPERM> > Whereas in audit rules 3.0, the same portion of the
> > > same rules looks like:> > -a always,exit -F arch=b32 -S> >
> > > open,creat,truncate,ftruncate,openat,open_by_handle_at -F
> > > exit=-EACCES-a> > always,exit -F arch=b32 -S> >
> > > open,creat,truncate,ftruncate,openat,open_by_handle_at -F
> > > exit=-EPERM-a> > always,exit -F arch=b64 -S> >
> > > open,truncate,ftruncate,creat,openat,open_by_handle_at -F
> > > exit=-EACCES-a> > always,exit -F arch=b64 -S> >
> > > open,truncate,ftruncate,creat,openat,open_by_handle_at  -F
> > > exit=-EPERM> > > > The ordering of the syscalls differs between the
> > > two, as well as the> > sequential order of the rules themselves. I
> > > better understand that the> > first audit-rule matched 'wins'.- 
> > > Please help me understand the reason> > for the change in sequence,
> > > but also for the change in the order of the> > syscalls (i.e. between
> > > 2.8.5 and 3.0).> > There were several 3.0 alpha releases. I'm not sure
> > > which one you are calling > 3.0. Because I can't find an exact match.
> > > Based on the text above, I do not > see the syscall ordering changed
> > > at all. The only thing that I see is in > 2.8.5 they are grouped by
> > > exit code whereas 3.0 is grouped by arch. Since > this group of rules
> > > all have the same key, they are working as a team. That > means that
> > > what matters is the placement of this group of rules relative to >
> > > other groups of rules is what matters. In both cases a syscall can
> > > ever only > match one of them - the exit code either is or isn't
> > > EPERM, it either is or > isn't b32.>> 
> > <snip>>
> > -Steve
> 
> Steve,
> Thank you for the wealth of feedback.  All very useful.  Thank you.
> I pulled v3.0 of the audit rules out of RHEL 8.3.
> In the sections I referenced, for v2.8.5 the syscalls for b64 are in the
> order of:open,create,truncate,ftruncate ..... in v3.0, they are in the
> order of:open,truncate,ftruncate,create .... Since, as you say above, the
> audit rule can only ever match one syscal.... I'm now understanding the
> actual order of the syscall's is no longer relevant on such lines (from an
> auditing perspective)? 

In the kernel, the syscalls in each rule go into a large bitmask so that all 
can be checked quickly. Ordering within a rule doesn't matter for syscalls. 
Otherwise, fields are checked sequentially from left to right. So, things that 
may be false most of the time should be located more to the left for better 
performance.

> In general for a any given system being run and
> audited by either set of rules, the end result I suspect would be the
> same.The challenge could come in when certain vulnerability tools assess
> the system, and do so by seeking an exact match of rule syntax.

That is a challenge. That is what drove splitting up the ospp rules into 
individual files.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

