Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F0CEA2FC159
	for <lists+linux-audit@lfdr.de>; Tue, 19 Jan 2021 21:43:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611089021;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/0LkXCnEBI6UI0GmqRKa6aTVXbfBsVNu1FVLtHKvMug=;
	b=F/yyVsZ5szIzwSsB4MBqEuitD6E06f3mPOBxS82kgcx7IgL6J0CKo/lnSSz0pjtzWM2qt9
	jI88gtPD4J55mrEWfFN33FVy+aO6OF6AD1fyW6NZO6ZMfI42CNBZw+nsrxakZptL3gQX4T
	5j3UvMHYFMAT1ioqbIRuJ8hjmrOSpAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-GLgEvjZkNQef_2wIXl1ICw-1; Tue, 19 Jan 2021 15:43:38 -0500
X-MC-Unique: GLgEvjZkNQef_2wIXl1ICw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43B5A107ACE8;
	Tue, 19 Jan 2021 20:43:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9F6D19CB0;
	Tue, 19 Jan 2021 20:43:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D33304BB7B;
	Tue, 19 Jan 2021 20:43:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10JKh5w6029126 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 15:43:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 294CE10016FF; Tue, 19 Jan 2021 20:43:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2163710074E1;
	Tue, 19 Jan 2021 20:42:57 +0000 (UTC)
Date: Tue, 19 Jan 2021 15:42:55 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: Occasional delayed output of events
Message-ID: <20210119204255.GC1762914@madcap2.tricolour.ca>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<5445873.DvuYhMxLoT@x2>
	<17715c36170.27df.85c95baa4474aabc7814e68940a78392@paul-moore.com>
	<3095712.44csPzL39Z@x2>
	<CAHC9VhT_yd=zEusQga507jA43S_stCb2kAmd_sN6fLNcdLDdWg@mail.gmail.com>
	<9a7ed1203fa7ec67000aa68281a215354c2ed5f5.camel@iinet.net.au>
	<CAHC9VhRNcFappgO1eb40wbtjtzZe1b5RRV6ogN563QTOubwvOA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRNcFappgO1eb40wbtjtzZe1b5RRV6ogN563QTOubwvOA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: Linux Audit <linux-audit@redhat.com>
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2021-01-19 14:11, Paul Moore wrote:
> On Tue, Jan 19, 2021 at 3:18 AM Burn Alting <burn.alting@iinet.net.au> wrote:
> > I tend to have a rigorous auditing posture (see the rules loaded in https://github.com/linux-audit/audit-userspace/issues/148) which is not normal for most. Perhaps, Paul, you have hit the nail on the head by stating that this 'severe delay' is not that unreasonable given my rules posture and we just need to 'deal with it' in user space.
> > We still get the event data, I just need to adjust the user space tools to deal with this occurrence.
> > As for what the system is doing, in my home case it's a Centos 7 VM running a tomcat service which only gets busy every 20 minutes and the other is a HPE Z800 running Centos 8 with 4-5 VM's mostly dormant. I can put any code in these hosts to assist in 'validating'/testing the delay. Advise and I will run.
> 
> I took a (slightly) closer look at the queuing code just now and the
> corner case I suspected doesn't look very promising here.  On failure
> to send a record to userspace, the record is put back at the front of
> the queue to preserve ordering so the kernel *should* still emit
> records in order even when auditd is under pressure, dead, or in the
> process of a restart.  Also, in this case the kernel kicks the auditd
> connection, disconnecting auditd's netlink socket; I imagine that
> would be a notable event on your systems.
> 
> However, looking at the timestamps in the audit events you posted, I
> noticed something a little odd.  If I align the timestamps a bit
> better let's see if it jumps out at you guys ...
> 
> type=XXX msg=audit(1609519900.159:44606): ...
> type=XXX msg=audit(1609519900.161:44607): ...
> type=XXX msg=audit(1609519900.163:44608): ...
> type=XXX msg=audit(1609519896.829:44609): ...
> type=XXX msg=audit(1609519900.170:44610): ...
> 
> Let me guess Burn, you're running NTP/PTP :)  I'm not sure how auditd
> handles things like this, but it looks like there was a small negative
> time correction between events which caused the odd scenario where
> event N+1 actually occurred before event N according to the wall
> clock.  In other words, your system is time traveling ;)

Interesting...

The timestamp is assigned on syscall entry.
The serial number is assigned on the creation of the first audit record of an event.

>From these timings above, NTP/PTP could explain this, but the third and
fifth are too close together to make that likely, I think.

I'd blame time namespaces, but the host system is all in the same time
namespace.

I think I'd need to see a larger sequence to be convinced of this...

> paul moore

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

