Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 21C7F18A781
	for <lists+linux-audit@lfdr.de>; Wed, 18 Mar 2020 23:00:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584568854;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZSNWN6YG9Bfd0M+uR4t/tilfqPbEADcz9I5ODOqQZn0=;
	b=QnIyVerhMHs5zwMzkBG5cJA5ML2Pebl7GcLECzJJgOX5sJRxdpcSHR+ddyz3Dqg1hNxqYM
	Q8+Ih/KomIQ+5ekDwlPPu4jP6zSs4+AMyzFqs3v4tZ//+JJiXN7nbiY2Fdto35Ly3d4jUU
	lTEIpAWkbFs6tg2AVHdbb7ieQLlYLxM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-qKGLAHhyNg2Y56sBbgxmAg-1; Wed, 18 Mar 2020 18:00:51 -0400
X-MC-Unique: qKGLAHhyNg2Y56sBbgxmAg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 618691007275;
	Wed, 18 Mar 2020 22:00:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18F9A19756;
	Wed, 18 Mar 2020 22:00:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B79D18089CD;
	Wed, 18 Mar 2020 22:00:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02IM0fpW008155 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Mar 2020 18:00:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6534A5DA66; Wed, 18 Mar 2020 22:00:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.36.110.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D979C5D9E5;
	Wed, 18 Mar 2020 22:00:16 +0000 (UTC)
Date: Wed, 18 Mar 2020 18:00:12 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak25 v3 1/3] audit: tidy and extend netfilter_cfg
	x_tables and ebtables logging
Message-ID: <20200318220012.xeeoeidz5vs6x7g4@madcap2.tricolour.ca>
References: <cover.1584480281.git.rgb@redhat.com>
	<3d591dc49fcb643890b93e5b9a8169612b1c96e1.1584480281.git.rgb@redhat.com>
	<CAHC9VhTQBxzFrGn=+b9MzoapV0iiccPOLvkwemdESSb6nOFGXQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTQBxzFrGn=+b9MzoapV0iiccPOLvkwemdESSb6nOFGXQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
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

On 2020-03-18 17:54, Paul Moore wrote:
> On Tue, Mar 17, 2020 at 5:31 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > NETFILTER_CFG record generation was inconsistent for x_tables and
> > ebtables configuration changes.  The call was needlessly messy and there
> > were supporting records missing at times while they were produced when
> > not requested.  Simplify the logging call into a new audit_log_nfcfg
> > call.  Honour the audit_enabled setting while more consistently
> > recording information including supporting records by tidying up dummy
> > checks.
> >
> > Add an op= field that indicates the operation being performed (register
> > or replace).
> >
> > Here is the enhanced sample record:
> >   type=NETFILTER_CFG msg=audit(1580905834.919:82970): table=filter family=2 entries=83 op=replace
> >
> > Generate audit NETFILTER_CFG records on ebtables table registration.
> > Previously this was being done for x_tables registration and replacement
> > operations and ebtables table replacement only.
> >
> > See: https://github.com/linux-audit/audit-kernel/issues/25
> > See: https://github.com/linux-audit/audit-kernel/issues/35
> > See: https://github.com/linux-audit/audit-kernel/issues/43
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> >  include/linux/audit.h           | 19 +++++++++++++++++++
> >  kernel/auditsc.c                | 24 ++++++++++++++++++++++++
> >  net/bridge/netfilter/ebtables.c | 12 ++++--------
> >  net/netfilter/x_tables.c        | 12 +++---------
> >  4 files changed, 50 insertions(+), 17 deletions(-)
> >
> > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > index f9ceae57ca8d..f4aed2b9be8d 100644
> > --- a/include/linux/audit.h
> > +++ b/include/linux/audit.h
> > @@ -94,6 +94,11 @@ struct audit_ntp_data {
> >  struct audit_ntp_data {};
> >  #endif
> >
> > +enum audit_nfcfgop {
> > +       AUDIT_XT_OP_REGISTER,
> > +       AUDIT_XT_OP_REPLACE,
> > +};
> > +
> >  extern int is_audit_feature_set(int which);
> >
> >  extern int __init audit_register_class(int class, unsigned *list);
> > @@ -379,6 +384,8 @@ extern int __audit_log_bprm_fcaps(struct linux_binprm *bprm,
> >  extern void __audit_fanotify(unsigned int response);
> >  extern void __audit_tk_injoffset(struct timespec64 offset);
> >  extern void __audit_ntp_log(const struct audit_ntp_data *ad);
> > +extern void __audit_log_nfcfg(const char *name, u8 af, unsigned int nentries,
> > +                             enum audit_nfcfgop op);
> >
> >  static inline void audit_ipc_obj(struct kern_ipc_perm *ipcp)
> >  {
> > @@ -514,6 +521,13 @@ static inline void audit_ntp_log(const struct audit_ntp_data *ad)
> >                 __audit_ntp_log(ad);
> >  }
> >
> > +static inline void audit_log_nfcfg(const char *name, u8 af, unsigned int nentries,
> > +                                  enum audit_nfcfgop op)
> > +{
> > +       if (audit_enabled)
> > +               __audit_log_nfcfg(name, af, nentries, op);
> 
> Do we want a dummy check here too?  Or do we always want to generate
> this record (assuming audit is enabled) because it is a configuration
> related record?

This is an audit configuration change, so it is mandatory unless there
is a rule that excludes it.  I talked about this in the cover letter,
but perhaps my wording wasn't as clear as it could have been.

audit_dummy_context was deliberately removed to make this record
delivered by default.

> paul moore

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

