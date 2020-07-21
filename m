Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 49642228C80
	for <lists+linux-audit@lfdr.de>; Wed, 22 Jul 2020 01:11:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-ZrfUj09WMDC3pBdidtXW7A-1; Tue, 21 Jul 2020 19:11:40 -0400
X-MC-Unique: ZrfUj09WMDC3pBdidtXW7A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B219F1005504;
	Tue, 21 Jul 2020 23:11:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C7EA2C26B;
	Tue, 21 Jul 2020 23:11:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 301A41809554;
	Tue, 21 Jul 2020 23:11:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06LMxnfp022053 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 18:59:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F2DC11E68C; Tue, 21 Jul 2020 22:59:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AB7111E682
	for <linux-audit@redhat.com>; Tue, 21 Jul 2020 22:59:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 017521012443
	for <linux-audit@redhat.com>; Tue, 21 Jul 2020 22:59:47 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-64-wku61_CDN6uhHV3_3RqVDg-1; Tue, 21 Jul 2020 18:59:42 -0400
X-MC-Unique: wku61_CDN6uhHV3_3RqVDg-1
Received: by mail-qk1-f196.google.com with SMTP id l23so314632qkk.0;
	Tue, 21 Jul 2020 15:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=V3MnTXuTXgpTBFbNw0+JhgtbLC0BsWQSIIzIJ6nYm+E=;
	b=APDVxF5k57m3My5T4XtgCL5R9NPc0fS5j+JFdcTySMUpT8NongtvF6Bq0tJb7XcknC
	Kvt3xaVQ1Knhn98YNdQKEVKzuvCuGfCyjxSYgoTR4yLEE0vdoNzBhZhgB4zLe6u3LTbL
	pm9aaUociHhGAGB9f2noGoePK+4hNCtc6aM59HN+jukf+UELI4EZrZRtW6ERmCrGfZeW
	jqKiCxrAOwzM/N+HllKHZt9TVz93Lub0x0PEMdPUmIazSdyu9udA6OC4tcvgNT2TZk3A
	61bp9HNoJjPnjFdrPF5Wwc3GLOMabCIBznHk/RIcSVKyX+53uW1sMpD5rn/v0VhtVGye
	YW2A==
X-Gm-Message-State: AOAM530BxwE+0SAdMSV8bJizvCIoo3PElUq2R6nIjsSXBXXSCMxEhJzg
	Bvvknt36Bhvj6gKHvig29ppDbcQGYzs=
X-Google-Smtp-Source: ABdhPJyPOBeLzq25AJi7v4R1iu2OUDX55zZMF/91kTSm4wki8Wj6pALJiwXySDMLiCO+/ayUtqinAw==
X-Received: by 2002:a37:4641:: with SMTP id t62mr16079652qka.25.1595372381611; 
	Tue, 21 Jul 2020 15:59:41 -0700 (PDT)
Received: from linux-kernel-dev (ool-182c9054.dyn.optonline.net.
	[24.44.144.84]) by smtp.gmail.com with ESMTPSA id
	z36sm23999378qtd.22.2020.07.21.15.59.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jul 2020 15:59:40 -0700 (PDT)
Date: Tue, 21 Jul 2020 22:59:40 +0000
From: Max Englander <max.englander@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v3] audit: report audit wait metric in audit status reply
Message-ID: <20200721225939.GA16893@linux-kernel-dev>
References: <20200704151526.GA62112@linux-kernel-dev>
	<CAHC9VhTObG-=cbASnXwXiyM-1CCJXZ-4YGFCHozSVBn4Qjp=MQ@mail.gmail.com>
	<CAHC9VhQNpAeUKtDZJ7+Unq=NeHNc4Wjxo9E1d4m8P6STm+5+3w@mail.gmail.com>
	<CAHC9VhQ_JjYJxP6t74bbeBvf5g0TGJZMfLtq0y0aia8y+Dm4fQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQ_JjYJxP6t74bbeBvf5g0TGJZMfLtq0y0aia8y+Dm4fQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Content-Disposition: inline

On Tue, Jul 21, 2020 at 11:26:53AM -0400, Paul Moore wrote:
> On Wed, Jul 15, 2020 at 9:30 PM Paul Moore <paul@paul-moore.com> wrote:
> > On Wed, Jul 8, 2020 at 7:13 PM Paul Moore <paul@paul-moore.com> wrote:
> > > On Sat, Jul 4, 2020 at 11:15 AM Max Englander <max.englander@gmail.com> wrote:
> > > >
> > > > In environments where the preservation of audit events and predictable
> > > > usage of system memory are prioritized, admins may use a combination of
> > > > --backlog_wait_time and -b options at the risk of degraded performance
> > > > resulting from backlog waiting. In some cases, this risk may be
> > > > preferred to lost events or unbounded memory usage. Ideally, this risk
> > > > can be mitigated by making adjustments when backlog waiting is detected.
> > > >
> > > > However, detection can be difficult using the currently available
> > > > metrics. For example, an admin attempting to debug degraded performance
> > > > may falsely believe a full backlog indicates backlog waiting. It may
> > > > turn out the backlog frequently fills up but drains quickly.
> > > >
> > > > To make it easier to reliably track degraded performance to backlog
> > > > waiting, this patch makes the following changes:
> > > >
> > > > Add a new field backlog_wait_time_total to the audit status reply.
> > > > Initialize this field to zero. Add to this field the total time spent
> > > > by the current task on scheduled timeouts while the backlog limit is
> > > > exceeded. Reset field to zero upon request via AUDIT_SET.
> > > >
> > > > Tested on Ubuntu 18.04 using complementary changes to the
> > > > audit-userspace and audit-testsuite:
> > > > - https://github.com/linux-audit/audit-userspace/pull/134
> > > > - https://github.com/linux-audit/audit-testsuite/pull/97
> > > >
> > > > Signed-off-by: Max Englander <max.englander@gmail.com>
> > > > ---
> > > > Patch changelogs between v1 and v2:
> > > >   - Instead of printing a warning when backlog waiting occurs, add
> > > >     duration of backlog waiting to cumulative sum, and report this
> > > >     sum in audit status reply.
> > > >
> > > > Patch changelogs between v2 and v3:
> > > >  - Rename backlog_wait_sum to backlog_wait_time_actual.
> > > >  - Drop unneeded and unwanted header flags
> > > >    AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_SUM and
> > > >    AUDIT_VERSION_BACKLOG_WAIT_SUM.
> > > >  - Increment backlog_wait_time_actual counter after every call to
> > > >    schedule_timeout rather than once after enqueuing (or losing) an
> > > >    audit record.
> > > >  - Add support for resetting backlog_wait_time_actual counter to zero
> > > >    upon request via AUDIT_SET.
> > > >
> > > >  include/uapi/linux/audit.h | 18 +++++++++++-------
> > > >  kernel/audit.c             | 35 +++++++++++++++++++++++++----------
> > > >  2 files changed, 36 insertions(+), 17 deletions(-)
> > >
> > > This looks okay to me, thanks for the fixes Max.
> > >
> > > Steve, does the associated userspace patch look okay to you?
> >
> > Steve, any comments on the userspace patch?  Did I miss a reply in my
> > inbox perhaps?
> >
> > If I don't see any feedback by the end of the week I'll plan on
> > merging this into audit/next.
> 
> It's been over two weeks with no comment, so I went ahead and merged
> this into audit/next.  Thanks for your patience Max!

Excellent, glad to hear it! Thank you (and Richard, Steve) for the
guidance and interesting discussion along the way.

> 
> -- 
> paul moore
> www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

