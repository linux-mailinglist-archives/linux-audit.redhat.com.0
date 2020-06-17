Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BA9CE1FD750
	for <lists+linux-audit@lfdr.de>; Wed, 17 Jun 2020 23:33:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592429626;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uPSCyaP9HvECzmEXe1kP3ykybpTRus6mC7PqsMmoJAo=;
	b=UONyQHE+KDZocXQYL2gRWBCUoSmlDTslwOBl4ECgsChjADTYvccQcBVlSlWQbSZ3do7baq
	cu/L1FkKY5Sy28qT7jP+gHR91Ft0x3/VOgvQ3QcusgHJZpdgjP8B4PQS/LetzwgdxGO2yt
	Tr95ZYPWOxiGep1JPwbUow933K1DkVg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-6c5jNI1GOLucTf6YMQtQQQ-1; Wed, 17 Jun 2020 17:33:44 -0400
X-MC-Unique: 6c5jNI1GOLucTf6YMQtQQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73B3318FE863;
	Wed, 17 Jun 2020 21:33:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 394FD7C375;
	Wed, 17 Jun 2020 21:33:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DD7A833CD;
	Wed, 17 Jun 2020 21:33:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05HLXUJZ006135 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 17:33:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 612411007A38; Wed, 17 Jun 2020 21:33:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CBF11007394
	for <linux-audit@redhat.com>; Wed, 17 Jun 2020 21:33:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 567768007D1
	for <linux-audit@redhat.com>; Wed, 17 Jun 2020 21:33:28 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-211-qF16vu1DMSi3lus1BfftWQ-1; Wed, 17 Jun 2020 17:33:25 -0400
X-MC-Unique: qF16vu1DMSi3lus1BfftWQ-1
Received: by mail-ej1-f66.google.com with SMTP id gl26so4150549ejb.11
	for <linux-audit@redhat.com>; Wed, 17 Jun 2020 14:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=082ZDcJ58JiAJ5FQwZhCB4u9ixr0nyVZnt4fYABIR84=;
	b=mggddi9LC8VMvIfAo8ponSjBr1Q9+cS59FPH8p+Jf5Q0zHCdBNTvKAAFIIvLLRSKNG
	P8McfpX7Bo5OCOPrP9JvZQnNx0oB1LnCtbOSrVM6NP+1nYKh7d3vc6YYVcnKNLn+Kqv8
	F53CWJzUyHEKZ/dCQ/A8r73vy/WbZbsK68tq1uhVZOX9hC0xsgJpiitmku4rWE3Zr5OW
	1WnPQ2ssoDyrbgUB1jWRmobOcF0u32ZeDFfTTz3AbbnD9hvP/eaIeCJuuDig1Q1IG/Ie
	KbV1As4exx3z/NK4iAx4jCOw5B7G9cmeU00/npATGrjhC6y2NDp8LQ6a2bxKxBkZgwM9
	pWOA==
X-Gm-Message-State: AOAM530YkoQGBWmO137LoMp/h0TBZRApAA9qvnQKwV0ILUwvgSzpEOCW
	KnZ5EMU7+rhC5qQ9SSDh0v7zIKcCLwxuZdWOXc9G
X-Google-Smtp-Source: ABdhPJwGl2Yew0IZrhIcRIB+PA6D6jtLPBcAXq287JWVLoatXUiRC+F29j9ZkG+eUUYXUmHK2aSjHOoPf26wthrPENk=
X-Received: by 2002:a17:906:434f:: with SMTP id
	z15mr1080529ejm.178.1592429604473; 
	Wed, 17 Jun 2020 14:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200330134705.jlrkoiqpgjh3rvoh@madcap2.tricolour.ca>
	<CAHC9VhQTsEMcYAF1CSHrrVn07DR450W9j6sFVfKAQZ0VpheOfw@mail.gmail.com>
	<20200330162156.mzh2tsnovngudlx2@madcap2.tricolour.ca>
	<CAHC9VhTRzZXJ6yUFL+xZWHNWZFTyiizBK12ntrcSwmgmySbkWw@mail.gmail.com>
	<20200330174937.xalrsiev7q3yxsx2@madcap2.tricolour.ca>
	<CAHC9VhR_bKSHDn2WAUgkquu+COwZUanc0RV3GRjMDvpoJ5krjQ@mail.gmail.com>
	<871ronf9x2.fsf@x220.int.ebiederm.org>
	<CAHC9VhR3gbmj5+5MY-whLtStKqDEHgvMRigU9hW0X1kpxF91ag@mail.gmail.com>
	<871rol7nw3.fsf@x220.int.ebiederm.org>
	<CAHC9VhQvhja=vUEbT3uJgQqpj-480HZzWV7b5oc2GWtzFN1qJw@mail.gmail.com>
	<20200608180330.z23hohfa2nclhxf5@madcap2.tricolour.ca>
In-Reply-To: <20200608180330.z23hohfa2nclhxf5@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 17 Jun 2020 17:33:13 -0400
Message-ID: <CAHC9VhQExpNcK-7H+tZg5ouCVts=YmnNiXrgk-ZYenj_zrr1GQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	linux-audit@redhat.com, netfilter-devel@vger.kernel.org,
	"Eric W. Biederman" <ebiederm@xmission.com>, simo@redhat.com,
	netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 8, 2020 at 2:04 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-04-22 13:24, Paul Moore wrote:
> > On Fri, Apr 17, 2020 at 6:26 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
> > > Paul Moore <paul@paul-moore.com> writes:
> > > > On Thu, Apr 16, 2020 at 4:36 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
> > > >> Paul Moore <paul@paul-moore.com> writes:
> > > >> > On Mon, Mar 30, 2020 at 1:49 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > >> >> On 2020-03-30 13:34, Paul Moore wrote:
> > > >> >> > On Mon, Mar 30, 2020 at 12:22 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > >> >> > > On 2020-03-30 10:26, Paul Moore wrote:
> > > >> >> > > > On Mon, Mar 30, 2020 at 9:47 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > >> >> > > > > On 2020-03-28 23:11, Paul Moore wrote:
> > > >> >> > > > > > On Tue, Mar 24, 2020 at 5:02 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > >> >> > > > > > > On 2020-03-23 20:16, Paul Moore wrote:
> > > >> >> > > > > > > > On Thu, Mar 19, 2020 at 6:03 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > >> >> > > > > > > > > On 2020-03-18 18:06, Paul Moore wrote:
> > > >> >
> > > >> > ...
> > > >> >
> > > >> >> > > Well, every time a record gets generated, *any* record gets generated,
> > > >> >> > > we'll need to check for which audit daemons this record is in scope and
> > > >> >> > > generate a different one for each depending on the content and whether
> > > >> >> > > or not the content is influenced by the scope.
> > > >> >> >
> > > >> >> > That's the problem right there - we don't want to have to generate a
> > > >> >> > unique record for *each* auditd on *every* record.  That is a recipe
> > > >> >> > for disaster.
> > > >> >> >
> > > >> >> > Solving this for all of the known audit records is not something we
> > > >> >> > need to worry about in depth at the moment (although giving it some
> > > >> >> > casual thought is not a bad thing), but solving this for the audit
> > > >> >> > container ID information *is* something we need to worry about right
> > > >> >> > now.
> > > >> >>
> > > >> >> If you think that a different nested contid value string per daemon is
> > > >> >> not acceptable, then we are back to issuing a record that has only *one*
> > > >> >> contid listed without any nesting information.  This brings us back to
> > > >> >> the original problem of keeping *all* audit log history since the boot
> > > >> >> of the machine to be able to track the nesting of any particular contid.
> > > >> >
> > > >> > I'm not ruling anything out, except for the "let's just completely
> > > >> > regenerate every record for each auditd instance".
> > > >>
> > > >> Paul I am a bit confused about what you are referring to when you say
> > > >> regenerate every record.
> > > >>
> > > >> Are you saying that you don't want to repeat the sequence:
> > > >>         audit_log_start(...);
> > > >>         audit_log_format(...);
> > > >>         audit_log_end(...);
> > > >> for every nested audit daemon?
> > > >
> > > > If it can be avoided yes.  Audit performance is already not-awesome,
> > > > this would make it even worse.
> > >
> > > As far as I can see not repeating sequences like that is fundamental
> > > for making this work at all.  Just because only the audit subsystem
> > > should know about one or multiple audit daemons.  Nothing else should
> > > care.
> >
> > Yes, exactly, this has been mentioned in the past.  Both the
> > performance hit and the code complication in the caller are things we
> > must avoid.
> >
> > > >> Or are you saying that you would like to literraly want to send the same
> > > >> skb to each of the nested audit daemons?
> > > >
> > > > Ideally we would reuse the generated audit messages as much as
> > > > possible.  Less work is better.  That's really my main concern here,
> > > > let's make sure we aren't going to totally tank performance when we
> > > > have a bunch of nested audit daemons.
> > >
> > > So I think there are two parts of this answer.  Assuming we are talking
> > > about nesting audit daemons in containers we will have different
> > > rulesets and I expect most of the events for a nested audit daemon won't
> > > be of interest to the outer audit daemon.
> >
> > Yes, this is another thing that Richard and I have discussed in the
> > past.  We will basically need to create per-daemon queues, rules,
> > tracking state, etc.; that is easy enough.  What will be slightly more
> > tricky is the part where we apply the filters to the individual
> > records and decide if that record is valid/desired for a given daemon.
> > I think it can be done without too much pain, and any changes to the
> > callers, but it will require a bit of work to make sure it is done
> > well and that records are needlessly duplicated in the kernel.
> >
> > > Beyond that it should be very straight forward to keep a pointer and
> > > leave the buffer as a scatter gather list until audit_log_end
> > > and translate pids, and rewrite ACIDs attributes in audit_log_end
> > > when we build the final packet.  Either through collaboration with
> > > audit_log_format or a special audit_log command that carefully sets
> > > up the handful of things that need that information.
> >
> > In order to maximize record re-use I think we will want to hold off on
> > assembling the final packet until it is sent to the daemons in the
> > kauditd thread.  We'll also likely need to create special
> > audit_log_XXX functions to capture fields which we know will need
> > translation, e.g. ACID information.  (the reason for the new
> > audit_log_XXX functions would be to mark the new sg element and ensure
> > the buffer is handled correctly)
> >
> > Regardless of the details, I think the scatter gather approach is the
> > key here - that seems like the best design idea I've seen thus far.
> > It enables us to replace portions of the record as needed ... and
> > possibly use the existing skb cow stuff ... it has been a while, but
> > does the skb cow functions handle scatter gather skbs or do they need
> > to be linear?
>
> How does the selection of this data management technique affect our
> choice of field format?

I'm not sure it affects the record string, but it might affect the
in-kernel API as we would likely want to have a special function for
logging the audit container ID that does the scatter-gather management
for the record.  There might also need to be some changes to how we
allocate the records.

However, since you're the one working on these patches I would expect
you to be the one to look into how this would work and what the
impacts might be to the code, record format, etc.

> Does this lock the field value to a fixed length?

I wouldn't think so.  In fact if it did it wouldn't really be a good solution.

Once again, this is something I would expect you to look into.

> Does the use of scatter/gather techniques or structures allow
> the use of different lengths of data for each destination (auditd)?

This is related to the above ... but yes, the reason why Eric and I
were discussing a scatter/gather approach is that it would presumably
allow one to break the single record string into pieces which could be
managed and manipulated much easier than the monolithic record string.

> I could see different target audit daemons triggering or switching to a
> different chunk of data and length.  This does raise a concern related
> to the previous sig_info2 discussion that the struct contobj that exists
> at the time of audit_log_exit called could have been reaped by the time
> the buffer is pulled from the queue for transmission to auditd, but we
> could hold a reference to it as is done for sig_info2.

Yes.

> Looking through the kernel scatter/gather possibilities, I see struct
> iovec which is used by the readv/writev/preadv/pwritev syscalls, but I'm
> understanding that this is a kernel implementation that will be not
> visible to user space.  So would the struct scatterlist be the right
> choice?

It has been so long since I've looked at the scatter-gather code that
I can't really say with any confidence at this point.  All I can say
is that the scatter-gather code really should just be an
implementation detail in the kernel and should not be visible to
userspace; userspace should get the same awful, improperly generated
netlink message it always has received from the kernel ;)

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

