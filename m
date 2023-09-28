Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A89A37B21F4
	for <lists+linux-audit@lfdr.de>; Thu, 28 Sep 2023 18:06:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695917192;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bErwJWfez+Rd4UiqCr2TQapvYoDo/n+tz0YzlhvHKfY=;
	b=Xzci1/3Qe/VEmIYf1wVlEW8h5CjwlZn5qDjJk+nJ6DoJQijUGme+SGLtIv98OoRa3MzT0i
	PSWgRh0UZ/rfCR2eI+gS0aEsHLcbeVkqyBtoAW/b+YpYmqgKeGJRyOIHqWIX8fCM9+tWt0
	yAMzAijeFLbsiUvRfpZO1Eh+y6f6n5o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-Eyn9WHWbPnKVTd-eU_ng8w-1; Thu, 28 Sep 2023 12:06:29 -0400
X-MC-Unique: Eyn9WHWbPnKVTd-eU_ng8w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EEDC88B7A1;
	Thu, 28 Sep 2023 16:06:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 82BDA176F6;
	Thu, 28 Sep 2023 16:06:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 27E3C19465B2;
	Thu, 28 Sep 2023 16:06:07 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 776711946587 for <linux-audit@listman.corp.redhat.com>;
 Thu, 28 Sep 2023 15:53:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 53625492B05; Thu, 28 Sep 2023 15:53:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.34.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AF9949BB9A;
 Thu, 28 Sep 2023 15:53:27 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Amjad Gabbar <amjadgabbar11@gmail.com>
Subject: Re: Sycall Rules vs Watch Rules
Date: Thu, 28 Sep 2023 11:53:26 -0400
Message-ID: <4866749.31r3eYUQgx@x2>
Organization: Red Hat
In-Reply-To: <CAJcJf=RKAqp0PPQ2EmOZ5jJ6KGZ4rAvmabdDsg+MvkbmcomChA@mail.gmail.com>
References: <CAJcJf=Qb7muwWG4DyQtEcCKmCOETD4H3h1BoGrewJ5u26r6o=w@mail.gmail.com>
 <8320136.T7Z3S40VBb@x2>
 <CAJcJf=RKAqp0PPQ2EmOZ5jJ6KGZ4rAvmabdDsg+MvkbmcomChA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, September 21, 2023 4:02:49 PM EDT Amjad Gabbar wrote:
> > The best solution would be a kernel modification so that there are no
> > mismatched lists.
>
> I agree as well....This would be the cleanest solution. This would also
> solve the userspace problem of maintaining different lists which can get
> out of hand fairly quickly.

After looking into this, a kernel patch would also not work well. It has to 
be arch specific
 
> > I guess we can warn on that to rewrite in syscall notation.
> 
> We certainly should. I think the user should know that there is a
> performance cost associated with watches and we should explicitly mention
> how it can be optimized in the manpages also. The reason being I am pretty
> sure, numerous users/repos still do make use of the -w notation and we do
> want to let them know the issue here. We also need to make quite a few
> changes to the manpages also regarding this. Because, initially even I was
> very confused when reading the man pages and seeing the actual
> implementation of and results were not quite in sync.

I have made the changes to the master and audit-3.1-maint branches. Please 
everyone concerned give them tests. The short of it is that if you use the '-
w' notation for watches, it will remain the same and slower. If you use the 
syscall notation without "-F arch", you will get a warning that it cannot be 
optimized without adding "-Farch". If you add "-F arch", you will possibly 
need one for both arches which means doubling the rules. If you do not want 
to double the rules, you might place a syscall rule for any 32 system call 
(21-no32bit.rules). Or you can leave it as is and not care. The sample rules 
and all man pages have been updated.

Please, let me know if this works out better.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

