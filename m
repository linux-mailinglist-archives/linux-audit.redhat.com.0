Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E175C21E317
	for <lists+linux-audit@lfdr.de>; Tue, 14 Jul 2020 00:38:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594679917;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=M3Rk+iGsOVe9HVhkNhsK7MoC6n6uXAn8Wr71lXMjPZQ=;
	b=YtSmHeQGTcAAU8TdeLNBNdbP2uIYiG7tq0vGAgluklX2UkrkK9qfGXnm0o8xsl86qNAKh9
	6olgSvAFTDxwcqjemDJ05Tpv1A6phG9FbE6V4YB/Dv7TL+t/+cN4AeF9Km4saveA67hitb
	wsAijiyO7V3SM3MDLOxAgOj1cy4U18Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-qIoTWiRSM2Src26QtzhsbA-1; Mon, 13 Jul 2020 18:38:35 -0400
X-MC-Unique: qIoTWiRSM2Src26QtzhsbA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D861719253C3;
	Mon, 13 Jul 2020 22:38:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B60C85C1BB;
	Mon, 13 Jul 2020 22:38:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 23A8B93F9A;
	Mon, 13 Jul 2020 22:38:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DMbkrE008365 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 18:37:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0861F710B1; Mon, 13 Jul 2020 22:37:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-114-254.phx2.redhat.com [10.3.114.254])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF9E1710A4;
	Mon, 13 Jul 2020 22:37:39 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak122 v1] audit: store event sockaddr in case of no rules
Date: Mon, 13 Jul 2020 18:37:39 -0400
Message-ID: <4123642.6I18aBlvK5@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhR0g0TF9EshBhNi7UuQ=6oLKE9vmBQruEoAy_YrQfj+aQ@mail.gmail.com>
References: <b62d4388b488dedfa2758f32e6d1e5414179b4f2.1593796497.git.rgb@redhat.com>
	<20200713174014.mjsdugomgjtl3kgz@madcap2.tricolour.ca>
	<CAHC9VhR0g0TF9EshBhNi7UuQ=6oLKE9vmBQruEoAy_YrQfj+aQ@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, Eric Paris <eparis@parisplace.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, July 13, 2020 6:30:51 PM EDT Paul Moore wrote:
> On Mon, Jul 13, 2020 at 1:40 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-07-08 18:49, Paul Moore wrote:
> > > On Fri, Jul 3, 2020 at 1:18 PM Richard Guy Briggs <rgb@redhat.com> 
wrote:
> > > > When there are no rules present, the event SOCKADDR record is not
> > > > generated due to audit_dummy_context() generated at syscall entry
> > > > from
> > > > audit_n_rules.  Store this information if there is a context present
> > > > to
> > > > store it so that mandatory events are more complete (startup,
> > > > LSMs...).
> > > > 
> > > > Please see the upstream issue
> > > > https://github.com/linux-audit/audit-kernel/issues/122
> > > > 
> > > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > > ---
> > > > Passes audit-testsuite.
> > > > 
> > > > include/linux/audit.h | 2 +-
> > > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > Do we have any certification requirements driving this change?  I ask
> > > because if we make this change, why not do the same for PATH records?
> > 
> > I filed the issue because I noticed the SOCKADDR record missing from
> > configuration events required for certification.
> 
> I guess my original question wasn't very clear, let me try again ...
> 
> Do we have any certification requirements for this that require the
> SOCKADDR record without an explicit audit configuration that would
> capture/generate the sockaddr information? 

No. There is no need to include either the SYSCALL or SOCKADDR record when 
logging an audit config change event because it will always be sendto and 
netlink. I suppose this is being done for consistency and not due to 
certification. We just need the usual minimal information logged and nothing 
else.

-Steve


> It's been a while since
> I've been involved in a certification effort, but if I remember
> correctly those efforts required a specific audit configuration to be
> compliant (file watches, syscall rules, etc.).
> 
> If there is a certification requirement for this, it might be a good
> idea to include it in the commit description.  I don't believe we've
> been very good about doing that in the past, but it seems like
> something that would be worthwhile.




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

