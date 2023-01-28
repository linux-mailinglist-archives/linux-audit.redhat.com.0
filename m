Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9084767F9DA
	for <lists+linux-audit@lfdr.de>; Sat, 28 Jan 2023 18:26:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674926802;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZtY9BR9gz1Gw/aKORg4xK6QWNsh2u5Pr3f3fy2nMvXc=;
	b=ir87ElCPdbfebNQaPdxKaVgj/lapwTe7YGA5uTx1K+6RTp2yc1j0oOCflepQjk2rEFJstG
	gOpfomddaW+qCIeIR6Ol1yoHlAQ7pUG5xQ82ofEwrNHGVtRxFwo/oi97uBGCUI3EvTVAKn
	w7MgtUGjWAy6rlIsD9co9zSpRbTJPog=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-FNLkaxAIMQmXOtXncsn7UQ-1; Sat, 28 Jan 2023 12:26:41 -0500
X-MC-Unique: FNLkaxAIMQmXOtXncsn7UQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B68B3C0D194;
	Sat, 28 Jan 2023 17:26:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F3B822166B26;
	Sat, 28 Jan 2023 17:26:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7F5A91946597;
	Sat, 28 Jan 2023 17:26:33 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1301E1946587 for <linux-audit@listman.corp.redhat.com>;
 Sat, 28 Jan 2023 17:26:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 05459492B05; Sat, 28 Jan 2023 17:26:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.8.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DC99492B06;
 Sat, 28 Jan 2023 17:26:32 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Richard Guy Briggs <rgb@redhat.com>, Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v1 2/2] io_uring,audit: do not log IORING_OP_*GETXATTR
Date: Sat, 28 Jan 2023 12:26:31 -0500
Message-ID: <13202484.uLZWGnKmhe@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhQiy9vP7BdQk+SXG7gQKAqOAqbYtU+c9R0_ym0h4bgG7g@mail.gmail.com>
References: <cover.1674682056.git.rgb@redhat.com>
 <f602429ce0f419c2abc3ae5a0e705e1368ac5650.1674682056.git.rgb@redhat.com>
 <CAHC9VhQiy9vP7BdQk+SXG7gQKAqOAqbYtU+c9R0_ym0h4bgG7g@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Pavel Begunkov <asml.silence@gmail.com>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday, January 27, 2023 5:43:02 PM EST Paul Moore wrote:
> On Fri, Jan 27, 2023 at 12:24 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > Getting XATTRs is not particularly interesting security-wise.
> > 
> > Suggested-by: Steve Grubb <sgrubb@redhat.com>
> > Fixes: a56834e0fafe ("io_uring: add fgetxattr and getxattr support")
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> > io_uring/opdef.c | 2 ++
> > 1 file changed, 2 insertions(+)
> 
> Depending on your security policy, fetching file data, including
> xattrs, can be interesting from a security perspective.  As an
> example, look at the SELinux file/getattr permission.
> 
> https://github.com/SELinuxProject/selinux-notebook/blob/main/src/object_cla
> sses_permissions.md#common-file-permissions

We're mostly interested in setting attributes because that changes policy. 
Reading them is not interesting unless the access fails with EPERM.

I was updating the user space piece recently and saw there was a bunch of 
"new" operations. I was commenting that we need to audit 5 or 6 of the "new" 
operations such as IORING_OP_MKDIRATor IORING_OP_SETXATTR. But now that I see 
the patch, it looks like they are auditable and we can just let a couple be 
skipped. IORING_OP_MADVISE is not interesting as it just gives hiints about 
the expected access patterns of memory. If there were an equivalent of 
mprotect, that would be of interest, but not madvise.

There are some I'm not sure about such as IORING_OP_MSG_RING and 
IORING_OP_URING_CMD. What do they do?

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

