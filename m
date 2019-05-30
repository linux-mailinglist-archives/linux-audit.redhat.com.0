Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E762FDEE
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 16:35:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 42F216EB80;
	Thu, 30 May 2019 14:35:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B2616F44E;
	Thu, 30 May 2019 14:35:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B4497206D2;
	Thu, 30 May 2019 14:35:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4UEYk27025566 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 May 2019 10:34:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 83E507AB55; Thu, 30 May 2019 14:34:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E50479452
	for <linux-audit@redhat.com>; Thu, 30 May 2019 14:34:44 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E27330C31AD
	for <linux-audit@redhat.com>; Thu, 30 May 2019 14:34:36 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id q62so6275899ljq.7
	for <linux-audit@redhat.com>; Thu, 30 May 2019 07:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LvgFttjwD8tpRb4Jny1liBYRgYtyF5gETJat0Y6PZj0=;
	b=q3wQyXDPkal/vbviUhmSsus3N1NxrIZmQgfZu7EO565zOv9aRNeYWHTdfey/MLFGeh
	u41nVQ/vy4O+cZe9sliGlYVDpuvuuBfZ2UCFXtI6RgTjNhJb7DYbdM2SO/NCpkksto5C
	roCPGZJWmHUfoDVyKX9dtsxOh+iwtrsqiqc5rvFw9fNoRX0dcZ+TC/YO/PzGI+QdrDDX
	HQUkFj02JNl0X/EuTmkbm08dH2+9gvOwVC3UaYlZiFTdp76nkd8ih+Y9+XEM3yrDOLVo
	KPX2U6QS5I6g0EtJnwfrfdorXlRKGU3I1dA/DtKQXbjNEyGsWZvxcbbywx/hN6zbdMyX
	2zHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LvgFttjwD8tpRb4Jny1liBYRgYtyF5gETJat0Y6PZj0=;
	b=YZY2/1gxwVo0y31NFBUX9KY6+MbQvoGVgH3LhF4T+XNj1rXtquCnuA9S//G3duppkA
	nFdEnDcNU8/XSnSToRfHq9a86zGJC9Jnf7AbT+Ytx/MiMbqohR5fWqKszekAjHeDUtkJ
	BcH2tNCh6nYDhBjbYiolyIBtB5yD53ztMIWPD1gghWsN/QV0FgUGHyoKWda/DcJx2Wgs
	1wm0/sn9sY7RuIxEmsdWnKLypNavzamj4RZVsm7vXZgCeykEzBIeANCohaQmHfgIB3o1
	TlCybxHZtmsDXqAessy5Q5MtvhZeOVgViVUfRa5xVQ11h1Rt7b2vvERkveMCycQ3abDW
	ZWIQ==
X-Gm-Message-State: APjAAAUoFjbLWFY7ueF59FVWXDy/IVFflePXQy3w7qiGCzqkN4+kX62d
	dRul4wi+5RUCkTIuBKzofHmDx1tnB4MVu1GXWoFj
X-Google-Smtp-Source: APXvYqyjvx+X9oscT0G4c8PQ+mVJEW5ymbmBDFkXIm1AiMAVU6LeKUfdKbw4F+bsXGSGzh/ysbZI7qzRbZPtkRVsVHE=
X-Received: by 2002:a2e:900e:: with SMTP id h14mr2326343ljg.77.1559226874389; 
	Thu, 30 May 2019 07:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<f4a49f7c949e5df80c339a3fe5c4c2303b12bf23.1554732921.git.rgb@redhat.com>
	<CAHC9VhRfQp-avV2rcEOvLCAXEz-MDZMp91UxU+BtvPkvWny9fQ@mail.gmail.com>
	<CAFqZXNsK6M_L_0dFzkEgh_QVP-fyb+fE0MMRsJ2kXxtKM3VUKA@mail.gmail.com>
	<20190530140849.zdxvlvkefwpngfil@madcap2.tricolour.ca>
In-Reply-To: <20190530140849.zdxvlvkefwpngfil@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 30 May 2019 10:34:22 -0400
Message-ID: <CAHC9VhQd0FHyPWaN9YyGctJAL+KGL57YxyVJctshUgTt8L=tJA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 04/10] audit: log container info of syscalls
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 30 May 2019 14:34:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Thu, 30 May 2019 14:34:36 +0000 (UTC) for IP:'209.85.208.194'
	DOMAIN:'mail-lj1-f194.google.com'
	HELO:'mail-lj1-f194.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.315  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.194 mail-lj1-f194.google.com 209.85.208.194
	mail-lj1-f194.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x4UEYk27025566
X-loop: linux-audit@redhat.com
Cc: Neil Horman <nhorman@tuxdriver.com>, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
	David Howells <dhowells@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Thu, 30 May 2019 14:35:21 +0000 (UTC)

On Thu, May 30, 2019 at 10:09 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> On 2019-05-30 15:08, Ondrej Mosnacek wrote:
> > On Thu, May 30, 2019 at 12:16 AM Paul Moore <paul@paul-moore.com> wrote:
> > > On Mon, Apr 8, 2019 at 11:40 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > >
> > > > Create a new audit record AUDIT_CONTAINER_ID to document the audit
> > > > container identifier of a process if it is present.
> > > >
> > > > Called from audit_log_exit(), syscalls are covered.
> > > >
> > > > A sample raw event:
> > > > type=SYSCALL msg=audit(1519924845.499:257): arch=c000003e syscall=257 success=yes exit=3 a0=ffffff9c a1=56374e1cef30 a2=241 a3=1b6 items=2 ppid=606 pid=635 auid=0 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=3 comm="bash" exe="/usr/bin/bash" subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key="tmpcontainerid"
> > > > type=CWD msg=audit(1519924845.499:257): cwd="/root"
> > > > type=PATH msg=audit(1519924845.499:257): item=0 name="/tmp/" inode=13863 dev=00:27 mode=041777 ouid=0 ogid=0 rdev=00:00 obj=system_u:object_r:tmp_t:s0 nametype= PARENT cap_fp=0 cap_fi=0 cap_fe=0 cap_fver=0
> > > > type=PATH msg=audit(1519924845.499:257): item=1 name="/tmp/tmpcontainerid" inode=17729 dev=00:27 mode=0100644 ouid=0 ogid=0 rdev=00:00 obj=unconfined_u:object_r:user_tmp_t:s0 nametype=CREATE cap_fp=0 cap_fi=0 cap_fe=0 cap_fver=0
> > > > type=PROCTITLE msg=audit(1519924845.499:257): proctitle=62617368002D6300736C65657020313B206563686F2074657374203E202F746D702F746D70636F6E7461696E65726964
> > > > type=CONTAINER_ID msg=audit(1519924845.499:257): contid=123458
> > > >
> > > > Please see the github audit kernel issue for the main feature:
> > > >   https://github.com/linux-audit/audit-kernel/issues/90
> > > > Please see the github audit userspace issue for supporting additions:
> > > >   https://github.com/linux-audit/audit-userspace/issues/51
> > > > Please see the github audit testsuiite issue for the test case:
> > > >   https://github.com/linux-audit/audit-testsuite/issues/64
> > > > Please see the github audit wiki for the feature overview:
> > > >   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID
> > > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > > Acked-by: Serge Hallyn <serge@hallyn.com>
> > > > Acked-by: Steve Grubb <sgrubb@redhat.com>
> > > > Acked-by: Neil Horman <nhorman@tuxdriver.com>
> > > > Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> > > > ---
> > > >  include/linux/audit.h      |  5 +++++
> > > >  include/uapi/linux/audit.h |  1 +
> > > >  kernel/audit.c             | 20 ++++++++++++++++++++
> > > >  kernel/auditsc.c           | 20 ++++++++++++++------
> > > >  4 files changed, 40 insertions(+), 6 deletions(-)
> > >
> > > ...
> > >
> > > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > > index 182b0f2c183d..3e0af53f3c4d 100644
> > > > --- a/kernel/audit.c
> > > > +++ b/kernel/audit.c
> > > > @@ -2127,6 +2127,26 @@ void audit_log_session_info(struct audit_buffer *ab)
> > > >         audit_log_format(ab, "auid=%u ses=%u", auid, sessionid);
> > > >  }
> > > >
> > > > +/*
> > > > + * audit_log_contid - report container info
> > > > + * @context: task or local context for record
> > > > + * @contid: container ID to report
> > > > + */
> > > > +void audit_log_contid(struct audit_context *context, u64 contid)
> > > > +{
> > > > +       struct audit_buffer *ab;
> > > > +
> > > > +       if (!audit_contid_valid(contid))
> > > > +               return;
> > > > +       /* Generate AUDIT_CONTAINER_ID record with container ID */
> > > > +       ab = audit_log_start(context, GFP_KERNEL, AUDIT_CONTAINER_ID);
> > > > +       if (!ab)
> > > > +               return;
> > > > +       audit_log_format(ab, "contid=%llu", (unsigned long long)contid);
> > >
> > > We have a consistency problem regarding how to output the u64 contid
> > > values; this function uses an explicit cast, others do not.  According
> > > to Documentation/core-api/printk-formats.rst the recommendation for
> > > u64 is %llu (or %llx, if you want hex).  Looking quickly through the
> > > printk code this appears to still be correct.  I suggest we get rid of
> > > the cast (like it was in v5).
> >
> > IIRC it was me who suggested to add the casts. I didn't realize that
> > the kernel actually guarantees that "%llu" will always work with u64.
> > Taking that into account I rescind my request to add the cast. Sorry
> > for the false alarm.
>
> Yeah, just remove the cast.

Okay, this is trivial enough I'll take care of this during the merge
with a note.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
