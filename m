Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C076802FF
	for <lists+linux-audit@lfdr.de>; Mon, 30 Jan 2023 00:38:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675035501;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=I/f937Sf0ZJkDhboeoE8HWZEDzTohX5D+eE2f3shXpA=;
	b=ajRT1xKXWRUhEG6di0xyZL5u8m26WyDvMn9xwtgoInc0Rw7hX9J7zUHAip6IeLZ4kCsHzf
	B0NeuN48D4kUMkUqbXt2kjgo0l36htacdoO7jr6YKVWW9Csp1RHKXXFLtOywTxJByw5tFq
	tHWAzV616ZSyxr2a6t/fHWdU5AGN0kI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-EfEAKwD9P7i68KKOYDfwvA-1; Sun, 29 Jan 2023 18:38:17 -0500
X-MC-Unique: EfEAKwD9P7i68KKOYDfwvA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0EF9800B30;
	Sun, 29 Jan 2023 23:38:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ABAF52166B29;
	Sun, 29 Jan 2023 23:38:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 93DE61946597;
	Sun, 29 Jan 2023 23:38:02 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CE34F1946587 for <linux-audit@listman.corp.redhat.com>;
 Sun, 29 Jan 2023 23:38:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BED5A1415139; Sun, 29 Jan 2023 23:38:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6D10140EBF5
 for <linux-audit@redhat.com>; Sun, 29 Jan 2023 23:38:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 939281C05AA9
 for <linux-audit@redhat.com>; Sun, 29 Jan 2023 23:38:00 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-132-HcDoucs6PDaBkh0UYO-0fQ-1; Sun, 29 Jan 2023 18:37:58 -0500
X-MC-Unique: HcDoucs6PDaBkh0UYO-0fQ-1
Received: by mail-pj1-f45.google.com with SMTP id m11so9620767pji.0
 for <linux-audit@redhat.com>; Sun, 29 Jan 2023 15:37:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ii9FzGVPdJKeqmlVk6BfPihf+mnXJKtSNMOOo2LczXo=;
 b=V7sKi9kZpW+/Wt/cpdAtA9ehKN8kXtAiaigaZ05MnOiRLwO3KWu42ENorJohSzfUBj
 1A1OQFD5i8t8u/VFBdwUewJVcPv9pKZ2tf+j4uyg/TI85EfQ4FPg9iHl+1XpAD30MIf/
 AeGRAP8Jgty8ifk3X9PmAgh4nauXPWGS4UKeTA1LbOoXmh0oAFgtKj+r6ZR5zupLkt5q
 zzs8FGk0gr9FJEZlqHKxHWqgS0xhxL/BoTFIG9oqnnAAC3v0bozKIVuxnxYT12jA1gqU
 tprQL1+h+Nme06HF4LLZ9q6AoN5c4vAmX55EHcud/dTSIbbROKLTkYLLUG2f1xe6bNka
 HlTw==
X-Gm-Message-State: AO0yUKXQjbvviMat+sA6rVwp1XV2cmGJwWId8dFfJ/+giQE8VimEdyzr
 8chx8mB4+2QjLKNJ8mQgfmnb1BwPCmQpTXCVvx9k
X-Google-Smtp-Source: AK7set9i6kPMbxYMLoRoKdYNnrxmH+/Q1k10jefV7aKr2PmLgJDp7B1Q7hjCwqAcpxG54WssPx5U8ncUkGb/WCFxaLA=
X-Received: by 2002:a17:90a:19c8:b0:22c:b70b:15ba with SMTP id
 8-20020a17090a19c800b0022cb70b15bamr13988pjj.193.1675035477513; Sun, 29 Jan
 2023 15:37:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674682056.git.rgb@redhat.com>
 <f602429ce0f419c2abc3ae5a0e705e1368ac5650.1674682056.git.rgb@redhat.com>
 <CAHC9VhQiy9vP7BdQk+SXG7gQKAqOAqbYtU+c9R0_ym0h4bgG7g@mail.gmail.com>
 <13202484.uLZWGnKmhe@x2>
In-Reply-To: <13202484.uLZWGnKmhe@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 29 Jan 2023 18:37:46 -0500
Message-ID: <CAHC9VhRXUe_RiTT1VqkA_Jv08MFCMvYytZkjKcf77EqyVLi-Tw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] io_uring,audit: do not log IORING_OP_*GETXATTR
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
Cc: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Richard Guy Briggs <rgb@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Pavel Begunkov <asml.silence@gmail.com>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jan 28, 2023 at 12:26 PM Steve Grubb <sgrubb@redhat.com> wrote:
> On Friday, January 27, 2023 5:43:02 PM EST Paul Moore wrote:
> > On Fri, Jan 27, 2023 at 12:24 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > Getting XATTRs is not particularly interesting security-wise.
> > >
> > > Suggested-by: Steve Grubb <sgrubb@redhat.com>
> > > Fixes: a56834e0fafe ("io_uring: add fgetxattr and getxattr support")
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > > io_uring/opdef.c | 2 ++
> > > 1 file changed, 2 insertions(+)
> >
> > Depending on your security policy, fetching file data, including
> > xattrs, can be interesting from a security perspective.  As an
> > example, look at the SELinux file/getattr permission.
> >
> > https://github.com/SELinuxProject/selinux-notebook/blob/main/src/object_cla
> > sses_permissions.md#common-file-permissions
>
> We're mostly interested in setting attributes because that changes policy.
> Reading them is not interesting unless the access fails with EPERM.

See my earlier comments, SELinux does have provisions for caring about
reading xattrs, and now that I look at the rest of the LSMs it looks
like Smack cares about reading xattrs too.  Regardless of whether a
given security policy cares about xattr access, the LSMs support
enforcing access on reading xattrs so we need to ensure the audit is
setup properly in these cases.

> I was updating the user space piece recently and saw there was a bunch of
> "new" operations. I was commenting that we need to audit 5 or 6 of the "new"
> operations such as IORING_OP_MKDIRATor IORING_OP_SETXATTR. But now that I see
> the patch, it looks like they are auditable and we can just let a couple be
> skipped. IORING_OP_MADVISE is not interesting as it just gives hiints about
> the expected access patterns of memory. If there were an equivalent of
> mprotect, that would be of interest, but not madvise.

Once again, as discussed previously, it is likely that skipping
auditing for IORING_OP_MADVISE is okay, but given that several of the
changes in this patchset were incorrect, I'd like a little more
thorough investigation before we skip auditing on madvise.

> There are some I'm not sure about such as IORING_OP_MSG_RING and
> IORING_OP_URING_CMD. What do they do?

Look at 4f57f06ce218 ("io_uring: add support for IORING_OP_MSG_RING
command") for the patch which added IORING_OP_MSG_RING as it has a
decent commit description.  As for IORING_OP_URING_CMD, there were
lengthy discussions about it on the mailing lists (including audit)
back in March 2022 and then later in August on the LSM, SELinux, etc.
mailing lists when we landed some patches for it (there were no audit
changes).  I also covered the IORING_OP_URING_CMD, albeit briefly, in
a presentation at LSS-EU last year:

https://www.youtube.com/watch?v=AaaH6skUEI8
https://www.paul-moore.com/docs/2022-lss_eu-iouring_lsm-pcmoore-r3.pdf

--
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

