Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD6365512D
	for <lists+linux-audit@lfdr.de>; Fri, 23 Dec 2022 15:08:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671804523;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5WP33wqByloEwRkOMDpXnzU3vvTyTV49oOafmvjk7T4=;
	b=TYfgKM1qjrxqcsiwpWDpzE4z3bWcEAtl6gqiz5avEprs7AwnHuPPvoUMvKO1Jj10AjEBB4
	XJgS+AQw0o7qZt6TGRm5AgliE/TqxpGzzlx1IkxDLacf/bpsgovCqpA640kjFkJFSz0QjJ
	do7j440Wf0+WHqu5DKKsUNRSxQ5gGTE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-84imTqW4NOe2rvtxFgmQdQ-1; Fri, 23 Dec 2022 09:08:39 -0500
X-MC-Unique: 84imTqW4NOe2rvtxFgmQdQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47CF22A5954C;
	Fri, 23 Dec 2022 14:08:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 48F7540C945A;
	Fri, 23 Dec 2022 14:08:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 71B281946A40;
	Fri, 23 Dec 2022 14:08:30 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6C00919465B1 for <linux-audit@listman.corp.redhat.com>;
 Thu, 22 Dec 2022 23:20:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 56B0C40C2004; Thu, 22 Dec 2022 23:20:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FBC340C2064
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 23:20:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 350EE3806078
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 23:20:21 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-172-P2OWzn9vP0yFutAqFHWo_Q-1; Thu, 22 Dec 2022 18:20:19 -0500
X-MC-Unique: P2OWzn9vP0yFutAqFHWo_Q-1
Received: by mail-ed1-f41.google.com with SMTP id d14so4949057edj.11
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 15:20:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iJgMFVOrb9Ce/17yeODdS1CKT2hqIh/Wcl38sjrwoW0=;
 b=NAzXOUf1/uDY+VDXwQV+2spy9ALuVzEm5B31OoKBxsJFVoQptWcOiFgKNxSda37Lti
 CNH0BmylXsVtPz+81cvnmO2DEHGL8NX8T/ywtNi84pzhc7QMYpIm/Sec25rP2A6BLBNl
 Q1ouhXJnmQHEgjtuershyEgzWrJZeMB/MY8WMHM/WUHnAJBX9/aaJZFgb7xijm9FGHJd
 S7qJ7BMvzx5ZRLmhIj+UOnmU0RnY+xJfVlPbp9lz/ZX+Juvr7ZVC4QdIMw4VZhC82Qv3
 KAD0ChBXEQfFylusjDUnj/WahQb+9cAM5DLKRndzo/2SUPQ0HpKsPiX3jtDvT9zNkrB9
 By3g==
X-Gm-Message-State: AFqh2kqTgARTcFQkyxvpGTL4QWw+skdlP6O72lT+7PpIwTGvy6azQ94o
 cN+/iWNXY5hr70VY2CFbNWs=
X-Google-Smtp-Source: AMrXdXsFC+hmKq79PeW+KUm2ca/pltb9zbhnABL2aMPJOE1HMdCr+a/qBrze/JnBXo5BFJiptXRh3w==
X-Received: by 2002:a05:6402:3706:b0:472:9af1:163f with SMTP id
 ek6-20020a056402370600b004729af1163fmr6129935edb.37.1671751218317; 
 Thu, 22 Dec 2022 15:20:18 -0800 (PST)
Received: from krava ([83.240.60.17]) by smtp.gmail.com with ESMTPSA id
 s8-20020a170906354800b007ad2da5668csm705785eja.112.2022.12.22.15.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 15:20:17 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 23 Dec 2022 00:20:15 +0100
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] bpf: restore the ebpf audit UNLOAD id field
Message-ID: <Y6TmLyDTY/a20Zq4@krava>
References: <20221222001343.489117-1-paul@paul-moore.com>
 <Y6SRiv+FloijdETe@google.com>
 <CAHC9VhRFmrgXMYKxXqd1KpMzDGhT6gPX-=8Z072utZO_WefYWQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRFmrgXMYKxXqd1KpMzDGhT6gPX-=8Z072utZO_WefYWQ@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Fri, 23 Dec 2022 14:08:28 +0000
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
 Burn Alting <burn.alting@iinet.net.au>, sdf@google.com,
 Alexei Starovoitov <ast@kernel.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 22, 2022 at 02:03:41PM -0500, Paul Moore wrote:
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
> 
> I would definitely prefer to keep just a single ID value, and that was
> the first approach I took when drafting this patch, but when looking
> through the git log it looked like there was some desire to reset the
> ID to zero on free.  Not being an expert on the ebpf kernel code I
> figured I would just write the patch up this way and make a comment
> about not zero'ing out the ID in the commit description so we could
> have a discussion about it.
> 
> I'm not seeing any other comments, so I'll go ahead with putting
> together a v2 that sets an invalid flag/bit and I'll post that for
> further discussion/review.

great, perf suffers the same issue:
  https://lore.kernel.org/bpf/Y3SRWVoycV290S16@krava/

any chance you could include it as well? I can send a patch
later if needed

thanks,
jirka

> 
> > > Fixes: d809e134be7a ("bpf: Prepare bpf_prog_put() to be called from irq
> > > context.")
> > > Reported-by: Burn Alting <burn.alting@iinet.net.au>
> > > Signed-off-by: Paul Moore <paul@paul-moore.com>
> > > ---
> > >   include/linux/bpf.h  | 1 +
> > >   kernel/bpf/syscall.c | 8 +++++---
> > >   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> -- 
> paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

