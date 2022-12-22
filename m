Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 569A36546FC
	for <lists+linux-audit@lfdr.de>; Thu, 22 Dec 2022 21:08:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671739689;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Hde8UQ0RqoUH1JUV0WoxJODpJxj27TkjJtVCB1MHhlU=;
	b=NxBE79oHg+zXv3iAG7YnUfEifC+JSjndJ4DnZGxEDC5n/1xPAankF0uKcbd27qoP+ppwVO
	OVq+zkJO+eC7SxnpJT93bYWnIdms3ZUGano7uHGh7f62x8pcxrhSbt4zu1lQyHNRxSZB1I
	CFb6KPCKX2djFajkuiKWem0olUQh0FQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-uv8NL_ECNR-ctGN3yD-CVw-1; Thu, 22 Dec 2022 15:08:05 -0500
X-MC-Unique: uv8NL_ECNR-ctGN3yD-CVw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2959029AA2E7;
	Thu, 22 Dec 2022 20:08:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1CAA6492B02;
	Thu, 22 Dec 2022 20:07:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8A0181946A40;
	Thu, 22 Dec 2022 20:07:51 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1097C19465B1 for <linux-audit@listman.corp.redhat.com>;
 Thu, 22 Dec 2022 20:07:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A4CA9C158BB; Thu, 22 Dec 2022 20:07:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DCA5C15BA0
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 20:07:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D985858F0E
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 20:07:50 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-103-LMHBfcN5P5SIlNelKFrprQ-1; Thu, 22 Dec 2022 15:07:48 -0500
X-MC-Unique: LMHBfcN5P5SIlNelKFrprQ-1
Received: by mail-pl1-f176.google.com with SMTP id 17so3079894pll.0
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 12:07:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Okvp41I+wX+voP3C0w/v4exnNJYnShEom/tOMIuEEmc=;
 b=4hIzMujwCWq8CH4c0tXUr3REYwZGqOQ24ISn4q9aEcY45S5BV5HFIfIFUKZMqQ24zh
 jJKEYi6UiiWEjHwZt23wSggzqE6C7a8nSJs+YuI2t5oP9NusEUHqlJh2aEJy9Pj79Czy
 ik+3uTEAr73B3UxZyyvi05by7YJ5jtTjhnEPtut9oWxAR+Xj+JAupxkvWzVNCmPdBvTQ
 YGNUrfPngwNPjg/o7tLRrzNBersOHyWXCxor1QJjr6HyM9KjLpxZVt9BJ1XDSVQU6IKP
 5kGpE0uOrRFuomCLL3OtAwkqCq/4LHclb3qJEmur0M6Xz7yMkhU3PXGHgVqTEPdFgyta
 HSIw==
X-Gm-Message-State: AFqh2kpTOei99ECqNOAQqNt2pUyhoIhxgmudpL+NMizrFaVhekq7GgQc
 0AEgj+R+5F3SBF1iZ/6zt5pJ4TKCVv5bfbKEOQ44
X-Google-Smtp-Source: AMrXdXv3T+wIlc4Rgw8O/jSaNRs9ucvsd9qarSnqHI2c/4SUqPz+XIqDHsYRZvV6XK2AxTqqIapJF2EoaZAiYINzIbM=
X-Received: by 2002:a17:90a:8a82:b0:219:b79d:c308 with SMTP id
 x2-20020a17090a8a8200b00219b79dc308mr828965pjn.69.1671739667430; Thu, 22 Dec
 2022 12:07:47 -0800 (PST)
MIME-Version: 1.0
References: <20221222001343.489117-1-paul@paul-moore.com>
 <Y6SRiv+FloijdETe@google.com>
 <CAHC9VhRFmrgXMYKxXqd1KpMzDGhT6gPX-=8Z072utZO_WefYWQ@mail.gmail.com>
 <Y6SysZgKKEPL5ZE5@google.com>
 <CAHC9VhQ4EPzQ56ix9he4ZTo7eYpMdLBPpb+3vNsng_9vD2t=RQ@mail.gmail.com>
In-Reply-To: <CAHC9VhQ4EPzQ56ix9he4ZTo7eYpMdLBPpb+3vNsng_9vD2t=RQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 22 Dec 2022 15:07:35 -0500
Message-ID: <CAHC9VhSwpV80pPjzc2w9r--16LXuG7vYxE1eg5MCz2ytn2TH7g@mail.gmail.com>
Subject: Re: [PATCH] bpf: restore the ebpf audit UNLOAD id field
To: sdf@google.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 22, 2022 at 2:59 PM Paul Moore <paul@paul-moore.com> wrote:
>
> On Thu, Dec 22, 2022 at 2:40 PM <sdf@google.com> wrote:
> > On 12/22, Paul Moore wrote:
> > > On Thu, Dec 22, 2022 at 12:19 PM <sdf@google.com> wrote:
> > > > On 12/21, Paul Moore wrote:
> > > > > When changing the ebpf program put() routines to support being called
> > > > > from within IRQ context the program ID was reset to zero prior to
> > > > > generating the audit UNLOAD record, which obviously rendered the ID
> > > > > field bogus (always zero).  This patch resolves this by adding a new
> > > > > field, bpf_prog_aux::id_audit, which is set when the ebpf program is
> > > > > allocated an ID and never reset, ensuring a valid ID field,
> > > > > regardless of the state of the original ID field, bpf_prox_aud::id.
> > > >
> > > > > I also modified the bpf_audit_prog() logic used to associate the
> > > > > AUDIT_BPF record with other associated records, e.g. @ctx != NULL.
> > > > > Instead of keying off the operation, it now keys off the execution
> > > > > context, e.g. '!in_irg && !irqs_disabled()', which is much more
> > > > > appropriate and should help better connect the UNLOAD operations with
> > > > > the associated audit state (other audit records).
> > > >
> > > > [..]
> > > >
> > > > > As an note to future bug hunters, I did briefly consider removing the
> > > > > ID reset in bpf_prog_free_id(), as it would seem that once the
> > > > > program is removed from the idr pool it can no longer be found by its
> > > > > ID value, but commit ad8ad79f4f60 ("bpf: offload: free program id
> > > > > when device disappears") seems to imply that it is beneficial to
> > > > > reset the ID value.  Perhaps as a secondary indicator that the ebpf
> > > > > program is unbound/orphaned.
> > > >
> > > > That seems like the way to go imho. Can we have some extra 'invalid_id'
> > > > bitfield in the bpf_prog so we can set it in bpf_prog_free_id and
> > > > check in bpf_prog_free_id (for this offloaded use-case)? Because
> > > > having two ids and then keeping track about which one to use, depending
> > > > on the context, seems more fragile?
> >
> > > I would definitely prefer to keep just a single ID value, and that was
> > > the first approach I took when drafting this patch, but when looking
> > > through the git log it looked like there was some desire to reset the
> > > ID to zero on free.  Not being an expert on the ebpf kernel code I
> > > figured I would just write the patch up this way and make a comment
> > > about not zero'ing out the ID in the commit description so we could
> > > have a discussion about it.
> >
> > Yeah, the commit you reference is resetting the id for the offloaded
> > progs. But it also mentions that even though we reset the id,
> > it won't leak into the userspace:
> >
> >    Note that orphaned offload programs will return -ENODEV on
> >    BPF_OBJ_GET_INFO_BY_FD so user will never see ID 0.
> >
> > It talks about the "if (!aux->offload)" check in bpf_prog_offload_info_fill.
> > So I'm assuming that having some extra "this id is already free" signal
> > in the bpf_prog shouldn't be a problem here.
>
> FWIW, the currently-work-in-progress v2 patch adds a getter for the ID
> with a WARN() check to flag callers who are trying to access a
> bad/free'd bpf_prog.  Unfortunately it touches a decent chunk of code,
> but I think it might be a nice additional check at runtime.
>
> +u32 bpf_prog_get_id(const struct bpf_prog *prog)
> +{
> +       if (WARN(!prog->valid_id, "Attempting to use invalid eBPF program"))
> +               return 0;
> +       return prog->aux->__id;
> +}

I should add that the getter is currently a static inline in bpf.h.

> > > I'm not seeing any other comments, so I'll go ahead with putting
> > > together a v2 that sets an invalid flag/bit and I'll post that for
> > > further discussion/review.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

