Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 043242FD86
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 16:20:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1063830C1206;
	Thu, 30 May 2019 14:20:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6425C7C534;
	Thu, 30 May 2019 14:20:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 93B4B1806B0F;
	Thu, 30 May 2019 14:20:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4UEK5PE022873 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 May 2019 10:20:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5F0AD5D704; Thu, 30 May 2019 14:20:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.phx2.redhat.com [10.3.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB1AF7941C;
	Thu, 30 May 2019 14:19:54 +0000 (UTC)
Date: Thu, 30 May 2019 10:19:51 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V6 08/10] audit: add containerid filtering
Message-ID: <20190530141951.iofimovrndap4npq@madcap2.tricolour.ca>
References: <cover.1554732921.git.rgb@redhat.com>
	<0785ee2644804f3ec6af1243cc0dcf89709c1fd4.1554732921.git.rgb@redhat.com>
	<CAHC9VhRV-0LSEcRvPO1uXtKdpEQsaLZnBV3T=zcMTZPN5ugz5w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhRV-0LSEcRvPO1uXtKdpEQsaLZnBV3T=zcMTZPN5ugz5w@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 30 May 2019 14:20:47 +0000 (UTC)

On 2019-05-29 18:16, Paul Moore wrote:
> On Mon, Apr 8, 2019 at 11:41 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > Implement audit container identifier filtering using the AUDIT_CONTID
> > field name to send an 8-character string representing a u64 since the
> > value field is only u32.
> >
> > Sending it as two u32 was considered, but gathering and comparing two
> > fields was more complex.
> >
> > The feature indicator is AUDIT_FEATURE_BITMAP_CONTAINERID.
> >
> > Please see the github audit kernel issue for the contid filter feature:
> >   https://github.com/linux-audit/audit-kernel/issues/91
> > Please see the github audit userspace issue for filter additions:
> >   https://github.com/linux-audit/audit-userspace/issues/40
> > Please see the github audit testsuiite issue for the test case:
> >   https://github.com/linux-audit/audit-testsuite/issues/64
> > Please see the github audit wiki for the feature overview:
> >   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > Acked-by: Serge Hallyn <serge@hallyn.com>
> > Acked-by: Neil Horman <nhorman@tuxdriver.com>
> > Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> > ---
> >  include/linux/audit.h      |  1 +
> >  include/uapi/linux/audit.h |  5 ++++-
> >  kernel/audit.h             |  1 +
> >  kernel/auditfilter.c       | 47 ++++++++++++++++++++++++++++++++++++++++++++++
> >  kernel/auditsc.c           |  4 ++++
> >  5 files changed, 57 insertions(+), 1 deletion(-)
> 
> ...
> 
> > diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
> > index 63f8b3f26fab..407b5bb3b4c6 100644
> > --- a/kernel/auditfilter.c
> > +++ b/kernel/auditfilter.c
> > @@ -1206,6 +1224,31 @@ int audit_comparator(u32 left, u32 op, u32 right)
> >         }
> >  }
> >
> > +int audit_comparator64(u64 left, u32 op, u64 right)
> > +{
> > +       switch (op) {
> > +       case Audit_equal:
> > +               return (left == right);
> > +       case Audit_not_equal:
> > +               return (left != right);
> > +       case Audit_lt:
> > +               return (left < right);
> > +       case Audit_le:
> > +               return (left <= right);
> > +       case Audit_gt:
> > +               return (left > right);
> > +       case Audit_ge:
> > +               return (left >= right);
> > +       case Audit_bitmask:
> > +               return (left & right);
> > +       case Audit_bittest:
> > +               return ((left & right) == right);
> > +       default:
> > +               BUG();
> 
> A little birdy mentioned the BUG() here as a potential issue and while
> I had ignored it in earlier patches because this is likely a
> cut-n-paste from another audit comparator function, I took a closer
> look this time.  It appears as though we will never have an invalid op
> value as audit_data_to_entry()/audit_to_op() ensure that the op value
> is a a known good value.  Removing the BUG() from all the audit
> comparators is a separate issue, but I think it would be good to
> remove it from this newly added comparator; keeping it so that we
> return "0" in the default case seems reasoanble.

Fair enough.  That BUG(); can be removed.

> > +               return 0;
> > +       }
> > +}
> 
> --
> paul moore
> www.paul-moore.com

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
