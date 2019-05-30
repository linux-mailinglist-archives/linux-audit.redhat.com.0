Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 049952FBFC
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 15:09:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B72D30C1FE7;
	Thu, 30 May 2019 13:09:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F09297A51B;
	Thu, 30 May 2019 13:09:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 569291806B0E;
	Thu, 30 May 2019 13:08:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4UD8LeO008539 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 May 2019 09:08:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F135E63BB8; Thu, 30 May 2019 13:08:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC2DC6F7E2
	for <linux-audit@redhat.com>; Thu, 30 May 2019 13:08:19 +0000 (UTC)
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
	[209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B06A7B2DE9
	for <linux-audit@redhat.com>; Thu, 30 May 2019 13:08:19 +0000 (UTC)
Received: by mail-ot1-f70.google.com with SMTP id 68so2779506otu.18
	for <linux-audit@redhat.com>; Thu, 30 May 2019 06:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qS3Q/hz5cO93oEIRYjaW7Sr8hav+cFNgiudkzNoMj8w=;
	b=dCS+XsBiyvp8TA/oit7ZUB5OFcXWc+aV+bQ2QeTqA5Uk0ODnkHzv3omt5CeYxUE01L
	S0i5muvx/GcDR0PPJnuOZotwnBpYig/jbszOuyeGa/pP/YNDcz/PNSdI4edu6S050rWr
	QldlihdO4cwk5hAdEUsMsxtk/XxiPIqXQAv8Gx/DsAMc6zl69GATB3EApPgv6IgN8A0c
	fvhDwlYxx2SO7YWlx9F89L2uSiANs8bIGuKt/x8EV3MStKm1ef1TK4PoDoQcQbKI8Q2q
	EK+jihshU+NWia3nRfulDZvbghWBFINl1GY1LPjtci1MQIW91lVgcIxWjyDIbTNJa0L+
	P+2A==
X-Gm-Message-State: APjAAAVRtG11kdGu+tivkl8f36haAPCxQLgsNwbYOFxn4MvPAPmEf+jX
	F5rCqlK2DVPsxldkOi6R+T9eZvRUHZvx0HtFVRcYlvQRUwYOyxv5hjd39KFwJf30PPOgBz5tWDn
	VLO79zgYIP0AWT8rRPKvpMmbUQ7/Ef6Uspxs=
X-Received: by 2002:aca:300d:: with SMTP id w13mr2391491oiw.26.1559221698227; 
	Thu, 30 May 2019 06:08:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRNQdu8FXZJDPynHtWRxoDcqnlrWbPcgP874hkqSkQlayP5hnOUfRLSzP0TLiIV+sPYeCjXTJG6BZ8bL0SPWw=
X-Received: by 2002:aca:300d:: with SMTP id w13mr2391467oiw.26.1559221697952; 
	Thu, 30 May 2019 06:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<f4a49f7c949e5df80c339a3fe5c4c2303b12bf23.1554732921.git.rgb@redhat.com>
	<CAHC9VhRfQp-avV2rcEOvLCAXEz-MDZMp91UxU+BtvPkvWny9fQ@mail.gmail.com>
In-Reply-To: <CAHC9VhRfQp-avV2rcEOvLCAXEz-MDZMp91UxU+BtvPkvWny9fQ@mail.gmail.com>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Thu, 30 May 2019 15:08:07 +0200
Message-ID: <CAFqZXNsK6M_L_0dFzkEgh_QVP-fyb+fE0MMRsJ2kXxtKM3VUKA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 04/10] audit: log container info of syscalls
To: Paul Moore <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x4UD8LeO008539
X-loop: linux-audit@redhat.com
Cc: Neil Horman <nhorman@tuxdriver.com>, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	Simo Sorce <simo@redhat.com>, netdev@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Eric Paris <eparis@parisplace.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Thu, 30 May 2019 13:09:14 +0000 (UTC)

On Thu, May 30, 2019 at 12:16 AM Paul Moore <paul@paul-moore.com> wrote:
> On Mon, Apr 8, 2019 at 11:40 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > Create a new audit record AUDIT_CONTAINER_ID to document the audit
> > container identifier of a process if it is present.
> >
> > Called from audit_log_exit(), syscalls are covered.
> >
> > A sample raw event:
> > type=SYSCALL msg=audit(1519924845.499:257): arch=c000003e syscall=257 success=yes exit=3 a0=ffffff9c a1=56374e1cef30 a2=241 a3=1b6 items=2 ppid=606 pid=635 auid=0 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=3 comm="bash" exe="/usr/bin/bash" subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key="tmpcontainerid"
> > type=CWD msg=audit(1519924845.499:257): cwd="/root"
> > type=PATH msg=audit(1519924845.499:257): item=0 name="/tmp/" inode=13863 dev=00:27 mode=041777 ouid=0 ogid=0 rdev=00:00 obj=system_u:object_r:tmp_t:s0 nametype= PARENT cap_fp=0 cap_fi=0 cap_fe=0 cap_fver=0
> > type=PATH msg=audit(1519924845.499:257): item=1 name="/tmp/tmpcontainerid" inode=17729 dev=00:27 mode=0100644 ouid=0 ogid=0 rdev=00:00 obj=unconfined_u:object_r:user_tmp_t:s0 nametype=CREATE cap_fp=0 cap_fi=0 cap_fe=0 cap_fver=0
> > type=PROCTITLE msg=audit(1519924845.499:257): proctitle=62617368002D6300736C65657020313B206563686F2074657374203E202F746D702F746D70636F6E7461696E65726964
> > type=CONTAINER_ID msg=audit(1519924845.499:257): contid=123458
> >
> > Please see the github audit kernel issue for the main feature:
> >   https://github.com/linux-audit/audit-kernel/issues/90
> > Please see the github audit userspace issue for supporting additions:
> >   https://github.com/linux-audit/audit-userspace/issues/51
> > Please see the github audit testsuiite issue for the test case:
> >   https://github.com/linux-audit/audit-testsuite/issues/64
> > Please see the github audit wiki for the feature overview:
> >   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > Acked-by: Serge Hallyn <serge@hallyn.com>
> > Acked-by: Steve Grubb <sgrubb@redhat.com>
> > Acked-by: Neil Horman <nhorman@tuxdriver.com>
> > Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> > ---
> >  include/linux/audit.h      |  5 +++++
> >  include/uapi/linux/audit.h |  1 +
> >  kernel/audit.c             | 20 ++++++++++++++++++++
> >  kernel/auditsc.c           | 20 ++++++++++++++------
> >  4 files changed, 40 insertions(+), 6 deletions(-)
>
> ...
>
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index 182b0f2c183d..3e0af53f3c4d 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -2127,6 +2127,26 @@ void audit_log_session_info(struct audit_buffer *ab)
> >         audit_log_format(ab, "auid=%u ses=%u", auid, sessionid);
> >  }
> >
> > +/*
> > + * audit_log_contid - report container info
> > + * @context: task or local context for record
> > + * @contid: container ID to report
> > + */
> > +void audit_log_contid(struct audit_context *context, u64 contid)
> > +{
> > +       struct audit_buffer *ab;
> > +
> > +       if (!audit_contid_valid(contid))
> > +               return;
> > +       /* Generate AUDIT_CONTAINER_ID record with container ID */
> > +       ab = audit_log_start(context, GFP_KERNEL, AUDIT_CONTAINER_ID);
> > +       if (!ab)
> > +               return;
> > +       audit_log_format(ab, "contid=%llu", (unsigned long long)contid);
>
> We have a consistency problem regarding how to output the u64 contid
> values; this function uses an explicit cast, others do not.  According
> to Documentation/core-api/printk-formats.rst the recommendation for
> u64 is %llu (or %llx, if you want hex).  Looking quickly through the
> printk code this appears to still be correct.  I suggest we get rid of
> the cast (like it was in v5).

IIRC it was me who suggested to add the casts. I didn't realize that
the kernel actually guarantees that "%llu" will always work with u64.
Taking that into account I rescind my request to add the cast. Sorry
for the false alarm.

>
> > +       audit_log_end(ab);
> > +}
> > +EXPORT_SYMBOL(audit_log_contid);
>
> --
> paul moore
> www.paul-moore.com

--
Ondrej Mosnacek <omosnace at redhat dot com>
Software Engineer, Security Technologies
Red Hat, Inc.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
