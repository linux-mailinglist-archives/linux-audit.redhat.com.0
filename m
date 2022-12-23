Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CCF6554BD
	for <lists+linux-audit@lfdr.de>; Fri, 23 Dec 2022 22:27:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671830837;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PZC3HhEDPXeuKoUucBAw+7MuUjhpemsbY2lFO0Mb4eU=;
	b=Vw6QwKm3zdg76eBI1oe4cyEC1hdsEPHbjl5pgP3Uae2esmXFZIjIt3DmPIAth1bNvgSAhr
	GOPEEI9RbKscvo3YRbIK4psxb/tgsyPgR4jKECG01n/GsL3akynFuJQyw6iURBcuqMkCOX
	mPLTAzgefASslQZzbJgs5rJjP6IFJl0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-MNaTwhv7PCywm-zyPPBFGw-1; Fri, 23 Dec 2022 16:27:13 -0500
X-MC-Unique: MNaTwhv7PCywm-zyPPBFGw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 085DF29A9D47;
	Fri, 23 Dec 2022 21:27:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CAF0653AA;
	Fri, 23 Dec 2022 21:27:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ACF251946A40;
	Fri, 23 Dec 2022 21:27:01 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AEF4719465B1 for <linux-audit@listman.corp.redhat.com>;
 Fri, 23 Dec 2022 21:26:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 559ADC15BAE; Fri, 23 Dec 2022 21:26:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DA30C15BA0
 for <linux-audit@redhat.com>; Fri, 23 Dec 2022 21:26:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3F8029A9D2A
 for <linux-audit@redhat.com>; Fri, 23 Dec 2022 21:26:58 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-219-U5O2hZpfO3SH1yVik4220w-1; Fri, 23 Dec 2022 16:26:55 -0500
X-MC-Unique: U5O2hZpfO3SH1yVik4220w-1
Received: by mail-pj1-f49.google.com with SMTP id p4so5966953pjk.2
 for <linux-audit@redhat.com>; Fri, 23 Dec 2022 13:26:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4gfG/wlEI6oRTf4TuIt7/0Mn2sElJVOoXH266i2Gr9o=;
 b=bRTTpc65xWwBgsCIeWSsFfSOAGaOgAh2dKuG7/xSsjPGBFwIJBq3/tWOQukeK+aBWk
 RzKj6p7W2m+bs7R152YOMdQSpKIk5J99k1usEYXNz3HpJwWqyBHMbx6XZ3/PC6KbnMsz
 URaapY66zO+pE5jdC7ki9m2C21kv8raWJxDd02l6k+s1SA+7Yg0gJAdJ+LBYi6aljHQ6
 kqOvNun6+AgAhR2mtYDLhEJPEkc/49P+vVpaxKBaPOCs7Rog2KG5KAkSpRETXdyOQAsF
 OVWqyRc7/UVOnULByld/jc4eqbV4N+/SF05/5y4kOizhwiTamXqzlniBxk2ZO9aiEYYr
 1mdg==
X-Gm-Message-State: AFqh2kr0P2ZvLMLkIyTYtmVXZ+AjVA4DPRCMcRLXBmO9YQ6vQqLL7dLM
 NXEuiiHBM2poUWFedk18CrzvR8Ul9Y2FqseHdMHTAOv6x5CF
X-Google-Smtp-Source: AMrXdXuU9qtj67dv+uW5F8kAgRqGlTsuBqG+Ozpvlt4Opx/sle5Y8R/R3ZLOX2bZmMTWW54BwcpESIEwtGhk1J5WMKY=
X-Received: by 2002:a17:903:22c1:b0:189:8a36:1b70 with SMTP id
 y1-20020a17090322c100b001898a361b70mr756658plg.12.1671830814301; Fri, 23 Dec
 2022 13:26:54 -0800 (PST)
MIME-Version: 1.0
References: <20221223185531.222689-1-paul@paul-moore.com>
In-Reply-To: <20221223185531.222689-1-paul@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 23 Dec 2022 16:26:43 -0500
Message-ID: <CAHC9VhQmLcLYxxmDgo9ygmcanuyGVY_A=y2z6rtGdMcwwA4rDw@mail.gmail.com>
Subject: Re: [PATCH v2] bpf: restore the ebpf program ID for BPF_AUDIT_UNLOAD
 and PERF_BPF_EVENT_PROG_UNLOAD
To: linux-audit@redhat.com, bpf@vger.kernel.org
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
Cc: Burn Alting <burn.alting@iinet.net.au>, Alexei Starovoitov <ast@kernel.org>,
 Stanislav Fomichev <sdf@google.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 23, 2022 at 1:55 PM Paul Moore <paul@paul-moore.com> wrote:
>
> When changing the ebpf program put() routines to support being called
> from within IRQ context the program ID was reset to zero prior to
> calling the perf event and audit UNLOAD record generators, which
> resulted in problems as the ebpf program ID was bogus (always zero).
> This patch resolves this by adding a new flag, bpf_prog::valid_id, to
> indicate when the bpf_prog_aux ID field is valid; it is set to true/1
> in bpf_prog_alloc_id() and set to false/0 in bpf_prog_free_id().  In
> order to help ensure that access to the bpf_prog_aux ID field takes
> into account the new valid_id flag, the bpf_prog_aux ID field is
> renamed to bpf_prog_aux::__id and a getter function,
> bpf_prog_get_id(), was created and all users of bpf_prog_aux::id were
> converted to the new caller.  Exceptions to this include some of the
> internal ebpf functions and the xdp trace points, although the latter
> still take into account the valid_id flag.
>
> I also modified the bpf_audit_prog() logic used to associate the
> AUDIT_BPF record with other associated records, e.g. @ctx != NULL.
> Instead of keying off the operation, it now keys off the execution
> context, e.g. '!in_irg && !irqs_disabled()', which is much more
> appropriate and should help better connect the UNLOAD operations with
> the associated audit state (other audit records).
>
> Fixes: d809e134be7a ("bpf: Prepare bpf_prog_put() to be called from irq context.")
> Reported-by: Burn Alting <burn.alting@iinet.net.au>
> Reported-by: Jiri Olsa <olsajiri@gmail.com>
> Signed-off-by: Paul Moore <paul@paul-moore.com>
>
> --
> * v2
>   - change subj
>   - add mention of the perf regression
>   - drop the dedicated program audit ID
>   - add the bpf_prog::valid_id flag, bpf_prog_get_id() getter
>   - convert prog ID users to new ID getter
> * v1
>   - subj was: "bpf: restore the ebpf audit UNLOAD id field"
>   - initial draft
> ---
>  drivers/net/netdevsim/bpf.c  |  6 ++++--
>  include/linux/bpf.h          | 11 +++++++++--
>  include/linux/bpf_verifier.h |  2 +-
>  include/trace/events/xdp.h   |  4 ++--
>  kernel/bpf/arraymap.c        |  2 +-
>  kernel/bpf/bpf_struct_ops.c  |  2 +-
>  kernel/bpf/cgroup.c          |  2 +-
>  kernel/bpf/core.c            |  2 +-
>  kernel/bpf/cpumap.c          |  2 +-
>  kernel/bpf/devmap.c          |  2 +-
>  kernel/bpf/syscall.c         | 27 +++++++++++++++------------
>  kernel/events/core.c         |  6 +++++-
>  kernel/trace/bpf_trace.c     |  2 +-
>  net/core/dev.c               |  2 +-
>  net/core/filter.c            |  3 ++-
>  net/core/rtnetlink.c         |  2 +-
>  net/core/sock_map.c          |  2 +-
>  net/ipv6/seg6_local.c        |  3 ++-
>  net/sched/act_bpf.c          |  2 +-
>  net/sched/cls_bpf.c          |  2 +-
>  20 files changed, 52 insertions(+), 34 deletions(-)

...

> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 9e7d46d16032..18e965bd7db9 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -1688,6 +1689,12 @@ void bpf_prog_inc(struct bpf_prog *prog);
>  struct bpf_prog * __must_check bpf_prog_inc_not_zero(struct bpf_prog *prog);
>  void bpf_prog_put(struct bpf_prog *prog);
>
> +static inline u32 bpf_prog_get_id(const struct bpf_prog *prog)
> +{
> +       if (WARN(!prog->valid_id, "Attempting to use an invalid eBPF program"))
> +               return 0;
> +       return prog->aux->__id;
> +}
>  void bpf_prog_free_id(struct bpf_prog *prog, bool do_idr_lock);
>  void bpf_map_free_id(struct bpf_map *map, bool do_idr_lock);

The bpf_prog_get_id() either needs to be moved outside the `#ifdef
CONFIG_BPF_SYSCALL` block, or a dummy function needs to be added when
CONFIG_BPF_SYSCALL is undefined.  I can fix that up easily enough, but
given the time of year I'll wait a bit to see if there are any other
comments before posting another revision.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

