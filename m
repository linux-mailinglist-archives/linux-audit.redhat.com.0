Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 74E11221985
	for <lists+linux-audit@lfdr.de>; Thu, 16 Jul 2020 03:31:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-RaayvbqSOky6dMtOfVPioQ-1; Wed, 15 Jul 2020 21:31:03 -0400
X-MC-Unique: RaayvbqSOky6dMtOfVPioQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C50001009600;
	Thu, 16 Jul 2020 01:30:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E09310013D0;
	Thu, 16 Jul 2020 01:30:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE0BE94F1E;
	Thu, 16 Jul 2020 01:30:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06G1UXPk021511 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 21:30:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 91BA42097D61; Thu, 16 Jul 2020 01:30:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DECA2097D60
	for <linux-audit@redhat.com>; Thu, 16 Jul 2020 01:30:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB9D280CC31
	for <linux-audit@redhat.com>; Thu, 16 Jul 2020 01:30:30 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-348-SNeSMpSgNDi9HSz3iE3bgg-1; Wed, 15 Jul 2020 21:30:28 -0400
X-MC-Unique: SNeSMpSgNDi9HSz3iE3bgg-1
Received: by mail-ej1-f65.google.com with SMTP id a21so4593636ejj.10
	for <linux-audit@redhat.com>; Wed, 15 Jul 2020 18:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=J9isOEX5BMdPRBPagflfK4hKlfANdVD/eFdRno4aS3s=;
	b=bDEpuvUs32/8Eugk1hRPJyP+pdq3ywnY6PbwJ1el5cTZMOBVCRgrR2bMG+3k4/j7LK
	sLX3j3Efatw+gPMay9P8UHbZ52nHxEPl8s22vm98sZd1x9NYW0uZUviRVoRKSfxwOXjr
	69Cg8qC4LyBob4raYwnWKgECVTPYWhY/eWaTsI2QWdFhyIVABT3ADIco/VLOdvwcH6bX
	T7zdL+CGNKY8hUkX3Ia/XDYSITKxS+suAhFE3xXmoEv6DNlJEKzxCNNoyuynOvXsdbxm
	g4AthTdYL/75JiNKlwPdi8BwuJP0iyqWYQ6mAl/evbGT6QwyepLJPztg+RJeeHzvAP/w
	FteA==
X-Gm-Message-State: AOAM531SCNccpnNCM4/6X/9YQRMF5/50U1XFKGXQSdwEAv49XyOtfUmE
	IHaFwDOYn8llRCJcUAIRHnneDOGGTIjOXaFiWOou
X-Google-Smtp-Source: ABdhPJyD24OeQObG3j710/NP8/aA9EkevmqQO4SsC3LPibxVjwTBaLawaUn3y0PyXB+vr4b6uv/Z9rSUhhSTHaIDEec=
X-Received: by 2002:a17:906:1403:: with SMTP id
	p3mr1596123ejc.106.1594863026944; 
	Wed, 15 Jul 2020 18:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200704151526.GA62112@linux-kernel-dev>
	<CAHC9VhTObG-=cbASnXwXiyM-1CCJXZ-4YGFCHozSVBn4Qjp=MQ@mail.gmail.com>
In-Reply-To: <CAHC9VhTObG-=cbASnXwXiyM-1CCJXZ-4YGFCHozSVBn4Qjp=MQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 15 Jul 2020 21:30:15 -0400
Message-ID: <CAHC9VhQNpAeUKtDZJ7+Unq=NeHNc4Wjxo9E1d4m8P6STm+5+3w@mail.gmail.com>
Subject: Re: [PATCH v3] audit: report audit wait metric in audit status reply
To: Max Englander <max.englander@gmail.com>, sgrubb@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 8, 2020 at 7:13 PM Paul Moore <paul@paul-moore.com> wrote:
>
> On Sat, Jul 4, 2020 at 11:15 AM Max Englander <max.englander@gmail.com> wrote:
> >
> > In environments where the preservation of audit events and predictable
> > usage of system memory are prioritized, admins may use a combination of
> > --backlog_wait_time and -b options at the risk of degraded performance
> > resulting from backlog waiting. In some cases, this risk may be
> > preferred to lost events or unbounded memory usage. Ideally, this risk
> > can be mitigated by making adjustments when backlog waiting is detected.
> >
> > However, detection can be difficult using the currently available
> > metrics. For example, an admin attempting to debug degraded performance
> > may falsely believe a full backlog indicates backlog waiting. It may
> > turn out the backlog frequently fills up but drains quickly.
> >
> > To make it easier to reliably track degraded performance to backlog
> > waiting, this patch makes the following changes:
> >
> > Add a new field backlog_wait_time_total to the audit status reply.
> > Initialize this field to zero. Add to this field the total time spent
> > by the current task on scheduled timeouts while the backlog limit is
> > exceeded. Reset field to zero upon request via AUDIT_SET.
> >
> > Tested on Ubuntu 18.04 using complementary changes to the
> > audit-userspace and audit-testsuite:
> > - https://github.com/linux-audit/audit-userspace/pull/134
> > - https://github.com/linux-audit/audit-testsuite/pull/97
> >
> > Signed-off-by: Max Englander <max.englander@gmail.com>
> > ---
> > Patch changelogs between v1 and v2:
> >   - Instead of printing a warning when backlog waiting occurs, add
> >     duration of backlog waiting to cumulative sum, and report this
> >     sum in audit status reply.
> >
> > Patch changelogs between v2 and v3:
> >  - Rename backlog_wait_sum to backlog_wait_time_actual.
> >  - Drop unneeded and unwanted header flags
> >    AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_SUM and
> >    AUDIT_VERSION_BACKLOG_WAIT_SUM.
> >  - Increment backlog_wait_time_actual counter after every call to
> >    schedule_timeout rather than once after enqueuing (or losing) an
> >    audit record.
> >  - Add support for resetting backlog_wait_time_actual counter to zero
> >    upon request via AUDIT_SET.
> >
> >  include/uapi/linux/audit.h | 18 +++++++++++-------
> >  kernel/audit.c             | 35 +++++++++++++++++++++++++----------
> >  2 files changed, 36 insertions(+), 17 deletions(-)
>
> This looks okay to me, thanks for the fixes Max.
>
> Steve, does the associated userspace patch look okay to you?

Steve, any comments on the userspace patch?  Did I miss a reply in my
inbox perhaps?

If I don't see any feedback by the end of the week I'll plan on
merging this into audit/next.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

