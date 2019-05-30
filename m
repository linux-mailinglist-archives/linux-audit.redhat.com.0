Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E7230383
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 22:46:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33B9D3082A9C;
	Thu, 30 May 2019 20:46:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B9155D6A6;
	Thu, 30 May 2019 20:46:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 254CB54D3C;
	Thu, 30 May 2019 20:46:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4UKjpib009940 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 May 2019 16:45:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E86DD5C553; Thu, 30 May 2019 20:45:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2B3F5C541
	for <linux-audit@redhat.com>; Thu, 30 May 2019 20:45:49 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E6A9F9E8B
	for <linux-audit@redhat.com>; Thu, 30 May 2019 20:45:42 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id u27so6078609lfg.10
	for <linux-audit@redhat.com>; Thu, 30 May 2019 13:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EhDqOLrNL+Ls6g+jJlH1kHSTN+6mKWoVpwhK7g7g/0o=;
	b=xlyV3ThJjdhKcZhreP5PbaxjF4yCg2iuc+K7UzQP6tLJWwrREj0I5yVvPo3B3jh7iK
	jh1rsg4jyI3plqbkkIs9e7MgP53igOczr5L4MydDQ87MWflfgTeiR7tPUVxTFoKpmcm4
	6sepnRi8IUd5YcXQYTYWT9BEkanR1k/eUovXIZ4CYEx4LttHAIlePcabZEyckUcOfwA+
	ld4cKn0kM4Vfx29ADhSIicvea8BSndd/KrqWITOd8GFDTydQiWEJoSMQKugjZoDNrglv
	RFE65J9Z1q+k0M/9D9082A8PAYYyDpKeO4/3eIRTiQyhsN5cVxluVIS5g72M/cFmB4vp
	uEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EhDqOLrNL+Ls6g+jJlH1kHSTN+6mKWoVpwhK7g7g/0o=;
	b=QLBS7/aoXGdutNXqed/uhAHNsAhtPwzxfIiBiTUnkKHwkWQ+dmSjrKeOjJFRmfHg/U
	iJ35snDpDUU1KgqsuZE269TQc/JWZR2iTxi6QNTOeUAEBuPfTCmc57FA118ygAFMpASk
	Wp5AEQ5XS+GZbK3VdqXJAun2wRM+OeWPSco96IjvnU+HDJRtkwpi+3oBoMd2YKSR1vGP
	SA61M44nZO268x6pA+aN/vIgTGXA+vR8NHpln507TuHY81RC7B6U2diLka7oE0+hDS1U
	pGaPXDozQRwfE3D5Jso2wTCA6Oo2QcwcYFI3YUzcnnQoKfE+ch6MYRYx8p1E8V3DJw5o
	HKaA==
X-Gm-Message-State: APjAAAW/4QzAXbN0/xC+sR75ey/cRcan/ELhmh/MK+vvO1oHHrzR6J6z
	0wkECp8D5UX/XKWDR6/RtBGLab3TllOlhVbxKEHn
X-Google-Smtp-Source: APXvYqxCLcpJGQ9X7hllnM/E88Y7wiOxHiqGV+F77SwcvQq/KmkEMFzXAp+UwedDTn7SR4CSxAW2AxSMb9dduBaWcmQ=
X-Received: by 2002:ac2:410a:: with SMTP id b10mr3157662lfi.175.1559249140261; 
	Thu, 30 May 2019 13:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<0785ee2644804f3ec6af1243cc0dcf89709c1fd4.1554732921.git.rgb@redhat.com>
	<CAHC9VhRV-0LSEcRvPO1uXtKdpEQsaLZnBV3T=zcMTZPN5ugz5w@mail.gmail.com>
	<20190530141951.iofimovrndap4npq@madcap2.tricolour.ca>
	<CAHC9VhQhkzCtVOXhPL7BzaqvF0y+8gBQwhOo1EQDS2OUyZbV5g@mail.gmail.com>
	<20190530203702.fibsrazabbiifjvf@madcap2.tricolour.ca>
In-Reply-To: <20190530203702.fibsrazabbiifjvf@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 30 May 2019 16:45:28 -0400
Message-ID: <CAHC9VhR6oqKer_p6Xsu6oO2j3bMZGPXWHnGchZOqUoMx9yJFwQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 08/10] audit: add containerid filtering
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 30 May 2019 20:45:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Thu, 30 May 2019 20:45:43 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.315  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.68 mail-lf1-f68.google.com 209.85.167.68
	mail-lf1-f68.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Thu, 30 May 2019 20:46:28 +0000 (UTC)

On Thu, May 30, 2019 at 4:37 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-05-30 10:34, Paul Moore wrote:
> > On Thu, May 30, 2019 at 10:20 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > On 2019-05-29 18:16, Paul Moore wrote:
> > > > On Mon, Apr 8, 2019 at 11:41 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > >
> > > > > Implement audit container identifier filtering using the AUDIT_CONTID
> > > > > field name to send an 8-character string representing a u64 since the
> > > > > value field is only u32.
> > > > >
> > > > > Sending it as two u32 was considered, but gathering and comparing two
> > > > > fields was more complex.
> > > > >
> > > > > The feature indicator is AUDIT_FEATURE_BITMAP_CONTAINERID.
> > > > >
> > > > > Please see the github audit kernel issue for the contid filter feature:
> > > > >   https://github.com/linux-audit/audit-kernel/issues/91
> > > > > Please see the github audit userspace issue for filter additions:
> > > > >   https://github.com/linux-audit/audit-userspace/issues/40
> > > > > Please see the github audit testsuiite issue for the test case:
> > > > >   https://github.com/linux-audit/audit-testsuite/issues/64
> > > > > Please see the github audit wiki for the feature overview:
> > > > >   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID
> > > > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > > > Acked-by: Serge Hallyn <serge@hallyn.com>
> > > > > Acked-by: Neil Horman <nhorman@tuxdriver.com>
> > > > > Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> > > > > ---
> > > > >  include/linux/audit.h      |  1 +
> > > > >  include/uapi/linux/audit.h |  5 ++++-
> > > > >  kernel/audit.h             |  1 +
> > > > >  kernel/auditfilter.c       | 47 ++++++++++++++++++++++++++++++++++++++++++++++
> > > > >  kernel/auditsc.c           |  4 ++++
> > > > >  5 files changed, 57 insertions(+), 1 deletion(-)
> > > >
> > > > ...
> > > >
> > > > > diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
> > > > > index 63f8b3f26fab..407b5bb3b4c6 100644
> > > > > --- a/kernel/auditfilter.c
> > > > > +++ b/kernel/auditfilter.c
> > > > > @@ -1206,6 +1224,31 @@ int audit_comparator(u32 left, u32 op, u32 right)
> > > > >         }
> > > > >  }
> > > > >
> > > > > +int audit_comparator64(u64 left, u32 op, u64 right)
> > > > > +{
> > > > > +       switch (op) {
> > > > > +       case Audit_equal:
> > > > > +               return (left == right);
> > > > > +       case Audit_not_equal:
> > > > > +               return (left != right);
> > > > > +       case Audit_lt:
> > > > > +               return (left < right);
> > > > > +       case Audit_le:
> > > > > +               return (left <= right);
> > > > > +       case Audit_gt:
> > > > > +               return (left > right);
> > > > > +       case Audit_ge:
> > > > > +               return (left >= right);
> > > > > +       case Audit_bitmask:
> > > > > +               return (left & right);
> > > > > +       case Audit_bittest:
> > > > > +               return ((left & right) == right);
> > > > > +       default:
> > > > > +               BUG();
> > > >
> > > > A little birdy mentioned the BUG() here as a potential issue and while
> > > > I had ignored it in earlier patches because this is likely a
> > > > cut-n-paste from another audit comparator function, I took a closer
> > > > look this time.  It appears as though we will never have an invalid op
> > > > value as audit_data_to_entry()/audit_to_op() ensure that the op value
> > > > is a a known good value.  Removing the BUG() from all the audit
> > > > comparators is a separate issue, but I think it would be good to
> > > > remove it from this newly added comparator; keeping it so that we
> > > > return "0" in the default case seems reasoanble.
> > >
> > > Fair enough.  That BUG(); can be removed.
> >
> > Please send a fixup patch for this.
>
> The fixup patch is trivial.

Yes, I know.

> The rebase to v5.2-rc1 audit/next had merge
> conflicts with four recent patchsets.  It may be simpler to submit a new
> patchset and look at a diff of the two sets.  I'm testing the rebase
> now.

Great thanks.  Although you might want to hold off a bit on posting
the next revision until we sort out the discussion which is happening
in patch 02/10; unfortunately I fear we may need to change some of the
logic.

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
