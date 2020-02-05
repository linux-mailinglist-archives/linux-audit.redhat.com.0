Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 20683153B70
	for <lists+linux-audit@lfdr.de>; Wed,  5 Feb 2020 23:52:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580943125;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tTDC8lGWWcTv/SowVQqRSoSHLjke9Ca+2A0N28rgjz8=;
	b=fUR2uAsOOpsexceWu4rOOH4C0JkquR6iGMObqAC0/5NrqGn/fYUeWrwxZcxQ5vao8oJr10
	cG31NVA9LwTQLP/i3MX2rWvwOxNvWz7HRBdcEi83aF7Z6UllJe2nUz3zvPMOO5xaty6MHF
	dYeslkO8JYjTcZlIycloCtxuWwG4fjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-rUWMjzanM2-tqEoUfVNr1A-1; Wed, 05 Feb 2020 17:52:03 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1150018A8CBF;
	Wed,  5 Feb 2020 22:51:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 874D4859D2;
	Wed,  5 Feb 2020 22:51:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C4B0A18089C8;
	Wed,  5 Feb 2020 22:51:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015Mpl9j028453 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 17:51:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2A0B12166B28; Wed,  5 Feb 2020 22:51:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2606A2166B27
	for <linux-audit@redhat.com>; Wed,  5 Feb 2020 22:51:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96186900823
	for <linux-audit@redhat.com>; Wed,  5 Feb 2020 22:51:44 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-349-NX3Tsk5vN_2de7GMLG9DcA-1; Wed, 05 Feb 2020 17:51:42 -0500
Received: by mail-ed1-f67.google.com with SMTP id m8so3818229edi.13
	for <linux-audit@redhat.com>; Wed, 05 Feb 2020 14:51:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KkJqADdzREDp4wpCa3aAuBXzYy2a7dWtxmQqACuBiLA=;
	b=QTNnZUS7/MCtS9rpKDOqQHSNY1YjFSBR+/SAlAu7BOSNVhRI+Cv75QoZdqlANygijj
	q8G/2WWSjTE0IsFYNLvJtWgcsiDwlT2ZnjHfvDEyJXp2tiRmQbh5mTn4GbHqiWagIPW5
	2ezPmL7Q4g4ro+CiKAVTrVZhOq4vRrc/Ys/AGDffbombHmUZupOEuXXv8qtG2fTJpFh9
	Zg7aKiS4h79KhVsw3CrdGsy3IITOHpIeJVgxrlOZ+g3UI7nPt+EtXDKZ1WOQDqUHMrDY
	71GSAqgV14BehzjwgomNEFzDlOc584hRV7fUS3OleFqVCc9ZjUSq8TfPI8GTvu1RHRq/
	LnXw==
X-Gm-Message-State: APjAAAXAq3Yr81evtJdNXRGNzytPnbyxdmdJI3mb/81jPUPkO8julIpo
	aQImi4DDY1cKn70cj6iaXjSzA3uvybvaH7B2iLv7
X-Google-Smtp-Source: APXvYqz2aK9JflWz0zHltcgH6zygcn9lbVHxrjU8/1oDrOSsvKKPYicMl7ZrYmjGxJ5ErI7H2IQMPuhpOBJ/wakZNE8=
X-Received: by 2002:a50:e108:: with SMTP id h8mr394067edl.196.1580943101124;
	Wed, 05 Feb 2020 14:51:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<2954ed671a7622ddf3abdb8854dbba2ad13e9f33.1577736799.git.rgb@redhat.com>
	<CAHC9VhRw3Fj9-hi+Vj8JJb_GXM4B9N5hRXa9H6aQkuuFqJJ15w@mail.gmail.com>
	<20200204234258.uwaqk3s3c42fxews@madcap2.tricolour.ca>
In-Reply-To: <20200204234258.uwaqk3s3c42fxews@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 5 Feb 2020 17:51:30 -0500
Message-ID: <CAHC9VhT0NELsrEeTmX15GaZ1SE-qZiQmz9-WweRGWRPcGN5EmA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 11/16] audit: add support for containerid to
	network namespaces
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: NX3Tsk5vN_2de7GMLG9DcA-1
X-MC-Unique: rUWMjzanM2-tqEoUfVNr1A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 015Mpl9j028453
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 4, 2020 at 6:43 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-01-22 16:28, Paul Moore wrote:
> > On Tue, Dec 31, 2019 at 2:51 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > This also adds support to qualify NETFILTER_PKT records.
> > >
> > > Audit events could happen in a network namespace outside of a task
> > > context due to packets received from the net that trigger an auditing
> > > rule prior to being associated with a running task.  The network
> > > namespace could be in use by multiple containers by association to the
> > > tasks in that network namespace.  We still want a way to attribute
> > > these events to any potential containers.  Keep a list per network
> > > namespace to track these audit container identifiiers.
> > >
> > > Add/increment the audit container identifier on:
> > > - initial setting of the audit container identifier via /proc
> > > - clone/fork call that inherits an audit container identifier
> > > - unshare call that inherits an audit container identifier
> > > - setns call that inherits an audit container identifier
> > > Delete/decrement the audit container identifier on:
> > > - an inherited audit container identifier dropped when child set
> > > - process exit
> > > - unshare call that drops a net namespace
> > > - setns call that drops a net namespace
> > >
> > > Add audit container identifier auxiliary record(s) to NETFILTER_PKT
> > > event standalone records.  Iterate through all potential audit container
> > > identifiers associated with a network namespace.
> > >
> > > Please see the github audit kernel issue for contid net support:
> > >   https://github.com/linux-audit/audit-kernel/issues/92
> > > Please see the github audit testsuiite issue for the test case:
> > >   https://github.com/linux-audit/audit-testsuite/issues/64
> > > Please see the github audit wiki for the feature overview:
> > >   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > Acked-by: Neil Horman <nhorman@tuxdriver.com>
> > > Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> > > ---
> > >  include/linux/audit.h    |  24 +++++++++
> > >  kernel/audit.c           | 132 ++++++++++++++++++++++++++++++++++++++++++++++-
> > >  kernel/nsproxy.c         |   4 ++
> > >  net/netfilter/nft_log.c  |  11 +++-
> > >  net/netfilter/xt_AUDIT.c |  11 +++-
> > >  5 files changed, 176 insertions(+), 6 deletions(-)
> >
> > ...
> >
> > > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > > index 5531d37a4226..ed8d5b74758d 100644
> > > --- a/include/linux/audit.h
> > > +++ b/include/linux/audit.h
> > > @@ -12,6 +12,7 @@
> > >  #include <linux/sched.h>
> > >  #include <linux/ptrace.h>
> > >  #include <uapi/linux/audit.h>
> > > +#include <linux/refcount.h>
> > >
> > >  #define AUDIT_INO_UNSET ((unsigned long)-1)
> > >  #define AUDIT_DEV_UNSET ((dev_t)-1)
> > > @@ -121,6 +122,13 @@ struct audit_task_info {
> > >
> > >  extern struct audit_task_info init_struct_audit;
> > >
> > > +struct audit_contobj_netns {
> > > +       struct list_head        list;
> > > +       u64                     id;
> >
> > Since we now track audit container IDs in their own structure, why not
> > link directly to the audit container ID object (and bump the
> > refcount)?
>
> Ok, I've done this but at first I had doubts about the complexity.

Yes, it will be more complex, but it should be much safer.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

