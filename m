Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 7620A18A7BD
	for <lists+linux-audit@lfdr.de>; Wed, 18 Mar 2020 23:10:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584569413;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rpJTs8sJZm62Ict0kG2jfIqBgkVwOuXVIFFvUgbwc/w=;
	b=U2IOrKJTSeq9RY5w5QtMKeb3wfkpmF9dQzbnrVdosyCKDF9K/5171X3q/4MJDvjDJG6NLF
	gWpxVcPnhaJkYPdGx/kTjG4N1/f7EfIefCuwzU4EW6INyeqUZZ0yhkGHUIBPuCQ54ukxIV
	rIjsvD7wHmc4SwGyF7b7ykbX4P/kXbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-HTj2BnLbP4CmxgppH6GkfQ-1; Wed, 18 Mar 2020 18:10:11 -0400
X-MC-Unique: HTj2BnLbP4CmxgppH6GkfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6775C107ACC9;
	Wed, 18 Mar 2020 22:10:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3EBD100164D;
	Wed, 18 Mar 2020 22:10:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CAA12860FE;
	Wed, 18 Mar 2020 22:10:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02IM9rsL008428 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Mar 2020 18:09:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 527531049485; Wed, 18 Mar 2020 22:09:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DAFA104FFA0
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 22:09:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB49F800299
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 22:09:50 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-40-mro0ei7UNj-NznLerwfdNg-1; Wed, 18 Mar 2020 18:09:48 -0400
X-MC-Unique: mro0ei7UNj-NznLerwfdNg-1
Received: by mail-ed1-f66.google.com with SMTP id b23so98887edx.4
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 15:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JfzzU/d7+bs7S8RW80xj5NfJqnX96IweXITa93PwcGY=;
	b=V/6Y5QG6Isg4hq5KCFKB19YI+6XoKM+ohg2tCl+nG2fap6Bf9eETmy/XgKxL+SPYkU
	FnApxZqBFndVe0uMQJF99KXnPJFJxgOaGhNYHFFXZgrcUiHomx/d4gwSEDYngpFk0JKe
	2IgZB6j7dh09KMPnuOmP30YSs63/ENBAzy+cnj2emS/Ap3FKZmnabYGl+gmNHpBf8Oj6
	xOXzXqItls4M4Ye4rV3yZc75K2Q7Wfbqb7SbBSx3dvkcS1FmCcx+dpSEkpafNeogh+oJ
	25NjTfQcyU1tu6siDdfqJ0OMsPBtz+YjTjfHarE4gdgQjgC1jUvQ9et7SbDIodMHdnki
	H+6A==
X-Gm-Message-State: ANhLgQ0lDBP0RaFCgh8oL18NYmadrhwXxdA8TdAR14WkEMets0j2DqAU
	9C5SLvH22O0z3Vj9Mt+rx0DQR0WSVuSl0N2waR6z
X-Google-Smtp-Source: ADFU+vtv7H8q642zA3Wkxs658/ZoOMch5bUgWLX+GZ4bvwWx9WnStK5co0hnRa4gNXJW1Fh+y+4mGyf0BwiQnb6dSVs=
X-Received: by 2002:a17:906:7b8d:: with SMTP id
	s13mr352313ejo.77.1584569386895; 
	Wed, 18 Mar 2020 15:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584480281.git.rgb@redhat.com>
	<3d591dc49fcb643890b93e5b9a8169612b1c96e1.1584480281.git.rgb@redhat.com>
	<CAHC9VhTQBxzFrGn=+b9MzoapV0iiccPOLvkwemdESSb6nOFGXQ@mail.gmail.com>
	<20200318220012.xeeoeidz5vs6x7g4@madcap2.tricolour.ca>
In-Reply-To: <20200318220012.xeeoeidz5vs6x7g4@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 18 Mar 2020 18:09:36 -0400
Message-ID: <CAHC9VhTFSNhedSmJA38zdq3gXira9FQ6D-bFUFxnwWKcJOfpUQ@mail.gmail.com>
Subject: Re: [PATCH ghak25 v3 1/3] audit: tidy and extend netfilter_cfg
	x_tables and ebtables logging
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02IM9rsL008428
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 18, 2020 at 6:00 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-03-18 17:54, Paul Moore wrote:
> > On Tue, Mar 17, 2020 at 5:31 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > NETFILTER_CFG record generation was inconsistent for x_tables and
> > > ebtables configuration changes.  The call was needlessly messy and there
> > > were supporting records missing at times while they were produced when
> > > not requested.  Simplify the logging call into a new audit_log_nfcfg
> > > call.  Honour the audit_enabled setting while more consistently
> > > recording information including supporting records by tidying up dummy
> > > checks.
> > >
> > > Add an op= field that indicates the operation being performed (register
> > > or replace).
> > >
> > > Here is the enhanced sample record:
> > >   type=NETFILTER_CFG msg=audit(1580905834.919:82970): table=filter family=2 entries=83 op=replace
> > >
> > > Generate audit NETFILTER_CFG records on ebtables table registration.
> > > Previously this was being done for x_tables registration and replacement
> > > operations and ebtables table replacement only.
> > >
> > > See: https://github.com/linux-audit/audit-kernel/issues/25
> > > See: https://github.com/linux-audit/audit-kernel/issues/35
> > > See: https://github.com/linux-audit/audit-kernel/issues/43
> > >
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > >  include/linux/audit.h           | 19 +++++++++++++++++++
> > >  kernel/auditsc.c                | 24 ++++++++++++++++++++++++
> > >  net/bridge/netfilter/ebtables.c | 12 ++++--------
> > >  net/netfilter/x_tables.c        | 12 +++---------
> > >  4 files changed, 50 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > > index f9ceae57ca8d..f4aed2b9be8d 100644
> > > --- a/include/linux/audit.h
> > > +++ b/include/linux/audit.h
> > > @@ -94,6 +94,11 @@ struct audit_ntp_data {
> > >  struct audit_ntp_data {};
> > >  #endif
> > >
> > > +enum audit_nfcfgop {
> > > +       AUDIT_XT_OP_REGISTER,
> > > +       AUDIT_XT_OP_REPLACE,
> > > +};
> > > +
> > >  extern int is_audit_feature_set(int which);
> > >
> > >  extern int __init audit_register_class(int class, unsigned *list);
> > > @@ -379,6 +384,8 @@ extern int __audit_log_bprm_fcaps(struct linux_binprm *bprm,
> > >  extern void __audit_fanotify(unsigned int response);
> > >  extern void __audit_tk_injoffset(struct timespec64 offset);
> > >  extern void __audit_ntp_log(const struct audit_ntp_data *ad);
> > > +extern void __audit_log_nfcfg(const char *name, u8 af, unsigned int nentries,
> > > +                             enum audit_nfcfgop op);
> > >
> > >  static inline void audit_ipc_obj(struct kern_ipc_perm *ipcp)
> > >  {
> > > @@ -514,6 +521,13 @@ static inline void audit_ntp_log(const struct audit_ntp_data *ad)
> > >                 __audit_ntp_log(ad);
> > >  }
> > >
> > > +static inline void audit_log_nfcfg(const char *name, u8 af, unsigned int nentries,
> > > +                                  enum audit_nfcfgop op)
> > > +{
> > > +       if (audit_enabled)
> > > +               __audit_log_nfcfg(name, af, nentries, op);
> >
> > Do we want a dummy check here too?  Or do we always want to generate
> > this record (assuming audit is enabled) because it is a configuration
> > related record?
>
> This is an audit configuration change, so it is mandatory unless there
> is a rule that excludes it.  I talked about this in the cover letter,
> but perhaps my wording wasn't as clear as it could have been.

Yes, it wasn't clear to me what your goals were.

In general I think this patchset looks okay, but it's -rc6 so this
should wait for the next cycle; it will also give the netdev/netfilter
folks a chance to comment on this latest revision.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

