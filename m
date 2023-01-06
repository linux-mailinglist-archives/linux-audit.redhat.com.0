Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6F466077C
	for <lists+linux-audit@lfdr.de>; Fri,  6 Jan 2023 20:58:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673035119;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=prHC4Xnm9+qkBN+jK8qcowvaQeZcaJNQoMXz2iGDzrA=;
	b=SCyd/EUtz5C/I46qpGW/TT73WKyUmVT+7Jis8waSbqW8Msid64ULmgCkTWGV/5Lht04DfE
	SFh5Lfrsf7zdwPhWBDdWCQBNwXbQ8fdjGrqzWTT1+O7ebRsC1nwvGLUN9nUyteyps36lqF
	ncEDJ/5QRY6+/1K3tCXXDptQzk2Fze0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-e13y8mYCP_ybuP4qlvG9BA-1; Fri, 06 Jan 2023 14:58:38 -0500
X-MC-Unique: e13y8mYCP_ybuP4qlvG9BA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E87518E5345;
	Fri,  6 Jan 2023 19:58:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2456A492B01;
	Fri,  6 Jan 2023 19:58:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ABE1419459C7;
	Fri,  6 Jan 2023 19:58:26 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2DC561946586 for <linux-audit@listman.corp.redhat.com>;
 Fri,  6 Jan 2023 19:45:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 105C8492B01; Fri,  6 Jan 2023 19:45:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0933B492B00
 for <linux-audit@redhat.com>; Fri,  6 Jan 2023 19:45:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDBA5885621
 for <linux-audit@redhat.com>; Fri,  6 Jan 2023 19:45:24 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-211-EjssIiSWMiOMFmenmB8Yzg-1; Fri, 06 Jan 2023 14:45:23 -0500
X-MC-Unique: EjssIiSWMiOMFmenmB8Yzg-1
Received: by mail-pg1-f182.google.com with SMTP id b12so1827098pgj.6
 for <linux-audit@redhat.com>; Fri, 06 Jan 2023 11:45:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CvZXlAdRBFAHyGz96jB9ItzH1/RXpSiQ90ZYvIcBjik=;
 b=MozByaW+wONRZpvAT9IIFbdS8stPhTG2+Wi4gOcHnm3/NRuU33ChQ7/zSFWPrR8ExV
 X6HhWmEKUS73B9EpyrKc7b/clAqeFsGEjlWg1EG0KcR1WuCdB4d8cL//8BsBBuovC+Ct
 5K6EhBBdfMCXe/LgjVoHhDdHeRE8y/jomeobOCo98knhGJK03Lhfnkm0VubQikSchmHh
 tytQEGub5rWIDSUZE9UonLL6n8ofwLgU1QdQWwcD0+z/RHdTMlZOROWy6VrKXZzwRP+g
 sNFQB/6CDwXIYrrbze/fi4gXRlpNrkoPRjxCi9SE5trpk8e07pOg1Qmgn2yaJvhS80S2
 mlbQ==
X-Gm-Message-State: AFqh2kqiaBYcs3HdVo4gkGJ7eVkKSC9ljpwY1wrJDOKHajmoEwsBAQaK
 qidWFWJcRYk7+gWzvifwyGcGXZQJv3+l3lQaKb12p7Hjrypanw==
X-Google-Smtp-Source: AMrXdXtPSADREsfUCJ3xXPZnlv7Q8cwXmq4nNdSMZUShJmr2W8sgfT+Xk+QXpXccd4BSpoRguJb2C1+aNDX/kF6UJpk=
X-Received: by 2002:a62:3004:0:b0:573:6cfc:2210 with SMTP id
 w4-20020a623004000000b005736cfc2210mr4105117pfw.55.1673034321778; Fri, 06 Jan
 2023 11:45:21 -0800 (PST)
MIME-Version: 1.0
References: <20230106154400.74211-1-paul@paul-moore.com>
In-Reply-To: <20230106154400.74211-1-paul@paul-moore.com>
From: Stanislav Fomichev <sdf@google.com>
Date: Fri, 6 Jan 2023 11:45:09 -0800
Message-ID: <CAKH8qBtyR20ZWAc11z1-6pGb3Hd47AQUTbE_cfoktG59TqaJ7Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] bpf: restore the ebpf program ID for
 BPF_AUDIT_UNLOAD and PERF_BPF_EVENT_PROG_UNLOAD
To: Paul Moore <paul@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Fri, 06 Jan 2023 19:58:25 +0000
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

On Fri, Jan 6, 2023 at 7:44 AM Paul Moore <paul@paul-moore.com> wrote:
>
> When changing the ebpf program put() routines to support being called
> from within IRQ context the program ID was reset to zero prior to
> calling the perf event and audit UNLOAD record generators, which
> resulted in problems as the ebpf program ID was bogus (always zero).
> This patch addresses this problem by removing an unnecessary call to
> bpf_prog_free_id() in __bpf_prog_offload_destroy() and adjusting
> __bpf_prog_put() to only call bpf_prog_free_id() after audit and perf
> have finished their bpf program unload tasks in
> bpf_prog_put_deferred().  For the record, no one can determine, or
> remember, why it was necessary to free the program ID, and remove it
> from the IDR, prior to executing bpf_prog_put_deferred();
> regardless, both Stanislav and Alexei agree that the approach in this
> patch should be safe.
>
> It is worth noting that when moving the bpf_prog_free_id() call, the
> do_idr_lock parameter was forced to true as the ebpf devs determined
> this was the correct as the do_idr_lock should always be true.  The
> do_idr_lock parameter will be removed in a follow-up patch, but it
> was kept here to keep the patch small in an effort to ease any stable
> backports.
>
> I also modified the bpf_audit_prog() logic used to associate the
> AUDIT_BPF record with other associated records, e.g. @ctx != NULL.
> Instead of keying off the operation, it now keys off the execution
> context, e.g. '!in_irg && !irqs_disabled()', which is much more
> appropriate and should help better connect the UNLOAD operations with
> the associated audit state (other audit records).
>
> Cc: stable@vger.kernel.org
> Fixes: d809e134be7a ("bpf: Prepare bpf_prog_put() to be called from irq context.")
> Reported-by: Burn Alting <burn.alting@iinet.net.au>
> Reported-by: Jiri Olsa <olsajiri@gmail.com>
> Suggested-by: Stanislav Fomichev <sdf@google.com>
> Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
> Signed-off-by: Paul Moore <paul@paul-moore.com>

Acked-by: Stanislav Fomichev <sdf@google.com>

Thank you! There might be a chance it breaks test_offload.py (I don't
remember whether it checks this prog-is-removed-from-id part or not),
but I don't think it's fair to ask to address it :-)
Since it doesn't trigger in CI, I'll take another look next week when
doing a respin of my 'xdp-hints' series.


> ---
> * v3
> - abandon most of the changes in v2
> - move bpf_prog_free_id() after the audit/perf unload hooks
> - remove bpf_prog_free_id() from __bpf_prog_offload_destroy()
> - added stable tag
> * v2
> - change subj
> - add mention of the perf regression
> - drop the dedicated program audit ID
> - add the bpf_prog::valid_id flag, bpf_prog_get_id() getter
> - convert prog ID users to new ID getter
> * v1
> - subj was: "bpf: restore the ebpf audit UNLOAD id field"
> - initial draft
> ---
>  kernel/bpf/offload.c | 3 ---
>  kernel/bpf/syscall.c | 6 ++----
>  2 files changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/kernel/bpf/offload.c b/kernel/bpf/offload.c
> index 13e4efc971e6..190d9f9dc987 100644
> --- a/kernel/bpf/offload.c
> +++ b/kernel/bpf/offload.c
> @@ -216,9 +216,6 @@ static void __bpf_prog_offload_destroy(struct bpf_prog *prog)
>         if (offload->dev_state)
>                 offload->offdev->ops->destroy(prog);
>
> -       /* Make sure BPF_PROG_GET_NEXT_ID can't find this dead program */
> -       bpf_prog_free_id(prog, true);
> -
>         list_del_init(&offload->offloads);
>         kfree(offload);
>         prog->aux->offload = NULL;
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 64131f88c553..61bb19e81b9c 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -1972,7 +1972,7 @@ static void bpf_audit_prog(const struct bpf_prog *prog, unsigned int op)
>                 return;
>         if (audit_enabled == AUDIT_OFF)
>                 return;
> -       if (op == BPF_AUDIT_LOAD)
> +       if (!in_irq() && !irqs_disabled())
>                 ctx = audit_context();
>         ab = audit_log_start(ctx, GFP_ATOMIC, AUDIT_BPF);
>         if (unlikely(!ab))
> @@ -2067,6 +2067,7 @@ static void bpf_prog_put_deferred(struct work_struct *work)
>         prog = aux->prog;
>         perf_event_bpf_event(prog, PERF_BPF_EVENT_PROG_UNLOAD, 0);
>         bpf_audit_prog(prog, BPF_AUDIT_UNLOAD);
> +       bpf_prog_free_id(prog, true);
>         __bpf_prog_put_noref(prog, true);
>  }
>
> @@ -2075,9 +2076,6 @@ static void __bpf_prog_put(struct bpf_prog *prog, bool do_idr_lock)
>         struct bpf_prog_aux *aux = prog->aux;
>
>         if (atomic64_dec_and_test(&aux->refcnt)) {
> -               /* bpf_prog_free_id() must be called first */
> -               bpf_prog_free_id(prog, do_idr_lock);
> -
>                 if (in_irq() || irqs_disabled()) {
>                         INIT_WORK(&aux->work, bpf_prog_put_deferred);
>                         schedule_work(&aux->work);
> --
> 2.39.0
>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

