Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FD765861E
	for <lists+linux-audit@lfdr.de>; Wed, 28 Dec 2022 19:56:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672253786;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xM9nJr/VJdmV9CuyitPxlG/EQo8RVQ8Ci/GSnCpHlrc=;
	b=Qm+RC+oeLM7tw8jeYh8b5cvDPK0NdmPb5UGeAIFbDeo96+dY/b1DYcLmPbfVwZJqBcSsXU
	UNEqvdC/Ibq21PIsCLvtSvghkXjVUhLXsamHXIFUlQOf+nKL1ZDMkYLzJdD8PyzYw55bDf
	h7aZFXDUqIymI/zx3XOz7oamkyKjVoA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-i0ynYtdwOUOpGuZcgAVuLQ-1; Wed, 28 Dec 2022 13:56:24 -0500
X-MC-Unique: i0ynYtdwOUOpGuZcgAVuLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23B3080D182;
	Wed, 28 Dec 2022 18:56:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 05F4D2166B26;
	Wed, 28 Dec 2022 18:56:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8C5A81946595;
	Wed, 28 Dec 2022 18:56:21 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9432A1946586 for <linux-audit@listman.corp.redhat.com>;
 Sun, 25 Dec 2022 14:13:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 36A1951EF; Sun, 25 Dec 2022 14:13:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EC3053AA
 for <linux-audit@redhat.com>; Sun, 25 Dec 2022 14:13:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F9F02999B33
 for <linux-audit@redhat.com>; Sun, 25 Dec 2022 14:13:43 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-544-p6xG517_PmqyYrXGZ7pt9w-1; Sun, 25 Dec 2022 09:13:41 -0500
X-MC-Unique: p6xG517_PmqyYrXGZ7pt9w-1
Received: by mail-ed1-f45.google.com with SMTP id q15so11360303edb.1
 for <linux-audit@redhat.com>; Sun, 25 Dec 2022 06:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f2rSsx9VFe4aYwI1HrN2O4MeeohSAZRYLVM211quD+k=;
 b=m7v/a8Gz32lfp4Ainf6EAouiLRZEw0QVyUieHvO0pzeVwGXOPNxOrH8wvwi1RFzO9N
 2Hj6VRsHYvTQvc1VqtoCgFsfi03PnH44f6ggd/3xdo5BNV0Nk0dLgkn9B4SRIQ5AEKTK
 izNX2lxO5BPZLFYGlKbB8Rwy1qltCdEWpkL8PLcPHq3LIbb+7NIqSrCB1mYOU1Q/e1Br
 7vmicZRerRxxK26+Sb0QkqgvWoFS7wVlbMgaMyaJ/+JrkMipqsmTG6l0IDQdIQsY21r/
 SzwMB0WpzCC3fYWiTbAfCZpsiTEyplnKmkQTZGFuMp/DS3VNl7d0BhGCCxqWT89hOP1S
 zDrg==
X-Gm-Message-State: AFqh2kqpKuoyYvTdEOzFoFgcmrOl57C9oDNtPuC01Cz8uv8n0clL3ZYj
 pTYrrBYcN1wnNhfN+/Flrr0=
X-Google-Smtp-Source: AMrXdXt3RMxcNS3pAtWFoX1Hfvg1EYirI0RMJtNA14w9hrpkKJe7L41qzkHWTkJ1c6vYW9JISi1aMQ==
X-Received: by 2002:a05:6402:1218:b0:475:32d2:74a6 with SMTP id
 c24-20020a056402121800b0047532d274a6mr17385247edw.11.1671977619786; 
 Sun, 25 Dec 2022 06:13:39 -0800 (PST)
Received: from krava ([83.240.62.89]) by smtp.gmail.com with ESMTPSA id
 w15-20020a056402070f00b004704658abebsm3637288edx.54.2022.12.25.06.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Dec 2022 06:13:39 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Sun, 25 Dec 2022 15:13:37 +0100
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v2] bpf: restore the ebpf program ID for BPF_AUDIT_UNLOAD
 and PERF_BPF_EVENT_PROG_UNLOAD
Message-ID: <Y6hakaFw+Oph7xmB@krava>
References: <20221223185531.222689-1-paul@paul-moore.com>
MIME-Version: 1.0
In-Reply-To: <20221223185531.222689-1-paul@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Wed, 28 Dec 2022 18:55:06 +0000
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
 Burn Alting <burn.alting@iinet.net.au>, Alexei Starovoitov <ast@kernel.org>,
 Stanislav Fomichev <sdf@google.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 23, 2022 at 01:55:31PM -0500, Paul Moore wrote:

SNIP

> diff --git a/drivers/net/netdevsim/bpf.c b/drivers/net/netdevsim/bpf.c
> index 50854265864d..2795f03f5f34 100644
> --- a/drivers/net/netdevsim/bpf.c
> +++ b/drivers/net/netdevsim/bpf.c
> @@ -109,7 +109,7 @@ nsim_bpf_offload(struct netdevsim *ns, struct bpf_prog *prog, bool oldprog)
>  	     "bad offload state, expected offload %sto be active",
>  	     oldprog ? "" : "not ");
>  	ns->bpf_offloaded = prog;
> -	ns->bpf_offloaded_id = prog ? prog->aux->id : 0;
> +	ns->bpf_offloaded_id = prog ? bpf_prog_get_id(prog) : 0;
>  	nsim_prog_set_loaded(prog, true);
>  
>  	return 0;
> @@ -221,6 +221,7 @@ static int nsim_bpf_create_prog(struct nsim_dev *nsim_dev,
>  	struct nsim_bpf_bound_prog *state;
>  	char name[16];
>  	int ret;
> +	u32 id;
>  
>  	state = kzalloc(sizeof(*state), GFP_KERNEL);
>  	if (!state)
> @@ -239,7 +240,8 @@ static int nsim_bpf_create_prog(struct nsim_dev *nsim_dev,
>  		return ret;
>  	}
>  
> -	debugfs_create_u32("id", 0400, state->ddir, &prog->aux->id);
> +	id = bpf_prog_get_id(prog);
> +	debugfs_create_u32("id", 0400, state->ddir, &id);
>  	debugfs_create_file("state", 0400, state->ddir,
>  			    &state->state, &nsim_bpf_string_fops);
>  	debugfs_create_bool("loaded", 0400, state->ddir, &state->is_loaded);
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 9e7d46d16032..18e965bd7db9 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -1102,7 +1102,7 @@ struct bpf_prog_aux {
>  	u32 max_pkt_offset;
>  	u32 max_tp_access;
>  	u32 stack_depth;
> -	u32 id;
> +	u32 __id; /* access via bpf_prog_get_id() to check bpf_prog::valid_id */

it breaks bpftool that uses

  BPF_CORE_READ((struct bpf_prog *)ent, aux, id);

and bpffs selftest because of preload iter object uses aux->id

  kernel/bpf/preload/iterators/iterators.bpf.c

it'd be great to have a solution that keep 'id' field,
because it's probably used in many bpf programs already

jirka

>  	u32 func_cnt; /* used by non-func prog as the number of func progs */
>  	u32 func_idx; /* 0 for non-func prog, the index in func array for func prog */
>  	u32 attach_btf_id; /* in-kernel BTF type id to attach to */
> @@ -1197,7 +1197,8 @@ struct bpf_prog {
>  				enforce_expected_attach_type:1, /* Enforce expected_attach_type checking at attach time */
>  				call_get_stack:1, /* Do we call bpf_get_stack() or bpf_get_stackid() */
>  				call_get_func_ip:1, /* Do we call get_func_ip() */
> -				tstamp_type_access:1; /* Accessed __sk_buff->tstamp_type */
> +				tstamp_type_access:1, /* Accessed __sk_buff->tstamp_type */
> +				valid_id:1; /* Is bpf_prog::aux::__id valid? */
>  	enum bpf_prog_type	type;		/* Type of BPF program */
>  	enum bpf_attach_type	expected_attach_type; /* For some prog types */
>  	u32			len;		/* Number of filter blocks */
> @@ -1688,6 +1689,12 @@ void bpf_prog_inc(struct bpf_prog *prog);
>  struct bpf_prog * __must_check bpf_prog_inc_not_zero(struct bpf_prog *prog);
>  void bpf_prog_put(struct bpf_prog *prog);
>  

SNIP

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

