Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 27BDC21E304
	for <lists+linux-audit@lfdr.de>; Tue, 14 Jul 2020 00:31:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-e1EBoqkbPGi9OjMHWP9JHw-1; Mon, 13 Jul 2020 18:31:35 -0400
X-MC-Unique: e1EBoqkbPGi9OjMHWP9JHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BD128027EE;
	Mon, 13 Jul 2020 22:31:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E43060BEC;
	Mon, 13 Jul 2020 22:31:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31A7D94EFA;
	Mon, 13 Jul 2020 22:31:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DMV8KE007836 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 18:31:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 84CFA1134CBC; Mon, 13 Jul 2020 22:31:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8016D1134CB9
	for <linux-audit@redhat.com>; Mon, 13 Jul 2020 22:31:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74DA9100E7C6
	for <linux-audit@redhat.com>; Mon, 13 Jul 2020 22:31:06 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-22-pq0CGkT5OISWVDQeio7UYw-1; Mon, 13 Jul 2020 18:31:04 -0400
X-MC-Unique: pq0CGkT5OISWVDQeio7UYw-1
Received: by mail-ej1-f65.google.com with SMTP id y10so19299217eje.1
	for <linux-audit@redhat.com>; Mon, 13 Jul 2020 15:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dQwLvvXhPr8TRX8jzrdq3nDnildnZqCWeQDO8We7LKg=;
	b=T1SSjcC2JIflsHHFGCKZrnosfNvlO9jh5i5A6pTYxdMODje7Egbu0Es4pSoqwiyAWo
	EFoG9ZF4Y/8YxGqh58XWz27h9HdJz3XmEerBZkpUHRjD+0BliqXw3ESKhK/R1vjGIKTa
	swoPNG7Qm7pw08P+PiTzZ8ZBMWF3p5f2ok+JK3qPBSyRZrQ700Cs8dMdg5Gx/3HTRgQ4
	r+mSmQGdTdMGgP5uaUAmdJu60V6DoEThtjVKwk3wFES6Zd4qZx8Bs1mSRVYun3GYz6d/
	zOJaIEuTT6i0GuE6uZaHqa9W2U1BM0tXsbGbL1Ydcdwf3XI8FT7BU62KU65W/OPc5QzO
	xl7Q==
X-Gm-Message-State: AOAM531jcsN7ri+pIMSfkJiBe6jvuGivw7RHKbxJJcJcb5UGRxpjwJWv
	qF05tSEhcx+BUPIpH5eYLlewwHOe+ZCrbCazn075
X-Google-Smtp-Source: ABdhPJwWqG/7gPKtcqmdreuXseYuVIwlkC5KHasJRQ8NYzew5b8IJ4eMZKlsLh+86VIiLogdT6Zt6dbEIvyqophyAAs=
X-Received: by 2002:a17:906:456:: with SMTP id
	e22mr1806024eja.178.1594679462674; 
	Mon, 13 Jul 2020 15:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <b62d4388b488dedfa2758f32e6d1e5414179b4f2.1593796497.git.rgb@redhat.com>
	<CAHC9VhReURKRe63t7mudKpkW0aVNpCmF=UWHSof1uvRkmZ8HTQ@mail.gmail.com>
	<20200713174014.mjsdugomgjtl3kgz@madcap2.tricolour.ca>
In-Reply-To: <20200713174014.mjsdugomgjtl3kgz@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 13 Jul 2020 18:30:51 -0400
Message-ID: <CAHC9VhR0g0TF9EshBhNi7UuQ=6oLKE9vmBQruEoAy_YrQfj+aQ@mail.gmail.com>
Subject: Re: [PATCH ghak122 v1] audit: store event sockaddr in case of no rules
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 13, 2020 at 1:40 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-07-08 18:49, Paul Moore wrote:
> > On Fri, Jul 3, 2020 at 1:18 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > When there are no rules present, the event SOCKADDR record is not
> > > generated due to audit_dummy_context() generated at syscall entry from
> > > audit_n_rules.  Store this information if there is a context present to
> > > store it so that mandatory events are more complete (startup, LSMs...).
> > >
> > > Please see the upstream issue
> > > https://github.com/linux-audit/audit-kernel/issues/122
> > >
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > > Passes audit-testsuite.
> > >
> > >  include/linux/audit.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Do we have any certification requirements driving this change?  I ask
> > because if we make this change, why not do the same for PATH records?
>
> I filed the issue because I noticed the SOCKADDR record missing from
> configuration events required for certification.

I guess my original question wasn't very clear, let me try again ...

Do we have any certification requirements for this that require the
SOCKADDR record without an explicit audit configuration that would
capture/generate the sockaddr information?  It's been a while since
I've been involved in a certification effort, but if I remember
correctly those efforts required a specific audit configuration to be
compliant (file watches, syscall rules, etc.).

If there is a certification requirement for this, it might be a good
idea to include it in the commit description.  I don't believe we've
been very good about doing that in the past, but it seems like
something that would be worthwhile.

> > The problem of course is that doing this for both is going to be
> > costly, the PATH records in particular seem like they would raise a
> > performance regression.
>
> I had a minor concern about performance for SOCKADDR.  I filed SOCKADDR
> because I noticed it missing, but intended to file others as noticed.
>
> I agree the PATH records would have a larger performance concern, but if
> they are required to support event records that are required for
> certification then either we store them when the context is present or
> generate them retroactively once a required event record is generated.
>
> In the case of SOCKADDR it may be possible to store that information
> once the required record has been generated rather than whenever there
> is a valid audit context, but it is currently collected earlier than
> config records are emitted.

Before we go too far on this, let's track down the answer to the
question above - is this more an issue of having the proper,
certification-compliant audit configuration loaded into the kernel?

> > I agree it would be nice to have this information, but I fear that
> > gating this on audit_dummy_context() is the right thing to do unless
> > there is a strong requirement that we always record this information.
>
> That would have been great feedback when the issue was filed.
> However, there may be a middle ground as descirbed above.

I've mentioned before that while the GH issues are nice for tracking
issues, technical discussions should happen on list ... like they are
now.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

