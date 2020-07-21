Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3BF2283BC
	for <lists+linux-audit@lfdr.de>; Tue, 21 Jul 2020 17:27:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-8Izxf5yEPWendFcvOxqSEw-1; Tue, 21 Jul 2020 11:27:24 -0400
X-MC-Unique: 8Izxf5yEPWendFcvOxqSEw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFD7780183C;
	Tue, 21 Jul 2020 15:27:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3717A2E021;
	Tue, 21 Jul 2020 15:27:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E8DCD1809557;
	Tue, 21 Jul 2020 15:27:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06LFRB7E027425 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 11:27:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 18DDD10BFD8B; Tue, 21 Jul 2020 15:27:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4D1010C153F
	for <linux-audit@redhat.com>; Tue, 21 Jul 2020 15:27:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA93F101244A
	for <linux-audit@redhat.com>; Tue, 21 Jul 2020 15:27:08 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-16-FVvh26GFPpyf9lSEf5TQNg-1; Tue, 21 Jul 2020 11:27:06 -0400
X-MC-Unique: FVvh26GFPpyf9lSEf5TQNg-1
Received: by mail-ed1-f67.google.com with SMTP id z17so15583345edr.9
	for <linux-audit@redhat.com>; Tue, 21 Jul 2020 08:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3mvvZHVrcMrlNfUmkr+LaK7EaIrVMr0vDusHqYivl0o=;
	b=Su/k3absHDrxbgeMTJDh164HP+KtAdWqWMkPckX1PQG/aZ1LH+/OflvVWBBJSmUxZ+
	EUVj2y9lEZVlr3OCjSpac2DgPa9zOeU4lMFdeW3W41mqw78rQ3RmZ4Orsl/IQ6lZ8NlJ
	89Xib/oXnIOt42l8Y0/9LYgBanwMVzrCI/ucsew+X1DB5aHMeykuD5BECQ6hVKZiA8h/
	NNMoULX/Ocg1V8V3qUneu4U7Jq53D6fG+ncfXIvAzml+H17FLNeuCLCekUMsaH7TydQD
	BaTPh4IputJNVHGKt9qJHeVF949G6+MY2vOJTK3+7sz4HJ7kkTYoGmJGn7tHqezYgnGe
	HTfA==
X-Gm-Message-State: AOAM533emcac+JIvFLmUfDevBCJP0arIlkFvn0o0vLtrATQ5y9+2nULn
	S5pRCpAXIKhHbavkfeAjcWsugLgVDh/8bjbs/qBV
X-Google-Smtp-Source: ABdhPJymqNwzogyLAAKYRgaMeGtNBfstMDuZwXlmHERFYVuCJtqOoISROxpkjDnurUfDAbxPT626dJOrMfELs9Uv/gM=
X-Received: by 2002:a05:6402:13d0:: with SMTP id
	a16mr26299965edx.269.1595345224486; 
	Tue, 21 Jul 2020 08:27:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200704151526.GA62112@linux-kernel-dev>
	<CAHC9VhTObG-=cbASnXwXiyM-1CCJXZ-4YGFCHozSVBn4Qjp=MQ@mail.gmail.com>
	<CAHC9VhQNpAeUKtDZJ7+Unq=NeHNc4Wjxo9E1d4m8P6STm+5+3w@mail.gmail.com>
In-Reply-To: <CAHC9VhQNpAeUKtDZJ7+Unq=NeHNc4Wjxo9E1d4m8P6STm+5+3w@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 21 Jul 2020 11:26:53 -0400
Message-ID: <CAHC9VhQ_JjYJxP6t74bbeBvf5g0TGJZMfLtq0y0aia8y+Dm4fQ@mail.gmail.com>
Subject: Re: [PATCH v3] audit: report audit wait metric in audit status reply
To: Max Englander <max.englander@gmail.com>, sgrubb@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 15, 2020 at 9:30 PM Paul Moore <paul@paul-moore.com> wrote:
> On Wed, Jul 8, 2020 at 7:13 PM Paul Moore <paul@paul-moore.com> wrote:
> > On Sat, Jul 4, 2020 at 11:15 AM Max Englander <max.englander@gmail.com> wrote:
> > >
> > > In environments where the preservation of audit events and predictable
> > > usage of system memory are prioritized, admins may use a combination of
> > > --backlog_wait_time and -b options at the risk of degraded performance
> > > resulting from backlog waiting. In some cases, this risk may be
> > > preferred to lost events or unbounded memory usage. Ideally, this risk
> > > can be mitigated by making adjustments when backlog waiting is detected.
> > >
> > > However, detection can be difficult using the currently available
> > > metrics. For example, an admin attempting to debug degraded performance
> > > may falsely believe a full backlog indicates backlog waiting. It may
> > > turn out the backlog frequently fills up but drains quickly.
> > >
> > > To make it easier to reliably track degraded performance to backlog
> > > waiting, this patch makes the following changes:
> > >
> > > Add a new field backlog_wait_time_total to the audit status reply.
> > > Initialize this field to zero. Add to this field the total time spent
> > > by the current task on scheduled timeouts while the backlog limit is
> > > exceeded. Reset field to zero upon request via AUDIT_SET.
> > >
> > > Tested on Ubuntu 18.04 using complementary changes to the
> > > audit-userspace and audit-testsuite:
> > > - https://github.com/linux-audit/audit-userspace/pull/134
> > > - https://github.com/linux-audit/audit-testsuite/pull/97
> > >
> > > Signed-off-by: Max Englander <max.englander@gmail.com>
> > > ---
> > > Patch changelogs between v1 and v2:
> > >   - Instead of printing a warning when backlog waiting occurs, add
> > >     duration of backlog waiting to cumulative sum, and report this
> > >     sum in audit status reply.
> > >
> > > Patch changelogs between v2 and v3:
> > >  - Rename backlog_wait_sum to backlog_wait_time_actual.
> > >  - Drop unneeded and unwanted header flags
> > >    AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_SUM and
> > >    AUDIT_VERSION_BACKLOG_WAIT_SUM.
> > >  - Increment backlog_wait_time_actual counter after every call to
> > >    schedule_timeout rather than once after enqueuing (or losing) an
> > >    audit record.
> > >  - Add support for resetting backlog_wait_time_actual counter to zero
> > >    upon request via AUDIT_SET.
> > >
> > >  include/uapi/linux/audit.h | 18 +++++++++++-------
> > >  kernel/audit.c             | 35 +++++++++++++++++++++++++----------
> > >  2 files changed, 36 insertions(+), 17 deletions(-)
> >
> > This looks okay to me, thanks for the fixes Max.
> >
> > Steve, does the associated userspace patch look okay to you?
>
> Steve, any comments on the userspace patch?  Did I miss a reply in my
> inbox perhaps?
>
> If I don't see any feedback by the end of the week I'll plan on
> merging this into audit/next.

It's been over two weeks with no comment, so I went ahead and merged
this into audit/next.  Thanks for your patience Max!

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

