Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3380C67F2A3
	for <lists+linux-audit@lfdr.de>; Sat, 28 Jan 2023 01:07:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674864423;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RbN7HabO9jePHHS+Y4VFb/oTQdCFNn1b61vzjS79Ovs=;
	b=iUjFFbXbMbut3vs2aUR8QnvD965F8i1IdPXxgQqKj9We5Wpk1Qk4T9q4R98Ul1v8VpeWwJ
	yNAXRL4XcwfsS/VGGV+JZ5ZiRXxR8AupvN/uMrRPjBtWJh5IWQiKtZqRCKGkPEg3RMcpk+
	O47u+2lWK++ILGfFh5Dkd/58FTslVLA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-yBlQv-6nPJqultgZTBh86Q-1; Fri, 27 Jan 2023 19:06:59 -0500
X-MC-Unique: yBlQv-6nPJqultgZTBh86Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27A9485A588;
	Sat, 28 Jan 2023 00:06:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2ED03C15BAE;
	Sat, 28 Jan 2023 00:06:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3E0D319465A3;
	Sat, 28 Jan 2023 00:06:52 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8DCA0194658C for <linux-audit@listman.corp.redhat.com>;
 Sat, 28 Jan 2023 00:06:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 71096492C18; Sat, 28 Jan 2023 00:06:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69A43492C14
 for <linux-audit@redhat.com>; Sat, 28 Jan 2023 00:06:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A7792A59568
 for <linux-audit@redhat.com>; Sat, 28 Jan 2023 00:06:42 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-106-pRT7SyaUP9eb1Qkrr8Iq4A-1; Fri, 27 Jan 2023 19:06:40 -0500
X-MC-Unique: pRT7SyaUP9eb1Qkrr8Iq4A-1
Received: by mail-pj1-f46.google.com with SMTP id
 t12-20020a17090aae0c00b00229f4cff534so9093051pjq.1
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 16:06:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8g/ThgcNbD2/aX07jf+/YqhhYrBFTriZoMIQ/MFUbWI=;
 b=0pKuewKOUtXNWbDZmUvq8O9rpyA43bjv4dG5Ew9iDJmq6WvoG9W1kf6FVTaetRny9J
 5DpfjX5CinIbreCsGBFU74fiQc+Fj6kM8WNlw4S/43gJw+FeMUoLbM8pEGYp8OaTK8/c
 7fOMdKclWCSan9XKNThwvoNSDQxYnTzdDGiEaCAEpyAgWiC7wMvAgzQOJMjOKeCO/raG
 cURpSEG0a/l7BjOKxlzKnT/mEdbcmTRtioVum+c+IJyyMEVpUMNC7geo5mvImmT3j4QC
 PLVrFlLAw1EudtBwXjnbs+VlVQ20ZO33DEIfsYdSCOG47w3bMoq5w/rcdXmnjhiaiyZa
 ANWw==
X-Gm-Message-State: AFqh2kpdZMlMTXHwQPs/XftUGQ8Ia8tPL0mcDRFzjy+uQG+Co+fPNG29
 aVk1AnDXRaeG9CwTGcxVaZpZzeeqG+NKhTKPcUpn
X-Google-Smtp-Source: AMrXdXvd2n9LymBXSkWurnSC6yLqKTNaVZHkRdO3cpr85aGd59eC4S1pbTeWxWCVZHBbNBrCPS7QoA7JXjF/sJC/xPU=
X-Received: by 2002:a17:90a:5b0c:b0:223:fa07:7bfb with SMTP id
 o12-20020a17090a5b0c00b00223fa077bfbmr5401548pji.38.1674864399412; Fri, 27
 Jan 2023 16:06:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674682056.git.rgb@redhat.com>
 <f602429ce0f419c2abc3ae5a0e705e1368ac5650.1674682056.git.rgb@redhat.com>
 <CAHC9VhQiy9vP7BdQk+SXG7gQKAqOAqbYtU+c9R0_ym0h4bgG7g@mail.gmail.com>
 <Y9RX0QhHKfWv3TGL@madcap2.tricolour.ca>
In-Reply-To: <Y9RX0QhHKfWv3TGL@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 27 Jan 2023 19:06:28 -0500
Message-ID: <CAHC9VhSN+XSYGh0TBsCPftNvVNBN1JHugrrsp3gbF-in5S1PoA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] io_uring,audit: do not log IORING_OP_*GETXATTR
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 27, 2023 at 6:01 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2023-01-27 17:43, Paul Moore wrote:
> > On Fri, Jan 27, 2023 at 12:24 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > Getting XATTRs is not particularly interesting security-wise.
> > >
> > > Suggested-by: Steve Grubb <sgrubb@redhat.com>
> > > Fixes: a56834e0fafe ("io_uring: add fgetxattr and getxattr support")
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > >  io_uring/opdef.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> >
> > Depending on your security policy, fetching file data, including
> > xattrs, can be interesting from a security perspective.  As an
> > example, look at the SELinux file/getattr permission.
> >
> > https://github.com/SELinuxProject/selinux-notebook/blob/main/src/object_classes_permissions.md#common-file-permissions
>
> The intent here is to lessen the impact of audit operations.  Read and
> Write were explicitly removed from io_uring auditing due to performance
> concerns coupled with the denial of service implications from sheer
> volume of records making other messages harder to locate.  Those
> operations are still possible for syscall auditing but they are strongly
> discouraged for normal use.

We need to balance security needs and performance needs.  You are
correct that general read() and write() operations are not audited,
and generally not checked from a LSM perspective as the auditing and
access control happens at open() time instead (access to fds is
revalidated when they are passed).  However, in the case of getxattr
and fgetxattr, these are not normal file read operations, and do not
go through the same code path in the kernel; there is a reason why we
have xattr_permission() and security_inode_getxattr().

We need to continue to audit IORING_OP_FGETXATTR and IORING_OP_GETXATTR.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

