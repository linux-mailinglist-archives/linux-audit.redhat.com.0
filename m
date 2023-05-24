Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E08C170F908
	for <lists+linux-audit@lfdr.de>; Wed, 24 May 2023 16:46:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684939594;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8syUpV99su071VHfKjfTd+KK9XKJkb00wBdwWEpahSs=;
	b=NDtqR8e09r4SGnZt3m8YNyHcxkD0bIQPrPDwnWyecfROBWsVTU7swS3s19fxKG//3O7Gy1
	1D1HkSk8T4nw4v7E3FMFSRY6ORye9gl3wQHOlGldmBOx0NAcVyY/CFlXk9H4jskS4Bxewk
	QrF7xL362LHCF3g2CWrZOCliC/6ZHk8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-lhDHkRNVMoGbQu1MjlkK7w-1; Wed, 24 May 2023 10:46:30 -0400
X-MC-Unique: lhDHkRNVMoGbQu1MjlkK7w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DCCB1C05122;
	Wed, 24 May 2023 14:46:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0A6042166B2B;
	Wed, 24 May 2023 14:46:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A6C6D19465B9;
	Wed, 24 May 2023 14:46:27 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 37C4519465A0 for <linux-audit@listman.corp.redhat.com>;
 Wed, 24 May 2023 14:45:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2B408140E961; Wed, 24 May 2023 14:45:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.34.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFBF4140E95D;
 Wed, 24 May 2023 14:45:04 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: Auditd doesn't receive syscalls after installation for the
 current shell.
Date: Wed, 24 May 2023 10:45:04 -0400
Message-ID: <2151809.irdbgypaU6@x2>
Organization: Red Hat
In-Reply-To: <b5e87a11-7605-6745-516a-8004569bbe5d@gmail.com>
References: <b5e87a11-7605-6745-516a-8004569bbe5d@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Cc: audit@vger.kernel.org, Rinat Gadelshin <rgadelsh@gmail.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, May 24, 2023 7:37:27 AM EDT Rinat Gadelshin wrote:
> Hello there.
> 
> It seems that the kernel doesn't send messages for syscalls of the shell
> process from which auditd is installed.
> 
> Reproducing steps (performed on Ubuntu 22.04 x86_64 on virtual box by
> `root`):
> 
> step #1: $ apt install auditd
> step #2: $ auditctl -a always,exit -F arch=b64 -S openat,renameat2,unlinkat
> step #3: $ echo t>delme;echo t2>>delme;cat delme;mv delme d;mv d
> delme;rm delme
> step #4: $ service auditd stop
> step #5: $ ausearch -f delme
> 
> There are syscalls from /usr/bin/cat, /usr/bin/mv, /usr/bin/rm but there
> are no any syscalls (openat expected)
> for /usr/bin/bash (current shell process) for the file.
> 
> If step #3 is performed from another tty, then openat syscalls
> (CREATE for the first echo and NORMAL for the second one)
> is logged for the /usr/bin/bash process.
> 
> `uname -a` returns: Linux grin-vb-ubuntu-22-0-4 5.19.0-41-generic
> #42~22.04.01-Ubuntu SMP PREEMPT_DYNAMIC Tue Apr 18 17:40:00 UTC 2 x86_64
> x86_64 x86_64 GNU/Linux
> 
> Should I open an issue for the case at
> https://github.com/linux-audit/audit-kernel ?

Are you booting with audit=1 ? If not, the install process and any before it 
are not auditable. You will only get events for processes started after audit 
enabled = 1.

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

