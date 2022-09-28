Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7053D5EE9BA
	for <lists+linux-audit@lfdr.de>; Thu, 29 Sep 2022 00:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664405454;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6eIORnLladG62gck6MZXCprKVj7LR8fLSGI6JQmqHx0=;
	b=UZF8rU8COQvYPp18xceHafIdpyFpNHPGTp5q1VzF9icWDeWjdNKeIHyFrS6p6bC1Wvnek5
	IkeOVMkwfzO3chZTMtS9YBmkV2iQYyTINPTJRUTOGmHzaPqONql2wgHxPw5AbHYE3xn5PX
	3/MPP5Bp00QJiyEF8Kdx05z2Csro0T0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-0JIMQaP1OCuFLlk9uV0V_A-1; Wed, 28 Sep 2022 18:50:51 -0400
X-MC-Unique: 0JIMQaP1OCuFLlk9uV0V_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C6D4381A724;
	Wed, 28 Sep 2022 22:50:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7521F2027061;
	Wed, 28 Sep 2022 22:50:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DDED21946A4E;
	Wed, 28 Sep 2022 22:50:45 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DB1DE194658F for <linux-audit@listman.corp.redhat.com>;
 Wed, 28 Sep 2022 22:27:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9C6042027063; Wed, 28 Sep 2022 22:27:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94AB22027061
 for <linux-audit@redhat.com>; Wed, 28 Sep 2022 22:27:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 758E829AA3B4
 for <linux-audit@redhat.com>; Wed, 28 Sep 2022 22:27:01 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-85-YJdsE39DO5Oeua6TidyaBQ-1; Wed, 28 Sep 2022 18:26:59 -0400
X-MC-Unique: YJdsE39DO5Oeua6TidyaBQ-1
Received: by mail-ot1-f43.google.com with SMTP id
 e24-20020a05683013d800b0065be336b8feso9071901otq.8
 for <linux-audit@redhat.com>; Wed, 28 Sep 2022 15:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xaZJP7weXVSlht4vpUznwn4iF5uD2DMip9O5AR8FVBE=;
 b=xhWZsXUykYBnI7NAH87zwQO9ePYEUaHSJhVLwILYFv3bb7iPI+hVuNC/hr4sYwsPNd
 zzwzvUuZUtaQMwVX8yIqeB7zXUu5zAsdx4yq8+1p1DE2Xe94maZrQMoh/a+EEy/PqswV
 W0YZSACe6jY90GEdEYphhMwwN+V/YXsGoI7DLNyFG5M2jP6EN4rbjw3h445Q2Km5pFgC
 3FN0VMnSvN3ptJ4d3xhmRjL0pylb3aJckFzroway2v0HsIXkCErqr8vp2bgE05CuFgSm
 46a9RmwG2WchY9yD5KfD2CaPphIROwD5G7xUXF05js6Gmz4B/Q0XBfeHARsDRn/14rxB
 u+pg==
X-Gm-Message-State: ACrzQf33nKZNy69kmYi0O0BfR/yN8GGRSIwmwrc0lF8oA5jr+fqIo9ju
 pdn2Zc0P/oK5BN35LdQyeSKNh+EhCxy1CardyTz7lKaXYQ==
X-Google-Smtp-Source: AMsMyM4KE36RDim/kqbdXE95Iq/XtjEefUdiaERF0BlzKs6V6J6lw+wCFYBC7mpFi0DwVUGXHIAKg0DVeeznFUREvFY=
X-Received: by 2002:a9d:1b70:0:b0:658:cfeb:d221 with SMTP id
 l103-20020a9d1b70000000b00658cfebd221mr29313otl.34.1664404018771; Wed, 28 Sep
 2022 15:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220927225944.2254360-1-ankur.a.arora@oracle.com>
 <20220927225944.2254360-3-ankur.a.arora@oracle.com>
In-Reply-To: <20220927225944.2254360-3-ankur.a.arora@oracle.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 28 Sep 2022 18:26:47 -0400
Message-ID: <CAHC9VhRBuBiuf6917fpP7n+Sy5fFTpzzEqRXfMGPCbnNU4jswg@mail.gmail.com>
Subject: Re: [PATCH 2/3] audit: annotate branch direction for audit_in_mask()
To: Ankur Arora <ankur.a.arora@oracle.com>
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
Cc: boris.ostrovsky@oracle.com, linux-audit@redhat.com,
 linux-kernel@vger.kernel.org, eparis@redhat.com, konrad.wilk@oracle.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 27, 2022 at 7:00 PM Ankur Arora <ankur.a.arora@oracle.com> wrote:
>
> With sane audit rules, audit logging would only be triggered
> infrequently. Keeping this in mind, annotate audit_in_mask() as
> unlikely() to allow the compiler to pessimize the call to
> audit_filter_rules().
>
> This allows GCC to invert the branch direction for the audit_filter_rules()
> basic block in this loop:
>
>         list_for_each_entry_rcu(e, &audit_filter_list[AUDIT_FILTER_EXIT], list) {
>                 if (audit_in_mask(&e->rule, major) &&
>                     audit_filter_rules(tsk, &e->rule, ctx, NULL,
>                                        &state, false)) {
>                         ...
>
> such that it executes the common case in a straight line fashion.
>
> On a Skylakex system change in getpid() latency (all results
> aggregated across 12 boot cycles):
>
>          Min     Mean    Median   Max      pstdev
>          (ns)    (ns)    (ns)     (ns)
>
>  -    196.63   207.86  206.60  230.98      (+- 3.92%)
>  +    173.11   182.51  179.65  202.09      (+- 4.34%)
>
> Performance counter stats for 'bin/getpid' (3 runs) go from:
>     cycles               805.58  (  +-  4.11% )
>     instructions        1654.11  (  +-   .05% )
>     IPC                    2.06  (  +-  3.39% )
>     branches             430.02  (  +-   .05% )
>     branch-misses          1.55  (  +-  7.09% )
>     L1-dcache-loads      440.01  (  +-   .09% )
>     L1-dcache-load-misses  9.05  (  +- 74.03% )
>
>  to:
>     cycles               706.13  (  +-  4.13% )
>     instructions        1654.70  (  +-   .06% )
>     IPC                    2.35  (  +-  4.25% )
>     branches             430.99  (  +-   .06% )
>     branch-misses          0.50  (  +-  2.00% )
>     L1-dcache-loads      440.02  (  +-   .07% )
>     L1-dcache-load-misses  5.22  (  +- 82.75% )
>
> (Both aggregated over 12 boot cycles.)
>
> cycles: performance improves on average by ~100 cycles/call. IPC
> improves commensurately. Two reasons for this improvement:
>
>   * one fewer branch mispred: no obvious reason for this
>     branch-miss reduction. There is no significant change in
>     basic-block structure (apart from the branch inversion.)
>
>   * the direction of the branch for the call is now inverted, so it
>     chooses the not-taken direction more often. The issue-latency
>     for not-taken branches is often cheaper.
>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> ---
>  kernel/auditsc.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

I generally dislike merging likely()/unlikely() additions to code
paths that can have varying levels of performance depending on runtime
configuration.  While I appreciate the work you are doing to improve
audit performance, I don't think this is something I want to merge,
I'm sorry.

> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 533b087c3c02..bf26f47b5226 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -789,7 +789,7 @@ static enum audit_state audit_filter_task(struct task_struct *tsk, char **key)
>         return AUDIT_STATE_BUILD;
>  }
>
> -static int audit_in_mask(const struct audit_krule *rule, unsigned long val)
> +static bool audit_in_mask(const struct audit_krule *rule, unsigned long val)
>  {
>         int word, bit;
>
> @@ -850,12 +850,13 @@ static void audit_filter_syscall(struct task_struct *tsk,
>
>         rcu_read_lock();
>         list_for_each_entry_rcu(e, &audit_filter_list[AUDIT_FILTER_EXIT], list) {
> -               if (audit_in_mask(&e->rule, major) &&
> -                   audit_filter_rules(tsk, &e->rule, ctx, NULL,
> -                                      &state, false)) {
> -                       rcu_read_unlock();
> -                       ctx->current_state = state;
> -                       return;
> +               if (unlikely(audit_in_mask(&e->rule, major))) {
> +                       if (audit_filter_rules(tsk, &e->rule, ctx, NULL,
> +                                              &state, false)) {
> +                               rcu_read_unlock();
> +                               ctx->current_state = state;
> +                               return;
> +                       }
>                 }
>         }
>         rcu_read_unlock();
> --
> 2.31.1

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

