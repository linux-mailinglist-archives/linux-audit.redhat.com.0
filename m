Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 875D229785C
	for <lists+linux-audit@lfdr.de>; Fri, 23 Oct 2020 22:41:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603485680;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NtDYYQluPYKv3ELRNxkNww0oDsYWiUsHSWVZeUlW9A4=;
	b=glgJ3QmuT/sHxwJUAhMOkoruwdQw1cz4tkSdl0W17fVDylBBHw3ZsM6iIuMIObRJPXyhvu
	sY1kZyu1l8Fg6rbguI/coWnQ8+srOx5R75+AFimgtVN52Rg/nnsfM32eDa086rqwFpbymg
	1Mxjv0Y9FaSz8J3TAU4WD12XaozmzJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-3egnAkLYPIWCCIaZLUYbOw-1; Fri, 23 Oct 2020 16:41:18 -0400
X-MC-Unique: 3egnAkLYPIWCCIaZLUYbOw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED3B1107465C;
	Fri, 23 Oct 2020 20:41:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C06155B4B3;
	Fri, 23 Oct 2020 20:41:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 03C0192308;
	Fri, 23 Oct 2020 20:41:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09NKeplk024391 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 23 Oct 2020 16:40:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 43D6A9CBA5; Fri, 23 Oct 2020 20:40:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A971D614F5;
	Fri, 23 Oct 2020 20:40:36 +0000 (UTC)
Date: Fri, 23 Oct 2020 16:40:33 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V9 05/13] audit: log container info of syscalls
Message-ID: <20201023204033.GI2882171@madcap2.tricolour.ca>
References: <cover.1593198710.git.rgb@redhat.com>
	<6e2e10432e1400f747918eeb93bf45029de2aa6c.1593198710.git.rgb@redhat.com>
	<CAHC9VhSCm5eeBcyY8bBsnxr-hK4rkso9_NJHJec2OXLu4m5QTA@mail.gmail.com>
	<20200729194058.kcbsqjhzunjpipgm@madcap2.tricolour.ca>
	<CAHC9VhRUwCKBjffA_XNSjUwvUn8e6zfmy8WD203dK7R2KD0__g@mail.gmail.com>
	<20201002195231.GH2882171@madcap2.tricolour.ca>
	<20201021163926.GA3929765@madcap2.tricolour.ca>
	<CAHC9VhRb7XMyTrcrmzM3yQO+eLdO_r2+DOLKr9apDDeH4ua2Ew@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRb7XMyTrcrmzM3yQO+eLdO_r2+DOLKr9apDDeH4ua2Ew@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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

On 2020-10-22 21:21, Paul Moore wrote:
> On Wed, Oct 21, 2020 at 12:39 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > Here is an exmple I was able to generate after updating the testsuite
> > script to include a signalling example of a nested audit container
> > identifier:
> >
> > ----
> > type=PROCTITLE msg=audit(2020-10-21 10:31:16.655:6731) : proctitle=/usr/bin/perl -w containerid/test
> > type=CONTAINER_ID msg=audit(2020-10-21 10:31:16.655:6731) : contid=7129731255799087104^3333941723245477888
> > type=OBJ_PID msg=audit(2020-10-21 10:31:16.655:6731) : opid=115583 oauid=root ouid=root oses=1 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=perl
> > type=CONTAINER_ID msg=audit(2020-10-21 10:31:16.655:6731) : contid=3333941723245477888
> > type=OBJ_PID msg=audit(2020-10-21 10:31:16.655:6731) : opid=115580 oauid=root ouid=root oses=1 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=perl
> > type=CONTAINER_ID msg=audit(2020-10-21 10:31:16.655:6731) : contid=8098399240850112512^3333941723245477888
> > type=OBJ_PID msg=audit(2020-10-21 10:31:16.655:6731) : opid=115582 oauid=root ouid=root oses=1 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=perl
> > type=SYSCALL msg=audit(2020-10-21 10:31:16.655:6731) : arch=x86_64 syscall=kill success=yes exit=0 a0=0xfffe3c84 a1=SIGTERM a2=0x4d524554 a3=0x0 items=0 ppid=115564 pid=115567 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=ttyS0 ses=1 comm=perl exe=/usr/bin/perl subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=testsuite-1603290671-AcLtUulY
> > ----
> >
> > There are three CONTAINER_ID records which need some way of associating with OBJ_PID records.  An additional CONTAINER_ID record would be present if the killing process itself had an audit container identifier.  I think the most obvious way to connect them is with a pid= field in the CONTAINER_ID record.
> 
> Using a "pid=" field as a way to link CONTAINER_ID records to other
> records raises a few questions.  What happens if/when we need to
> represent those PIDs in the context of a namespace?  Are we ever going
> to need to link to records which don't have a "pid=" field?  I haven't
> done the homework to know if either of these are a concern right now,
> but I worry that this might become a problem in the future.

Good point about PID namespaces in the future but those accompanying
records will already have to be conditioned for the PID namespace
context that is requesting it, so I don't see this as a showstopper.

I've forgotten about an important one we already hit, which is a network
event that only has a NETFILTER_PKT record, but in that case, there is
no ambiguity since there are no other records associated with that
event.  So the second is already an issue now.  Using
task_tgid_nr(current), in the contid testsuite script network event it
attributed it to ping which caused the event, but we cannot use this
since it wasn't triggered by a syscall and doesn't accurately reflect
the kernel thread that received it.  It could just be set to zero for
network events.

> The idea of using something like "item=" is interesting.  As you
> mention, the "item=" field does present some overlap problems with the
> PATH record, but perhaps we can do something similar.  What if we
> added a "record=" (or similar, I'm not worried about names at this
> point) to each record, reset to 0/1 at the start of each event, and
> when we needed to link records somehow we could add a "related=1,..,N"
> field.  This would potentially be useful beyond just the audit
> container ID work.

Does it make any sense to use the same keyword in each type of record
such as record/records as in PATH/SYSCALL: item/items ?

(I prefer 0-indexed like item=...)

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

