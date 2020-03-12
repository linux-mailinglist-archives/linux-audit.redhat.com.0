Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A6E1C1833D8
	for <lists+linux-audit@lfdr.de>; Thu, 12 Mar 2020 15:55:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584024917;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jl3Ojr1iBznrxpbzj63C5JW9g6BakHqJZEtGZJ4wvP4=;
	b=BfP8n9X+WR2hdywvZR9FVTQRHYNXGKzV1rGV+DuXf6lQdx6VBRbpLas8qQKwslQmemcxQW
	mU4ReTD5lEDBYn3w5d9ztA/x+NPCzg1Tzw6+4IAE7GTjxl7vijm8X3cBhOqruey6PLhqZD
	0s79CUjov+eKJlhyewGrGXzCe47BNiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-9O5l1_O_M6qfSBb9rjVvHA-1; Thu, 12 Mar 2020 10:55:15 -0400
X-MC-Unique: 9O5l1_O_M6qfSBb9rjVvHA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CBB4189F763;
	Thu, 12 Mar 2020 14:55:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B7BC1001B34;
	Thu, 12 Mar 2020 14:55:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D556385ECB;
	Thu, 12 Mar 2020 14:55:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02CEt13t025343 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 12 Mar 2020 10:55:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6A43E8FBE0; Thu, 12 Mar 2020 14:55:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.rdu2.redhat.com
	[10.10.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B221960304;
	Thu, 12 Mar 2020 14:54:55 +0000 (UTC)
Date: Thu, 12 Mar 2020 10:54:52 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH V2 ghak120] audit: trigger accompanying records when no
	rules present
Message-ID: <20200312145452.7fup3pf3xjdziwbs@madcap2.tricolour.ca>
References: <199b556aae531db6e08f2711b1751e976f8bd48a.1583801740.git.rgb@redhat.com>
	<CAHC9VhQhO6Srbs=ivb5j2HLmAW1aA+Ju6hpyxUCovT7gm3kJjQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQhO6Srbs=ivb5j2HLmAW1aA+Ju6hpyxUCovT7gm3kJjQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>
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
Content-Disposition: inline

On 2020-03-12 10:51, Paul Moore wrote:
> On Tue, Mar 10, 2020 at 9:21 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > When there are no audit rules registered, mandatory records (config,
> > etc.) are missing their accompanying records (syscall, proctitle, etc.).
> >
> > This is due to audit context dummy set on syscall entry based on absence
> > of rules that signals that no other records are to be printed.
> >
> > Clear the dummy bit if any record is generated.
> >
> > The proctitle context and dummy checks are pointless since the
> > proctitle record will not be printed if no syscall records are printed.
> >
> > Please see upstream github issue
> > https://github.com/linux-audit/audit-kernel/issues/120
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> > Chagelog:
> > v2:
> > - unconditionally clear dummy
> > - create audit_clear_dummy accessor function
> > - remove proctitle context and dummy checks
> > ---
> >  kernel/audit.c   | 1 +
> >  kernel/audit.h   | 8 ++++++++
> >  kernel/auditsc.c | 3 ---
> >  3 files changed, 9 insertions(+), 3 deletions(-)
> 
> Merged into audit/next, thanks.

Danke!

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

