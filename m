Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCBB6546F2
	for <lists+linux-audit@lfdr.de>; Thu, 22 Dec 2022 20:59:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671739183;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fsucxcNgXB2DwfB8tFmpJlFiTOODsz4KwrGsW3gdErA=;
	b=AaV8DD7gy/KFWlEjla+Lm+Iin8QXXrfaPgTCfwjizBpYEYjpCmWnTugetNy3VsGejosj7s
	kHyjv47/mZu1hKZ0WTWZOxCiepoT43+zi+wJUfuvI7B+vaawOoU3bikRT55rpa3h4upfCY
	xD31AL8Kqi01xsq4mvWcBCo0xaOorsQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-mFfav3bbN02F4Tmm7LZWOw-1; Thu, 22 Dec 2022 14:59:39 -0500
X-MC-Unique: mFfav3bbN02F4Tmm7LZWOw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AFF3811E6E;
	Thu, 22 Dec 2022 19:59:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7655940C2064;
	Thu, 22 Dec 2022 19:59:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C6B061946A40;
	Thu, 22 Dec 2022 19:59:33 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A885C19465B1 for <linux-audit@listman.corp.redhat.com>;
 Thu, 22 Dec 2022 19:59:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 94F8CC158BB; Thu, 22 Dec 2022 19:59:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E201C15BA0
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 19:59:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71782101A52E
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 19:59:32 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-490-UaiwxzQIPmah4_u-CFwlsA-1; Thu, 22 Dec 2022 14:59:30 -0500
X-MC-Unique: UaiwxzQIPmah4_u-CFwlsA-1
Received: by mail-pg1-f171.google.com with SMTP id w37so2001671pga.5
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 11:59:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OYOcnppnjv8swtEgO4QQRDHFBz+p7juA0/BK+cLYUj0=;
 b=pTk8I6qQPfwfRWb2lbNlngCBrnZc5vilTSRCS9FzPMB4ihbt49aRp3NPoaYagqseWk
 jocjfo8OlON2YEH0Zuwn1pEYwV5G5+gL30fqG6mNmki+RSyZJWBjP9xK40pBhFHaJdYe
 43G47C41baxO1+0pAgwHtShOZItJDmifz+o5jH8qNGHIqF00tx1/LzldIMAjHtJ8DgyB
 dp3bWkiZLO9xTfsVXV4Pwkb08cLasSlaATUd6MepddCX7Ui20Lm74dAFM2duwNMpBn0y
 lcpvTtrw28qv0pvXWg7mH2xQEQRU2pzpBAbiEFh046u6zupCjFdeIJ7eBHWnJ0RFpYQ7
 uARg==
X-Gm-Message-State: AFqh2kpYTb9pmRBw3npltb88bNl9+1fSUAcKWBh7m+2rhCM/3K7Ysx/1
 qzh/I0AyuGb0gKmYwsyHxQjVdwNiHBkNgbt979dp
X-Google-Smtp-Source: AMrXdXtcIUhwVSi7GhU7APuAnO+KcyB139p4XC2XcKeQKC5pNjoCIagdi9V+EIhy8mZ+xJ0pAMbNtQTxt1zIr6QHC4g=
X-Received: by 2002:a05:6a00:1f1a:b0:576:af2d:4c5f with SMTP id
 be26-20020a056a001f1a00b00576af2d4c5fmr449104pfb.23.1671739169344; Thu, 22
 Dec 2022 11:59:29 -0800 (PST)
MIME-Version: 1.0
References: <20221222001343.489117-1-paul@paul-moore.com>
 <Y6SRiv+FloijdETe@google.com>
 <CAHC9VhRFmrgXMYKxXqd1KpMzDGhT6gPX-=8Z072utZO_WefYWQ@mail.gmail.com>
 <Y6SysZgKKEPL5ZE5@google.com>
In-Reply-To: <Y6SysZgKKEPL5ZE5@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 22 Dec 2022 14:59:17 -0500
Message-ID: <CAHC9VhQ4EPzQ56ix9he4ZTo7eYpMdLBPpb+3vNsng_9vD2t=RQ@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 22, 2022 at 2:40 PM <sdf@google.com> wrote:
> On 12/22, Paul Moore wrote:
> > On Thu, Dec 22, 2022 at 12:19 PM <sdf@google.com> wrote:
> > > On 12/21, Paul Moore wrote:
> > > > When changing the ebpf program put() routines to support being called
> > > > from within IRQ context the program ID was reset to zero prior to
> > > > generating the audit UNLOAD record, which obviously rendered the ID
> > > > field bogus (always zero).  This patch resolves this by adding a new
> > > > field, bpf_prog_aux::id_audit, which is set when the ebpf program is
> > > > allocated an ID and never reset, ensuring a valid ID field,
> > > > regardless of the state of the original ID field, bpf_prox_aud::id.
> > >
> > > > I also modified the bpf_audit_prog() logic used to associate the
> > > > AUDIT_BPF record with other associated records, e.g. @ctx != NULL.
> > > > Instead of keying off the operation, it now keys off the execution
> > > > context, e.g. '!in_irg && !irqs_disabled()', which is much more
> > > > appropriate and should help better connect the UNLOAD operations with
> > > > the associated audit state (other audit records).
> > >
> > > [..]
> > >
> > > > As an note to future bug hunters, I did briefly consider removing the
> > > > ID reset in bpf_prog_free_id(), as it would seem that once the
> > > > program is removed from the idr pool it can no longer be found by its
> > > > ID value, but commit ad8ad79f4f60 ("bpf: offload: free program id
> > > > when device disappears") seems to imply that it is beneficial to
> > > > reset the ID value.  Perhaps as a secondary indicator that the ebpf
> > > > program is unbound/orphaned.
> > >
> > > That seems like the way to go imho. Can we have some extra 'invalid_id'
> > > bitfield in the bpf_prog so we can set it in bpf_prog_free_id and
> > > check in bpf_prog_free_id (for this offloaded use-case)? Because
> > > having two ids and then keeping track about which one to use, depending
> > > on the context, seems more fragile?
>
> > I would definitely prefer to keep just a single ID value, and that was
> > the first approach I took when drafting this patch, but when looking
> > through the git log it looked like there was some desire to reset the
> > ID to zero on free.  Not being an expert on the ebpf kernel code I
> > figured I would just write the patch up this way and make a comment
> > about not zero'ing out the ID in the commit description so we could
> > have a discussion about it.
>
> Yeah, the commit you reference is resetting the id for the offloaded
> progs. But it also mentions that even though we reset the id,
> it won't leak into the userspace:
>
>    Note that orphaned offload programs will return -ENODEV on
>    BPF_OBJ_GET_INFO_BY_FD so user will never see ID 0.
>
> It talks about the "if (!aux->offload)" check in bpf_prog_offload_info_fill.
> So I'm assuming that having some extra "this id is already free" signal
> in the bpf_prog shouldn't be a problem here.

FWIW, the currently-work-in-progress v2 patch adds a getter for the ID
with a WARN() check to flag callers who are trying to access a
bad/free'd bpf_prog.  Unfortunately it touches a decent chunk of code,
but I think it might be a nice additional check at runtime.

+u32 bpf_prog_get_id(const struct bpf_prog *prog)
+{
+       if (WARN(!prog->valid_id, "Attempting to use invalid eBPF program"))
+               return 0;
+       return prog->aux->__id;
+}

> > I'm not seeing any other comments, so I'll go ahead with putting
> > together a v2 that sets an invalid flag/bit and I'll post that for
> > further discussion/review.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

