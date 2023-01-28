Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B7567F308
	for <lists+linux-audit@lfdr.de>; Sat, 28 Jan 2023 01:19:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674865183;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5p1uPo2yWIks6/pscghAmqrWzVSorkA1XfzbihWGY9A=;
	b=b5zJIOu6ayofxJg9N2RHDCCCQtAhlFA3WWTj6/rIx6aejAh6g4TdsgUUCSKQu9b7jxZorm
	laju4hkTQcWMUjhvYUlRlMAG5jeFrLXuLHOpSW7ZKN/dfRY+d2vHCyu42B6FhuVCDhrF5o
	HXY/yx26FkCMx8++THfv4t2q/7gN8Hs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-7tkI9H_eMaSNNVj4TFLY1A-1; Fri, 27 Jan 2023 19:19:40 -0500
X-MC-Unique: 7tkI9H_eMaSNNVj4TFLY1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B10731C05EC0;
	Sat, 28 Jan 2023 00:19:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0AECC2166B26;
	Sat, 28 Jan 2023 00:19:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7AF4219465A3;
	Sat, 28 Jan 2023 00:19:36 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F41E0194658C for <linux-audit@listman.corp.redhat.com>;
 Sat, 28 Jan 2023 00:19:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D0CFD18EC2; Sat, 28 Jan 2023 00:19:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-0-3.rdu2.redhat.com [10.22.0.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2430D7AD4;
 Sat, 28 Jan 2023 00:19:33 +0000 (UTC)
Date: Fri, 27 Jan 2023 19:19:31 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v1 2/2] io_uring,audit: do not log IORING_OP_*GETXATTR
Message-ID: <Y9RqEz/qQYmp5jD+@madcap2.tricolour.ca>
References: <cover.1674682056.git.rgb@redhat.com>
 <f602429ce0f419c2abc3ae5a0e705e1368ac5650.1674682056.git.rgb@redhat.com>
 <CAHC9VhQiy9vP7BdQk+SXG7gQKAqOAqbYtU+c9R0_ym0h4bgG7g@mail.gmail.com>
 <Y9RX0QhHKfWv3TGL@madcap2.tricolour.ca>
 <CAHC9VhSN+XSYGh0TBsCPftNvVNBN1JHugrrsp3gbF-in5S1PoA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSN+XSYGh0TBsCPftNvVNBN1JHugrrsp3gbF-in5S1PoA@mail.gmail.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Pavel Begunkov <asml.silence@gmail.com>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023-01-27 19:06, Paul Moore wrote:
> On Fri, Jan 27, 2023 at 6:01 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2023-01-27 17:43, Paul Moore wrote:
> > > On Fri, Jan 27, 2023 at 12:24 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > Getting XATTRs is not particularly interesting security-wise.
> > > >
> > > > Suggested-by: Steve Grubb <sgrubb@redhat.com>
> > > > Fixes: a56834e0fafe ("io_uring: add fgetxattr and getxattr support")
> > > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > > ---
> > > >  io_uring/opdef.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > >
> > > Depending on your security policy, fetching file data, including
> > > xattrs, can be interesting from a security perspective.  As an
> > > example, look at the SELinux file/getattr permission.
> > >
> > > https://github.com/SELinuxProject/selinux-notebook/blob/main/src/object_classes_permissions.md#common-file-permissions
> >
> > The intent here is to lessen the impact of audit operations.  Read and
> > Write were explicitly removed from io_uring auditing due to performance
> > concerns coupled with the denial of service implications from sheer
> > volume of records making other messages harder to locate.  Those
> > operations are still possible for syscall auditing but they are strongly
> > discouraged for normal use.
> 
> We need to balance security needs and performance needs.  You are
> correct that general read() and write() operations are not audited,
> and generally not checked from a LSM perspective as the auditing and
> access control happens at open() time instead (access to fds is
> revalidated when they are passed).  However, in the case of getxattr
> and fgetxattr, these are not normal file read operations, and do not
> go through the same code path in the kernel; there is a reason why we
> have xattr_permission() and security_inode_getxattr().
> 
> We need to continue to audit IORING_OP_FGETXATTR and IORING_OP_GETXATTR.

Fair enough.  This would be similar reasoning to send/recv vs
sendmsg/recvmsg.  I'll drop this patch.  Thanks for the reasoning and
feedback.

> paul-moore.com

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
https://listman.redhat.com/mailman/listinfo/linux-audit

