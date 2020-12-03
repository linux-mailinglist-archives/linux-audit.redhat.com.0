Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C9C842CD6CE
	for <lists+linux-audit@lfdr.de>; Thu,  3 Dec 2020 14:33:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607002391;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VlU+pTZcytvuVqViKIzOnBn1tbZgjNPtmP3pLAgQZHY=;
	b=NO240uWKXgi50ewnrR6zI7Z55oSo9i9dbPeZwmTR+ow9pJfO7TrhfUiQQztasBM7fV41aV
	ef46yvABZ6ZXKUTCBjzM0qGX5D7/UyfXRFoRSWTLn+vmErKRP4fQ+H6G/WzksrxYKDSXs4
	Yr0lTnu0to+iguuSv/DShd+dP74rPFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-HAZDbEVJPyuNV-r9aPv9eA-1; Thu, 03 Dec 2020 08:33:09 -0500
X-MC-Unique: HAZDbEVJPyuNV-r9aPv9eA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C507287A842;
	Thu,  3 Dec 2020 13:32:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 664287EE64;
	Thu,  3 Dec 2020 13:32:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DE54180954D;
	Thu,  3 Dec 2020 13:32:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3DVF3I011187 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 08:31:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2F5055D6CF; Thu,  3 Dec 2020 13:31:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.10.115.251])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 827965D6AC;
	Thu,  3 Dec 2020 13:31:11 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
Date: Thu, 03 Dec 2020 08:31:10 -0500
Message-ID: <2565471.mvXUDI8C0e@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhQzRP6Gyji83MEjQbdZxePLFn2Ai7Zo-Wd0D7MPqQ_Ekw@mail.gmail.com>
References: <20200701213244.GA1817@linux-kernel-dev> <11647352.O9o76ZdvQC@x2>
	<CAHC9VhQzRP6Gyji83MEjQbdZxePLFn2Ai7Zo-Wd0D7MPqQ_Ekw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, December 2, 2020 11:12:31 PM EST Paul Moore wrote:
> On Wed, Dec 2, 2020 at 10:52 PM Steve Grubb <sgrubb@redhat.com> wrote:
> > Hello Paul,
> 
> Steve.
> 
> > On Thursday, July 2, 2020 4:42:13 PM EST Paul Moore wrote:
> > > > #define AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT     0x00000001
> > > > #define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME 0x00000002
> > > > @@ -348,6 +349,7 @@ enum {
> > > > #define AUDIT_FEATURE_BITMAP_SESSIONID_FILTER  0x00000010
> > > > #define AUDIT_FEATURE_BITMAP_LOST_RESET                0x00000020
> > > > #define AUDIT_FEATURE_BITMAP_FILTER_FS         0x00000040
> > > > +#define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_SUM  0x00000080
> > > 
> > > In an effort not to exhaust the feature bitmap too quickly, I've been
> > > restricting it to only those features that would cause breakage with
> > > userspace.  I haven't looked closely at Steve's userspace in quite a
> > > while, but I'm guessing it can key off the structure size and doesn't
> > > need this entry in the bitmap, right?  Let me rephrase, if userspace
> > > needs to key off anything, it *should* key off the structure size and
> > > not a new flag in the bitmask
> > > 
> > > Also, I'm assuming that older userspace doesn't blow-up if it sees the
> > > larger structure size?  That's even more important.
> > 
> > We need this FEATURE_BITMAP to do anything in userspace. Max's instinct
> > was right. Anything that changes the user space API needs to have a
> > FEATURE_BITMAP so that user space can do the right thing. The lack of
> > this is blocking acceptance of the pull request for the user space
> > piece.
>
> I don't believe you need a new bitmap entry in this case, you should
> be able to examine the size of the reply from the AUDIT_GET request
> and make a determination from there.

For the upstream kernel, this may be the case. But in the world where people 
backport patches, how do I know that the size is related to this patch and no 
other?

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

