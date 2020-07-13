Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id F349221E119
	for <lists+linux-audit@lfdr.de>; Mon, 13 Jul 2020 22:02:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594670559;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CRpyNsEvhDrw8sBu4yWM0plezRa5OteYLI5806UQyCM=;
	b=VtNiqkkLD7FFwq+Urw67qD+ub9NVSkvkFIYqlO0nKe0OKu/9hkmhPe59nShnurPvehXmFG
	+tCZaJx2ErRNx4+MuYY3yUyxchQ5C/eM0UZQHaQz3jyZR2ZROiOdyp3fHDFFYKML7l0v5g
	8/C8k3rbjXHpXiY1ZTCzCQn1bYx4Lfs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-m9b54zucND-11__Yspz8EA-1; Mon, 13 Jul 2020 16:02:34 -0400
X-MC-Unique: m9b54zucND-11__Yspz8EA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E04B80BCBE;
	Mon, 13 Jul 2020 20:02:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D27D710A0;
	Mon, 13 Jul 2020 20:02:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9815E94EEC;
	Mon, 13 Jul 2020 20:02:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DK2OMF021151 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 16:02:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BFA9B71683; Mon, 13 Jul 2020 20:02:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 985FE72E47;
	Mon, 13 Jul 2020 20:02:17 +0000 (UTC)
Date: Mon, 13 Jul 2020 16:02:14 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH ghak122 v1] audit: store event sockaddr in case of no rules
Message-ID: <20200713200214.qh3vnhcjozpnqf2l@madcap2.tricolour.ca>
References: <b62d4388b488dedfa2758f32e6d1e5414179b4f2.1593796497.git.rgb@redhat.com>
	<CAHC9VhReURKRe63t7mudKpkW0aVNpCmF=UWHSof1uvRkmZ8HTQ@mail.gmail.com>
	<20200713174014.mjsdugomgjtl3kgz@madcap2.tricolour.ca>
	<9ec00f40-e7e9-950e-4ed9-48533a9ee223@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <9ec00f40-e7e9-950e-4ed9-48533a9ee223@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-07-13 10:55, Casey Schaufler wrote:
> On 7/13/2020 10:40 AM, Richard Guy Briggs wrote:
> > On 2020-07-08 18:49, Paul Moore wrote:
> >> On Fri, Jul 3, 2020 at 1:18 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >>> When there are no rules present, the event SOCKADDR record is not
> >>> generated due to audit_dummy_context() generated at syscall entry from
> >>> audit_n_rules.  Store this information if there is a context present to
> >>> store it so that mandatory events are more complete (startup, LSMs...).
> 
> I don't know for sure, but this looks a lot like the issues
> I have had to address for LSM stacking in
> 
> [PATCH v18 20/23] Audit: Add new record for multiple process LSM attributes
> 
> I don't know if the approach I took will help here, or be
> acceptable at all for that matter. But it might be worth taking
> a look.

The first thing I notice is audit_stamp_context() looks pretty similar
to audit_alloc_local() in

[PATCH ghak90 V9 07/13] audit: add support for non-syscall auxiliary records

which creates a local context for limited use by the primary record and
local auxiliary records (contid) and is immediately tossed after those
records.  One use case is network namespace events that are not (yet)
tied to any user context ("[PATCH ghak90 V9 10/13] audit: add support
for containerid to network namespaces").  The other is for user records
that don't need to be tied to the userspace caller ("[PATCH ghak90 V9
08/13] audit: add containerid support for user records").

How does this tie in with this situation?  I would ideally like to
retroactively capture the sockaddr information in the audit context
struct (to avoid the overhead of always capturing sockaddr) to trigger a
syscall record on exit along with a sockaddr record once a manadatory
record has been triggered (such as audit or netfilter config, LSM event,
etc...), depending only on audit_enabled.  There could be other
substructures of audit context that would need filling out after it is
determined that an audit event has happenned and information needs to be
collected to support its reporting.

> >>> Please see the upstream issue
> >>> https://github.com/linux-audit/audit-kernel/issues/122
> >>>
> >>> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> >>> ---
> >>> Passes audit-testsuite.
> >>>
> >>>  include/linux/audit.h | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >> Do we have any certification requirements driving this change?  I ask
> >> because if we make this change, why not do the same for PATH records?
> > I filed the issue because I noticed the SOCKADDR record missing from
> > configuration events required for certification.
> >
> >> The problem of course is that doing this for both is going to be
> >> costly, the PATH records in particular seem like they would raise a
> >> performance regression.
> > I had a minor concern about performance for SOCKADDR.  I filed SOCKADDR
> > because I noticed it missing, but intended to file others as noticed.
> >
> > I agree the PATH records would have a larger performance concern, but if
> > they are required to support event records that are required for
> > certification then either we store them when the context is present or
> > generate them retroactively once a required event record is generated.
> >
> > In the case of SOCKADDR it may be possible to store that information
> > once the required record has been generated rather than whenever there
> > is a valid audit context, but it is currently collected earlier than
> > config records are emitted.
> >
> >> I agree it would be nice to have this information, but I fear that
> >> gating this on audit_dummy_context() is the right thing to do unless
> >> there is a strong requirement that we always record this information.
> > That would have been great feedback when the issue was filed.
> > However, there may be a middle ground as descirbed above.
> >
> >>> diff --git a/include/linux/audit.h b/include/linux/audit.h
> >>> index 03c4035a532b..07fecd99741a 100644
> >>> --- a/include/linux/audit.h
> >>> +++ b/include/linux/audit.h
> >>> @@ -448,7 +448,7 @@ static inline int audit_socketcall_compat(int nargs, u32 *args)
> >>>
> >>>  static inline int audit_sockaddr(int len, void *addr)
> >>>  {
> >>> -       if (unlikely(!audit_dummy_context()))
> >>> +       if (audit_context())
> >>>                 return __audit_sockaddr(len, addr);
> >>>         return 0;
> >>>  }
> >> paul moore
> > - RGB

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

