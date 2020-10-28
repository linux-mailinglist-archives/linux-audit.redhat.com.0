Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5765429CCEE
	for <lists+linux-audit@lfdr.de>; Wed, 28 Oct 2020 02:35:52 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-cMl2X9qLP5yrthoEvdyZOQ-1; Tue, 27 Oct 2020 21:35:49 -0400
X-MC-Unique: cMl2X9qLP5yrthoEvdyZOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AA205720A;
	Wed, 28 Oct 2020 01:35:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7C5F55762;
	Wed, 28 Oct 2020 01:35:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D85BE181A86E;
	Wed, 28 Oct 2020 01:35:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09S1ZZt0028127 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 27 Oct 2020 21:35:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CA2152011569; Wed, 28 Oct 2020 01:35:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1AB4201156B
	for <linux-audit@redhat.com>; Wed, 28 Oct 2020 01:35:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B8498D6327
	for <linux-audit@redhat.com>; Wed, 28 Oct 2020 01:35:32 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-245-JIsTJ8eCM4-8D84xLw-FlA-1; Tue, 27 Oct 2020 21:35:30 -0400
X-MC-Unique: JIsTJ8eCM4-8D84xLw-FlA-1
Received: by mail-ej1-f65.google.com with SMTP id h24so4905397ejg.9
	for <linux-audit@redhat.com>; Tue, 27 Oct 2020 18:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=EhaQv7Xqn9C10/6kPilmFG/LY90YB69CHHSm/P4LmUk=;
	b=T90xNrXG2kT9fKuyraQWJxXak7ghWpiDYxx1PCwvpuFdcZ+3baGn2bnfVW2RewYoTI
	Yj8D0yaQtrg5HZwcFudoNKBYQ5pB0eddkRaaKwndYA6nI89/t17TDtNXjorljUTOgkzU
	YzyJeyDNRWFYzLt5Ro+WirzzhRLtVQZyxn+u03r1HYlhGgj14OXzmo3iLzXWJL+Ge85w
	+krIP1qKTGaIJJsFrc2JqSTbkS2gNGhJq648WDf+34AAyjv8/rAelsxip1jN0v7TJ2k2
	4Ch6nRSYZjX0i6oHcLX6S9CwYw2TxagFvJHWWmzL/TvfAK+RO1iTEDUZwTH01BYNTmih
	Cepw==
X-Gm-Message-State: AOAM533Yt5fCQeKDb/5ocVfz3SYoiKYvSbE2MjJ7vXDTA83d169YHLRW
	WMgo/2dNeOvaVDCVXXFvoHS71KiAlTZPygJEhKWi
X-Google-Smtp-Source: ABdhPJydImqf6rjIcFvdKoVKRijlUJM6c3tT5+zpyIh0DgksT/WwCUJmb9M0MAWnaqlVZBE1LbPiRD1v+2NmrHAlBa8=
X-Received: by 2002:a17:906:4811:: with SMTP id
	w17mr4982322ejq.431.1603848928683; 
	Tue, 27 Oct 2020 18:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<6e2e10432e1400f747918eeb93bf45029de2aa6c.1593198710.git.rgb@redhat.com>
	<CAHC9VhSCm5eeBcyY8bBsnxr-hK4rkso9_NJHJec2OXLu4m5QTA@mail.gmail.com>
	<20200729194058.kcbsqjhzunjpipgm@madcap2.tricolour.ca>
	<CAHC9VhRUwCKBjffA_XNSjUwvUn8e6zfmy8WD203dK7R2KD0__g@mail.gmail.com>
	<20201002195231.GH2882171@madcap2.tricolour.ca>
	<20201021163926.GA3929765@madcap2.tricolour.ca>
	<CAHC9VhRb7XMyTrcrmzM3yQO+eLdO_r2+DOLKr9apDDeH4ua2Ew@mail.gmail.com>
	<20201023204033.GI2882171@madcap2.tricolour.ca>
In-Reply-To: <20201023204033.GI2882171@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 27 Oct 2020 21:35:17 -0400
Message-ID: <CAHC9VhS7Gzd=pQ13eSOHDT8nO-z_yxsVW0E5r6mkpPYi3Txe2g@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 05/13] audit: log container info of syscalls
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09S1ZZt0028127
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 23, 2020 at 4:40 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-10-22 21:21, Paul Moore wrote:
> > On Wed, Oct 21, 2020 at 12:39 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > Here is an exmple I was able to generate after updating the testsuite
> > > script to include a signalling example of a nested audit container
> > > identifier:
> > >
> > > ----
> > > type=PROCTITLE msg=audit(2020-10-21 10:31:16.655:6731) : proctitle=/usr/bin/perl -w containerid/test
> > > type=CONTAINER_ID msg=audit(2020-10-21 10:31:16.655:6731) : contid=7129731255799087104^3333941723245477888
> > > type=OBJ_PID msg=audit(2020-10-21 10:31:16.655:6731) : opid=115583 oauid=root ouid=root oses=1 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=perl
> > > type=CONTAINER_ID msg=audit(2020-10-21 10:31:16.655:6731) : contid=3333941723245477888
> > > type=OBJ_PID msg=audit(2020-10-21 10:31:16.655:6731) : opid=115580 oauid=root ouid=root oses=1 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=perl
> > > type=CONTAINER_ID msg=audit(2020-10-21 10:31:16.655:6731) : contid=8098399240850112512^3333941723245477888
> > > type=OBJ_PID msg=audit(2020-10-21 10:31:16.655:6731) : opid=115582 oauid=root ouid=root oses=1 obj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 ocomm=perl
> > > type=SYSCALL msg=audit(2020-10-21 10:31:16.655:6731) : arch=x86_64 syscall=kill success=yes exit=0 a0=0xfffe3c84 a1=SIGTERM a2=0x4d524554 a3=0x0 items=0 ppid=115564 pid=115567 auid=root uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=ttyS0 ses=1 comm=perl exe=/usr/bin/perl subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=testsuite-1603290671-AcLtUulY
> > > ----
> > >
> > > There are three CONTAINER_ID records which need some way of associating with OBJ_PID records.  An additional CONTAINER_ID record would be present if the killing process itself had an audit container identifier.  I think the most obvious way to connect them is with a pid= field in the CONTAINER_ID record.
> >
> > Using a "pid=" field as a way to link CONTAINER_ID records to other
> > records raises a few questions.  What happens if/when we need to
> > represent those PIDs in the context of a namespace?  Are we ever going
> > to need to link to records which don't have a "pid=" field?  I haven't
> > done the homework to know if either of these are a concern right now,
> > but I worry that this might become a problem in the future.
>
> Good point about PID namespaces in the future but those accompanying
> records will already have to be conditioned for the PID namespace
> context that is requesting it, so I don't see this as a showstopper.

Possibly, it just gets very messy.  Doubly so when you start looking
at potentially adjusting for multiple audit daemons.  Thankfully it
doesn't look like using the PID is a good idea for other reasons.

> I've forgotten about an important one we already hit, which is a network
> event that only has a NETFILTER_PKT record, but in that case, there is
> no ambiguity since there are no other records associated with that
> event.  So the second is already an issue now.  Using
> task_tgid_nr(current), in the contid testsuite script network event it
> attributed it to ping which caused the event, but we cannot use this
> since it wasn't triggered by a syscall and doesn't accurately reflect
> the kernel thread that received it.  It could just be set to zero for
> network events.

Possibly.  It just seems like too much hackery to start; that's the
stuff you do once it has been in a kernel release for years and need
to find a workaround that doesn't break everything.  I think we should
aim a bit higher right now.

> > The idea of using something like "item=" is interesting.  As you
> > mention, the "item=" field does present some overlap problems with the
> > PATH record, but perhaps we can do something similar.  What if we
> > added a "record=" (or similar, I'm not worried about names at this
> > point) to each record, reset to 0/1 at the start of each event, and
> > when we needed to link records somehow we could add a "related=1,..,N"
> > field.  This would potentially be useful beyond just the audit
> > container ID work.
>
> Does it make any sense to use the same keyword in each type of record
> such as record/records as in PATH/SYSCALL: item/items ?

That was mentioned above, if you can assure yourself and the rest of
us that it can be safely reused I think that might be okay, but I'm
not convinced that is safe at the moment.  Although I will admit those
are fears are not based on an exhaustive search through the code (or a
determined "think").

> (I prefer 0-indexed like item=...)

I have no preference on where we start the index, but it makes sense
to keep the same index starting point as the PATH records.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

