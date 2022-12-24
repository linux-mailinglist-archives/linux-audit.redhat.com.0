Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AF25A655A7E
	for <lists+linux-audit@lfdr.de>; Sat, 24 Dec 2022 16:32:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671895945;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uNg/grccTuk/ynHptbobrEFXS9M/ejiSGPBsN954Nl0=;
	b=ZTXOCQDxjKKHZ9qAnm/CGU5CD+d8cnYMOXKXDENuEQzj03HR/8ZSa2veJVqTRtDHeh7glk
	xJAKwoXBrhCfMuGzL1K9aRGfsHRV0JZ2bQj9L+yXOMNhH3nW5YklERbBUzTlvqDp73pbjQ
	wXAx8OqZzv0otgts8Dk896g3AqZlDBE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-72ZEEM0NMgaJS1B8JZ_NOA-1; Sat, 24 Dec 2022 10:32:22 -0500
X-MC-Unique: 72ZEEM0NMgaJS1B8JZ_NOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF8983C0E458;
	Sat, 24 Dec 2022 15:32:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC83E2026D4B;
	Sat, 24 Dec 2022 15:32:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 30CB819465BA;
	Sat, 24 Dec 2022 15:32:11 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 01A321946588 for <linux-audit@listman.corp.redhat.com>;
 Sat, 24 Dec 2022 15:32:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BEA8C2026D68; Sat, 24 Dec 2022 15:32:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B76102026D4B
 for <linux-audit@redhat.com>; Sat, 24 Dec 2022 15:32:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97EE3185A78B
 for <linux-audit@redhat.com>; Sat, 24 Dec 2022 15:32:09 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-16-yjnWzjTZMYeDTduqwWVcHA-1; Sat, 24 Dec 2022 10:32:07 -0500
X-MC-Unique: yjnWzjTZMYeDTduqwWVcHA-1
Received: by mail-pl1-f174.google.com with SMTP id jl4so1117747plb.8
 for <linux-audit@redhat.com>; Sat, 24 Dec 2022 07:32:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uhx70Wc2VTFokQfpnR8f2VD8Nm2dmZ9bHhkHgTA0qJk=;
 b=4cfslhFr4w1rtBi417hos2w5qC8fLv2eosrQ0vP0IolywUoKS7lmhnk5VtU+HgPBzp
 XpN4Fvf0Mf38NFm3zb+c6HBVH9urRECfpj95BB2A2JgbJJOqXm1rjkHqhTcr5EMb8qZR
 K38nr5rWS7tPA2D9v0cm+9XRflPCfcTj0IO7+3znY9bO0wYe2uapG41JwmxAFa3q8DSG
 e484iNf1fap3Xo81ZUrG3FyL2HQP+54SxNxjtVit7qAX32evfc8/ydTM6zLi5uXurFsp
 rqOwOi1jRJkqYPv1ZSdw2cz0ZVde3kaJtrzZTJmWHHDWUGb9xTJ3kjGjgGijlY9QzB+e
 byrA==
X-Gm-Message-State: AFqh2kokXrVWB9GDK6RwEIvEQ3TjTNakrGp6z7a2AD/+I6PkjwOxlIsn
 1ruO/8bxdGBVZt4eOQfQ/1401QpAju8EEMKiirErhOkX8Rol
X-Google-Smtp-Source: AMrXdXseNgExZNcaLwsrKOqDhqnUHGhQKQPn3LCFiJjUKJUm4SbPfCpkf/sYSsuZeLwe1Ksk6gbX6tQkmPaHu5AyjR8=
X-Received: by 2002:a17:90a:8a82:b0:219:b79d:c308 with SMTP id
 x2-20020a17090a8a8200b00219b79dc308mr1429281pjn.69.1671895926482; Sat, 24 Dec
 2022 07:32:06 -0800 (PST)
MIME-Version: 1.0
References: <20221223185531.222689-1-paul@paul-moore.com>
 <CAKH8qBu30bdiMWmUzZsYaVRTpSXfKjeBHD9deSPQmk_v_seDuA@mail.gmail.com>
In-Reply-To: <CAKH8qBu30bdiMWmUzZsYaVRTpSXfKjeBHD9deSPQmk_v_seDuA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 24 Dec 2022 10:31:55 -0500
Message-ID: <CAHC9VhQx2AVJ05CHVSU0VnjWb85cPE2-Y6KmY7tPLSS_y5=qvw@mail.gmail.com>
Subject: Re: [PATCH v2] bpf: restore the ebpf program ID for BPF_AUDIT_UNLOAD
 and PERF_BPF_EVENT_PROG_UNLOAD
To: Stanislav Fomichev <sdf@google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

On Fri, Dec 23, 2022 at 8:49 PM Stanislav Fomichev <sdf@google.com> wrote:
> On Fri, Dec 23, 2022 at 10:55 AM Paul Moore <paul@paul-moore.com> wrote:
> >
> > When changing the ebpf program put() routines to support being called
> > from within IRQ context the program ID was reset to zero prior to
> > calling the perf event and audit UNLOAD record generators, which
> > resulted in problems as the ebpf program ID was bogus (always zero).
> > This patch resolves this by adding a new flag, bpf_prog::valid_id, to
> > indicate when the bpf_prog_aux ID field is valid; it is set to true/1
> > in bpf_prog_alloc_id() and set to false/0 in bpf_prog_free_id().  In
> > order to help ensure that access to the bpf_prog_aux ID field takes
> > into account the new valid_id flag, the bpf_prog_aux ID field is
> > renamed to bpf_prog_aux::__id and a getter function,
> > bpf_prog_get_id(), was created and all users of bpf_prog_aux::id were
> > converted to the new caller.  Exceptions to this include some of the
> > internal ebpf functions and the xdp trace points, although the latter
> > still take into account the valid_id flag.
> >
> > I also modified the bpf_audit_prog() logic used to associate the
> > AUDIT_BPF record with other associated records, e.g. @ctx != NULL.
> > Instead of keying off the operation, it now keys off the execution
> > context, e.g. '!in_irg && !irqs_disabled()', which is much more
> > appropriate and should help better connect the UNLOAD operations with
> > the associated audit state (other audit records).
> >
> > Fixes: d809e134be7a ("bpf: Prepare bpf_prog_put() to be called from irq context.")
> > Reported-by: Burn Alting <burn.alting@iinet.net.au>
> > Reported-by: Jiri Olsa <olsajiri@gmail.com>
> > Signed-off-by: Paul Moore <paul@paul-moore.com>
> >
> > --
> > * v2
> >   - change subj
> >   - add mention of the perf regression
> >   - drop the dedicated program audit ID
> >   - add the bpf_prog::valid_id flag, bpf_prog_get_id() getter
> >   - convert prog ID users to new ID getter
> > * v1
> >   - subj was: "bpf: restore the ebpf audit UNLOAD id field"
> >   - initial draft
> > ---
> >  drivers/net/netdevsim/bpf.c  |  6 ++++--
> >  include/linux/bpf.h          | 11 +++++++++--
> >  include/linux/bpf_verifier.h |  2 +-
> >  include/trace/events/xdp.h   |  4 ++--
> >  kernel/bpf/arraymap.c        |  2 +-
> >  kernel/bpf/bpf_struct_ops.c  |  2 +-
> >  kernel/bpf/cgroup.c          |  2 +-
> >  kernel/bpf/core.c            |  2 +-
> >  kernel/bpf/cpumap.c          |  2 +-
> >  kernel/bpf/devmap.c          |  2 +-
> >  kernel/bpf/syscall.c         | 27 +++++++++++++++------------
> >  kernel/events/core.c         |  6 +++++-
> >  kernel/trace/bpf_trace.c     |  2 +-
> >  net/core/dev.c               |  2 +-
> >  net/core/filter.c            |  3 ++-
> >  net/core/rtnetlink.c         |  2 +-
> >  net/core/sock_map.c          |  2 +-
> >  net/ipv6/seg6_local.c        |  3 ++-
> >  net/sched/act_bpf.c          |  2 +-
> >  net/sched/cls_bpf.c          |  2 +-
> >  20 files changed, 52 insertions(+), 34 deletions(-)

...

> > diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> > index 9e7d46d16032..18e965bd7db9 100644
> > --- a/include/linux/bpf.h
> > +++ b/include/linux/bpf.h
> > @@ -1688,6 +1689,12 @@ void bpf_prog_inc(struct bpf_prog *prog);
> >  struct bpf_prog * __must_check bpf_prog_inc_not_zero(struct bpf_prog *prog);
> >  void bpf_prog_put(struct bpf_prog *prog);
> >
> > +static inline u32 bpf_prog_get_id(const struct bpf_prog *prog)
> > +{
> > +       if (WARN(!prog->valid_id, "Attempting to use an invalid eBPF program"))
> > +               return 0;
> > +       return prog->aux->__id;
> > +}
>
> I'm still missing why we need to have this WARN and have a check at all.

I believe I explained my reasoning in the other posting, but as I also
mentioned, it's your subsystem so I don't really care about the
details as long as we fix the bug/regression in the ebpf code.

> IIUC, we're actually too eager in resetting the id to 0, and need to
> keep that stale id around at least for perf/audit.

Agreed.

> Why not have a flag only to protect against double-idr_remove
> bpf_prog_free_id and keep the rest as is?

I'll send an updated patch next week with the only protection being a
check in bpf_prog_free_id().

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

