Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 25636654656
	for <lists+linux-audit@lfdr.de>; Thu, 22 Dec 2022 20:04:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671735850;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=E6jlBgnHWUayINaZJYw+mda5Ao4zk6gtZQOWFJDDe6Y=;
	b=R/RIyimwf67KOS4wAZ7tfdK6bqGkZns00JBKvFlWFSePyYCO/uLKYEai31GDQai2zSXQ1E
	hxUZsyqF8dcXjdLhbVTmqMq1qrQuzd7CsoGjYWewseDvRjYfKJK08QUsxcC3OSAMknvrGW
	SwVYMaEK78qfw7Mcwy/NPAJ1guZ/Ba4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-L2WZZFhvOLm1vxLWb_EM3w-1; Thu, 22 Dec 2022 14:04:09 -0500
X-MC-Unique: L2WZZFhvOLm1vxLWb_EM3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D48DA38012C8;
	Thu, 22 Dec 2022 19:04:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E66340C1073;
	Thu, 22 Dec 2022 19:03:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AA5461946A40;
	Thu, 22 Dec 2022 19:03:57 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 288C519465B1 for <linux-audit@listman.corp.redhat.com>;
 Thu, 22 Dec 2022 19:03:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CA11453A0; Thu, 22 Dec 2022 19:03:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C20AA51EF
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 19:03:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CF9538012C1
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 19:03:56 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-437-DzNFSvDiO2ajqVnayLh_5Q-1; Thu, 22 Dec 2022 14:03:54 -0500
X-MC-Unique: DzNFSvDiO2ajqVnayLh_5Q-1
Received: by mail-pj1-f44.google.com with SMTP id
 n65-20020a17090a2cc700b0021bc5ef7a14so2837945pjd.0
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 11:03:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wZuh56pq7ahWITyeAc8QVn3pfU1sykqjnr90paIdT6g=;
 b=2xvOM+Hwk/KQtYwcrNG+odA0K3WtfTnWmtE+X83RZB+GYJJiwSD6PFJHQ20YZl+M1g
 ghTWVnOxuZ/ZgHrAIaKkyex2+KXWxm74t354LRm6uWTobw/BGZzAnPAuaGs5u7WMORVx
 meJ6Xl2Jh9LeBwptwm0uO9EbeI/l5Ty+qUQFwePC4uUZq402k/5h3zWW+vKDYvyV/adl
 ItLG67xqp4W21YSnIygq0imTMLjhtsyOvon36uzza7WhNmHqxRTN9SavW0bO0RVxukE6
 xM8xI36C5DvzqkAv8mox5V1AzGMHUrLJ6yif6FflHW9oNezGqJNnpRwwhkvj94ZVqd25
 LjyA==
X-Gm-Message-State: AFqh2kr6yFrlJpXztGisyor2LATNmdGtCPEW8T+OevRhK0PfVXxYtmqy
 oe9vd8/KkoUV+A1EMpmdqnLAQBAQDPvoEKcRcEX2
X-Google-Smtp-Source: AMrXdXuLBW62rtr8n+WHMO5P8CrzkBC2Dj2uFe95m0QcMCsPRz+Cu811+8CpYEaLqMWhKXj5QH42vDYDpxMe1o0zLRc=
X-Received: by 2002:a17:902:e48a:b0:186:c3b2:56d1 with SMTP id
 i10-20020a170902e48a00b00186c3b256d1mr392070ple.15.1671735832520; Thu, 22 Dec
 2022 11:03:52 -0800 (PST)
MIME-Version: 1.0
References: <20221222001343.489117-1-paul@paul-moore.com>
 <Y6SRiv+FloijdETe@google.com>
In-Reply-To: <Y6SRiv+FloijdETe@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 22 Dec 2022 14:03:41 -0500
Message-ID: <CAHC9VhRFmrgXMYKxXqd1KpMzDGhT6gPX-=8Z072utZO_WefYWQ@mail.gmail.com>
Subject: Re: [PATCH] bpf: restore the ebpf audit UNLOAD id field
To: sdf@google.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
Cc: bpf@vger.kernel.org, linux-audit@redhat.com,
 Burn Alting <burn.alting@iinet.net.au>, Alexei Starovoitov <ast@kernel.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 22, 2022 at 12:19 PM <sdf@google.com> wrote:
> On 12/21, Paul Moore wrote:
> > When changing the ebpf program put() routines to support being called
> > from within IRQ context the program ID was reset to zero prior to
> > generating the audit UNLOAD record, which obviously rendered the ID
> > field bogus (always zero).  This patch resolves this by adding a new
> > field, bpf_prog_aux::id_audit, which is set when the ebpf program is
> > allocated an ID and never reset, ensuring a valid ID field,
> > regardless of the state of the original ID field, bpf_prox_aud::id.
>
> > I also modified the bpf_audit_prog() logic used to associate the
> > AUDIT_BPF record with other associated records, e.g. @ctx != NULL.
> > Instead of keying off the operation, it now keys off the execution
> > context, e.g. '!in_irg && !irqs_disabled()', which is much more
> > appropriate and should help better connect the UNLOAD operations with
> > the associated audit state (other audit records).
>
> [..]
>
> > As an note to future bug hunters, I did briefly consider removing the
> > ID reset in bpf_prog_free_id(), as it would seem that once the
> > program is removed from the idr pool it can no longer be found by its
> > ID value, but commit ad8ad79f4f60 ("bpf: offload: free program id
> > when device disappears") seems to imply that it is beneficial to
> > reset the ID value.  Perhaps as a secondary indicator that the ebpf
> > program is unbound/orphaned.
>
> That seems like the way to go imho. Can we have some extra 'invalid_id'
> bitfield in the bpf_prog so we can set it in bpf_prog_free_id and
> check in bpf_prog_free_id (for this offloaded use-case)? Because
> having two ids and then keeping track about which one to use, depending
> on the context, seems more fragile?

I would definitely prefer to keep just a single ID value, and that was
the first approach I took when drafting this patch, but when looking
through the git log it looked like there was some desire to reset the
ID to zero on free.  Not being an expert on the ebpf kernel code I
figured I would just write the patch up this way and make a comment
about not zero'ing out the ID in the commit description so we could
have a discussion about it.

I'm not seeing any other comments, so I'll go ahead with putting
together a v2 that sets an invalid flag/bit and I'll post that for
further discussion/review.

> > Fixes: d809e134be7a ("bpf: Prepare bpf_prog_put() to be called from irq
> > context.")
> > Reported-by: Burn Alting <burn.alting@iinet.net.au>
> > Signed-off-by: Paul Moore <paul@paul-moore.com>
> > ---
> >   include/linux/bpf.h  | 1 +
> >   kernel/bpf/syscall.c | 8 +++++---
> >   2 files changed, 6 insertions(+), 3 deletions(-)

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

