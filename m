Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DACD5EEA1B
	for <lists+linux-audit@lfdr.de>; Thu, 29 Sep 2022 01:28:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664407698;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DmKQsSGvP08IHGSSmNsuEn+JiSI9bsBLyyKOmwTsVDI=;
	b=XuUEDqrEVmPeHbEqDsqTYr8LFWhLCIXAryXenVa2dgfdPGfggVY9y29RZ1RMbJ0IFYQMYz
	UmITMcNwOiCaGLei2zkylOquJ7YdeqCpO2U36PX1JrvRTioGyqeCUDDZM7FAMFMWqtWGTr
	y4y3Ga7cU7vhNW4A401TOXFQOKSKwd8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-lnzDP3lXNk-UhzIZCpJoKA-1; Wed, 28 Sep 2022 19:28:17 -0400
X-MC-Unique: lnzDP3lXNk-UhzIZCpJoKA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61BA3185A794;
	Wed, 28 Sep 2022 23:28:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6791A49BB6A;
	Wed, 28 Sep 2022 23:28:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 87A191946A4C;
	Wed, 28 Sep 2022 23:28:13 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3097C194658F for <linux-audit@listman.corp.redhat.com>;
 Wed, 28 Sep 2022 22:55:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C8E8A2027062; Wed, 28 Sep 2022 22:55:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C18AA2027061
 for <linux-audit@redhat.com>; Wed, 28 Sep 2022 22:55:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A30908027FE
 for <linux-audit@redhat.com>; Wed, 28 Sep 2022 22:55:01 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-TiQZiHKxOeu1HCzh9XV8rQ-1; Wed, 28 Sep 2022 18:55:00 -0400
X-MC-Unique: TiQZiHKxOeu1HCzh9XV8rQ-1
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-131c8ccae75so351869fac.3
 for <linux-audit@redhat.com>; Wed, 28 Sep 2022 15:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=PvzZb/nWICcprKW+/UE1OuAMGD5iEigV3jBljtssS0c=;
 b=A0ZxZLOdAPYMu0YKzohb/LOmoReQDNcaONfi7S5Fpg1Xy3SDKS9GwywbgK+PA8REqF
 2aW09NVa0tyKbTwA67EEJuLELsLlOUU6EeIO50LBwqdmYF27R9Iv7Q40przeaYw7ySbZ
 8zJLOxHPNixR5f8IoYOyR/KgbfxJr31yBuNelPig3GHo1ncAW7yp77url0Z31ziVaQdx
 TXceDb6cye5fFbE7e3w1FvygYYpgVSBEEk+FM/qgYtTrRdC0Dh+8u3mglHTK4ZS6hIeo
 m/Zy4ctT7HbO7nRD0FoowGsU4lqmXVn6SxA++FNacTMaCvE/2ERpK8evSwNf+mpRhO3G
 IB9A==
X-Gm-Message-State: ACrzQf09nOrPJKTwW9+/3ArBV1VBAGb2xjtpXcSZgLVRER0JDpced/GF
 8t8/9qCCBXCrXrJrv0wVGkc0obDGjZ1TwcTKumvf
X-Google-Smtp-Source: AMsMyM4V8lNNjhhv2Ja8yyosbeUoQGfr097xBpeF5j/+xhdyk78uzlBFaTu2zmyDLPzbetRzXIHn0IArFGKEM004+cY=
X-Received: by 2002:a05:6870:a916:b0:131:9361:116a with SMTP id
 eq22-20020a056870a91600b001319361116amr114330oab.172.1664405699174; Wed, 28
 Sep 2022 15:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220927225944.2254360-1-ankur.a.arora@oracle.com>
 <20220927225944.2254360-4-ankur.a.arora@oracle.com>
In-Reply-To: <20220927225944.2254360-4-ankur.a.arora@oracle.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 28 Sep 2022 18:54:48 -0400
Message-ID: <CAHC9VhSY+ELJ_yX+U+ZzAPOtjJ=eGxtmLTtgpm6NhkYE3Yffuw@mail.gmail.com>
Subject: Re: [PATCH 3/3] audit: unify audit_filter_{uring(), inode_name(),
 syscall()}
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 27, 2022 at 7:00 PM Ankur Arora <ankur.a.arora@oracle.com> wrote:
>
> audit_filter_uring(), audit_filter_inode_name() are substantially similar
> to audit_filter_syscall(). Move the core logic to __audit_filter() which
> can be parametrized for all three.
>
> On a Skylakex system, getpid() latency (all results aggregated
> across 12 boot cycles):
>
>          Min     Mean    Median   Max      pstdev
>          (ns)    (ns)    (ns)     (ns)
>
>  -    173.11   182.51  179.65  202.09     (+- 4.34%)
>  +    162.11   175.26  173.71  190.56     (+- 4.33%)
>
> Performance counter stats for 'bin/getpid' (3 runs) go from:
>     cycles               706.13  (  +-  4.13% )
>     instructions        1654.70  (  +-   .06% )
>     IPC                    2.35  (  +-  4.25% )
>     branches             430.99  (  +-   .06% )
>     branch-misses          0.50  (  +-  2.00% )
>     L1-dcache-loads      440.02  (  +-   .07% )
>     L1-dcache-load-misses  5.22  (  +- 82.75% )
>
>  to:
>     cycles               678.79  (  +-  4.22% )
>     instructions        1657.79  (  +-   .05% )
>     IPC                    2.45  (  +-  4.08% )
>     branches             432.00  (  +-   .05% )
>     branch-misses          0.38  (  +- 23.68% )
>     L1-dcache-loads      444.96  (  +-   .03% )
>     L1-dcache-load-misses  5.13  (  +- 73.09% )
>
> (Both aggregated over 12 boot cycles.)
>
> Unclear if the improvement is just run-to-run variation or because of
> a slightly denser loop (the list parameter in the list_for_each_entry_rcu()
> exit check now comes from a register rather than a constant as before.)
>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> ---
>  kernel/auditsc.c | 86 +++++++++++++++++++++++++-----------------------
>  1 file changed, 44 insertions(+), 42 deletions(-)
>
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index bf26f47b5226..dd89a52988b0 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -805,6 +805,41 @@ static bool audit_in_mask(const struct audit_krule *rule, unsigned long val)
>         return rule->mask[word] & bit;
>  }
>
> +/**
> + * __audit_filter - common filter
> + *

Please remove the vertical whitespace between the function description
line and the parameter descriptions.

I'd also suggest renaming this function to "__audit_filter_op(...)"
since we have a few audit filtering functions and a generic
"__audit_filter()" function with no qualification in the name seems
just a bit too generic to not be misleading ... at least I think so.

I also might try to be just a bit more descriptive in the text above,
for example:

"__audit_filter_op - filter helper function for operations (syscall/uring/etc.)"

> + * @tsk: associated task
> + * @ctx: audit context
> + * @list: audit filter list
> + * @op: current syscall/uring_op
> + * @name: name to be filtered (used by audit_filter_inode_name)

I would change this to "@name: audit_name to use in filtering (can be
NULL)" and leave it at that.

> + *
> + * return: 1 if we hit a filter, 0 if we don't

The function header block comment description should be in regular
English sentences.  Perhaps something like this:

"Run the audit filters specified in @list against @tsk using @ctx,
@op, and @name as necessary; the caller is responsible for ensuring
that the call is made while the RCU read lock is held.  The @name
parameter can be NULL, but all others must be specified.  Returns
1/true if the filter finds a match, 0/false if none are found."

> + */
> +static int __audit_filter(struct task_struct *tsk,
> +                          struct audit_context *ctx,
> +                          struct list_head *list,
> +                          unsigned long op,
> +                          struct audit_names *name)
> +{
> +       struct audit_entry *e;
> +       enum audit_state state;
> +
> +       rcu_read_lock();

I would move the RCU locking to the callers since not every caller requires it.

> +       list_for_each_entry_rcu(e, list, list) {
> +               if (unlikely(audit_in_mask(&e->rule, op))) {

As discussed in patch 2/3, please remove the unlikely() call.

> +                       if (audit_filter_rules(tsk, &e->rule, ctx, name,
> +                                              &state, false)) {
> +                               rcu_read_unlock();
> +                               ctx->current_state = state;
> +                               return 1;
>  +                       }
> +               }
> +       }
> +       rcu_read_unlock();
> +       return 0;
> +}
> +

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

