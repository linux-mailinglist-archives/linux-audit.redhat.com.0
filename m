Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EE4F0275A9F
	for <lists+linux-audit@lfdr.de>; Wed, 23 Sep 2020 16:49:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600872559;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wq/Ae4DNkTskIJ/OBIvSWE3qwZmpzN7mtrtp7x2rNDw=;
	b=DAnlgJD9le4HeRMwiv2gCb13OmunadPNwrCz6WEj53k52RLneTFpKVk7BOmXRI/w/Ikbhy
	IBHRvfOLB0RJcn2BauVXKl0qg4goraQtyXRtp2zDyLVYwNnd7qVz9Mxvl5QgHy9FhnH5LN
	pdqXeO3krr/jT++PFDhaiI0guZ6V7oA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-4YQF-KeAMgGkyUIaTuiT2A-1; Wed, 23 Sep 2020 10:49:16 -0400
X-MC-Unique: 4YQF-KeAMgGkyUIaTuiT2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F7BC8ECE57;
	Wed, 23 Sep 2020 14:49:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C51A273668;
	Wed, 23 Sep 2020 14:49:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 08661183D040;
	Wed, 23 Sep 2020 14:49:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08NEn5bq023282 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 10:49:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1C82578822; Wed, 23 Sep 2020 14:49:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74D8C9CBA;
	Wed, 23 Sep 2020 14:48:55 +0000 (UTC)
Date: Wed, 23 Sep 2020 10:48:52 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak120 V5] audit: trigger accompanying records when no
	rules present
Message-ID: <20200923144852.GK822320@madcap2.tricolour.ca>
References: <7081a5b9c7d2e8085c49cec2fa72fcbb0b25e0d7.1600778472.git.rgb@redhat.com>
	<CAHC9VhSPk2RiMsnjTKw02_+_1Kagm06m+-r=ooNruT+fuuixYQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSPk2RiMsnjTKw02_+_1Kagm06m+-r=ooNruT+fuuixYQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: Linux Security Module list <linux-security-module@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-09-23 10:29, Paul Moore wrote:
> On Tue, Sep 22, 2020 at 8:45 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > When there are no audit rules registered, mandatory records (config,
> > etc.) are missing their accompanying records (syscall, proctitle, etc.).
> >
> > This is due to audit context dummy set on syscall entry based on absence
> > of rules that signals that no other records are to be printed.  Clear the dummy
> > bit if any record is generated, open coding this in audit_log_start().
> >
> > The proctitle context and dummy checks are pointless since the
> > proctitle record will not be printed if no syscall records are printed.
> >
> > The fds array is reset to -1 after the first syscall to indicate it
> > isn't valid any more, but was never set to -1 when the context was
> > allocated to indicate it wasn't yet valid.
> >
> > Check ctx->pwd in audit_log_name().
> >
> > The audit_inode* functions can be called without going through
> > getname_flags() or getname_kernel() that sets audit_names and cwd, so
> > set the cwd in audit_alloc_name() if it has not already been done so due to
> > audit_names being valid and purge all other audit_getcwd() calls.
> >
> > Revert the LSM dump_common_audit_data() LSM_AUDIT_DATA_* cases from the
> > ghak96 patch since they are no longer necessary due to cwd coverage in
> > audit_alloc_name().
> >
> > Thanks to bauen1 <j2468h@googlemail.com> for reporting LSM situations in
> > which context->cwd is not valid, inadvertantly fixed by the ghak96 patch.
> >
> > Please see upstream github issue
> > https://github.com/linux-audit/audit-kernel/issues/120
> > This is also related to upstream github issue
> > https://github.com/linux-audit/audit-kernel/issues/96
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> > Chagelog:
> > v5:
> > - open code audit_clear_dummy() in audit_log_start()
> > - fix check for ctx->pwd in audit_log_name()
> > - open code _audit_getcwd() contents in audit_alloc_name()
> > - ditch all *audit_getcwd() calls
> >
> > v4:
> > - resubmit after revert
> >
> > v3:
> > - initialize fds[0] to -1
> > - init cwd for ghak96 LSM_AUDIT_DATA_NET:AF_UNIX case
> > - init cwd for audit_inode{,_child}
> >
> > v2:
> > - unconditionally clear dummy
> > - create audit_clear_dummy accessor function
> > - remove proctitle context and dummy checks
> >
> >  include/linux/audit.h |  8 --------
> >  kernel/audit.c        |  3 +++
> >  kernel/auditsc.c      | 27 +++++++--------------------
> >  security/lsm_audit.c  |  5 -----
> >  4 files changed, 10 insertions(+), 33 deletions(-)
> 
> I've gone over this revision a couple of times now and it looks okay,
> but past experience is whispering in my ear that perhaps this is
> better to wait on this for the next cycle so it gets a full set of
> -rcX releases.  Thoughts?

I thought I had lots of time since we were just at the end of the
previous cycle when this failed the previous time...  Ran out yet
again...  (there were two weeks of PTO and a devel system rebuild in
there somewhere...)  It isn't my call.

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

