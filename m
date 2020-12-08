Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C0A032D1FA3
	for <lists+linux-audit@lfdr.de>; Tue,  8 Dec 2020 01:57:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607389038;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=j44T110tfLh+yEwD3qHKL/DypWIxKy9IHHB+3tDsLyY=;
	b=Y5lRSTvMHrmPmRMu6nJTF3v0ttpzlPsgTWB3akaOukQ+of3jdKvg8Zc2o18GsN6mqnH7sv
	Tmfc2FrJcxy2EfbsaCdT+VlyEYRcOaNauMt59oEOr/OjLBpVaYeOMIPAtzlBr8xYYVAQxR
	YgpepGCz//r+mgDbbxxsQEnNJMFEedE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-5hDc5iEHMHCnSY9vZifqTg-1; Mon, 07 Dec 2020 19:57:16 -0500
X-MC-Unique: 5hDc5iEHMHCnSY9vZifqTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1733180E461;
	Tue,  8 Dec 2020 00:57:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E776A1002393;
	Tue,  8 Dec 2020 00:57:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C4B1D180954D;
	Tue,  8 Dec 2020 00:56:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B80uowx011153 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 7 Dec 2020 19:56:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0814C5D9D0; Tue,  8 Dec 2020 00:56:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8EDE5D9C6;
	Tue,  8 Dec 2020 00:56:42 +0000 (UTC)
Date: Mon, 7 Dec 2020 19:56:40 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Lenny Bruzenak <lenny@magitekltd.com>
Subject: Re: lost events on boot
Message-ID: <20201208005640.GO986374@madcap2.tricolour.ca>
References: <d5da10fe-8a97-a43a-6178-827dfadbe574@magitekltd.com>
MIME-Version: 1.0
In-Reply-To: <d5da10fe-8a97-a43a-6178-827dfadbe574@magitekltd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: "Linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020-12-07 16:28, Lenny Bruzenak wrote:
> Apologies if this has been answered. I searched and found some
> relevant-looking dialog 2 years ago (on 12/14/2018) that Paul/RGB/Ondrej
> were discussing, however I do not see the answer.
> 
> I'm running userspace 2.8.5 , kernel 3.10.0-1160.
> 
> I have boot parameters "audit=1 ... audit_backlog_limit=8192" .
> 
> Immediately after boot, I use "auditctl -s and see hundreds (varies, between
> 119-330) of lost records.
> 
> 
> So I cleaned out all the audit data, rebooted again and examined the events.
> 
> They are numbered sequentially 1-515. I counted the events and they match
> (515).
> 
> 
> So my questions are these:
> 
>  * Is this "lost" value accurate?

Not entirely on that vintage of kernel.  It counted a lost message even
if it was later delivered via the audit_skb_hold_queue, IIRC.  Paul
re-did the queues to avoid this false report.  That change went into
v4.10-rc1:
	2016-12-14 c6480207fdf7 ("audit: rework the audit queue handling")
It was too disruptive to backport to the 3.10.0-xxx vintage kernel you
are running.

>  * If the numbering doesn't indicate any gaps, what does that tell me?

Messages that went through the hold queue, IIRC.

>    The kernel is supplying the serial number (right?), so is it
>    discarding the events without assigning a serial number?

Yes, the kernel assigns the serial numbers.  Sometimes.  Some buffers
never get allocated and therefore no serial number assigned due to full
queues or memory pressure.  Other buffers get dropped when queues are
full and there is no choice but to drop a message.  This is true before
and after Paul's queue re-write.

>  * Do I have something wrong with my kernel boot parameters?

Not likely.  From what you have described above it sounds like you have
done what you can.

> I'd have thought that 8k buffers would be enough, and certainly if I only
> have 515 events, should be. Unless, each record inside the event is adding.

If your kernel command line is larger than your lost count and your
serial number when you check it after boot, you should be in good shape.

> I also then counted each record, not just events, and got around 1600, so
> I'd have thought that even multi-record events would have fit. I guess that
> depends on the buffer size.

Good thinking, and you are correct.  That backlog limit may need to be
increased for more recent kernels since there are more events caught and
some events have more records.

> Appreciate the help in advance; thanks.

I hope this helps.

> LCB

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

