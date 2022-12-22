Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B906547E2
	for <lists+linux-audit@lfdr.de>; Thu, 22 Dec 2022 22:31:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671744685;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1ISPpokdRUiau26/X9uFPw3cyz84L1BapOn36XikoEU=;
	b=WUF3OCaZaR5KBsYxMx1pb3nUHH+YV5xUY8y0dsoqQZA7cxw/H61M8+uSQXljUvxdZmPJCC
	CobLYqiLowvW9n6w57cvzEgbapdGIYG2oPp5fCRzT4SPxeEJgfe4wGF2Ng3H5DATEEkIRk
	smo09yB1V+s3wVeWkSAEciv4hHhksLs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552--7wxuB3tPeGTTFjo5FnbAw-1; Thu, 22 Dec 2022 16:31:23 -0500
X-MC-Unique: -7wxuB3tPeGTTFjo5FnbAw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 959212802BAD;
	Thu, 22 Dec 2022 21:31:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B9FFD2026D4B;
	Thu, 22 Dec 2022 21:31:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 67FF41946A40;
	Thu, 22 Dec 2022 21:31:20 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C29FF19465B1 for <linux-audit@listman.corp.redhat.com>;
 Thu, 22 Dec 2022 21:28:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B45EA112132C; Thu, 22 Dec 2022 21:28:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD50E112132D
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 21:28:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D9FA8F6E84
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 21:28:06 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-211-SM7YO9meP-WhLwqTxBY4zg-1; Thu, 22 Dec 2022 16:28:05 -0500
X-MC-Unique: SM7YO9meP-WhLwqTxBY4zg-1
Received: by mail-pl1-f172.google.com with SMTP id u7so3166643plq.11
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 13:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6mc7OW9rt3wbWYcaANytniKa3C0AqTKlhbi86XCpads=;
 b=lRfdqKUv+9SdWTLsAmYlGB+aTQBe/meCuAdDOKmecXf00lnoD+TJ8gKTvqNHquxCcO
 emhUoWeHQ2je2PnLhZQrgaUERQkVuHD6OJwyMO5Vt9tWTANAWzluCYwlB3hm6PNZUIPP
 NQgqrrWRSde4F+DdUWX2Dx1IjFo1f0vpcweVBIcCwgnlTbqNwsPTWpNFpyPdhGAd624P
 7MXBvGnEVbrlZLHtgoI9f98mOMUdWM6mYZystm2llVfdGQjqjxOT1xp16BjuOmPHXIID
 SNzjbtggS5+c7WY8TdnRFV8mGSZhxFdv43q6vIa/JoWDbqOBQIVm5DB5IBqB5tS0U6dr
 PzXg==
X-Gm-Message-State: AFqh2koV+BF68Q6tr6gDMSvVJKGxeJuAGEZMjvT6NPbF133FTlvJsboP
 KWUOHKlWREQ0E+0UDNImK7MdtzPLYnhxVO03M81BbA==
X-Google-Smtp-Source: AMrXdXsGCju1a3R3dWivrZiwZSdNNnZUZdk9b6dQt4C/RUfPlrT2bw9v8ZYM72ke9bPcAu7kDlm5ESILR5rlqczLmEg=
X-Received: by 2002:a17:90a:a02:b0:21e:df53:9183 with SMTP id
 o2-20020a17090a0a0200b0021edf539183mr631620pjo.66.1671744483681; Thu, 22 Dec
 2022 13:28:03 -0800 (PST)
MIME-Version: 1.0
References: <20221222001343.489117-1-paul@paul-moore.com>
 <Y6SRiv+FloijdETe@google.com>
 <CAHC9VhRFmrgXMYKxXqd1KpMzDGhT6gPX-=8Z072utZO_WefYWQ@mail.gmail.com>
 <Y6SysZgKKEPL5ZE5@google.com>
 <CAHC9VhQ4EPzQ56ix9he4ZTo7eYpMdLBPpb+3vNsng_9vD2t=RQ@mail.gmail.com>
 <CAHC9VhSwpV80pPjzc2w9r--16LXuG7vYxE1eg5MCz2ytn2TH7g@mail.gmail.com>
In-Reply-To: <CAHC9VhSwpV80pPjzc2w9r--16LXuG7vYxE1eg5MCz2ytn2TH7g@mail.gmail.com>
From: Stanislav Fomichev <sdf@google.com>
Date: Thu, 22 Dec 2022 13:27:52 -0800
Message-ID: <CAKH8qBszD=PYO_nVjYUTnj7UXVcBvA95meULQGs53eyo9xfD+A@mail.gmail.com>
Subject: Re: [PATCH] bpf: restore the ebpf audit UNLOAD id field
To: Paul Moore <paul@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Thu, 22 Dec 2022 21:31:19 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 22, 2022 at 12:07 PM Paul Moore <paul@paul-moore.com> wrote:
>
> On Thu, Dec 22, 2022 at 2:59 PM Paul Moore <paul@paul-moore.com> wrote:
> >
> > On Thu, Dec 22, 2022 at 2:40 PM <sdf@google.com> wrote:
> > > On 12/22, Paul Moore wrote:
> > > > On Thu, Dec 22, 2022 at 12:19 PM <sdf@google.com> wrote:
> > > > > On 12/21, Paul Moore wrote:
> > > > > > When changing the ebpf program put() routines to support being called
> > > > > > from within IRQ context the program ID was reset to zero prior to
> > > > > > generating the audit UNLOAD record, which obviously rendered the ID
> > > > > > field bogus (always zero).  This patch resolves this by adding a new
> > > > > > field, bpf_prog_aux::id_audit, which is set when the ebpf program is
> > > > > > allocated an ID and never reset, ensuring a valid ID field,
> > > > > > regardless of the state of the original ID field, bpf_prox_aud::id.
> > > > >
> > > > > > I also modified the bpf_audit_prog() logic used to associate the
> > > > > > AUDIT_BPF record with other associated records, e.g. @ctx != NULL.
> > > > > > Instead of keying off the operation, it now keys off the execution
> > > > > > context, e.g. '!in_irg && !irqs_disabled()', which is much more
> > > > > > appropriate and should help better connect the UNLOAD operations with
> > > > > > the associated audit state (other audit records).
> > > > >
> > > > > [..]
> > > > >
> > > > > > As an note to future bug hunters, I did briefly consider removing the
> > > > > > ID reset in bpf_prog_free_id(), as it would seem that once the
> > > > > > program is removed from the idr pool it can no longer be found by its
> > > > > > ID value, but commit ad8ad79f4f60 ("bpf: offload: free program id
> > > > > > when device disappears") seems to imply that it is beneficial to
> > > > > > reset the ID value.  Perhaps as a secondary indicator that the ebpf
> > > > > > program is unbound/orphaned.
> > > > >
> > > > > That seems like the way to go imho. Can we have some extra 'invalid_id'
> > > > > bitfield in the bpf_prog so we can set it in bpf_prog_free_id and
> > > > > check in bpf_prog_free_id (for this offloaded use-case)? Because
> > > > > having two ids and then keeping track about which one to use, depending
> > > > > on the context, seems more fragile?
> > >
> > > > I would definitely prefer to keep just a single ID value, and that was
> > > > the first approach I took when drafting this patch, but when looking
> > > > through the git log it looked like there was some desire to reset the
> > > > ID to zero on free.  Not being an expert on the ebpf kernel code I
> > > > figured I would just write the patch up this way and make a comment
> > > > about not zero'ing out the ID in the commit description so we could
> > > > have a discussion about it.
> > >
> > > Yeah, the commit you reference is resetting the id for the offloaded
> > > progs. But it also mentions that even though we reset the id,
> > > it won't leak into the userspace:
> > >
> > >    Note that orphaned offload programs will return -ENODEV on
> > >    BPF_OBJ_GET_INFO_BY_FD so user will never see ID 0.
> > >
> > > It talks about the "if (!aux->offload)" check in bpf_prog_offload_info_fill.
> > > So I'm assuming that having some extra "this id is already free" signal
> > > in the bpf_prog shouldn't be a problem here.
> >
> > FWIW, the currently-work-in-progress v2 patch adds a getter for the ID
> > with a WARN() check to flag callers who are trying to access a
> > bad/free'd bpf_prog.  Unfortunately it touches a decent chunk of code,
> > but I think it might be a nice additional check at runtime.
> >
> > +u32 bpf_prog_get_id(const struct bpf_prog *prog)
> > +{
> > +       if (WARN(!prog->valid_id, "Attempting to use invalid eBPF program"))
> > +               return 0;
> > +       return prog->aux->__id;
> > +}
>
> I should add that the getter is currently a static inline in bpf.h.

I don't see why we need to WARN on !valid_id, but I might be missing something.
There are no places currently where we report 'id == 0' to the
userspace, so we only need to take care of the offloaded case that
resets id to zero early (instead of resetting it during regular
__bpf_prog_put path).

> > > > I'm not seeing any other comments, so I'll go ahead with putting
> > > > together a v2 that sets an invalid flag/bit and I'll post that for
> > > > further discussion/review.
>
> --
> paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

