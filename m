Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 01FD32CCD81
	for <lists+linux-audit@lfdr.de>; Thu,  3 Dec 2020 04:53:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606967587;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IWxOVKkUpCIRYHSBqIqF72ejcY5SE9EvE7e8VLjGLLQ=;
	b=Yg/umbhDKDHicoTsoqFC+AxCFFmljCbhfi8rmsWPRyQsmtgocQ3f8OSGC1aJJAUI/T3VjW
	MotROCqZcK7t5LrGqlLc4Yt1f4x7yGYBvO6ObacPe0zj2N7iNYfLSQ1lCy1CS6VQB5J4Up
	9wjlBQKscqMLQMdcFzL6vlBvo5WeU9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-pRU2eMdLNI6WASCWW4ubaQ-1; Wed, 02 Dec 2020 22:53:04 -0500
X-MC-Unique: pRU2eMdLNI6WASCWW4ubaQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43B9C824FA8;
	Thu,  3 Dec 2020 03:52:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFB165C1BD;
	Thu,  3 Dec 2020 03:52:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D4434180954D;
	Thu,  3 Dec 2020 03:52:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B33qdZJ013086 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 2 Dec 2020 22:52:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8B89060BF1; Thu,  3 Dec 2020 03:52:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-30.rdu2.redhat.com [10.10.113.30])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC8B860BFA;
	Thu,  3 Dec 2020 03:52:35 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Max Englander <max.englander@gmail.com>, linux-audit@redhat.com,
	Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
Date: Wed, 02 Dec 2020 22:52:34 -0500
Message-ID: <11647352.O9o76ZdvQC@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhTctHCCrm4Q1cPdFX-6NXEtmjEPmw6rvUoxOq8UUmycxA@mail.gmail.com>
References: <20200701213244.GA1817@linux-kernel-dev>
	<CAHC9VhTctHCCrm4Q1cPdFX-6NXEtmjEPmw6rvUoxOq8UUmycxA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Paul,

On Thursday, July 2, 2020 4:42:13 PM EST Paul Moore wrote:
> > #define AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT     0x00000001
> > #define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME 0x00000002
> > @@ -348,6 +349,7 @@ enum {
> > #define AUDIT_FEATURE_BITMAP_SESSIONID_FILTER  0x00000010
> > #define AUDIT_FEATURE_BITMAP_LOST_RESET                0x00000020
> > #define AUDIT_FEATURE_BITMAP_FILTER_FS         0x00000040
> > +#define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_SUM  0x00000080
> 
> In an effort not to exhaust the feature bitmap too quickly, I've been
> restricting it to only those features that would cause breakage with
> userspace.  I haven't looked closely at Steve's userspace in quite a
> while, but I'm guessing it can key off the structure size and doesn't
> need this entry in the bitmap, right?  Let me rephrase, if userspace
> needs to key off anything, it *should* key off the structure size and
> not a new flag in the bitmask 
> 
> Also, I'm assuming that older userspace doesn't blow-up if it sees the
> larger structure size?  That's even more important.

We need this FEATURE_BITMAP to do anything in userspace. Max's instinct was 
right. Anything that changes the user space API needs to have a 
FEATURE_BITMAP so that user space can do the right thing. The lack of this is 
blocking acceptance of the pull request for the user space piece.

I am in a need of publishing the 3.0 release. This is the only blocker.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

