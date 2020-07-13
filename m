Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9B19A21DEE8
	for <lists+linux-audit@lfdr.de>; Mon, 13 Jul 2020 19:41:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594662065;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BxfOMrHD+xW5E8LVWzCCC2JCctO2N4FzGKg0gzqNU94=;
	b=MGJYzuQ5sBg769cghSrMgTeeLQO65WGQFVS/KCk8UT5dmTu4K/eUg2HdxCPg+i+031pjGz
	Jxunsc+8QXNcW0/ijpvLxqEDdVLWHER/xlqOaZh4Vpuvu6nf+Ovk9CCWoXEBRS2zIoR4md
	YFo8uEq6h2tW+c5/hhbnDWJS3cbEbbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-yhqGGqIxOSWhEU5BY26Ing-1; Mon, 13 Jul 2020 13:40:51 -0400
X-MC-Unique: yhqGGqIxOSWhEU5BY26Ing-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3AEC8BE403;
	Mon, 13 Jul 2020 17:40:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 266EC61983;
	Mon, 13 Jul 2020 17:40:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50B3B1809547;
	Mon, 13 Jul 2020 17:40:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DHeUic005140 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 13:40:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C7C4979CEA; Mon, 13 Jul 2020 17:40:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DE9579D1F;
	Mon, 13 Jul 2020 17:40:17 +0000 (UTC)
Date: Mon, 13 Jul 2020 13:40:14 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak122 v1] audit: store event sockaddr in case of no rules
Message-ID: <20200713174014.mjsdugomgjtl3kgz@madcap2.tricolour.ca>
References: <b62d4388b488dedfa2758f32e6d1e5414179b4f2.1593796497.git.rgb@redhat.com>
	<CAHC9VhReURKRe63t7mudKpkW0aVNpCmF=UWHSof1uvRkmZ8HTQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhReURKRe63t7mudKpkW0aVNpCmF=UWHSof1uvRkmZ8HTQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-07-08 18:49, Paul Moore wrote:
> On Fri, Jul 3, 2020 at 1:18 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > When there are no rules present, the event SOCKADDR record is not
> > generated due to audit_dummy_context() generated at syscall entry from
> > audit_n_rules.  Store this information if there is a context present to
> > store it so that mandatory events are more complete (startup, LSMs...).
> >
> > Please see the upstream issue
> > https://github.com/linux-audit/audit-kernel/issues/122
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> > Passes audit-testsuite.
> >
> >  include/linux/audit.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Do we have any certification requirements driving this change?  I ask
> because if we make this change, why not do the same for PATH records?

I filed the issue because I noticed the SOCKADDR record missing from
configuration events required for certification.

> The problem of course is that doing this for both is going to be
> costly, the PATH records in particular seem like they would raise a
> performance regression.

I had a minor concern about performance for SOCKADDR.  I filed SOCKADDR
because I noticed it missing, but intended to file others as noticed.

I agree the PATH records would have a larger performance concern, but if
they are required to support event records that are required for
certification then either we store them when the context is present or
generate them retroactively once a required event record is generated.

In the case of SOCKADDR it may be possible to store that information
once the required record has been generated rather than whenever there
is a valid audit context, but it is currently collected earlier than
config records are emitted.

> I agree it would be nice to have this information, but I fear that
> gating this on audit_dummy_context() is the right thing to do unless
> there is a strong requirement that we always record this information.

That would have been great feedback when the issue was filed.
However, there may be a middle ground as descirbed above.

> > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > index 03c4035a532b..07fecd99741a 100644
> > --- a/include/linux/audit.h
> > +++ b/include/linux/audit.h
> > @@ -448,7 +448,7 @@ static inline int audit_socketcall_compat(int nargs, u32 *args)
> >
> >  static inline int audit_sockaddr(int len, void *addr)
> >  {
> > -       if (unlikely(!audit_dummy_context()))
> > +       if (audit_context())
> >                 return __audit_sockaddr(len, addr);
> >         return 0;
> >  }

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

