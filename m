Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE777A8C0D
	for <lists+linux-audit@lfdr.de>; Wed, 20 Sep 2023 20:53:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695235982;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aqGEkdV748WopjQ9SpFfL0NptXWvwc+gr5lBM0i7Dr4=;
	b=bTNj4J+azomNksBtdsKpxZdbrdvKWwlJZ98cyOMhi1YKRrbx3NxK1rBdJXV5bArhZWI9I4
	owocBx3hwVVXy2GEBNCQuTEfJrLMTcRivyqsmwo7P3SjbB+rn36+cFnybkmVun1SNp5nPq
	N2FpmlqBi/8ZcjatwaiwwukYaE1Skn0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-WEpT0rSxPCCv7PSC11JL2Q-1; Wed, 20 Sep 2023 14:52:58 -0400
X-MC-Unique: WEpT0rSxPCCv7PSC11JL2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A839811E7B;
	Wed, 20 Sep 2023 18:52:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F7D040C2009;
	Wed, 20 Sep 2023 18:52:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0652A19465BC;
	Wed, 20 Sep 2023 18:52:28 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 00E35194658D for <linux-audit@listman.corp.redhat.com>;
 Wed, 20 Sep 2023 18:45:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C411D1005E27; Wed, 20 Sep 2023 18:45:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.10.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 865181004058;
 Wed, 20 Sep 2023 18:45:27 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Amjad Gabbar <amjadgabbar11@gmail.com>, linux-audit@redhat.com
Subject: Re: Sycall Rules vs Watch Rules
Date: Wed, 20 Sep 2023 14:45:26 -0400
Message-ID: <2334800.ElGaqSPkdT@x2>
Organization: Red Hat
In-Reply-To: <CAJcJf=SJxd3bnu2Pi4Ps5fL8NUowQrvuVn+VgrBK5bY0pUdbAg@mail.gmail.com>
References: <CAJcJf=Qb7muwWG4DyQtEcCKmCOETD4H3h1BoGrewJ5u26r6o=w@mail.gmail.com>
 <8295448.T7Z3S40VBb@x2>
 <CAJcJf=SJxd3bnu2Pi4Ps5fL8NUowQrvuVn+VgrBK5bY0pUdbAg@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Cc: Richard Guy Briggs <rgb@redhat.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, September 19, 2023 8:26:04 PM EDT Amjad Gabbar wrote:
> > The perm fields select the right system calls
> > that should be reported on.
> 
> That is accurate from a functional perspective. There is no change in the
> events logged. But there is a difference in performance. This is most
> evident for syscalls not part of the perm fields.

<snip> 

> If we look at the performance numbers for the file rules as is, the
> auditing percentage is about 14%.
> 
> Now if we were to just add the specific syscalls that the perm fields
> filter on in the rules file, the auditing percentage would drop to around
> 2%.

I think I am mis-remembering something, or there was a change way back in the 
beginning. The plan was that we could optimize access by letting the kernel 
pick the relevant syscalls based on the permissions. User space would just 
define the permissions and the kernel would make it so.

But there were several redesigns of the file auditing. I looked back as far as 
the 3.1 kernel and it always follows lookup the syscall, if it's relevant, 
then check the rest of the fields in the rule. This eventually checks the set 
of syscalls selected by the perms.

The way that it should have worked is when perms is given, throw away any 
syscalls and set the mask based on the perms selected. That would have been 
optimal and it was what Al Viro and I talked about long ago. However, it went 
through several redesigns.

The problem now is that user space has no list of syscalls that match each 
permission. And then, there's no good way to sync based on mixing and 
matching kernels and user space. The kernel may have an updated syscall list 
user space doesn't know about and vice versa.

I think you are on to something important. But I am surprised my concept of 
how it works doesn't match the implementation. (Al Viro did the original 
implementation way back around 2006/7.) The best solution would be a kernel 
modification so that there are no mismatched lists. A suboptimal solution 
would be to maintain 2 lists and hope they don't change. Which by the way, I 
think the kernel lists are outdated again. (Syscalls keep getting added - 
quotactl_fd for example)

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

