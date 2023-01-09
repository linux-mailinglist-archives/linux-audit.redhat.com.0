Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8EE662AA8
	for <lists+linux-audit@lfdr.de>; Mon,  9 Jan 2023 16:59:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673279971;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1BHFPRO5kYNA6JWmeYhIQFEreTZGu+oqgzfqiCYam8A=;
	b=edwTnV2XSX3a9hDISdPvmR/7zXR1lV/DNWLlwzVNDqyDdy7rzvDLXnFXuGRTepUHziN1jB
	VZ2vpLggpvZ3F3o41Zpd6dGWB4EHOOsdF+RbC8jWT/yP47/HvYCgRqC0gLAjNU9bHARMA+
	hN+20681qO677b0n7zS3k/DcE0zzaZo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-FDlBXGHyNGCAJP1B70CyRg-1; Mon, 09 Jan 2023 10:59:29 -0500
X-MC-Unique: FDlBXGHyNGCAJP1B70CyRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4947101A521;
	Mon,  9 Jan 2023 15:59:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D3FAC16026;
	Mon,  9 Jan 2023 15:59:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A101A194973C;
	Mon,  9 Jan 2023 15:59:25 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7A19F1946587 for <linux-audit@listman.corp.redhat.com>;
 Mon,  9 Jan 2023 15:59:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6D52242220; Mon,  9 Jan 2023 15:59:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.32.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B85253AA;
 Mon,  9 Jan 2023 15:59:24 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Paul Moore <paul@paul-moore.com>, linux-audit@redhat.com
Subject: Re: New bug in Audit
Date: Mon, 09 Jan 2023 10:08:04 -0500
Message-ID: <8169595.T7Z3S40VBb@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhQH28r_fOCaW+=_65M2SBNpVnQqcvxKt28Zc1+YEqwjBQ@mail.gmail.com>
References: <CACKMdf=43CJmauoVnyzemsGtJoR5g=yDUUojJ3P1qsbKrrNMXQ@mail.gmail.com>
 <CAHC9VhTdznAV=ZbUbJM5EPs7_VVAL2KU1i7T=mQaUiq+TiL1=g@mail.gmail.com>
 <CAHC9VhQH28r_fOCaW+=_65M2SBNpVnQqcvxKt28Zc1+YEqwjBQ@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday, January 6, 2023 3:33:18 PM EST Paul Moore wrote:
> > This mailing list is *focused* on upstream work and support, and while
> > it does not preclude talking about distro specific bugs, I believe
> > there are better avenues for those discussions (e.g. see the RHBZ link
> > I provided in my response) as upstream isn't really going to be able
> > to provide adequate help for someone experiencing problems with a
> > distro kernel which has a number of patches and backports.
> > 
> > If you have a problem with this approach, perhaps we should move
> > upstream development to an audit mailing list on vger.kernel.org and
> > leave this list for RH specific issues?
> 
> Steve, I realize it's only been ~24hrs, but should I assume you are
> okay with that (the upstream focused approach)?

For the 18 years I've spent on this mail list, it has alway been open to any 
topic audit related. I've answered questions for many distributions. If I can 
reproduce the issue, then it's a bug worth looking at. If I can't reproduce 
it, I let them know. I've even answered questions for people writing their 
own audit implementation.

A lot of the email is upstream kernel work - no doubt. But Many times, we 
miss upstream kernel bugs because no one is running upstream code. We usually 
hear about it when a distribution which stays close to upstream releases a 
new update.

The text where you sign up for this mail list does not limit the topc to 
upstream work, it allows for any discussion as long as it's audit related. I 
do not think making a new mail list is in anyone's interest. Bugs will always 
get misreported if there are 2 lists.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

