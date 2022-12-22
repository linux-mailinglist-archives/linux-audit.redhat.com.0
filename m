Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FA46545A0
	for <lists+linux-audit@lfdr.de>; Thu, 22 Dec 2022 18:33:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671730397;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xTT05rKtG2DXqM0NK2KXAMBOhrn1Zgn8ry86o4wRMWw=;
	b=GxXXWGwm6PJO+8TnZrFC8xx95MhaYZfwxy3rw3wnBOJnDUI1QZ7xuAgWgRKyeaPsXRyOX6
	WTeKrjPvHx1Cc5ywk96iPO7cyIlYPw86TI3DKj3qx0kDbKdcIkghh3ZeqU4EbPJgK9TDjc
	Dt23HlYO3FzKqIr713eb66ncb6AW8Lk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-eNWvxvgYNqut8S-Cb2lIBg-1; Thu, 22 Dec 2022 12:33:15 -0500
X-MC-Unique: eNWvxvgYNqut8S-Cb2lIBg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 563A829A9CA2;
	Thu, 22 Dec 2022 17:33:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1468153A0;
	Thu, 22 Dec 2022 17:33:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2DD961946A40;
	Thu, 22 Dec 2022 17:33:02 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 79B5219465B1 for <linux-audit@listman.corp.redhat.com>;
 Thu, 22 Dec 2022 17:19:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 985F84014D1A; Thu, 22 Dec 2022 17:19:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90C3140C1074
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 17:19:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70F0F1C0CE6F
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 17:19:10 +0000 (UTC)
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
 [209.85.210.201]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-217-gbafTdn-NgaQe1JIiPtoIw-1; Thu, 22 Dec 2022 12:19:08 -0500
X-MC-Unique: gbafTdn-NgaQe1JIiPtoIw-1
Received: by mail-pf1-f201.google.com with SMTP id
 b74-20020a621b4d000000b00580445d6016so1357978pfb.12
 for <linux-audit@redhat.com>; Thu, 22 Dec 2022 09:19:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F4P1A8IAdM/xSEcFoYOHP7+4yEj12+FEHj47Dkqw18A=;
 b=rPM5aLM4d6DaBOZ0TN8OTbh4MTbf3mB+5EUzw2Z1e/DIHAeKoXasaoXsAqmnG7e9s5
 3JRNjfpZlf4EO6W2C4h2qNeAvufABYzTLd+3rVKg/upm8rQfXYfKvBb6Xd8emSTlmENG
 j5j6Jn7JA4apxSd2LbJ9ON7qh3mn6Q1qXHjixpjt6mBjnTb3R/F4e7klruGbxe3/m2Y7
 ZJXecI7dozqYEGErq9OXV9cUAtN2snUIC1dkVoNP+aTFIT39Bpr9xOh+XY1vApzyMAHv
 DO1VXlmkknX0fRbqRrsNeZw4g23lVLBkprzhhrDBiEP4oZvy8BpnIV51iZaIDM8v8NtF
 46gQ==
X-Gm-Message-State: AFqh2krSyWlfHBsaKdAxmB8iyrUbf5Z9nFRbeKjWvmQo1/Eo7/+jwyiE
 3KqHttKO2AjE4IDInwTgE5IYO/4=
X-Google-Smtp-Source: AMrXdXu8HZZVypFbjYqi3wo3Gmth+jgl6lvCxXE5SVqSuyjX+p2HmuzizxvpXx5efPcSBpIbSPy2HlA=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a17:902:e48a:b0:186:c3b2:56d1 with SMTP id
 i10-20020a170902e48a00b00186c3b256d1mr374559ple.15.1671729547483; Thu, 22 Dec
 2022 09:19:07 -0800 (PST)
Date: Thu, 22 Dec 2022 09:19:06 -0800
In-Reply-To: <20221222001343.489117-1-paul@paul-moore.com>
Mime-Version: 1.0
References: <20221222001343.489117-1-paul@paul-moore.com>
Message-ID: <Y6SRiv+FloijdETe@google.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Thu, 22 Dec 2022 17:33:00 +0000
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

On 12/21, Paul Moore wrote:
> When changing the ebpf program put() routines to support being called
> from within IRQ context the program ID was reset to zero prior to
> generating the audit UNLOAD record, which obviously rendered the ID
> field bogus (always zero).  This patch resolves this by adding a new
> field, bpf_prog_aux::id_audit, which is set when the ebpf program is
> allocated an ID and never reset, ensuring a valid ID field,
> regardless of the state of the original ID field, bpf_prox_aud::id.

> I also modified the bpf_audit_prog() logic used to associate the
> AUDIT_BPF record with other associated records, e.g. @ctx != NULL.
> Instead of keying off the operation, it now keys off the execution
> context, e.g. '!in_irg && !irqs_disabled()', which is much more
> appropriate and should help better connect the UNLOAD operations with
> the associated audit state (other audit records).

[..]

> As an note to future bug hunters, I did briefly consider removing the
> ID reset in bpf_prog_free_id(), as it would seem that once the
> program is removed from the idr pool it can no longer be found by its
> ID value, but commit ad8ad79f4f60 ("bpf: offload: free program id
> when device disappears") seems to imply that it is beneficial to
> reset the ID value.  Perhaps as a secondary indicator that the ebpf
> program is unbound/orphaned.

That seems like the way to go imho. Can we have some extra 'invalid_id'
bitfield in the bpf_prog so we can set it in bpf_prog_free_id and
check in bpf_prog_free_id (for this offloaded use-case)? Because
having two ids and then keeping track about which one to use, depending
on the context, seems more fragile?

> Fixes: d809e134be7a ("bpf: Prepare bpf_prog_put() to be called from irq  
> context.")
> Reported-by: Burn Alting <burn.alting@iinet.net.au>
> Signed-off-by: Paul Moore <paul@paul-moore.com>
> ---
>   include/linux/bpf.h  | 1 +
>   kernel/bpf/syscall.c | 8 +++++---
>   2 files changed, 6 insertions(+), 3 deletions(-)

> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 9e7d46d16032..a22001ceb2c3 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -1103,6 +1103,7 @@ struct bpf_prog_aux {
>   	u32 max_tp_access;
>   	u32 stack_depth;
>   	u32 id;
> +	u32 id_audit; /* preserves the id for use by audit */
>   	u32 func_cnt; /* used by non-func prog as the number of func progs */
>   	u32 func_idx; /* 0 for non-func prog, the index in func array for func  
> prog */
>   	u32 attach_btf_id; /* in-kernel BTF type id to attach to */
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 7b373a5e861f..3ec09f4dba18 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -1958,13 +1958,13 @@ static void bpf_audit_prog(const struct bpf_prog  
> *prog, unsigned int op)
>   		return;
>   	if (audit_enabled == AUDIT_OFF)
>   		return;
> -	if (op == BPF_AUDIT_LOAD)
> +	if (!in_irq() && !irqs_disabled())
>   		ctx = audit_context();
>   	ab = audit_log_start(ctx, GFP_ATOMIC, AUDIT_BPF);
>   	if (unlikely(!ab))
>   		return;
>   	audit_log_format(ab, "prog-id=%u op=%s",
> -			 prog->aux->id, bpf_audit_str[op]);
> +			 prog->aux->id_audit, bpf_audit_str[op]);
>   	audit_log_end(ab);
>   }

> @@ -1975,8 +1975,10 @@ static int bpf_prog_alloc_id(struct bpf_prog *prog)
>   	idr_preload(GFP_KERNEL);
>   	spin_lock_bh(&prog_idr_lock);
>   	id = idr_alloc_cyclic(&prog_idr, prog, 1, INT_MAX, GFP_ATOMIC);
> -	if (id > 0)
> +	if (id > 0) {
>   		prog->aux->id = id;
> +		prog->aux->id_audit = id;
> +	}
>   	spin_unlock_bh(&prog_idr_lock);
>   	idr_preload_end();

> --
> 2.39.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

