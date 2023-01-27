Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3329C67F1E7
	for <lists+linux-audit@lfdr.de>; Sat, 28 Jan 2023 00:01:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674860506;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1XqPUi9iGJxjdwiynmEh1zECWPJ9tDyE0AxWz8lOBdA=;
	b=hiDDmh0pMgxrp5HWHTrnStHXClbqJNEt3oschbJlIt05eWcfLyCuCIumo+w1nH04HkviFn
	nj4IIHQ4OWt2DIG9eL3EuZlqHQOr02P7nvD9a/MgXPMfWR9UQ6BArsOL1Pfk8DzkrNx0lm
	dHXSFx+kSkbx8d3yNDyDJHO+iRF1jfA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-3MhUi1dePk6cIeMjF7gKdg-1; Fri, 27 Jan 2023 18:01:45 -0500
X-MC-Unique: 3MhUi1dePk6cIeMjF7gKdg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A89F71C05AFA;
	Fri, 27 Jan 2023 23:01:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B815400DE84;
	Fri, 27 Jan 2023 23:01:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CB74719465A3;
	Fri, 27 Jan 2023 23:01:41 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 82868194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 23:01:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 45B9E40C200D; Fri, 27 Jan 2023 23:01:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-0-3.rdu2.redhat.com [10.22.0.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98EF340C2064;
 Fri, 27 Jan 2023 23:01:39 +0000 (UTC)
Date: Fri, 27 Jan 2023 18:01:37 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v1 2/2] io_uring,audit: do not log IORING_OP_*GETXATTR
Message-ID: <Y9RX0QhHKfWv3TGL@madcap2.tricolour.ca>
References: <cover.1674682056.git.rgb@redhat.com>
 <f602429ce0f419c2abc3ae5a0e705e1368ac5650.1674682056.git.rgb@redhat.com>
 <CAHC9VhQiy9vP7BdQk+SXG7gQKAqOAqbYtU+c9R0_ym0h4bgG7g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQiy9vP7BdQk+SXG7gQKAqOAqbYtU+c9R0_ym0h4bgG7g@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023-01-27 17:43, Paul Moore wrote:
> On Fri, Jan 27, 2023 at 12:24 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > Getting XATTRs is not particularly interesting security-wise.
> >
> > Suggested-by: Steve Grubb <sgrubb@redhat.com>
> > Fixes: a56834e0fafe ("io_uring: add fgetxattr and getxattr support")
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> >  io_uring/opdef.c | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Depending on your security policy, fetching file data, including
> xattrs, can be interesting from a security perspective.  As an
> example, look at the SELinux file/getattr permission.
> 
> https://github.com/SELinuxProject/selinux-notebook/blob/main/src/object_classes_permissions.md#common-file-permissions

The intent here is to lessen the impact of audit operations.  Read and
Write were explicitly removed from io_uring auditing due to performance
concerns coupled with the denial of service implications from sheer
volume of records making other messages harder to locate.  Those
operations are still possible for syscall auditing but they are strongly
discouraged for normal use.

If the frequency of getxattr io_uring ops is so infrequent as to be no
distraction, then this patch may be more of a liability than a benefit.

> > diff --git a/io_uring/opdef.c b/io_uring/opdef.c
> > index a2bf53b4a38a..f6bfe2cf078c 100644
> > --- a/io_uring/opdef.c
> > +++ b/io_uring/opdef.c
> > @@ -462,12 +462,14 @@ const struct io_op_def io_op_defs[] = {
> >         },
> >         [IORING_OP_FGETXATTR] = {
> >                 .needs_file = 1,
> > +               .audit_skip             = 1,
> >                 .name                   = "FGETXATTR",
> >                 .prep                   = io_fgetxattr_prep,
> >                 .issue                  = io_fgetxattr,
> >                 .cleanup                = io_xattr_cleanup,
> >         },
> >         [IORING_OP_GETXATTR] = {
> > +               .audit_skip             = 1,
> >                 .name                   = "GETXATTR",
> >                 .prep                   = io_getxattr_prep,
> >                 .issue                  = io_getxattr,
> > --
> > 2.27.0
> 
> -- 
> paul-moore.com
> 

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

