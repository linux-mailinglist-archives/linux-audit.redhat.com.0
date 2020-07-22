Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 05DC9228E3B
	for <lists+linux-audit@lfdr.de>; Wed, 22 Jul 2020 04:37:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595385434;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TFWMEcetttUVIfwxx/miBYWQuDFBuuyIEQ7XzXHOcvE=;
	b=EhR6R0dhFdayy53KHBZUCAoIhVjiNfeH7HSk/uf7pVy4k+8i4jbf6RMwGwMOxBFRV8d2dd
	no+pSfeY5z8bGoBFmmwc8KESSMI6DncB3EXEn2gZM1u4eeByzVUbxj4F5AAcyY/oQIEuck
	V1UwYuX2Aawk2J7n9X45WhtNUGjIjZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-gbPT_FzwN0SmFcHPxJW3Pw-1; Tue, 21 Jul 2020 22:37:11 -0400
X-MC-Unique: gbPT_FzwN0SmFcHPxJW3Pw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8D9218C63C1;
	Wed, 22 Jul 2020 02:37:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08C235D9D3;
	Wed, 22 Jul 2020 02:37:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76BD4730C3;
	Wed, 22 Jul 2020 02:36:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06M21BC7008354 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 22:01:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 55B001B46C; Wed, 22 Jul 2020 02:01:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F38B171EB;
	Wed, 22 Jul 2020 02:01:02 +0000 (UTC)
Date: Tue, 21 Jul 2020 22:01:00 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: null pointer dereference regression in 5.7
Message-ID: <20200722020100.tigrpqzoxj6pqf52@madcap2.tricolour.ca>
References: <9c8f1fc6-2b8e-e9e3-37bf-2d1d6bedace1@gmail.com>
	<360c7a62-fd39-ad02-60b8-87fb18022eeb@defensec.nl>
	<CAHC9VhRGJ4EwFYpRtoHe=m_GNB6WAt3cDCf7pd4YbvydEPpy3w@mail.gmail.com>
	<CAHC9VhTbMB==FaxwUDviw9D5-M6wUGnYwwHz7wCDMYSOUw07dA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTbMB==FaxwUDviw9D5-M6wUGnYwwHz7wCDMYSOUw07dA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: bauen1 <j2468h@googlemail.com>, linux-audit@redhat.com,
	Dominick Grift <dominick.grift@defensec.nl>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-07-21 18:45, Paul Moore wrote:
> On Tue, Jul 21, 2020 at 6:30 PM Paul Moore <paul@paul-moore.com> wrote:
> > Richard, you broke it, you bought it :)  Did you want to take a closer
> > look at this?  If you can't let me know.  Based on a quick look, my
> > gut feeling is that either context->pwd is never set properly or it is
> > getting free'd prematurely; I'm highly suspicious of the latter but
> > the former seems like it might be a reasonable place to start.
> 
> Actually, yes, I'm pretty certain the problem is that context->pwd is
> never set in this case.

Does the ghak96 upstream patch in audit/next on 5.8-rc1 fix it?
	d7481b24b816 ("audit: issue CWD record to accompany LSM_AUDIT_DATA_* records")

The avc is generated by common_lsm_audit() which calls
dump_common_audit_data() that now calls audit_getcwd() on the 5
LSM_AUDIT_DATA_* types that deal with paths.

> Normally context->pwd would be set by a call to
> audit_getname()/__audit_getname(), but if there audit context is a
> dummy context, that is skipped and context->pwd is never set.
> Normally that is fine, expect with Richard's patch if the kernel
> explicitly calls audit_log_start() we mark the context as ... not a
> dummy?  smart?  I'm not sure of the right term here ... which then
> triggers all the usual logging one would expect.  In this particular
> case, a SELinux AVC, the audit_log_start() happens *after* the
> pathname has been resolved and the audit_getname() calls are made;
> thus in this case context->pwd is not valid when the normal audit
> logging takes place on exit and things explode in predictable fashion.

The first two AVCs that were accompanied by syscalls had "items=0" but
the one that blew up had "items=2" so it appears the paths were already
present in the context, but missing the pwd.

> Unfortunately, it is beginning to look like 1320a4052ea1 ("audit:
> trigger accompanying records when no rules present") may be more
> dangerous than initially thought.  I'm borderline tempted to just
> revert this patch, but I'll leave this open for discussion ...
> Richard, I think you need to go through the code and audit all of the
> functions that store data in an audit context that are skipped when
> there is a dummy context to see which fields are potentially unset,
> and then look at all the end of task/syscall code to make sure the
> necessary set/unset checks are in place.

Auditing all the callers is not a small task, but I agree it may be
necessary.

> This should be a priority.
> 
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

