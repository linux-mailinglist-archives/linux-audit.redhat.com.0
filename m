Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 911F5655E2B
	for <lists+linux-audit@lfdr.de>; Sun, 25 Dec 2022 20:14:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671995672;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v6yvcvrrX34tYQn+Elc8K7sKQ0wTtn1hirJhdxIG6g4=;
	b=GgDrHrqI4Ji3uFMKSwH86zoBLiUbCOJiV6xwGZ3HSr8AsqV28r9lWDPBCAWmKReoSW8tAo
	j5zSQHra32l/5QYJSyC4wYDqoS8j6LasSN+d0JpFEhzO3UTfRRM/HZngLkkvWLclOqDVtL
	xVSHN/64B5/L2rtxK9ertxzlJfKl+ZU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-TIWqHlLKN1my0no1Rfngiw-1; Sun, 25 Dec 2022 14:14:30 -0500
X-MC-Unique: TIWqHlLKN1my0no1Rfngiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91B2B29AB3EB;
	Sun, 25 Dec 2022 19:14:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C08114152F6;
	Sun, 25 Dec 2022 19:14:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2175C1946597;
	Sun, 25 Dec 2022 19:14:13 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2B2D21946586 for <linux-audit@listman.corp.redhat.com>;
 Sun, 25 Dec 2022 19:14:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D28A12026D68; Sun, 25 Dec 2022 19:14:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB2922026D4B
 for <linux-audit@redhat.com>; Sun, 25 Dec 2022 19:14:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB25B101A521
 for <linux-audit@redhat.com>; Sun, 25 Dec 2022 19:14:11 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-537-SVVNgBScOlS0pacgI81x4w-1; Sun, 25 Dec 2022 14:14:09 -0500
X-MC-Unique: SVVNgBScOlS0pacgI81x4w-1
Received: by mail-qv1-f41.google.com with SMTP id d13so6429180qvj.8
 for <linux-audit@redhat.com>; Sun, 25 Dec 2022 11:14:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:subject:user-agent
 :references:in-reply-to:message-id:date:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L9k4ddpmPgxClO2/idn9r0y8xUw2nToQbpPtNTZGn7o=;
 b=XCE5bEnzZguFv5qTaBHpNIacFTYQXTxAXvLKOiOelUVDm6F4S2PaimrzTTFo2xUlmL
 pAC75N5HCQs6tEPW/jafjeeBlrpDDykS75qWC2o0O2sAehzHVx1ooS1l1zk20jboKZK9
 kfxSwSLcQqFffWpqGeu9PRGHNvsXGseAz3g2ccJeWDIT8NZXArv5H0QArseRWxkOtMo5
 q46AZgz3tOzDD3oMkMdeJtBc5/OrBfzlH2vncFrLJAuDeuwl2vIa5BvLL1msA6TWv/I0
 lKIacy7RHMk+ESr42vdWERQTISJOxDnFmIQU5zIoLaUsrnjIRpp2/8/BHt4hViF0IK3q
 ReRQ==
X-Gm-Message-State: AFqh2krofBg0+0RL6GKrWFlS3K/dWPFV/17mM3sa8Yd1zSL0ETXeMM1E
 NDWtCYzyTIsOqJ13IhjyJKnN
X-Google-Smtp-Source: AMrXdXvkgJcevqx0yEBp/OXwofy0Rj3yDKjefHgBfl6xVW0EqX7iDT+jkS0A6I+mPjKThlUW55g3og==
X-Received: by 2002:a05:6214:418e:b0:515:5e33:5059 with SMTP id
 ld14-20020a056214418e00b005155e335059mr21909271qvb.26.1671995649068; 
 Sun, 25 Dec 2022 11:14:09 -0800 (PST)
Received: from [10.104.7.245] (mobile-107-107-57-41.mycingular.net.
 [107.107.57.41]) by smtp.gmail.com with ESMTPSA id
 x14-20020a05620a258e00b006fcb2d3f284sm6468823qko.67.2022.12.25.11.14.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 25 Dec 2022 11:14:07 -0800 (PST)
From: Paul Moore <paul@paul-moore.com>
To: Jiri Olsa <olsajiri@gmail.com>
Date: Sun, 25 Dec 2022 14:14:06 -0500
Message-ID: <1854ab4e030.28e3.85c95baa4474aabc7814e68940a78392@paul-moore.com>
In-Reply-To: <Y6hakaFw+Oph7xmB@krava>
References: <20221223185531.222689-1-paul@paul-moore.com>
 <Y6hakaFw+Oph7xmB@krava>
User-Agent: AquaMail/1.41.0 (build: 104100234)
Subject: Re: [PATCH v2] bpf: restore the ebpf program ID for BPF_AUDIT_UNLOAD
 and PERF_BPF_EVENT_PROG_UNLOAD
MIME-Version: 1.0
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
 Burn Alting <burn.alting@iinet.net.au>, Alexei Starovoitov <ast@kernel.org>,
 Stanislav Fomichev <sdf@google.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Apologies for the top post, but as I mentioned in my last message in this 
thread, next week I'll post a version without the getter/checks so this 
should not be an issue.

--
paul-moore.com

On December 25, 2022 9:13:40 AM Jiri Olsa <olsajiri@gmail.com> wrote:

> On Fri, Dec 23, 2022 at 01:55:31PM -0500, Paul Moore wrote:
>
> SNIP
>
>> diff --git a/drivers/net/netdevsim/bpf.c b/drivers/net/netdevsim/bpf.c
>> index 50854265864d..2795f03f5f34 100644
>> --- a/drivers/net/netdevsim/bpf.c
>> +++ b/drivers/net/netdevsim/bpf.c
>> @@ -109,7 +109,7 @@ nsim_bpf_offload(struct netdevsim *ns, struct bpf_prog 
>> *prog, bool oldprog)
>> "bad offload state, expected offload %sto be active",
>> oldprog ? "" : "not ");
>> ns->bpf_offloaded = prog;
>> - ns->bpf_offloaded_id = prog ? prog->aux->id : 0;
>> + ns->bpf_offloaded_id = prog ? bpf_prog_get_id(prog) : 0;
>> nsim_prog_set_loaded(prog, true);
>>
>> return 0;
>> @@ -221,6 +221,7 @@ static int nsim_bpf_create_prog(struct nsim_dev *nsim_dev,
>> struct nsim_bpf_bound_prog *state;
>> char name[16];
>> int ret;
>> + u32 id;
>>
>> state = kzalloc(sizeof(*state), GFP_KERNEL);
>> if (!state)
>> @@ -239,7 +240,8 @@ static int nsim_bpf_create_prog(struct nsim_dev *nsim_dev,
>> return ret;
>> }
>>
>> - debugfs_create_u32("id", 0400, state->ddir, &prog->aux->id);
>> + id = bpf_prog_get_id(prog);
>> + debugfs_create_u32("id", 0400, state->ddir, &id);
>> debugfs_create_file("state", 0400, state->ddir,
>> &state->state, &nsim_bpf_string_fops);
>> debugfs_create_bool("loaded", 0400, state->ddir, &state->is_loaded);
>> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
>> index 9e7d46d16032..18e965bd7db9 100644
>> --- a/include/linux/bpf.h
>> +++ b/include/linux/bpf.h
>> @@ -1102,7 +1102,7 @@ struct bpf_prog_aux {
>> u32 max_pkt_offset;
>> u32 max_tp_access;
>> u32 stack_depth;
>> - u32 id;
>> + u32 __id; /* access via bpf_prog_get_id() to check bpf_prog::valid_id */
>
> it breaks bpftool that uses
>
>  BPF_CORE_READ((struct bpf_prog *)ent, aux, id);
>
> and bpffs selftest because of preload iter object uses aux->id
>
>  kernel/bpf/preload/iterators/iterators.bpf.c
>
> it'd be great to have a solution that keep 'id' field,
> because it's probably used in many bpf programs already
>
> jirka
>
>> u32 func_cnt; /* used by non-func prog as the number of func progs */
>> u32 func_idx; /* 0 for non-func prog, the index in func array for func prog */
>> u32 attach_btf_id; /* in-kernel BTF type id to attach to */
>> @@ -1197,7 +1197,8 @@ struct bpf_prog {
>> enforce_expected_attach_type:1, /* Enforce expected_attach_type checking at 
>> attach time */
>> call_get_stack:1, /* Do we call bpf_get_stack() or bpf_get_stackid() */
>> call_get_func_ip:1, /* Do we call get_func_ip() */
>> - tstamp_type_access:1; /* Accessed __sk_buff->tstamp_type */
>> + tstamp_type_access:1, /* Accessed __sk_buff->tstamp_type */
>> + valid_id:1; /* Is bpf_prog::aux::__id valid? */
>> enum bpf_prog_type type; /* Type of BPF program */
>> enum bpf_attach_type expected_attach_type; /* For some prog types */
>> u32 len; /* Number of filter blocks */
>> @@ -1688,6 +1689,12 @@ void bpf_prog_inc(struct bpf_prog *prog);
>> struct bpf_prog * __must_check bpf_prog_inc_not_zero(struct bpf_prog *prog);
>> void bpf_prog_put(struct bpf_prog *prog);
>
> SNIP



--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

