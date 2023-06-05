Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B8D72323F
	for <lists+linux-audit@lfdr.de>; Mon,  5 Jun 2023 23:28:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686000503;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6vvGygtWpvT3NFyQQBHeu2hLJeDM0JUXbWFaMX5S9JE=;
	b=acwMpgKN2KW+FflC5cENI33uGP7C6CmaOlil+47X5MOzP6oslReB4QSV5ai5Th31EZI5ae
	2rjwaGrxcuLVi4hxg1iKQiXWjPE52ZzOOcScQ26MEEOuLgsaY3y6sqToCTgWF0d6SFpNn7
	/O/piwe6He3yuKt7r+QwQ/Uws7+LXKQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-DV0SICoDMOiGVhLnL6IUDQ-1; Mon, 05 Jun 2023 17:28:19 -0400
X-MC-Unique: DV0SICoDMOiGVhLnL6IUDQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18D50802E58;
	Mon,  5 Jun 2023 21:28:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 979AAC16044;
	Mon,  5 Jun 2023 21:28:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BE75219465B7;
	Mon,  5 Jun 2023 21:28:12 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C666D1946595 for <linux-audit@listman.corp.redhat.com>;
 Mon,  5 Jun 2023 21:28:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A457D1121315; Mon,  5 Jun 2023 21:28:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.9.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FEC21121314;
 Mon,  5 Jun 2023 21:28:11 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Comprehensive Documentation on the Linux Audit Framework
Date: Mon, 05 Jun 2023 17:28:10 -0400
Message-ID: <3244111.44csPzL39Z@x2>
Organization: Red Hat
In-Reply-To: <CAMKmEH-s9kZn5kqkjb_QHA2X02TWX+utqu365-7cRKMM7E5eVQ@mail.gmail.com>
References: <CAMKmEH-s9kZn5kqkjb_QHA2X02TWX+utqu365-7cRKMM7E5eVQ@mail.gmail.com>
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
Cc: Vincent Abraham <vincent.ahm@gmail.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, June 5, 2023 6:17:28 PM EDT Vincent Abraham wrote:
> Greetings,
> Could anyone point me to a source for comprehensive documentation for the
> Linux audit framework? I want to know how the framework interacts with the
> kernel to retrieve log information.

If you look at the README page of the userspace portion of code, it mentions 
that there is a netlink api. It simply listens and writes what it finds to 
disk. Auditing must be enabled and you need to set the pid in the kernel and 
then listen for events. There is no extensive documentation - the code is the 
documentation to the low level API.

There is also a best effort multicast netlink api that systemd-journald uses 
to get events out of the kernel.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

