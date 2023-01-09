Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4D7662BC8
	for <lists+linux-audit@lfdr.de>; Mon,  9 Jan 2023 17:54:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673283279;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QxhTp8vAwYLU4omUG+Ecf/SbXJz42U/a3LENnXH9Xoo=;
	b=cGJtPIt3caqyD/fb4BYIzcZ+AndfqoIHeGkszrEfyxqabfbReqmRrO2+q8dTh8BpFaSDOS
	lYe5TVwtx29UkUCCxmLcs3SKApxrraj66X37VVrPQY6EZesX1VASVru0WpJpJ+Ip42YDKw
	3WN01aQYfLB4lRxWAtSiVZGTh8c/voM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-eksc7td6Of-WIbq7wX9GqQ-1; Mon, 09 Jan 2023 11:54:37 -0500
X-MC-Unique: eksc7td6Of-WIbq7wX9GqQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BE5C80234E;
	Mon,  9 Jan 2023 16:54:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DD462026D4B;
	Mon,  9 Jan 2023 16:54:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7E8951949740;
	Mon,  9 Jan 2023 16:54:30 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 519651946587 for <linux-audit@listman.corp.redhat.com>;
 Mon,  9 Jan 2023 16:54:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 312382166B29; Mon,  9 Jan 2023 16:54:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A5972166B26
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 16:54:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03C583C10ED8
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 16:54:29 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-237-uYWC7xf0MzqK4Fg8h3aF_w-1; Mon, 09 Jan 2023 11:54:27 -0500
X-MC-Unique: uYWC7xf0MzqK4Fg8h3aF_w-1
Received: by mail-pl1-f177.google.com with SMTP id p24so10132185plw.11
 for <linux-audit@redhat.com>; Mon, 09 Jan 2023 08:54:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FLE8386xU2Fsx7zwxUJ7nfC38jAgbmgp4m04jePO7k8=;
 b=YYR31nnrqgcr+RtXSN7inKVjz95Qz/IMXgmlhR3mZF5x9vPevPmeVpmQFCFysXRkDG
 wZjLEzXwyf5aUoASJH7PjVsP/yjdyyRKKKNSNQtzNPxiAB4kbeZnbJr54rluku0xLJ1L
 OZqX938qc5lOCfX7KjArVOG3DlgIYslSFuDeF4tfAYvkKsxdaluL+VIHYPohTdP4LcpM
 fe53fXGGgI/cxGBkXN51nVcgMHZdY93j4+nHsTmryICYDcyMoQF4SkKDdV3ElNbcjwBy
 ioGV4jaR9Y/v3dOPiH+fIhx+DygYk+nQ3TKRbMXtlu+URJSl1CEtrSSskGmXLmjt6dyd
 ld6A==
X-Gm-Message-State: AFqh2kpH/LwRFIciSz41DS8U8EIG8K+rOhxnD3whUyWezuFDoVD4w2PQ
 Od4YC9GQSiqEKF83fkfAAh4/4IUAYKfBLta8iaoJlD5kwnUS
X-Google-Smtp-Source: AMrXdXtLiErnEuSCdbBsHNzFb5ezmM1LJNUPukYbCt9jGL2/BlARypfdrzQgxNL+C2kb8cKjxRIJZx2JwNkBcw6VIGs=
X-Received: by 2002:a17:902:cec8:b0:192:6675:8636 with SMTP id
 d8-20020a170902cec800b0019266758636mr3585415plg.15.1673283266261; Mon, 09 Jan
 2023 08:54:26 -0800 (PST)
MIME-Version: 1.0
References: <20230106154400.74211-1-paul@paul-moore.com>
 <CAKH8qBtyR20ZWAc11z1-6pGb3Hd47AQUTbE_cfoktG59TqaJ7Q@mail.gmail.com>
In-Reply-To: <CAKH8qBtyR20ZWAc11z1-6pGb3Hd47AQUTbE_cfoktG59TqaJ7Q@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 9 Jan 2023 11:54:22 -0500
Message-ID: <CAHC9VhTzBP49x3EH6yeqYxnr4jgcS6RdcvtbX_BSuRJnCH6ypQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] bpf: restore the ebpf program ID for
 BPF_AUDIT_UNLOAD and PERF_BPF_EVENT_PROG_UNLOAD
To: Stanislav Fomichev <sdf@google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

On Fri, Jan 6, 2023 at 2:45 PM Stanislav Fomichev <sdf@google.com> wrote:
> On Fri, Jan 6, 2023 at 7:44 AM Paul Moore <paul@paul-moore.com> wrote:
> >
> > When changing the ebpf program put() routines to support being called
> > from within IRQ context the program ID was reset to zero prior to
> > calling the perf event and audit UNLOAD record generators, which
> > resulted in problems as the ebpf program ID was bogus (always zero).
> > This patch addresses this problem by removing an unnecessary call to
> > bpf_prog_free_id() in __bpf_prog_offload_destroy() and adjusting
> > __bpf_prog_put() to only call bpf_prog_free_id() after audit and perf
> > have finished their bpf program unload tasks in
> > bpf_prog_put_deferred().  For the record, no one can determine, or
> > remember, why it was necessary to free the program ID, and remove it
> > from the IDR, prior to executing bpf_prog_put_deferred();
> > regardless, both Stanislav and Alexei agree that the approach in this
> > patch should be safe.
> >
> > It is worth noting that when moving the bpf_prog_free_id() call, the
> > do_idr_lock parameter was forced to true as the ebpf devs determined
> > this was the correct as the do_idr_lock should always be true.  The
> > do_idr_lock parameter will be removed in a follow-up patch, but it
> > was kept here to keep the patch small in an effort to ease any stable
> > backports.
> >
> > I also modified the bpf_audit_prog() logic used to associate the
> > AUDIT_BPF record with other associated records, e.g. @ctx != NULL.
> > Instead of keying off the operation, it now keys off the execution
> > context, e.g. '!in_irg && !irqs_disabled()', which is much more
> > appropriate and should help better connect the UNLOAD operations with
> > the associated audit state (other audit records).
> >
> > Cc: stable@vger.kernel.org
> > Fixes: d809e134be7a ("bpf: Prepare bpf_prog_put() to be called from irq context.")
> > Reported-by: Burn Alting <burn.alting@iinet.net.au>
> > Reported-by: Jiri Olsa <olsajiri@gmail.com>
> > Suggested-by: Stanislav Fomichev <sdf@google.com>
> > Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
> > Signed-off-by: Paul Moore <paul@paul-moore.com>
>
> Acked-by: Stanislav Fomichev <sdf@google.com>
>
> Thank you! There might be a chance it breaks test_offload.py (I don't
> remember whether it checks this prog-is-removed-from-id part or not),
> but I don't think it's fair to ask to address it :-)
> Since it doesn't trigger in CI, I'll take another look next week when
> doing a respin of my 'xdp-hints' series.

No problem, I'm glad we found a solution that works for everyone; and
thank you for chasing down any test changes that may be necessary.

I'd like to get this patch into Linus' tree sooner rather than later
as it fixes a kinda ugly problem, would you be okay if this went in
via the bpf tree?  With the appropriate ACKs I could send it to Linus
via the audit tree, but I think it would be much better to send it via
the bpf/netdev tree.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

