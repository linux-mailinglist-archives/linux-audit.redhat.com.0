Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8195F6547AF
	for <lists+linux-audit@lfdr.de>; Thu, 22 Dec 2022 22:13:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671743629;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Whjj4lxRV+1LNVAS59yHypcLhif4tAk5dmwvkvgiA+0=;
	b=ZP44cy1RQW5GEhYH1ijQ9iU+1s4XcUGk57gM0h07nijVvlidma+yTG3SDOwyLkkkU3Jnbe
	tMoyq7CU0TrAN108vRz8lUt9tGK7RhA521aAnwKOcXpYIZp4cJX35R7VYAlUunp2UxHDzT
	G14pOP1VgT+oWbGPGu2JKdqq197/Vmo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-T-uzAGbGMiCtbvdDEo0-yA-1; Thu, 22 Dec 2022 16:13:45 -0500
X-MC-Unique: T-uzAGbGMiCtbvdDEo0-yA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7EB885C6E0;
	Thu, 22 Dec 2022 21:13:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC63651FF;
	Thu, 22 Dec 2022 21:13:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 291E81946A72;
	Thu, 22 Dec 2022 21:13:35 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C5FB519465B1 for <linux-audit@listman.corp.redhat.com>;
 Thu, 22 Dec 2022 19:40:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 79D0C492C18; Thu, 22 Dec 2022 19:40:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 719E9492C14
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 19:40:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FD07811E9C
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 19:40:37 +0000 (UTC)
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-219-4yOkwW1jPHa0KzRakV4sQA-1; Thu, 22 Dec 2022 14:40:35 -0500
X-MC-Unique: 4yOkwW1jPHa0KzRakV4sQA-1
Received: by mail-yb1-f201.google.com with SMTP id
 b4-20020a253404000000b006fad1bb09f4so2928771yba.1
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 11:40:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fHSmwjvju/4GUeqDOzDADxPBU5RRlf6/zWyKUJBarhM=;
 b=WbPmuZ19UyAQCN/Ntl07EOeNWLeqCWYnfzo6f+uAtJ3Nz2AZzxhi8At7XYqhI1w4rP
 gxXYlbK+o9hnuLFuInOZr002/IsjipsnLPnTKmc1qDQKVepXFSmRrWU85u4oa4rvCaFy
 nqU5Dn6JwwlyqI6t0kgnv88qnym+XZfVqhNMV1b06sTm0bc+/WZKOyRv+qty1FMzAi2S
 add0/Zk1S62AuhILVdWp38zYPyg1ITylfKWbVIFTHq3RJWmm3L1XZ9J1+HGRqBYB5xCJ
 XRujTcropg3QVEjS+2iGzbiDq8VBPsI967djHXGvwkGqQDvPlv8Xwh216igXBw2UICxm
 FJOQ==
X-Gm-Message-State: AFqh2koxO3+JUc1nRM6lDIda+zXoeE6m/a8GTcPX5HcsRnHo6HUtF4w9
 Ur6HwKyorJl1lmPghJnAB4s3gJM=
X-Google-Smtp-Source: AMrXdXu9Tez411NcfE1WtwXpi7xRznJqaiud2K3iv/6Dzc90tKJKg1NxqeOT3uUpqr+26ZedmC21cck=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a25:5587:0:b0:705:28c6:73f9 with SMTP id
 j129-20020a255587000000b0070528c673f9mr723568ybb.406.1671738035087; Thu, 22
 Dec 2022 11:40:35 -0800 (PST)
Date: Thu, 22 Dec 2022 11:40:33 -0800
In-Reply-To: <CAHC9VhRFmrgXMYKxXqd1KpMzDGhT6gPX-=8Z072utZO_WefYWQ@mail.gmail.com>
Mime-Version: 1.0
References: <20221222001343.489117-1-paul@paul-moore.com>
 <Y6SRiv+FloijdETe@google.com>
 <CAHC9VhRFmrgXMYKxXqd1KpMzDGhT6gPX-=8Z072utZO_WefYWQ@mail.gmail.com>
Message-ID: <Y6SysZgKKEPL5ZE5@google.com>
Subject: Re: [PATCH] bpf: restore the ebpf audit UNLOAD id field
From: sdf@google.com
To: Paul Moore <paul@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Thu, 22 Dec 2022 21:13:34 +0000
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
Cc: bpf@vger.kernel.org, linux-audit@redhat.com,
 Burn Alting <burn.alting@iinet.net.au>, Alexei Starovoitov <ast@kernel.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"

On 12/22, Paul Moore wrote:
> On Thu, Dec 22, 2022 at 12:19 PM <sdf@google.com> wrote:
> > On 12/21, Paul Moore wrote:
> > > When changing the ebpf program put() routines to support being called
> > > from within IRQ context the program ID was reset to zero prior to
> > > generating the audit UNLOAD record, which obviously rendered the ID
> > > field bogus (always zero).  This patch resolves this by adding a new
> > > field, bpf_prog_aux::id_audit, which is set when the ebpf program is
> > > allocated an ID and never reset, ensuring a valid ID field,
> > > regardless of the state of the original ID field, bpf_prox_aud::id.
> >
> > > I also modified the bpf_audit_prog() logic used to associate the
> > > AUDIT_BPF record with other associated records, e.g. @ctx != NULL.
> > > Instead of keying off the operation, it now keys off the execution
> > > context, e.g. '!in_irg && !irqs_disabled()', which is much more
> > > appropriate and should help better connect the UNLOAD operations with
> > > the associated audit state (other audit records).
> >
> > [..]
> >
> > > As an note to future bug hunters, I did briefly consider removing the
> > > ID reset in bpf_prog_free_id(), as it would seem that once the
> > > program is removed from the idr pool it can no longer be found by its
> > > ID value, but commit ad8ad79f4f60 ("bpf: offload: free program id
> > > when device disappears") seems to imply that it is beneficial to
> > > reset the ID value.  Perhaps as a secondary indicator that the ebpf
> > > program is unbound/orphaned.
> >
> > That seems like the way to go imho. Can we have some extra 'invalid_id'
> > bitfield in the bpf_prog so we can set it in bpf_prog_free_id and
> > check in bpf_prog_free_id (for this offloaded use-case)? Because
> > having two ids and then keeping track about which one to use, depending
> > on the context, seems more fragile?

> I would definitely prefer to keep just a single ID value, and that was
> the first approach I took when drafting this patch, but when looking
> through the git log it looked like there was some desire to reset the
> ID to zero on free.  Not being an expert on the ebpf kernel code I
> figured I would just write the patch up this way and make a comment
> about not zero'ing out the ID in the commit description so we could
> have a discussion about it.

Yeah, the commit you reference is resetting the id for the offloaded
progs. But it also mentions that even though we reset the id,
it won't leak into the userspace:

   Note that orphaned offload programs will return -ENODEV on
   BPF_OBJ_GET_INFO_BY_FD so user will never see ID 0.

It talks about the "if (!aux->offload)" check in bpf_prog_offload_info_fill.
So I'm assuming that having some extra "this id is already free" signal
in the bpf_prog shouldn't be a problem here.

> I'm not seeing any other comments, so I'll go ahead with putting
> together a v2 that sets an invalid flag/bit and I'll post that for
> further discussion/review.

> > > Fixes: d809e134be7a ("bpf: Prepare bpf_prog_put() to be called from  
> irq
> > > context.")
> > > Reported-by: Burn Alting <burn.alting@iinet.net.au>
> > > Signed-off-by: Paul Moore <paul@paul-moore.com>
> > > ---
> > >   include/linux/bpf.h  | 1 +
> > >   kernel/bpf/syscall.c | 8 +++++---
> > >   2 files changed, 6 insertions(+), 3 deletions(-)

> --
> paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

