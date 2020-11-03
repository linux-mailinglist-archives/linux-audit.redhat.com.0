Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 434432A44B0
	for <lists+linux-audit@lfdr.de>; Tue,  3 Nov 2020 13:01:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604404862;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AhTwGwteMk6mEXhlF4bXzKKILpDvEoy12xlBxK52d7E=;
	b=ER9IhsXmMzyrp7C6JbTxSFnOpNwsuhXoKeVA5Ty1JkNcjAoQBsHYddSFlB4hZCugGhlWVv
	zOdg3ppy6bW5npFpokVUQW3ceATNa5hEOIlElU2Macwl5Nk4ZX1VcK1S+REeq1XwPpGTtC
	y3/QL7c7rPMdFvML6/o73LR4Et5oK/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-wucI3mVPORm1hxGsannEzQ-1; Tue, 03 Nov 2020 07:01:00 -0500
X-MC-Unique: wucI3mVPORm1hxGsannEzQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8EF2876E3C;
	Tue,  3 Nov 2020 12:00:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EEAF5FC31;
	Tue,  3 Nov 2020 12:00:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CAB66181A050;
	Tue,  3 Nov 2020 12:00:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A3C0V59011319 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 3 Nov 2020 07:00:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5BA31413C; Tue,  3 Nov 2020 12:00:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34318672C0;
	Tue,  3 Nov 2020 12:00:13 +0000 (UTC)
Date: Tue, 3 Nov 2020 07:00:11 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [RFC PATCH] audit-testsuite: tests for subject and object
	correctness
Message-ID: <20201103120011.GA55411@madcap2.tricolour.ca>
References: <e4bf30e2-a92f-99b7-30d0-3e3473e30399.ref@schaufler-ca.com>
	<e4bf30e2-a92f-99b7-30d0-3e3473e30399@schaufler-ca.com>
	<20201102220834.GD55072@madcap2.tricolour.ca>
	<6c950188-a516-e9ed-caa5-42de40861596@schaufler-ca.com>
	<20201103011925.GF55072@madcap2.tricolour.ca>
	<CAHC9VhS9vyNj_ygkWFQssFb3FDoQ3C1dekiFEFXMgTCOL1bqLg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhS9vyNj_ygkWFQssFb3FDoQ3C1dekiFEFXMgTCOL1bqLg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020-11-02 22:31, Paul Moore wrote:
> On Mon, Nov 2, 2020 at 8:19 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-11-02 14:51, Casey Schaufler wrote:
> > > On 11/2/2020 2:08 PM, Richard Guy Briggs wrote:
> > > > On 2020-11-02 13:54, Casey Schaufler wrote:
> > > >> Verify that there are subj= and obj= fields in a record
> > > >> if and only if they are expected. A system without a security
> > > >> module that provides these fields should not include them.
> > > >> A system with multiple security modules providing these fields
> > > >> (e.g. SELinux and AppArmor) should always provide "?" for the
> > > >> data and also include a AUDIT_MAC_TASK_CONTEXTS or
> > > >> AUDIT_MAC_OBJ_CONTEXTS record. The test uses the LSM list from
> > > >> /sys/kernel/security/lsm to determine which format is expected.
> > > >>
> > > >> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> > > >> ---
> > > >>  tests/Makefile                   |   1 +
> > > >>  tests/multiple_contexts/Makefile |  12 +++
> > > >>  tests/multiple_contexts/test     | 166 +++++++++++++++++++++++++++++++
> > > >>  3 files changed, 179 insertions(+)
> > > >>  create mode 100644 tests/multiple_contexts/Makefile
> > > >>  create mode 100755 tests/multiple_contexts/test
> > > >>
> > > >> diff --git a/tests/Makefile b/tests/Makefile
> > > >> index a7f242a..f20f6b1 100644
> > > >> --- a/tests/Makefile
> > > >> +++ b/tests/Makefile
> > > >> @@ -18,6 +18,7 @@ TESTS := \
> > > >>    file_create \
> > > >>    file_delete \
> > > >>    file_rename \
> > > >> +  multiple_contexts \
> > > > "context" is a bit ambiguous.  Could this be named something to indicate
> > > > a security context rather than any other sort, such as audit or user
> > > > context?
> > >
> > > Would "subj_obj_fields" be better?
> >
> > That is much more obvious to me.  Maybe even sec_context_multi, but I
> > like your suggestion better?
> 
> How about just "multiple_lsms"?  It's relatively concise and better
> reflects what it is actually being tested IMHO.

Yes, that's better.  Works for me.

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

