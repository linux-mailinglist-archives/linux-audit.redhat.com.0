Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B476641F3
	for <lists+linux-audit@lfdr.de>; Tue, 10 Jan 2023 14:34:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673357649;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ub2pN19xKUgSNoC9/z3W+IqFdHrzTWzcIqF49HYwI6s=;
	b=h/qu2ngPiYBjdsdsfpqx3w/Sgx94HKmCIDnMWPkdRE41zXu7mOr9mYydQEZRh4Yz+snGTU
	7/7EpbkkQEuSqArBpXDGAjUaDbglLAIJ6XtDMczYPZ2oLDFgPirWgHcd7/e7NI9QtrY0yR
	2QtpDCRlBnR3Z8llkyFrik8TDApozbc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609--H7aSMdbO9O6QhQusw80lA-1; Tue, 10 Jan 2023 08:34:05 -0500
X-MC-Unique: -H7aSMdbO9O6QhQusw80lA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEB2F185A78B;
	Tue, 10 Jan 2023 13:34:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C9F89407D467;
	Tue, 10 Jan 2023 13:33:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 84D34194E114;
	Tue, 10 Jan 2023 13:33:55 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 654DC1946587 for <linux-audit@listman.corp.redhat.com>;
 Tue, 10 Jan 2023 09:10:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4385E1121319; Tue, 10 Jan 2023 09:10:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BBD71121314
 for <linux-audit@redhat.com>; Tue, 10 Jan 2023 09:10:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BD3E811E6E
 for <linux-audit@redhat.com>; Tue, 10 Jan 2023 09:10:12 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-503-785pH3mqMUa_zTo-O0q7wQ-1; Tue, 10 Jan 2023 04:10:10 -0500
X-MC-Unique: 785pH3mqMUa_zTo-O0q7wQ-1
Received: by mail-wr1-f51.google.com with SMTP id d17so11002101wrs.2
 for <linux-audit@redhat.com>; Tue, 10 Jan 2023 01:10:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=swwl8Slc0bB5LKo8Orryz2UbttInvRzy6nPaGPvgpbc=;
 b=r5JViYFwwIbltM00xlcEUxCSs1U7I99LzrIX+hr0rpPdRHvbTBMyhX6z1PE9h80S0Z
 0yJoB8efAM81rEbgIyry3NlFxoIL65MASY0N/NozoRw5BOeVkG5F83AQsoU3FGdiPpr1
 wE6Sefh7Dgw4NZPa5C9xDkEd3tlp//IvvSEMjc/1f7oddjmrjcy7zttp13coxg/tQIlX
 m6mbZBvV6AaqTet59A0euYMnTEIGzgqaCMJZMp65bD6iAT2D2X2Oe0Yo8lfDneT1i6B8
 XCMl1deR5A71lLEpN6ZP+DcaXBnAPKKT+KSK2uo5EiB5muQOsYH2epCXQt+LiCsqMD18
 b3KQ==
X-Gm-Message-State: AFqh2kqW4tBqby0cyrRjdeA5a+mJTGF6G5EWzlhnnpNQYp8/zznwjkgz
 gBY+U+3Y/KXKqJ3ePzHhyMA=
X-Google-Smtp-Source: AMrXdXtrat1GdpWAr9X2ER6GGmC82sAMEWC7dSvO/4so47QyZ+5vUS0efS4jBHozdJxcJUH87ySeRg==
X-Received: by 2002:a05:6000:706:b0:2a2:e960:de33 with SMTP id
 bs6-20020a056000070600b002a2e960de33mr15261831wrb.45.1673341809054; 
 Tue, 10 Jan 2023 01:10:09 -0800 (PST)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a5d4882000000b00286ad197346sm10707430wrq.70.2023.01.10.01.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 01:10:08 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 10 Jan 2023 10:10:06 +0100
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v3 1/2] bpf: restore the ebpf program ID for
 BPF_AUDIT_UNLOAD and PERF_BPF_EVENT_PROG_UNLOAD
Message-ID: <Y70rbnusftLg1ymg@krava>
References: <20230106154400.74211-1-paul@paul-moore.com>
MIME-Version: 1.0
In-Reply-To: <20230106154400.74211-1-paul@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Tue, 10 Jan 2023 13:33:54 +0000
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
 Burn Alting <burn.alting@iinet.net.au>, Stanislav Fomichev <sdf@google.com>,
 Alexei Starovoitov <ast@kernel.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 06, 2023 at 10:43:59AM -0500, Paul Moore wrote:
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
> 
> ---
> * v3
> - abandon most of the changes in v2
> - move bpf_prog_free_id() after the audit/perf unload hooks
> - remove bpf_prog_free_id() from __bpf_prog_offload_destroy()
> - added stable tag

fwiw I checked and the perf UNLOAD events have proper id now
thanks for fixing this

jirka


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
>  	if (offload->dev_state)
>  		offload->offdev->ops->destroy(prog);
>  
> -	/* Make sure BPF_PROG_GET_NEXT_ID can't find this dead program */
> -	bpf_prog_free_id(prog, true);
> -
>  	list_del_init(&offload->offloads);
>  	kfree(offload);
>  	prog->aux->offload = NULL;
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 64131f88c553..61bb19e81b9c 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -1972,7 +1972,7 @@ static void bpf_audit_prog(const struct bpf_prog *prog, unsigned int op)
>  		return;
>  	if (audit_enabled == AUDIT_OFF)
>  		return;
> -	if (op == BPF_AUDIT_LOAD)
> +	if (!in_irq() && !irqs_disabled())
>  		ctx = audit_context();
>  	ab = audit_log_start(ctx, GFP_ATOMIC, AUDIT_BPF);
>  	if (unlikely(!ab))
> @@ -2067,6 +2067,7 @@ static void bpf_prog_put_deferred(struct work_struct *work)
>  	prog = aux->prog;
>  	perf_event_bpf_event(prog, PERF_BPF_EVENT_PROG_UNLOAD, 0);
>  	bpf_audit_prog(prog, BPF_AUDIT_UNLOAD);
> +	bpf_prog_free_id(prog, true);
>  	__bpf_prog_put_noref(prog, true);
>  }
>  
> @@ -2075,9 +2076,6 @@ static void __bpf_prog_put(struct bpf_prog *prog, bool do_idr_lock)
>  	struct bpf_prog_aux *aux = prog->aux;
>  
>  	if (atomic64_dec_and_test(&aux->refcnt)) {
> -		/* bpf_prog_free_id() must be called first */
> -		bpf_prog_free_id(prog, do_idr_lock);
> -
>  		if (in_irq() || irqs_disabled()) {
>  			INIT_WORK(&aux->work, bpf_prog_put_deferred);
>  			schedule_work(&aux->work);
> -- 
> 2.39.0
> 

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

